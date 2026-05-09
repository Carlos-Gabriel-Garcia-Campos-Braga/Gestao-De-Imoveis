using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace GestaoImoveisAPI.Application.Reports
{
    public class PdfReportDocument : IDocument
    {
        private readonly AnnualReportData _data;

        public PdfReportDocument(AnnualReportData data) => _data = data;

        public DocumentMetadata GetMetadata() => DocumentMetadata.Default;
        public DocumentSettings GetSettings() => DocumentSettings.Default;

        public void Compose(IDocumentContainer container)
        {
            container.Page(page =>
            {
                page.Size(PageSizes.A4.Landscape());
                page.Margin(1.5f, Unit.Centimetre);
                page.DefaultTextStyle(x => x.FontSize(9));

                page.Header().Element(ComposeHeader);
                page.Content().Element(ComposeContent);
                page.Footer().AlignCenter().Text(text =>
                {
                    text.CurrentPageNumber();
                    text.Span(" / ");
                    text.TotalPages();
                });
            });
        }

        private void ComposeHeader(IContainer container)
        {
            container.Column(col =>
            {
                col.Item()
                    .Text($"Relatório de Receitas — {_data.Year}")
                    .FontSize(18).Bold().FontColor(Colors.Blue.Darken3);

                col.Item()
                    .Text($"Gerado em: {DateTime.Now:dd/MM/yyyy HH:mm}")
                    .FontSize(8).FontColor(Colors.Grey.Darken1);

                col.Item().PaddingTop(4).LineHorizontal(1).LineColor(Colors.Blue.Darken3);
                col.Item().Height(8);
            });
        }

        private void ComposeContent(IContainer container)
        {
            container.Column(col =>
            {
                col.Item().Row(row =>
                {
                    row.RelativeItem().Element(c =>
                        SummaryCard(c, "Total Faturado", _data.TotalDue, Colors.Blue.Lighten4));
                    row.ConstantItem(10);
                    row.RelativeItem().Element(c =>
                        SummaryCard(c, "Total Recebido", _data.TotalPaid, Colors.Green.Lighten4));
                    row.ConstantItem(10);
                    row.RelativeItem().Element(c =>
                        SummaryCard(c, "A Receber", _data.TotalPending, Colors.Orange.Lighten4));
                });

                col.Item().Height(16);

                if (_data.Rows.Count == 0)
                {
                    col.Item().AlignCenter()
                        .Text("Nenhuma cobrança encontrada para este ano.")
                        .FontColor(Colors.Grey.Darken1);
                    return;
                }

                col.Item().Table(table =>
                {
                    table.ColumnsDefinition(cols =>
                    {
                        cols.RelativeColumn(3);  // Endereço
                        cols.RelativeColumn(2);  // Inquilino
                        cols.RelativeColumn(1);  // CPF
                        cols.RelativeColumn(1);  // Vencimento
                        cols.RelativeColumn(2);  // Descrição
                        cols.RelativeColumn(1);  // Valor
                        cols.RelativeColumn(1);  // Pago
                        cols.RelativeColumn(1);  // Status
                    });

                    table.Header(header =>
                    {
                        string[] titles = ["Endereço", "Inquilino", "CPF", "Vencimento", "Descrição", "Valor (R$)", "Pago (R$)", "Status"];
                        foreach (var title in titles)
                        {
                            header.Cell()
                                .Background(Colors.Blue.Darken3)
                                .Padding(5)
                                .Text(title)
                                .Bold()
                                .FontSize(8)
                                .FontColor(Colors.White);
                        }
                    });

                    var alternate = false;
                    foreach (var r in _data.Rows)
                    {
                        var bg = alternate ? Colors.Grey.Lighten4 : Colors.White;
                        alternate = !alternate;

                        table.Cell().Background(bg).Padding(4).Text(r.ContractAddress).FontSize(8);
                        table.Cell().Background(bg).Padding(4).Text(r.RenterName).FontSize(8);
                        table.Cell().Background(bg).Padding(4).Text(r.RenterCPF).FontSize(8);
                        table.Cell().Background(bg).Padding(4).Text(r.DueDate.ToString("dd/MM/yyyy")).FontSize(8);
                        table.Cell().Background(bg).Padding(4).Text(r.Description).FontSize(8);
                        table.Cell().Background(bg).Padding(4).AlignRight().Text($"{r.AmountDue:N2}").FontSize(8);
                        table.Cell().Background(bg).Padding(4).AlignRight().Text($"{r.AmountPaid:N2}").FontSize(8);

                        var statusColor = r.Status switch
                        {
                            "Pago" => Colors.Green.Darken2,
                            "Atrasado" => Colors.Red.Darken2,
                            "Cancelado" => Colors.Grey.Darken2,
                            _ => Colors.Orange.Darken2
                        };
                        table.Cell().Background(bg).Padding(4)
                            .Text(r.Status).FontSize(8).FontColor(statusColor);
                    }
                });
            });
        }

        private static void SummaryCard(IContainer container, string label, decimal value, string bgColor)
        {
            container.Background(bgColor).Padding(12).Column(col =>
            {
                col.Item().Text(label).FontSize(8).FontColor(Colors.Grey.Darken2);
                col.Item().Text($"R$ {value:N2}").FontSize(14).Bold();
            });
        }
    }
}
