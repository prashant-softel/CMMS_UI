import 'package:cmms/app/add_water_data_per_day/add_water_data_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';

class AddWaterDataWeb extends StatefulWidget {
  AddWaterDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWaterDataWeb> createState() => _AddWaterDataWebState();
}

class _AddWaterDataWebState extends State<AddWaterDataWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddWaterDataController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Container(
              color: Color.fromARGB(255, 234, 236, 238),
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  HeaderWidget(),
                  AppBarGoodsOrder(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 245, 248, 250),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Add Water Data Per Day",
                                        style: Styles.blackBold16,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Day: '),
                                                  Dimens.boxWidth10,
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openPurchaseDatePicker =
                                                          !controller
                                                              .openPurchaseDatePicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController: controller
                                                        .purchaseDateTc,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Surface Water in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Ground Water in KL units : '),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth30,
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 236, 234, 234)
                                                .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Text(
                                          "Water Procured from Third Party for:",
                                          style: Styles.blue14),
                                      Dimens.boxHeight10,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Module cleaning in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Domestic and others purposes in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Drinking in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Domestic and others purposes in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 236, 234, 234)
                                                .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Text("Consumption  water used for:",
                                          style: Styles.blue14),
                                      Dimens.boxHeight10,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Drinking in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Module cleaning in KL unit'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Domestic and other purpose in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 236, 234, 234)
                                                .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Text("Total Water:",
                                          style: Styles.blue14),
                                      Dimens.boxHeight10,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Withdrawal in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Consumed in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 236, 234, 234)
                                                .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Dimens.boxHeight10,
                                      Text("Total Groundwater Withdrawal:",
                                          style: Styles.blue14),
                                      Dimens.boxHeight10,
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Yearly limit as per NOC in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Limit left in KL units'),
                                                  Dimens.boxWidth10,
                                                  LoginCustomTextfield(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    keyboardType:
                                                        TextInputType.number,

                                                    // textController:
                                                    //     controller.girNoCtrlr,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (controller.openPurchaseDatePicker)
                            Positioned(
                              left: 255,
                              top: 90,
                              child: DatePickerWidget(
                                minDate: DateTime(DateTime.now().year),
                                maxDate: DateTime(DateTime.now().year, 13,
                                    0), // last date of this year
                                controller: DateRangePickerController(),
                                selectionChanges: (p0) {
                                  print('po valu ${p0.value.toString()}');
                                  controller.purchaseDateTc.text =
                                      DateFormat('yyyy-MM-dd').format(p0.value);
                                  controller.openPurchaseDatePicker =
                                      !controller.openPurchaseDatePicker;
                                  controller.update(['stock_Mangement']);
                                },
                                onCancel: () {
                                  controller.openPurchaseDatePicker = false;
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
            floatingActionButton: Row(
              children: [
                Spacer(),
                Container(
                  height: 40,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.cancelColor,
                    text: 'Cancel',
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Dimens.boxWidth15,
                Container(
                  height: 40,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.submitColor,
                    text: 'Submit',
                    onPressed: () {
                      // controller.createGoodsOrder();
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
        // );
      },
    );
  }
}

class AppBarGoodsOrder extends StatelessWidget {
  const AppBarGoodsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 227, 224, 224),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
              Get.offNamed(Routes.misDashboard);
            },
            child: Text(" / MIS", style: Styles.greyLight14),
          ),
          Text(" /ADD WATER DATA", style: Styles.greyLight14),
        ],
      ),
    );
  }
}
