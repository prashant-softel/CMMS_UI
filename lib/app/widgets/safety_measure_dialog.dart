import 'package:cmms/app/app.dart';
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


  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'SOP',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Obx(
            ()=> Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: 250,
              width: Responsive.isDesktop(context) ? double.infinity : MediaQuery.of(context).size.width / 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 150,
                          child: Image.asset('assets/files/pdf2.png')),
                          SizedBox(height: 10,),
                          Text('Upload File !!'),
                          SizedBox(height: 20,),

                        Responsive.isDesktop(context)
                        ?
                        Row(
                          children: [
                            Checkbox(
                              value: _controller.isCheckedSOP.value, 
                              onChanged: (bool? value){
                                _controller.soptoggleCheckbox();
                              },
                              ),
                            Text('I have read and accept terms and conditions')
                          ],
                        )
                        :
                        Row(
                          children: [
                            Checkbox(
                              value: _controller.isCheckedSOP.value, 
                              onChanged: (bool? value){
                                _controller.soptoggleCheckbox();
                              },
                              ),
                            Text('I have read and accept\nterms and conditions')
                          ],
                        )


                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          _controller.isCheckedSOP.value == true
                          ?
                          ElevatedButton(
                            style: Styles.navyBlueElevatedButtonStyle,
                            onPressed: (){
                              Get.back();
                            },
                            child: const Text('Ok'),
                          )
                          :
                          ElevatedButton(
                            style: Styles.navyBlueElevatedButtonStyle,
                            onPressed: null,
                            child: const Text('Ok'),
                          )

                          // Dimens.boxWidth10,
                          // ElevatedButton(
                          //   style: Styles.greenElevatedButtonStyle,
                          //   onPressed: () => {},
                          //   child: const Text('Save'),
                          // ),
                          // Dimens.boxWidth10,
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
