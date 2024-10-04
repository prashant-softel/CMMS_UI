import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_audit_plan/view_audit_plan_controller.dart';

class AuditPlanRejectDialog extends GetView {
  AuditPlanRejectDialog({super.key});
  final ViewAuditPlanController controller = Get.find();

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
            controller.type == AppConstants.kMis
                ? "Observation Plan Reject"
                : controller.type == AppConstants.kEvaluation
                    ? "Evaluation Plan Reject"
                    : "Audit Plan Reject",
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
                          controller: controller.rejectCommentTextFieldCtrlr,
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
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
              Dimens.boxWidth20,
              ElevatedButton(
                style: Styles.darkRedElevatedButtonStyle,
                onPressed: () {
                  controller.auditPlanRejectButton(
                      id: controller.auditId.value);
                  Get.back();
                },
                child: Text(controller.type == AppConstants.kMis
                    ? "Reject Observation Plan"
                    : controller.type == AppConstants.kEvaluation
                        ? "Reject Plan"
                        : 'Reject Audit Plan'),
              ),
            ]),
          ],
        );
      })),
    );
  }
}
