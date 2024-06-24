import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class AbandonVegScheduleMessageDialog extends GetView {
  final String? data;

  AbandonVegScheduleMessageDialog({super.key, this.data});

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
            'Abandon Schedule Execution',
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
            Dimens.boxWidth10,
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
