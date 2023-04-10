import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class NewWarrantyClaimDialog extends GetView {
  String? createPermitData;

  NewWarrantyClaimDialog({super.key, this.createPermitData});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Row(
        mainAxisAlignment : MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done,
              ),
            Center(
              child: Text(
                'Warranty Claim',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
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
                  Center(
                    child: Text(
                        'Warranty Claim Added Successfully',
                        style: TextStyle(color: Colors.brown),
                        ),
                  ),
                       Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  SizedBox(height: 30,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          style: Styles.greenElevatedButtonStyle,
                          onPressed: () => Get.offAllNamed(Routes.warrantyClaimList),
                          child: const Text('Warranty Claim List'),
                        ),
                        Dimens.boxWidth10,
                        ElevatedButton(
                          style: Styles.yellowElevatedButtonStyle,
                          onPressed: () => Get.offAndToNamed(Routes.viewWarrantyClaim),
                          child: const Text('View This Warranty Claim'),
                        ),
                        Dimens.boxWidth10,
                        ElevatedButton(
                          style: Styles.darkBlueElevatedButtonStyle,
                          onPressed: () => Get.offAndToNamed(Routes.warrantyClaimList),
                          child: const Text('New Warranty Claim'),
                        ),
                      ]),
                ]),
          );
        }),
        actions: [],
      );
    }));
  }
}
