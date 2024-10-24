import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/req_approved_dialog.dart';
import 'package:cmms/app/widgets/req_order_reject_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PurchaseGoodsorderViewWeb
    extends GetView<PurchaseGoodsorderViewController> {
  PurchaseGoodsorderViewWeb({Key? key}) : super(key: key);
  final PurchaseGoodsorderViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
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
                  Get.offAllNamed(Routes.purchaseGoodsorder);
                },
                child: Text(" / STOCK MANAGEMENT ", style: Styles.greyLight14),
              ),
              Text(" / VIEW GOODS REQUEST DETAILS", style: Styles.greyLight14)
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: Get.width * 7,
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              // height: Get.height,
              child: Card(
                color: ColorValues.cardColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              " View Goods Request Details",
                              style: Styles.blackBold14,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  "Request ID: ",
                                  style: Styles.blackBold14,
                                ),
                                Text(
                                  "${controller.getPurchaseDetailsByIDModel.value?.request_order_id ?? ""}",
                                  style: Styles.blackBold14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    // Dimens.boxHeight10,
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "${controller.getPurchaseDetailsByIDModel.value?.status_long ?? ""}",
                      ),
                    ),
                    // Dimens.boxHeight10,
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          'Generated  by :',
                          style: Styles.black17,
                        ),
                        // Dimens.boxWidth10,
                        SizedBox(width: 10),
                        Text(
                          "${controller.getPurchaseDetailsByIDModel.value?.generatedBy}",
                          style: Styles.blue17,
                        ),
                        Spacer(),
                        Text(
                          'Order Date & Time :',
                          style: Styles.black17,
                        ),
                        // Dimens.boxWidth10,
                        SizedBox(width: 10),
                        Text(
                          "${controller.getPurchaseDetailsByIDModel.value?.generatedAt ?? ""}",
                          style: Styles.blue17,
                        ),
                        Spacer(),
                      ],
                    ),

                    // Dimens.boxHeight10,
                    SizedBox(height: 10),
                    AddRowInReqGoodsOrder(),

                    // Dimens.boxHeight10,
                    SizedBox(height: 10),

                    controller.historyList!.isEmpty
                        ? Dimens.box0
                        : Container(
                            margin: Dimens.edgeInsets20,
                            height:
                                ((controller.historyList?.length ?? 0) * 50) +
                                    125,
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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Goods Req History ",
                                        style: Styles.blue700,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Expanded(
                                  child: DataTable2(
                                    border: TableBorder.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234)),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        "Time Stamp",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Posted By",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Comment",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Location",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        "Status",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ],
                                    rows: List<DataRow>.generate(
                                      controller.historyList?.length ?? 0,
                                      (index) => DataRow(cells: [
                                        DataCell(Text(controller
                                                .historyList?[index]
                                                ?.createdAt
                                                ?.result
                                                .toString() ??
                                            '')),
                                        DataCell(Text(controller
                                                .historyList?[index]
                                                ?.createdByName
                                                .toString() ??
                                            '')),
                                        DataCell(Text(controller
                                                .historyList?[index]?.comment
                                                .toString() ??
                                            '')),
                                        DataCell(Text('--')),
                                        DataCell(Text(controller
                                                .historyList?[index]
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

                    // (controller.getPurchaseDetailsByIDModel.value?.status !=
                    //         341)
                    //     ? Container()
                    //     :

                    varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kReqOrderFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0 &&
                            controller.getPurchaseDetailsByIDModel.value
                                    ?.status ==
                                342
                        ? Row(
                            children: [
                              Spacer(),
                              Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.rejectColor,
                                  text: ' Reject ',
                                  onPressed: () {
                                    Get.dialog(ReqOrderRejectDialog(
                                      id: controller.roId.value,
                                    ));
                                  },
                                  // onPressed: () {
                                  //   controller.rejectGoodsOrder();
                                  // },
                                ),
                              ),
                              // Dimens.boxWidth10,
                              SizedBox(width: 10),
                              Container(
                                  height: 40,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.submitColor,
                                    text: 'Approve',
                                    onPressed: () {
                                      Get.dialog(ReqOrderApprovedDialog(
                                        id: controller.roId.value,
                                      ));
                                    },
                                    // onPressed: () {
                                    //   controller.approveGoodsOrder();
                                    // },
                                  )),
                              Spacer()
                            ],
                          )
                        : Dimens.box0,
                    // Dimens.boxHeight15,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
    //  ),
  }
}

class AddRowInReqGoodsOrder extends StatelessWidget {
  final PurchaseGoodsorderViewController controller = Get.find();
  AddRowInReqGoodsOrder({
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
                // GestureDetector(
                //   onTap: () {
                //     controller.addRowItem();
                //   },
                //   child: Container(
                //     height: 25,
                //     width: 70,
                //     decoration: BoxDecoration(
                //       color: ColorValues.addNewColor,
                //       border: Border.all(
                //         color: ColorValues.lightGreyColorWithOpacity35,
                //         width: 1,
                //       ),
                //       borderRadius: BorderRadius.all(Radius.circular(5)),
                //     ),
                //     child: Center(
                //       child: Text(
                //         " + Add ",
                //         style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.w100,
                //             color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: DataTable2(
              // minWidth: 2000,
              dataRowHeight: 105,
              columnSpacing: 10,
              border:
                  TableBorder.all(color: Color.fromARGB(255, 206, 229, 234)),
              columns: [
                DataColumn2(
                    // fixedWidth: 500,
                    label: Text(
                  "Assets Code",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
                DataColumn2(
                  label: Text(
                    "Currency",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      "Unit Cost",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      "Requested Qty",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                DataColumn2(
                    fixedWidth: 350,
                    label: Text(
                      "Comment",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              ],
              rows: controller.rowItem.value.map((record) {
                return DataRow(
                  // height: 130,
                  cells: record.map((mapData) {
                    return DataCell(
                      (mapData['key'] == "Drop_down")
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IgnorePointer(
                                    child: DropdownWebStock(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      dropdownList: controller.assetList,
                                      selectedValue: mapData["value"],
                                      onValueChanged: (list, selectedValue) {
                                        print({selectedValue: selectedValue});
                                        mapData["value"] = selectedValue;
                                        controller.dropdownMapperData[
                                                selectedValue] =
                                            list.firstWhere(
                                                (element) =>
                                                    element.name ==
                                                    selectedValue,
                                                orElse: null);
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text("Material Code :"),
                                      Text(
                                          "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Material type :"),
                                      Text(
                                          "${controller.dropdownMapperData[mapData['value']]?.asset_type ?? ''}")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Material Category :"),
                                      Text(
                                          "${controller.dropdownMapperData[mapData['value']]?.cat_name ?? ''}")
                                    ],
                                  )
                                ],
                              ),
                            )
                          : (mapData['key'] == "currency_drop_down")
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IgnorePointer(
                                        child: DropdownWebStock(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          dropdownList:
                                              controller.unitCurrencyList,
                                          selectedValue: mapData["value"],
                                          onValueChanged:
                                              (list, selectedValue) {
                                            print(
                                                {selectedValue: selectedValue});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Order") ||
                                      (mapData['key'] == "Cost")
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: IgnorePointer(
                                                child: LoginCustomTextfield(
                                                  keyboardType:
                                                      TextInputType.number,
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
                                                    mapData["value"] = txt;
                                                  },
                                                  //validate

                                                  // errorController: controller
                                                  //         .isCostInvalid
                                                  //         .value
                                                  //     ? "Required field"
                                                  //     : null,

                                                  // onChanged: (value) {
                                                  //   if (value
                                                  //           .trim()
                                                  //           .length >
                                                  //       0) {
                                                  //     controller
                                                  //         .isCostInvalid
                                                  //         .value = false;
                                                  //   } else {
                                                  //     controller
                                                  //         .isCostInvalid
                                                  //         .value = true;
                                                  //   }
                                                  // },
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "Comment")
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: IgnorePointer(
                                                    child: LoginCustomTextfield(
                                                      maxLine: 1,
                                                      textController:
                                                          new TextEditingController(
                                                              text: mapData[
                                                                      "value"] ??
                                                                  ''),
                                                      onChanged: (txt) {
                                                        mapData["value"] = txt;
                                                      },
                                                      //validate

                                                      // errorController: controller
                                                      //         .isCommentInvalid
                                                      //         .value
                                                      //     ? "Required field"
                                                      //     : null,

                                                      // onChanged: (value) {
                                                      //   if (value
                                                      //           .trim()
                                                      //           .length >
                                                      //       0) {
                                                      //     controller
                                                      //         .isCommentInvalid
                                                      //         .value = false;
                                                      //   } else {
                                                      //     controller
                                                      //         .isCommentInvalid
                                                      //         .value = true;
                                                      //   }
                                                      //   },
                                                    ),
                                                  )),
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
    );
  }
}
