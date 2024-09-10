import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/incident_report_list/incident_report_constants.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../home/widgets/header_widget.dart';

class IncidentReportListWeb extends StatefulWidget {
  IncidentReportListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<IncidentReportListWeb> createState() => _IncidentReportListWebState();
}

class _IncidentReportListWebState extends State<IncidentReportListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IncidentReportListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () {
                final dataSource = IncidentReportListDataSource(controller);
                return SelectionArea(
                  child: SingleChildScrollView(
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
                                  Get.toNamed(Routes.home);
                                },
                                child: Text(
                                  "DASHBOARD",
                                  style: Styles.greyLight14,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(Routes.incidentReportDashboard);
                                },
                                child: Text(" / INCIDENT REPORT",
                                    style: Styles.greyLight14),
                              ),
                              Text(
                                " / INCIDENT REPORT LIST",
                                style: Styles.greyLight14,
                              )
                              // Text(" / Warranty Claim List",
                              //     style: Styles.greyMediumLight12)
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: Get.width * 7,
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, right: 10),
                              height: Get.height * .85 - 5,
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
                                            "Incident Report List",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Date Range'),
                                              Dimens.boxWidth5,
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
                                          // Dimens.boxWidth10,
                                          SizedBox(width: 10),
                                          varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kIncidentReportFeatureId &&
                                                          e.add ==
                                                              UserAccessConstants
                                                                  .kHaveAddAccess)
                                                      .length >
                                                  0
                                              ? ActionButton(
                                                  icon: Icons.add,
                                                  label: 'Add Incident Report',
                                                  onPressed: () {
                                                    controller.clearStoreData();
                                                    Get.toNamed(Routes
                                                        .addIncidentReportContentWeb);
                                                  },
                                                  color:
                                                      ColorValues.addNewColor,
                                                )
                                              : Dimens.box0
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
                                                color: ColorValues
                                                    .appLightBlueColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    offset:
                                                        const Offset(4.0, 2.0),
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
                                              <PopupMenuEntry<String>>[]
                                                ..addAll(controller
                                                    .columnVisibility
                                                    .value
                                                    .entries
                                                    .map((e) {
                                                  return PopupMenuItem<String>(
                                                      child:
                                                          ValueListenableBuilder(
                                                              valueListenable:
                                                                  controller
                                                                      .columnVisibility,
                                                              builder: (context,
                                                                  value,
                                                                  child) {
                                                                return Row(
                                                                  children: [
                                                                    Checkbox(
                                                                      value: value[
                                                                          e.key],
                                                                      onChanged:
                                                                          (newValue) {
                                                                        controller.setColumnVisibility(
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
                                          margin: Dimens.edgeInsets0_0_7_0,
                                          child: TextField(
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 16.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            ),
                                            onChanged: (value) =>
                                                controller.search(value),
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.0),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.0),
                                              ),
                                              contentPadding:
                                                  Dimens.edgeInsets05_10,
                                              hintText: 'search'.tr,
                                              hintStyle: Styles.grey12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    controller.incidentReportList.isEmpty ==
                                                true &&
                                            controller.isLoading == false
                                        ? Center(child: Text('No data'))
                                        : controller.isLoading.value == true
                                            ? Center(
                                                child:
                                                    Text("Data Loading......"))
                                            : Expanded(
                                                child: ValueListenableBuilder(
                                                    valueListenable: controller
                                                        .columnVisibility,
                                                    builder: (context, value,
                                                        child) {
                                                      final dataSource =
                                                          IncidentReportListDataSource(
                                                              controller);

                                                      return PaginatedDataTable2(
                                                        columnSpacing: 10,
                                                        dataRowHeight: 70,
                                                        source:
                                                            dataSource, // Custom DataSource class
                                                        // headingRowHeight:
                                                        //     Get.height * 0.12,
                                                        minWidth: 2500,
                                                        showCheckboxColumn:
                                                            false,
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
                                                                .actionFilterText,
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
                                  selectionMode:
                                      DateRangePickerSelectionMode.range,
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

                                    var pickUpDate = DateTime.parse(
                                        data.startDate.toString());
                                    controller.fromDate.value = pickUpDate;
                                    var dropDate =
                                        DateTime.parse(data.endDate.toString());
                                    dropDate != null
                                        ? controller.toDate.value = dropDate
                                        : controller.toDate.value = pickUpDate;

                                    controller.getIncidentReportListByDate();
                                    controller.openFromDateToStartDatePicker =
                                        false;
                                    controller.update(['stock_Mangement_Date']);

                                    // Get.toNamed(
                                    //   Routes.stockManagementGoodsOrdersScreen,
                                    // );
                                  },
                                  onCancel: () {
                                    controller.openFromDateToStartDatePicker =
                                        false;
                                    controller.update(['stock_Mangement_Date']);
                                  },
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
    onSort: header == "Actions"
          ? null
          : (int columnIndex, bool ascending) {
              final controller = Get.find<IncidentReportListController>();
              controller.sortData(header);
            },

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
              Row(
              children: [
                Text(
                  header,
                  style: Styles.black16W500,
                ),
                if (header != "Actions")
                  Obx(() {
                    final controller = Get.find<IncidentReportListController>();

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
          // SizedBox(
          //   height: Get.height * 0.05,
          //   child: TextField(
          //     style: GoogleFonts.lato(
          //       textStyle:
          //           TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          //     ),
          //     onChanged: (value) {
          //       filterText.value = value;
          //       //   onSearchCallBack(value);
          //     },
          //     textAlign: TextAlign.left,
          //     decoration: InputDecoration(
          //       hintText: 'Filter',
          //       contentPadding:
          //           EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
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

class IncidentReportListDataSource extends DataTableSource {
  final IncidentReportListController controller;

  late List<IncidentReportListModel?> filteredIncidentReportList;

  IncidentReportListDataSource(this.controller) {
    filtersWarramtyClaim();
  }

  ///
  void filtersWarramtyClaim() {
    filteredIncidentReportList = <IncidentReportListModel?>[];
    filteredIncidentReportList =
        controller.incidentReportList.where((IncidentReportList) {
      return (IncidentReportList?.id ?? '').toString().contains(
              controller.incidentReportIdFilterText.value.toLowerCase()) &&
          (IncidentReportList?.title ?? '')
              .toString()
              .contains(controller.descriptionFilterText.value.toLowerCase()) &&
          (IncidentReportList?.block_name ?? '')
              .toString()
              .contains(controller.block_nameFilterText.value.toLowerCase()) &&
          (IncidentReportList?.equipment_name ?? '').toString().contains(
              controller.equipment_nameFilterText.value.toLowerCase()) &&
          (IncidentReportList?.approved_by ?? '')
              .toString()
              .contains(controller.approved_byFilterText.value.toLowerCase()) &&
          (IncidentReportList?.approved_at ?? '')
              .toString()
              .contains(controller.approved_atFilterText.value.toLowerCase()) &&
          (IncidentReportList?.reported_by_name ?? '').toString().contains(
              controller.reported_by_nameFilterText.value.toLowerCase()) &&
          (IncidentReportList?.reported_at ?? '')
              .toString()
              .contains(controller.reported_atFilterText.value.toLowerCase()) &&
          (IncidentReportList?.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredGoodsOrderList": filteredGoodsOrderList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final incidentReportListDetails = filteredIncidentReportList[index];

    controller.id.value = incidentReportListDetails?.id ?? 0;
    var cellsBuffer = [
      "id",
      // '${incidentReportListDetails?.id ?? ''}',
      '${incidentReportListDetails?.title ?? ''}',
      '${incidentReportListDetails?.block_name ?? ''}',
      '${incidentReportListDetails?.equipment_name ?? ''}',
      incidentReportListDetails?.status == 181
          ? "-"
          : '${incidentReportListDetails?.approved_by ?? ''}',
      incidentReportListDetails?.status == 181
          ? "-"
          : '${incidentReportListDetails?.approved_at ?? ''}',
      '${incidentReportListDetails?.reported_by_name ?? ''}',
      '${incidentReportListDetails?.reported_at ?? ''}',
      '${incidentReportListDetails?.status ?? ''}',
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
                        'IR${incidentReportListDetails?.id}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                              color: controller.incidentReportList
                                              .firstWhere(
                                                (e) =>
                                                    "${e?.id}" ==
                                                    "${incidentReportListDetails?.id}",
                                                orElse: () =>
                                                    IncidentReportListModel(
                                                        id: 000),
                                              )
                                              ?.status ==
                                          IncidentStatusConstants
                                              .IR_CREATED_INITIAL ||
                                      controller.incidentReportList
                                              .firstWhere(
                                                (e) =>
                                                    "${e?.id}" ==
                                                    "${incidentReportListDetails?.id}",
                                                orElse: () =>
                                                    IncidentReportListModel(
                                                        id: 000),
                                              )
                                              ?.status ==
                                          IncidentStatusConstants.IR_UPDATED
                                  ? ColorValues.appYellowColor
                                  : controller.incidentReportList
                                                  .firstWhere(
                                                    (e) =>
                                                        "${e?.id}" ==
                                                        "${incidentReportListDetails?.id}",
                                                    orElse: () =>
                                                        IncidentReportListModel(
                                                            id: 000),
                                                  )
                                                  ?.status ==
                                              IncidentStatusConstants
                                                  .IR_APPROVED_INITIAL ||
                                          controller.incidentReportList
                                                  .firstWhere(
                                                    (e) =>
                                                        "${e?.id}" ==
                                                        "${incidentReportListDetails?.id}",
                                                    orElse: () =>
                                                        IncidentReportListModel(
                                                            id: 000),
                                                  )
                                                  ?.status ==
                                              IncidentStatusConstants
                                                  .IR_APPROVED_INVESTIGATION
                                      ? ColorValues.greenColor
                                      : controller.incidentReportList
                                                  .firstWhere(
                                                    (e) =>
                                                        "${e?.id}" ==
                                                        "${incidentReportListDetails?.id}",
                                                    orElse: () =>
                                                        IncidentReportListModel(
                                                            id: 000),
                                                  )
                                                  ?.status ==
                                              IncidentStatusConstants
                                                  .IR_CREATED_INVESTIGATION
                                          ? Color.fromARGB(255, 181, 129, 179)
                                          : ColorValues.appRedColor
                              // color: ColorValues.appYellowColor
                              // : controller.incidentReportList
                              //             .firstWhere(
                              //               (e) =>
                              //                   e?.id ==
                              //                   incidentReportListDetails!
                              //                       .id,
                              //               orElse: () =>
                              //                   IncidentReportListModel(
                              //                       id: 00),
                              //             )
                              //             ?.status_short ==
                              //         "Approved"
                              //     ? ColorValues.appGreenColor
                              //     : ColorValues.appRedColor

                              ),
                          child: Text(
                            '${incidentReportListDetails?.status_short}',
                            style: Styles.white11.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kIncidentReportFeatureId &&
                                            e.view ==
                                                UserAccessConstants
                                                    .kHaveViewAccess)
                                        .length >
                                    0
                                ? TableActionButton(
                                    color: ColorValues.appDarkBlueColor,
                                    icon: Icons.visibility,
                                    message: 'View',

                                    onPress: () {
                                      controller.clearStoreData();

                                      int irId =
                                          incidentReportListDetails?.id ?? 0;
                                      if (irId != 0) {
                                        Get.toNamed(
                                            Routes.viewIncidentReportScreen,
                                            arguments: {
                                              'irId':
                                                  incidentReportListDetails?.id,
                                            });
                                      }
                                    },
                                    // onPress: () {
                                    //   controller.viewIncidentReport(
                                    //       id: incidentReportListDetails?.id);
                                    //   // print('record:${int.tryParse('${record[0]}')}');
                                    // },
                                  )
                                : Dimens.box0,

                            varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kIncidentReportFeatureId &&
                                                    e.approve ==
                                                        UserAccessConstants
                                                            .kHaveApproveAccess)
                                                .length >
                                            0 &&
                                        incidentReportListDetails!.status ==
                                            181 ||
                                    // incidentReportListDetails!.status == 182 ||
                                    varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kIncidentReportFeatureId &&
                                                    e.approve ==
                                                        UserAccessConstants
                                                            .kHaveApproveAccess)
                                                .length >
                                            0 &&
                                        incidentReportListDetails!.status == 184
                                ? TableActionButton(
                                    color: ColorValues.approveColor,
                                    icon: Icons.check,
                                    message: 'Approve IR',

                                    onPress: () {
                                      controller.clearStoreData();

                                      int irId =
                                          incidentReportListDetails.id ?? 0;
                                      if (irId != 0) {
                                        Get.toNamed(
                                            Routes.viewIncidentReportScreen,
                                            arguments: {
                                              'irId':
                                                  incidentReportListDetails.id,
                                            });
                                      }
                                    },
                                    // onPress: () {
                                    //   controller.viewIncidentReport(
                                    //       id: incidentReportListDetails?.id);
                                    //   // print('record:${int.tryParse('${record[0]}')}');
                                    // },
                                  )
                                : Dimens.box0,

                            ///Edit button
                            varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kIncidentReportFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0 &&
                                    incidentReportListDetails!.status == 181
                                ? TableActionButton(
                                    color: ColorValues.appYellowColor,
                                    icon: Icons.edit,
                                    message: 'Edit',
                                    onPress: () {
                                      controller.clearStoreData();

                                      int irId =
                                          incidentReportListDetails.id ?? 0;
                                      if (irId != 0) {
                                        Get.toNamed(
                                            Routes.addIncidentReportContentWeb,
                                            arguments: {
                                              'irId':
                                                  incidentReportListDetails.id,
                                            });
                                      }
                                    },
                                  )
                                : Dimens.box0,
                            varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                        UserAccessConstants
                                                            .kIncidentReportFeatureId &&
                                                    e.add ==
                                                        UserAccessConstants
                                                            .kHaveAddAccess ||
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0 &&
                                    incidentReportListDetails!.status == 182
                                ? TableActionButton(
                                    color: Color.fromARGB(255, 116, 78, 130),
                                    icon: Icons.ads_click,
                                    message: 'Re - Submit',
                                    onPress: () {
                                      controller.clearStoreData();

                                      int irId =
                                          incidentReportListDetails.id ?? 0;
                                      if (irId != 0) {
                                        Get.toNamed(
                                            Routes.addIncidentReportContentWeb,
                                            arguments: {
                                              'irId':
                                                  incidentReportListDetails.id,
                                            });
                                      }
                                    },
                                  )
                                : Dimens.box0,

//IR 2nd step button
                            varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kIncidentReportFeatureId &&
                                                e.add ==
                                                    UserAccessConstants
                                                        .kHaveAddAccess)
                                            .length >
                                        0 &&
                                    incidentReportListDetails!.status == 183
                                ? TableActionButton(
                                    color: Color.fromARGB(136, 107, 152, 211),
                                    icon: Icons.start_outlined,
                                    message: 'IR 2nd Step',
                                    onPress: () {
                                      controller.clearStoreData();

                                      int irId =
                                          incidentReportListDetails.id ?? 0;
                                      if (irId != 0) {
                                        Get.toNamed(
                                            Routes.addIncidentReportContentWeb,
                                            arguments: {
                                              'irId':
                                                  incidentReportListDetails.id,
                                            });
                                      }
                                    },
                                  )
                                : Dimens.box0,

                            varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kIncidentReportFeatureId &&
                                                e.add ==
                                                    UserAccessConstants
                                                        .kHaveAddAccess)
                                            .length >
                                        0 &&
                                    incidentReportListDetails!.status == 185
                                ? TableActionButton(
                                    color: Color.fromARGB(255, 116, 78, 130),
                                    icon: Icons.ads_click,
                                    message: 'Re - Submit',
                                    onPress: () {
                                      controller.clearStoreData();

                                      int irId =
                                          incidentReportListDetails.id ?? 0;
                                      if (irId != 0) {
                                        Get.toNamed(
                                            Routes.addIncidentReportContentWeb,
                                            arguments: {
                                              'irId':
                                                  incidentReportListDetails.id,
                                            });
                                      }
                                    },
                                  )
                                : Dimens.box0,

                            // Approve/Reject
                            varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kIncidentReportFeatureId &&
                                                e.approve ==
                                                    UserAccessConstants
                                                        .kHaveApproveAccess)
                                            .length >
                                        0 &&
                                    controller.incidentReportList
                                            .firstWhere(
                                              (e) =>
                                                  e?.id ==
                                                  incidentReportListDetails!.id,
                                              orElse: () =>
                                                  IncidentReportListModel(
                                                      id: 00),
                                            )
                                            ?.status ==
                                        "Submitted"
                                ? TableActionButton(
                                    color: ColorValues.appGreenColor,
                                    icon: Icons.check,
                                    message: 'Approve/Reject',
                                    onPress: () {
                                      // Get.dialog(PermitApprovedDialog(
                                      //     permitId:
                                      //         _newPermitList[0]));
                                      // controller.incidentReportApproveButton(incidentId: record[0]);
                                      controller.viewIncidentReport(
                                          id: incidentReportListDetails?.id);
                                    },
                                  )
                                : Dimens.box0,

                            // ///Reject Button
                            // varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kIncidentReportFeatureId && e.delete == UserAccessConstants.kHaveDeleteAccess).length > 0 && record[8] == "Submitted"
                            //     ? Padding(
                            //         padding: const EdgeInsets.only(top: 5),
                            //         child: TableActionButton(
                            //           color: ColorValues.appRedColor,
                            //           icon: Icons.close,
                            //           message: 'Close',
                            //           onPress: () {
                            //             // Get.dialog(IncidentReportRejectDialog(id: record[0]));
                            //             controller.viewIncidentReport(id: int.tryParse('${record[0]}'));
                            //           },
                            //         ),
                            //       )
                            //     : Container(),
                          ],
                        )
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();
        Get.toNamed(
          Routes.viewIncidentReportScreen,
          arguments: {'irId': incidentReportListDetails?.id},
        );
      },
    );
  }

  @override
  int get rowCount => filteredIncidentReportList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
