import 'package:cmms/app/add_inventory/add_inventory_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/file_upload2_details_widget.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_dropzone2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';

import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalibrationTabWidget extends StatefulWidget {
  CalibrationTabWidget({super.key});

  @override
  State<CalibrationTabWidget> createState() => _CalibrationTabWidgetState();
}

class _CalibrationTabWidgetState extends State<CalibrationTabWidget> {
  final AddInventoryController controller = Get.find();

  @override
  Widget build(BuildContext context) => GetBuilder<AddInventoryController>(
      id: 'calibration_tab',
      builder: (controller) {
        return SingleChildScrollView(
          child: Stack(children: [
            Container(
              height: 600,
              child: Column(
                children: [
                  // Dimens.boxHeight10,
                  SizedBox(height: 10),
                  Text(
                    'Calibration',
                    style: Styles.blackBold18,
                  ),
                  Container(
                    margin: Dimens.edgeInsets20,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    CustomRichText(
                                        includeAsterisk: false,
                                        title: "Calibration Frequency"),
                                    // Dimens.boxWidth5,
                                    SizedBox(width: 5),
                                    SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        child: DropdownWebStock(
                                          margin: Dimens.edgeInsets5,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          controller: controller,
                                          dropdownList:
                                              controller.frequencyList,
                                          isValueSelected: controller
                                              .isSelectedfrequency.value,
                                          selectedValue: controller
                                              .selectedfrequency.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Dimens.boxHeight5,
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    CustomRichText(
                                        includeAsterisk: false,
                                        title: "Calibration Remainder In"),
                                    SizedBox(width: 10),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.040,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: TextFormField(
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
                                        focusNode: controller.calremFocus,
                                        scrollController:
                                            controller.calremScroll,
                                        decoration: InputDecoration(
                                          contentPadding: Dimens.edgeInsets5,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          suffixText: "Days",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
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
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    CustomRichText(
                                        includeAsterisk: false,
                                        title: 'Schedule Date  : '),
                                    // Dimens.boxWidth10,
                                    SizedBox(width: 10),
                                    CustomTextFieldForStock(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        numberTextField: true,
                                        onTap: () {
                                          controller
                                                  .openLastCalibrationDatePicker =
                                              !controller
                                                  .openLastCalibrationDatePicker;
                                          controller
                                              .update(['calibration_tab']);
                                        },
                                        textController:
                                            controller.lastCalibrationDateTc,
                                        errorController: controller
                                                .isReceivedDateInvalid.value
                                            ? "Required field"
                                            : null,
                                        onChanged: (value) {
                                          if (value.trim().length > 1) {
                                            controller.isReceivedDateInvalid
                                                .value = false;
                                          } else {
                                            controller.isReceivedDateInvalid
                                                .value = true;
                                          }
                                        }),
                                  ],
                                ),
                                // Dimens.boxHeight5,
                                SizedBox(height: 5),
                                // Container(
                                //   child: Row(
                                //     children: [
                                //       Text('Calibration Certificate'),
                                //       // Dimens.boxWidth20,
                                //       SizedBox(width: 20),
                                //       ActionButton(
                                //         label: 'Upload certification file',
                                //         onPressed: () {},
                                //         icon: Icons.file_upload_outlined,
                                //         color: ColorValues.appLightBlueColor,
                                //       ),
                                //       // Dimens.boxWidth70,
                                //       SizedBox(width: 70),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 400,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Center(
                                child: Container(
                                  // margin: EdgeInsets.all(16),
                                  margin: EdgeInsets.only(top: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(.3)),
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth: 1100,
                                  ),
                                  child: Column(
                                    children: [
                                      CustomAppBar(
                                        title: ' Calibration Certificate'.tr,
                                      ),
                                      SizedBox(height: 10),
                                      Wrap(
                                        children: [
                                          Column(
                                            children: [
                                              // SizedBox(
                                              //   width: MediaQuery.of(context)
                                              //       .size
                                              //       // .width ,
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child:
                                                          FileUploadWidgetWithDropzone2(),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                        flex: 8,
                                                        child:
                                                            FileUpload2DetailsWidgetWeb()),
                                                  ],
                                                ),
                                              ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
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
                  onCancel: () {
                    controller.openLastCalibrationDatePicker = false;
                    controller.update(['calibration_tab']);
                  },
                ),
              ),
          ]),
        );
      });
}
