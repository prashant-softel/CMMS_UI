import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EndVegScheduleMessageDialog extends GetView {
  final String? data;
  final List<dynamic>? endVegId;

  EndVegScheduleMessageDialog({super.key, this.data, this.endVegId});

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
            'End Vegetation Schedule Execution',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${data} ',
                            style: TextStyle(color: Colors.green),
                            textAlign: TextAlign.center),
                        Text('with id '),
                        Text(
                          '${endVegId}',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
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
                  Get.back();
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
