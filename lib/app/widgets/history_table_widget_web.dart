import 'package:cmms/app/utils/responsive.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/models/history_model.dart';

///
class HistoryTableWidgetWeb extends StatelessWidget {
  HistoryTableWidgetWeb({super.key, required this.historyList});

  final List<HistoryModel?>? historyList;

  ///
  @override
  Widget build(BuildContext context) {
    return
        //
        DataTable2(
      headingRowHeight: Get.height * 0.06,
      border: TableBorder.all(color: Color.fromARGB(255, 206, 229, 234)),
      dataRowHeight: Get.height * 0.06,
      horizontalMargin: 12,
      columns: [
        Responsive.isDesktop(context)
            ? DataColumn(
                label: Text(
                'Time Stamp',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ))
            : DataColumn(
                label: Text(
                'Time\nStamp',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )),
        Responsive.isDesktop(context)
            ? DataColumn(
                label: Text(
                'Posted By',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ))
            : DataColumn(
                label: Text(
                'Post\nBy',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )),
        Responsive.isDesktop(context)
            ? DataColumn(
                label: Text(
                'Comments',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ))
            : DataColumn(
                label: Text(
                'Com-\nments',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )),
        Responsive.isDesktop(context)
            ? DataColumn(
                label: Text(
                'Status',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ))
            : DataColumn(
                label: Text(
                'Status',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )),
      ],
      rows: List<DataRow>.generate(
        historyList?.length ?? 0,
        (index) => DataRow(cells: [
          DataCell(
              Text(
              historyList?[index]?.createdAt?.result != null
                  ? DateFormat('yyyy-MM-dd HH:mm')
                      .format(historyList![index]!.createdAt!.result!)
                  : '',
            )
          ),
          DataCell(Text(historyList?[index]?.createdByName.toString() ?? '')),
          DataCell(Text(historyList?[index]?.comment.toString() ?? '')),
          DataCell(Text(historyList?[index]?.status_name.toString() ?? '')),
        ]),
      ),
    );
  }

  ///
}
