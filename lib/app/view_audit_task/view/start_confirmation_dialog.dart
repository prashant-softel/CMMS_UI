import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStartAuditDialog extends GetView {
  int id;
  String title;
  int? ptw_id;
  int? starttype;
  CustomStartAuditDialog(
      {required this.id, required this.title, this.starttype, this.ptw_id});

  final ViewAuditTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.start, size: 35, color: ColorValues.startColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: starttype == 1
                    ? 'Are you sure you want to start the task for '
                    : 'Are you sure you want to start the sub-task for ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      color: ColorValues.appDarkBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  controller.startAuditTask(id);
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      );
    }));
  }
}
