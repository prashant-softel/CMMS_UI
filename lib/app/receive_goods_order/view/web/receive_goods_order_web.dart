import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/receive_goods_order/receive_goods_order_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/approve_go_receive_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

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
          () => Scaffold(
            body: Container(
              color: Color.fromARGB(255, 234, 236, 238),
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
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
                        Text(
                          "DASHBOARD",
                          style: Styles.greyLight14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(" / STOCK MANAGEMENT",
                              style: Styles.greyMediumLight12),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(" / RECEIVE GOODS ORDER  erg",
                                style: Styles.greyMediumLight12)),
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
                                        controller.id == null
                                            ? Container()
                                            : Text(
                                                " Order ID :${controller.getPurchaseDetailsByIDModel.value?.id} ",
                                                style: Styles.blackBold16,
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
                                  Text(
                                    "Status :${controller.getPurchaseDetailsByIDModel.value?.status_long ?? ""} ",
                                    style: Styles.blackBold16,
                                  ),
                                  IgnorePointer(
                                    child: Container(
                                      margin: Dimens.edgeInsets20,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Dimens.boxWidth10,
                                                  CustomRichText(
                                                      title: 'Vendor: '),
                                                  Dimens.boxWidth10,
                                                  SizedBox(
                                                    child: DropdownWebStock(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      dropdownList:
                                                          controller.ownerList,
                                                      isValueSelected: controller
                                                          .isSelectedBusinessType
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedBusinessType
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Challan No.: '),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'P.O: '),
                                                  Dimens.boxWidth10,
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
                                                            controller.pOCtrlr,
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Frieght:To Pay /Paid : '),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'No. of Packages  received :'),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Condition of Packages Received : '),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'GIR. No. : '),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(children: [
                                                CustomRichText(
                                                    title: 'Amount : '),
                                                Dimens.boxWidth10,
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
                                                          .amountCtrlr,
                                                    )),
                                              ]),
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
                                                      title: 'Purchase Date :'),
                                                  Dimens.boxWidth10,
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
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Challan Date : '),
                                                  Dimens.boxWidth10,
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
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'PO Date  : '),
                                                  Dimens.boxWidth10,
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
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController:
                                                        controller.poDateDateTc,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Received Date  : '),
                                                  Dimens.boxWidth10,
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
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'L.R No.  : '),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Vehicle  No. : '),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Job Ref. : '),
                                                  Dimens.boxWidth10,
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
                                                      )),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
                                              Row(
                                                children: [
                                                  Dimens.boxWidth10,
                                                  CustomRichText(
                                                      title: 'Currency: '),
                                                  Dimens.boxWidth10,
                                                  SizedBox(
                                                    child: DropdownWebStock(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth30,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: Dimens.edgeInsets20, //height: 300,
                                    height:
                                        ((controller.goDetails!.value.length) *
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
                                          minWidth: 1000,
                                          dataRowHeight: 105,
                                          columnSpacing: 10,
                                          border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234)),
                                          columns: [
                                            DataColumn2(
                                                fixedWidth: 300,
                                                label: Text(
                                                  "Assets",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                fixedWidth: 250,
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
                                              "Cost",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                              "Ordered Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                              "Received  Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                //  fixedWidth: 300,
                                                label: Text(
                                              "Accepted Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                //  fixedWidth: 300,
                                                label: Text(
                                              "Damaged Items",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
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
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
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
                                                              // Row(
                                                              //   children: [
                                                              //     Text(
                                                              //         "Assets Code :"),
                                                              //     Text(
                                                              //         "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                                              //   ],
                                                              // ),
                                                              // Row(
                                                              //   children: [
                                                              //     Text(
                                                              //         "Assets type :"),
                                                              //     Text(
                                                              //         "${controller.dropdownMapperData[mapData['value']]?.asset_type ?? ''}")
                                                              //   ],
                                                              // ),
                                                              // Row(
                                                              //   children: [
                                                              //     Text(
                                                              //         "Assets Category :"),
                                                              //     Text(
                                                              //         "${controller.dropdownMapperData[mapData['value']]?.cat_name ?? ''}")
                                                              //   ],
                                                              // )
                                                            ],
                                                          ),
                                                        )
                                                      : (mapData['key'] ==
                                                              "Paid_By")
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                              child:
                                                                  IgnorePointer(
                                                                child:
                                                                    DropdownWebStock(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  dropdownList:
                                                                      controller
                                                                          .paid,
                                                                  selectedValue:
                                                                      mapData[
                                                                          "value"],
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
                                                                        (element) =>
                                                                            element.name ==
                                                                            selectedValue,
                                                                        orElse:
                                                                            null);
                                                                  },
                                                                ),
                                                              ),
                                                            )
                                                          : (mapData['key'] ==
                                                                      "Order") ||
                                                                  (mapData[
                                                                          'key'] ==
                                                                      "Cost")
                                                              ? Container(

                                                                  // padding: EdgeInsets.all(value),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      IgnorePointer(
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          .4),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      inputFormatters: <
                                                                          TextInputFormatter>[
                                                                        FilteringTextInputFormatter
                                                                            .digitsOnly
                                                                      ],
                                                                      maxLine:
                                                                          1,
                                                                      textController:
                                                                          new TextEditingController(
                                                                              text: mapData["value"] ?? ''),
                                                                      onChanged:
                                                                          (txt) {
                                                                        mapData["value"] =
                                                                            txt;
                                                                      },
                                                                    ),
                                                                  ))
                                                              : (mapData['key'] ==
                                                                          "Received") ||
                                                                      (mapData[
                                                                              'key'] ==
                                                                          "Accepted")
                                                                  ? Container(

                                                                      // padding: EdgeInsets.all(value),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.black26,
                                                                            offset:
                                                                                const Offset(
                                                                              5.0,
                                                                              5.0,
                                                                            ),
                                                                            blurRadius:
                                                                                5.0,
                                                                            spreadRadius:
                                                                                1.0,
                                                                          ),
                                                                        ],
                                                                        color: ColorValues
                                                                            .whiteColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          LoginCustomTextfield(
                                                                        width: (Get.width *
                                                                            .4),
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        inputFormatters: <
                                                                            TextInputFormatter>[
                                                                          FilteringTextInputFormatter
                                                                              .digitsOnly
                                                                        ],
                                                                        enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ||
                                                                                controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 ||
                                                                                controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0
                                                                            ? true
                                                                            : false,
                                                                        maxLine:
                                                                            1,
                                                                        textController:
                                                                            new TextEditingController(text: mapData["value"] ?? ''),
                                                                        onChanged:
                                                                            (txt) {
                                                                          mapData["value"] =
                                                                              txt;
                                                                        },
                                                                      ))
                                                                  :
                                                                  //  (mapData['key'] ==
                                                                  //         "Pending")
                                                                  //     ? Padding(
                                                                  //         padding:
                                                                  //             const EdgeInsets
                                                                  //                 .only(
                                                                  //           left:
                                                                  //               20,
                                                                  //           right:
                                                                  //               20,
                                                                  //         ),
                                                                  //         child:
                                                                  //             Checkbox(
                                                                  //           onChanged:
                                                                  //               (value) {},
                                                                  //           value:
                                                                  //               false,
                                                                  //         ))
                                                                  //     :
                                                                  (mapData['key'] ==
                                                                          "Damaged")
                                                                      ? Container(
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
                                                                            color:
                                                                                ColorValues.whiteColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              LoginCustomTextfield(
                                                                            width:
                                                                                (Get.width * .4),
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            inputFormatters: <TextInputFormatter>[
                                                                              FilteringTextInputFormatter.digitsOnly
                                                                            ],
                                                                            enabled: controller.getPurchaseDetailsByIDModel.value?.status == 306 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 307 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0 || controller.getPurchaseDetailsByIDModel.value?.status == 309 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0
                                                                                ? true
                                                                                : false,
                                                                            maxLine:
                                                                                1,
                                                                            textController:
                                                                                new TextEditingController(text: mapData["value"] ?? ''),
                                                                            onChanged:
                                                                                (txt) {
                                                                              mapData["value"] = txt;
                                                                            },
                                                                          ))
                                                                      : Text(mapData[
                                                                              'key'] ??
                                                                          ''),
                                                );
                                              }).toList(),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Dimens.boxHeight15,
                                ],
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
                Dimens.boxWidth15,
                controller.getPurchaseDetailsByIDModel.value?.status == 306 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == UserAccessConstants.kGoodsFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0 ||
                        controller.getPurchaseDetailsByIDModel.value?.status == 307 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == UserAccessConstants.kGoodsFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0 ||
                        controller.getPurchaseDetailsByIDModel.value?.status ==
                                309 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) => e.feature_id == UserAccessConstants.kGoodsFeatureId && e.add == UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0
                    ? Container(
                        height: 40,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.submitColor,
                          text: 'Submit for Approval',
                          onPressed: () {
                            controller.updateGOReceive();
                          },
                        ),
                      )
                    : Dimens.box0,
                Dimens.boxWidth15,
                Container(
                  height: 40,
                  child: CustomElevatedButton(
                    backgroundColor: Color(0xFF77CAE7),
                    text: 'Save as Drafts',
                    onPressed: () {
                      controller.updateGOReceiveIsSubmit0();
                    },
                  ),
                ),
                varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kGoodsFeatureId &&
                                e.approve ==
                                    UserAccessConstants.kHaveApproveAccess)
                            .length >
                        0
                    ? Container(
                        height: 45,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.submitColor,
                          text: 'Approve GO Receive',
                          // icon: Icons.add,
                          onPressed: () {
                            Get.dialog(ApproveGOReceiveDialog(
                              id: controller.id.value,
                            ));
                          },
                        ),
                      )
                    : Dimens.box0,

                Dimens.boxWidth15,
                varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kGoodsFeatureId &&
                                e.approve ==
                                    UserAccessConstants.kHaveApproveAccess)
                            .length >
                        0
                    ? Container(
                        height: 40,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.rejectColor,
                          text: 'Reject GO Receive',
                          onPressed: () {
                            Get.dialog(RejectGOReceiveDialog(
                              id: controller.id.value,
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
        );
      },
    );
  }
}
