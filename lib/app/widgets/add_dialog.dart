import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/dimens.dart';

class AddDialog extends GetView {
  final WaterDataListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets0_0_10_0,
        title: Row(
          children: [
            Text(
              "Water Procurements",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorValues.lightGreyColorWithOpacity35,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorValues.appBlueBackgroundColor,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              // padding: EdgeInsets.only(right: 120, top: 10),
              height: height / 1.5,
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Date of procurement"),
                    ],
                  ),
                  Column(
                    children: [
                      CustomTextFieldForStock(
                        width: MediaQuery.of(context).size.width / 5,
                        numberTextField: true,
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              )));
        }),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.redColor,
                  text: "Cancel",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Dimens.boxWidth20,
              Container(
                height: 35,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.greenColor,
                  text: 'Submit',
                  onPressed: () {
                    // controller.createMcPlan();
                  },
                ),
              ),
            ],
          )
        ],
      );
    }));
  }
}
