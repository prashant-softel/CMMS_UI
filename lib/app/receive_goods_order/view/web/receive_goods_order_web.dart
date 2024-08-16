import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/receive_goods_order/receive_goods_order_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/approve_go_receive_dialog.dart';
import 'package:cmms/app/widgets/close_goods_order_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../widgets/reject_go_receive_dialog.dart';

class ReceiveGoodsOrderWeb extends StatefulWidget {
  ReceiveGoodsOrderWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ReceiveGoodsOrderWeb> createState() => _ReceiveGoodsOrderWebState();
}

class _ReceiveGoodsOrderWebState extends State<ReceiveGoodsOrderWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiveGoodsOrdersController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(
          () => SelectionArea(
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
                              Get.offNamed(
                                  Routes.stockManagementGoodsOrdersScreen);
                            },
                            child: Text(" / STOCK MANAGEMENT",
                                style: Styles.greyLight14),
                          ),
                          Text(" / RECEIVE GOODS ORDER",
                              style: Styles.greyLight14),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
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
                                            "Receive Goods Order",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 5),
                                              margin: EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                color: controller
                                                            .getPurchaseDetailsByIDModel
                                                            .value
                                                            ?.status ==
                                                        302
                                                    ? ColorValues.createsColor
                                                    : controller
                                                                .getPurchaseDetailsByIDModel
                                                                .value
                                                                ?.status ==
                                                            301
                                                        ? ColorValues.draftColor
                                                        : controller
                                                                    .getPurchaseDetailsByIDModel
                                                                    .value
                                                                    ?.status ==
                                                                305
                                                            ? Color.fromARGB(
                                                                255, 181, 129, 179)
                                                            : controller
                                                                        .getPurchaseDetailsByIDModel
                                                                        .value
                                                                        ?.status ==
                                                                    309
                                                                ? Color.fromARGB(
                                                                    255,
                                                                    181,
                                                                    129,
                                                                    179)
                                                                : controller
                                                                            .getPurchaseDetailsByIDModel
                                                                            .value
                                                                            ?.status ==
                                                                        306
                                                                    ? ColorValues
                                                                        .approveColor
                                                                    : controller.getPurchaseDetailsByIDModel.value?.status ==
                                                                            304
                                                                        ? ColorValues.appPurpleColor
                                                                        : ColorValues.lightBlueColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                " ${controller.getPurchaseDetailsByIDModel.value?.status_short ?? ""}",
                                              )),
                                          controller.goId == null
                                              ? Container()
                                              : Text(
                                                  " Order ID :${controller.getPurchaseDetailsByIDModel.value?.id} ",
                                                )

                                          // ActionButton(
                                          //   icon: Icons.menu,
                                          //   label: "User List",
                                          //   onPressed: () {
                                          //     Get.offNamed(Routes.userList);
                                          //   },
                                          //   color: ColorValues.greenlightColor,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: ColorValues.greyLightColour,
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 5),
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color: controller
                                                      .getPurchaseDetailsByIDModel
                                                      .value
                                                      ?.status ==
                                                  302
                                              ? ColorValues.createsColor
                                              : controller.getPurchaseDetailsByIDModel
                                                          .value?.status ==
                                                      301
                                                  ? ColorValues.draftColor
                                                  : controller.getPurchaseDetailsByIDModel
                                                              .value?.status ==
                                                          305
                                                      ? Color.fromARGB(
                                                          255, 181, 129, 179)
                                                      : controller
                                                                  .getPurchaseDetailsByIDModel
                                                                  .value
                                                                  ?.status ==
                                                              309
                                                          ? Color.fromARGB(
                                                              255, 181, 129, 179)
                                                          : controller
                                                                      .getPurchaseDetailsByIDModel
                                                                      .value
                                                                      ?.status ==
                                                                  306
                                                              ? ColorValues
                                                                  .approveColor
                                                              : controller
                                                                          .getPurchaseDetailsByIDModel
                                                                          .value
                                                                          ?.status ==
                                                                      304
                                                                  ? ColorValues.appPurpleColor
                                                                  : ColorValues.lightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Obx(
                                          () => Text(
                                            "Status :${controller.getPurchaseDetailsByIDModel.value?.status_long ?? ""} ",
                                          ),
                                        )),
                                    Container(
                                      margin: Dimens.edgeInsets20,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              IgnorePointer(
                                                child: Row(
                                                  children: [
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 8),
                                                    CustomRichText(
                                                        title: 'Vendor: '),

                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 8),
                                                    SizedBox(
                                                      child: DropdownWebStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        dropdownList: controller
                                                            .ownerList,
                                                        isValueSelected: controller
                                                            .isSelectedBusinessType
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedBusinessType
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
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
                                                        title: 'P.O No: '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    227,
                                                                    224,
                                                                    224),
                                                            width: 1,
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          236,
                                                                          234,
                                                                          234)
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 2,
                                                              blurRadius: 5,
                                                              offset:
                                                                  Offset(0, 2),
                                                            ),
                                                          ],
                                                        ),
                                                        width: (MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .2),
                                                        child:
                                                            LoginCustomTextfield(
                                                          textController:
                                                              controller
                                                                  .pOCtrlr,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              IgnorePointer(
                                                child: Row(children: [
                                                  CustomRichText(
                                                      title: 'Amount : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController:
                                                            controller
                                                                .amountCtrlr,
                                                      )),
                                                ]),
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Invoice number : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController:
                                                            controller
                                                                .challanNoCtrlr,
                                                        // validate
                                                        errorController: controller
                                                                .isInvoiceNumberInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,

                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isInvoiceNumberInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isInvoiceNumberInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      )),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Delivery Challan : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController: controller
                                                            .frieghtToPayPaidCtrlr,
                                                        errorController: controller
                                                                .isDeliverChalanInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isDeliverChalanInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isDeliverChalanInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      )),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Count of Package received :'),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController: controller
                                                            .noOfPackagesReceivedCtrlr,
                                                        errorController: controller
                                                                .isCountOfPackageReceivedInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isCountOfPackageReceivedInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isCountOfPackageReceivedInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      )),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Vehicle No. : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController:
                                                            controller
                                                                .vehicleNoCtrlr,
                                                        errorController: controller
                                                                .isVehicalInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isVehicalInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isVehicalInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      )),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Gate Inward Register number : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController: controller
                                                            .conditionOfPackagesReceivedCtrlr,
                                                        errorController: controller
                                                                .isGateInwardRegisterInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isGateInwardRegisterInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isGateInwardRegisterInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      )),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(children: [
                                                CustomRichText(
                                                    title: 'Freight : '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                                  255,
                                                                  236,
                                                                  234,
                                                                  234)
                                                              .withOpacity(0.5),
                                                          spreadRadius: 2,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                      textController: controller
                                                          .freightValueCtrlr,
                                                      errorController: controller
                                                              .isFreightInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,
                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isFreightInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isFreightInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                    )),
                                              ]),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              IgnorePointer(
                                                child: Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'PO Date  : '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    CustomTextFieldForStock(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5.1,
                                                      numberTextField: true,
                                                      onTap: () {
                                                        controller
                                                                .openPODatePicker =
                                                            !controller
                                                                .openPODatePicker;
                                                        controller.update([
                                                          'stock_Mangement'
                                                        ]);
                                                      },
                                                      textController: controller
                                                          .poDateDateTc,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              IgnorePointer(
                                                child: Row(
                                                  children: [
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    CustomRichText(
                                                        title: 'Currency: '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    SizedBox(
                                                      child: DropdownWebStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        dropdownList: controller
                                                            .unitCurrencyList,
                                                        isValueSelected: controller
                                                            .isUnitCurrencySelected
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedUnitCurrency
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'GRN No. : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                              textController:
                                                                  controller
                                                                      .girNoCtrlr,
                                                              errorController:
                                                                  controller
                                                                          .isGrnNoInvalid
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
                                                                      .isGrnNoInvalid
                                                                      .value = false;
                                                                } else {
                                                                  controller
                                                                      .isGrnNoInvalid
                                                                      .value = true;
                                                                }
                                                              })),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Invoice Date : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.1,
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
                                                    errorController: controller
                                                            .isInvoiceDateInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          0) {
                                                        controller
                                                            .isInvoiceDateInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isInvoiceDateInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),

                                              // Row(
                                              //   children: [
                                              //     CustomRichText(
                                              //         title:
                                              //             'Challan Date : '),
                                              //     Dimens.boxWidth10,
                                              //     CustomTextFieldForStock(
                                              //       width:
                                              //           MediaQuery.of(context)
                                              //                   .size
                                              //                   .width /
                                              //               5.1,
                                              //       numberTextField: true,
                                              //       onTap: () {
                                              //         controller
                                              //                 .openChallanDatePicker =
                                              //             !controller
                                              //                 .openChallanDatePicker;
                                              //         controller.update([
                                              //           'stock_Mangement'
                                              //         ]);
                                              //       },
                                              //       textController: controller
                                              //           .challanDateTc,
                                              //     ),
                                              //   ],
                                              // ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),

                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Delivery Challan Date : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.1,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openChallanDatePicker =
                                                          !controller
                                                              .openChallanDatePicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController: controller
                                                        .challanDateTc,
                                                    errorController: controller
                                                            .isDeliveryChallanDateInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          0) {
                                                        controller
                                                            .isDeliveryChallanDateInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isDeliveryChallanDateInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Material Receive Date : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.1,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openReceivedPicker =
                                                          !controller
                                                              .openReceivedPicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController: controller
                                                        .receivedDateTc,
                                                    errorController: controller
                                                            .isMaterialReciveDateInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          0) {
                                                        controller
                                                            .isMaterialReciveDateInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isMaterialReciveDateInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'L.R No.  : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController:
                                                            controller
                                                                .lrNoCtrlr,
                                                        errorController: controller
                                                                .isLrNoInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isLrNoInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isLrNoInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      )),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'E way bill : '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child:
                                                          LoginCustomTextfield(
                                                        textController:
                                                            controller
                                                                .jobRefCtrlr,
                                                        errorController: controller
                                                                .isEWayBillInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isEWayBillInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isEWayBillInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      )),
                                                ],
                                              ),
                                              // Dimens.boxHeight5,
                                              SizedBox(height: 5),

                                              Row(children: [
                                                CustomRichText(
                                                    title:
                                                        'Inspection Report : '),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                                  255,
                                                                  236,
                                                                  234,
                                                                  234)
                                                              .withOpacity(0.5),
                                                          spreadRadius: 2,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: LoginCustomTextfield(
                                                      textController: controller
                                                          .inspectionReportCtrlr,
                                                      errorController: controller
                                                              .isInspectionReportInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,
                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isInspectionReportInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isInspectionReportInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                    )),
                                              ]),
                                            ],
                                          ),
                                          // Dimens.boxWidth30,
                                          SizedBox(width: 30),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          Dimens.edgeInsets20, //height: 300,
                                      height: ((controller
                                                  .goDetails!.value.length) *
                                              80) +
                                          170,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35,
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorValues
                                                .appBlueBackgroundColor,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Selects Assets ",
                                                style: Styles.blue700,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: DataTable2(
                                            minWidth: 2000,
                                            dataRowHeight: 120,
                                            columnSpacing: 10,
                                            border: TableBorder.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234)),
                                            columns: [
                                              DataColumn2(
                                                  fixedWidth: 400,
                                                  label: Text(
                                                    "Assets",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              DataColumn2(
                                                  fixedWidth: 150,
                                                  label: Text(
                                                    "Paid By",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                "Requested  Qty",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                "Unit Cost",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                "Dispatch Qty",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                "Received  Qty",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 300,
                                                  label: Text(
                                                "Accepted Qty",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 300,
                                                  label: Text(
                                                "Damaged Items",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 300,
                                                  label: Text(
                                                "Rack No",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 300,
                                                  label: Text(
                                                "Row No",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 300,
                                                  label: Text(
                                                "Column No",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            rows: controller.rowItem.value
                                                .map((record) {
                                              return DataRow(
                                                // height: 130,
                                                cells: record.map((mapData) {
                                                  return DataCell(
                                                    (mapData['key'] ==
                                                            "Drop_down")
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 10,
                                                                    right: 10,
                                                                    top: 10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                IgnorePointer(
                                                                  child:
                                                                      DropdownWebStock(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    dropdownList:
                                                                        controller
                                                                            .assetList,
                                                                    selectedValue:
                                                                        mapData[
                                                                            "value"],
                                                                    onValueChanged:
                                                                        (list,
                                                                            selectedValue) {
                                                                      print(
                                                                          'paifcghb:${controller.assetList}');
                                                                      print({
                                                                        selectedValue:
                                                                            selectedValue
                                                                      });
                                                                      mapData["value"] =
                                                                          selectedValue;
                                                                      controller.dropdownMapperData[selectedValue] = list.firstWhere(
                                                                          (element) =>
                                                                              element.name ==
                                                                              selectedValue,
                                                                          orElse:
                                                                              null);
                                                                    },
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Assets Code :"),
                                                                    Text(
                                                                        "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Assets type :"),
                                                                    Text(
                                                                        "${controller.dropdownMapperData[mapData['value']]?.asset_type ?? ''}")
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Assets Category :"),
                                                                    Text(
                                                                        "${controller.dropdownMapperData[mapData['value']]?.cat_name ?? ''}")
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : (mapData['key'] ==
                                                                "Paid_By")
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        top:
                                                                            10),
                                                                child:
                                                                    IgnorePointer(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      DropdownWebStock(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        dropdownList:
                                                                            controller.paid,
                                                                        selectedValue:
                                                                            mapData["value"],
                                                                        onValueChanged:
                                                                            (list,
                                                                                selectedValue) {
                                                                          print(
                                                                              'paifcghb:${controller.paid}');
                                                                          print({
                                                                            selectedValue:
                                                                                selectedValue
                                                                          });
                                                                          mapData["value"] =
                                                                              selectedValue;
                                                                          controller.paiddropdownMapperData[selectedValue] = list.firstWhere(
                                                                              (element) => element.name == selectedValue,
                                                                              orElse: null);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            : (mapData['key'] ==
                                                                        "Order") ||
                                                                    (mapData[
                                                                            'key'] ==
                                                                        "Cost")
                                                                ? Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                10),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(

                                                                            // padding: EdgeInsets.all(value),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.black26,
                                                                                  offset: const Offset(
                                                                                    5.0,
                                                                                    5.0,
                                                                                  ),
                                                                                  blurRadius: 5.0,
                                                                                  spreadRadius: 1.0,
                                                                                ),
                                                                              ],
                                                                              color: ColorValues.whiteColor,
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            child:
                                                                                IgnorePointer(
                                                                              child: LoginCustomTextfield(
                                                                                width: (Get.width * .4),
                                                                                keyboardType: TextInputType.number,
                                                                                inputFormatters: <TextInputFormatter>[
                                                                                  FilteringTextInputFormatter.digitsOnly
                                                                                ],
                                                                                maxLine: 1,
                                                                                // errorController: controller.isCostInvalid.value ? "Required field" : null,
                                                                                textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                onChanged: (txt) {
                                                                                  mapData["value"] = txt;
                                                                                  // if (txt.trim().isNotEmpty) {
                                                                                  //   controller.isCostInvalid.value = false;
                                                                                  // } else {
                                                                                  //   controller.isCostInvalid.value = true;
                                                                                  // }
                                                                                },
                                                                              ),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Received")
                                                                    ? Padding(
                                                                        padding:
                                                                            EdgeInsets.only(top: 10),
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              // padding: EdgeInsets.all(value),
                                                                              decoration: BoxDecoration(
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    color: Colors.black26,
                                                                                    offset: const Offset(
                                                                                      5.0,
                                                                                      5.0,
                                                                                    ),
                                                                                    blurRadius: 5.0,
                                                                                    spreadRadius: 1.0,
                                                                                  ),
                                                                                ],
                                                                                color: ColorValues.whiteColor,
                                                                                borderRadius: BorderRadius.circular(5),
                                                                              ),
                                                                              child: LoginCustomTextfield(
                                                                                width: (Get.width * .4),
                                                                                keyboardType: TextInputType.number,
                                                                                inputFormatters: <TextInputFormatter>[
                                                                                  FilteringTextInputFormatter.digitsOnly
                                                                                ],
                                                                                enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                maxLine: 1,
                                                                                textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                onChanged: (txt) {
                                                                                  mapData["value"] = txt;
                                                                                },
                                                                              ),
                                                                            ),
                                                                            // Dimens.boxHeight10,
                                                                            SizedBox(height: 10),
                                                                            controller.dropdownMapperData[record[0]['value']]?.asset_type == "Spare"
                                                                                ? Text(
                                                                                    "Sr No",
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                  )
                                                                                : Dimens.box0,
                                                                            controller.dropdownMapperData[record[0]['value']]?.asset_type == "Spare"
                                                                                ? Container(
                                                                                    // padding: EdgeInsets.all(value),
                                                                                    decoration: BoxDecoration(
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          color: Colors.black26,
                                                                                          offset: const Offset(
                                                                                            5.0,
                                                                                            5.0,
                                                                                          ),
                                                                                          blurRadius: 5.0,
                                                                                          spreadRadius: 1.0,
                                                                                        ),
                                                                                      ],
                                                                                      color: ColorValues.whiteColor,
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                    ),
                                                                                    child: LoginCustomTextfield(
                                                                                      width: (Get.width * .4),
                                                                                      enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                      maxLine: 1,
                                                                                      textController: new TextEditingController(text: mapData["sr_no"] ?? ''),
                                                                                      onChanged: (txt) {
                                                                                        mapData["sr_no"] = txt;
                                                                                      },
                                                                                    ),
                                                                                  )
                                                                                : Dimens.box0,
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : (mapData['key'] ==
                                                                            "storage_column_no")
                                                                        ? Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 10),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  // padding: EdgeInsets.all(value),
                                                                                  decoration: BoxDecoration(
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        color: Colors.black26,
                                                                                        offset: const Offset(
                                                                                          5.0,
                                                                                          5.0,
                                                                                        ),
                                                                                        blurRadius: 5.0,
                                                                                        spreadRadius: 1.0,
                                                                                      ),
                                                                                    ],
                                                                                    color: ColorValues.whiteColor,
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                  ),
                                                                                  child: LoginCustomTextfield(
                                                                                    width: (Get.width * .4),
                                                                                    keyboardType: TextInputType.number,
                                                                                    inputFormatters: <TextInputFormatter>[
                                                                                      FilteringTextInputFormatter.digitsOnly
                                                                                    ],
                                                                                    enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                    maxLine: 1,
                                                                                    textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                    onChanged: (txt) {
                                                                                      mapData["value"] = txt;
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "storage_row_no")
                                                                            ? Padding(
                                                                                padding: EdgeInsets.only(top: 10),
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      // padding: EdgeInsets.all(value),
                                                                                      decoration: BoxDecoration(
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            color: Colors.black26,
                                                                                            offset: const Offset(
                                                                                              5.0,
                                                                                              5.0,
                                                                                            ),
                                                                                            blurRadius: 5.0,
                                                                                            spreadRadius: 1.0,
                                                                                          ),
                                                                                        ],
                                                                                        color: ColorValues.whiteColor,
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                      ),
                                                                                      child: LoginCustomTextfield(
                                                                                        width: (Get.width * .4),
                                                                                        keyboardType: TextInputType.number,
                                                                                        inputFormatters: <TextInputFormatter>[
                                                                                          FilteringTextInputFormatter.digitsOnly
                                                                                        ],
                                                                                        enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                        maxLine: 1,
                                                                                        textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                        onChanged: (txt) {
                                                                                          mapData["value"] = txt;
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    // Dimens.boxHeight30,
                                                                                    SizedBox(height: 30),
                                                                                    controller.dropdownMapperData[record[0]['value']]?.asset_type == "Spare"
                                                                                        ? Container(
                                                                                            // padding: EdgeInsets.all(value),
                                                                                            decoration: BoxDecoration(
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  color: Colors.black26,
                                                                                                  offset: const Offset(
                                                                                                    5.0,
                                                                                                    5.0,
                                                                                                  ),
                                                                                                  blurRadius: 5.0,
                                                                                                  spreadRadius: 1.0,
                                                                                                ),
                                                                                              ],
                                                                                              color: ColorValues.whiteColor,
                                                                                              borderRadius: BorderRadius.circular(5),
                                                                                            ),
                                                                                            child: LoginCustomTextfield(
                                                                                              width: (Get.width * .4),
                                                                                              enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                              maxLine: 1,
                                                                                              textController: new TextEditingController(text: mapData["sr_no"] ?? ''),
                                                                                              onChanged: (txt) {
                                                                                                mapData["sr_no"] = txt;
                                                                                              },
                                                                                            ),
                                                                                          )
                                                                                        : Dimens.box0,
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            : (mapData['key'] == "storage_rack_no")
                                                                                ? Padding(
                                                                                    padding: EdgeInsets.only(top: 10),
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          // padding: EdgeInsets.all(value),
                                                                                          decoration: BoxDecoration(
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                color: Colors.black26,
                                                                                                offset: const Offset(
                                                                                                  5.0,
                                                                                                  5.0,
                                                                                                ),
                                                                                                blurRadius: 5.0,
                                                                                                spreadRadius: 1.0,
                                                                                              ),
                                                                                            ],
                                                                                            color: ColorValues.whiteColor,
                                                                                            borderRadius: BorderRadius.circular(5),
                                                                                          ),
                                                                                          child: LoginCustomTextfield(
                                                                                            width: (Get.width * .4),
                                                                                            keyboardType: TextInputType.number,
                                                                                            inputFormatters: <TextInputFormatter>[
                                                                                              FilteringTextInputFormatter.digitsOnly
                                                                                            ],
                                                                                            enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                            maxLine: 1,
                                                                                            textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                            onChanged: (txt) {
                                                                                              mapData["value"] = txt;
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  )
                                                                                : (mapData['key'] == "Accepted")
                                                                                    ? Padding(
                                                                                        padding: EdgeInsets.only(top: 10),
                                                                                        child: Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(

                                                                                                // padding: EdgeInsets.all(value),
                                                                                                decoration: BoxDecoration(
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      color: Colors.black26,
                                                                                                      offset: const Offset(
                                                                                                        5.0,
                                                                                                        5.0,
                                                                                                      ),
                                                                                                      blurRadius: 5.0,
                                                                                                      spreadRadius: 1.0,
                                                                                                    ),
                                                                                                  ],
                                                                                                  color: ColorValues.whiteColor,
                                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                                ),
                                                                                                child: LoginCustomTextfield(
                                                                                                  width: (Get.width * .4),
                                                                                                  keyboardType: TextInputType.number,
                                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                                    FilteringTextInputFormatter.digitsOnly
                                                                                                  ],
                                                                                                  enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                                  maxLine: 1,
                                                                                                  // errorController: controller.isAccepetedInvalid.value ? "Required field" : null,
                                                                                                  textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                                  onChanged: (txt) {
                                                                                                    mapData["value"] = txt;
                                                                                                    // if (txt.trim().isNotEmpty) {
                                                                                                    //   controller.isAccepetedInvalid.value = false;
                                                                                                    // } else {
                                                                                                    //   controller.isAccepetedInvalid.value = true;
                                                                                                    // }
                                                                                                  },
                                                                                                )),
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                    : (mapData['key'] == "Damaged")
                                                                                        ? Padding(
                                                                                            padding: const EdgeInsets.only(top: 10),
                                                                                            child: Column(
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      boxShadow: [
                                                                                                        BoxShadow(
                                                                                                          color: Colors.black26,
                                                                                                          offset: const Offset(
                                                                                                            5.0,
                                                                                                            5.0,
                                                                                                          ),
                                                                                                          blurRadius: 5.0,
                                                                                                          spreadRadius: 1.0,
                                                                                                        ),
                                                                                                      ],
                                                                                                      color: ColorValues.whiteColor,
                                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                                    ),
                                                                                                    child: LoginCustomTextfield(
                                                                                                      width: (Get.width * .4),
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      inputFormatters: <TextInputFormatter>[
                                                                                                        FilteringTextInputFormatter.digitsOnly
                                                                                                      ],
                                                                                                      enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                                      maxLine: 1,
                                                                                                      textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                                      onChanged: (txt) {
                                                                                                        mapData["value"] = txt;
                                                                                                      },
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                          )
                                                                                        : (mapData['key'] == "Requested")
                                                                                            ? Padding(
                                                                                                padding: const EdgeInsets.only(top: 10),
                                                                                                child: Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        boxShadow: [
                                                                                                          BoxShadow(
                                                                                                            color: Colors.black26,
                                                                                                            offset: const Offset(
                                                                                                              5.0,
                                                                                                              5.0,
                                                                                                            ),
                                                                                                            blurRadius: 5.0,
                                                                                                            spreadRadius: 1.0,
                                                                                                          ),
                                                                                                        ],
                                                                                                        color: ColorValues.whiteColor,
                                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                                      ),
                                                                                                      child: LoginCustomTextfield(
                                                                                                        width: (Get.width * .4),
                                                                                                        keyboardType: TextInputType.number,
                                                                                                        inputFormatters: <TextInputFormatter>[
                                                                                                          FilteringTextInputFormatter.digitsOnly
                                                                                                        ],
                                                                                                        enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ? true : false,
                                                                                                        maxLine: 1,
                                                                                                        // errorController: controller.isRequestedInvalid.value ? "Required field" : null,
                                                                                                        textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                                        onChanged: (txt) {
                                                                                                          mapData["value"] = txt;
                                                                                                          // if (txt.trim().isNotEmpty) {
                                                                                                          //   controller.isCostInvalid.value = false;
                                                                                                          // } else {
                                                                                                          //   controller.isCostInvalid.value = true;
                                                                                                          // }
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              )
                                                                                            : Text(mapData['key'] ?? ''),
                                                  );
                                                }).toList(),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    // Dimens.boxHeight15,
                                    SizedBox(height: 15),
                                    controller.historyList!.isEmpty
                                        ? Dimens.box0
                                        : Container(
                                            margin: Dimens.edgeInsets20,
                                            height: ((controller.historyList
                                                            ?.length ??
                                                        0) *
                                                    50) +
                                                125,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: ColorValues
                                                    .lightGreyColorWithOpacity35,
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: ColorValues
                                                      .appBlueBackgroundColor,
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Goods Order History ",
                                                        style: Styles.blue700,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: ColorValues
                                                      .greyLightColour,
                                                ),
                                                Expanded(
                                                  child: DataTable2(
                                                    border: TableBorder.all(
                                                        color: Color.fromARGB(
                                                            255,
                                                            206,
                                                            229,
                                                            234)),
                                                    columns: [
                                                      DataColumn(
                                                          label: Text(
                                                        "Time Stamp",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Posted By",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Comment",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Location",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn(
                                                          label: Text(
                                                        "Status",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                    ],
                                                    rows:
                                                        List<DataRow>.generate(
                                                      controller.historyList
                                                              ?.length ??
                                                          0,
                                                      (index) =>
                                                          DataRow(cells: [
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.createdAt
                                                                ?.result
                                                                .toString() ??
                                                            '')),
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.createdByName
                                                                .toString() ??
                                                            '')),
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.comment
                                                                .toString() ??
                                                            '')),
                                                        DataCell(Text('--')),
                                                        DataCell(Text(controller
                                                                .historyList?[
                                                                    index]
                                                                ?.status_name
                                                                .toString() ??
                                                            '')),
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              if (controller.openPurchaseDatePicker)
                                Positioned(
                                  right: 60,
                                  top: 130,
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate: DateTime(DateTime.now().year, 13,
                                        0), // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.purchaseDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openPurchaseDatePicker = false;
                                      controller.isInvoiceDateInvalid.value =
                                          false;

                                      controller.update(['stock_Mangement']);
                                    },
                                       onCancel: () {
                                  controller.openPurchaseDatePicker =
                                      false;
                                  controller.update(['stock_Mangement']);
                                },
                                  ),
                                ),
                              if (controller.openChallanDatePicker)
                                Positioned(
                                  right: 65,
                                  top: 170,
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate: DateTime(DateTime.now().year, 13,
                                        0), // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.challanDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openChallanDatePicker = false;
                                      controller.isDeliveryChallanDateInvalid
                                          .value = false;
                                      controller.update(['stock_Mangement']);
                                    },
                                     onCancel: () {
                                  controller.openChallanDatePicker =
                                      false;
                                  controller.update(['stock_Mangement']);
                                },
                                  ),
                                ),
                              if (controller.openPODatePicker)
                                Positioned(
                                  right: 210,
                                  top: 110,
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate: DateTime(DateTime.now().year, 13,
                                        0), // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.poDateDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openPODatePicker =
                                          !controller.openPODatePicker;

                                      controller.update(['stock_Mangement']);
                                    },
                                    onCancel: () {
                                      controller.openPODatePicker = false;
                                      controller.update(['stock_Mangement']);
                                    },
                                  ),
                                ),
                              if (controller.openReceivedPicker)
                                Positioned(
                                  right: 65,
                                  top: 230,
                                  child: DatePickerWidget(
                                    // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.receivedDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);

                                      controller.openReceivedPicker = false;
                                      controller.isMaterialReciveDateInvalid
                                          .value = false;
                                      controller.update(['stock_Mangement']);
                                    },
                                    onCancel: () {
                                      controller.openReceivedPicker = false;
                                      controller.update(['stock_Mangement']);
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: Row(
                children: [
                  Spacer(),
                  // Container(
                  //   height: 40,
                  //   child: CustomElevatedButton(
                  //     backgroundColor: ColorValues.printColor,
                  //     text: 'Print',
                  //     onPressed: () {
                  //       // controller.AddInventory();
                  //     },
                  //   ),
                  // ),

                  // controller.getPurchaseDetailsByIDModel.value?.status == 307
                  //     ?
                  // Container(
                  //   height: 40,
                  //   child: CustomElevatedButton(
                  //     backgroundColor: Color(0xff77cae7),
                  //     text: 'Save as Draft',
                  //     onPressed: () {
                  //       // controller.AddInventory();
                  //     },
                  //   ),
                  // ),
                  // Dimens.boxWidth15,
                  SizedBox(width: 15),
                  controller.getPurchaseDetailsByIDModel.value?.status ==
                                  306 &&
                              varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length >
                                  0 ||
                          controller.getPurchaseDetailsByIDModel.value?.status == 307 &&
                              varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id == UserAccessConstants.kGoodsFeatureId &&
                                          e.add ==
                                              UserAccessConstants
                                                  .kHaveAddAccess)
                                      .length >
                                  0 ||
                          controller.getPurchaseDetailsByIDModel.value?.status ==
                                  309 &&
                              varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants.kGoodsFeatureId &&
                                          e.add == UserAccessConstants.kHaveAddAccess)
                                      .length >
                                  0
                      ? Container(
                          height: 45,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.submitColor,
                            text: 'Submit for Approval',
                            onPressed: () {
                              controller.updateGOReceive();
                            },
                          ),
                        )
                      : Dimens.box0,

                  // Dimens.boxWidth15,
                  SizedBox(width: 15),
                  controller.getPurchaseDetailsByIDModel.value?.status ==
                                  306 &&
                              varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length >
                                  0 ||
                          controller.getPurchaseDetailsByIDModel.value?.status == 307 &&
                              varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id == UserAccessConstants.kGoodsFeatureId &&
                                          e.add ==
                                              UserAccessConstants
                                                  .kHaveAddAccess)
                                      .length >
                                  0 ||
                          controller.getPurchaseDetailsByIDModel.value?.status ==
                                  309 &&
                              varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants.kGoodsFeatureId &&
                                          e.add == UserAccessConstants.kHaveAddAccess)
                                      .length >
                                  0
                      ? Container(
                          height: 45,
                          child: CustomElevatedButton(
                            backgroundColor: Color(0xFF77CAE7),
                            text: 'Save as Drafts',
                            onPressed: () {
                              controller.updateGOReceiveIsSubmit0();
                            },
                          ),
                        )
                      : Dimens.box0,
                  // Dimens.boxWidth10,
                  SizedBox(width: 10),
                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants.kGoodsFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0 &&
                          controller
                                  .getPurchaseDetailsByIDModel.value?.status ==
                              308
                      ? Container(
                          height: 45,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.submitColor,
                            text: 'Approve GO Receive',
                            // icon: Icons.add,
                            onPressed: () {
                              Get.dialog(ApproveGOReceiveDialog(
                                id: controller.goId.value,
                              ));
                            },
                          ),
                        )
                      : Dimens.box0,

                  // Dimens.boxWidth15,
                  SizedBox(width: 15),
                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants.kGoodsFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0 &&
                          controller
                                  .getPurchaseDetailsByIDModel.value?.status ==
                              308
                      ? Container(
                          height: 45,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.rejectColor,
                            text: 'Reject GO Receive',
                            onPressed: () {
                              Get.dialog(RejectGOReceiveDialog(
                                id: controller.goId.value,
                              ));
                            },
                          ),
                        )
                      : Dimens.box0,
                  controller.getPurchaseDetailsByIDModel.value?.status == 310 &&
                          varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants.kGoodsFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .length >
                              0
                      ? Container(
                          height: 45,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.rejectColor,
                            text: "Close",
                            icon: Icons.close,
                            onPressed: () {
                              Get.dialog(GoodsOrderCloseDialog(
                                id: controller.goId.value,
                              ));
                            },
                          ),
                        )
                      : Dimens.box0,

                  // :
                  // Container(),
                  Spacer()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
