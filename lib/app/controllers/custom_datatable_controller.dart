import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDatatableController extends GetxController {
  var data = <Map<String, dynamic>>[].obs;

  void loadData() async {
    // Fetch data from API or other source
    // and populate data list
    data.assignAll([
      {'id': 1, 'name': 'John', 'age': 30},
      {'id': 2, 'name': 'Jane', 'age': 25},
      {'id': 3, 'name': 'Bob', 'age': 40},
      {'id': 4, 'name': 'Alice', 'age': 35},
    ]);
  }

  void sort(String field, bool ascending) {
    // Sort data list by given field and direction
    data.sort((a, b) {
      if (a[field] == b[field]) return 0;
      return (a[field] < b[field]) == ascending ? -1 : 1;
    });
  }
}

class CustomDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> data;

  CustomDataTableSource(this.data);

  @override
  DataRow getRow(int index) {
    final row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: row.keys.map<DataCell>((String key) {
        return DataCell(
          Text('${row[key]}'),
        );
      }).toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
