import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/add_module_cleaning_execution_dialog.dart';
import 'package:cmms/app/widgets/create%20_schedule_dialog.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/set_equipments_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class ModuleCleaningPlanning extends StatefulWidget {
  ModuleCleaningPlanning({
    Key? key,
  }) : super(key: key);

  @override
  State<ModuleCleaningPlanning> createState() => _ModuleCleaningPlanningState();
}

class _ModuleCleaningPlanningState extends State<ModuleCleaningPlanning> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleCleaningPlanningController>(
        id: 'module_cleanning',
        builder: (controller) {
          return Column(
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
                    Text(" / ADD MODULE CLEANING PLAN",
                        style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width * 7,
                    margin: EdgeInsets.only(left: 10, top: 30),
                    height: Get.height,
                    child: Card(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add Module Cleaning Plan",
                                  style: Styles.blackBold16,
                                ),
                                // ActionButton(
                                //   icon: Icons.add,
                                //   label: "Add New",
                                //   onPressed: () {
                                //     //  Get.offNamed(Routes.addUser);
                                //   },
                                //   color: ColorValues.greenlightColor,
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorValues.greyLightColour,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: Dimens.edgeInsets20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //
                                    Row(
                                      children: [
                                        CustomRichText(title: 'Title :'),
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
                                      ],
                                    ),

                                    Dimens.boxHeight10,
                                    Row(
                                      children: [
                                        Dimens.boxWidth10,
                                        CustomRichText(title: 'Frequency : '),
                                        Dimens.boxWidth10,
                                        SizedBox(
                                          child: DropdownWebWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            controller: controller,
                                            dropdownList:
                                                controller.frequencyList,
                                            isValueSelected: controller
                                                .isSelectedfrequency.value,
                                            selectedValue: controller
                                                .selectedfrequency.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Dimens.boxHeight10,
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Dimens.boxWidth10,
                                            CustomRichText(
                                                title: 'Created by:'),
                                            Dimens.boxWidth10,
                                            SizedBox(
                                              child: DropdownWebWidget(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                controller: controller,
                                                dropdownList:
                                                    controller.frequencyList,
                                                isValueSelected: controller
                                                    .isSelectedfrequency.value,
                                                selectedValue: controller
                                                    .selectedfrequency.value,
                                                onValueChanged:
                                                    controller.onValueChanged,
                                              ),
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
                                            title: 'Estimated Duration In Day'),
                                        Dimens.boxWidth10,
                                        SizedBox(
                                          child: LoginCustomTextfield(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
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
                          Container(
                            margin: Dimens.edgeInsets20,
                            height:
                                // ((controller.filteredInventoryNameList.length) *
                                //         40) +
                                200,
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
                                        "Schedule",
                                        style: Styles.blue700,
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Get.dialog(SetEquipmentDialog());
                                        },
                                        // color: ColorValues.appDarkBlueColor,
                                        // onTap: () {
                                        //   controller.addRowItem();
                                        // },
                                        child: Container(
                                          height: 30,
                                          width: 150,
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
                                              "Set Equipments",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w100,
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
                                        color:
                                            Color.fromARGB(255, 206, 229, 234)),
                                    columns: [
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          "Day",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn2(
                                        //fixedWidth: 150,
                                        label: Text(
                                          'No. of Inverters',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'No. of SMBs',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn2(
                                        // fixedWidth: 300,
                                        label: Text(
                                          'No of modules',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn2(
                                        // fixedWidth: 300,
                                        label: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                    rows:
                                        controller.rowItem.value.map((record) {
                                      return DataRow(
                                        // height: 130,
                                        cells: record.map((mapData) {
                                          return DataCell(
                                            (mapData['key'] == "type")
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                              controller.type,
                                                          selectedValue:
                                                              mapData["value"],
                                                          onValueChanged: (list,
                                                              selectedValue) {
                                                            // print('paifcghb:${controller.assetList}');
                                                            // print({selectedValue: selectedValue});
                                                            mapData["value"] =
                                                                selectedValue;
                                                            controller.typedropdownMapperData[
                                                                    selectedValue] =
                                                                list.firstWhere(
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
                                                    ? Text(
                                                        mapData['value'] ?? "")
                                                    : Text(
                                                        mapData['value'] ?? ''),
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
                  ),
                ),
              ),
            ],
          );
        });
  }
}
