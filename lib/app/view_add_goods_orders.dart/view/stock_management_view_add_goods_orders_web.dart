import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_add_goods_orders.dart/stock_management_view_add_goods_orders_controller.dart';
import 'package:cmms/app/widgets/close_goods_order_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/goods_order_approve_dialog.dart';
import 'package:cmms/app/widgets/goods_order_reject_dialog.dart';

import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';

class ViewAddGoodsOrdersWeb extends StatefulWidget {
  ViewAddGoodsOrdersWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAddGoodsOrdersWeb> createState() => _ViewAddGoodsOrdersWebState();
}

class _ViewAddGoodsOrdersWebState extends State<ViewAddGoodsOrdersWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAddGoodsOrdersController>(
        id: 'stock_Mangement',
        builder: (controller) {
          return Obx(
            () => Container(
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
                          child: Text(
                              " / STOCK MANAGEMENT1${controller.getPurchaseDetailsByIDModel.value?.status}",
                              style: Styles.greyMediumLight12),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(" /  VIEW GOODS ORDER DETAILS",
                                style: Styles.greyMediumLight12)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(children: [
                        Container(
                          color: Color.fromARGB(255, 245, 248, 250),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "View Goods Order Details",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    Text(
                                      " Order ID :${controller.getPurchaseDetailsByIDModel.value?.id} ",
                                    ),
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
                                              CustomRichText(title: 'Vendor: '),
                                              Dimens.boxWidth10,
                                              SizedBox(
                                                child: DropdownWebStock(
                                                  width: MediaQuery.of(context)
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
                                                  onValueChanged:
                                                      controller.onValueChanged,
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .challanNoCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              CustomRichText(title: 'P.O: '),
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    textController:
                                                        controller.girNoCtrlr,
                                                  )),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(children: [
                                            CustomRichText(title: 'Amount : '),
                                            Dimens.boxWidth10,
                                            Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 227, 224, 224),
                                                    width: 1,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
                                                child: LoginCustomTextfield(
                                                  textController:
                                                      controller.amountCtrlr,
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
                                                width: MediaQuery.of(context)
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
                                                textController:
                                                    controller.purchaseDateTc,
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
                                                width: MediaQuery.of(context)
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
                                                textController:
                                                    controller.challanDateTc,
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5.1,
                                                numberTextField: true,
                                                onTap: () {
                                                  controller.openPODatePicker =
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
                                                  title: 'Received Date  : '),
                                              Dimens.boxWidth10,
                                              CustomTextFieldForStock(
                                                width: MediaQuery.of(context)
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
                                                textController:
                                                    controller.receivedDateTc,
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    textController:
                                                        controller.lrNoCtrlr,
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    textController: controller
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: LoginCustomTextfield(
                                                    textController:
                                                        controller.jobRefCtrlr,
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
                                                  width: MediaQuery.of(context)
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
                                                      controller.onValueChanged,
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
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: Dimens.edgeInsets20,
                                // height: 300,
                                height: ((controller.goDetails!.value.length) *
                                        80) +
                                    170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorValues.appBlueBackgroundColor,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  // Column(
                                  //     children: []..addAll(controller.rowItem.value.map((e) {
                                  //         return Text(jsonEncode(e));
                                  //       }))),
                                  // Text(jsonEncode(controller.dropdownMapperData)),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Selects Material ",
                                          style: Styles.blue700,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.addRowItem();
                                          },
                                          child: Row(
                                            children: [
                                              Text("Add"),
                                              Icon(Icons.exposure_plus_1),
                                            ],
                                          ),
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
                                            fixedWidth: 500,
                                            label: Text(
                                              "Material",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            // fixedWidth: 250,
                                            label: Text(
                                          "Paid By",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn2(
                                            fixedWidth: 210,
                                            label: Text(
                                              "Requested  Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 110,
                                            label: Text(
                                              "Cost",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 110,
                                            label: Text(
                                              "Dispatch Qty",
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
                                              (mapData['key'] == "Drop_down")
                                                  ? IgnorePointer(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 10,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            DropdownWebStock(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              dropdownList:
                                                                  controller
                                                                      .assetItemList,
                                                              selectedValue:
                                                                  mapData[
                                                                      "value"],
                                                              onValueChanged: (list,
                                                                  selectedValue) {
                                                                // print(
                                                                //     'paifcghb:${controller.assetItemList}');
                                                                // print({selectedValue: selectedValue});
                                                                mapData["value"] =
                                                                    selectedValue;
                                                                controller.dropdownMapperData[
                                                                        selectedValue] =
                                                                    list.firstWhere(
                                                                        (element) =>
                                                                            element.name ==
                                                                            selectedValue,
                                                                        orElse:
                                                                            null);
                                                              },
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
                                                      ),
                                                    )
                                                  : (mapData['key'] ==
                                                          "Paid_By")
                                                      ? IgnorePointer(
                                                          child: Padding(
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
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : (mapData['key'] ==
                                                              "Requested")
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
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
                                                                          IgnorePointer(
                                                                        child:
                                                                            LoginCustomTextfield(
                                                                          width:
                                                                              (Get.width * .4),
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          inputFormatters: <
                                                                              TextInputFormatter>[
                                                                            FilteringTextInputFormatter.digitsOnly
                                                                          ],
                                                                          maxLine:
                                                                              1,
                                                                          textController:
                                                                              new TextEditingController(text: mapData["value"] ?? ''),
                                                                          onChanged:
                                                                              (txt) {
                                                                            mapData["value"] =
                                                                                txt;
                                                                          },
                                                                        ),
                                                                      )),
                                                                ],
                                                              ),
                                                            )
                                                          : (mapData['key'] ==
                                                                      "Order") ||
                                                                  (mapData[
                                                                          'key'] ==
                                                                      "Cost")
                                                              ? IgnorePointer(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                10),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
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
                                                                                LoginCustomTextfield(
                                                                              width: (Get.width * .4),
                                                                              keyboardType: TextInputType.number,
                                                                              inputFormatters: <TextInputFormatter>[
                                                                                FilteringTextInputFormatter.digitsOnly
                                                                              ],
                                                                              maxLine: 1,
                                                                              textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                              onChanged: (txt) {
                                                                                mapData["value"] = txt;
                                                                              },
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
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
                              (controller.getPurchaseDetailsByIDModel.value
                                              ?.status ==
                                          302 ||
                                      controller.getPurchaseDetailsByIDModel
                                                  .value?.status ==
                                              301 &&
                                          controller.type == 1 ||
                                      controller.getPurchaseDetailsByIDModel
                                                  .value?.status ==
                                              310 &&
                                          varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id ==
                                                          UserAccessConstants
                                                              .kGoodsFeatureId &&
                                                      e.delete ==
                                                          UserAccessConstants
                                                              .kHaveApproveAccess)
                                                  .length >
                                              0)
                                  ? Row(
                                      children: [
                                        Spacer(),
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kGoodsFeatureId &&
                                                        e.approve ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                            ? Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.appGreenColor,
                                                  text: "Approve",
                                                  icon: Icons.add,
                                                  onPressed: () {
                                                    Get.dialog(
                                                        GoodsOrderApprovedDialog(
                                                      id: controller.id,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth10,
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kGoodsFeatureId &&
                                                        e.approve ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                            ? Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.rejectColor,
                                                  text: "Reject",
                                                  icon: Icons.close,
                                                  onPressed: () {
                                                    Get.dialog(
                                                        GoodsOrderRejectDialog(
                                                      id: controller.id,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth10,
                                        controller.getPurchaseDetailsByIDModel
                                                        .value?.status ==
                                                    310 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kGoodsFeatureId &&
                                                            e.delete ==
                                                                UserAccessConstants
                                                                    .kHaveApproveAccess)
                                                        .length >
                                                    0
                                            ? Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.rejectColor,
                                                  text: "Close",
                                                  icon: Icons.close,
                                                  onPressed: () {
                                                    Get.dialog(
                                                        GoodsOrderCloseDialog(
                                                      id: controller.id,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        Spacer(),
                                      ],
                                    )
                                  : Container(),
                              Dimens.boxHeight10
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
