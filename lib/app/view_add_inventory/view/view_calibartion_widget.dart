import 'package:cmms/app/app.dart';

import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/services.dart';

class ViewCalibrationTabWidget extends StatefulWidget {
  ViewCalibrationTabWidget({super.key});

  @override
  State<ViewCalibrationTabWidget> createState() => _CalibrationTabWidgetState();
}

class _CalibrationTabWidgetState extends State<ViewCalibrationTabWidget> {
  final ViewAddInventoryController controller = Get.find();

  @override
  Widget build(BuildContext context) => GetBuilder<ViewAddInventoryController>(
      id: 'calibration_tab',
      builder: (controller) {
        return SingleChildScrollView(
          child: Stack(children: [
            Container(
              height: 400,
              child: Column(
                children: [
                  // Dimens.boxHeight10,
                  SizedBox(height:10),
                  Text(
                    'Calibration',
                    style: Styles.blackBold18,
                  ),
                  Container(
                    margin: Dimens.edgeInsets20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IgnorePointer(
                              child: Row(
                                children: [
                                  CustomRichText(
                                      includeAsterisk: false,
                                      title: "Calibration Frequency"),
                                  // Dimens.boxWidth5,
                                  SizedBox(width: 5),
                                  SizedBox(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: DropdownWebStock(
                                        margin: Dimens.edgeInsets5,
                                        width:
                                            MediaQuery.of(context).size.width / 5,
                                        controller: controller,
                                        dropdownList: controller.frequencyList,
                                        isValueSelected:
                                            controller.isSelectedfrequency.value,
                                        selectedValue:
                                            controller.selectedfrequency.value,
                                        onValueChanged: controller.onValueChanged,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Dimens.boxHeight5,
                            SizedBox(height: 5),

                            IgnorePointer(
                              child: Row(
                                children: [
                                  CustomRichText(
                                      includeAsterisk: false,
                                      title: "Calibration Remainder In"),
                                  SizedBox(width: 10),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.040,
                                    width: MediaQuery.of(context).size.width / 5,
                                    child: TextField(
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 16.0,
                                            height: 1.0,
                                            color: Colors.black),
                                      ),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      controller:
                                          controller.calibrationRemaingCtrlr,
                                                
                                      //  errorController: controller
                                      //                     .isSerialNoInvalid
                                      //                     .value
                                      //                 ? "Required field"
                                      //                 : null,
                                      //             onChanged: (value) {
                                      //               if (value.trim().length >
                                      //                   1) {
                                      //                 controller
                                      //                     .isSerialNoInvalid
                                      //                     .value = false;
                                      //               } else {
                                      //                 controller
                                      //                     .isSerialNoInvalid
                                      //                     .value = true;
                                      //               }
                                      //               },
                                      // focusNode: controller.calremFocus,
                                      // scrollController: controller.calremScroll,
                                      decoration: InputDecoration(
                                        contentPadding: Dimens.edgeInsets5,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: .2),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  // Text("Day"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IgnorePointer(
                              child: Row(
                                children: [
                                  CustomRichText(
                                      includeAsterisk: false,
                                      title: 'Schedule Date  : '),
                                  // Dimens.boxWidth10,
                                  SizedBox(width: 10),
                                  CustomTextFieldForStock(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      numberTextField: true,
                                      onTap: () {
                                        controller.openLastCalibrationDatePicker =
                                            !controller
                                                .openLastCalibrationDatePicker;
                                        controller.update(['calibration_tab']);
                                      },
                                      textController:
                                          controller.lastCalibrationDateTc,
                                      // errorController:
                                      //     controller.isReceivedDateInvalid.value
                                      //         ? "Required field"
                                      //         : null,
                                      // onChanged: (value) {
                                      //   if (value.trim().length > 1) {
                                      //     controller.isReceivedDateInvalid.value =
                                      //         false;
                                      //   } else {
                                      //     controller.isReceivedDateInvalid.value =
                                      //         true;
                                      //   }
                                      // }
                                      ),
                                ],
                              ),
                            ),
                            // Dimens.boxHeight5,
                            SizedBox(height: 5),
                            Container(
                              child: IgnorePointer(
                                child: Row(
                                  children: [
                                    Text('Calibration Certificate'),
                                    // Dimens.boxWidth20,
                                    SizedBox(width:20),
                                    ActionButton(
                                      label: 'Upload certification file',
                                      onPressed: () {},
                                      icon: Icons.file_upload_outlined,
                                      color: ColorValues.appLightBlueColor,
                                    ),
                                    // Dimens.boxWidth70,
                                    SizedBox(width:70),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (controller.openLastCalibrationDatePicker)
              Positioned(
                right: 150,
                top: 94,
                child: DatePickerWidget(
                  minDate: DateTime(DateTime.now().year - 2),
                  controller: DateRangePickerController(),
                  selectionChanges: (p0) {
                    print('po valu ${p0.value.toString()}');
                    controller.lastCalibrationDateTc.text =
                        DateFormat('yyyy-MM-dd').format(p0.value);
                    controller.openLastCalibrationDatePicker =
                        !controller.openLastCalibrationDatePicker;
                    controller.update(['calibration_tab']);
                  },
                ),
              ),
          ]),
        );
      });
}


// class ViewCalibrationTabWidget extends StatelessWidget {
//   const ViewCalibrationTabWidget({super.key});

//   @override
//   Widget build(BuildContext context) => GetBuilder<ViewAddInventoryController>(
//       id: 'calibration_tab',
//       builder: (controller) {
//         return SingleChildScrollView(
//           child: Stack(children: [
//             Container(
//               height: 400,
//               child: Column(
//                 children: [
//                   Dimens.boxHeight10,
//                   Text(
//                     'Calibration',
//                     style: Styles.blackBold18,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     child: Wrap(
//                       children: [
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Row(
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   // mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         CustomRichText(
//                                             title: "  Calibration Frequency"),
//                                         Dimens.boxWidth5,
//                                         IgnorePointer(
//                                           ignoring: true,
//                                           child: DropdownWebWidget(
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Colors.black26,
//                                                 offset: const Offset(
//                                                   5.0,
//                                                   5.0,
//                                                 ),
//                                                 blurRadius: 5.0,
//                                                 spreadRadius: 1.0,
//                                               ),
//                                               BoxShadow(
//                                                 color: ColorValues.whiteColor,
//                                                 offset: const Offset(0.0, 0.0),
//                                                 blurRadius: 0.0,
//                                                 spreadRadius: 0.0,
//                                               ),
//                                             ],
//                                             margin: Dimens.edgeInsets16,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 5,
//                                             controller: controller,
//                                             dropdownList:
//                                                 controller.frequencyList,
//                                             isValueSelected: controller
//                                                 .isSelectedfrequency.value,
//                                             selectedValue: controller
//                                                 .selectedfrequency.value,
//                                             onValueChanged:
//                                                 controller.onValueChanged,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 10),
//                                       child: Row(
//                                         children: [
//                                           CustomRichText(
//                                               title:
//                                                   "Calibration remainder In"),
//                                           SizedBox(width: 10),
//                                           IgnorePointer(
//                                             ignoring: true,
//                                             child: Container(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width /
//                                                   5.1,
//                                               child: TextField(
//                                                 style: GoogleFonts.lato(
//                                                   textStyle: TextStyle(
//                                                       fontSize: 16.0,
//                                                       height: 1.0,
//                                                       color: Colors.black),
//                                                 ),
//                                                 controller: controller
//                                                     .calibrationRemaingCtrlr,
//                                                 decoration: InputDecoration(
//                                                   contentPadding: Dimens
//                                                       .edgeInsets16_0_16_0,
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                     borderSide:
//                                                         BorderSide(width: .2),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             2),
//                                                   ),
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                     borderSide:
//                                                         BorderSide(width: .2),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             2),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 20,
//                                           ),
//                                           Text("Day"),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   children: [
//                                     IgnorePointer(
//                                       ignoring: true,
//                                       child: CustomTextField(
//                                         numberTextField: true,
//                                         // readOnly: true,
//                                         onTap: () {
//                                           controller
//                                                   .openLastCalibrationDatePicker =
//                                               !controller
//                                                   .openLastCalibrationDatePicker;
//                                           controller
//                                               .update(['calibration_tab']);
//                                         },
//                                         textController:
//                                             controller.calibrationRemainderInTc,
//                                         label: 'Last calibration date: *',
//                                       ),
//                                     ),
//                                     IgnorePointer(
//                                       ignoring: true,
//                                       child: Container(
//                                         margin: Dimens.edgeInsets16,
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Text('Calibration certificate'),
//                                             Dimens.boxWidth10,
//                                             ActionButton(
//                                               label:
//                                                   'Upload certification file',
//                                               onPressed: () {},
//                                               icon: Icons.file_upload_outlined,
//                                               color:
//                                                   ColorValues.appLightBlueColor,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (controller.openLastCalibrationDatePicker)
//               Positioned(
//                 right: 70,
//                 top: 60,
//                 child: DatePickerWidget(
//                   minDate: DateTime(DateTime.now().year),
//                   maxDate: DateTime(
//                       DateTime.now().year, 13, 0), // last date of this year
//                   controller: DateRangePickerController(),
//                   selectionChanges: (p0) {
//                     print('po valu ${p0.value.toString()}');
//                     controller.lastCalibrationDateTc.text =
//                         DateFormat('yyyy-MM-dd').format(p0.value);
//                     controller.openLastCalibrationDatePicker =
//                         !controller.openLastCalibrationDatePicker;
//                     controller.update(['calibration_tab']);
//                   },
//                 ),
//               ),
//           ]),
//         );
//       });
// }
