import 'package:cmms/app/app.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/set_equipments_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ModuleCleaningPlanningWeb extends StatefulWidget {
  ModuleCleaningPlanningWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ModuleCleaningPlanningWeb> createState() =>
      _ModuleCleaningPlanningWebState();
}

class _ModuleCleaningPlanningWebState extends State<ModuleCleaningPlanningWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleCleaningPlanningController>(
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
                      Text(" / ADD MODULE CLEANING PLAN",
                          style: Styles.greyMediumLight12)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
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
                                              "Add Module Cleaning Plan",
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
                                                      title: 'Title :'),
                                                  Dimens.boxWidth10,
                                                  GoodsOrderTextField(
                                                    textController:
                                                        controller.mcTitelCtrlr,
                                                  ),
                                                ],
                                              ),

                                              Dimens.boxHeight10,
                                              Row(
                                                children: [
                                                  Dimens.boxWidth10,
                                                  CustomRichText(
                                                      title: 'Frequency : '),
                                                  Dimens.boxWidth10,
                                                  SizedBox(
                                                    child: DropdownWebWidget(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
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
                                                          title: 'Start date:'),
                                                      Dimens.boxWidth10,
                                                      CustomTextFieldForStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        numberTextField: true,
                                                        onTap: () {
                                                          controller
                                                                  .openStartDatePicker =
                                                              !controller
                                                                  .openStartDatePicker;
                                                          controller.update([
                                                            'stock_Mangement'
                                                          ]);
                                                        },
                                                        textController:
                                                            controller
                                                                .startDateTc,
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
                                                      title:
                                                          'Estimated Duration In Day'),
                                                  Dimens.boxWidth10,
                                                  SizedBox(
                                                    child: LoginCustomTextfield(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      textController: controller
                                                          .durationInDayCtrlr,
                                                      width:
                                                          MediaQuery.of(context)
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
                                                  "Schedule",
                                                  style: Styles.blue700,
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    
                                                    // controller.schedules.
                                                  
                                                    Get.dialog(
                                                        SetEquipmentDialog(
                                                        planId: controller.id.value, 
                                                        facilityId: controller.facilityId, 
                                                        noOfCleaningDays: 1,
                                                        frequencyId: 25,
                                                        assignedToId: 25,
                                                        )
                                                        );
                                                  },
                                                  // color: ColorValues.appDarkBlueColor,
                                                  // onTap: () {
                                                  //   controller.addRowItem();
                                                  // },
                                                  child: Container(
                                                    height: 30,
                                                    width: 150,
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
                                                        "Set Equipments",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            color:
                                                                Colors.white),
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
                                                                              element.name ==
                                                                              selectedValue,
                                                                          orElse:
                                                                              null);
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : (mapData['key'] ==
                                                                  "")
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 35,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.redColor,
                                            text: "Cancel",
                                            onPressed: () {
                                              final _flutterSecureStorage =
                                                  // const FlutterSecureStorage();

                                                  // _flutterSecureStorage.delete(
                                                  // key: "userId");

                                                  Get.back();
                                            },
                                          ),
                                        ),
                                        Dimens.boxWidth20,
                                        Container(
                                          height: 35,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.greenColor,
                                            text: 'Submit',
                                            onPressed: () {
                                              controller.createMcPlan();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (controller.openStartDatePicker)
                              Positioned(
                                right: 175,
                                top: 150,
                                child: DatePickerWidget(
                                  minDate: DateTime(DateTime.now().year),
                                  maxDate: DateTime(DateTime.now().year, 13,
                                      0), // last date of this year
                                  controller: DateRangePickerController(),
                                  selectionChanges: (p0) {
                                    print('po valu ${p0.value.toString()}');
                                    controller.startDateTc.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(p0.value);
                                    controller.openStartDatePicker =
                                        !controller.openStartDatePicker;
                                    controller.update(['stock_Mangement']);
                                  },
                                ),
                              ),
                          ],
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
