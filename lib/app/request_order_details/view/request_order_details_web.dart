import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/request_order_details/request_order_details_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GoodsOrdersReqDetailsWeb extends GetView<GoodsOrdersReqDetailController> {
  GoodsOrdersReqDetailsWeb({Key? key}) : super(key: key);
  final GoodsOrdersReqDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(children: [
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
              Text(" / REQUEST GOODS  ", style: Styles.greyLight14)
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Obx(
              () => Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Text(
                                " Request  Orders",
                                style: Styles.blackBold14,
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
                      AddRowInReqGoodsOrder(),

                      // Dimens.boxHeight15,
                      SizedBox(height: 15),
                      controller.historyList!.isEmpty
                          ? Dimens.box0
                          : Container(
                              margin: Dimens.edgeInsets20,
                              height:
                                  ((controller.historyList?.length ?? 0) * 50) +
                                      125,
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
                                    padding: const EdgeInsets.all(10.0),
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
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: DataTable2(
                                      border: TableBorder.all(
                                          color: Color.fromARGB(
                                              255, 206, 229, 234)),
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
                                                  ?.createdAt!
                                                  .result
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          Text('Comment: '),
                          Expanded(
                            child: TextField(
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.0,
                                    color: Colors.black),
                              ),
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

                      // Dimens.boxHeight15,
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Spacer(),
                          CustomElevatedButton(
                            backgroundColor: ColorValues.appRedColor,
                            text: 'cancel',
                            onPressed: () {
                              Get.toNamed(Routes.purchaseGoodsorder);
                              // controller.AddInventory();
                            },
                          ),
                          // Dimens.boxWidth15,
                          SizedBox(width: 15),
                          controller.roId == 0
                              ? CustomElevatedButton(
                                  backgroundColor: ColorValues.appGreenColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    controller.submitPurchaseOrderData();
                                  },
                                )
                              : CustomElevatedButton(
                                  backgroundColor: ColorValues.updateColor,
                                  text: 'Update',
                                  onPressed: () {
                                    controller.updatePurchaseOrderData();
                                  },
                                ),
                          Spacer()
                        ],
                      ),
                      // Dimens.boxHeight15,
                      SizedBox(height: 15),
                    ],
                  ),
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
  final GoodsOrdersReqDetailController controller = Get.find();
  AddRowInReqGoodsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: Dimens.edgeInsets20,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Selects Material ",
                    style: Styles.blue700,
                  ),
                  GestureDetector(
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DataTable2(
                dataRowHeight: 105,
                columnSpacing: 10,
                border:
                    TableBorder.all(color: Color.fromARGB(255, 206, 229, 234)),
                columns: [
                  DataColumn2(
                    label: Text(
                      "Assets Code",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn2(
                    label: Text(
                      "Currency",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      "Unit Cost",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text(
                      "Requested Qty",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn2(
                    fixedWidth: 350,
                    label: Text(
                      "Comment",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn2(
                    fixedWidth: 70,
                    label: Text(
                      "Action",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                                                  .width /
                                              4,
                                          dropdownList: controller.assetList,
                                          isValueSelected: controller
                                                          .errorState[
                                                      '$rowIndex-${mapData['key']}'] ==
                                                  true
                                              ? false
                                              : true,
                                          selectedValue: mapData["value"],
                                          onValueChanged:
                                              (list, selectedValue) {
                                            print(
                                                {selectedValue: selectedValue});
                                            mapData["value"] = selectedValue;
                                            controller.validateSpecificField(
                                                rowIndex);
                                            controller.dropdownMapperData[
                                                    selectedValue] =
                                                list.firstWhere(
                                                    (element) =>
                                                        element.name ==
                                                        selectedValue,
                                                    orElse: null);
                                          },
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DropdownWebStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              dropdownList:
                                                  controller.unitCurrencyList,
                                              isValueSelected: controller
                                                              .errorState[
                                                          '$rowIndex-${mapData['key']}'] ==
                                                      true
                                                  ? false
                                                  : true,
                                              selectedValue: mapData["value"],
                                              onValueChanged:
                                                  (list, selectedValue) {
                                                print({
                                                  selectedValue: selectedValue
                                                });
                                                mapData["value"] =
                                                    selectedValue;
                                                controller
                                                    .validateSpecificField(
                                                        rowIndex);
                                                controller.unitCurrencydropdownMapperData[
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
                                    : (mapData['key'] == "Action")
                                        ? Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TableActionButton(
                                                  color:
                                                      ColorValues.appRedColor,
                                                  icon: Icons.delete_outlined,
                                                  label: '',
                                                  message: '',
                                                  onPress: () {
                                                    controller.rowItem
                                                        .remove(row);
                                                    controller.update();
                                                  },
                                                )
                                              ],
                                            ),
                                          )
                                        : Padding(
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
                                                            5.0, 5.0),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 1.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: controller
                                                                    .errorState[
                                                                '$rowIndex-${mapData['key']}'] ==
                                                            true
                                                        ? Border.all(
                                                            color: Colors.red,
                                                            width: 2.0)
                                                        : Border.all(
                                                            color: ColorValues
                                                                .appLightBlueColor,
                                                            width: 1.0),
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    keyboardType: (mapData[
                                                                    'key'] ==
                                                                "Order" ||
                                                            mapData['key'] ==
                                                                "Cost")
                                                        ? TextInputType.number
                                                        : TextInputType.text,
                                                    inputFormatters: (mapData[
                                                                    'key'] ==
                                                                "Order" ||
                                                            mapData['key'] ==
                                                                "Cost")
                                                        ? <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ]
                                                        : null,
                                                    maxLine: 1,
                                                    textController:
                                                        TextEditingController(
                                                            text: mapData[
                                                                    "value"] ??
                                                                ''),
                                                    onChanged: (txt) {
                                                      mapData["value"] = txt;
                                                      if (controller.errorState[
                                                              '$rowIndex-${mapData['key']}'] ==
                                                          true) {
                                                        controller.errorState
                                                            .remove(
                                                                '$rowIndex-${mapData['key']}');
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
