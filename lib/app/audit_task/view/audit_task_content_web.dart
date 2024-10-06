import 'package:cmms/app/audit_task/audit_task_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/table_action_button.dart';

class AuditTaskContentWeb extends StatefulWidget {
  AuditTaskContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AuditTaskContentWeb> createState() => _AuditTaskContentWebState();
}

class _AuditTaskContentWebState extends State<AuditTaskContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuditTaskController>(
        id: 'AuditTask',
        builder: (controller) {
          return SelectionArea(
            child: Obx(() {
              final dataSource = PmTaskDataSource(controller);

              return Column(
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
                            controller.type.value == AppConstants.kMis
                                ? Get.offNamed(Routes.misDashboard)
                                : controller.type.value ==
                                        AppConstants.kEvaluation
                                    ? Get.offNamed(Routes.evaluation)
                                    : Get.offNamed(Routes.audit);
                          },
                          child: controller.type.value == AppConstants.kMis
                              ? Text(" / MIS", style: Styles.greyLight14)
                              : controller.type.value ==
                                      AppConstants.kEvaluation
                                  ? Text(" / EVALUATION",
                                      style: Styles.greyLight14)
                                  : Text(" / AUDIT", style: Styles.greyLight14),
                        ),
                        controller.type.value == AppConstants.kMis
                            ? Text(" / OBSERVATION PLAN",
                                style: Styles.greyLight14)
                            : controller.type.value == AppConstants.kEvaluation
                                ? Text(" / EVALUATION TASK",
                                    style: Styles.greyLight14)
                                : Text(" / AUDIT TASK",
                                    style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
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
                                    children: [
                                      controller.type.value == AppConstants.kMis
                                          ? Text(
                                              "MIS Task",
                                              style: Styles.blackBold14,
                                            )
                                          : controller.type.value ==
                                                  AppConstants.kEvaluation
                                              ? Text(
                                                  "Evaluation Task",
                                                  style: Styles.blackBold14,
                                                )
                                              : Text(
                                                  "Audit Task",
                                                  style: Styles.blackBold16,
                                                ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          CustomRichText(title: 'Date Range'),
                                          // Dimens.boxWidth10,
                                          SizedBox(width: 10),
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
                                              controller.update(['AuditTask']);
                                            },
                                            hintText:
                                                '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Row(
                                  children: [
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
                                            color:
                                                ColorValues.appLightBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: const Offset(4.0, 2.0),
                                                blurRadius: 5.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ]),
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
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: const Offset(2.0, 1.0),
                                          blurRadius: 5.0,
                                          spreadRadius: 1.0,
                                        )
                                      ]),
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {
                                            controller.export();
                                          },
                                          text: 'Excel'),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 200,
                                      height: 35,
                                      // margin: Dimens.edgeInsets0_0_16_0,
                                      margin: EdgeInsets.only(right: 5),
                                      child: TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
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
                                        onChanged: (value) =>
                                            controller.search(value),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                controller.pmTaskList.isEmpty == true &&
                                        controller.isLoading == false
                                    ? Center(child: Text('No data'))
                                    : controller.isLoading.value == true
                                        ? Center(
                                            child: Text("Data Loading......"))
                                        : Expanded(
                                            child: ValueListenableBuilder(
                                                valueListenable:
                                                    controller.columnVisibility,
                                                builder:
                                                    (context, value, child) {
                                                  final dataSource =
                                                      PmTaskDataSource(
                                                          controller);

                                                  return PaginatedDataTable2(
                                                    // fixedLeftColumns: 1,
                                                    dataRowHeight:
                                                        Get.height * 0.10,
                                                    columnSpacing: 10,
                                                    source:
                                                        dataSource, // Custom DataSource class
                                                    headingRowHeight:
                                                        Get.height * 0.12,
                                                    minWidth:
                                                        2000, //Get.width * 1.2,
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
                                                        if (entry.value &&
                                                            !(controller.type ==
                                                                    5 &&
                                                                entry.key ==
                                                                    'PTW')) // Skip PTW column if type == 2
                                                          buildDataColumn(
                                                            entry.key,
                                                            controller
                                                                    .filterText[
                                                                entry.key]!,
                                                            controller
                                                                    .columnwidth[
                                                                entry.key],
                                                          ),
                                                      buildDataColumn(
                                                        'Actions',
                                                        controller
                                                            .titleFilterText,
                                                        200,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          )
                              ],
                            ),
                          ),
                        ),
                        if (controller.openFromDateToStartDatePicker)
                          Positioned(
                            right: 150,
                            top: 70,
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

                                controller.getPmTaskListByDate();
                                controller.openFromDateToStartDatePicker =
                                    !controller.openFromDateToStartDatePicker;
                                controller.update(['AuditTask']);

                                // Get.toNamed(
                                //   Routes.stockManagementGoodsOrdersScreen,
                                // );
                              },
                              onCancel: () {
                                controller.openFromDateToStartDatePicker =
                                    false;
                                controller.update(['AuditTask']);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        });
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
            // SizedBox(
            //   height: Get.height * 0.05,
            //   child: TextField(
            //     style: GoogleFonts.lato(
            //       textStyle: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.black),
            //     ),
            //     onChanged: (value) {
            //       filterText.value = value;
            //       //   onSearchCallBack(value);
            //     },
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //       hintText: 'Filter',
            //       contentPadding: EdgeInsets.fromLTRB(
            //           5, 0, 5, 0), // Reduced vertical padding
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),

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
}

class PmTaskDataSource extends DataTableSource {
  final AuditTaskController controller;

  late List<PmTaskListModel?> filteredPmTaskList;

  PmTaskDataSource(this.controller) {
    filterpmTasks();
  }

  ///
  void filterpmTasks() {
    filteredPmTaskList = <PmTaskListModel?>[];
    filteredPmTaskList = controller.pmTaskList.where((pmTask) {
      return (pmTask?.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (pmTask?.name ?? '')
              .toLowerCase()
              .contains(controller.titleFilterText.value.toLowerCase()) &&
          (pmTask?.last_done_date ?? '').toString().toLowerCase().contains(
              controller.lastDoneDateFilterText.value.toLowerCase()) &&
          (pmTask?.due_date ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.dueDateFilterText.value.toLowerCase()) &&
          (pmTask?.done_date ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.doneDateFilterText.value.toLowerCase()) &&
          (pmTask?.frequency_name ?? '')
              .toLowerCase()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (pmTask?.assigned_to_name ?? '')
              .toLowerCase()
              .contains(controller.assignFilterText.value.toLowerCase()) &&
          (pmTask?.permit_code ?? '')
              .toLowerCase()
              .contains(controller.ptwFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final pmTaskDetails = filteredPmTaskList[index];

    // controller.pmTaskId.value = pmTaskDetails?.id ?? 0;
    var cellsBuffer = [
      "pmTaskId", // '${pmTaskDetails?.id ?? ''}',
      '${pmTaskDetails?.name ?? ''}',
      '${pmTaskDetails?.last_done_date ?? ''}',
      '${pmTaskDetails?.due_date ?? ''}',
      '${pmTaskDetails?.done_date ?? ''}',
      '${pmTaskDetails?.frequency_name ?? ''}',
      '${pmTaskDetails?.assigned_to_name ?? ''}',
      if (controller.type.value != 5) '${pmTaskDetails?.permit_code ?? ''}',
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
        if (!(controller.type.value == 5 && entry.key == 'PTW')) {
          // print({"entry.value removed": entry.key});
          cells.add(cellsBuffer[i]);
        }
      }
      i++;
    }
    cells.add('Actions');
    // final pmTaskDetails = filteredPmTaskList[index];

    // List<DataCell> cells = [];

    // // Ensure columns and rows match by applying the same logic
    // int i = 0;
    // for (var entry in controller.columnVisibility.value.entries) {
    //   if (entry.value && i < cellsBuffer.length) {
    //     // Ensure consistency in length
    //     if (!(controller.type.value == 5 && entry.key == 'PTW')) {
    //       // Skip PTW column if type == 5
    //       cells.add(DataCell(Text(cellsBuffer[i])));
    //     }
    //   }
    //   i++;
    // }

    // cells.add(DataCell(Text('Actions'))); // Always add the Actions column

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'pmTaskId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.type.value == AppConstants.kMis
                          ? Text(
                              'MIS${pmTaskDetails?.id}',
                            )
                          : controller.type.value == AppConstants.kEvaluation
                              ? Text(
                                  'EVEL${pmTaskDetails?.id}',
                                )
                              : Text(
                                  'AUT${pmTaskDetails?.id}',
                                ),
                      Dimens.boxHeight5,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            color: controller.pmTaskList
                                        .firstWhere(
                                          (e) => e?.id == pmTaskDetails?.id,
                                          orElse: () => PmTaskListModel(id: 00),
                                        )
                                        ?.status ==
                                    431
                                ? ColorValues.linktopermitColor
                                : controller.pmTaskList
                                            .firstWhere(
                                              (e) => e?.id == pmTaskDetails?.id,
                                              orElse: () =>
                                                  PmTaskListModel(id: 00),
                                            )
                                            ?.status ==
                                        430
                                    ? ColorValues.rejectedStatusColor
                                    : controller.pmTaskList
                                                .firstWhere(
                                                  (e) =>
                                                      e?.id ==
                                                      pmTaskDetails?.id,
                                                  orElse: () =>
                                                      PmTaskListModel(id: 00),
                                                )
                                                ?.status ==
                                            422
                                        ? ColorValues.startColor
                                        : controller.pmTaskList
                                                    .firstWhere(
                                                      (e) =>
                                                          e?.id ==
                                                          pmTaskDetails?.id,
                                                      orElse: () =>
                                                          PmTaskListModel(
                                                              id: 00),
                                                    )
                                                    ?.status ==
                                                425
                                            ? ColorValues.approveStatusColor
                                            : controller.pmTaskList
                                                        .firstWhere(
                                                          (e) =>
                                                              e?.id ==
                                                              pmTaskDetails?.id,
                                                          orElse: () =>
                                                              PmTaskListModel(
                                                                  id: 00),
                                                        )
                                                        ?.status ==
                                                    429
                                                ? ColorValues.closeColor
                                                : controller.pmTaskList
                                                            .firstWhere(
                                                              (e) =>
                                                                  e?.id ==
                                                                  pmTaskDetails
                                                                      ?.id,
                                                              orElse: () =>
                                                                  PmTaskListModel(
                                                                      id: 00),
                                                            )
                                                            ?.status ==
                                                        426
                                                    ? ColorValues.skyBlueColor
                                                    : controller.pmTaskList
                                                                .firstWhere(
                                                                  (e) =>
                                                                      e?.id ==
                                                                      pmTaskDetails
                                                                          ?.id,
                                                                  orElse: () =>
                                                                      PmTaskListModel(
                                                                          id: 00),
                                                                )
                                                                ?.status ==
                                                            427
                                                        ? ColorValues
                                                            .rejectedStatusColor
                                                        : ColorValues
                                                            .addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${pmTaskDetails?.status_short}',
                            style: Styles.white10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kAuditExecutionFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? TableActionButton(
                                color: ColorValues.viewColor,
                                icon: Icons.remove_red_eye_outlined,
                                message: 'View',
                                onPress: () {
                                  controller.clearStoreData();
                                  // controller.clearTypeValue();
                                  int auditTaskId = pmTaskDetails?.id ?? 0;
                                  if (auditTaskId != 0) {
                                    Get.offAllNamed(
                                        '${Routes.viewAuditTask}/$auditTaskId/${controller.type.value}');
                                  }
                                },
                              )
                            : Dimens.box0,
                        // TableActionButton(
                        //   color: ColorValues.appGreenColor,
                        //   icon: Icons.remove_red_eye_outlined,
                        //   message: 'Execute',
                        //   onPress: () {
                        //     final _flutterSecureStorage =
                        //         const FlutterSecureStorage();

                        //     _flutterSecureStorage.delete(key: "pmTaskId");
                        //     int pmTaskId = pmTaskDetails?.id ?? 0;
                        //     if (pmTaskId != 0) {
                        //       Get.toNamed(Routes.pmExecution,
                        //           arguments: {'pmTaskId': pmTaskId});
                        //     }
                        //   },
                        // ),
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();
        // controller.clearTypeValue();

        int taskId = pmTaskDetails?.id ?? 0;
        if (taskId != 0) {
          varUserAccessModel.value.access_list!
                      .where((e) =>
                          e.feature_id ==
                              UserAccessConstants.kPmTaskFeatureId &&
                          e.view == UserAccessConstants.kHaveViewAccess)
                      .length >
                  0
              ? Get.offAllNamed(
                  '${Routes.viewAuditTask}/$taskId/${controller.type.value}')
              : null;
        }
      },
    );
  }

  @override
  int get rowCount => filteredPmTaskList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
