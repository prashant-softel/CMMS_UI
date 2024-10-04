import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_audit_plan/view_audit_plan_controller.dart';

class AuditPlanMsgReceiveDialog extends GetView {
  String? data;
  List<dynamic>? id;
  int? type;

  AuditPlanMsgReceiveDialog({super.key, this.data, this.id, this.type});
  // final ViewAuditPlanController controller = Get.find();

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
            'Reject Plan Successfully',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.darkBlueElevatedButtonStyle,
                    onPressed: () {
                      Get.offAllNamed('${Routes.auditListScreen}/${type}');

                      // Get.offAllNamed(Routes.auditListScreen);
                    },
                    child: const Text('Plan List'),
                  ),
                ),
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.yellowElevatedButtonStyle,
                    onPressed: () async {
                      int auditId = id![0];
                      Get.back();

                      Get.offAllNamed(
                          '${Routes.viewAuditPlan}/$auditId/${type}');
                    },
                    child: const Text('View Plan'),
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
