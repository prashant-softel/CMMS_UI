import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_managment_goods_orders_req_details.dart/stock_management_goods_orders_req_details_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class GoodsOrdersReqDetailsWeb extends GetView<GoodsOrdersReqDetailController> {
  GoodsOrdersReqDetailsWeb({Key? key}) : super(key: key);
  final GoodsOrdersReqDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        // () =>
        Container(
      color: Color.fromARGB(255, 234, 236, 238),
      width: Get.width,
      height: Get.height,
      child: Column(children: [
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
              Text(" / Purchase Goods Orders", style: Styles.greyMediumLight12)
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  color: ColorValues.whiteColor,
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          " Purchase Goods Orders",
                          style: Styles.blackBold16,
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Container(
                        height: 350,
                        margin: Dimens.edgeInsets20,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Row(
                                children: [
                                  Text("Assets"),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        controller.addRowItem();
                                      },
                                      child: Icon(Icons.exposure_plus_1)),
                                ],
                              ),
                            ),
                            // Column(
                            //     children: []
                            //       ..addAll(controller.rowItem.value.map((e) {
                            //         return Text(jsonEncode(e));
                            //       }))),
                            // Text(jsonEncode(controller.dropdownMapperData)),
                            Obx(
                              () => Container(
                                height: 300,
                                child: ScrollableTableView(
                                  columns: [
                                    "Assets Code",
                                    "Cost",
                                    "Ordered Qty",
                                  ].map((column) {
                                    return TableViewColumn(
                                      label: column,
                                      minWidth: Get.width * 0.25,
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
                                                            .assetList.value,
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
                                                  : Text(mapData['key'] ?? ''),
                                        );
                                      }).toList(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight15,
                      Container(
                        margin: Dimens.edgeInsets15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichText(title: "Comment:"),
                            Dimens.boxWidth10,
                            Container(
                                width: (Get.width * .6),
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
                                    BoxShadow(
                                      color: ColorValues.whiteColor,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                  color: ColorValues.whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: LoginCustomTextfield(
                                  maxLine: 5,
                                  // textController: controller.remarkCtrlr,
                                )),
                          ],
                        ),
                      ),
                      Dimens.boxHeight15,
                      Center(
                        child: Row(
                          children: [
                            Spacer(),
                            CustomElevatedButton(
                              backgroundColor: ColorValues.appRedColor,
                              text: 'cancel',
                              onPressed: () {
                                // controller.AddInventory();
                              },
                            ),
                            Dimens.boxWidth15,
                            CustomElevatedButton(
                              backgroundColor: ColorValues.appGreenColor,
                              text: 'Submit',
                              onPressed: () {
                                controller.submitPurchaseOrderData();
                              },
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                      Dimens.boxHeight15,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
    //  ),
  }
}
