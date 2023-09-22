import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_pm_plan/create_pm_plan_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/multipule_dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
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
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 83),
                                      child: Row(
                                        children: [
                                          CustomRichText(title: 'Plan Title :'),
                                          Dimens.boxWidth5,
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
                                                  .35),
                                              child: LoginCustomTextfield(
                                                textController:
                                                    controller.planTittleCtrlr,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Dimens.boxHeight15,
                                    Row(
                                      children: [
                                        CustomRichText(
                                            title: 'Equipment Category :'),
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
                                                .isSelectedInventory.value,
                                            selectedValue: controller
                                                .selectedInventory.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(title: "Frequency"),
                                            Dimens.boxWidth5,
                                            SizedBox(
                                              child: DropdownWebStock(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
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
                                            Dimens.boxWidth80,
                                          ],
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight15,
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 81),
                                          child: Row(
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
                                                textController:
                                                    controller.startDateDateTc,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Spacer(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              MultipDropdownWebWidget(
                                width: (MediaQuery.of(context).size.width * .2),
                                dropdownList: controller.inventoryNameList,
                                selectedItems:
                                    controller.selectedInventoryNameList,
                                onValueChanged: controller.onValueChanged,
                              ),
                              Dimens.boxHeight25,
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                    height: 350,
                                    width: double.infinity,
                                    // margin: Dimens.edgeInsets20,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorValues
                                            .lightGreyColorWithOpacity35,
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
                                        Dimens.boxHeight15,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Dimens.boxWidth15,
                                            Text(
                                              "Equipment List",
                                              style: Styles.black15W400,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.5,
                                          height: 200, //Get.height - 70,
                                          child: Column(
                                              //
                                              children: [
                                                Expanded(
                                                  child: ScrollableTableView(
                                                    columns: [
                                                      "Sr. No.",
                                                      'Assest name',
                                                      'Assest ID',
                                                      'Parent Assest',
                                                      'Module Quantity',
                                                      "Checklist"
                                                    ].map((column) {
                                                      return TableViewColumn(
                                                          minWidth:
                                                              Get.width * 0.20,
                                                          label: column);
                                                    }).toList(),
                                                    rows: //
                                                        [
                                                      ...List.generate(
                                                        controller
                                                            .filteredInventoryNameList
                                                            .length,
                                                        (index) {
                                                          var facilityNameDetails =
                                                              controller
                                                                      .filteredInventoryNameList[
                                                                  index];

                                                          return [
                                                            '1',
                                                            '${facilityNameDetails?.name ?? ''}',
                                                            '${facilityNameDetails?.id ?? ''}',
                                                            '${facilityNameDetails?.parentName ?? ''}',
                                                            '${facilityNameDetails?.categoryId ?? ''}',
                                                            "check"
                                                          ];
                                                        },
                                                      ),
                                                    ].map((_inventoryDetailList) {
                                                      return TableViewRow(
                                                          onTap: () => {
                                                                //  print('ZERO = ${_inventoryDetailList[0]}')
                                                              },
                                                          height: 60,
                                                          cells:
                                                              _inventoryDetailList
                                                                  .map((value) {
                                                            return TableViewCell(
                                                              //key: ,
                                                              child: Text(value
                                                                  .toString()),
                                                            );
                                                          }).toList());
                                                    }).toList(),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    )),
                              ),
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
                                  CustomElevatedButton(
                                    backgroundColor: ColorValues.appGreenColor,
                                    text: 'Submit',
                                    onPressed: () {
                                      controller.createPmPlan();
                                    },
                                  ),
                                  Dimens.boxWidth15,
                                  CustomElevatedButton(
                                    backgroundColor: Color(0xff77cae7),
                                    text: 'Save as Draft',
                                    onPressed: () {
                                      // controller.submitPurchaseOrderData();
                                    },
                                  ),
                                  Spacer()
                                ],
                              ),
                              Dimens.boxHeight15,
                            ],
                          ),
                        ),
                        if (controller.openStartDatePicker)
                          Positioned(
                            left: 65,
                            top: 230,
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
