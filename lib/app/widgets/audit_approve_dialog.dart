import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_audit_plan/view_audit_plan_controller.dart';

class AuditApprovedDialog extends GetView {
  // int? id;


  AuditApprovedDialog({super.key});
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
          title: Text( controller.type.value==AppConstants.kMis?"Observation Plan Approve":
            "Audit Plan Approve",
            textAlign: TextAlign.center,
            // style: TextStyle(color: Colors.green),
          ),
          content: Builder(builder: (context) {
            return Obx(
              ()=> Container(
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
                            maxLines: 3,
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
                                     focusedErrorBorder:
                                    controller.iscommentTextInvalid.value
                                        ? OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                              color: ColorValues.redColorDark,
                                            ),
                                        )
                               : InputBorder.none,
                                errorBorder: controller.iscommentTextInvalid.value
                                    ? OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          color: ColorValues.redColorDark,
                                        ),
                                      )
                                    : null,
                                errorText: controller.iscommentTextInvalid.value
                                    ? "Required field"
                                    : null,
                            ),
              
                               onChanged: (value) {
                                if (value.trim().length > 3) {
                                  controller.iscommentTextInvalid.value = false;
                                } else {
                                  controller.iscommentTextInvalid.value = true;
                                }
                              },
                          ),
                        ],
                      ),
                    ]),
              ),
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
                style: Styles.greenElevatedButtonStyle,
                onPressed: () {
                  if(controller.checkComment()){
                    return;
                  }else{
                  controller.auditPlanApprovedButton(
                      id: controller.auditId.value);
                  // print('Goods order id:$id');
                  Get.back();
                  }
                },
                child: Text(
                  controller.type.value==AppConstants.kMis?'Observation Plan Approve':
                  'Approve Audit Plan'),
              ),
            ]),
          ],
        );
      })),
    );
  }
}
