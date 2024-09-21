import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
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
import '../preventive_maintenance_task_controller.dart';

class PreventiveMaintenanceTaskContentWeb extends StatefulWidget {
  PreventiveMaintenanceTaskContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PreventiveMaintenanceTaskContentWeb> createState() =>
      _PreventiveMaintenanceTaskContentWebState();
}

class _PreventiveMaintenanceTaskContentWebState
    extends State<PreventiveMaintenanceTaskContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreventiveMaintenanceTaskController>(
        id: 'PreventiveMaintenanceTask',
        builder: (controller) {
          return Obx(() {
            // final dataSource = PmTaskDataSource(controller);

            return SelectionArea(
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
                            Get.offNamed(Routes.preventive);
                          },
                          child: Text(" / Preventive Maintenance".toUpperCase(),
                              style: Styles.greyLight14),
                        ),
                        Text(" / PM TASKS", style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 10, top: 15),
                          height: Get.height * .85,
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
                                      Text(
                                        "PM Tasks ",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          CustomRichText(title: 'Date Range'),
                                          Dimens.boxWidth2,
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
                                              controller.update([
                                                'PreventiveMaintenanceTask'
                                              ]);
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
                                      width: 300,
                                      height: 40,
                                      margin: EdgeInsets.only(right: 10),
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
                                              EdgeInsets.only(left: 3),
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
                                            child: Text('Data Loading......'))
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
                                                    // dataRowHeight: Get.height * 0.10,
                                                    columnSpacing: 10,
                                                    source:
                                                        dataSource, // Custom DataSource class
                                                    // headingRowHeight:
                                                    //     Get.height * 0.12,
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
                                                        if (entry.value)
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
                            right: 70,
                            top: 65,
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
                                    false;
                                controller
                                    .update(['PreventiveMaintenanceTask']);

                                // Get.toNamed(
                                //   Routes.stockManagementGoodsOrdersScreen,
                                // );
                              },
                              onCancel: () {
                                controller.openFromDateToStartDatePicker =
                                    false;
                                controller
                                    .update(['PreventiveMaintenanceTask']);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
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
      onSort: header == "Actions"
          ? null
          : (int columnIndex, bool ascending) {
              final controller =
                  Get.find<PreventiveMaintenanceTaskController>();
              controller.sortData(header);
            },

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
            Row(
              children: [
                Text(
                  header,
                  style: Styles.black16W500,
                ),
                if (header != "Actions")
                  Obx(() {
                    final controller =
                        Get.find<PreventiveMaintenanceTaskController>();

                    return AnimatedRotation(
                      turns: controller.currentSortColumn.value == header
                          ? (controller.isAscending.value ? 0.5 : 0.0)
                          : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: Icon(
                        Icons.expand_more,
                        size: 20,
                      ),
                    );
                  }),
              ],
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     header,
            //     style: Styles.black16W500,
            //   ),
            // ),
          ]),
      // ),
    );
  }
}

class PmTaskDataSource extends DataTableSource {
  final PreventiveMaintenanceTaskController controller;

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

    controller.pmTaskId.value = pmTaskDetails?.id ?? 0;
    var cellsBuffer = [
      "pmTaskId", // '${pmTaskDetails?.id ?? ''}',
      '${pmTaskDetails?.name ?? ''}',
      '${pmTaskDetails?.last_done_date ?? ''}',
      '${pmTaskDetails?.due_date ?? ''}',
      '${pmTaskDetails?.done_date ?? ''}',
      '${pmTaskDetails?.frequency_name ?? ''}',
      '${pmTaskDetails?.assigned_to_name ?? ''}',
      '${pmTaskDetails?.permit_code ?? ''}',
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
            child: (value == 'pmTaskId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PMT${pmTaskDetails?.id}',
                      ),
                      Dimens.boxHeight5,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                            color: controller.pmTaskList
                                        .firstWhere(
                                          (e) => e?.id == pmTaskDetails?.id,
                                          orElse: () => PmTaskListModel(id: 00),
                                        )
                                        ?.status ==
                                    164
                                ? ColorValues.linktopermitColor
                                : controller.pmTaskList
                                            .firstWhere(
                                              (e) => e?.id == pmTaskDetails?.id,
                                              orElse: () =>
                                                  PmTaskListModel(id: 00),
                                            )
                                            ?.status ==
                                        162
                                    ? ColorValues.appLightBlueColor
                                    : controller.pmTaskList
                                                .firstWhere(
                                                  (e) =>
                                                      e?.id ==
                                                      pmTaskDetails?.id,
                                                  orElse: () =>
                                                      PmTaskListModel(id: 00),
                                                )
                                                ?.status ==
                                            163
                                        ? ColorValues.appYellowColor
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
                                                167
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
                                                    165
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
                                                        170
                                                    ? ColorValues
                                                        .approveStatusColor
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
                                                                168 ||
                                                            controller
                                                                    .pmTaskList
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
                                                                169 ||
                                                            controller
                                                                    .pmTaskList
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
                                                                166
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
                                                .kPmTaskFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? TableActionButton(
                                color: ColorValues.viewColor,
                                icon: Icons.remove_red_eye_outlined,
                                message: 'View',
                                onPress: () {
                                  // controller.clearStoreData();
                                  // controller.clearStoreDatatype();

                                  int pmTaskId = pmTaskDetails?.id ?? 0;
                                  if (pmTaskId != 0) {
                                    Get.toNamed(
                                        '${Routes.pmTaskView}/$pmTaskId');
                                  }
                                },
                              )
                            : Dimens.box0,
                        varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kPmTaskFeatureId &&
                                                e.delete ==
                                                    UserAccessConstants
                                                        .kHaveDeleteAccess)
                                            .length >
                                        0 &&
                                    controller.pmTaskList
                                            .firstWhere(
                                              (e) => e?.id == pmTaskDetails?.id,
                                              orElse: () =>
                                                  PmTaskListModel(id: 00),
                                            )
                                            ?.status ==
                                        161 ||
                                varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kPmTaskFeatureId &&
                                                e.delete ==
                                                    UserAccessConstants
                                                        .kHaveDeleteAccess)
                                            .length >
                                        0 &&
                                    controller.pmTaskList
                                            .firstWhere(
                                              (e) => e?.id == pmTaskDetails?.id,
                                              orElse: () =>
                                                  PmTaskListModel(id: 00),
                                            )
                                            ?.status ==
                                        162
                            ? TableActionButton(
                                color: ColorValues.deleteColor,
                                icon: Icons.delete,
                                message: 'Delete',
                                onPress: () {
                                  controller.isDeleteDialog(
                                      task_id: pmTaskDetails?.id.toString(),
                                      task: pmTaskDetails?.name ?? "");
                                },
                              )
                            : Dimens.box0,
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        // controller.clearStoreData();
        // controller.clearStoreDatatype();

        int pmTaskId = pmTaskDetails?.id ?? 0;
        if (pmTaskId != 0) {
          varUserAccessModel.value.access_list!
                      .where((e) =>
                          e.feature_id ==
                              UserAccessConstants.kPmTaskFeatureId &&
                          e.view == UserAccessConstants.kHaveViewAccess)
                      .length >
                  0
              ? Get.toNamed('${Routes.pmTaskView}/$pmTaskId')
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
