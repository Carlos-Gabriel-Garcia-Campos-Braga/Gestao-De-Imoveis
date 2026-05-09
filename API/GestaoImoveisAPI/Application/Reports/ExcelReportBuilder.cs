using ClosedXML.Excel;

namespace GestaoImoveisAPI.Application.Reports
{
    public static class ExcelReportBuilder
    {
        public static byte[] Build(AnnualReportData data)
        {
            using var wb = new XLWorkbook();
            var ws = wb.Worksheets.Add($"Receitas {data.Year}");

            ws.Cell(1, 1).Value = $"Relatório de Receitas — {data.Year}";
            ws.Range(1, 1, 1, 8).Merge();
            ws.Cell(1, 1).Style.Font.Bold = true;
            ws.Cell(1, 1).Style.Font.FontSize = 16;

            ws.Cell(2, 1).Value = $"Gerado em: {DateTime.Now:dd/MM/yyyy HH:mm}";
            ws.Range(2, 1, 2, 8).Merge();
            ws.Cell(2, 1).Style.Font.FontColor = XLColor.Gray;

            // Summary
            ws.Cell(4, 1).Value = "Total Faturado";
            ws.Cell(4, 2).Value = data.TotalDue;
            ws.Cell(4, 2).Style.NumberFormat.Format = "R$ #,##0.00";
            ws.Cell(4, 1).Style.Font.Bold = true;

            ws.Cell(5, 1).Value = "Total Recebido";
            ws.Cell(5, 2).Value = data.TotalPaid;
            ws.Cell(5, 2).Style.NumberFormat.Format = "R$ #,##0.00";
            ws.Cell(5, 1).Style.Font.Bold = true;

            ws.Cell(6, 1).Value = "A Receber";
            ws.Cell(6, 2).Value = data.TotalPending;
            ws.Cell(6, 2).Style.NumberFormat.Format = "R$ #,##0.00";
            ws.Cell(6, 1).Style.Font.Bold = true;

            // Table header
            const int headerRow = 8;
            string[] headers = ["Endereço", "Inquilino", "CPF", "Vencimento", "Descrição", "Valor (R$)", "Pago (R$)", "Status"];
            for (int i = 0; i < headers.Length; i++)
            {
                var cell = ws.Cell(headerRow, i + 1);
                cell.Value = headers[i];
                cell.Style.Font.Bold = true;
                cell.Style.Fill.BackgroundColor = XLColor.FromArgb(0x1A, 0x56, 0x9E);
                cell.Style.Font.FontColor = XLColor.White;
                cell.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
            }

            // Data rows
            int dataRow = headerRow + 1;
            bool alternate = false;

            foreach (var row in data.Rows)
            {
                ws.Cell(dataRow, 1).Value = row.ContractAddress;
                ws.Cell(dataRow, 2).Value = row.RenterName;
                ws.Cell(dataRow, 3).Value = row.RenterCPF;

                var dateCell = ws.Cell(dataRow, 4);
                dateCell.Value = row.DueDate.ToDateTime(TimeOnly.MinValue);
                dateCell.Style.NumberFormat.Format = "dd/MM/yyyy";

                ws.Cell(dataRow, 5).Value = row.Description;
                ws.Cell(dataRow, 6).Value = row.AmountDue;
                ws.Cell(dataRow, 6).Style.NumberFormat.Format = "R$ #,##0.00";
                ws.Cell(dataRow, 7).Value = row.AmountPaid;
                ws.Cell(dataRow, 7).Style.NumberFormat.Format = "R$ #,##0.00";
                ws.Cell(dataRow, 8).Value = row.Status;

                var statusColor = row.Status switch
                {
                    "Pago" => XLColor.FromArgb(0x15, 0x80, 0x3D),
                    "Atrasado" => XLColor.FromArgb(0xB9, 0x1C, 0x1C),
                    "Cancelado" => XLColor.FromArgb(0x6B, 0x72, 0x80),
                    _ => XLColor.FromArgb(0xD9, 0x77, 0x06)
                };
                ws.Cell(dataRow, 8).Style.Font.FontColor = statusColor;
                ws.Cell(dataRow, 8).Style.Font.Bold = true;

                if (alternate)
                {
                    ws.Range(dataRow, 1, dataRow, 8).Style.Fill.BackgroundColor =
                        XLColor.FromArgb(0xF2, 0xF2, 0xF2);
                }

                alternate = !alternate;
                dataRow++;
            }

            ws.Columns().AdjustToContents();

            using var ms = new MemoryStream();
            wb.SaveAs(ms);
            return ms.ToArray();
        }
    }
}
