import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_managment_update_goods_orders_details.dart/stock_management_update_goods_orders_details_controller.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';

class UpdateGoodsOrdersDetailsWeb extends StatefulWidget {
  UpdateGoodsOrdersDetailsWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateGoodsOrdersDetailsWeb> createState() =>
      _UpdateGoodsOrdersDetailsWebState();
}

class _UpdateGoodsOrdersDetailsWebState
    extends State<UpdateGoodsOrdersDetailsWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockManagementUpdateGoodsOrdersDetailsController>(
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
                          child: Text(" / STOCK MANAGEMENT ",
                              style: Styles.greyMediumLight12),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(" /  UPDATE GOODS ORDER DETAILS",
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
                                      "Add  Goods Order Details",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    Text(
                                      " Order ID : GOS001 ",
                                      style: Styles.blackBold16,
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
                              Container(
                                margin: Dimens.edgeInsets20,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              child: DropdownWebWidget(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                dropdownList: controller
                                                    .businessCategoryList,
                                                isValueSelected: controller
                                                    .isSelectedBusinessType
                                                    .value,
                                                selectedValue: controller
                                                    .selectedBusinessType.value,
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
                                                child: LoginCustomTextfield()),
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
                                                child: LoginCustomTextfield()),
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
                                                child: LoginCustomTextfield()),
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
                                                child: LoginCustomTextfield()),
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
                                                child: LoginCustomTextfield()),
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
                                                child: LoginCustomTextfield()),
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
                                                    color: Color.fromARGB(
                                                            255, 236, 234, 234)
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
                                              child: LoginCustomTextfield()),
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
                                                controller.openReceivedPicker =
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
                                                child: LoginCustomTextfield()),
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
                                                child: LoginCustomTextfield()),
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
                                                child: LoginCustomTextfield()),
                                          ],
                                        ),
                                        Dimens.boxHeight5,
                                        Row(
                                          children: [
                                            Dimens.boxWidth10,
                                            CustomRichText(title: 'Currency: '),
                                            Dimens.boxWidth10,
                                            SizedBox(
                                              child: DropdownWebWidget(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                dropdownList:
                                                    controller.unitCurrencyList,
                                                isValueSelected: controller
                                                    .isUnitCurrencySelected
                                                    .value,
                                                selectedValue: controller
                                                    .selectedUnitCurrency.value,
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
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 350,
                                margin: Dimens.edgeInsets20,
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
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Row(
                                        children: [
                                          Text("Assets"),
                                          Spacer(),
                                          Icon(Icons.exposure_plus_1),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 300,
                                      child: ScrollableTableView(
                                        columns: [
                                          "Assets Code",
                                          "Paid By",
                                          "Cost",
                                          "Ordered Qty",
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            minWidth: Get.width * 0.18,
                                            height: Get.height / 2,
                                          );
                                        }).toList(),
                                        rows: [
                                          [
                                            "Drop_down",
                                            "Paid_By",
                                            "Cost",
                                            "Order",
                                          ],
                                        ].map((record) {
                                          return TableViewRow(
                                            height: 200,
                                            cells: record.map((value) {
                                              return TableViewCell(
                                                child: (value == "Drop_down")
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20,
                                                                right: 20,
                                                                top: 40),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            DropdownWebWidget(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  4,
                                                              onValueChanged:
                                                                  (p0, p1) {},
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Assets Code :"),
                                                                Text("12345")
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Material type :"),
                                                                Text(
                                                                    "Consumable")
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Material Category :"),
                                                                Text(
                                                                    "Connectors")
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    : (value == "Paid_By")
                                                        ? DropdownWebWidget(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                4,
                                                            onValueChanged:
                                                                (p0, p1) {},
                                                          )
                                                        : (value == "Order")
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Container(
                                                                    width: (Get.width * .4),
                                                                    // padding: EdgeInsets.all(value),
                                                                    decoration: BoxDecoration(
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
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child: LoginCustomTextfield(
                                                                      maxLine:
                                                                          1,
                                                                    )),
                                                              )
                                                            : (value == "Cost")
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Container(
                                                                        width: (Get.width * .4),
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
                                                                          color:
                                                                              ColorValues.whiteColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child: LoginCustomTextfield(
                                                                          maxLine:
                                                                              1,
                                                                        )),
                                                                  )
                                                                : Text(value),
                                              );
                                            }).toList(),
                                          );
                                        }).toList(),
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
                            right: 65,
                            top: 130,
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
                                    DateFormat('yyyy-MM-dd').format(p0.value);
                                controller.openChallanDatePicker =
                                    !controller.openChallanDatePicker;
                                controller.update(['stock_Mangement']);
                              },
                            ),
                          ),
                        if (controller.openPODatePicker)
                          Positioned(
                            right: 65,
                            top: 200,
                            child: DatePickerWidget(
                              minDate: DateTime(DateTime.now().year),
                              maxDate: DateTime(DateTime.now().year, 13,
                                  0), // last date of this year
                              controller: DateRangePickerController(),
                              selectionChanges: (p0) {
                                print('po valu ${p0.value.toString()}');
                                controller.poDateDateTc.text =
                                    DateFormat('yyyy-MM-dd').format(p0.value);
                                controller.openPODatePicker =
                                    !controller.openPODatePicker;
                                controller.update(['stock_Mangement']);
                              },
                            ),
                          ),
                        if (controller.openReceivedPicker)
                          Positioned(
                            right: 65,
                            top: 230,
                            child: DatePickerWidget(
                              minDate: DateTime(DateTime.now().year),
                              maxDate: DateTime(DateTime.now().year, 13,
                                  0), // last date of this year
                              controller: DateRangePickerController(),
                              selectionChanges: (p0) {
                                print('po valu ${p0.value.toString()}');
                                controller.receivedDateTc.text =
                                    DateFormat('yyyy-MM-dd').format(p0.value);
                                controller.openReceivedPicker =
                                    !controller.openReceivedPicker;
                                controller.update(['stock_Mangement']);
                              },
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
