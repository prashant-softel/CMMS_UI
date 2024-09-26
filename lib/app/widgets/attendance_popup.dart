import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendancePopup extends StatelessWidget {
  final String? message;
  AttendancePopup({super.key, this.message});

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
            'Attendance',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          content: Builder(builder: (context) {
            return Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: 50,
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    Center(
                      child: Text('${message}',
                          style: TextStyle(color: Colors.green),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            );
          }),
          actions: [
            Dimens.boxWidth10,
            Center(
              child: ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () {
                  Get.offAllNamed(Routes.admin_dashboard);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
