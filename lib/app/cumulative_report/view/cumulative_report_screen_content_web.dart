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

final List<Map<String, dynamic>> statutoryData = [
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
  {
    "Year": "Bellary",
    'Month': '130',
    'Site Name': '125',
    'Actual Gen': '5',
    'Forecosting Gen': '0',
    'Devaition': '0',
    'DSM Penalty': '122',
    'extension': '3',
    'time': '98%',
  },
];

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
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: DropdownWebWidget(
                                        dropdownList: controller.moduleList,
                                        isValueSelected: controller
                                            .isModuleListSelected.value,
                                        selectedValue:
                                            controller.selectedModuleList.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
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
                                    // hintText:
                                    //     '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 30,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.appDarkBlueColor,
                                  onPressed: () {},
                                  text: 'Search',
                                ),
                              ),
                              Dimens.boxWidth10
                            ],
                          ),
                        ),
                        Dimens.boxHeight10,
                        Row(
                          children: [
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'Column Visibility',
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                  backgroundColor:
                                      ColorValues.appLightBlueColor,
                                  onPressed: () {},
                                  text: 'Excel'),
                            ),
                            Spacer(),
                            Container(
                              width: 300,
                              height: 40,
                              margin: Dimens.edgeInsets0_0_16_0,
                              child: TextField(
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16.0,
                                      height: 1.0,
                                      color: Colors.black),
                                ),
                                onChanged: (value) {},
                                // =>
                                // controller.search(value),
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 0.0,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 0.0,
                                    ),
                                  ),
                                  contentPadding: Dimens.edgeInsets05_10,
                                  hintText: 'search'.tr,
                                  hintStyle: Styles.grey16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Color.fromARGB(255, 245, 248, 250),
                          width: Get.width,
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: DataTable2(
                              headingRowHeight: 50,
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              minWidth: 2000,
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
                                  fixedWidth: 200,
                                  label: Text(
                                    'Job created',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Jobs closed',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Jobs cancelled',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Job not started',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Job ongoing',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Job closed on time',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Jobs closed with extension',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Job closed on time %',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                              ],
                              rows: statutoryData.map(
                                (data) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(data['Year'])),
                                      DataCell(Text(data['Month'])),
                                      DataCell(Text(data['Site Name'])),
                                      DataCell(Text(data['Actual Gen'])),
                                      DataCell(Text(data['Forecosting Gen'])),
                                      DataCell(Text(data['Devaition'])),
                                      DataCell(Text(data['DSM Penalty'])),
                                      DataCell(Text(data['extension'])),
                                      DataCell(Text(data['time'])),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
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
