import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/calibration_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../calibration_list_controller.dart';

class CalibrationListContentWeb extends GetView<CalibrationListController> {
  CalibrationListContentWeb({super.key});

  ///
  var controller = Get.find<CalibrationListController>();
  List<String> filterdata = ["SetUp", "Close", "cpmplete", "pending"];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dataSource = CalibrationDataSource(controller);

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
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                      Get.offNamed(Routes.masterDashboard);
                    },
                    child: Text(" / MASTERS", style: Styles.greyLight14),
                  ),
                  Text(" / CALIBRATION LIST", style: Styles.greyLight14),
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
                                  "Calibration List ",
                                  style: Styles.blackBold16,
                                ),
                                // Spacer(),
                                // Row(
                                //   children: [
                                //     CustomRichText(title: 'Date Range'),
                                //     Dimens.boxWidth10,
                                //     CustomTextFieldForStock(
                                //       width:
                                //           MediaQuery.of(context).size.width / 5,
                                //       numberTextField: true,
                                //       onTap: () {
                                //         controller.openFromDateToStartDatePicker =
                                //             !controller
                                //                 .openFromDateToStartDatePicker;
                                //         controller.update(
                                //             ['PreventiveMaintenanceTask']);
                                //       },
                                //       hintText:
                                //           '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                //     ),
                                //   ],
                                // ),
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
                                      top: 4, bottom: 4, right: 8, left: 8),
                                  decoration: BoxDecoration(
                                      color: ColorValues.appLightBlueColor,
                                      borderRadius: BorderRadius.circular(5),
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
                                          controller
                                              .columnVisibility.value.entries
                                              .map((e) {
                                        return PopupMenuItem<String>(
                                            child: ValueListenableBuilder(
                                                valueListenable:
                                                    controller.columnVisibility,
                                                builder:
                                                    (context, value, child) {
                                                  return Row(
                                                    children: [
                                                      Checkbox(
                                                        value: value[e.key],
                                                        onChanged: (newValue) {
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
                                      // controller.export();
                                    },
                                    text: 'Excel'),
                              ),
                              Spacer(),
                              Container(
                                width: 300,
                                height: 40,
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
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    contentPadding: Dimens.edgeInsets10_0_0_0,
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
                          // controller.calibrationList.isEmpty == true &&
                          //         controller.isLoading == false
                          //     ? Center(child: Text('No data'))
                          //     : controller.isLoading.value == true
                          //         ? Center(child: Text('Data Loading......'))
                          //         :
                          Expanded(
                            child: ValueListenableBuilder(
                                valueListenable: controller.columnVisibility,
                                builder: (context, value, child) {
                                  final dataSource =
                                      CalibrationDataSource(controller);

                                  return PaginatedDataTable2(
                                    // fixedLeftColumns: 1,
                                    // dataRowHeight: Get.height * 0.10,
                                    columnSpacing: 10,
                                    dataRowHeight: 65, //Get.height * 0.10,
                                    source:
                                        dataSource, // Custom DataSource class
                                    // headingRowHeight:
                                    //     Get.height * 0.12,
                                    minWidth: 2000, //Get.width * 1.2,
                                    showCheckboxColumn: false,
                                    rowsPerPage: 10, // Number of rows per page
                                    availableRowsPerPage: [10, 20, 30, 50],
                                    columns: [
                                      for (var entry in value.entries)
                                        if (entry.value)
                                          buildDataColumn(
                                            entry.key,
                                            controller.filterText[entry.key]!,
                                            controller.columnwidth[entry.key],
                                          ),
                                      buildDataColumn(
                                        'Actions',
                                        controller.titleFilterText,
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
                  // if (controller.openFromDateToStartDatePicker)
                  //   Positioned(
                  //     right: 70,
                  //     top: 65,
                  //     child: DatePickerWidget(
                  //       selectionMode: DateRangePickerSelectionMode.range,
                  //       monthCellStyle: DateRangePickerMonthCellStyle(
                  //         todayCellDecoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: ColorValues.appDarkBlueColor),
                  //       ), // last date of this year
                  //       // controller: DateRangePickerController(),
                  //       initialSelectedRange: PickerDateRange(
                  //         controller.fromDate.value,
                  //         controller.toDate.value,
                  //       ),

                  //       onSubmit: (value) {
                  //         print('po valu ${value.toString()}');
                  //         PickerDateRange? data = value as PickerDateRange;

                  //         var pickUpDate =
                  //             DateTime.parse(data.startDate.toString());
                  //         controller.fromDate.value = pickUpDate;
                  //         var dropDate = DateTime.parse(data.endDate.toString());
                  //         dropDate != null
                  //             ? controller.toDate.value = dropDate
                  //             : controller.toDate.value = pickUpDate;

                  //         controller.getPmTaskListByDate();
                  //         controller.openFromDateToStartDatePicker =
                  //             !controller.openFromDateToStartDatePicker;
                  //         controller.update(['PreventiveMaintenanceTask']);

                  //         // Get.toNamed(
                  //         //   Routes.stockManagementGoodsOrdersScreen,
                  //         // );
                  //       },
                  //     ),
                  //   ),
                ],
              ),
            ),
          ],
        ),
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
      onSort: header == "Actions"
          ? null
          : (int columnIndex, bool ascending) {
              final controller = Get.find<CalibrationListController>();
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
                    final controller = Get.find<CalibrationListController>();

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

_filterDialog() {
  return Get.dialog(
    Stack(
      children: [
        Positioned(
          right: 1,
          top: 170,
          child: Container(
            width: Get.width / 2.5,
            //  margin: EdgeInsets.all(10),
            child: AlertDialog(
              // insetPadding: Dimens.edgeInsets10_0_10_0,
              contentPadding: EdgeInsets.only(bottom: 30),
              backgroundColor: ColorValues.appBlueBackgroundColor,
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      Text(
                        "Filter",
                        style: Styles.blackBold16,
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: ColorValues.lightGreyColor,
                  ),
                  Wrap(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        _filterText("Rejected"),
                        _filterText("Complete"),
                        _filterText("Waiting for Approval"),
                        _filterText("Approved to dispatch"),
                        _filterText("Waiting for final Approval"),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

_filterText(String text) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
    child: Padding(
      padding: const EdgeInsets.all(7.0),
      child: Text(text),
    ),
  );
}

class CalibrationDataSource extends DataTableSource {
  final CalibrationListController controller;

  late List<CalibrationListModel?> filteredCalibrationList;

  CalibrationDataSource(this.controller) {
    filterpmTasks();
  }

  ///
  void filterpmTasks() {
    filteredCalibrationList = <CalibrationListModel?>[];
    filteredCalibrationList = controller.calibrationList.where((Calibration) {
      return (Calibration?.calibration_id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.calibrationIdText.value.toLowerCase()) &&
          (Calibration?.category_name ?? '')
              .toLowerCase()
              .contains(controller.categoryFilterText.value.toLowerCase()) &&
          (Calibration?.asset_name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.titleFilterText.value.toLowerCase()) &&
          (Calibration?.asset_serial ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.srNoFilterText.value.toLowerCase()) &&
          (Calibration?.schedule_start_date ?? '')
              .toString()
              .toLowerCase()
              .contains(
                  controller.schedulestartFilterText.value.toLowerCase()) &&
          (Calibration?.next_calibration_due_date ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.dueDateFilterText.value.toLowerCase()) &&
          (Calibration?.last_calibration_date ?? '')
              .toString()
              .toLowerCase()
              .contains(
                  controller.lastDoneDateFilterText.value.toLowerCase()) &&
          (Calibration?.frequency_name ?? '')
              .toLowerCase()
              .contains(controller.frequencyFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final calibrationDetails = filteredCalibrationList[index];

    // controller.calibrationId.value = calibrationDetails?.id ?? 0;
    var cellsBuffer = [
      "id",
      // '${calibrationDetails?.calibration_id ??''}',
      '${calibrationDetails?.category_name ?? ''}',
      '${calibrationDetails?.asset_name ?? ''}',
      '${calibrationDetails?.asset_serial ?? ''}',
      calibrationDetails?.last_calibration_date == "0001-01-01"
          ? ""
          : "${calibrationDetails?.last_calibration_date ?? ""}",
      '${calibrationDetails?.calibration_due_date ?? ''}',
      '${calibrationDetails?.calibration_date ?? ''}',
      '${calibrationDetails?.frequency_name ?? ''}',
      calibrationDetails?.is_damaged == 1 ? "YES" : "",

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
                        'CAL${calibrationDetails?.calibration_id}',
                      ),
                      Dimens.boxHeight2,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: calibrationDetails?.statusID == 218
                                ? ColorValues.appRedColor
                                : calibrationDetails?.statusID == 220
                                    ? ColorValues.rejectedStatusColor
                                    : calibrationDetails?.statusID == 211
                                        ? ColorValues.addNewColor
                                        : calibrationDetails?.statusID == 214
                                            ? ColorValues.appGreenColor
                                            : calibrationDetails?.statusID ==
                                                    213
                                                ? ColorValues
                                                    .rejectedStatusColor
                                                : calibrationDetails
                                                            ?.statusID ==
                                                        217
                                                    ? ColorValues.closeColor
                                                    : calibrationDetails
                                                                ?.statusID ==
                                                            212
                                                        ? ColorValues
                                                            .carryfarwordColor
                                                        : calibrationDetails
                                                                    ?.statusID ==
                                                                215
                                                            ? ColorValues
                                                                .startColor
                                                            : calibrationDetails
                                                                        ?.statusID ==
                                                                    216
                                                                ? ColorValues
                                                                    .completeColor
                                                                : calibrationDetails
                                                                            ?.statusID ==
                                                                        218
                                                                    ? ColorValues
                                                                        .approveColor
                                                                    : ColorValues
                                                                        .appDarkBlueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child:
                              Text('${calibrationDetails?.calibration_status}',
                                  style: Styles.white10.copyWith(
                                    color: Colors.white,
                                  )),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        controller.calibrationList
                                        .firstWhere(
                                          (e) =>
                                              e?.calibration_id ==
                                              calibrationDetails!
                                                  .calibration_id,
                                          orElse: () => CalibrationListModel(
                                              calibration_id: 00),
                                        )
                                        ?.statusID ==
                                    211 ||
                                controller.calibrationList
                                        .firstWhere(
                                          (e) =>
                                              e?.calibration_id ==
                                              calibrationDetails!
                                                  .calibration_id,
                                          orElse: () => CalibrationListModel(
                                              calibration_id: 00),
                                        )
                                        ?.statusID ==
                                    213
                            ? TableActionButton(
                                color: ColorValues.lightGreenColor,
                                message: 'Request Calibration',
                                icon: Icons.compass_calibration,
                                onPress: () {
                                  controller.calibrationRequest(
                                    equipmentName:
                                        '${calibrationDetails?.asset_name}',
                                    calibrationId:
                                        '${calibrationDetails?.calibration_id}',
                                    previousDate: calibrationDetails
                                                    ?.last_calibration_date ==
                                                null ||
                                            calibrationDetails
                                                    ?.last_calibration_date ==
                                                "null"
                                        ? ""
                                        : '${calibrationDetails?.last_calibration_date}',
                                    nextDate:
                                        '${calibrationDetails?.calibration_due_date}',
                                    asset_id: '${calibrationDetails?.asset_id}',
                                  );
                                },
                              )
                            : Dimens.box0,

                        controller.calibrationList
                                        .firstWhere(
                                          (e) =>
                                              e?.calibration_id ==
                                              calibrationDetails!
                                                  .calibration_id,
                                          orElse: () => CalibrationListModel(
                                              calibration_id: 00),
                                        )
                                        ?.statusID ==
                                    211 ||
                                controller.calibrationList
                                        .firstWhere(
                                          (e) =>
                                              e?.calibration_id ==
                                              calibrationDetails!
                                                  .calibration_id,
                                          orElse: () => CalibrationListModel(
                                              calibration_id: 00),
                                        )
                                        ?.statusID ==
                                    213
                            ? TableActionButton(
                                color: ColorValues.startColor,
                                message: 'Skip Calibration',
                                icon: Icons.skip_next,
                                onPress: () {
                                  controller.isCommentCalibrationDialog(
                                      calibrationName:
                                          '${calibrationDetails?.asset_name}',
                                      calibrationId:
                                          '${calibrationDetails?.calibration_id}',
                                      type: 6);
                                },
                              )
                            : Dimens.box0,
                        controller.calibrationList
                                    .firstWhere(
                                      (e) =>
                                          e?.calibration_id ==
                                          calibrationDetails!.calibration_id,
                                      orElse: () => CalibrationListModel(
                                          calibration_id: 00),
                                    )
                                    ?.statusID ==
                                211 //||
                            // controller.calibrationList
                            //         .firstWhere(
                            //           (e) =>
                            //               e?.calibration_id ==
                            //               calibrationDetails!
                            //                   .calibration_id,
                            //           orElse: () => CalibrationListModel(
                            //               calibration_id: 00),
                            //         )
                            //         ?.statusID ==
                            //     213
                            ? Dimens.box0
                            : TableActionButton(
                                color: ColorValues.viewColor,
                                icon: Icons.remove_red_eye_outlined,
                                message: 'View',
                                onPress: () {
                                  // controller.clearStoreData();
                                  int calibrationId =
                                      calibrationDetails?.calibration_id ?? 0;

                                  Get.toNamed(
                                      '${Routes.calibrationViewScreen}/$calibrationId');
                                },
                              ),
                        // controller.calibrationList
                        //             .firstWhere(
                        //               (e) =>
                        //                   e?.asset_id ==
                        //                   calibrationDetails!.asset_id,
                        //               orElse: () =>
                        //                   CalibrationListModel(asset_id: 00),
                        //             )
                        //             ?.statusID ==

                        //     ? Dimens.box0
                        //     : TableActionButton(
                        //         color: ColorValues.deleteColor,
                        //         icon: Icons.delete,
                        //         message: 'Delete',
                        //         onPress: () {},
                        //       ),
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();
        int calibrationId = calibrationDetails?.calibration_id ?? 0;
        if (calibrationId > 0) {
          varUserAccessModel.value.access_list!
                              .where((e) =>
                                  e.feature_id ==
                                          UserAccessConstants
                                              .kCalibrationFeatureId &&
                                      e.issue ==
                                          UserAccessConstants.kHaveViewAccess ||
                                  e.approve ==
                                      UserAccessConstants.kHaveApproveAccess)
                              .length >
                          0 &&
                      controller.calibrationList
                              .firstWhere(
                                (e) =>
                                    e?.calibration_id ==
                                    calibrationDetails!.calibration_id,
                                orElse: () =>
                                    CalibrationListModel(calibration_id: 00),
                              )
                              ?.statusID ==
                          211 ||
                  varUserAccessModel.value.access_list!
                              .where((e) =>
                                  e.feature_id ==
                                          UserAccessConstants
                                              .kCalibrationFeatureId &&
                                      e.issue ==
                                          UserAccessConstants.kHaveViewAccess ||
                                  e.approve ==
                                      UserAccessConstants.kHaveApproveAccess)
                              .length >
                          0 &&
                      controller.calibrationList
                              .firstWhere(
                                (e) =>
                                    e?.calibration_id ==
                                    calibrationDetails!.calibration_id,
                                orElse: () =>
                                    CalibrationListModel(calibration_id: 00),
                              )
                              ?.statusID ==
                          213
              ? controller.calibrationRequest(
                  equipmentName: '${calibrationDetails?.asset_name}',
                  calibrationId: '${calibrationDetails?.calibration_id}',
                  previousDate: calibrationDetails?.last_calibration_date ==
                              null ||
                          calibrationDetails?.last_calibration_date == "null"
                      ? ""
                      : '${calibrationDetails?.last_calibration_date}',
                  nextDate: '${calibrationDetails?.calibration_due_date}',
                  asset_id: '${calibrationDetails?.asset_id}',
                )
              : Get.toNamed('${Routes.calibrationViewScreen}/$calibrationId');

          //: null;
        }
      },
    );
  }

  @override
  int get rowCount => filteredCalibrationList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
