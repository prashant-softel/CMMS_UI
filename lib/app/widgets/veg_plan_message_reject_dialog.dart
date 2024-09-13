// ignore_for_file: must_be_immutable
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegPlanMessageRejectDialog extends GetView {
  String? data;
  List<dynamic>? id;

  VegPlanMessageRejectDialog({super.key, this.data, this.id});
  final ViewVegPlanController controller = Get.find();

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
          'Vegetation Plan Reject',
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
                    Get.offAllNamed(Routes.vegetationPlanListScreen);
                  },
                  child: const Text('Plan List'),
                ),
              ),
              Dimens.boxWidth10,
              Center(
                child: ElevatedButton(
                  style: Styles.yellowElevatedButtonStyle,
                  onPressed: () async {
                    Get.back();
                    try {
                      await controller.setUserId();

                      if (id != 0) {
                        Future.delayed(Duration(seconds: 1), () {
                          controller.getVegPlanDetail(
                              planId: controller.id.value,
                              facilityId: controller.facilityId);
                          controller.getVegHistory(
                              id: controller.id.value,
                              facilityId: controller.facilityId);
                        });
                      }

                      Future.delayed(Duration(seconds: 1), () {
                        controller.getVegEquipmentModelList(
                            controller.facilityId, true);
                      });
                      // getMcPlanHistory(id: id.value);
                    } catch (e) {
                      print(e);
                    }
                    // Get.offAllNamed(Routes.viewVegetationPlanScreen);
                  },
                  child: const Text('View Plan'),
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
