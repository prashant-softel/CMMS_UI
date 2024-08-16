import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_pm_plan/create_pm_plan_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/multipule_dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          () => SelectionArea(
            child: Scaffold(
              backgroundColor: ColorValues.whiteColor,
              body: Column(
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
                            Get.offNamed(Routes.preventive);
                          },
                          child: Text(" / PREVENTIVE MAINTENANCE",
                              style: Styles.greyLight14),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.pmPlanList);
                          },
                          child: Text(" / PM PLAN LIST",
                              style: Styles.greyLight14),
                        ),
                        controller.pmPlanId != 0
                            ? Text(" / UPDATE PM PLAN",
                                style: Styles.greyLight14)
                            : Text(" / CREATE PM PLAN",
                                style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Card(
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

                                                    //validate
                                                    errorController: controller
                                                            .isPMTitleInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          0) {
                                                        controller
                                                            .isPMTitleInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isPMTitleInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .deny(
                                                        RegExp('[\'^]'),
                                                      )
                                                    ],
                                                  )),
                                            ]),
                                            Dimens.boxHeight10,
                                            Row(children: [
                                              CustomRichText(
                                                  title:
                                                      '   Equipment Category :'),
                                              Dimens.boxWidth5,
                                              SizedBox(
                                                child: DropdownWebWidget(
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
                                                  //validate

                                                  errorController: controller
                                                          .isStartdateInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,

                                                  onChanged: (value) {
                                                    if (value.trim().length >
                                                        0) {
                                                      controller
                                                          .isStartdateInvalid
                                                          .value = false;
                                                    } else {
                                                      controller
                                                          .isStartdateInvalid
                                                          .value = true;
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Assign To :'),
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
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height: //50,
                                      // 200,
                                      ((controller.rowItem.value.length) * 30) +
                                          200,
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
                                              'Asset name',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                fixedWidth: 150,
                                                label: Text(
                                                  'Asset ID',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                              'Parent Asset',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                fixedWidth: 200,
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
                                                  fontWeight: FontWeight.bold),
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
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          dropdownList: controller
                                                              .preventiveCheckList,
                                                          selectedValue:
                                                              mapData["value"],
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
                                                      : Text(mapData['value'] ??
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
                                //  : Dimens.box0,
                                Dimens.boxHeight15,
                                Row(
                                  children: [
                                    Spacer(),
                                    // CustomElevatedButton(
                                    //   backgroundColor: ColorValues.appRedColor,
                                    //   text: 'cancel',
                                    //   onPressed: () {
                                    //     // controller.AddInventory();
                                    //   },
                                    // ),
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
                                              controller.isFormInvalid.value =
                                                  false;
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

                                  controller.openStartDatePicker = false;
                                  controller.isStartdateInvalid.value = false;
                                  controller.update(['stock_Mangement']);
                                },
                                onCancel: () {
                                  controller.openStartDatePicker = false;
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
          ),
        );
      },
    );
  }
}
