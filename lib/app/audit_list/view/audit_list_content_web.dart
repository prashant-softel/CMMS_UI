import 'package:cmms/app/audit_list/audit_list_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class AuditListContentWeb extends StatefulWidget {
  AuditListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AuditListContentWeb> createState() => _AuditListContentWebState();
}

class _AuditListContentWebState extends State<AuditListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuditListScreenController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () {
                // final dataSource = AuditPlanPlanListDataSource(controller);
                return SingleChildScrollView(
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
                                      : Text(" / AUDIT",
                                          style: Styles.greyLight14),
                            ),
                            controller.type.value == AppConstants.kMis
                                ? Text(" / OBSERVATION PLAN",
                                    style: Styles.greyLight14)
                                : controller.type.value ==
                                        AppConstants.kEvaluation
                                    ? Text(" / EVALUATION PLAN LIST",
                                        style: Styles.greyLight14)
                                    : Text(" / AUDIT PLAN LIST",
                                        style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 15, right: 10),
                            height: Get.height * .84,
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
                                        controller.type.value ==
                                                AppConstants.kMis
                                            ? Text(
                                                "Observation Plan",
                                                style: Styles.blackBold14,
                                              )
                                            : controller.type.value ==
                                                    AppConstants.kEvaluation
                                                ? Text(
                                                    "Evaluation Plan List",
                                                    style: Styles.blackBold14,
                                                  )
                                                : Text(
                                                    "Audit List Screen",
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
                                        ActionButton(
                                          icon: Icons.add,
                                          label: "Add New",
                                          onPressed: () {
                                            // controller.clearValue();
                                            controller.clearStoreIdData();
                                            Get.offNamed(
                                                '${Routes.createAudit}/0/${controller.type.value}');
                                          },
                                          color: ColorValues.addNewColor,
                                        ),
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
                                              color:
                                                  ColorValues.appLightBlueColor,
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
                                            <PopupMenuEntry<String>>[]..addAll(
                                                  controller.columnVisibility
                                                      .value.entries
                                                      .map((e) {
                                                return PopupMenuItem<String>(
                                                    child:
                                                        ValueListenableBuilder(
                                                            valueListenable:
                                                                controller
                                                                    .columnVisibility,
                                                            builder: (context,
                                                                value, child) {
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
                                          onChanged: (value) {}, // =>
                                          //       controller.search(value),
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
                                  controller.auditPlanList.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading == true
                                          ? Center(
                                              child: Text("Data Loading......"))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        AuditListListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 70,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      // headingRowHeight:
                                                      //     Get.height * 0.12,
                                                      minWidth: Get.width * 0.7,
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
                                                              // controller.columnwidth[
                                                              //     entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .planIdFilterText,
                                                          // 150,
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

                                  var pickUpDate =
                                      DateTime.parse(data.startDate.toString());
                                  controller.fromDate.value = pickUpDate;
                                  var dropDate =
                                      DateTime.parse(data.endDate.toString());
                                  dropDate != null
                                      ? controller.toDate.value = dropDate
                                      : controller.toDate.value = pickUpDate;

                                  controller.getAuditListByDate();
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
  // double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    // fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
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

class AuditListListDataSource extends DataTableSource {
  final AuditListScreenController controller;

  late List<AuditPlanListModel?> filteredAuditPlanList;

  AuditListListDataSource(this.controller) {
    filtersModuleCliningPlan();
  }

  ///
  void filtersModuleCliningPlan() {
    filteredAuditPlanList = <AuditPlanListModel?>[];
    filteredAuditPlanList = controller.auditPlanList.where((auditList) {
      return (auditList.id ?? '')
              .toString()
              .contains(controller.planIdFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.planTitleFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.noOfDaysFilterText.value.toLowerCase()) &&
          (auditList.plan_number ?? '')
              .toString()
              .contains(controller.createdByFilterText.value.toLowerCase()) &&
          (auditList.facility_name ?? '')
              .toString()
              .contains(controller.frequencyFilterText.value.toLowerCase()) &&
          (auditList.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredAuditPlanList": filteredAuditPlanList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final AuditPlanPlanningListDetails = filteredAuditPlanList[index];

    // controller.PlanId.value = AuditPlanPlanningListDetails?.planId ?? 0;
    var cellsBuffer = [
      "planId",
      '${AuditPlanPlanningListDetails?.plan_number ?? ''}',
      '${AuditPlanPlanningListDetails?.checklist_name ?? ''}',
      '${AuditPlanPlanningListDetails?.facility_name ?? ''}',
      '${AuditPlanPlanningListDetails?.schedule_Date ?? ''}',
      '${AuditPlanPlanningListDetails?.frequency_name ?? ''}',
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
            child: (value == 'planId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.type.value == AppConstants.kMis
                          ? Text(
                              'MIS${AuditPlanPlanningListDetails?.id}',
                            )
                          : controller.type.value == AppConstants.kEvaluation
                              ? Text(
                                  'EP${AuditPlanPlanningListDetails?.id}',
                                )
                              : Text(
                                  'AUT${AuditPlanPlanningListDetails?.id}',
                                ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            color: controller.auditPlanList
                                        .firstWhere(
                                          (e) =>
                                              e.id ==
                                              AuditPlanPlanningListDetails!.id,
                                          orElse: () =>
                                              AuditPlanListModel(id: 00),
                                        )
                                        .status ==
                                    431
                                ? ColorValues.linktopermitStatusColor
                                : controller.auditPlanList
                                                .firstWhere(
                                                  (e) =>
                                                      e.id ==
                                                      AuditPlanPlanningListDetails!
                                                          .id,
                                                  orElse: () =>
                                                      AuditPlanListModel(
                                                          id: 00),
                                                )
                                                .status ==
                                            430 ||
                                        controller.auditPlanList
                                                .firstWhere(
                                                  (e) =>
                                                      e.id ==
                                                      AuditPlanPlanningListDetails!
                                                          .id,
                                                  orElse: () =>
                                                      AuditPlanListModel(
                                                          id: 00),
                                                )
                                                .status ==
                                            807
                                    ? ColorValues.rejectedStatusColor
                                    : controller.auditPlanList
                                                .firstWhere(
                                                  (e) =>
                                                      e.id ==
                                                      AuditPlanPlanningListDetails!
                                                          .id,
                                                  orElse: () =>
                                                      AuditPlanListModel(
                                                          id: 00),
                                                )
                                                .status ==
                                            422
                                        ? ColorValues.startColor
                                        : controller.auditPlanList
                                                    .firstWhere(
                                                      (e) =>
                                                          e.id ==
                                                          AuditPlanPlanningListDetails!
                                                              .id,
                                                      orElse: () =>
                                                          AuditPlanListModel(
                                                              id: 00),
                                                    )
                                                    .status ==
                                                425
                                            ? ColorValues.approveStatusColor
                                            : controller.auditPlanList
                                                        .firstWhere(
                                                          (e) =>
                                                              e.id ==
                                                              AuditPlanPlanningListDetails!
                                                                  .id,
                                                          orElse: () =>
                                                              AuditPlanListModel(
                                                                  id: 00),
                                                        )
                                                        .status ==
                                                    429
                                                ? ColorValues.closeColor
                                                : controller.auditPlanList
                                                            .firstWhere(
                                                              (e) =>
                                                                  e.id ==
                                                                  AuditPlanPlanningListDetails!
                                                                      .id,
                                                              orElse: () =>
                                                                  AuditPlanListModel(
                                                                      id: 00),
                                                            )
                                                            .status ==
                                                        426
                                                    ? ColorValues.skyBlueColor
                                                    : controller.auditPlanList
                                                                .firstWhere(
                                                                  (e) =>
                                                                      e.id ==
                                                                      AuditPlanPlanningListDetails!
                                                                          .id,
                                                                  orElse: () =>
                                                                      AuditPlanListModel(
                                                                          id: 00),
                                                                )
                                                                .status ==
                                                            427
                                                        ? ColorValues
                                                            .rejectedStatusColor
                                                        : controller
                                                                    .auditPlanList
                                                                    .firstWhere(
                                                                      (e) =>
                                                                          e.id ==
                                                                          AuditPlanPlanningListDetails!
                                                                              .id,
                                                                      orElse: () =>
                                                                          AuditPlanListModel(
                                                                              id: 00),
                                                                    )
                                                                    .status ==
                                                                424
                                                            ? ColorValues
                                                                .rejectedStatusColor
                                                            : controller
                                                                        .auditPlanList
                                                                        .firstWhere(
                                                                          (e) =>
                                                                              e.id ==
                                                                              AuditPlanPlanningListDetails!.id,
                                                                          orElse: () =>
                                                                              AuditPlanListModel(id: 00),
                                                                        )
                                                                        .status ==
                                                                    428
                                                                ? ColorValues
                                                                    .approveStatusColor
                                                                : ColorValues
                                                                    .appLightBlueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${AuditPlanPlanningListDetails?.short_status}',
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
                                                .kAuditPlanFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? TableActionButton(
                                color: ColorValues.viewColor,
                                icon: Icons.remove_red_eye_outlined,
                                message: 'view',
                                onPress: () {
                                  controller.clearStoreIdData();
                                  // controller.clearValue();
                                  int auditId =
                                      AuditPlanPlanningListDetails?.id ?? 0;
                                  if (auditId != 0) {
                                    Get.offAllNamed(
                                        '${Routes.viewAuditPlan}/$auditId/${controller.type.value}');
                                  }
                                },
                              )
                            : Dimens.box0,
                        controller.auditPlanList
                                    .firstWhere(
                                      (e) =>
                                          e.id ==
                                          AuditPlanPlanningListDetails!.id,
                                      orElse: () => AuditPlanListModel(id: 00),
                                    )
                                    .status !=
                                425
                            ? Wrap(
                                children: [
                                  varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id ==
                                                          UserAccessConstants
                                                              .kPmExecutionFeatureId &&
                                                      e.view ==
                                                          UserAccessConstants
                                                              .kHaveEditAccess)
                                                  .length >
                                              0 &&
                                          (AuditPlanPlanningListDetails
                                                      ?.short_status ==
                                                  'Rejected' ||
                                              AuditPlanPlanningListDetails
                                                      ?.short_status ==
                                                  'Schedule' ||
                                              AuditPlanPlanningListDetails
                                                      ?.short_status ==
                                                  807 ||
                                              AuditPlanPlanningListDetails
                                                      ?.short_status ==
                                                  800)
                                      ? TableActionButton(
                                          color: ColorValues.editColor,
                                          icon: Icons.edit,
                                          message: 'Edit',
                                          onPress: () {
                                            controller.clearStoreIdData();
                                            int id =
                                                AuditPlanPlanningListDetails
                                                        ?.id ??
                                                    0;
                                            if (id != 0) {
                                              Get.offNamed(
                                                  '${Routes.createAudit}/$id/${controller.type.value}');
                                            }
                                          },
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id ==
                                                          UserAccessConstants
                                                              .kAuditPlanFeatureId &&
                                                      e.delete ==
                                                          UserAccessConstants
                                                              .kHaveDeleteAccess)
                                                  .length >
                                              0 &&
                                          (AuditPlanPlanningListDetails
                                                      ?.short_status ==
                                                  'Rejected' ||
                                              AuditPlanPlanningListDetails
                                                      ?.short_status ==
                                                  'Schedule')
                                      ? TableActionButton(
                                          color: ColorValues.deleteColor,
                                          icon: Icons.delete,
                                          message: 'Delete',
                                          onPress: () {
                                            controller.isDeleteDialog(
                                                planName:
                                                    AuditPlanPlanningListDetails
                                                        ?.plan_number,
                                                planId:
                                                    AuditPlanPlanningListDetails
                                                        ?.id
                                                        .toString());
                                          },
                                        )
                                      : Dimens.box0,
                                ],
                              )
                            : Dimens.box0,
                        // varUserAccessModel.value.access_list!
                        //             .where((e) =>
                        //                 e.feature_id ==
                        //                     UserAccessConstants
                        //                         .kPmExecutionFeatureId &&
                        //                 e.view ==
                        //                     UserAccessConstants.kHaveEditAccess)
                        //             .length >
                        //         0
                        //     ? TableActionButton(
                        //         color: ColorValues.editColor,
                        //         icon: Icons.edit,
                        //         message: 'Edit',
                        //         onPress: () {
                        //           controller.clearStoreIdData();
                        //           // controller.clearValue();
                        //           int id =
                        //               AuditPlanPlanningListDetails?.id ?? 0;
                        //           if (id != 0) {
                        //             Get.toNamed(Routes.createAudit, arguments: {
                        //               "auditId": id,
                        //               'type': controller.type.value
                        //             });
                        //           }
                        //         },
                        //       )
                        //     : Dimens.box0,
                        // varUserAccessModel.value.access_list!
                        //             .where((e) =>
                        //                 e.feature_id ==
                        //                     UserAccessConstants
                        //                         .kAuditPlanFeatureId &&
                        //                 e.delete ==
                        //                     UserAccessConstants
                        //                         .kHaveDeleteAccess)
                        //             .length >
                        //         0
                        //     ? TableActionButton(
                        //         color: ColorValues.deleteColor,
                        //         icon: Icons.delete,
                        //         message: 'Delete',
                        //         onPress: () {
                        //           controller.isDeleteDialog(
                        //               planName: AuditPlanPlanningListDetails
                        //                   ?.plan_number,
                        //               planId: AuditPlanPlanningListDetails?.id
                        //                   .toString());
                        //         },
                        //       )
                        //     : Dimens.box0
                        // TableActionButton(
                        //   color: ColorValues.appGreenColor,
                        //   icon: Icons.add,
                        //   message: 'Approve/Reject',
                        //   onPress: () {
                        //     // int id =
                        //     //     AuditPlanPlanningListDetails?.planId ?? 0;
                        //     // if (id != 0) {
                        //     //   Get.toNamed(
                        //     //     Routes.viewMcPlaning,
                        //     //     arguments: {'id': id, "type": 1},
                        //     //   );
                        //     // }
                        //   },
                        // ),
                        // TableActionButton(
                        //   color: Color.fromARGB(255, 141, 183, 180),
                        //  icon: Icons.add,
                        // label: 'Execute',
                        // message: 'Schedule Execution',
                        // onPress: () {
                        // Get.dialog(AddMCExecutionDialog(
                        //   planId: AuditPlanPlanningListDetails?.planId,
                        //   frequency:
                        //       AuditPlanPlanningListDetails?.frequency,
                        // ));
                        //   int id =
                        //       AuditPlanPlanningListDetails?.planId ??
                        //           0;
                        //   if (id != 0) {
                        //     Get.toNamed(Routes.purchaseGoodsorderView,
                        //         arguments: {'id': id, "type": 1});
                        //   }
                        // },
                        // onPress: () {
                        //   controller.viewAddGoodsOrdersDetails(
                        //       planId: int.tryParse('${record[0]}'));
                        //},
                        //  )
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreIdData();
        controller.clearValue();
        int auditId = AuditPlanPlanningListDetails?.id ?? 0;
        if (auditId != 0) {
          Get.offAllNamed(
              '${Routes.viewAuditPlan}/$auditId/${controller.type.value}');
        }
      },
    );
  }

  @override
  int get rowCount => filteredAuditPlanList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
