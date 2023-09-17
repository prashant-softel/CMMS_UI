import 'package:cmms/app/app.dart';
import 'package:cmms/app/receive_goods_order/receive_goods_order_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

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
                            child: Text(" / RECEIVE GOODS ORDER  ",
                                style: Styles.greyMediumLight12)),
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
                                          Row(
                                            children: [
                                              Text("Vendor :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text("Challan No :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text("P.O :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text("Frieght:To Pay /Paid :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text(
                                                  "No. of Packages  received :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text(
                                                  "Condition of Packages Received :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text("GIR. No. :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(children: [
                                            Text("Amount :",
                                                style: Styles.blackBold16),
                                            Dimens.boxWidth10,
                                            Container(
                                              color: Color(0xffE8E7EC),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.040,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                            ),
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
                                              Text("Purchase Date :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text("Challan Date :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text("PO Date :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text("Received Date  : ",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text("L.R No :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text("Vehicle  No :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Text("Job Ref :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight5,
                                          Row(
                                            children: [
                                              Dimens.boxWidth10,
                                              Text("Currency :",
                                                  style: Styles.blackBold16),
                                              Dimens.boxWidth10,
                                              Container(
                                                color: Color(0xffE8E7EC),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Dimens.boxWidth30,
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 350,
                                  // margin: Dimens.edgeInsets20,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
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
                                            Text(" Selects Assets"),
                                            Spacer(),
                                            // GestureDetector(
                                            //     onTap: () {
                                            //       controller.addRowItem();
                                            //     },
                                            //     child: Row(
                                            //       children: [
                                            //         Text("Add"),
                                            //         Icon(Icons.exposure_plus_1),
                                            //       ],
                                            //     )),
                                          ],
                                        ),
                                      ),
                                      // Column(
                                      //     children: []..addAll(controller
                                      //           .rowItem.value
                                      //           .map((e) {
                                      //         return Text(jsonEncode(e));
                                      //       }))),
                                      // Text(jsonEncode(
                                      //     controller.dropdownMapperData)),
                                      Obx(
                                        () => Container(
                                          height: 300,
                                          child: ScrollableTableView(
                                            columns: [
                                              "Assets",
                                              "Paid_By",
                                              "Cost",
                                              "Ordered Qty",
                                              "Received  Qty",
                                              "Accepted Qty",
                                              "Damaged Items",
                                              // "Order Pending"
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.18,
                                                height: Get.height / 2,
                                              );
                                            }).toList(),
                                            rows: controller.rowItem.value
                                                .map((record) {
                                              return TableViewRow(
                                                height: 130,
                                                cells: record.map((mapData) {
                                                  return TableViewCell(
                                                    child: (mapData['key'] ==
                                                            "Drop_down")
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 20,
                                                              right: 20,
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
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 20,
                                                                      right: 20,
                                                                    ),
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
                                                                        child: IgnorePointer(
                                                                          child:
                                                                              LoginCustomTextfield(
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            inputFormatters: <TextInputFormatter>[
                                                                              FilteringTextInputFormatter.digitsOnly
                                                                            ],
                                                                            maxLine:
                                                                                1,
                                                                            textController:
                                                                                new TextEditingController(text: mapData["value"] ?? ''),
                                                                            onChanged:
                                                                                (txt) {
                                                                              mapData["value"] = txt;
                                                                            },
                                                                          ),
                                                                        )),
                                                                  )
                                                                : (mapData['key'] ==
                                                                            "Received") ||
                                                                        (mapData['key'] ==
                                                                            "Accepted")
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20,
                                                                        ),
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
                                                                              color: ColorValues.whiteColor,
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            child: LoginCustomTextfield(
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
                                                                      )
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
                                                                        ? Padding(
                                                                            padding: const EdgeInsets
                                                                                .only(
                                                                              left: 20,
                                                                              right: 20,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                left: 20,
                                                                                right: 20,
                                                                              ),
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
                                                                                    color: ColorValues.whiteColor,
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                  ),
                                                                                  child: LoginCustomTextfield(
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
                                                                            ))
                                                                        : Text(mapData['key'] ??
                                                                            ''),
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
                              ],
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
                Dimens.boxWidth15,
                Container(
                  height: 40,
                  child: CustomElevatedButton(
                    backgroundColor: Color(0xff77cae7),
                    text: 'Save as Draft',
                    onPressed: () {
                      // controller.AddInventory();
                    },
                  ),
                ),
                Dimens.boxWidth15,
                Container(
                  height: 40,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.submitColor,
                    text: 'Submit for Approval',
                    onPressed: () {
                      controller.updateGoodsOrder();
                    },
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        );
      },
    );
  }
}
