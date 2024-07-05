import 'package:cmms/app/app.dart';
import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_controlller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/month_year_picker.dart';
import 'package:cmms/domain/models/attendance_month_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AttendanceMonthWiseWeb extends StatefulWidget {
  AttendanceMonthWiseWeb({Key? key}) : super(key: key);

  @override
  State<AttendanceMonthWiseWeb> createState() => _AttendanceMonthWiseWebState();
}

class _AttendanceMonthWiseWebState extends State<AttendanceMonthWiseWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceListMonthController>(
      id: "attendance-list-month",
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
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
                            Get.offNamed(Routes.admin_dashboard);
                          },
                          child: Text(
                            " / ADMINISTRATION",
                            style: Styles.greyLight14,
                          ),
                        ),
                        Text(
                          " / ATTENDANCE LIST",
                          style: Styles.greyLight14,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: Get.width * 7,
                      height: Get.height,
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Card(
                        margin: Dimens.edgeInsets12,
                        color: ColorValues.cardColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Attendance List",
                                      style: Styles.blackBold18,
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        CustomRichText(title: 'Date Range'),
                                        SizedBox(width: 10),
                                        CustomTextFieldForStock(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          numberTextField: true,
                                          onTap: () {
                                            controller
                                                    .openFromDateToStartDatePicker
                                                    .value =
                                                !controller
                                                    .openFromDateToStartDatePicker
                                                    .value;
                                            controller.update(
                                                ['attendance-list-month']);
                                          },
                                          hintText:
                                              '${controller.formattedFromdate.toString()} - ${controller.formattedTodate.toString()}',
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    ActionButton(
                                      icon: Icons.add,
                                      label: "Add New",
                                      onPressed: () {
                                        DateTime date = DateTime.now();
                                        String currentDate =
                                            DateFormat("yyyy-MM-dd")
                                                .format(date);
                                        Get.offNamed(
                                          Routes.attendanceScreen,
                                          arguments: {"date": currentDate},
                                        );
                                      },
                                      color: ColorValues.addNewColor,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              controller.attendance.isEmpty
                                  ? Center(
                                      child: Text(""),
                                    )
                                  : Container(
                                      height: ((controller.attendance.length) *
                                              40) +
                                          100,
                                      width: ((controller
                                                      .attendanceMonthModel
                                                      .value
                                                      .attendance?[0]
                                                      .details
                                                      ?.length ??
                                                  0) *
                                              75) +
                                          200,
                                      constraints: BoxConstraints(
                                        minWidth: Get.width,
                                        maxWidth: Get.width * 5,
                                      ),
                                      child: DataTable2(
                                        minWidth: Get.width * 1.2,
                                        border: TableBorder.all(
                                            color: Colors.black),
                                        dataRowHeight: 40,
                                        headingRowHeight: 90,
                                        columns: _buildColumns(
                                            controller.sortedDates),
                                        rows: _buildRows(controller.attendance,
                                            controller.sortedDates),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (controller.openFromDateToStartDatePicker.value)
                Positioned(
                  right: 230,
                  top: 90,
                  child: MonthPickerWidget(
                    selectionMode: DateRangePickerSelectionMode.range,
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      todayCellDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorValues.appDarkBlueColor,
                      ),
                    ),
                    initialSelectedRange: PickerDateRange(
                      controller.fromDate.value,
                      controller.toDate.value,
                    ),
                    onSubmit: (value) {
                      if (value is PickerDateRange) {
                        // Ensure the selected range is within the same month
                        final DateTime startDate = value.startDate!;
                        final DateTime endDate = value.endDate!;
                        if (startDate.month != endDate.month) {
                          // Adjust selection to fit within the same month
                          final adjustedStartDate =
                              DateTime(startDate.year, startDate.month, 1);
                          final adjustedEndDate = DateTime(
                              endDate.year,
                              endDate.month,
                              DateTime(endDate.year, endDate.month + 1, 0).day);
                          value = PickerDateRange(
                              adjustedStartDate, adjustedEndDate);
                        }

                        // Update your controller or handle the selected range as needed
                        var pickUpDate = startDate;
                        controller.fromDate.value = pickUpDate;
                        var dropDate = endDate;
                        controller.toDate.value = dropDate;

                        // Additional logic if needed
                        controller.openFromDateToStartDatePicker.value =
                            !controller.openFromDateToStartDatePicker.value;
                        controller.update(['attendance-list-month']);
                      }

                      // Print the selected value for debugging
                      print('Selected date range: $value');
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  List<DataColumn> _buildColumns(List<String> sortedDates) {
    List<DataColumn> columns = [
      DataColumn2(
        fixedWidth: 200,
        label: Text('Employee Name'),
      ),
    ];
    for (var date in sortedDates) {
      columns.add(DataColumn2(
        fixedWidth: 75,
        label: RotatedBox(
          quarterTurns: 3,
          child: Text(date),
        ),
      ));
    }
    return columns;
  }

  List<DataRow> _buildRows(List<Employee> employees, List<String> sortedDates) {
    List<DataRow> rows = [];
    for (var employee in employees) {
      List<DataCell> cells = [
        DataCell(
          Tooltip(
            message:
                'Name: ${employee.employeeName}\nDate of Joining: ${employee.dateOfJoining}\nDate of Exit: ${employee.dateOfExit ?? 'N/A'}\nWorking Status: ${employee.workingStatus}',
            child: Text(employee.employeeName ?? ""),
          ),
        ),
      ];
      final detailsMap = {
        for (var d in employee.details ?? []) d.date.split('T')[0]: d
      };
      for (var date in sortedDates) {
        if (detailsMap.containsKey(date)) {
          var detail = detailsMap[date];
          cells.add(
            DataCell(
              Tooltip(
                message:
                    'Name: ${employee.employeeName}\nDate: ${date}\nAttendance: ${detail.status == "P" ? "Present" : "Absent"}\nTiming: ${detail.inTime}-${detail.outTime}',
                child: Text(detail.status),
              ),
            ),
          );
        } else {
          cells.add(DataCell(Text('')));
        }
      }
      rows.add(DataRow(cells: cells));
    }
    return rows;
  }
}
