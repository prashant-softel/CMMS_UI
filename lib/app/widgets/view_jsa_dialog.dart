import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class ViewJSADialog extends GetView {
  String? viewJSADialog;
  bool safetyValue1 = true;
  bool safetyValue2 = true;
  bool safetyValue3 = true;
  bool safetyValue4 = true;
  bool safetyValue5 = false;
  bool safetyValue6 = false;
  bool safetyValue7 = true;

  ViewJSADialog({super.key, this.viewJSADialog});
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
          'JSA',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: Responsive.isDesktop(context) ? 200 : 250,
              width: Responsive.isDesktop(context)
                  ? double.infinity
                  : MediaQuery.of(context).size.width / 2,
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
                            child: InkWell(
                               onTap: () async {
                                final url = '${_controller.jsaData}';
                                print('JSAUrl:$url');
                                if (await canLaunch(url)) {
                                await launch(url);
                                 }
                                },
                              child: Image.asset('assets/files/pdf2.png'))),
                                   SizedBox(height: 10,),
                        Text('Click on Icon to View Document !!'),
                        // Text.rich(
                        //   TextSpan(
                        //     text: 'Click here to view Document ',
                        //     style: TextStyle(fontSize: 16),
                        //     children: [
                        //       TextSpan(
                        //         text:
                        //             'http://africau.edu/images/default/sample.pdf',
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           color: Colors.blue,
                        //           decoration: TextDecoration.underline,
                        //         ),
                        //         recognizer: TapGestureRecognizer()
                        //           ..onTap = () async {
                        //             final url =
                        //                 'http://africau.edu/images/default/sample.pdf';
                        //             if (await canLaunch(url)) {
                        //               await launch(url);
                        //             }
                        //           },
                        //       ),
                        //     ],
                        //   ),
                        // ),

                           
                        /// FILE UPLOAD WIDGET
                        
                        // Container(
                        //  height: Get.height * 0.35,
                        //   width: Get.width,
                        //   child: Row(//
                        //       children: [
                        //     Expanded(
                        //       flex: 2,
                        //       child: FileUploadWidgetWithDropzone(),
                        //     ),
                        //     Dimens.boxWidth10,
                        //     Expanded(flex: 8, child: FileUploadDetailsWidget()),
                        //   ]),
                        // ),
                        Responsive.isDesktop(context)
                            ? Row(
                                children: [
                                  Checkbox(
                                    value: _controller.isCheckedJSA.value,
                                    onChanged: (bool? value) {
                                      _controller.jSAtoggleCheckbox();
                                    },
                                  ),
                                  Text(
                                      'I have read and accept terms and conditions')
                                ],
                              )
                            : Row(
                                children: [
                                  Checkbox(
                                    value: _controller.isCheckedJSA.value,
                                    onChanged: (bool? value) {
                                      _controller.jSAtoggleCheckbox();
                                    },
                                  ),
                                  Text(
                                      'I have read and accept\nterms and conditions')
                                ],
                              )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        width: 15,
                      ),
                      _controller.isCheckedJSA.value == true
                          ? ElevatedButton(
                              style: Styles.navyBlueElevatedButtonStyle,
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Ok'),
                            )
                          : ElevatedButton(
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
