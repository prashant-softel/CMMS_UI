import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

///
class HistoryTableWidget extends StatelessWidget {
  HistoryTableWidget({super.key});
  var data = [];

  ///
  @override
  Widget build(BuildContext context) {
    return
        //
        SingleChildScrollView(
      child: DataTable2(
        columns: [
          DataColumn(label: Text('Time Stamp')),
          DataColumn(label: Text('Posted By')),
          DataColumn(label: Text('Comments')),
          DataColumn(label: Text('Status')),
        ],
        rows: List<DataRow>.generate(
          data.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(data[index]['Time Stamp'])),
              DataCell(Text(data[index]['Posted By'])),
              DataCell(Text(data[index]['Comments'])),
              DataCell(Text(data[index]['Status'])),
            ],
          ),
        ),
      ),
    );
  }
}
