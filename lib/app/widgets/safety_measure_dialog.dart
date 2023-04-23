import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class SafetyMeasureDialog extends GetView {
  String? safetyMeasureDialog;
  bool safetyValue1 = true;
  bool safetyValue2 = true;
  bool safetyValue3 = true;
  bool safetyValue4 = true;
  bool safetyValue5 = false;
  bool safetyValue6 = false;
  bool safetyValue7 = true;

 
  SafetyMeasureDialog({super.key, this.safetyMeasureDialog});
  final NewPermitController _controller = Get.find();


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
          'Following Safety Measure taken to carry out the work',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Obx(
            ()=> Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: 250,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('1. Safety helmet and safety shoes'),
                             Switch(
                                value: _controller.isToggleOn1.value,
                                onChanged: (value) {
                                  _controller.isToggleOn1.value =value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                            SizedBox(width: 10,),
                            Text('2. Arc flash shoes'),
                           Switch(
                                value: _controller.isToggleOn2.value,
                                onChanged: (value) {
                                  _controller.isToggleOn2.value =value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('3. Face Visor'),
                            Switch(
                                value: _controller.isToggleOn3.value,
                                onChanged: (value) {
                                  _controller.isToggleOn3.value =value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                            SizedBox(width: 175,),
                            Text('4. Reflective jacket'),
                            Switch(
                                value: _controller.isToggleOn4.value,
                                onChanged: (value) {
                                  _controller.isToggleOn4.value =value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('5. Headlight'),
                            Switch(
                                value: _controller.isToggleOn5.value,
                                onChanged: (value) {
                                  _controller.isToggleOn5.value =value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                            SizedBox(width: 180,),
                            Text('6. Gumboot'),
                            Switch(
                                value: _controller.isToggleOn6.value,
                                onChanged: (value) {
                                  _controller.isToggleOn6.value =value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('7. Other safety measures'),
                            Switch(
                                value: _controller.isToggleOn7.value,
                                onChanged: (value) {
                                  _controller.isToggleOn7.value =value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.red,
                              ),
                            SizedBox(width: 10,),
                            
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            style: Styles.blueElevatedButtonStyle,
                            onPressed: () => {},
                            child: const Text('Edit'),
                          ),
                          Dimens.boxWidth10,
                          ElevatedButton(
                            style: Styles.greenElevatedButtonStyle,
                            onPressed: () => {},
                            child: const Text('Save'),
                          ),
                          Dimens.boxWidth10,
                          // ElevatedButton(
                          //   style: Styles.redElevatedButtonStyle,
                          //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                          //   child: const Text('Add New Job'),
                          // ),
                        ]),
                  ]),
            ),
          );
        }),
        actions: [],
      );
    }));
 
  }
}
