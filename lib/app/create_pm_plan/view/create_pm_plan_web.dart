import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_pm_plan/create_pm_plan_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/multipule_dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreatePmPlanWeb extends StatefulWidget {
  CreatePmPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePmPlanWeb> createState() => _CreatePmPlanWebState();
}

class _CreatePmPlanWebState extends State<CreatePmPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePmPlanController>(
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
                        child: Text(" / PREVENTIVE MAINTENANCE",
                            style: Styles.greyMediumLight12),
                      ),
                      Text(" / CREATE PM PLAN", style: Styles.greyMediumLight12)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height,
                          child: Card(
                            margin: EdgeInsets.all(20),
                            color: ColorValues.whiteColor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10, left: 10),
                                        child: Text(
                                          " Create PM Plan",
                                          style: Styles.blackBold14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Dimens.boxHeight15,
                                Container(
                                  margin: EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(children: [
                                              CustomRichText(
                                                  title: 'Plan Title :'),
                                              Dimens.boxWidth5,
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
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
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .planTittleCtrlr,
                                                  )),
                                            ]),
                                            Dimens.boxHeight10,
                                            Row(children: [
                                              CustomRichText(
                                                  title:
                                                      '   Equipment Category :'),
                                              Dimens.boxWidth5,
                                              SizedBox(
                                                child: DropdownWebStock(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  controller: controller,
                                                  dropdownList: controller
                                                      .equipmentCategoryList,
                                                  isValueSelected: controller
                                                      .isSelectedInventory
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedInventory.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ]),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Equipments :'),
                                                Dimens.boxWidth5,
                                                MultipDropdownWebWidget(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  //  height: 35,
                                                  dropdownList: controller
                                                      .inventoryNameList,
                                                  selectedItems: controller
                                                      .selectedInventoryNameList,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ],
                                            ),
                                          ]),
                                      Spacer(),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: "Frequency"),
                                                Dimens.boxWidth5,
                                                SizedBox(
                                                  child: DropdownWebStock(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .frequencyList,
                                                    isValueSelected: controller
                                                        .isSelectedfrequency
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedfrequency
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Start Date :'),
                                                Dimens.boxWidth5,
                                                CustomTextFieldForStock(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  numberTextField: true,
                                                  onTap: () {
                                                    controller
                                                            .openStartDatePicker =
                                                        !controller
                                                            .openStartDatePicker;
                                                    controller.update(
                                                        ['stock_Mangement']);
                                                  },
                                                  textController: controller
                                                      .startDateDateTc,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Assigned To :'),
                                                Dimens.boxWidth10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
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
                                                  child: DropdownWebWidget(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .assignedToList,
                                                    isValueSelected: controller
                                                        .isAssignedToSelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedAssignedTo
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight12,
                                // controller.filteredInventoryNameList.length > 0
                                //     ?
                                Expanded(
                                  child: Container(
                                    margin: Dimens.edgeInsets20,
                                    height: 600,
                                    //  ((controller
                                    //             .filteredInventoryNameList
                                    //             .length) *
                                    //         30) +
                                    //     100,
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
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Equipment List ",
                                                style: Styles.blue700,
                                              ),
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
                                                  //fixedWidth: 150,
                                                  label: Text(
                                                'Assest name',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  fixedWidth: 150,
                                                  label: Text(
                                                    'Assest ID',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                'Parent Assest',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                'Module Quantity',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                "Checklist",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            rows: controller.rowItem.value
                                                .map((record) {
                                              return DataRow(
                                                // height: 130,
                                                cells: record.map((mapData) {
                                                  return DataCell(
                                                    (mapData['key'] ==
                                                            "checklist")
                                                        ? DropdownWebStock(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            dropdownList: controller
                                                                .preventiveCheckList,
                                                            selectedValue:
                                                                mapData[
                                                                    "value"],
                                                            onValueChanged: (list,
                                                                selectedValue) {
                                                              mapData["value"] =
                                                                  selectedValue;
                                                              controller.checkdropdownMapperData[
                                                                      selectedValue] =
                                                                  list.firstWhere(
                                                                      (element) =>
                                                                          element
                                                                              .name ==
                                                                          selectedValue,
                                                                      orElse:
                                                                          null);
                                                            },
                                                          )
                                                        : Text(
                                                            mapData['value'] ??
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
                                ),
                                //  : Dimens.box0,
                                Dimens.boxHeight15,
                                Row(
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
                                    controller.pmPlanId != 0
                                        ? CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.updateColor,
                                            text: 'Update',
                                            onPressed: () {
                                              controller.updatePmPlan();
                                            },
                                          )
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appGreenColor,
                                            text: 'Submit',
                                            onPressed: () {
                                              controller.createPmPlan();
                                            },
                                          ),
                                    // Dimens.boxWidth15,
                                    // CustomElevatedButton(
                                    //   backgroundColor: Color(0xff77cae7),
                                    //   text: 'Save as Draft',
                                    //   onPressed: () {
                                    //     // controller.submitPurchaseOrderData();
                                    //   },
                                    // ),
                                    Spacer()
                                  ],
                                ),
                                Dimens.boxHeight15,
                              ],
                            ),
                          ),
                        ),
                        if (controller.openStartDatePicker)
                          Positioned(
                            right: 300,
                            top: 150,
                            child: DatePickerWidget(
                              minDate: DateTime(DateTime.now().year),
                              maxDate: DateTime(DateTime.now().year, 13,
                                  0), // last date of this year
                              controller: DateRangePickerController(),
                              selectionChanges: (p0) {
                                print('po valu ${p0.value.toString()}');
                                controller.startDateDateTc.text =
                                    DateFormat('yyyy-MM-dd').format(p0.value);
                                controller.openStartDatePicker =
                                    !controller.openStartDatePicker;
                                controller.update(['stock_Mangement']);
                              },
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
