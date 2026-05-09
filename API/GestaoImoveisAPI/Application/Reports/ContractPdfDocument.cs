using GestaoImoveisAPI.Domain.Leasing;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace GestaoImoveisAPI.Application.Reports
{
    public class ContractPdfDocument : IDocument
    {
        private readonly RentalContract _contract;

        public ContractPdfDocument(RentalContract contract) => _contract = contract;

        public DocumentMetadata GetMetadata() => DocumentMetadata.Default;
        public DocumentSettings GetSettings() => DocumentSettings.Default;

        public void Compose(IDocumentContainer container)
        {
            container.Page(page =>
            {
                page.Size(PageSizes.A4);
                page.Margin(2.5f, Unit.Centimetre);
                page.DefaultTextStyle(x => x.FontSize(10).FontFamily("Arial"));

                page.Header().Element(ComposeHeader);
                page.Content().Element(ComposeContent);
                page.Footer().Element(ComposeFooter);
            });
        }

        private void ComposeHeader(IContainer container)
        {
            container.Column(col =>
            {
                col.Item().AlignCenter()
                    .Text("CONTRATO DE LOCAÇÃO DE IMÓVEL")
                    .FontSize(16).Bold().FontColor(Colors.Blue.Darken3);

                col.Item().AlignCenter()
                    .Text($"Contrato nº {_contract.Id:D6}")
                    .FontSize(11).FontColor(Colors.Grey.Darken1);

                col.Item().PaddingTop(8).LineHorizontal(2).LineColor(Colors.Blue.Darken3);
                col.Item().Height(12);
            });
        }

        private void ComposeContent(IContainer container)
        {
            container.Column(col =>
            {
                // Partes
                col.Item().Element(c => SectionTitle(c, "1. PARTES"));
                col.Item().Height(6);

                col.Item().Element(c => FieldRow(c, "LOCATÁRIO", _contract.Renter?.Name ?? "—"));
                col.Item().Height(4);
                col.Item().Element(c => FieldRow(c, "CPF", FormatCpf(_contract.Renter?.CPF?.Value)));
                col.Item().Height(4);
                col.Item().Element(c => FieldRow(c, "TELEFONE", _contract.Renter?.PhoneNumber?.Value ?? "—"));

                col.Item().Height(16);

                // Imóvel
                col.Item().Element(c => SectionTitle(c, "2. IMÓVEL LOCADO"));
                col.Item().Height(6);

                var a = _contract.Adress;
                var street = $"{a.Street ?? "—"}, {a.Number ?? "S/N"}";
                if (!string.IsNullOrWhiteSpace(a.Complement))
                    street += $" — {a.Complement}";

                col.Item().Element(c => FieldRow(c, "ENDEREÇO", street));
                col.Item().Height(4);
                col.Item().Element(c => FieldRow(c, "BAIRRO", a.Neighborhood ?? "—"));
                col.Item().Height(4);
                col.Item().Element(c => FieldRow(c, "CIDADE / ESTADO", $"{a.City ?? "—"} / {a.State ?? "—"}"));
                col.Item().Height(4);
                col.Item().Element(c => FieldRow(c, "CEP", FormatZip(a.ZipCode)));

                col.Item().Height(16);

                // Vigência e valores
                col.Item().Element(c => SectionTitle(c, "3. VIGÊNCIA E VALORES"));
                col.Item().Height(6);

                col.Item().Row(row =>
                {
                    row.RelativeItem().Element(c => FieldBlock(c, "INÍCIO DA VIGÊNCIA", _contract.StartContract.ToString("dd/MM/yyyy")));
                    row.ConstantItem(20);
                    row.RelativeItem().Element(c => FieldBlock(c, "TÉRMINO DA VIGÊNCIA", _contract.EndContract.ToString("dd/MM/yyyy")));
                    row.ConstantItem(20);
                    row.RelativeItem().Element(c => FieldBlock(c, "DURAÇÃO", ContractDuration()));
                });

                col.Item().Height(10);

                col.Item().Row(row =>
                {
                    row.RelativeItem().Element(c => FieldBlock(c, "ALUGUEL MENSAL", $"R$ {_contract.RentalValue.Amount:N2}"));
                    row.ConstantItem(20);
                    row.RelativeItem().Element(c => FieldBlock(c, "ÍNDICE DE REAJUSTE", _contract.PreferredIndex.ToString()));
                    row.ConstantItem(20);
                    row.RelativeItem().Element(c => FieldBlock(c, "REAJUSTE ANUAL", "Na data de aniversário do contrato"));
                });

                // Encargos
                if (_contract.Bills.Count > 0)
                {
                    col.Item().Height(16);
                    col.Item().Element(c => SectionTitle(c, "4. ENCARGOS INCLUÍDOS"));
                    col.Item().Height(6);

                    col.Item().Table(table =>
                    {
                        table.ColumnsDefinition(cols =>
                        {
                            cols.RelativeColumn(3);
                            cols.RelativeColumn(2);
                            cols.RelativeColumn(1);
                        });

                        table.Header(header =>
                        {
                            foreach (var title in new[] { "Tipo", "Vencimento", "Valor (R$)" })
                            {
                                header.Cell().Background(Colors.Blue.Darken3).Padding(5)
                                    .Text(title).Bold().FontSize(9).FontColor(Colors.White);
                            }
                        });

                        var alt = false;
                        foreach (var b in _contract.Bills)
                        {
                            var bg = alt ? Colors.Grey.Lighten4 : Colors.White;
                            alt = !alt;
                            table.Cell().Background(bg).Padding(4).Text(b.Type).FontSize(9);
                            table.Cell().Background(bg).Padding(4).Text(b.ValidationDate.ToString("dd/MM/yyyy")).FontSize(9);
                            table.Cell().Background(bg).Padding(4).AlignRight().Text($"{b.Value.Amount:N2}").FontSize(9);
                        }
                    });
                }

                // Histórico de reajustes
                if (_contract.ReadjustmentHistory.Count > 0)
                {
                    col.Item().Height(16);
                    col.Item().Element(c => SectionTitle(c, "5. HISTÓRICO DE REAJUSTES"));
                    col.Item().Height(6);

                    col.Item().Table(table =>
                    {
                        table.ColumnsDefinition(cols =>
                        {
                            cols.RelativeColumn(1);
                            cols.RelativeColumn(1);
                            cols.RelativeColumn(1);
                            cols.RelativeColumn(1);
                            cols.RelativeColumn(1);
                        });

                        table.Header(header =>
                        {
                            foreach (var title in new[] { "Data", "Índice", "Taxa (%)", "Valor Anterior", "Novo Valor" })
                            {
                                header.Cell().Background(Colors.Blue.Darken3).Padding(5)
                                    .Text(title).Bold().FontSize(9).FontColor(Colors.White);
                            }
                        });

                        var alt = false;
                        foreach (var r in _contract.ReadjustmentHistory.OrderBy(r => r.AppliedAt))
                        {
                            var bg = alt ? Colors.Grey.Lighten4 : Colors.White;
                            alt = !alt;
                            table.Cell().Background(bg).Padding(4).Text(r.AppliedAt.ToString("dd/MM/yyyy")).FontSize(9);
                            table.Cell().Background(bg).Padding(4).Text(r.Index.ToString()).FontSize(9);
                            table.Cell().Background(bg).Padding(4).AlignRight().Text($"{r.Rate:N2}%").FontSize(9);
                            table.Cell().Background(bg).Padding(4).AlignRight().Text($"R$ {r.OldValue:N2}").FontSize(9);
                            table.Cell().Background(bg).Padding(4).AlignRight().Text($"R$ {r.NewValue:N2}").FontSize(9);
                        }
                    });
                }

                // Status / rescisão
                if (_contract.IsTerminated)
                {
                    col.Item().Height(16);
                    col.Item().Element(c => SectionTitle(c, "6. RESCISÃO"));
                    col.Item().Height(6);

                    col.Item().Background(Colors.Red.Lighten4).Padding(10).Column(inner =>
                    {
                        inner.Item().Element(c => FieldRow(c, "DATA DA RESCISÃO", _contract.TerminatedAt!.Value.ToString("dd/MM/yyyy")));
                        inner.Item().Height(4);
                        inner.Item().Element(c => FieldRow(c, "RESCISÃO SOLICITADA POR", _contract.TerminatedBy ?? "—"));
                    });
                }

                // Assinatura
                col.Item().Height(40);
                col.Item().LineHorizontal(0.5f).LineColor(Colors.Grey.Lighten1);
                col.Item().Height(16);

                col.Item().Row(row =>
                {
                    row.RelativeItem().AlignCenter().Column(inner =>
                    {
                        inner.Item().LineHorizontal(1).LineColor(Colors.Grey.Darken1);
                        inner.Item().Height(4);
                        inner.Item().AlignCenter().Text("Locador").FontSize(9).FontColor(Colors.Grey.Darken1);
                    });
                    row.ConstantItem(60);
                    row.RelativeItem().AlignCenter().Column(inner =>
                    {
                        inner.Item().LineHorizontal(1).LineColor(Colors.Grey.Darken1);
                        inner.Item().Height(4);
                        inner.Item().AlignCenter()
                            .Text(_contract.Renter?.Name ?? "Locatário")
                            .FontSize(9).FontColor(Colors.Grey.Darken1);
                    });
                });
            });
        }

        private void ComposeFooter(IContainer container)
        {
            container.Column(col =>
            {
                col.Item().LineHorizontal(0.5f).LineColor(Colors.Grey.Lighten1);
                col.Item().Height(4);
                col.Item().Row(row =>
                {
                    row.RelativeItem()
                        .Text($"Gerado em {DateTime.Now:dd/MM/yyyy HH:mm} · Gestão de Imóveis")
                        .FontSize(7).FontColor(Colors.Grey.Darken1);

                    row.RelativeItem().AlignRight().Text(text =>
                    {
                        text.Span("Página ").FontSize(7).FontColor(Colors.Grey.Darken1);
                        text.CurrentPageNumber().FontSize(7).FontColor(Colors.Grey.Darken1);
                        text.Span(" / ").FontSize(7).FontColor(Colors.Grey.Darken1);
                        text.TotalPages().FontSize(7).FontColor(Colors.Grey.Darken1);
                    });
                });
            });
        }

        // ── Helpers ─────────────────────────────────────────────────────────────

        private static void SectionTitle(IContainer c, string title)
        {
            c.BorderBottom(1).BorderColor(Colors.Blue.Darken2).PaddingBottom(4)
                .Text(title).Bold().FontSize(11).FontColor(Colors.Blue.Darken3);
        }

        private static void FieldRow(IContainer c, string label, string value)
        {
            c.Row(row =>
            {
                row.ConstantItem(130)
                    .Text(label + ":")
                    .FontSize(9).Bold().FontColor(Colors.Grey.Darken2);
                row.RelativeItem()
                    .Text(value)
                    .FontSize(10);
            });
        }

        private static void FieldBlock(IContainer c, string label, string value)
        {
            c.Background(Colors.Grey.Lighten4).Padding(10).Column(col =>
            {
                col.Item().Text(label).FontSize(8).Bold().FontColor(Colors.Grey.Darken2);
                col.Item().Height(2);
                col.Item().Text(value).FontSize(11).Bold();
            });
        }

        private string ContractDuration()
        {
            var months = (((_contract.EndContract.Year - _contract.StartContract.Year) * 12)
                + _contract.EndContract.Month - _contract.StartContract.Month);
            return months == 12 ? "12 meses (1 ano)"
                : months > 12 ? $"{months} meses ({months / 12} ano{(months / 12 > 1 ? "s" : "")})"
                : $"{months} meses";
        }

        private static string FormatCpf(string? digits)
        {
            if (digits is null || digits.Length != 11) return digits ?? "—";
            return $"{digits[..3]}.{digits[3..6]}.{digits[6..9]}-{digits[9..]}";
        }

        private static string FormatZip(string? digits)
        {
            if (digits is null || digits.Length != 8) return digits ?? "—";
            return $"{digits[..5]}-{digits[5..]}";
        }
    }
}
