// ignore_for_file: must_be_immutable

import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegPlanMessageApproveDialog extends GetView {
  String? data;
  List<dynamic>? id;

  VegPlanMessageApproveDialog({super.key, this.data, this.id});
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
          'Vegetaion Plan Approval',
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
                  //     SizedBox(height: 20,),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         width: 15,
                  //       ),
                  //       ElevatedButton(
                  //         style: Styles.greenElevatedButtonStyle,
                  //         onPressed: () => Get.offAllNamed(Routes.newPermit),
                  //         child: const Text('Permit List'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       ElevatedButton(
                  //         style: Styles.blueElevatedButtonStyle,
                  //         onPressed: () => Get.offAndToNamed(Routes.newPermitList),
                  //         child: const Text('View This Permit'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       // ElevatedButton(
                  //       //   style: Styles.redElevatedButtonStyle,
                  //       //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                  //       //   child: const Text('Add New Job'),
                  //       // ),
                  //     ]),
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
                  child: const Text('Vegetation List'),
                ),
              ),
              Dimens.boxWidth10,
              Center(
                child: ElevatedButton(
                  style: Styles.yellowElevatedButtonStyle,
                  onPressed: () {
                    Get.back();
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
                  child: const Text('View Vegetation Plan'),
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
