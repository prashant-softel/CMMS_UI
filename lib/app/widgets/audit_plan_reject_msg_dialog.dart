import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_audit_plan/view_audit_plan_controller.dart';

class AuditPlanMsgReceiveDialog extends GetView {
  String? data;
  List<dynamic>? id;

  AuditPlanMsgReceiveDialog({super.key, this.data, this.id});
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
            'Reject Audit Plan',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          content: Builder(builder: (context) {
            var height = MediaQuery.of(context).size.height;

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
                      Get.offAllNamed(
                          '${Routes.auditListScreen}/${controller.type.value}');

                      Get.offAllNamed(Routes.auditListScreen);
                    },
                    child: const Text('Audit Plan List'),
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
                        if (controller.auditId != 0) {
                          // print({"fghvjbggjhjgk", auditId});

                          await controller.getAuditPlanDetails(
                              auditPlanId: controller.auditId.value,
                              facilityId: controller.facilityId,
                              isloading: true);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text('View Audit Plan'),
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
