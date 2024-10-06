import 'package:cmms/app/cumulative_report/cumulative_report_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CumulativeReportContentWeb extends StatefulWidget {
  CumulativeReportContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CumulativeReportContentWeb> createState() =>
      _CumulativeReportContentWebState();
}

class _CumulativeReportContentWebState
    extends State<CumulativeReportContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CumulativeReportController>(
        id: 'cumulative_report',
        builder: (controller) {
          return SelectionArea(
              child: Obx(
            () => Column(children: [
              HeaderWidgetAllDash(),
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
                        Get.offNamed(Routes.cmmsReport);
                      },
                      child: Text(" / REPORT", style: Styles.greyLight14),
                    ),
                    Text(
                        controller.type.value == 1
                            ? " / BASIC REPORT"
                            : " / CUMULATIVE REPORT",
                        style: Styles.greyLight14)
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: Get.height - 150,
                    // color: ColorValues.addNewColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                controller.type.value == 1
                                    ? "BASIC REPORT"
                                    : "CUMULATIVE REPORT",
                                style: Styles.blackBold16,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Text(
                                    "Select Plants:",
                                    style: Styles.black13,
                                  ),
                                  Dimens.boxWidth2,
                                  SizedBox(
                                    width: controller.type.value == 1 &&
                                                controller.module_id == 2 ||
                                            controller.type.value == 1 &&
                                                controller.module_id == 39
                                        ? MediaQuery.of(context).size.width / 7
                                        : MediaQuery.of(context).size.width / 5,
                                    child: CustomMultiSelectDialogField(
                                      buttonText: 'Select Facility Name',
                                      title: 'Facility Name',
                                      initialValue: (controller
                                              .selectedFacilityIdList
                                              .isNotEmpty)
                                          ? controller.selectedFacilityIdList
                                          : [],
                                      items: controller.facilityList
                                          .map(
                                            (facility) => MultiSelectItem(
                                              facility?.id,
                                              facility?.name ?? '',
                                            ),
                                          )
                                          .toList(),
                                      onConfirm: (selectedOptionsList) => {
                                        controller.facilitySelected(
                                            selectedOptionsList),
                                      },
                                    ),
                                  ),
                                ]),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      " Select Module:",
                                      style: Styles.black13,
                                    ),
                                    Dimens.boxWidth2,
                                    DropdownWebWidget(
                                      height: 40,
                                      width: controller.type.value == 1 &&
                                                  controller.module_id == 2 ||
                                              controller.type.value == 1 &&
                                                  controller.module_id == 39
                                          ? MediaQuery.of(context).size.width /
                                              7
                                          : MediaQuery.of(context).size.width /
                                              5,
                                      dropdownList: controller.moduleList,
                                      isValueSelected:
                                          controller.isModuleListSelected.value,
                                      selectedValue:
                                          controller.selectedModuleList.value,
                                      onValueChanged: controller.onValueChanged,
                                    ),
                                  ],
                                ),
                              ),
                              controller.type.value == 1 &&
                                          controller.module_id == 2 ||
                                      controller.type.value == 1 &&
                                          controller.module_id == 39
                                  ? Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            " Select Categories:",
                                            style: Styles.black13,
                                          ),
                                          Dimens.boxWidth2,
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,
                                            child: CustomMultiSelectDialogField(
                                              buttonText: 'Select Category',
                                              title: 'Category Name',
                                              initialValue: (controller
                                                      .selectedCategoryIdList
                                                      .isNotEmpty)
                                                  ? controller
                                                      .selectedCategoryIdList
                                                  : [],
                                              items: controller
                                                  .equipmentCategoryList
                                                  .map(
                                                    (category) =>
                                                        MultiSelectItem(
                                                      category?.id,
                                                      category?.name ?? '',
                                                    ),
                                                  )
                                                  .toList(),
                                              onConfirm:
                                                  (selectedOptionsList) => {
                                                controller.categorySelected(
                                                    selectedOptionsList),
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Dimens.box0,
                              Row(
                                children: [
                                  Text(
                                    " Date Range:",
                                    style: Styles.black13,
                                  ),
                                  Dimens.boxWidth2,
                                  CustomTextFieldForStock(
                                    width: controller.type.value == 1 &&
                                                controller.module_id == 2 ||
                                            controller.type.value == 1 &&
                                                controller.module_id == 39
                                        ? MediaQuery.of(context).size.width / 7
                                        : MediaQuery.of(context).size.width / 5,
                                    numberTextField: true,
                                    onTap: () {
                                      controller.openFromDateToStartDatePicker =
                                          !controller
                                              .openFromDateToStartDatePicker;
                                      controller.update(['cumulative_report']);
                                    },
                                    hintText:
                                        '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                  ),
                                ],
                              ),
                              Container(
                                // margin: EdgeInsets.only(right: 10),
                                height: 30,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.appDarkBlueColor,
                                  onPressed: () {
                                    if (controller.type.value == 1 &&
                                        controller.module_id == 2) {
                                      controller.getJobList();
                                    } else if (controller.type.value == 1 &&
                                        controller.module_id == 39) {
                                      controller.getPmTaskList();
                                    } else if (controller.type.value == 1 &&
                                        controller.module_id == 44) {
                                      controller.getVegTaskList();
                                    } else if (controller.type.value == 1 &&
                                        controller.module_id == 43) {
                                      controller.getMCTaskList();
                                    } else {
                                      controller.getCumulativeReportList();
                                    }
                                  },
                                  text: 'Search',
                                ),
                              ),
                              Dimens.boxWidth2
                            ],
                          ),
                        ),
                        controller.cumulativereport.length > 0 &&
                                    controller.module_id.value == 2 ||
                                controller.cumulativereport.length > 0 &&
                                    controller.module_id.value == 39
                            ? Container(
                                margin: EdgeInsets.all(20),
                                color: Color.fromARGB(255, 245, 248, 250),
                                width: Get.width,
                                height: ((controller.cumulativereport.length) *
                                        40) +
                                    200,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable2(
                                    headingRowHeight: 50,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 1500,
                                    columns: [
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Site name',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          controller.module_id.value == 2
                                              ? 'Job created'
                                              : 'PM created',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          controller.module_id.value == 2
                                              ? 'Jobs closed'
                                              : 'PMs closed',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          controller.module_id.value == 2
                                              ? 'Jobs cancelled'
                                              : 'PMs cancelled',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 140,
                                        label: Text(
                                          controller.module_id.value == 2
                                              ? 'Job not started'
                                              : 'PM not started',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          controller.module_id.value == 2
                                              ? 'Job ongoing'
                                              : 'PM ongoing',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          controller.module_id.value == 2
                                              ? 'Job closed on time'
                                              : 'PM closed on time',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 190,
                                        label: Text(
                                          controller.module_id.value == 2
                                              ? 'Jobs closed with extension'
                                              : 'PMs closed with extension',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      if (controller.module_id.value == 2)
                                        DataColumn2(
                                          fixedWidth: 170,
                                          label: Text(
                                            'Job closed on time %',
                                            style: Styles.blackBold14,
                                          ),
                                          // size: ColumnSize.L,
                                        )
                                    ],
                                    rows: List<DataRow>.generate(
                                        controller.cumulativereport.length,
                                        (index) => DataRow(
                                              cells: [
                                                DataCell(Text(controller
                                                    .cumulativereport[index]
                                                    ?.site_name)),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.Created
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.Closed
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.Cancelled
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.NotStarted
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.Ongoing
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.ClosedOnTime
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.ClosedWithExtension
                                                        .toString() ??
                                                    "")),
                                                if (controller
                                                        .module_id.value ==
                                                    2)
                                                  DataCell(Text(
                                                    '${((controller.cumulativereport[index]?.ClosedOnTime ?? 0) / (controller.cumulativereport[index]?.Created) * 100).toStringAsFixed(1)}%',
                                                  ))
                                              ],
                                            )),
                                  ),
                                ),
                              )
                            : Dimens.box0,
                        controller.cumulativereport.length > 0 &&
                                    controller.module_id.value == 43 ||
                                controller.cumulativereport.length > 0 &&
                                    controller.module_id.value == 44
                            ? Container(
                                margin: EdgeInsets.all(20),
                                color: Color.fromARGB(255, 245, 248, 250),
                                width: Get.width,
                                height: ((controller.cumulativereport.length) *
                                        40) +
                                    100,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable2(
                                    headingRowHeight: 50,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 1500,
                                    columns: [
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Site name',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Scheduled Qnty',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Actual Qnty',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Deviation',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 140,
                                        label: Text(
                                          'No. of cycles',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      if (controller.module_id.value == 43)
                                        DataColumn2(
                                          fixedWidth: 120,
                                          label: Text(
                                            'Cleaning type',
                                            style: Styles.blackBold14,
                                          ),
                                          // size: ColumnSize.L,
                                        ),
                                      if (controller.module_id.value == 43)
                                        DataColumn2(
                                          fixedWidth: 120,
                                          label: Text(
                                            'Water used',
                                            style: Styles.blackBold14,
                                          ),
                                          // size: ColumnSize.L,
                                        ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Time taken',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Abondoned',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      )
                                    ],
                                    rows: List<DataRow>.generate(
                                        controller.cumulativereport.length,
                                        (index) => DataRow(
                                              cells: [
                                                DataCell(Text(controller
                                                    .cumulativereport[index]
                                                    ?.site_name)),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.scheduledQuantity
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.actualQuantity
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.deviation
                                                        .toString() ??
                                                    "")),
                                                if (controller
                                                        .module_id.value ==
                                                    43)
                                                  DataCell(Text(controller
                                                          .cumulativereport[
                                                              index]
                                                          ?.NotStarted
                                                          .toString() ??
                                                      "")),
                                                if (controller
                                                        .module_id.value ==
                                                    43)
                                                  DataCell(Text(controller
                                                          .cumulativereport[
                                                              index]
                                                          ?.cleaningType
                                                          .toString() ??
                                                      "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.waterUsed
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.timeTaken
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.abandoned
                                                        .toString() ??
                                                    ""))
                                              ],
                                            )),
                                  ),
                                ),
                              )
                            : Dimens.box0,
                        controller.jobList.length > 0 &&
                                controller.module_id.value == 2 &&
                                controller.type.value == 1
                            ? Container(
                                margin: EdgeInsets.all(20),
                                color: Color.fromARGB(255, 245, 248, 250),
                                width: Get.width,
                                height: Get.height - 290,
                                // ((controller.jobList.length) * 40) + 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable2(
                                    headingRowHeight: 50,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 2000,
                                    columns: [
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Job ID',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Facility Name',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Job Title',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),

                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Category',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Equipment Name',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Description',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Breakdown Time',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Assigned To',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Permit ID',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Permit Type',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Isolation taken?',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Action',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      )
                                    ],
                                    rows: List<DataRow>.generate(
                                        controller.jobList.length,
                                        (index) => DataRow(
                                              cells: [
                                                DataCell(Text(
                                                    '${controller.jobList[index]?.id.toString()}')),
                                                DataCell(Text(controller
                                                        .jobList[index]
                                                        ?.facilityName
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .jobList[index]?.name
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .jobList[index]
                                                        ?.equipmentCat
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .jobList[index]
                                                        ?.workingArea
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .jobList[index]
                                                        ?.description
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .jobList[index]
                                                        ?.breakdownTime
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .jobList[index]
                                                        ?.assignedToName
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(
                                                    '${controller.jobList[index]?.permitId.toString()}')),
                                                DataCell(Text(
                                                    '${controller.jobList[index]?.permitType.toString()}')),
                                                DataCell(Text(controller
                                                            .jobList[index]
                                                            ?.isolation ==
                                                        0
                                                    ? "NO"
                                                    : "YES")),
                                                DataCell(Wrap(children: [
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.viewColor,
                                                    icon: Icons.visibility,
                                                    message: 'View',
                                                    onPress: () {
                                                      Get.toNamed(
                                                          '${Routes.jobDetails}/${controller.jobList[index]?.id}');
                                                    },
                                                  ),
                                                  Dimens.boxWidth5,
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.draftColor,
                                                    icon: Icons.download,
                                                    message: 'Download',
                                                    onPress: () async {
                                                      await controller
                                                          .getJobDetails(
                                                        controller
                                                                .jobList[index]
                                                                ?.id ??
                                                            0,
                                                        controller
                                                                .jobList[index]
                                                                ?.facilityId ??
                                                            0,
                                                      );
                                                      // await controller
                                                      //     .getMrsListByModule(
                                                      //   jobId: controller
                                                      //           .jobList[index]
                                                      //           ?.id ??
                                                      //       0,
                                                      //   facilityId: controller
                                                      //           .jobList[index]
                                                      //           ?.facilityId ??
                                                      //       0,
                                                      // );

                                                      // await controller
                                                      //     .getjobDetailsModel(
                                                      //         controller
                                                      //                 .jobList[
                                                      //                     index]
                                                      //                 ?.id ??
                                                      //             0,
                                                      //         controller
                                                      //                 .jobList[
                                                      //                     index]
                                                      //                 ?.facilityId ??
                                                      //             0);
                                                    },
                                                  ),
                                                ])),
                                              ],
                                            )),
                                  ),
                                ),
                              )
                            : Dimens.box0,
                        controller.pmTaskList.length > 0 &&
                                controller.module_id.value == 39 &&
                                controller.type.value == 1
                            ? Container(
                                margin: EdgeInsets.all(20),
                                color: Color.fromARGB(255, 245, 248, 250),
                                width: Get.width,
                                height: Get.height - 290,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable2(
                                    headingRowHeight: 50,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 2500,
                                    columns: [
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Facility Name',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'PM Plan ID',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Category',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),

                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'PM Title',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Start date',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'close date',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Frequency',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Task ID',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Assigned To',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Permit ID',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Permit Type',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Isolation taken?',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Status',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Action',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      )
                                    ],
                                    rows: List<DataRow>.generate(
                                        controller.pmTaskList.length,
                                        (index) => DataRow(
                                              cells: [
                                                DataCell(Text(
                                                    '${controller.pmTaskList[index]?.site_name.toString()}')),
                                                DataCell(Text(
                                                    "PMP${controller.pmTaskList[index]?.plan_id.toString() ?? ""}")),
                                                DataCell(Text(controller
                                                        .pmTaskList[index]
                                                        ?.category_name
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .pmTaskList[index]?.name
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .pmTaskList[index]
                                                        ?.start_date
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .pmTaskList[index]
                                                        ?.done_date
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .pmTaskList[index]
                                                        ?.frequency_name
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(
                                                    'PMT${controller.pmTaskList[index]?.id.toString()}')),
                                                DataCell(Text(
                                                    '${controller.pmTaskList[index]?.assigned_to_name.toString()}')),
                                                DataCell(Text(
                                                    'PTW${controller.pmTaskList[index]?.permit_id.toString()}')),
                                                DataCell(Text(
                                                    '${controller.pmTaskList[index]?.permit_type.toString()}')),
                                                DataCell(Text(controller
                                                            .pmTaskList[index]
                                                            ?.isolation ==
                                                        0
                                                    ? "NO"
                                                    : "YES")),
                                                DataCell(Text(
                                                    '${controller.pmTaskList[index]?.status_short.toString()}')),
                                                DataCell(Wrap(children: [
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.viewColor,
                                                    icon: Icons.visibility,
                                                    message: 'View',
                                                    onPress: () {
                                                      String id = controller
                                                              .pmTaskList[index]
                                                              ?.id
                                                              .toString() ??
                                                          "";

                                                      String encodedId =
                                                          Uri.encodeComponent(
                                                              id);
                                                      Get.offAllNamed(
                                                          '${Routes.pmTaskView}/$encodedId');
                                                    },
                                                  ),
                                                  Dimens.boxWidth5,
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.draftColor,
                                                    icon: Icons.download,
                                                    message: 'Download',
                                                    onPress: () {
                                                      controller.getPmtaskViewList(
                                                          scheduleId: controller
                                                                  .pmTaskList[
                                                                      index]
                                                                  ?.id ??
                                                              0,
                                                          isloading: true,
                                                          facilityId: controller
                                                                  .pmTaskList[
                                                                      index]
                                                                  ?.facility_id ??
                                                              0);
                                                    },
                                                  ),
                                                ])),
                                              ],
                                            )),
                                  ),
                                ),
                              )
                            : Dimens.box0,
                        controller.vegTaskList.length > 0 &&
                                controller.module_id.value == 44 &&
                                controller.type.value == 1
                            ? Container(
                                margin: EdgeInsets.all(20),
                                color: Color.fromARGB(255, 245, 248, 250),
                                width: Get.width,
                                height: Get.height - 290,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable2(
                                    headingRowHeight: 50,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 2500,
                                    columns: [
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Facility Name',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Task ID',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Title',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Scheduled Qnty',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Actual Qnty ',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),

                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Deviation',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Machine type',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 200,
                                        label: Text(
                                          'Time taken',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Remarks',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Action',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        controller.vegTaskList.length,
                                        (index) => DataRow(
                                              cells: [
                                                DataCell(Text(
                                                    '${controller.vegTaskList[index]?.sitename.toString()}')),
                                                DataCell(Text(
                                                    'VGT${controller.vegTaskList[index]?.id.toString()}')),
                                                DataCell(Text(
                                                    '${controller.vegTaskList[index]?.title.toString()}')),
                                                DataCell(Text(
                                                    "${controller.vegTaskList[index]?.scheduled_Qnty.toString() ?? ""}")),
                                                DataCell(Text(controller
                                                        .vegTaskList[index]
                                                        ?.actual_Qnty
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .vegTaskList[index]
                                                        ?.deviation
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text("")),
                                                DataCell(Text(controller
                                                        .vegTaskList[index]
                                                        ?.time_taken
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .vegTaskList[index]
                                                        ?.remark
                                                        .toString() ??
                                                    "")),
                                                DataCell(Wrap(children: [
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.viewColor,
                                                    icon: Icons.visibility,
                                                    message: 'View',
                                                    onPress: () {
                                                      int executionId =
                                                          controller
                                                                  .vegTaskList[
                                                                      index]
                                                                  ?.id ??
                                                              0;
                                                      int planId = controller
                                                              .vegTaskList[
                                                                  index]
                                                              ?.planId ??
                                                          0;

                                                      String encodedId =
                                                          Uri.encodeComponent(
                                                              executionId
                                                                  .toString());
                                                      String encodedPlanId =
                                                          Uri.encodeComponent(
                                                              planId
                                                                  .toString());
                                                      Get.toNamed(
                                                          '${Routes.vegExecutionScreen}/${encodedId}/${encodedPlanId}');
                                                    },
                                                  ),
                                                  Dimens.boxWidth5,
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.draftColor,
                                                    icon: Icons.download,
                                                    message: 'Download',
                                                    onPress: () async {
                                                      await controller
                                                          .getVegExecutionDetail(
                                                        executionId: controller
                                                                .vegTaskList[
                                                                    index]
                                                                ?.id ??
                                                            0,
                                                        facilityId: 0,
                                                      );
                                                    },
                                                  ),
                                                ])),
                                              ],
                                            )),
                                  ),
                                ),
                              )
                            : Dimens.box0,
                        controller.mcTaskList.length > 0 &&
                                controller.module_id.value == 43 &&
                                controller.type.value == 1
                            ? Container(
                                margin: EdgeInsets.all(20),
                                color: Color.fromARGB(255, 245, 248, 250),
                                width: Get.width,
                                height: Get.height - 290,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable2(
                                    headingRowHeight: 50,
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 2500,
                                    columns: [
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Facility Name',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Task ID',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Title',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Cycle',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),

                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Scheduled Qnty',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Actual Qnty ',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),

                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Deviation',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Cleaning type',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Water used',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Abondoned',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      // if (controller.module_id.value == 43)
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Time taken',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Remarks',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Action',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        controller.mcTaskList.length,
                                        (index) => DataRow(
                                              cells: [
                                                DataCell(Text(
                                                    '${controller.mcTaskList[index]?.sitename.toString()}')),
                                                DataCell(Text(
                                                    'MCT${controller.mcTaskList[index]?.executionId.toString()}')),
                                                DataCell(Text(
                                                    '${controller.mcTaskList[index]?.title.toString()}')),
                                                DataCell(Text(
                                                    "${controller.mcTaskList[index]?.noOfDays.toString() ?? ""}")),
                                                DataCell(Text(
                                                    "${controller.mcTaskList[index]?.scheduled_Qnty.toString() ?? ""}")),
                                                DataCell(Text(
                                                    "${controller.mcTaskList[index]?.actual_Qnty.toString() ?? ""}")),
                                                DataCell(Text(
                                                    "${controller.mcTaskList[index]?.deviation.toString() ?? ""}")),
                                                DataCell(Text(
                                                    "${controller.mcTaskList[index]?.cleaningType.toString() ?? ""}")),
                                                DataCell(Text(controller
                                                        .mcTaskList[index]
                                                        ?.water_used
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .mcTaskList[index]
                                                        ?.abondend
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .mcTaskList[index]
                                                        ?.time_taken
                                                        .toString() ??
                                                    "")),
                                                DataCell(Text(controller
                                                        .mcTaskList[index]
                                                        ?.remark
                                                        .toString() ??
                                                    "")),
                                                DataCell(Wrap(children: [
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.viewColor,
                                                    icon: Icons.visibility,
                                                    message: 'View',
                                                    onPress: () {
                                                      int id = controller
                                                              .mcTaskList[index]
                                                              ?.executionId ??
                                                          0;
                                                      int planId = controller
                                                              .mcTaskList[index]
                                                              ?.planId ??
                                                          0;
                                                      if (id != 0) {
                                                        // controller
                                                        //     .clearStoreDataMcid();
                                                        // controller
                                                        //     .clearStoreDataPlanid();
                                                        Get.toNamed(
                                                            Routes
                                                                .addModuleCleaningExecutionContentWeb,
                                                            arguments: {
                                                              "mcid": id,
                                                              "planId": planId
                                                            });
                                                      }
                                                    },
                                                  ),
                                                  Dimens.boxWidth5,
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.draftColor,
                                                    icon: Icons.download,
                                                    message: 'Download',
                                                    onPress: () {
                                                      controller
                                                          .getMCExecutionDetail(
                                                              executionId: controller
                                                                      .mcTaskList[
                                                                          index]
                                                                      ?.executionId ??
                                                                  0,
                                                              facilityId:
                                                                  // controller
                                                                  //         .mcTaskList[
                                                                  //             index]
                                                                  //         ?.facility_id ??
                                                                  0);
                                                    },
                                                  ),
                                                ])),
                                              ],
                                            )),
                                  ),
                                ),
                              )
                            : Dimens.box0
                      ],
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
                          PickerDateRange? data = value as PickerDateRange;

                          var pickUpDate =
                              DateTime.parse(data.startDate.toString());
                          controller.fromDate.value = pickUpDate;
                          var dropDate =
                              DateTime.parse(data.endDate.toString());
                          dropDate != null
                              ? controller.toDate.value = dropDate
                              : controller.toDate.value = pickUpDate;

                          // controller.getPmTaskListByDate();
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['cumulative_report']);

                          // Get.toNamed(
                          //   Routes.stockManagementGoodsOrdersScreen,
                          // );
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['cumulative_report']);
                        },
                      ),
                    ),
                ],
              ),
            ]),
          ));
        });
  }
}
