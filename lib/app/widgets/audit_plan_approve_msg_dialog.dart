import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_audit_plan/view_audit_plan_controller.dart';

class AuditPlanMessageApproveDialog extends GetView {
  String? data;
  List<dynamic>? id;
  int? type;
  AuditPlanMessageApproveDialog({super.key, this.data, this.id, this.type});
  final ViewAuditPlanController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    String buttonText1 =
        type == AppConstants.kMis ? 'MIS Plan List' : 'Audit Plan List';
    String buttonText2 = type == AppConstants.kMis ? 'MIS Task' : 'Audit Task';
    String buttonText3 =
        type == AppConstants.kMis ? 'View MIS Plan' : 'View Audit Plan';
    return SelectionArea(
      child: StatefulBuilder(builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Text(
            type == AppConstants.kMis
                ? 'MIS Plan Approval'
                : 'Audit Plan Approval',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          content: Builder(builder: (context) {
            return Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: 80,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
            Row(
              children: [
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.darkBlueElevatedButtonStyle,
                    onPressed: () {
                      Get.offAllNamed('${Routes.auditListScreen}/${type}');

                      // Get.offAllNamed(Routes.auditListScreen);
                    },
                    child: Text(buttonText1),
                  ),
                ),
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.greenElevatedButtonStyle,
                    onPressed: () {
                      Get.offAllNamed(Routes.auditTask);
                    },
                    child: Text(buttonText2),
                  ),
                ),
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.yellowElevatedButtonStyle,
                    onPressed: () async {
                      Get.back();
                      try {
                        await controller.setauditPlanId();
                        if (controller.auditId.value != 0) {
                          print({"fghvjbggjhjgk", controller.auditId});

                          await controller.getAuditPlanDetails(
                              auditPlanId: controller.auditId.value,
                              facilityId: controller.facilityId,
                              isloading: true);
                          await controller.getHistory(controller.facilityId);
                        }
                      } catch (e) {
                        print(e);
                      }

                      // Future.delayed(Duration(seconds: 1), () {
                      //   controller.getUnitCurrencyList();
                      // });
                      // Future.delayed(Duration(seconds: 1), () {
                      //   controller.getBusinessList(4);
                      // });
                      // Future.delayed(Duration(seconds: 1), () {
                      //   controller.getAssetList(controller.facilityId);
                      //   if (id != null) {
                      //     Future.delayed(Duration(seconds: 1), () {
                      //       controller.getPurchaseDetailsById(id: controller.id);
                      //     });
                      //   }
                      // });
                    },
                    child: Text(buttonText3),
                  ),
                ),
                Dimens.boxWidth10,
              ],
            )
          ],
        );
      })),
    );
  }
}
