import 'package:cmms/app/controllers/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/history_model.dart';

///
class HistoryTableWidgetMobile extends GetView<HistoryController> {
  HistoryTableWidgetMobile({super.key, required this.historyList});

  ///
  final List<HistoryModel?>? historyList;

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return ListView.builder(
      itemCount: historyList?.length ?? 0,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(controller.formatDate(historyList?[index]?.createdAt)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Posted by: ' +
                    (historyList?[index]?.createdByName.toString() ?? '')),
                Text('Comments: ' +
                    (historyList?[index]?.comment.toString() ?? '')),
                Text('Status: ' +
                    (historyList?[index]?.status.toString() ?? '')),
              ],
            ),
          ),
        );
      },
    );
  }

  ///
}
