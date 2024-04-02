import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_pm_plan/view_pm_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PmPlanMessageApproveDialog extends GetView {
  String? data;
  List<dynamic>? id;

  PmPlanMessageApproveDialog({super.key, this.data, this.id});
  final ViewPmPlanController controller = Get.find();

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
          'PM Plan Approval',
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
                    Get.offAllNamed(Routes.pmPlanList);
                  },
                  child: const Text('PM Plan List'),
                ),
              ),
              Dimens.boxWidth10,
              Center(
                child: ElevatedButton(
                  style: Styles.greenElevatedButtonStyle,
                  onPressed: () {
                    Get.offAllNamed(Routes.pmTask);
                  },
                  child: const Text('PM Task List'),
                ),
              ),
              Dimens.boxWidth10,
              Center(
                child: ElevatedButton(
                  style: Styles.yellowElevatedButtonStyle,
                  onPressed: () async {
                    Get.back();
                    try {
                      await controller.setPMPlanId();
                      if (controller.pmPlanId != 0) {
                        //  print({"fghvjbggjhjgk", pmPlanId});

                        await controller.getPmPlanDetails(
                            facilityId: controller.facilityId,
                            pmPlanId: controller.pmPlanId.value,
                            isloading: true);
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
                  child: const Text('View PM Plan'),
                ),
              ),
              Dimens.boxWidth10,
            ],
          )
        ],
      );
    }));
  }
}
