import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/stock_management_add_goods_orders_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import '../../widgets/custom_richtext.dart';

class AddGoodsOrdersWeb extends StatefulWidget {
  AddGoodsOrdersWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddGoodsOrdersWeb> createState() => _AddGoodsOrdersWebState();
}

class _AddGoodsOrdersWebState extends State<AddGoodsOrdersWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockManagementAddGoodsOrdersController>(
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
                                  Get.offNamed(
                                      Routes.stockManagementGoodsOrdersScreen);
                                },
                                child: Text(" / STOCK MANAGEMENT",
                                    style: Styles.greyLight14),
                              ),
                              controller.goId == 0
                                  ? Text(" / ADD GOODS ORDER DETAILS",
                                      style: Styles.greyLight14)
                                  : Text(" / EDIT GOODS ORDER DETAILS",
                                      style: Styles.greyLight14),
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
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Add Goods Order Details",
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
                                                          ? ColorValues
                                                              .draftColor
                                                          : controller
                                                                      .getPurchaseDetailsByIDModel
                                                                      .value
                                                                      ?.status ==
                                                                  305
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  181,
                                                                  129,
                                                                  179)
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
                                                                      : controller.getPurchaseDetailsByIDModel.value?.status == 304
                                                                          ? ColorValues.appPurpleColor
                                                                          : ColorValues.lightBlueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Obx(
                                                  () => Text(
                                                    " ${controller.getPurchaseDetailsByIDModel.value?.status_short ?? ""}",
                                                  ),
                                                )),
                                            controller.goId == null
                                                ? Container()
                                                : Obx(
                                                    () => Text(
                                                      " Order ID :${controller.getPurchaseDetailsByIDModel.value?.id ?? ""} ",
                                                      style: Styles.blackBold16,
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Container(
                                        margin: Dimens.edgeInsets20,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Vendor: '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    SizedBox(
                                                      child: Obx(
                                                        () => DropdownWebStock(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                          dropdownList:
                                                              controller
                                                                  .ownerList,
                                                          isValueSelected:
                                                              controller
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
                                                    ),
                                                  ],
                                                ),
                                                // Dimens.boxHeight10,
                                                SizedBox(height: 10),

                                                // Row(
                                                //   children: [
                                                //     CustomRichText(

                                                //         title:
                                                //             'Delivery Challan: '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.challanNoCtrlr,
                                                //       focusnode:
                                                //           controller.delchfocus,
                                                //       scroll:
                                                //           controller.delchscroll,
                                                //     ),
                                                //   ],
                                                // ),

                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'P.O No: '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    LoginCustomTextfield(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),

                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      textController:
                                                          controller.pOCtrlr,

                                                      scroll:
                                                          controller.ponoscroll,
                                                      //validate
                                                      errorController:
                                                          controller.isPOInvalid
                                                                  .value
                                                              ? "Required field"
                                                              : null,

                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller.isPOInvalid
                                                              .value = false;
                                                        } else {
                                                          controller.isPOInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                // Dimens.boxHeight5,
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title:
                                                //             'Frieght:To Pay /Paid : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController: controller
                                                //           .frieghtToPayPaidCtrlr,
                                                //       focusnode:
                                                //           controller.freightfocus,
                                                //       scroll:
                                                //           controller.freightscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // Dimens.boxHeight5,
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title:
                                                //             'Materials Received Against PO:'),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       textController: controller
                                                //           .noOfPackagesReceivedCtrlr,
                                                //       focusnode:
                                                //           controller.matpofocus,
                                                //       scroll:
                                                //           controller.matposcroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // Dimens.boxHeight5,
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title:
                                                //             'Condition of Packages Received : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController: controller
                                                //           .conditionOfPackagesReceivedCtrlr,
                                                //       focusnode:
                                                //           controller.pacrfocus,
                                                //       scroll: controller.pacrscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // Dimens.boxHeight5,
                                                SizedBox(height: 5),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title:
                                                //             'Gate Inward Register No. : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.girNoCtrlr,
                                                //       focusnode:
                                                //           controller.inregfocus,
                                                //       scroll:
                                                //           controller.inregscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // Dimens.boxHeight5,
                                                SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Amount : '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    LoginCustomTextfield(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      textController: controller
                                                          .amountCtrlr,
                                                      // focusnode:
                                                      //     controller.amntfocus,
                                                      scroll:
                                                          controller.amntscroll,

                                                      //validate

                                                      errorController: controller
                                                              .isAmountInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,

                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isAmountInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isAmountInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                // Dimens.boxHeight5,
                                                SizedBox(height: 5),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Purchase Date :'),
                                                //     Dimens.boxWidth10,
                                                //     CustomTextFieldForStock(
                                                //       width: MediaQuery.of(context)
                                                //               .size
                                                //               .width /
                                                //           5,
                                                //       numberTextField: true,
                                                //       onTap: () {
                                                //         controller
                                                //                 .openPurchaseDatePicker =
                                                //             !controller
                                                //                 .openPurchaseDatePicker;
                                                //         controller.update(
                                                //             ['stock_Mangement']);
                                                //       },
                                                //       textController:
                                                //           controller.purchaseDateTc,
                                                //     ),
                                                //   ],
                                                // ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Challan Date : '),
                                                //     Dimens.boxWidth10,
                                                //     CustomTextFieldForStock(
                                                //       width: MediaQuery.of(context)
                                                //               .size
                                                //               .width /
                                                //           5,
                                                //       numberTextField: true,
                                                //       onTap: () {
                                                //         controller
                                                //                 .openChallanDatePicker =
                                                //             !controller
                                                //                 .openChallanDatePicker;
                                                //         controller.update(
                                                //             ['stock_Mangement']);
                                                //       },
                                                //       textController:
                                                //           controller.challanDateTc,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                Obx(
                                                  () => Row(
                                                    children: [
                                                      CustomRichText(
                                                          title: 'PO Date  : '),
                                                      // Dimens.boxWidth10,
                                                      SizedBox(width: 10),
                                                      CustomTextFieldForStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
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
                                                        textController:
                                                            controller
                                                                .poDateDateTc,
                                                        //validate

                                                        errorController: controller
                                                                .isPOdateInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,

                                                        onChanged: (value) {
                                                          if (controller
                                                                  .poDateDateTc
                                                                  .text
                                                                  .trim()
                                                                  .length >
                                                              0) {
                                                            controller
                                                                .isPOdateInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isPOdateInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Received Date  : '),
                                                //     Dimens.boxWidth10,
                                                //     CustomTextFieldForStock(
                                                //       width: MediaQuery.of(context)
                                                //               .size
                                                //               .width /
                                                //           5,
                                                //       numberTextField: true,
                                                //       onTap: () {
                                                //         controller
                                                //                 .openReceivedPicker =
                                                //             !controller
                                                //                 .openReceivedPicker;
                                                //         controller.update(
                                                //             ['stock_Mangement']);
                                                //       },
                                                //       textController:
                                                //           controller.receivedDateTc,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'L.R No.  : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.lrNoCtrlr,
                                                //       focusnode: controller.lrfocus,
                                                //       scroll: controller.lrscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Vehicle  No. : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.vehicleNoCtrlr,
                                                //       focusnode:
                                                //           controller.vehfocus,
                                                //       scroll: controller.vehscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Job Ref. : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.jobRefCtrlr,
                                                //       focusnode:
                                                //           controller.jobrfocus,
                                                //       scroll: controller.jobrscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
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
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      AddRowInGoodsOrder(),
                                      // Dimens.boxHeight15,
                                      SizedBox(height: 15),
                                      (controller.historyList != null &&
                                              controller
                                                  .historyList!.isNotEmpty)
                                          ? Container(
                                              margin: Dimens.edgeInsets20,
                                              height: ((controller.historyList
                                                              ?.length ??
                                                          0) *
                                                      40) +
                                                  120,
                                              decoration: BoxDecoration(
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Goods History ",
                                                          style: Styles.blue700,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child:
                                                        HistoryTableWidgetWeb(
                                                      historyList: controller
                                                          .historyList,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Dimens.box0,
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
                                            DateFormat('yyyy-MM-dd')
                                                .format(p0.value);
                                        controller.openPurchaseDatePicker =
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
                                        controller.openChallanDatePicker =
                                            !controller.openChallanDatePicker;
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

                                        controller.openPODatePicker = false;
                                        controller.isPOdateInvalid.value =
                                            false;
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
                            // Dimens.boxWidth15,
                            SizedBox(width: 15),
                            controller.goId == 0
                                ? Container(
                                    height: 40,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.submitColor,
                                      text: 'Submit',
                                      onPressed: () {
                                        controller.isFormInvalid.value = false;
                                        controller.createGoodsOrder();
                                      },
                                    ))
                                : Container(
                                    height: 40,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.submitColor,
                                      text: 'Update',
                                      onPressed: () {
                                        controller.updateGoodsOrder();
                                      },
                                    ),
                                  ),
                            Spacer()
                          ],
                        )
                      : Dimens.box0)),
            ));
      },
    );
  }
}

class AddRowInGoodsOrder extends StatelessWidget {
  final StockManagementAddGoodsOrdersController controller = Get.find();
  AddRowInGoodsOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: Dimens.edgeInsets20,
        //  height: 300,
        height: ((controller.rowItem.value.length) * 90) + 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selects Material ",
                  style: Styles.blue700,
                ),
                varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kGoodsFeatureId &&
                                e.add == UserAccessConstants.kHaveAddAccess)
                            .length >
                        0
                    ? GestureDetector(
                        onTap: () {
                          controller.addRowItem();
                        },
                        child: Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                            color: ColorValues.addNewColor,
                            border: Border.all(
                              color: ColorValues.lightGreyColorWithOpacity35,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              " + Add ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : Dimens.box0
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: DataTable2(
                // minWidth: 2000,
                dataRowHeight: 105,
                columnSpacing: 10,
                border:
                    TableBorder.all(color: Color.fromARGB(255, 206, 229, 234)),
                columns: [
                  DataColumn2(
                      // fixedWidth: 500,
                      label: Row(
                    children: [
                      // Text(
                      //   "  ",
                      //   style:
                      //       TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      // ),
                      // Dimens.boxWidth5,
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Select Material For Req Order:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            // CustomRichText(title: 'Req Order: '),
                            // Dimens.boxWidth10,
                            SizedBox(width: 10),
                            Obx(
                              () => SizedBox(
                                width: Get.width * .2,
                                child: CustomMultiSelectDialogField(
                                  title: 'Please Select',
                                  buttonText: 'Equipment Category',
                                  initialValue: controller.selectedReqOrderId,
                                  items: controller.goodsOrdersList
                                      .map(
                                        (goodsOrder) => MultiSelectItem(
                                          goodsOrder?.requestOrderId ?? 0,
                                          goodsOrder?.requestOrderId
                                                  .toString() ??
                                              "",
                                        ),
                                      )
                                      .toList(),
                                  onConfirm: (selectedOptionsList) => {
                                    controller
                                        .goodsOrderIds(selectedOptionsList),
                                  },
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   child: Obx(
                            //     () => MultipDropdownWebWidget(
                            //       controller: controller,
                            //       width:
                            //           MediaQuery.of(context).size.width * .15,
                            //       dropdownList: controller.goodsOrdersList,
                            //       isValueSelected:
                            //           controller.isReqOrderSelected.value,
                            //       selectedItems:
                            //           controller.goodsOrdersList.value,
                            //       onValueChanged: controller.onValueChanged,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  DataColumn2(
                      fixedWidth: 180,
                      label: Text(
                        "Requested Qty",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  DataColumn2(
                      fixedWidth: 90,
                      label: Text(
                        "Unit Cost",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  DataColumn2(
                      fixedWidth: 130,
                      label: Text(
                        "Dispatch Qty",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  DataColumn2(
                      fixedWidth: 250,
                      label: Text(
                        "Paid By",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  DataColumn2(
                      fixedWidth: 70,
                      label: Text(
                        "Action",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ],
                rows: List.generate(
                  controller.rowItem.length,
                  (rowIndex) {
                    var row = controller.rowItem[rowIndex];
                    return DataRow(
                      cells: row.map(
                        (mapData) {
                          return DataCell(
                            (mapData['key'] == "Drop_down")
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      top: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DropdownWebStock(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          dropdownList:
                                              controller.goDetailsList,
                                          isValueSelected: controller
                                                          .errorState[
                                                      '$rowIndex-${mapData['key']}'] ==
                                                  true
                                              ? false
                                              : true,
                                          selectedValue: mapData["value"],
                                          onValueChanged:
                                              (list, selectedValue) {
                                            mapData["value"] = selectedValue;
                                            controller.errorState.removeWhere(
                                                (key, value) =>
                                                    key ==
                                                    '$rowIndex-Drop_down');
                                            controller.errorState.removeWhere(
                                                (key, value) =>
                                                    key == '$rowIndex-Cost');
                                            controller.errorState.removeWhere(
                                                (key, value) =>
                                                    key ==
                                                    '$rowIndex-Requested');
                                            controller.dropdownMapperData[
                                                    selectedValue] =
                                                list.firstWhere(
                                              (element) =>
                                                  element.name == selectedValue,
                                              orElse: null,
                                            );
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Text("Assets Code :"),
                                            Text(
                                                "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Assets type :"),
                                            Text(
                                                "${controller.dropdownMapperData[mapData['value']]?.asset_type ?? ''}")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Assets Category :"),
                                            Text(
                                                "${controller.dropdownMapperData[mapData['value']]?.asset_cat ?? ''}")
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : (mapData['key'] == "Action ")
                                    ? Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TableActionButton(
                                              color: ColorValues.appRedColor,
                                              icon: Icons.delete,
                                              label: '',
                                              message: '',
                                              onPress: () {
                                                controller.rowItem.remove(row);
                                                // controller.errorState.remove(rowIndex);
                                                controller.update();
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    : (mapData['key'] == "Paid_By")
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DropdownWebStock(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  dropdownList: controller.paid,
                                                  isValueSelected: controller
                                                                  .errorState[
                                                              '$rowIndex-${mapData['key']}'] ==
                                                          true
                                                      ? false
                                                      : true,
                                                  selectedValue:
                                                      mapData["value"],
                                                  onValueChanged:
                                                      (list, selectedValue) {
                                                    print(
                                                        'paifcghb:${controller.paid}');
                                                    print({
                                                      selectedValue:
                                                          selectedValue
                                                    });
                                                    mapData["value"] =
                                                        selectedValue;
                                                    controller.errorState
                                                        .removeWhere((key,
                                                                value) =>
                                                            key ==
                                                            '$rowIndex-Paid_By');
                                                    controller.paiddropdownMapperData[
                                                            selectedValue] =
                                                        list.firstWhere(
                                                            (element) =>
                                                                element.name ==
                                                                selectedValue,
                                                            orElse: null);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        : (mapData['key'] == "Order")
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
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
                                                              blurRadius: 5.0,
                                                              spreadRadius: 1.0,
                                                            ),
                                                          ],
                                                          color: ColorValues
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: controller
                                                                          .errorState[
                                                                      '$rowIndex-${mapData['key']}'] ==
                                                                  true
                                                              ? Border.all(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 2.0)
                                                              : Border.all(
                                                                  color: ColorValues
                                                                      .appLightBlueColor,
                                                                  width: 1.0),
                                                        ),
                                                        child:
                                                            LoginCustomTextfield(
                                                          width:
                                                              (Get.width * .4),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          maxLine: 1,
                                                          textController:
                                                              new TextEditingController(
                                                                  text: mapData[
                                                                          "value"] ??
                                                                      ''),
                                                          onChanged: (txt) {
                                                            mapData["value"] =
                                                                txt;
                                                            if (controller
                                                                        .errorState[
                                                                    '$rowIndex-${mapData['key']}'] ==
                                                                true) {
                                                              controller
                                                                  .errorState
                                                                  .remove(
                                                                      '$rowIndex-${mapData['key']}');
                                                            }
                                                          },
                                                        )),
                                                  ],
                                                ),
                                              )
                                            :
                                            // (mapData['key'] == "Order") ||
                                            (mapData['key'] == "Cost")
                                                ? IgnorePointer(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
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
                                                                        .circular(
                                                                            5),
                                                                border: controller.errorState[
                                                                            '$rowIndex-${"Drop_down"}'] ==
                                                                        true
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .red,
                                                                        width:
                                                                            2.0)
                                                                    : Border.all(
                                                                        color: ColorValues
                                                                            .appLightBlueColor,
                                                                        width:
                                                                            1.0),
                                                              ),
                                                              child:
                                                                  LoginCustomTextfield(
                                                                width:
                                                                    (Get.width *
                                                                        .4),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                inputFormatters: <TextInputFormatter>[
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
                                                                maxLine: 1,
                                                                errorController:
                                                                    controller
                                                                            .isCostInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                textController:
                                                                    new TextEditingController(
                                                                  text:
                                                                      "${controller.dropdownMapperData.value[row[0]['value']]?.cost ?? ""}",
                                                                ),
                                                                onChanged:
                                                                    (txt) {
                                                                  mapData["value"] =
                                                                      txt;
                                                                  if (controller
                                                                              .errorState[
                                                                          '$rowIndex-${mapData['key']}'] ==
                                                                      true) {
                                                                    controller
                                                                        .errorState
                                                                        .remove(
                                                                            '$rowIndex-${mapData['key']}');
                                                                  }
                                                                },
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : (mapData['key'] ==
                                                        "Requested")
                                                    ? IgnorePointer(
                                                        child: Padding(
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
                                                                    border: controller.errorState['$rowIndex-${"Drop_down"}'] ==
                                                                            true
                                                                        ? Border.all(
                                                                            color: Colors
                                                                                .red,
                                                                            width:
                                                                                2.0)
                                                                        : Border.all(
                                                                            color:
                                                                                ColorValues.appLightBlueColor,
                                                                            width: 1.0),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width:
                                                                        (Get.width *
                                                                            .4),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    inputFormatters: <TextInputFormatter>[
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
                                                                    maxLine: 1,
                                                                    errorController: controller
                                                                            .isRequestedInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                    textController:
                                                                        new TextEditingController(
                                                                      text:
                                                                          "${controller.dropdownMapperData.value[row[0]['value']]?.ordered_qty ?? ""}",
                                                                    ),
                                                                    onChanged:
                                                                        (txt) {
                                                                      mapData["value"] =
                                                                          txt;
                                                                      if (controller
                                                                              .errorState['$rowIndex-${mapData['key']}'] ==
                                                                          true) {
                                                                        controller
                                                                            .errorState
                                                                            .remove('$rowIndex-${mapData['key']}');
                                                                      }
                                                                    },
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Text(
                                                        mapData['key'] ?? ''),
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
