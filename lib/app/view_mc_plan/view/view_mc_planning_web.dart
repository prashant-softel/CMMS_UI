import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/mc_approve_dialog.dart';
import 'package:cmms/app/widgets/mc_reject_dialog.dart';
import 'package:cmms/app/widgets/set_equipments_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ViewMcPlaningWeb extends StatefulWidget {
  ViewMcPlaningWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewMcPlaningWeb> createState() => _ViewMcPlaningWebState();
}

class _ViewMcPlaningWebState extends State<ViewMcPlaningWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewMcPlaningController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(
          () => Scaffold(
            backgroundColor: ColorValues.whiteColor,
            body: Column(
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
                        color:
                            Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        child: Text(" / MODULE CLEANING",
                            style: Styles.greyMediumLight12),
                      ),
                      Text(" / VIEW MODULE CLEANING PLANNING ",
                          style: Styles.greyMediumLight12)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: Get.height,
                          child: Card(
                            margin: EdgeInsets.all(20),
                            color: Color.fromARGB(255, 245, 248, 250),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        " View Module Cleaning Planning ",
                                        style: Styles.blackBold14,
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 5),
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color: ColorValues.addNewColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Status"
                                          " ${controller.mcPlanDetailsModel.value?.status_short ?? ""}",
                                        ),
                                      ),
                                      Dimens.boxWidth10,
                                      Text(
                                        "Id:${controller.mcPlanDetailsModel.value?.planId} ",
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),

                                Dimens.boxHeight15,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Current Status:",
                                    ),
                                    Text(
                                      " ${controller.mcPlanDetailsModel.value?.status_long ?? ""}",
                                    )
                                  ],
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
                                          //
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Plan Title  :'),
                                              Dimens.boxWidth10,
                                              Text(
                                                  '${controller.mcPlanDetailsModel.value?.title ?? ''}',
                                                  style: Styles.blue17),
                                            ],
                                          ),

                                          Dimens.boxHeight10,
                                          Row(
                                            children: [
                                              Dimens.boxWidth10,
                                              CustomRichText(
                                                title: 'Frequency :',
                                              ),
                                              Dimens.boxWidth10,
                                              Obx(
                                                () => Text(
                                                    '${controller.mcPlanDetailsModel.value?.frequency ?? ""}', //  "Block 2 all Inverter maintenance plan",
                                                    style: Styles.blue17),
                                              ),
                                            ],
                                          ),

                                          Dimens.boxHeight10,
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Planning by :'),
                                                  Dimens.boxWidth10,
                                                  Obx(
                                                    () => Text(
                                                        '${controller.mcPlanDetailsModel.value?.createdBy ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                        style: Styles.blue17),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          Row(
                                            children: [
                                              Dimens.boxWidth10,
                                              CustomRichText(
                                                  title: 'Site Name  :'),
                                              Dimens.boxWidth10,
                                              Text(
                                                  '${controller.mcPlanDetailsModel.value?.title ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                  style: Styles.blue17),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          //
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Planning Date & Time :'),
                                              Dimens.boxWidth10,
                                              Text(
                                                  '${controller.mcPlanDetailsModel.value?.createdAt ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                  style: Styles.blue17),
                                            ],
                                          ),

                                          // Dimens.boxHeight10,
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight12,
                                // controller.filteredInventoryNameList.length > 0
                                //     ?
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height:
                                      // ((controller.filteredInventoryNameList
                                      //             .length) *
                                      //         40) +
                                      150,
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
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Schedule",
                                              style: Styles.blue700,
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Get.dialog(
                                                    SetEquipmentDialog());
                                              },
                                              // color: ColorValues.appDarkBlueColor,
                                              // onTap: () {
                                              //   controller.addRowItem();
                                              // },
                                              child: Container(
                                                height: 30,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorValues.addNewColor,
                                                  border: Border.all(
                                                    color: ColorValues
                                                        .lightGreyColorWithOpacity35,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Set Equipments",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: DataTable2(
                                          border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234)),
                                          columns: [
                                            DataColumn2(
                                              fixedWidth: 100,
                                              label: Text(
                                                "Day",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              //fixedWidth: 150,
                                              label: Text(
                                                'No. of Inverters',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: 150,
                                              label: Text(
                                                'No. of SMBs',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              // fixedWidth: 300,
                                              label: Text(
                                                'No of modules',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              // fixedWidth: 300,
                                              label: Text(
                                                'Type',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                          rows: controller.rowItem.value
                                              .map((record) {
                                            return DataRow(
                                              // height: 130,
                                              cells: record.map((mapData) {
                                                return DataCell(
                                                  (mapData['key'] == "type")
                                                      ? Padding(
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
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                dropdownList:
                                                                    controller
                                                                        .type,
                                                                selectedValue:
                                                                    mapData[
                                                                        "value"],
                                                                onValueChanged:
                                                                    (list,
                                                                        selectedValue) {
                                                                  // print('paifcghb:${controller.assetList}');
                                                                  // print({selectedValue: selectedValue});
                                                                  mapData["value"] =
                                                                      selectedValue;
                                                                  controller.typedropdownMapperData[selectedValue] = list.firstWhere(
                                                                      (element) =>
                                                                          element
                                                                              .name ==
                                                                          selectedValue,
                                                                      orElse:
                                                                          null);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : (mapData['key'] == "")
                                                          ? Text(mapData[
                                                                  'value'] ??
                                                              "")
                                                          : Text(mapData[
                                                                  'value'] ??
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
                                controller.historyList!.isEmpty
                                    ? Dimens.box0
                                    : Container(
                                        margin: Dimens.edgeInsets20,
                                        height:
                                            ((controller.historyList?.length ??
                                                        0) *
                                                    50) +
                                                125,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorValues
                                                .lightGreyColorWithOpacity35,
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorValues
                                                  .appBlueBackgroundColor,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "MC Plan History ",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color:
                                                  ColorValues.greyLightColour,
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataColumn(
                                                      label: Text(
                                                    "Posted By",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataColumn(
                                                      label: Text(
                                                    "Comment",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataColumn(
                                                      label: Text(
                                                    "Location",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataColumn(
                                                      label: Text(
                                                    "Status",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ],
                                                rows: List<DataRow>.generate(
                                                  controller.historyList
                                                          ?.length ??
                                                      0,
                                                  (index) => DataRow(cells: [
                                                    DataCell(Text(controller
                                                            .historyList?[index]
                                                            ?.createdAt
                                                            .toString() ??
                                                        '')),
                                                    DataCell(Text(controller
                                                            .historyList?[index]
                                                            ?.createdByName
                                                            .toString() ??
                                                        '')),
                                                    DataCell(Text(controller
                                                            .historyList?[index]
                                                            ?.comment
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

                                Dimens.boxHeight12,

                                // controller.type1 != 0 &&
                                controller.type1.value != null
                                    ? Row(
                                        children: [
                                          Spacer(),

                                          Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.rejectColor,
                                              text: "Reject1",
                                              icon: Icons.close,
                                              onPressed: () {
                                                Get.dialog(RejectMcPlan(
                                                  id: controller.id.value,
                                                ));
                                              },
                                            ),
                                          ),
                                          Dimens.boxWidth10,

                                          Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appGreenColor,
                                              text: "Approve",
                                              icon: Icons.add,
                                              onPressed: () {
                                                Get.dialog(ApproveMcPlan(
                                                  id: controller.id.value,
                                                ));
                                              },
                                            ),
                                          ),

                                          // : Dimens.box0,
                                          Spacer(),
                                        ],
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Dimens.boxHeight40,
              ],
            ),
          ),
        );
      },
    );
  }
}
