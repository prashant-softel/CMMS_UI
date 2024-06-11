import 'package:cmms/app/compliance/compliance_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';

class ComplianceWeb extends StatefulWidget {
  ComplianceWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ComplianceWeb> createState() => _ComplianceWebState();
}

class _ComplianceWebState extends State<ComplianceWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplianceController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(() => SelectionArea(
              child: Scaffold(
                  body: Container(
                    color: Color.fromARGB(255, 234, 236, 238),
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      children: [
                        HeaderWidget(),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 236, 234, 234)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.home,
                                color: ColorValues.greyLightColor,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(Routes.home);
                                },
                                child: Text(
                                  "DASHBOARD",
                                  style: Styles.greyLight14,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(Routes.statutory);
                                },
                                child:
                                    Text(" / MIS", style: Styles.greyLight14),
                              ),
                              controller.srId == 0
                                  ? Text(
                                      " / ADD STATUTORY COMPLIANCE",
                                      style: Styles.greyLight14,
                                    )
                                  : Text(
                                      " / UPDATE STATUTORY COMPLIANCE",
                                      style: Styles.greyLight14,
                                    ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Stack(
                              children: [
                                Container(
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 20),
                                        child: Text(
                                          "Statutory Compliance Report",
                                          style: Styles.blackBold16,
                                        ),
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Container(
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
                                        width: Get.width,
                                        height: Get.height,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Container(
                                            margin: Dimens.edgeInsets20,
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Spacer(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Dimens.boxHeight5,
                                                        Row(
                                                          children: [
                                                            Dimens.boxWidth10,
                                                            CustomRichText(
                                                                title:
                                                                    'Compliance: '),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              child:
                                                                  DropdownWebStock(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                dropdownList:
                                                                    controller
                                                                        .statutoryComplianceList,
                                                                isValueSelected:
                                                                    controller
                                                                        .isStatutoryComplianceSelected
                                                                        .value,
                                                                selectedValue:
                                                                    controller
                                                                        .selectedStatutoryCompliance
                                                                        .value,
                                                                onValueChanged:
                                                                    controller
                                                                        .onValueChanged,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        Dimens.boxHeight10,
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Issue Date '),
                                                            Dimens.boxWidth10,
                                                            CustomTextFieldForStock(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              numberTextField:
                                                                  true,
                                                              onTap: () {
                                                                controller
                                                                        .openIssueDatePicker =
                                                                    !controller
                                                                        .openIssueDatePicker;
                                                                controller
                                                                    .update([
                                                                  'stock_Mangement'
                                                                ]);
                                                              },
                                                              textController:
                                                                  controller
                                                                      .issueDateTc,
                                                              // validate
                                                              errorController:
                                                                  controller
                                                                          .isIssueDateInvalid
                                                                          .value
                                                                      ? "Required field"
                                                                      : null,

                                                              onChanged:
                                                                  (value) {
                                                                if (value
                                                                        .trim()
                                                                        .length >
                                                                    0) {
                                                                  controller
                                                                      .isIssueDateInvalid
                                                                      .value = false;
                                                                } else {
                                                                  controller
                                                                      .isIssueDateInvalid
                                                                      .value = true;
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight5,
                                                        // Row(
                                                        //   children: [
                                                        //     CustomRichText(
                                                        //         title:
                                                        //             'Validity (In months) '),
                                                        //     Dimens.boxWidth10,
                                                        //     LoginCustomTextfield(
                                                        //       width: (MediaQuery.of(
                                                        //                   context)
                                                        //               .size
                                                        //               .width *
                                                        //           .2),
                                                        //       keyboardType:
                                                        //           TextInputType
                                                        //               .number,

                                                        //       // textController:
                                                        //       //     controller.challanNoCtrlr,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        Dimens.boxHeight5,

                                                        Dimens.boxHeight5,
                                                        // if (reNew == 1)
                                                        // Row(
                                                        //   children: [
                                                        //     CustomRichText(
                                                        //         title: 'ReNew Date '),
                                                        //     Dimens.boxWidth10,
                                                        //     CustomTextFieldForStock(
                                                        //       width:
                                                        //           MediaQuery.of(context)
                                                        //                   .size
                                                        //                   .width /
                                                        //               5,
                                                        //       numberTextField: true,
                                                        //       onTap: () {
                                                        //         // controller
                                                        //         //         .openReceivedPicker =
                                                        //         //     !controller
                                                        //         //         .openReceivedPicker;
                                                        //         // controller.update(
                                                        //         //     ['stock_Mangement']);
                                                        //       },
                                                        //       // textController:
                                                        //       //     controller.receivedDateTc,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        // Row(
                                                        //   children: [
                                                        //     CustomRichText(
                                                        //         title:
                                                        //             'Status of validity '),
                                                        //     Dimens.boxWidth10,
                                                        //     LoginCustomTextfield(
                                                        //       width: (MediaQuery.of(
                                                        //                   context)
                                                        //               .size
                                                        //               .width *
                                                        //           .2),

                                                        //       keyboardType:
                                                        //           TextInputType
                                                        //               .number,

                                                        //       // textController:
                                                        //       //     controller.challanNoCtrlr,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // Dimens.boxHeight8,
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Expires on '),
                                                            Dimens.boxWidth10,
                                                            CustomTextFieldForStock(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              numberTextField:
                                                                  true,
                                                              onTap: () {
                                                                controller
                                                                        .openExpireOnFDatePicker =
                                                                    !controller
                                                                        .openExpireOnFDatePicker;
                                                                controller
                                                                    .update([
                                                                  'stock_Mangement'
                                                                ]);
                                                              },
                                                              textController:
                                                                  controller
                                                                      .expireOnDateTc,
                                                              errorController:
                                                                  controller
                                                                          .isExpiresonInvalid
                                                                          .value
                                                                      ? "Required field"
                                                                      : null,
                                                              onChanged:
                                                                  (value) {
                                                                if (value
                                                                        .trim()
                                                                        .length >
                                                                    0) {
                                                                  controller
                                                                      .isExpiresonInvalid
                                                                      .value = false;
                                                                } else {
                                                                  controller
                                                                      .isExpiresonInvalid
                                                                      .value = true;
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight5,
                                                        // Row(
                                                        //   children: [
                                                        //     CustomRichText(
                                                        //         title:
                                                        //             'Days Left '),
                                                        //     Dimens.boxWidth10,
                                                        //     LoginCustomTextfield(
                                                        //       width: (MediaQuery.of(
                                                        //                   context)
                                                        //               .size
                                                        //               .width *
                                                        //           .2),
                                                        //       keyboardType:
                                                        //           TextInputType
                                                        //               .number,

                                                        //       // textController:
                                                        //       //     controller.challanNoCtrlr,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     CustomRichText(
                                                        //         title:
                                                        //             'Status of validity '),
                                                        //     Dimens.boxWidth10,
                                                        //     LoginCustomTextfield(
                                                        //       width:
                                                        //           (MediaQuery.of(context)
                                                        //                   .size
                                                        //                   .width *
                                                        //               .2),
                                                        //       keyboardType:
                                                        //           TextInputType.number,

                                                        //       // textController:
                                                        //       //     controller.challanNoCtrlr,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                  ],
                                                ),
                                                Dimens.boxHeight20,
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20),
                                                  child: Row(children: [
                                                    Text('Comment: '),
                                                    Expanded(
                                                      child: TextField(
                                                        controller: controller
                                                            .commentsCtrl,
                                                        style: GoogleFonts.lato(
                                                          textStyle: TextStyle(
                                                              fontSize: 16.0,
                                                              height: 1.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                          disabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: ColorValues
                                                                  .appLightGreyColor,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: ColorValues
                                                                  .appLightBlueColor,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: ColorValues
                                                                  .appLightBlueColor,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        minLines: 3,
                                                        maxLines: null,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                Dimens.boxHeight15,
                                                (controller.historyList !=
                                                            null &&
                                                        controller.historyList!
                                                            .isNotEmpty)
                                                    ? Container(
                                                        margin:
                                                            Dimens.edgeInsets20,
                                                        height: ((controller
                                                                        .historyList
                                                                        ?.length ??
                                                                    0) *
                                                                40) +
                                                            120,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: ColorValues
                                                                .lightGreyColorWithOpacity35,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: //
                                                            Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "Statutory Compliance  History ",
                                                                    style: Styles
                                                                        .blue700,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  HistoryTableWidgetWeb(
                                                                historyList:
                                                                    controller
                                                                        .historyList,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                                // if (viewStatutory == 0)

                                                // Row(
                                                //   children: [
                                                //     Spacer(),
                                                //     CustomElevatedButton(
                                                //       backgroundColor:
                                                //           ColorValues
                                                //               .appRedColor,
                                                //       text: 'cancel',
                                                //       onPressed: () {
                                                //         // controller.AddInventory();
                                                //       },
                                                //     ),
                                                //     Dimens.boxWidth15,
                                                //     CustomElevatedButton(
                                                //       backgroundColor:
                                                //           ColorValues
                                                //               .appGreenColor,
                                                //       text: 'Submit',
                                                //       onPressed: () {
                                                //         controller
                                                //             .createCompliance();
                                                //       },
                                                //     ),
                                                //     Spacer()
                                                //   ],
                                                // ),
                                                Dimens.boxHeight15,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (controller.openIssueDatePicker)
                                  Positioned(
                                    left: 390,
                                    top: 190,
                                    child: DatePickerWidget(
                                      minDate: DateTime(DateTime.now().year),
                                      maxDate: DateTime(DateTime.now().year, 13,
                                          0), // last date of this year
                                      controller: DateRangePickerController(),
                                      selectionChanges: (p0) {
                                        print('po valu ${p0.value.toString()}');
                                        controller.issueDateTc.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(p0.value);
                                        controller.openIssueDatePicker =
                                            !controller.openIssueDatePicker;
                                        controller.isIssueDateInvalid.value =
                                            false;
                                        controller.update(['stock_Mangement']);
                                      },
                                    ),
                                  ),
                                if (controller.openExpireOnFDatePicker)
                                  Positioned(
                                    right: 190,
                                    top: 190,
                                    child: DatePickerWidget(
                                      minDate: DateTime(DateTime.now().year),
                                      maxDate: DateTime(DateTime.now().year, 13,
                                          0), // last date of this year
                                      controller: DateRangePickerController(),
                                      selectionChanges: (p0) {
                                        print('po valu ${p0.value.toString()}');
                                        controller.expireOnDateTc.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(p0.value);
                                        controller.openExpireOnFDatePicker =
                                            !controller.openExpireOnFDatePicker;
                                        controller.isExpiresonInvalid.value =
                                            false;
                                        controller.update(['stock_Mangement']);
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: Obx(() => varUserAccessModel
                              .value.access_list!
                              .where((e) =>
                                  e.feature_id ==
                                      UserAccessConstants.kGoodsFeatureId &&
                                  e.add == UserAccessConstants.kHaveAddAccess)
                              .length >
                          0
                      ? Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 40,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.cancelColor,
                                text: 'Cancel',
                                onPressed: () {
                                  Get.toNamed(
                                      Routes.stockManagementGoodsOrdersScreen);
                                },
                              ),
                            ),
                            Dimens.boxWidth15,
                            // controller.goId == 0
                            //     ?
                            Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.submitColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    // controller.isFormInvalid.value = false;
                                    controller.createCompliance();
                                  },
                                )),
                            Spacer(),
                          ],
                        )
                      : Dimens.box0)),
            ));
      },
    );
  }
}
