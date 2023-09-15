import 'package:cmms/app/app.dart';
import 'package:cmms/app/purchase_goods_orders_view/request_goods_orders_view_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class PurchaseGoodsorderViewWeb
    extends GetView<PurchaseGoodsorderViewController> {
  PurchaseGoodsorderViewWeb({Key? key}) : super(key: key);
  final PurchaseGoodsorderViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
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
              Text(" / Goods Order Request Details",
                  style: Styles.greyMediumLight12)
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
                              " Goods Order Request Details",
                              style: Styles.blackBold14,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 25,
                            width: 230,
                            decoration: BoxDecoration(
                                color: ColorValues.appYellowColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Waiting For Approval",
                                  style: Styles.whiteColor16,
                                ),
                              ),
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
                                  "${controller.getPurchaseDetailsByIDModel.value?.request_order_id}",
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
                    Dimens.boxHeight10,
                    Container(
                      margin: Dimens.edgeInsets15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: ColorValues.lightGreyColorWithOpacity35,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: ColorValues.appBlueBackgroundColor,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      width: Get.width * 7,
                      height: Get.height / 1.70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, right: 20),
                            child: Row(
                              children: [
                                Text("Material"),
                              ],
                            ),
                          ),
                          IgnorePointer(
                            child: Container(
                              margin: Dimens.edgeInsets15,
                              decoration: BoxDecoration(
                                color: ColorValues.inerCardColorHex,
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              width: Get.width * 7,
                              height: Get.height * 0.4,
                              child: Container(
                                height: 295,
                                child: ScrollableTableView(
                                  columns: [
                                    "Assets Code",
                                    "Cost",
                                    "Ordered Qty",
                                    "Comment"
                                  ].map((column) {
                                    return TableViewColumn(
                                      label: column,
                                      minWidth: Get.width * 0.21,
                                      height: Get.height / 2,
                                    );
                                  }).toList(),
                                  rows: controller.rowItem.value.map((record) {
                                    return TableViewRow(
                                      height: 200,
                                      cells: record.map((mapData) {
                                        return TableViewCell(
                                          child: (mapData['key'] == "Drop_down")
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20,
                                                          right: 20,
                                                          top: 70),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      DropdownWebStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4,
                                                        dropdownList: controller
                                                            .assetList,
                                                        selectedValue:
                                                            mapData["value"],
                                                        onValueChanged: (list,
                                                            selectedValue) {
                                                          print({
                                                            selectedValue:
                                                                selectedValue
                                                          });
                                                          mapData["value"] =
                                                              selectedValue;
                                                          controller.dropdownMapperData[
                                                                  selectedValue] =
                                                              list.firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .name ==
                                                                      selectedValue,
                                                                  orElse: null);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              "Material Code :"),
                                                          Text(
                                                              "${controller.dropdownMapperData[mapData['value']]?.asset_code ?? ''}")
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              "Material type :"),
                                                          Text(
                                                              "${controller.dropdownMapperData[mapData['value']]?.asset_type ?? ''}")
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              "Material Category :"),
                                                          Text(
                                                              "${controller.dropdownMapperData[mapData['value']]?.cat_name ?? ''}")
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : (mapData['key'] == "Order") ||
                                                      (mapData['key'] == "Cost")
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          width:
                                                              (Get.width * .4),
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
                                                                blurRadius: 5.0,
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
                                                          ),
                                                          child:
                                                              LoginCustomTextfield(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            inputFormatters: <
                                                                TextInputFormatter>[
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
                                                            },
                                                          )),
                                                    )
                                                  : (mapData['key'] ==
                                                          "Comment")
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                              width:
                                                                  (Get.width *
                                                                      .9),
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
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child:
                                                                  LoginCustomTextfield(
                                                                maxLine: 1,
                                                                textController:
                                                                    new TextEditingController(
                                                                        text: mapData["value"] ??
                                                                            ''),
                                                                onChanged:
                                                                    (txt) {
                                                                  mapData["value"] =
                                                                      txt;
                                                                },
                                                              )),
                                                        )
                                                      : Text(
                                                          mapData['key'] ?? ''),
                                        );
                                      }).toList(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Dimens.boxHeight15,
                    Dimens.boxHeight15,
                    // (controller.getPurchaseDetailsByIDModel.value?.status !=
                    //         341)
                    //     ? Container()
                    //     :
                    IgnorePointer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          Text('Comment: '),
                          Expanded(
                            child: TextField(
                              controller: controller.commentCtrlr,
                              // enabled: controller.isJobCardStarted.value,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorValues.appLightGreyColor,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorValues.appLightBlueColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorValues.appLightBlueColor,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              minLines: 5,
                              maxLines: null,
                            ),
                          ),
                        ]),
                      ),
                    ),

                    Row(
                      children: [
                        Spacer(),
                        Container(
                            height: 40,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.submitColor,
                              text: 'Approve',
                              onPressed: () {
                                controller.approveGoodsOrder();
                              },
                            )),
                        Dimens.boxWidth10,
                        Container(
                          height: 40,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.rejectColor,
                            text: ' Reject ',
                            onPressed: () {
                              controller.rejectGoodsOrder();
                            },
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    Dimens.boxHeight15,
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
