import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_audit_task/view_audit_task_controller.dart';

class AuditTaskViewMsgReceiveDialog extends GetView {
  String? data;
  int type;
  List<dynamic>? id;

  AuditTaskViewMsgReceiveDialog(
      {super.key, this.data, this.id, required this.type});
  final ViewAuditTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          type == 1
              ? "Approve Plan"
              : type == 2
                  ? 'Reject Plan'
                  : type == 3
                      ? "Skip Plan"
                      : type == 4
                          ? "Close Plan"
                          : type == 5
                              ? "Approve Close Plan"
                              : type == 6
                                  ? "Reject Close Plan"
                                  : type == 8
                                      ? "Plan Start"
                                      : type == 10
                                          ? "Task Assigned"
                                          : "Execute Plan",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 80,
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Divider(
                color: ColorValues.greyLightColour,
                thickness: 1,
              ),
              Text('${data}',
                  style: TextStyle(color: Colors.green),
                  textAlign: TextAlign.center),
              Text('${id}',
                  style: TextStyle(color: Colors.green),
                  textAlign: TextAlign.center),
            ]),
          );
        }),
        actions: [
          Center(
            child: Row(
              children: [
                Spacer(),
                Center(
                  child: ElevatedButton(
                    style: Styles.darkBlueElevatedButtonStyle,
                    onPressed: () {
                      Get.offAllNamed(Routes.auditTask);
                    },
                    child: const Text('Task List'),
                  ),
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    style: Styles.yellowElevatedButtonStyle,
                    onPressed: () async {
                      await controller.setauditTaskId();
                      controller.getHistory();

                      if (controller.auditTaskId != 0) {
                        print({"fghvjbggjhjgk", controller.auditTaskId});

                        await controller.getAuditTaskDetails(
                            auditTaskId: controller.auditTaskId.value,
                            isloading: true);
                      }
                      Get.back();
                    },
                    child: const Text('View Task'),
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      );
    }));
  }
}
