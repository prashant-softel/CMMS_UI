import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_controlller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/domain/models/attendance_month_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:cmms/app/theme/dimens.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class AttendanceMonthwiseListMobile
    extends GetView<AttendanceListMonthController> {
  const AttendanceMonthwiseListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceListMonthController>(
      id: "attendance-list-month",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      HeaderWidgetMobile(
                        onPressed: () {
                          controller.openFromDateToStartDatePicker =
                              !controller.openFromDateToStartDatePicker;
                          controller.update(['attendance-list-month']);
                        },
                      ),
                      Dimens.boxHeight10,
                      controller.attendance.isEmpty
                          ? Center(
                              child: Text(""),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        ((controller.attendance.length) * 40) +
                                            100,
                                    width: ((controller
                                                    .attendanceMonthModel
                                                    .value
                                                    .attendance?[0]
                                                    .details
                                                    ?.length ??
                                                0) *
                                            70) +
                                        155,
                                    // constraints: BoxConstraints(
                                    //   minWidth: Get.width,
                                    //   maxWidth: Get.width * 10,
                                    // ),
                                    child: DataTable2(
                                      fixedLeftColumns: 1,
                                      minWidth: Get.width * 5,
                                      border:
                                          TableBorder.all(color: Colors.black),
                                      dataRowHeight: 40,
                                      headingRowHeight: 90,
                                      columns:
                                          _buildColumns(controller.sortedDates),
                                      rows: _buildRows(controller.attendance,
                                          controller.sortedDates),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                if (controller.openFromDateToStartDatePicker)
                  Positioned(
                    top: 50,
                    left: 10,
                    right: 10,
                    child: DatePickerWidget(
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
                        print('po valu ${value.toString()}');
                        PickerDateRange? data = value as PickerDateRange;
                        var pickUpDate =
                            DateTime.parse(data.startDate.toString());
                        controller.fromDate.value = pickUpDate;
                        var dropDate = DateTime.parse(data.endDate.toString());
                        dropDate != null
                            ? controller.toDate.value = dropDate
                            : controller.toDate.value = pickUpDate;
                        controller.getAttendanceListByDate();
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['stock_Mangement_Date']);
                      },
                      onCancel: () {
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['stock_Mangement_Date']);
                      },
                    ),
                  ),
                Dimens.boxHeight10,
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: ColorValues.whiteColor,
            ),
            backgroundColor: ColorValues.navyBlueColor,
            onPressed: () {
              DateTime date = DateTime.now();
              String currentDate = DateFormat("yyyy-MM-dd").format(date);
              Get.offNamed(
                Routes.attendanceScreen,
                arguments: {"date": currentDate},
              );
            },
          ),
        );
      },
    );
  }

  List<DataColumn> _buildColumns(List<String> sortedDates) {
    List<DataColumn> columns = [
      DataColumn2(
        fixedWidth: 160,
        label: Text('Employee Name'),
      ),
    ];
    for (var date in sortedDates) {
      columns.add(DataColumn2(
        fixedWidth: 70,
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
