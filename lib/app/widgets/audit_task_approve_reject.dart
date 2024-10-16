import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class AuditTaskApprovedRejectDialog extends GetView {
  int? type;
  int? moduletype;
  int? id;

  AuditTaskApprovedRejectDialog(
      {super.key, this.type, this.moduletype, this.id});
  final ViewAuditTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: StatefulBuilder(builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Text(
            type == 1
                ? "Skip Plan Approve"
                : type == 2
                    ? 'Skip Plan Reject'
                    : type == 3
                        ? "Plan Skip"
                        : type == 4
                            ? "Close"
                            : type == 5
                                ? "Approve"
                                : "Reject",
            textAlign: TextAlign.center,
            // style: TextStyle(color: Colors.green),
          ),
          content: Builder(builder: (context) {
            return Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: 200,
              width: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRichText(title: 'Comment'),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controller.approveCommentTextFieldCtrlr,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Comment here....',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            );
          }),
          actions: [
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Dimens.boxWidth10,
              ElevatedButton(
                style: Styles.darkRedElevatedButtonStyle,
                onPressed: () {
                  clearCommentText();
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
              Dimens.boxWidth20,
              ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () {
                  type == 1
                      ? controller.auditTaskApprovedButton(id: id)
                      : type == 2
                          ? controller.auditTaskRejectButton(id: id)
                          : type == 3
                              ? controller.auditTaskSkipButton(id: id)
                              : type == 4 || type == 12
                                  ? controller.auditTaskCloseButton(id: id)
                                  : type == 5
                                      ? controller.auditTaskCloseApproveButton(
                                          id: id)
                                      : controller.auditTaskCloseRejectButton(
                                          id: id);

                  // // print('Goods order id:$id');
                  clearCommentText();
                  Get.back();
                },
                child: Text(
                  type == 1
                      ? "Approve"
                      : type == 2
                          ? 'Reject'
                          : type == 3
                              ? "Skip Plan"
                              : type == 4
                                  ? "Close"
                                  : type == 5
                                      ? "Approve"
                                      : "Reject",
                ),
              ),
            ]),
          ],
        );
      })),
    );
  }

  void clearCommentText() {
    controller.approveCommentTextFieldCtrlr.clear();
  }
}
