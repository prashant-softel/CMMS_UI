import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/create%20_schedule_dialog.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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
                    Text(" / Add Module Cleaning Plan",
                        style: Styles.greyMediumLight12)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
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
                                            CustomRichText(
                                                title: 'Frequency : '),
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
                                        // Dimens.boxHeight10,
                                        // Row(
                                        //   children: [
                                        //     CustomRichText(
                                        //         title: 'Start Date: '),
                                        //     Dimens.boxWidth10,
                                        //     CustomTextFieldForStock(
                                        //       width: MediaQuery.of(context)
                                        //               .size
                                        //               .width /
                                        //           5.1,
                                        //       numberTextField: true,
                                        //       onTap: () {
                                        //         controller.openStartDatePicker =
                                        //             !controller
                                        //                 .openStartDatePicker;
                                        //         controller.update(
                                        //             ['module_cleanning']);
                                        //       },
                                        //       textController:
                                        //           controller.startDateTc,
                                        //     ),
                                        //   ],
                                        // ),

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
                                                Dimens.boxWidth10,
                                                CustomRichText(
                                                    title: 'Created by:'),
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
                                            Dimens.boxHeight10
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          children: [
                                            Dimens.boxWidth10,
                                            CustomRichText(
                                                title:
                                                    'Estimated Duration\n                       In Day'),
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
                                    Dimens.boxWidth30,
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Row(
                                        children: [
                                          Text("Assets"),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Get.dialog(CreateSchedule());
                                            },
                                            child: Text("+ Add"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Obx(
                                    //   () => Container(
                                    //     margin: Dimens.edgeInsets15,
                                    //     decoration: BoxDecoration(
                                    //       border: Border.all(
                                    //         color: ColorValues
                                    //             .lightGreyColorWithOpacity35,
                                    //         width: 1,
                                    //       ),
                                    //       boxShadow: [
                                    //         BoxShadow(
                                    //           color: ColorValues
                                    //               .appBlueBackgroundColor,
                                    //           spreadRadius: 2,
                                    //           blurRadius: 5,
                                    //           offset: Offset(0, 2),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     child: ScrollableTableView(
                                    //       // paginationController:
                                    //       //     controller.paginationController,
                                    //       columns: [
                                    //         "MRS ID",
                                    //         "MRS Details",
                                    //         "Order Date",
                                    //         "Activity",
                                    //         "Where Used",
                                    //         "Action",
                                    //       ].map((column) {
                                    //         return TableViewColumn(
                                    //           label: column,
                                    //           minWidth: Get.width * 0.13,
                                    //         );
                                    //       }).toList(),
                                    //       // rows: [],
                                    //       rows: [
                                    //         [
                                    //           "PR1000",
                                    //           "Requested by:Amit\nIssued by:Sujit kumar",
                                    //           "2023-09-08",
                                    //           "String faluire",
                                    //           "Job11122",
                                    //           "Action"
                                    //         ],
                                    //         [
                                    //           "PR1000",
                                    //           "Requested by:Amit\nIssued by:Sujit kumar",
                                    //           "2023-09-08",
                                    //           "String faluire",
                                    //           "Job11122",
                                    //           "Action"
                                    //         ],
                                    //         [
                                    //           "PR1000",
                                    //           "Requested by:Amit\nIssued by:Sujit kumar",
                                    //           "2023-09-08",
                                    //           "String faluire",
                                    //           "Job11122",
                                    //           "Action"
                                    //         ],
                                    //         [
                                    //           "PR1000",
                                    //           "Requested by:Amit\nIssued by:Sujit kumar",
                                    //           "2023-09-08",
                                    //           "String faluire",
                                    //           "Job11122",
                                    //           "Action"
                                    //         ],
                                    //         [
                                    //           "PR1000",
                                    //           "Requested by:Amit\nIssued by:Sujit kumar",
                                    //           "2023-09-08",
                                    //           "String faluire",
                                    //           "Job11122",
                                    //           "Action"
                                    //         ],
                                    //         [
                                    //           "PR1000",
                                    //           "Requested by:Amit\nIssued by:Sujit kumar",
                                    //           "2023-09-08",
                                    //           "String faluire",
                                    //           "Job11122",
                                    //           "Action"
                                    //         ],
                                    //       ].map((record) {
                                    //         return TableViewRow(
                                    //           height: 60,
                                    //           cells: record.map((value) {
                                    //             return TableViewCell(
                                    //               child: value == "Action"
                                    //                   ? TableActionButton(
                                    //                       color: ColorValues
                                    //                           .appDarkBlueColor,
                                    //                       icon: Icons
                                    //                           .remove_red_eye_outlined,
                                    //                       label: 'View/Edit',
                                    //                       onPress: () {
                                    //                         //   Get.toNamed(Routes
                                    //                         // .calibrationViewScreen);
                                    //                       },
                                    //                     )
                                    //                   : Text(value),
                                    //             );
                                    //           }).toList(),
                                    //         );
                                    //       }).toList(),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (controller.openStartDatePicker)
                      //   Positioned(
                      //     left: 230,
                      //     top: 300,
                      //     child: DatePickerWidget(
                      //       minDate: DateTime(DateTime.now().year),
                      //       maxDate: DateTime(DateTime.now().year, 13,
                      //           0), // last date of this year
                      //       controller: DateRangePickerController(),
                      //       selectionChanges: (startDate) {
                      //         print(
                      //             'startDate valu ${startDate.value.toString()}');
                      //         controller.startDateTc.text =
                      //             DateFormat('yyyy-MM-dd')
                      //                 .format(startDate.value);
                      //         controller.openStartDatePicker =
                      //             !controller.openStartDatePicker;
                      //         controller.update(['module_cleanning']);
                      //       },
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
