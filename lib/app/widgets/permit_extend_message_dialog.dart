import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PermitMessageExtendDialog extends GetView {
  String? createPermitData;
  String? data;

  PermitMessageExtendDialog({super.key, this.createPermitData, this.data});
  final NewPermitListController _controller = Get.find();


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
          '${data}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 50,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  // Text(
                  //     'New Permit Created Successfully.\nPlease wait for Approval, you can start \nthe job only after PTW is approved '),
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
          Dimens.boxWidth10,
          Center(
            child: ElevatedButton(
              style: Styles.darkBlueElevatedButtonStyle,
              onPressed: () {
                _controller.getNewPermitList(_controller.facilityId, _controller.userId);
                Get.back();
              },
              child: const Text('Ok'),
            ),
          ),
        ],
      );
    }));
  }
}
