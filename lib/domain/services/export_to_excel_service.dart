import 'dart:typed_data';
import 'dart:html' as html;
import 'package:excel/excel.dart';

Future<void> exportToExcel(
    Map<String, List<List<dynamic>>> data, String fileName) async {
  Excel excel = createExcel();

  data.forEach((sheetName, sheetData) {
    Sheet sheetObject = excel[sheetName];
    populateExcelWithData(sheetObject, sheetData);
});

  List<int> bytes = excel.save()!;

  Uint8List uint8list = Uint8List.fromList(bytes);
  // html.Blob blob = html.Blob([uint8list]);
  // final url = html.Url.createObjectUrlFromBlob(blob);
  // downloadFile(url, fileName);
  // html.Url.revokeObjectUrl(url);
}

Excel createExcel() {
  return Excel.createExcel();
}

void populateExcelWithData(Sheet sheet, List<List<dynamic>> data) {
  for (int row = 0; row < data.length; row++) {
    for (int col = 0; col < data[row].length; col++) {
      sheet
          .cell(CellIndex.indexByColumnRow(rowIndex: row, columnIndex: col))
          .value = "${data[row][col]}";
    }
  }
}

void downloadFile(String url, String fileName) {
  html.AnchorElement(href: url)
    ..setAttribute("download", fileName)
    ..click();
}
