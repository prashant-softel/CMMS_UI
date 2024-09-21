import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mrs_return/create_mrs_return_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../widgets/dropdown_web.dart';

class CreateMrsReturnContentWeb extends GetView<CreateMrsReturnController> {
  CreateMrsReturnContentWeb({Key? key}) : super(key: key);
  final CreateMrsReturnController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Obx(
        () => SelectionArea(
          child: Scaffold(
              body: Container(
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
                                String refId = controller.whereUsedTypeId.value
                                        .toString() ??
                                    "";

                                controller.type.value == 1
                                    ? Get.offNamed(
                                        '${Routes.jobDetails}/$refId')
                                    : controller.type.value == 2
                                        ? Get.offNamed(
                                            '${Routes.pmExecution}/$refId')
                                        : Get.offNamed(Routes
                                            .stockManagementDashboardScreen);
                              },
                              child: controller.type.value == 1
                                  ? Text(
                                      "/ JOB",
                                      style: Styles.greyLight14,
                                    )
                                  : controller.type.value == 2
                                      ? Text(
                                          "/ PM TASK",
                                          style: Styles.greyLight14,
                                        )
                                      : Text(
                                          "/ STOCK MANAGEMENT",
                                          style: Styles.greyLight14,
                                        )),
                          Text(" / NEW RETURN MATERIAL SLIP",
                              style: Styles.greyLight14)
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "New Return Material Requisition Slip",
                                style: Styles.blackBold16,
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(right: 7, left: 7, top: 15),
                              child: Row(
                                children: [
                                  CustomRichText(
                                      title: 'Activity: ',
                                      includeAsterisk: false),
                                  Dimens.boxWidth2,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                            color: ColorValues.whiteColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: IgnorePointer(
                                        ignoring: true,
                                        child: LoginCustomTextfield(
                                          // inputFormatters: [
                                          //   FilteringTextInputFormatter.deny(
                                          //       RegExp(r'\s')),
                                          // ],
                                          textController:
                                              controller.activityCtrlr,
                                        ),
                                      )),
                                  Spacer(),
                                  CustomRichText(
                                      title: 'Task ID', includeAsterisk: false),
                                  Dimens.boxWidth2,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                            color: ColorValues.whiteColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      child: IgnorePointer(
                                        ignoring: true,
                                        child: LoginCustomTextfield(
                                          // enabled: false,
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2),
                                          textController:
                                              controller.whereUsedCtrlr,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              //height: 400,
                              margin:
                                  EdgeInsets.only(right: 7, left: 7, top: 15),
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
                                        Text(
                                          "Return issued equipment",
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
                                              color: ColorValues.addNewColor,
                                              border: Border.all(
                                                color: ColorValues
                                                    .lightGreyColorWithOpacity35,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Column(
                                  //     children: []
                                  //       ..addAll(controller.rowItem.value.map((e) {
                                  //         return Text(jsonEncode(e));
                                  //       }))),
                                  // Text(jsonEncode(controller.dropdownMapperData)),
                                  Container(
                                    // height: 300,
                                    height:
                                        ((controller.StockDetailsList.length ??
                                                    0) *
                                                80) +
                                            60,
                                    child: DataTable2(
                                      // minWidth: 1600,
                                      border: TableBorder.all(
                                          color: Color.fromARGB(
                                              255, 206, 229, 234)),
                                      columns: [
                                        DataColumn2(
                                            // fixedWidth: 250,
                                            label: Text(
                                          "Material Name",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn2(
                                            fixedWidth: 100,
                                            label: Text(
                                              "Sr No",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 150,
                                            label: Text(
                                              "Code",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 170,
                                            label: Text(
                                              "Material Type",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 130,
                                            label: Text(
                                              "Issue Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 130,
                                            label: Text(
                                              "Used Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 150,
                                            label: Text(
                                              "Return Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            // fixedWidth: 150,
                                            label: Text(
                                          "Remark",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn2(
                                            fixedWidth: 100,
                                            label: Text(
                                              "Action",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                      rows: controller.rowItem.value
                                          .map((record) {
                                        return DataRow(
                                          // height: 60,
                                          cells: record.map((mapData) {
                                            return DataCell(
                                              (mapData['key'] == "Drop_down")
                                                  ? Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(6.0),
                                                          child:
                                                              DropdownWebWidget(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.9,
                                                            dropdownList:
                                                                (controller.StockDetailsList
                                                                        .where(
                                                                            (p0) {
                                                              return !controller
                                                                      .rowItem
                                                                      .map((p0) =>
                                                                          p0[0][
                                                                              "value"])
                                                                      .contains(p0!
                                                                          .name) &&
                                                                  p0.consumed_qty !=
                                                                      p0.issued_qty;
                                                            }).toList())
                                                                    .obs,
                                                            selectedValue:
                                                                mapData[
                                                                    "value"],
                                                            onValueChanged: (list,
                                                                selectedValue) {
                                                              mapData["value"] =
                                                                  selectedValue;
                                                              controller.dropdownMapperData[
                                                                      selectedValue] =
                                                                  list.firstWhere(
                                                                      (element) =>
                                                                          element
                                                                              .name ==
                                                                          selectedValue,
                                                                      orElse:
                                                                          null);

                                                              // Check if all relevant dropdowns are selected
                                                              var relevantItems = controller
                                                                      .StockDetailsList
                                                                  .where((item) =>
                                                                      item!
                                                                          .consumed_qty !=
                                                                      item.issued_qty).toList();
                                                              controller
                                                                      .allDropdownsSelected
                                                                      .value =
                                                                  relevantItems.every((item) => controller
                                                                      .dropdownMapperData
                                                                      .containsKey(
                                                                          item!
                                                                              .name));
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : (mapData['key'] ==
                                                          "Return_Qty")
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            width:
                                                                (Get.width / 8),
                                                            child:
                                                                LoginCustomTextfield(
                                                              inputFormatters: <TextInputFormatter>[
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly
                                                              ],
                                                              maxLine: 1,
                                                              enabled: false,
                                                              textController:
                                                                  TextEditingController(
                                                                text: _calculateDifference(
                                                                    record[0][
                                                                            'value'] ??
                                                                        ""),
                                                              ),
                                                              onChanged: (txt) {
                                                                //  _handleTextChanged(txt, record[0]['value']);
                                                              },
                                                            ),
                                                          ),
                                                        )
                                                      : (mapData['key'] ==
                                                              "Action ")
                                                          ? Padding(
                                                              padding: EdgeInsets
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
                                                                  TableActionButton(
                                                                    color: ColorValues
                                                                        .appRedColor,
                                                                    icon: Icons
                                                                        .delete,
                                                                    label: '',
                                                                    message: '',
                                                                    onPress:
                                                                        () {
                                                                      controller
                                                                          .rowItem
                                                                          .remove(
                                                                              record);
                                                                    },
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          : (mapData['key'] ==
                                                                  "Sr_No")
                                                              ? Text(
                                                                  "${controller.dropdownMapperData.value[record[0]['value']]?.serial_no ?? ""}")
                                                              : (mapData['key'] ==
                                                                      "code")
                                                                  ? Text(
                                                                      "${controller.dropdownMapperData.value[record[0]['value']]?.asset_code ?? ""}")
                                                                  : (mapData['key'] ==
                                                                          "Material_Type")
                                                                      ? Text(
                                                                          "${controller.dropdownMapperData.value[record[0]['value']]?.asset_type ?? ""}")
                                                                      : (mapData['key'] ==
                                                                              "Issue_Qty")
                                                                          ? Text(
                                                                              "${controller.dropdownMapperData.value[record[0]['value']]?.issued_qty ?? ""}")
                                                                          : (mapData['key'] == "Used_Qty")
                                                                              ? Text("${controller.dropdownMapperData.value[record[0]['value']]?.consumed_qty ?? ""}")
                                                                              : (mapData['key'] == "Remark")
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Container(
                                                                                          width: (Get.width * .5),
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
                                                                                    )
                                                                                  : Text(mapData['key'] ?? ''),
                                            );
                                          }).toList(),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              //height: 400,
                              margin:
                                  EdgeInsets.only(right: 7, left: 7, top: 15),
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
                                        Text(
                                          "Return faulty material",
                                          style: Styles.blue700,
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            controller.addRowFaultyItem();
                                          },
                                          child: Container(
                                            height: 25,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: ColorValues.addNewColor,
                                              border: Border.all(
                                                color: ColorValues
                                                    .lightGreyColorWithOpacity35,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Column(
                                  //     children: []
                                  //       ..addAll(controller.rowItem.value.map((e) {
                                  //         return Text(jsonEncode(e));
                                  //       }))),
                                  // Text(jsonEncode(controller.dropdownMapperData)),
                                  Container(
                                    height: 200,
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: DataTable2(
                                      // minWidth: 1600,
                                      columnSpacing: 10,
                                      border: TableBorder.all(
                                          color: Color.fromARGB(
                                              255, 206, 229, 234)),
                                      columns: [
                                        DataColumn2(
                                            // fixedWidth: 400,
                                            label: Text(
                                          "Material Name",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn2(
                                            // fixedWidth: 200,
                                            label: Text(
                                          "Assets",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        // DataColumn2(
                                        //     fixedWidth: 170,
                                        //     label: Text(
                                        //       "Material Type",
                                        //       style: TextStyle(
                                        //           fontSize: 15,
                                        //           fontWeight: FontWeight.bold),
                                        //     )),
                                        // DataColumn2(
                                        //     fixedWidth: 250,
                                        //     label: Text(
                                        //       "Image",
                                        //       style: TextStyle(
                                        //           fontSize: 15,
                                        //           fontWeight: FontWeight.bold),
                                        //     )),
                                        DataColumn2(
                                            fixedWidth: 150,
                                            label: Text(
                                              "Material Code ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        // DataColumn2(
                                        //     fixedWidth: 200,
                                        //     label: Text(
                                        //       "Material Category",
                                        //       style: TextStyle(
                                        //           fontSize: 15,
                                        //           fontWeight: FontWeight.bold),
                                        //     )),
                                        DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              "Sr No",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 130,
                                            label: Text(
                                              "Return Qty",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              "Remark",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 100,
                                            label: Text(
                                              "Action",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                      rows: controller.rowFaultyItem.value
                                          .map((record) {
                                        return DataRow(
                                          // height: 50,
                                          cells: record.map((mapData) {
                                            return DataCell(
                                              (mapData['key'] == "Drop_down")
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: DropdownWebWidget(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4,
                                                        dropdownList: controller
                                                            .assetList
                                                            .where((p0) =>
                                                                p0!.asset_type ==
                                                                    "Spare" &&
                                                                !controller
                                                                    .rowItem
                                                                    .map((p0) =>
                                                                        p0[0][
                                                                            "value"])
                                                                    .contains(p0!
                                                                        .name))
                                                            .toList()
                                                            .obs,
                                                        selectedValue:
                                                            mapData["value"],
                                                        onValueChanged: (list,
                                                            selectedValue) {
                                                          print({
                                                            "web",
                                                            controller
                                                                    .dropdownFaultyMapperData[
                                                                selectedValue]
                                                          });
                                                          mapData["value"] =
                                                              selectedValue;
                                                          controller.dropdownFaultyMapperData[
                                                                  selectedValue] =
                                                              list.firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .name ==
                                                                      selectedValue,
                                                                  orElse: null);
                                                        },
                                                      ),
                                                    )
                                                  : (mapData['key'] == "assets")
                                                      ? Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child:
                                                                  DropdownWebWidget(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4,
                                                                controller:
                                                                    controller,
                                                                dropdownList: controller
                                                                            .type.value ==
                                                                        2
                                                                    ? controller
                                                                        .scheduleCheckPointsdrop
                                                                    : controller
                                                                        .workingAreaList,
                                                                selectedValue:
                                                                    mapData[
                                                                        "value"],
                                                                onValueChanged:
                                                                    (list,
                                                                        selectedValue) {
                                                                  controller
                                                                      .selectedasset
                                                                      .value;
                                                                  mapData["value"] =
                                                                      selectedValue;

                                                                  controller
                                                                          .selectedasset
                                                                          .value =
                                                                      selectedValue;

                                                                  controller.checkdropdownMapperData[selectedValue] = list.firstWhere(
                                                                      (element) =>
                                                                          element
                                                                              .name ==
                                                                          selectedValue,
                                                                      orElse:
                                                                          null);
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : (mapData['key'] ==
                                                              "Return_Qty")
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                  width:
                                                                      (Get.width *
                                                                          .5),
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
                                                                      LoginCustomTextfield(
                                                                    // inputFormatters: <
                                                                    //     TextInputFormatter>[
                                                                    //   FilteringTextInputFormatter
                                                                    //       .digitsOnly
                                                                    // ],
                                                                    maxLine: 1,
                                                                    enabled:
                                                                        false,
                                                                    textController:
                                                                        new TextEditingController(
                                                                            text:
                                                                                mapData["value"] ?? ''),
                                                                    onChanged:
                                                                        (txt) {
                                                                      int return_qty =
                                                                          int.tryParse(txt) ??
                                                                              0;
                                                                      if (return_qty <=
                                                                          1) {
                                                                        mapData["value"] =
                                                                            txt;
                                                                      } else {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "You can only add 1 qty!");
                                                                        setState(
                                                                            () {
                                                                          mapData["value"] =
                                                                              mapData['value']!;
                                                                        });
                                                                      }
                                                                    },
                                                                  )),
                                                            )
                                                          : (mapData['key'] ==
                                                                  "Remark")
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Container(
                                                                      width: (Get.width * .5),
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
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child: LoginCustomTextfield(
                                                                        // inputFormatters: <
                                                                        //     TextInputFormatter>[
                                                                        //   FilteringTextInputFormatter
                                                                        //       .digitsOnly
                                                                        // ],
                                                                        maxLine:
                                                                            1,
                                                                        textController:
                                                                            new TextEditingController(text: mapData["value"] ?? ''),
                                                                        onChanged:
                                                                            (txt) {
                                                                          mapData["value"] =
                                                                              txt;
                                                                        },
                                                                      )),
                                                                )
                                                              : (mapData['key'] ==
                                                                      "Sr_no")
                                                                  ? Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child: Container(
                                                                          width: (Get.width * .5),
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
                                                                            // inputFormatters: <
                                                                            //     TextInputFormatter>[
                                                                            //   FilteringTextInputFormatter
                                                                            //       .digitsOnly
                                                                            // ],
                                                                            maxLine:
                                                                                1,
                                                                            textController:
                                                                                new TextEditingController(text: mapData["value"] ?? ''),
                                                                            onChanged:
                                                                                (txt) {
                                                                              mapData["value"] = txt;
                                                                            },
                                                                          )),
                                                                    )
                                                                  : (mapData['key'] ==
                                                                          "code")
                                                                      ? Text(
                                                                          "${controller.dropdownFaultyMapperData.value[record[0]['value']]?.asset_code ?? ""}")
                                                                      // : (mapData['key'] ==
                                                                      //         "Material_Type")
                                                                      //     ? Text(
                                                                      //         "${controller.dropdownFaultyMapperData.value[record[0]['value']]?.asset_type ?? ""}")
                                                                      // : (mapData['key'] ==
                                                                      //         "Material_Category")
                                                                      //     ? Text(
                                                                      //         "${controller.dropdownFaultyMapperData.value[record[0]['value']]?.cat_name ?? ""}")
                                                                      : (mapData['key'] ==
                                                                              "Action ")
                                                                          ? Padding(
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
                                                                          : Text(mapData['key'] ??
                                                                              ''),
                                            );
                                          }).toList(),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: Dimens.edgeInsets15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRichText(
                                      title: "Comment:",
                                      includeAsterisk: false),
                                  Dimens.boxWidth2,
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
                                        textController: controller.remarkCtrlr,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: Dimens.edgeInsets15,
                              child: Row(
                                children: [
                                  Text(
                                    'Set As Template: ',
                                    style: Styles.blackBold14,
                                  ),
                                  Dimens.boxWidth2,
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                            color: ColorValues.whiteColor,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: LoginCustomTextfield(
                                        // inputFormatters: [
                                        //   FilteringTextInputFormatter.deny(
                                        //       RegExp(r'\s')),
                                        // ],
                                        textController:
                                            controller.setTemlateCtrlr,
                                      )),
                                ],
                              ),
                            ),
                            Dimens.boxHeight15,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      backgroundColor: ColorValues.greenColor,
                      text: 'Submit',
                      onPressed: () {
                        if (!controller.allDropdownsSelected.value) {
                          Get.defaultDialog(
                            radius: 5,
                            title: 'Alert',
                            middleText: 'Please select all dropdown values!',
                            textConfirm: 'OK',
                            onConfirm: () {
                              Get.back(); // Close the dialog
                            },
                            buttonColor: ColorValues.appGreenColor,
                            confirmTextColor: Colors.white,
                          );
                        } else {
                          controller.createReturnMrs();
                        }

                        // controller.addUser();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      backgroundColor: ColorValues.redColor,
                      text: "Cancel",
                      onPressed: () {
                        Get.offAndToNamed(Routes.returnMrsList);
                      },
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }

  String _calculateDifference(String key) {
    final issuedQty = controller.dropdownMapperData[key]?.issued_qty ?? 0;
    final consumedQty = controller.dropdownMapperData[key]?.consumed_qty ?? 0;
    final difference = issuedQty - consumedQty;
    return difference.toString();
  }
}
