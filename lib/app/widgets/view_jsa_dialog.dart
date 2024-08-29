import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/responsive.dart';
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
                                  // final url = '${_controller.jsaData}';
                                  // "https://www.w3.org/1999/xhtml/"
                                  // String baseUrl =
                                  //     'http://65.0.20.19/CMMS_API/';
                                  String baseUrl = 'http://172.20.43.9:83/';
                                  String endpoint = '${_controller.jsaData}';

                                  // Concatenate the links
                                  String fullUrl = baseUrl + endpoint;
                                  // final url =
                                  //     'http://65.0.20.19/O3_Files${_controller.jsaData}';
                                  print('JSAUrl:$fullUrl');
                                  if (await canLaunch(fullUrl)) {
                                    await launch(fullUrl);
                                  }
                                },
                                child: Image.asset('assets/files/pdf2.png'))),
                        SizedBox(
                          height: 10,
                        ),
                        Responsive.isDesktop(context)
                            ? Text('Click on Icon to View Document !!')
                            : Text("Click to View"),
                        Dimens.boxHeight5,
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
                                  IgnorePointer(
                                    ignoring: _controller.permitId.value > 0
                                        ? true
                                        : false,
                                    child: Checkbox(
                                      value: _controller.permitId > 0
                                          ? true
                                          : _controller.isCheckedJSA.value,
                                      // value: _controller.isCheckedJSA.value,
                                      onChanged: (bool? value) {
                                        _controller.jSAtoggleCheckbox();
                                      },
                                    ),
                                  ),
                                  Text(
                                      'I have read and accept terms and conditions')
                                ],
                              )
                            : IgnorePointer(
                                ignoring: _controller.permitId.value > 0
                                    ? true
                                    : false,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: _controller.permitId.value > 0
                                          ? true
                                          : _controller.isCheckedJSA.value,
                                      // value: _controller.isCheckedJSA.value,
                                      onChanged: (bool? value) {
                                        _controller.jSAtoggleCheckbox();
                                      },
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'I have read and accept\nterms and conditions',
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
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
