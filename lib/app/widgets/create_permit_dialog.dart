import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class CreateNewPermitDialog extends GetView {
  String? createPermitData;

  CreateNewPermitDialog({super.key, this.createPermitData});

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
          'Success !!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: height / 5.5,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Text(
                      'New Permit Created Successfully.\nPlease wait for Approval, you can start \nthe job only after PTW is approved '),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          style: Styles.greenElevatedButtonStyle,
                          onPressed: () => Get.offAllNamed(Routes.newPermit),
                          child: const Text('Permit List'),
                        ),
                        Dimens.boxWidth10,
                        ElevatedButton(
                          style: Styles.blueElevatedButtonStyle,
                          onPressed: () => Get.offAndToNamed(Routes.newPermit),
                          child: const Text('View This Permit'),
                        ),
                        Dimens.boxWidth10,
                        // ElevatedButton(
                        //   style: Styles.redElevatedButtonStyle,
                        //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                        //   child: const Text('Add New Job'),
                        // ),
                      ]),
                ]),
          );
        }),
        actions: [],
      );
    }));
  }
}
