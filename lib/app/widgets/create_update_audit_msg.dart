import 'package:cmms/app/create_audit/create_audit_controller.dart';
import 'package:cmms/app/create_pm_plan/create_pm_plan_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_audit_plan/view_audit_plan_controller.dart';

class CreateAuditPlanMessageDialog extends GetView {
  String? data;
  List<dynamic>? id;
  int? type;

  CreateAuditPlanMessageDialog({super.key, this.data, this.id, this.type});
  final CreateAuditController controller = Get.find();

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
            'Craete Plan',
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
                    },
                    child: const Text('Plan List'),
                  ),
                ),
                Dimens.boxWidth10,
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.yellowElevatedButtonStyle,
                    onPressed: () async {
                      Get.back();
                      String planId = id![0].toString();
                      Get.offAllNamed(
                          '${Routes.viewAuditPlan}/$planId/${type}');

                      // controller.clearStoreData();

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
