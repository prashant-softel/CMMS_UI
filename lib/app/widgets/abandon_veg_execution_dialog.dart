import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbandonVegExecutionMessageDialog extends GetView<VegExecutionController> {
  final String? createData;
  final String? data;

  AbandonVegExecutionMessageDialog({super.key, this.createData, this.data});
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Abandon Execution',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          content: Builder(
            builder: (context) {
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
                    Text(
                      '${data}',
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            // Dimens.boxWidth10,
             SizedBox(width:10),
            Center(
              child: ElevatedButton(
                style: Styles.darkBlueElevatedButtonStyle,
                onPressed: () {
                  Get.offAllNamed(Routes.vegExecutionListScreen);
                },
                child: const Text('Ok'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
