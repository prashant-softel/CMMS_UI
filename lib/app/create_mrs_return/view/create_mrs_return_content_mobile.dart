import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mrs_return/create_mrs_return_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../home/widgets/mobile_header_widget.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/dropdown_web.dart';

class CreateReturnMrsContentMobile extends GetView<CreateMrsReturnController> {
  CreateReturnMrsContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return
          //   Scaffold(
          // body: //``
          //   Obx(
          // () =>
          Padding(
              padding: Dimens.edgeInsets5,
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight5,
                      HeaderWidgetMobile(),
                      Column(
                        children: [
                          Card(
                              color: Colors.lightBlue.shade50,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    height: Get.height,
                                    child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomRichTextMobile(
                                              title: "Activity: ",
                                            ),
                                            Dimens.boxHeight2,
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
                                                      color: Colors.black26,
                                                      offset: const Offset(
                                                        5.0,
                                                        5.0,
                                                      ),
                                                      blurRadius: 5.0,
                                                      spreadRadius: 1.0,
                                                    ),
                                                    BoxShadow(
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                ),
                                                child: LoginCustomTextfield(
                                                  // inputFormatters: [
                                                  //   FilteringTextInputFormatter.deny(
                                                  //       RegExp(r'\s')),
                                                  // ],
                                                  textController:
                                                      controller.activityCtrlr,
                                                )),
                                            Text('Where Used: '),
                                            Dimens.boxHeight2,
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
                                                      color: Colors.black26,
                                                      offset: const Offset(
                                                        5.0,
                                                        5.0,
                                                      ),
                                                      blurRadius: 5.0,
                                                      spreadRadius: 1.0,
                                                    ),
                                                    BoxShadow(
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                ),
                                                child: LoginCustomTextfield(
                                                  // enabled: false,
                                                  textController:
                                                      controller.whereUsedCtrlr,
                                                )),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                Text(
                                                  "Material",
                                                  style: Styles.blue700,
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.addRowItem();
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .addNewColor,
                                                      border: Border.all(
                                                        color: ColorValues
                                                            .lightGreyColorWithOpacity35,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        " + Add ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight5,
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .rowItem.value.length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  color: Color.fromARGB(
                                                      255, 232, 239, 242),
                                                  elevation: 10,
                                                  shadowColor: Colors.black87,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: controller
                                                          .rowItem.value[index]
                                                          .map<Widget>(
                                                              (mapData) {
                                                        return Column(
                                                          children: [
                                                            (mapData['key'] ==
                                                                    "Drop_down")
                                                                ? Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "Material Name:"),
                                                                      Dimens
                                                                          .boxHeight2,
                                                                      DropdownWebWidget(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.9,
                                                                        dropdownList:
                                                                            (controller.StockDetailsList.where((p0) {
                                                                          return !controller.rowItem.map((p0) => p0[0]["value"]).contains(p0!.name) &&
                                                                              p0.consumed_qty != p0.issued_qty;
                                                                        }).toList())
                                                                                .obs,
                                                                        selectedValue:
                                                                            mapData["value"],
                                                                        onValueChanged:
                                                                            (list,
                                                                                selectedValue) {
                                                                          mapData["value"] =
                                                                              selectedValue;
                                                                          controller.dropdownMapperData[selectedValue] = list.firstWhere(
                                                                              (element) => element.name == selectedValue,
                                                                              orElse: null);

                                                                          // Check if all relevant dropdowns are selected
                                                                          var relevantItems = controller.StockDetailsList.where((item) =>
                                                                              item!.consumed_qty !=
                                                                              item.issued_qty).toList();
                                                                          controller
                                                                              .allDropdownsSelected
                                                                              .value = relevantItems.every((item) => controller.dropdownMapperData.containsKey(item!.name));
                                                                        },
                                                                      ),
                                                                    ],
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Return_Qty")
                                                                    ? Obx(
                                                                        () =>
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Return Qty:"),
                                                                            Dimens.boxHeight2,
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
                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                    FilteringTextInputFormatter.digitsOnly
                                                                                  ],
                                                                                  maxLine: 1,
                                                                                  textController: TextEditingController(
                                                                                    text: _calculateDifference(controller.rowItem[index][0]['value'] ?? ""),
                                                                                  ),
                                                                                  onChanged: (txt) {
                                                                                    setState(() {
                                                                                      mapData["value"] = txt;
                                                                                    });
                                                                                    // int return_qty = int.tryParse(txt) ?? 0;
                                                                                    //  if (return_qty <= 1) {
                                                                                    //  mapData["value"] = txt;
                                                                                    // } else {
                                                                                    //  Fluttertoast.showToast(msg: "You can only add 1 qty!");
                                                                                    // setState(() {
                                                                                    //   mapData["value"] = mapData['value']!;
                                                                                    //  });
                                                                                    //  }
                                                                                  },
                                                                                )),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : (mapData['key'] ==
                                                                            "Action ")
                                                                        ? Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 10),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                TableActionButton(
                                                                                  color: ColorValues.appRedColor,
                                                                                  icon: Icons.delete,
                                                                                  label: '',
                                                                                  message: '',
                                                                                  onPress: () {
                                                                                    controller.rowItem.remove(controller.rowItem.value[index]);
                                                                                  },
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "Issue_Qty")
                                                                            ? Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text("Issue Qty: "),
                                                                                  Dimens.boxWidth2,
                                                                                  Obx(
                                                                                    () {
                                                                                      final qty = controller.rowItem[index][0]['value'];
                                                                                      final issued_qty = controller.dropdownMapperData[qty]?.issued_qty ?? "";
                                                                                      return Text(issued_qty.toString());
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            : (mapData['key'] == "Sr_No")
                                                                                ? Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text("Sr No: "),
                                                                                      Dimens.boxWidth2,
                                                                                      Obx(
                                                                                        () {
                                                                                          final serial_no = controller.rowItem[index][0]['value'];
                                                                                          final serialno = controller.dropdownMapperData[serial_no]?.serial_no ?? "";
                                                                                          return Text(serialno.toString());
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                : (mapData['key'] == "code")
                                                                                    ? Row(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text("Code: "),
                                                                                          Dimens.boxWidth2,
                                                                                          Obx(
                                                                                            () {
                                                                                              final code = controller.rowItem[index][0]['value'];
                                                                                              final asset_code = controller.dropdownMapperData[code]?.asset_code ?? "";
                                                                                              return Text(asset_code.toString());
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      )
                                                                                    : (mapData['key'] == "Material_Type")
                                                                                        ? Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text("Material Type: "),
                                                                                              Dimens.boxWidth2,
                                                                                              Obx(
                                                                                                () {
                                                                                                  final assettype = controller.rowItem[index][0]['value'];
                                                                                                  final asset_type = controller.dropdownMapperData[assettype]?.asset_type ?? "";
                                                                                                  return Text(asset_type.toString());
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          )
                                                                                        : (mapData['key'] == "Used_Qty")
                                                                                            ? Row(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text("Used Qty: "),
                                                                                                  Dimens.boxWidth2,
                                                                                                  Obx(
                                                                                                    () {
                                                                                                      final consumedqty = controller.rowItem[index][0]['value'];
                                                                                                      final consumed_qty = controller.dropdownMapperData[consumedqty]?.consumed_qty ?? "";
                                                                                                      return Text(consumed_qty.toString());
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              )
                                                                                            : (mapData['key'] == "Remark")
                                                                                                ? Column(
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text("Remark:"),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(0.0),
                                                                                                        child: Container(
                                                                                                            // width: (Get.width * .5),
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
                                                                                                              // inputFormatters: <
                                                                                                              //     TextInputFormatter>[
                                                                                                              //   FilteringTextInputFormatter
                                                                                                              //       .digitsOnly
                                                                                                              // ],
                                                                                                              maxLine: 1,
                                                                                                              textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                                              onChanged: (txt) {
                                                                                                                mapData["value"] = txt;
                                                                                                              },
                                                                                                            )),
                                                                                                      ),
                                                                                                    ],
                                                                                                  )
                                                                                                : Text(mapData['key'] ?? ''),
                                                          ],
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Dimens.boxHeight0,
                                            Row(
                                              children: [
                                                Text(
                                                  "Return faulty material",
                                                  style: Styles.blue700,
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .addRowFaultyItem();
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .addNewColor,
                                                      border: Border.all(
                                                        color: ColorValues
                                                            .lightGreyColorWithOpacity35,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        " + Add ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight5,
                                            Container(
                                              width: Get.width,
                                              child: Obx(
                                                () => Card(
                                                  color: Color.fromARGB(
                                                      255, 232, 239, 242),
                                                  elevation: 10,
                                                  shadowColor: Colors.black87,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Column(
                                                    children: controller
                                                        .rowFaultyItem
                                                        .map((record) {
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              232,
                                                              239,
                                                              242),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: record
                                                                  .map(
                                                                      (mapData) {
                                                                return Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (mapData[
                                                                            'key'] ==
                                                                        "Drop_down")
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Material Name:",
                                                                              style: Styles.appDarkGrey12,
                                                                            ),
                                                                            DropdownWebWidget(
                                                                              width: (Get.width * .8),
                                                                              dropdownList: controller.assetList.where((p0) => p0!.asset_type == "Spare" && !controller.rowItem.map((p0) => p0[0]["value"]).contains(p0!.name)).toList().obs,
                                                                              selectedValue: mapData["value"],
                                                                              onValueChanged: (list, selectedValue) {
                                                                                print({
                                                                                  "web",
                                                                                  controller.dropdownFaultyMapperData[selectedValue]
                                                                                });
                                                                                mapData["value"] = selectedValue;
                                                                                controller.dropdownFaultyMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (mapData[
                                                                            'key'] ==
                                                                        "assets")
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Assets:',
                                                                              style: Styles.appDarkGrey12,
                                                                            ),
                                                                            DropdownWebWidget(
                                                                              width: (Get.width * .8),
                                                                              controller: controller,
                                                                              dropdownList: controller.type.value == 2 ? controller.scheduleCheckPointsdrop : controller.workingAreaList,
                                                                              selectedValue: mapData["value"],
                                                                              onValueChanged: (list, selectedValue) {
                                                                                controller.selectedasset.value;
                                                                                mapData["value"] = selectedValue;

                                                                                controller.selectedasset.value = selectedValue;

                                                                                controller.checkdropdownMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (mapData[
                                                                            'key'] ==
                                                                        "code")
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              "Material Code: ",
                                                                              style: Styles.appDarkGrey12,
                                                                            ),
                                                                            Text("${controller.dropdownFaultyMapperData.value[record[0]['value']]?.asset_code ?? ""}")
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (mapData[
                                                                            'key'] ==
                                                                        "Sr_no")
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Sr No:",
                                                                              style: Styles.appDarkGrey12,
                                                                            ),
                                                                            Container(
                                                                                width: (Get.width * .8),
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
                                                                                  // inputFormatters: <
                                                                                  //     TextInputFormatter>[
                                                                                  //   FilteringTextInputFormatter
                                                                                  //       .digitsOnly
                                                                                  // ],
                                                                                  maxLine: 1,
                                                                                  textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                  onChanged: (txt) {
                                                                                    mapData["value"] = txt;
                                                                                  },
                                                                                )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (mapData[
                                                                            'key'] ==
                                                                        "Return_Qty")
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Return Qty:",
                                                                              style: Styles.appDarkGrey12,
                                                                            ),
                                                                            Container(
                                                                                width: (Get.width * .8),
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
                                                                                  // inputFormatters: <
                                                                                  //     TextInputFormatter>[
                                                                                  //   FilteringTextInputFormatter
                                                                                  //       .digitsOnly
                                                                                  // ],
                                                                                  maxLine: 1,
                                                                                  enabled: false,
                                                                                  textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                  onChanged: (txt) {
                                                                                    int return_qty = int.tryParse(txt) ?? 0;
                                                                                    if (return_qty <= 1) {
                                                                                      mapData["value"] = txt;
                                                                                    } else {
                                                                                      Fluttertoast.showToast(msg: "You can only add 1 qty!");
                                                                                      setState(() {
                                                                                        mapData["value"] = mapData['value']!;
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (mapData[
                                                                            'key'] ==
                                                                        "Action ")
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(top: 10),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  TableActionButton(
                                                                                    color: ColorValues.appRedColor,
                                                                                    icon: Icons.delete,
                                                                                    label: '',
                                                                                    message: '',
                                                                                    onPress: () {
                                                                                      controller.rowFaultyItem.remove(record);
                                                                                    },
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (mapData[
                                                                            'key'] ==
                                                                        "Remark")
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Remark:',
                                                                              style: Styles.appDarkGrey12,
                                                                            ),
                                                                            Container(
                                                                                width: (Get.width * .8),
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
                                                                                  // inputFormatters: <
                                                                                  //     TextInputFormatter>[
                                                                                  //   FilteringTextInputFormatter
                                                                                  //       .digitsOnly
                                                                                  // ],
                                                                                  maxLine: 1,
                                                                                  textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                  onChanged: (txt) {
                                                                                    mapData["value"] = txt;
                                                                                  },
                                                                                )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                  ],
                                                                );
                                                              }).toList(),
                                                            ),
                                                            Divider(
                                                              color: Colors
                                                                  .lightBlue
                                                                  .shade50,

                                                              thickness:
                                                                  10, // Thickness of the line
                                                              // indent:
                                                              //     16, // Left spacing
                                                              // endIndent:
                                                              //     16, // Right spacing
                                                              // height:
                                                              //     20, // Space around the divider
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // ListView.builder(
                                            //   shrinkWrap: true,
                                            //   itemCount: controller
                                            //       .rowFaultyItem.value.length,
                                            //   itemBuilder: (context, index) {
                                            //     return Card(
                                            //       color: Color.fromARGB(
                                            //           255, 232, 239, 242),
                                            //       elevation: 10,
                                            //       shadowColor: Colors.black87,
                                            //       shape: RoundedRectangleBorder(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 5.0),
                                            //       ),
                                            //       child: Padding(
                                            //         padding:
                                            //             const EdgeInsets.all(
                                            //                 10.0),
                                            //         child: Column(
                                            //           crossAxisAlignment:
                                            //               CrossAxisAlignment
                                            //                   .start,
                                            //           children: controller
                                            //               .rowFaultyItem
                                            //               .value[index]
                                            //               .map<Widget>(
                                            //                   (mapData) {
                                            //             return Column(
                                            //               children: [
                                            //                 (mapData['key'] ==
                                            //                         "Drop_down")
                                            //                     ? Column(
                                            //                         crossAxisAlignment:
                                            //                             CrossAxisAlignment
                                            //                                 .start,
                                            //                         children: [
                                            //                           Text(
                                            //                               "Material Name:"),
                                            //                           Dimens
                                            //                               .boxHeight2,
                                            //                           DropdownWebWidget(
                                            //                             // width: MediaQuery.of(context)
                                            //                             //         .size
                                            //                             //         .width /
                                            //                             //     4,
                                            //                             dropdownList: controller
                                            //                                 .assetList
                                            //                                 .where((p0) =>
                                            //                                     p0!.asset_type == "Spare" &&
                                            //                                     !controller.rowItem.map((p0) => p0[0]["value"]).contains(p0!.name))
                                            //                                 .toList()
                                            //                                 .obs,
                                            //                             selectedValue:
                                            //                                 mapData["value"],
                                            //                             onValueChanged:
                                            //                                 (list,
                                            //                                     selectedValue) {
                                            //                               print({
                                            //                                 "web",
                                            //                                 controller.dropdownFaultyMapperData[selectedValue]
                                            //                               });
                                            //                               mapData["value"] =
                                            //                                   selectedValue;
                                            //                               controller.dropdownFaultyMapperData[selectedValue] = list.firstWhere(
                                            //                                   (element) => element.name == selectedValue,
                                            //                                   orElse: null);
                                            //                             },
                                            //                           ),
                                            //                         ],
                                            //                       )
                                            //                     : (mapData['key'] ==
                                            //                             "assets")
                                            //                         ? Column(
                                            //                             crossAxisAlignment:
                                            //                                 CrossAxisAlignment.start,
                                            //                             children: [
                                            //                               Text(
                                            //                                   "Assets:"),
                                            //                               Dimens
                                            //                                   .boxHeight2,
                                            //                               DropdownWebWidget(
                                            //                                 // width: MediaQuery.of(context)
                                            //                                 //         .size
                                            //                                 //         .width /
                                            //                                 //     4,
                                            //                                 controller:
                                            //                                     controller,
                                            //                                 dropdownList: controller.type.value == 2
                                            //                                     ? controller.scheduleCheckPointsdrop
                                            //                                     : controller.workingAreaList,
                                            //                                 selectedValue:
                                            //                                     mapData["value"],
                                            //                                 onValueChanged:
                                            //                                     (list, selectedValue) {
                                            //                                   controller.selectedasset.value;
                                            //                                   mapData["value"] = selectedValue;

                                            //                                   controller.selectedasset.value = selectedValue;

                                            //                                   controller.checkdropdownMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                            //                                 },
                                            //                               ),
                                            //                             ],
                                            //                           )
                                            //                         : (mapData['key'] ==
                                            //                                 "Return_Qty")
                                            //                             ? Column(
                                            //                                 crossAxisAlignment:
                                            //                                     CrossAxisAlignment.start,
                                            //                                 children: [
                                            //                                   Text("Return Qty:"),
                                            //                                   Dimens.boxHeight2,
                                            //                                   Container(

                                            //                                       // padding: EdgeInsets.all(value),
                                            //                                       decoration: BoxDecoration(
                                            //                                         boxShadow: [
                                            //                                           BoxShadow(
                                            //                                             color: Colors.black26,
                                            //                                             offset: const Offset(
                                            //                                               5.0,
                                            //                                               5.0,
                                            //                                             ),
                                            //                                             blurRadius: 5.0,
                                            //                                             spreadRadius: 1.0,
                                            //                                           ),
                                            //                                         ],
                                            //                                         color: ColorValues.whiteColor,
                                            //                                         borderRadius: BorderRadius.circular(5),
                                            //                                       ),
                                            //                                       child: LoginCustomTextfield(
                                            //                                         inputFormatters: <TextInputFormatter>[
                                            //                                           FilteringTextInputFormatter.digitsOnly
                                            //                                         ],
                                            //                                         maxLine: 1,
                                            //                                         textController: new TextEditingController(text: mapData["value"] ?? ''),
                                            //                                         onChanged: (txt) {
                                            //                                           int return_qty = int.tryParse(txt) ?? 0;
                                            //                                           if (return_qty <= 1) {
                                            //                                             mapData["value"] = txt;
                                            //                                           } else {
                                            //                                             Fluttertoast.showToast(msg: "You can only add 1 qty!");
                                            //                                             setState(() {
                                            //                                               mapData["value"] = mapData['value']!;
                                            //                                             });
                                            //                                           }
                                            //                                         },
                                            //                                       )),
                                            //                                 ],
                                            //                               )
                                            //                             : (mapData['key'] ==
                                            //                                     "Action ")
                                            //                                 ? Padding(
                                            //                                     padding: EdgeInsets.only(top: 10),
                                            //                                     child: Column(
                                            //                                       mainAxisAlignment: MainAxisAlignment.start,
                                            //                                       crossAxisAlignment: CrossAxisAlignment.start,
                                            //                                       children: [
                                            //                                         TableActionButton(
                                            //                                           color: ColorValues.appRedColor,
                                            //                                           icon: Icons.delete,
                                            //                                           label: '',
                                            //                                           message: '',
                                            //                                           onPress: () {
                                            //                                             controller.rowFaultyItem.remove(controller.rowItem.value[index]);
                                            //                                           },
                                            //                                         )
                                            //                                       ],
                                            //                                     ),
                                            //                                   )
                                            //                                 : (mapData['key'] == "Issue_Qty")
                                            //                                     ? Row(
                                            //                                         crossAxisAlignment: CrossAxisAlignment.start,
                                            //                                         children: [
                                            //                                           Text("Issue Qty: "),
                                            //                                           Dimens.boxWidth2,
                                            //                                           Obx(
                                            //                                             () {
                                            //                                               final qty = controller.rowItem[index][0]['value'];
                                            //                                               final issued_qty = controller.dropdownMapperData[qty]?.issued_qty ?? "";
                                            //                                               return Text(issued_qty.toString());
                                            //                                             },
                                            //                                           ),
                                            //                                         ],
                                            //                                       )
                                            //                                     : (mapData['key'] == "Sr_no")
                                            //                                         ? Column(
                                            //                                             crossAxisAlignment: CrossAxisAlignment.start,
                                            //                                             children: [
                                            //                                               Text("Sr No: "),
                                            //                                               Dimens.boxWidth2,
                                            //                                               Container(
                                            //                                                   // width: (Get.width * .5),
                                            //                                                   // padding: EdgeInsets.all(value),
                                            //                                                   decoration: BoxDecoration(
                                            //                                                     boxShadow: [
                                            //                                                       BoxShadow(
                                            //                                                         color: Colors.black26,
                                            //                                                         offset: const Offset(
                                            //                                                           5.0,
                                            //                                                           5.0,
                                            //                                                         ),
                                            //                                                         blurRadius: 5.0,
                                            //                                                         spreadRadius: 1.0,
                                            //                                                       ),
                                            //                                                     ],
                                            //                                                     color: ColorValues.whiteColor,
                                            //                                                     borderRadius: BorderRadius.circular(5),
                                            //                                                   ),
                                            //                                                   child: LoginCustomTextfield(
                                            //                                                     // inputFormatters: <
                                            //                                                     //     TextInputFormatter>[
                                            //                                                     //   FilteringTextInputFormatter
                                            //                                                     //       .digitsOnly
                                            //                                                     // ],
                                            //                                                     maxLine: 1,
                                            //                                                     textController: new TextEditingController(text: mapData["value"] ?? ''),
                                            //                                                     onChanged: (txt) {
                                            //                                                       mapData["value"] = txt;
                                            //                                                     },
                                            //                                                   )),
                                            //                                             ],
                                            //                                           )
                                            //                                         : (mapData['key'] == "code")
                                            //                                             ? Row(
                                            //                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                            //                                                 children: [
                                            //                                                   Text("Code: "),
                                            //                                                   Dimens.boxWidth2,
                                            //                                                   Obx(
                                            //                                                     () {
                                            //                                                       final code = controller.rowItem[index][0]['value'];
                                            //                                                       final asset_code = controller.dropdownMapperData[code]?.asset_code ?? "";
                                            //                                                       return Text(asset_code.toString());
                                            //                                                     },
                                            //                                                   ),
                                            //                                                 ],
                                            //                                               )
                                            //                                             : (mapData['key'] == "Remark")
                                            //                                                 ? Column(
                                            //                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                            //                                                     children: [
                                            //                                                       Text("Remark:"),
                                            //                                                       Padding(
                                            //                                                         padding: const EdgeInsets.all(0.0),
                                            //                                                         child: Container(
                                            //                                                             // width: (Get.width * .5),
                                            //                                                             // padding: EdgeInsets.all(value),
                                            //                                                             decoration: BoxDecoration(
                                            //                                                               boxShadow: [
                                            //                                                                 BoxShadow(
                                            //                                                                   color: Colors.black26,
                                            //                                                                   offset: const Offset(
                                            //                                                                     5.0,
                                            //                                                                     5.0,
                                            //                                                                   ),
                                            //                                                                   blurRadius: 5.0,
                                            //                                                                   spreadRadius: 1.0,
                                            //                                                                 ),
                                            //                                                               ],
                                            //                                                               color: ColorValues.whiteColor,
                                            //                                                               borderRadius: BorderRadius.circular(5),
                                            //                                                             ),
                                            //                                                             child: LoginCustomTextfield(
                                            //                                                               // inputFormatters: <
                                            //                                                               //     TextInputFormatter>[
                                            //                                                               //   FilteringTextInputFormatter
                                            //                                                               //       .digitsOnly
                                            //                                                               // ],
                                            //                                                               maxLine: 1,
                                            //                                                               textController: new TextEditingController(text: mapData["value"] ?? ''),
                                            //                                                               onChanged: (txt) {
                                            //                                                                 mapData["value"] = txt;
                                            //                                                               },
                                            //                                                             )),
                                            //                                                       ),
                                            //                                                     ],
                                            //                                                   )
                                            //                                                 : Text(mapData['key'] ?? ''),
                                            //               ],
                                            //             );
                                            //           }).toList(),
                                            //         ),
                                            //       ),
                                            //     );
                                            //   },
                                            // ),

                                            Container(
                                              margin: Dimens.edgeInsets15,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomRichText(
                                                      title: "Comment:"),
                                                  Dimens.boxHeight5,
                                                  Container(
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
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                          BoxShadow(
                                                            color: ColorValues
                                                                .whiteColor,
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 0.0,
                                                            spreadRadius: 0.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child:
                                                          LoginCustomTextfield(
                                                        maxLine: 5,
                                                        textController:
                                                            controller
                                                                .remarkCtrlr,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: Dimens.edgeInsets20_0_0_0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Set As Template: ',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  Dimens.boxHeight5,
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
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                          BoxShadow(
                                                            color: ColorValues
                                                                .whiteColor,
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            blurRadius: 0.0,
                                                            spreadRadius: 0.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child:
                                                          LoginCustomTextfield(
                                                        // inputFormatters: [
                                                        //   FilteringTextInputFormatter.deny(
                                                        //       RegExp(r'\s')),
                                                        // ],
                                                        textController:
                                                            controller
                                                                .setTemlateCtrlr,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Dimens.boxHeight15,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 35,
                                                  child: CustomElevatedButton(
                                                    backgroundColor:
                                                        ColorValues.submitColor,
                                                    text: 'Submit',
                                                    onPressed: () {
                                                      // controller.addUser();
                                                      if (!controller
                                                          .allDropdownsSelected
                                                          .value) {
                                                        Get.defaultDialog(
                                                          radius: 5,
                                                          title: 'Alert',
                                                          middleText:
                                                              'Please select all dropdown values!',
                                                          textConfirm: 'OK',
                                                          onConfirm: () {
                                                            Get.back(); // Close the dialog
                                                          },
                                                          buttonColor:
                                                              ColorValues
                                                                  .appGreenColor,
                                                          confirmTextColor:
                                                              Colors.white,
                                                        );
                                                      } else {
                                                        controller
                                                            .createReturnMrs();
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Dimens.boxWidth20,
                                                Container(
                                                  height: 35,
                                                  child: CustomElevatedButton(
                                                    backgroundColor:
                                                        ColorValues.cancelColor,
                                                    text: "Cancel",
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          ]),
                                    ),
                                  ))),
                        ],
                      )
                    ],
                    //
                  ),
                ),
              ));
    });
  }

  String _calculateDifference(String key) {
    final issuedQty = controller.dropdownMapperData[key]?.issued_qty ?? 0;
    final consumedQty = controller.dropdownMapperData[key]?.consumed_qty ?? 0;
    final difference = issuedQty - consumedQty;
    return difference.toString();
  }
  ///////////
}
