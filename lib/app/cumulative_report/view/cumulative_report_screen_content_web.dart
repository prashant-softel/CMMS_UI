import 'package:cmms/app/cumulative_report/cumulative_report_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
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
                    Text(" / CUMULATIVE REPORT", style: Styles.greyLight14)
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                "CUMULATIVE REPORT",
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
                                    "Select Plants :",
                                    style: Styles.black15,
                                  ),
                                  Dimens.boxWidth2,
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
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
                                      "Select Module :",
                                      style: Styles.black15,
                                    ),
                                    Dimens.boxWidth2,
                                    DropdownWebWidget(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
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
                              Row(
                                children: [
                                  Text(
                                    "Date Range :",
                                    style: Styles.black15,
                                  ),
                                  Dimens.boxWidth2,
                                  CustomTextFieldForStock(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
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
                                margin: EdgeInsets.only(right: 10),
                                height: 30,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.appDarkBlueColor,
                                  onPressed: () {
                                    controller.getCumulativeReportList();
                                  },
                                  text: 'Search',
                                ),
                              ),
                              Dimens.boxWidth10
                            ],
                          ),
                        ),
                        controller.cumulativereport.length > 0
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
                                        fixedWidth: 120,
                                        label: Text(
                                          'Job created',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Jobs closed',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Jobs cancelled',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 140,
                                        label: Text(
                                          'Job not started',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 120,
                                        label: Text(
                                          'Job ongoing',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 150,
                                        label: Text(
                                          'Job closed on time',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 190,
                                        label: Text(
                                          'Jobs closed with extension',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
                                      DataColumn2(
                                        fixedWidth: 170,
                                        label: Text(
                                          'Job closed on time %',
                                          style: Styles.blackBold14,
                                        ),
                                        // size: ColumnSize.L,
                                      ),
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
                                                DataCell(Text(controller
                                                        .cumulativereport[index]
                                                        ?.ClosedOnTimeCreate
                                                        .toString() ??
                                                    "")),
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
