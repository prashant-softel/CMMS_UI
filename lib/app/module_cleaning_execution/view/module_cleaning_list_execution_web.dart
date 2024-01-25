import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/table_action_button.dart';

class ModuleCleaningListExecution extends StatefulWidget {
  ModuleCleaningListExecution({
    Key? key,
  }) : super(key: key);

  @override
  State<ModuleCleaningListExecution> createState() =>
      _ModuleCleaningListExecutionState();
}

class _ModuleCleaningListExecutionState
    extends State<ModuleCleaningListExecution> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleCleaningListExecutionController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(
            () {
              final dataSource = MCExcutionListDataSource(controller);
              return SingleChildScrollView(
                child: Column(
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
                              Get.offNamed(Routes.moduleCleaningDashboard);
                            },
                            child: Text(" / MODULE CLEANING",
                                style: Styles.greyLight14),
                          ),
                          Text(" / MODULE CLEANING EXECUTION",
                              style: Styles.greyLight14)
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 10, top: 30, right: 10),
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
                                        "Module Cleaning Execution",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          CustomRichText(title: 'Date Range'),
                                          Dimens.boxWidth10,
                                          CustomTextFieldForStock(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            numberTextField: true,
                                            onTap: () {
                                              controller
                                                      .openFromDateToStartDatePicker =
                                                  !controller
                                                      .openFromDateToStartDatePicker;
                                              controller.update(
                                                  ['stock_Mangement_Date']);
                                            },
                                            hintText:
                                                '${controller.formattedFromdate} - ${controller.formattedTodate}',
                                          ),
                                        ],
                                      ),
                                      //  ActionButton(
                                      //           icon: Icons.add,
                                      //           label: "Add New",
                                      //           onPressed: () {
                                      //             Get.offNamed(Routes
                                      //                 .updateGoodsOrdersDetailsScreen);
                                      //           },
                                      //           color: ColorValues.addNewColor,
                                      //         )
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Row(
                                  children: [
                                    PopupMenuButton<String>(
                                      tooltip: "",
                                      elevation: 25.0,
                                      child: Container(
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            right: 8,
                                            left: 8),
                                        decoration: BoxDecoration(
                                          color: ColorValues.appLightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          'Column Visibility',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[]..addAll(
                                                controller.columnVisibility
                                                    .value.entries
                                                    .map((e) {
                                              return PopupMenuItem<String>(
                                                  child: ValueListenableBuilder(
                                                      valueListenable:
                                                          controller
                                                              .columnVisibility,
                                                      builder: (context, value,
                                                          child) {
                                                        return Row(
                                                          children: [
                                                            Checkbox(
                                                              value:
                                                                  value[e.key],
                                                              onChanged:
                                                                  (newValue) {
                                                                controller
                                                                    .setColumnVisibility(
                                                                        e.key,
                                                                        newValue!);
                                                              },
                                                            ),
                                                            Text(e.key),
                                                          ],
                                                        );
                                                      }));
                                            })),
                                      onSelected: (String value) {
                                        // Handle column selection
                                      },
                                    ),

                                    // Container(
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //       backgroundColor:
                                    //           ColorValues.appLightBlueColor,
                                    //       onPressed: () {},
                                    //       text: 'Copy'),
                                    // ),
                                    // Container(
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //       backgroundColor:
                                    //           ColorValues.appLightBlueColor,
                                    //       onPressed: () {},
                                    //       text: 'Excel'),
                                    // ),
                                    // Container(
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //       backgroundColor:
                                    //           ColorValues.appLightBlueColor,
                                    //       onPressed: () {},
                                    //       text: 'PDF'),
                                    // ),
                                    Spacer(),
                                    Container(
                                      width: 200,
                                      height: 35,
                                      margin: Dimens.edgeInsets0_0_16_0,
                                      child: TextField(
                                        style: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        onChanged: (value) =>
                                            controller.search(value),
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          contentPadding:
                                              Dimens.edgeInsets10_0_0_0,
                                          hintText: 'search'.tr,
                                          hintStyle: Styles.grey12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                controller.mcTaskList.isEmpty
                                    ? Center(child: Text('No data'))
                                    : Expanded(
                                        child: ValueListenableBuilder(
                                            valueListenable:
                                                controller.columnVisibility,
                                            builder: (context, value, child) {
                                              final dataSource =
                                                  MCExcutionListDataSource(
                                                      controller);

                                              return PaginatedDataTable2(
                                                columnSpacing: 10,
                                                dataRowHeight: 70,
                                                source:
                                                    dataSource, // Custom DataSource class
                                                headingRowHeight:
                                                    Get.height * 0.12,
                                                minWidth: Get.width * 1.2,
                                                showCheckboxColumn: false,
                                                rowsPerPage:
                                                    10, // Number of rows per page
                                                availableRowsPerPage: [
                                                  10,
                                                  20,
                                                  30,
                                                  50
                                                ],
                                                columns: [
                                                  for (var entry
                                                      in value.entries)
                                                    if (entry.value)
                                                      buildDataColumn(
                                                        entry.key,
                                                        controller.filterText[
                                                            entry.key]!,
                                                        controller.columnwidth[
                                                            entry.key],
                                                      ),
                                                  buildDataColumn(
                                                    'Actions',
                                                    controller
                                                        .mcExecutionFilterText,
                                                    150,
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        if (controller.openFromDateToStartDatePicker)
                          Positioned(
                            right: 150,
                            top: 85,
                            child: DatePickerWidget(
                              selectionMode: DateRangePickerSelectionMode.range,
                              monthCellStyle: DateRangePickerMonthCellStyle(
                                todayCellDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorValues.appDarkBlueColor),
                              ), // last date of this year
                              // controller: DateRangePickerController(),
                              initialSelectedRange: PickerDateRange(
                                controller.fromDate.value,
                                controller.toDate.value,
                              ),

                              onSubmit: (value) {
                                print('po valu ${value.toString()}');
                                PickerDateRange? data =
                                    value as PickerDateRange;

                                var pickUpDate =
                                    DateTime.parse(data.startDate.toString());
                                controller.fromDate.value = pickUpDate;
                                var dropDate =
                                    DateTime.parse(data.endDate.toString());
                                dropDate != null
                                    ? controller.toDate.value = dropDate
                                    : controller.toDate.value = pickUpDate;

                                controller.getMcExcustionListByDate();
                                controller.openFromDateToStartDatePicker =
                                    !controller.openFromDateToStartDatePicker;
                                controller.update(['stock_Mangement_Date']);

                                // Get.toNamed(
                                //   Routes.stockManagementGoodsOrdersScreen,
                                // );
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          SizedBox(
            height: Get.height * 0.05,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onChanged: (value) {
                filterText.value = value;
                //   onSearchCallBack(value);
              },
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Filter',
                contentPadding:
                    EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
    // ),
  );
}

class MCExcutionListDataSource extends DataTableSource {
  final ModuleCleaningListExecutionController controller;

  late List<MCTaskListModel?> filteredMCExcutionList;

  MCExcutionListDataSource(this.controller) {
    filtersMcExcution();
  }

  ///
  void filtersMcExcution() {
    filteredMCExcutionList = <MCTaskListModel?>[];
    filteredMCExcutionList = controller.mcTaskList.where((McExcutionList) {
      return (McExcutionList!.id ?? '')
              .toString()
              .contains(controller.IDFilterText.value.toLowerCase()) &&
          (McExcutionList.planId ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (McExcutionList.frequency ?? '')
              .toString()
              .contains(controller.noOfDaysFilterText.value.toLowerCase()) &&
          (McExcutionList.noOfDays ?? '')
              .toString()
              .contains(controller.startDateFilterText.value.toLowerCase()) &&
          (McExcutionList.startDate ?? '')
              .toString()
              .contains(controller.doneDateFilterText.value.toLowerCase()) &&
          (McExcutionList.doneDate ?? '')
              .contains(controller.statusFilterText.value.toLowerCase()) &&
          (McExcutionList.status ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredMCExcutionList": filteredMCExcutionList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final McExcutionListDetails = filteredMCExcutionList[index];

    controller.Id.value = McExcutionListDetails?.id ?? 0;
    var cellsBuffer = [
      // '${McExcutionListDetails?.id ?? ''}',
      "id",
      '${McExcutionListDetails?.planId ?? ''}',

      '${McExcutionListDetails?.responsibility ?? ''}',

      '${McExcutionListDetails?.frequency ?? ''}',
      '${McExcutionListDetails?.noOfDays ?? ''}',
      '${McExcutionListDetails?.startDate ?? ''}',
      '${McExcutionListDetails?.doneDate ?? ''}',
      '${McExcutionListDetails?.status ?? ''}',

      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${McExcutionListDetails?.id}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            color: controller.mcTaskList
                                        .firstWhere(
                                          (e) =>
                                              e?.id ==
                                              McExcutionListDetails!.id,
                                          orElse: () => MCTaskListModel(id: 00),
                                        )
                                        ?.status ==
                                    301
                                ? ColorValues.approveColor
                                : ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${McExcutionListDetails?.status_short}',
                            style: Styles.white10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(
                        children: [
                          TableActionButton(
                            color: ColorValues.appDarkBlueColor,
                            icon: Icons.remove_red_eye_outlined,
                            message: 'View',
                            onPress: () {
                              int id = McExcutionListDetails?.id ?? 0;
                              int planId = McExcutionListDetails?.planId ?? 0;
                              if (id != 0) {
                                Get.toNamed(
                                    Routes.viewModuleCleaningExecutionScreen,
                                    arguments: {'id': id, "planId": planId});
                              }
                            },
                          ),
                          TableActionButton(
                            color: ColorValues.appYellowColor,
                            icon: Icons.edit,
                            message: 'Edit',
                            onPress: () {
                              int id = McExcutionListDetails?.id ?? 0;
                              int planId = McExcutionListDetails?.planId ?? 0;
                              if (id != 0) {
                                Get.toNamed(
                                    Routes.addModuleCleaningExecutionContentWeb,
                                    arguments: {"id": id, "planId": planId});
                              }
                            },
                            // onPress: () {
                            //   controller.StartEndMCExecution(
                            //       dataList: dataList);
                            // },
                          ),
                          // record[8] == "Abandoned"
                          //     ?
                          // TableActionButton(
                          //   color: ColorValues.appRedColor,
                          //   icon: Icons.close,
                          //   message: 'Abandon',
                          //   onPress: () {
                          //     int id = McExcutionListDetails?.id ?? 0;
                          //     if (id != 0) {
                          //       Get.dialog(AbandoneExecutionDialog(
                          //         id: id,
                          //       ));
                          //       // Get.toNamed(
                          //       //     Routes.addModuleCleaningExecutionContentWeb,
                          //       //     arguments: {
                          //       //       "id": id,
                          //       //     });
                          //     }
                          //   },
                          //   // onPress: () {
                          //   //   Get.dialog(AbandoneExecutionDialog(
                          //   //       id: int.tryParse('${record[0]}')));
                          //   // },
                          // ),
                          //     : Dimens.box0,
                          // record[8] == "Scheduled"
                          //     ?

                          // controller.mcTaskList
                          //             .firstWhere(
                          //               (e) =>
                          //                   e!.id == McExcutionListDetails!.id,
                          //               orElse: () => MCTaskListModel(id: 00),
                          //             )!
                          //             .status ==
                          //         361
                          //     ?
                          //         &&
                          //     varUserAccessModel.value.access_list!
                          //             .where((e) =>
                          //                 e.feature_id ==
                          //                     UserAccessConstants
                          //                         .kModuleCleaningFeatureId &&
                          //                 e.approve ==
                          //                     UserAccessConstants
                          //                         .kHaveApproveAccess)
                          //             .length >
                          //         0
                          // ?
                          TableActionButton(
                            color: ColorValues.appGreenColor,
                            icon: Icons.add,
                            message: 'Start/End',
                            onPress: () {
                              int id = McExcutionListDetails?.id ?? 0;
                              int planId = McExcutionListDetails?.planId ?? 0;
                              if (id != 0) {
                                Get.toNamed(
                                    Routes.addModuleCleaningExecutionContentWeb,
                                    arguments: {"id": id, "planId": planId});
                              }
                            },
                          )
                          // : Dimens.box0
                          // : Dimens.box0,
                          // record[8] == "Abandoned"
                          //     ? TableActionButton(
                          //         color: ColorValues.appGreenColor,
                          //         icon: Icons.add,
                          //         message: 'End',
                          //         onPress: () {
                          //           controller.StartEndMCExecution(
                          //               dataList: dataList);
                          // controller
                          //     .editIncidentReport(
                          //         id: int.tryParse(
                          //             '${record[0]}'));
                          // print(
                          //     'edit record:${int.tryParse('${record[0]}')}');
                          //     },
                          //   )
                          // : Dimens.box0,
                        ],
                      )
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        int id = McExcutionListDetails?.id ?? 0;
        int planId = McExcutionListDetails?.planId ?? 0;
        if (id != 0) {
          Get.toNamed(Routes.addModuleCleaningExecutionContentWeb,
              arguments: {"id": id, "planId": planId});
        }
      },
    );
  }

  @override
  int get rowCount => filteredMCExcutionList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

// import 'package:cmms/app/constant/constant.dart';
// import 'package:cmms/app/home/home_screen.dart';
// import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_controller.dart';
// import 'package:cmms/app/navigators/app_pages.dart';

// import 'package:cmms/app/theme/dimens.dart';
// import 'package:cmms/app/utils/user_access_constants.dart';
// import 'package:cmms/app/widgets/abandon_execution_dialog.dart';
// import 'package:cmms/app/widgets/action_button.dart';
// import 'package:cmms/app/widgets/add_mc_execution_dialog.dart';
// import 'package:cmms/app/widgets/custom_richtext.dart';
// import 'package:cmms/app/widgets/date_picker.dart';
// import 'package:cmms/app/widgets/table_action_button.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import '../../theme/color_values.dart';
// import '../../theme/styles.dart';
// import '../../widgets/custom_elevated_button.dart';

// class ModuleCleaningListExecution
//     extends GetView<ModuleCleaningListExecutionController> {
//   ModuleCleaningListExecution({super.key});

//   var controller = Get.find<ModuleCleaningListExecutionController>();

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ModuleCleaningListExecutionController>(
//         id: 'stock_Mangement_Date',
//         builder: (controller) {
//           return Scaffold(
//             body: Stack(
//               children: [
//                 Obx(
//                   () => Column(
//                     children: [
//                       Container(
//                         height: 45,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Color.fromARGB(255, 227, 224, 224),
//                             width: 1,
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromARGB(255, 236, 234, 234)
//                                   .withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.home,
//                               color: ColorValues.greyLightColor,
//                             ),
//                             Text(
//                               "DASHBOARD",
//                               style: Styles.greyLight14,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Text(" / MODULE EXECUTION",
//                                   style: Styles.greyMediumLight12),
//                             ),
//                             Text(" / MODULE CLEANING EXECUTION",
//                                 style: Styles.greyMediumLight12)
//                           ],
//                         ),
//                       ),
//                       Flexible(
//                         child: Container(
//                           width: Get.width * 7,
//                           margin: EdgeInsets.only(left: 10, top: 30),
//                           height: Get.height,
//                           child: Card(
//                             color: Color.fromARGB(255, 245, 248, 250),
//                             elevation: 10,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Module Cleaning Execution",
//                                         style: Styles.blackBold16,
//                                       ),
//                                       Spacer(),
//                                       Row(
//                                         children: [
//                                           CustomRichText(title: 'Date Range'),
//                                           Dimens.boxWidth10,
//                                           CustomTextFieldForStock(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 5,
//                                             numberTextField: true,
//                                             onTap: () {
//                                               controller
//                                                       .openFromDateToStartDatePicker =
//                                                   !controller
//                                                       .openFromDateToStartDatePicker;
//                                               controller.update(
//                                                   ['stock_Mangement_Date']);
//                                             },
//                                             hintText:
//                                                 '${controller.formattedTodate.toString()} - ${controller.formattedFromdate.toString()}',
//                                           ),
//                                         ],
//                                       ),
//                                       // Container(
//                                       //   child: Icon(
//                                       //     Icons.filter_alt_sharp,
//                                       //     // color: ColorValues.,
//                                       //   ),
//                                       // ),
//                                       // ActionButton(
//                                       //   icon: Icons.add,
//                                       //   label: "Add New",
//                                       //   onPressed: () {
//                                       //     //  Get.offNamed(Routes.addUser);
//                                       //   },
//                                       //   color: ColorValues.appGreenColor,
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                                 Divider(
//                                   color: ColorValues.greyLightColour,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: 45,
//                                       margin: EdgeInsets.only(left: 10),
//                                       child: CustomElevatedButton(
//                                           backgroundColor:
//                                               ColorValues.appLightBlueColor,
//                                           onPressed: () {},
//                                           text: 'Copy'),
//                                     ),
//                                     Container(
//                                       height: 45,
//                                       margin: EdgeInsets.only(left: 10),
//                                       child: CustomElevatedButton(
//                                           backgroundColor:
//                                               ColorValues.appLightBlueColor,
//                                           onPressed: () {},
//                                           text: 'Excel'),
//                                     ),
//                                     Container(
//                                       height: 45,
//                                       margin: EdgeInsets.only(left: 10),
//                                       child: CustomElevatedButton(
//                                           backgroundColor:
//                                               ColorValues.appLightBlueColor,
//                                           onPressed: () {},
//                                           text: 'PDF'),
//                                     ),
//                                     Container(
//                                       height: 45,
//                                       margin: EdgeInsets.only(left: 10),
//                                       child: CustomElevatedButton(
//                                         backgroundColor:
//                                             ColorValues.appLightBlueColor,
//                                         onPressed: () {},
//                                         text: 'columnVisibility'.tr,
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     Dimens.boxWidth10,
//                                     Container(
//                                       width: 200,
//                                       height: 35,
//                                       margin: Dimens.edgeInsets0_0_16_0,
//                                       child: TextField(
//                                         onChanged: (value) =>
//                                             controller.search(value),
//                                         decoration: InputDecoration(
//                                           enabledBorder:
//                                               const OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: Colors.grey, width: 0.0),
//                                           ),
//                                           focusedBorder:
//                                               const OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: Colors.grey, width: 0.0),
//                                           ),
//                                           contentPadding:
//                                               Dimens.edgeInsets10_0_0_0,
//                                           hintText: 'search'.tr,
//                                           hintStyle: Styles.grey12,
//                                         ),
//                                       ),
//                                     ),
//                                     Dimens.boxWidth10,
//                                     // varUserAccessModel.value.access_list!
//                                     //             .where((e) =>
//                                     //                 e.feature_id ==
//                                     //                     UserAccessConstants
//                                     //                         .kModuleCleaningExecutionFeatureId &&
//                                     //                 e.add ==
//                                     //                     UserAccessConstants
//                                     //                         .kNotHaveAddAccess)
//                                     //             .length >
//                                     //         0
//                                     //     ? ActionButton(
//                                     //         icon: Icons.add,
//                                     //         label: 'Add MC Execution',
//                                     //         onPressed: () {
//                                     //           // Get.toNamed(Routes
//                                     //           //     .addModuleCleaningExecutionContentWeb);
//                                     //           Get.dialog(AddMCExecutionDialog());
//                                     //         },
//                                     //         color: ColorValues.appGreenColor,
//                                     //       )
//                                     //     : Container(),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     margin: Dimens.edgeInsets15,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: ColorValues
//                                             .lightGreyColorWithOpacity35,
//                                         width: 1,
//                                       ),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: ColorValues
//                                               .appBlueBackgroundColor,
//                                           spreadRadius: 2,
//                                           blurRadius: 5,
//                                           offset: Offset(0, 2),
//                                         ),
//                                       ],
//                                     ),
//                                     child: controller.mcTaskList.isEmpty
//                                         ? ScrollableTableView(
//                                             columns: [
//                                               "ID",
//                                               "Plan ID",
//                                               "Responsibility",
//                                               "Frequency",
//                                               "No. Of Days",
//                                               "Start Date",
//                                               "Done Date",
//                                               "Status",
//                                               "Status code",
//                                               "Action",
//                                             ].map((column) {
//                                               return TableViewColumn(
//                                                 label: column,
//                                                 minWidth: Get.width * 0.16,
//                                               );
//                                             }).toList(),
//                                             rows: [
//                                               ...List.generate(
//                                                 controller.mcTaskList.length,
//                                                 (index) {
//                                                   return [
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                     '',
//                                                   ];
//                                                 },
//                                               ),
//                                             ].map((record) {
//                                               return TableViewRow(
//                                                 height: 55,
//                                                 cells: record.map((value) {
//                                                   return TableViewCell(
//                                                     child: Text(value),
//                                                   );
//                                                 }).toList(),
//                                               );
//                                             }).toList(),
//                                           )
//                                         : ScrollableTableView(
//                                             paginationController:
//                                                 controller.paginationController,
//                                             columns: [
//                                               "ID",
//                                               "Plan ID",
//                                               "Responsibility",
//                                               "Frequency",
//                                               "No. Of Days",
//                                               "Water Used",
//                                               "Start Date",
//                                               "Done Date",
//                                               "Status",
//                                               "Status code",
//                                               "Action",
//                                             ].map((column) {
//                                               return TableViewColumn(
//                                                 label: column,
//                                                 minWidth: Get.width * 0.09,
//                                               );
//                                             }).toList(),
//                                             // rows: [],
//                                             rows: [
//                                               ...List.generate(
//                                                 controller.mcTaskList.length,
//                                                 (index) => [
//                                                   '${controller.mcTaskList[index]!.id}',
//                                                   '${controller.mcTaskList[index]!.planId}',
//                                                   '${controller.mcTaskList[index]!.responsibility}',
//                                                   '${controller.mcTaskList[index]!.frequency}',
//                                                   '${controller.mcTaskList[index]!.noOfDays}',
//                                                   '${controller.mcTaskList[index]!.water_used}',
//                                                   '${controller.mcTaskList[index]!.startDate}',
//                                                   '${controller.mcTaskList[index]!.doneDate}',
//                                                   '${controller.mcTaskList[index]!.status_short}',
//                                                   '${controller.mcTaskList[index]!.status}',
//                                                   'Actions'
//                                                 ],
//                                               ),
//                                             ].map((record) {
//                                               return TableViewRow(
//                                                 onTap: () {
//                                                   controller.viewMCExecution(
//                                                       id: int.tryParse(
//                                                           '${record[0]}'));
//                                                 },
//                                                 height: 80,
//                                                 cells: record.map((value) {

//                                                   final Map<String, dynamic>
//                                                       dataList = {
//                                                     'id': int.tryParse(
//                                                         '${record[0]}'),
//                                                     'status': '${record[8]}',
//                                                     'planId': int.tryParse(
//                                                         '${record[1]}'),
//                                                     'cleaningDays':
//                                                         int.tryParse(
//                                                             '${record[4]}'),
//                                                     'waterUsed': int.tryParse(
//                                                         '${record[5]}'),
//                                                     // {'id': 2, 'name': 'Item 2'},
//                                                     // {'id': 3, 'name': 'Item 3'},
//                                                     // {'id': 4, 'name': 'Item 4'},
//                                                     // {'id': 5, 'name': 'Item 5'},
//                                                   };
//                                                   return TableViewCell(
//                                                     child: value == "Actions"
//                                                         ?
//                                                         Wrap(
//                                                             children: [
//                                                               TableActionButton(
//                                                                 color: ColorValues
//                                                                     .appDarkBlueColor,
//                                                                 icon: Icons
//                                                                     .remove_red_eye_outlined,
//                                                                 message: 'View',
//                                                                 onPress: () {
//                                                                   controller
//                                                                       .viewMCExecution(
//                                                                     id: int.tryParse(
//                                                                         '${record[0]}'),
//                                                                     planId: int
//                                                                         .tryParse(
//                                                                             '${record[1]}'),
//                                                                   );
//                                                                 },
//                                                               ),
//                                                               TableActionButton(
//                                                                 color: ColorValues
//                                                                     .appYellowColor,
//                                                                 icon:
//                                                                     Icons.edit,
//                                                                 message: 'Edit',
//                                                                 onPress: () {
//                                                                   controller.StartEndMCExecution(
//                                                                       dataList:
//                                                                           dataList);
//                                                                 },
//                                                               ),
//                                                               record[8] ==
//                                                                       "Abandoned"
//                                                                   ? TableActionButton(
//                                                                       color: ColorValues
//                                                                           .appRedColor,
//                                                                       icon: Icons
//                                                                           .close,
//                                                                       message:
//                                                                           'Abandon',
//                                                                       onPress:
//                                                                           () {
//                                                                         Get.dialog(
//                                                                             AbandoneExecutionDialog(id: int.tryParse('${record[0]}')));
//                                                                       },
//                                                                     )
//                                                                   : Dimens.box0,
//                                                               record[8] ==
//                                                                       "Scheduled"
//                                                                   ? TableActionButton(
//                                                                       color: ColorValues
//                                                                           .appGreenColor,
//                                                                       icon: Icons
//                                                                           .add,
//                                                                       message:
//                                                                           'Start',
//                                                                       onPress:
//                                                                           () {
//                                                                         // controller.startMCExecutionButton(
//                                                                         //     planId:
//                                                                         //         int.tryParse('${record[1]}'));
//                                                                         // controller.startMCExecution(planId:int.tryParse('${record[1]}'),);
//                                                                         controller.StartEndMCExecution(
//                                                                             dataList:
//                                                                                 dataList);
//                                                                       },
//                                                                     )
//                                                                   : Dimens.box0,
//                                                               record[8] ==
//                                                                       "Abandoned"
//                                                                   ? TableActionButton(
//                                                                       color: ColorValues
//                                                                           .appGreenColor,
//                                                                       icon: Icons
//                                                                           .add,
//                                                                       message:
//                                                                           'End',
//                                                                       onPress:
//                                                                           () {
//                                                                         controller.StartEndMCExecution(
//                                                                             dataList:
//                                                                                 dataList);
//                                                                         // controller
//                                                                         //     .editIncidentReport(
//                                                                         //         id: int.tryParse(
//                                                                         //             '${record[0]}'));
//                                                                         // print(
//                                                                         //     'edit record:${int.tryParse('${record[0]}')}');
//                                                                       },
//                                                                     )
//                                                                   : Dimens.box0,
//                                                             ],
//                                                           )

//                                                         : Text(value),
//                                                   );
//                                                 }).toList(),
//                                               );
//                                             }).toList(),
//                                           ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 25),
//                                   child: ValueListenableBuilder(
//                                       valueListenable:
//                                           controller.paginationController,
//                                       builder: (context, value, child) {
//                                         return Row(children: [
//                                           Text(
//                                               "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
//                                           Row(children: [
//                                             IconButton(
//                                               onPressed: controller
//                                                           .paginationController
//                                                           .currentPage <=
//                                                       1
//                                                   ? null
//                                                   : () {
//                                                       controller
//                                                           .paginationController
//                                                           .previous();
//                                                     },
//                                               iconSize: 20,
//                                               splashRadius: 20,
//                                               icon: Icon(
//                                                 Icons
//                                                     .arrow_back_ios_new_rounded,
//                                                 color: controller
//                                                             .paginationController
//                                                             .currentPage <=
//                                                         1
//                                                     ? Colors.black26
//                                                     : Theme.of(context)
//                                                         .primaryColor,
//                                               ),
//                                             ),
//                                             IconButton(
//                                               onPressed: controller
//                                                           .paginationController
//                                                           .currentPage >=
//                                                       controller
//                                                           .paginationController
//                                                           .pageCount
//                                                   ? null
//                                                   : () {
//                                                       controller
//                                                           .paginationController
//                                                           .next();
//                                                     },
//                                               iconSize: 20,
//                                               splashRadius: 20,
//                                               icon: Icon(
//                                                 Icons.arrow_forward_ios_rounded,
//                                                 color: controller
//                                                             .paginationController
//                                                             .currentPage >=
//                                                         controller
//                                                             .paginationController
//                                                             .pageCount
//                                                     ? Colors.black26
//                                                     : Theme.of(context)
//                                                         .primaryColor,
//                                               ),
//                                             ),
//                                           ]),
//                                         ]);
//                                       }),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (controller.openFromDateToStartDatePicker)
//                   Positioned(
//                     right: 230,
//                     top: 90,
//                     child: DatePickerWidget(
//                       selectionMode: DateRangePickerSelectionMode.range,
//                       monthCellStyle: DateRangePickerMonthCellStyle(
//                         todayCellDecoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorValues.appDarkBlueColor),
//                       ), // last date of this year
//                       // controller: DateRangePickerController(),
//                       initialSelectedRange: PickerDateRange(
//                         controller.fromDate.value,
//                         controller.toDate.value,
//                       ),

//                       onSubmit: (value) {
//                         print('po valu ${value.toString()}');
//                         PickerDateRange? data = value as PickerDateRange;

//                         var pickUpDate =
//                             DateTime.parse(data.startDate.toString());
//                         controller.fromDate.value = pickUpDate;
//                         var dropDate = DateTime.parse(data.endDate.toString());
//                         dropDate != null
//                             ? controller.toDate.value = dropDate
//                             : controller.toDate.value = pickUpDate;

//                         controller.getMCListByDate();
//                         controller.openFromDateToStartDatePicker =
//                             !controller.openFromDateToStartDatePicker;
//                         controller.update(['stock_Mangement_Date']);

//                         // Get.toNamed(
//                         //   Routes.stockManagementGoodsOrdersScreen,
//                         // );
//                       },
//                     ),
//                   ),
//               ],
//             ),
//           );
//         });
//   }
// }
