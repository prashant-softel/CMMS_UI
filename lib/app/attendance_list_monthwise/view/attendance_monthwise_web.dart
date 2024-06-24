import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_controlller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AttendanceMonthWiseWeb extends GetView<AttendanceListMonthController> {
  AttendanceMonthWiseWeb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceListMonthController>(
        id: "attendance-list-month",
        builder: (controller) {
          final uniqueDates = <String>{};
          controller.attendanceMonthModel.value.attendance?.forEach((employee) {
            employee.details?.forEach((data) {
              uniqueDates.add(data.date ?? "");
            });
          });
          final List<String> sortedDates = uniqueDates.toList()..sort();
          return Scaffold(
            body: Obx(
              () => Stack(
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
                        child: SingleChildScrollView(
                          child: Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                            child: Card(
                              margin: Dimens.edgeInsets12,
                              color: ColorValues.cardColor,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Attendance List",
                                          style: Styles.blackBold18,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(title: 'Date Range'),
                                            Dimens.boxWidth10,
                                            CustomTextFieldForStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              numberTextField: true,
                                              onTap: () async {
                                                List<DateTime?>
                                                    _selectedDateRange = [
                                                  controller.fromDate.value,
                                                  controller.toDate.value
                                                ];
                                                List<DateTime?>? picked =
                                                    await showCalendarDatePicker2Dialog(
                                                  context: context,
                                                  config:
                                                      CalendarDatePicker2WithActionButtonsConfig(
                                                    calendarType:
                                                        CalendarDatePicker2Type
                                                            .range,
                                                    selectedDayHighlightColor:
                                                        ColorValues
                                                            .primaryColor,
                                                    selectedRangeHighlightColor:
                                                        ColorValues
                                                            .primaryColor,
                                                    weekdayLabelTextStyle:
                                                        TextStyle(
                                                            color:
                                                                Colors.black),
                                                    controlsTextStyle:
                                                        TextStyle(
                                                            color:
                                                                Colors.black),
                                                    dayTextStyle: TextStyle(
                                                        color: Colors.black),
                                                    selectedDayTextStyle:
                                                        TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    yearTextStyle: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  dialogSize:
                                                      const Size(300, 400),
                                                  value: _selectedDateRange,
                                                  dialogBackgroundColor:
                                                      Colors.white,
                                                );
                                                if (picked != null) {
                                                  print("${picked[0]}");
                                                  print("${picked[1]}");
                                                  controller.fromDate.value =
                                                      picked[0] ??
                                                          DateTime.now();
                                                  controller.toDate.value =
                                                      picked[1] ??
                                                          DateTime.now();
                                                }
                                                // controller
                                                //         .openFromDateToStartDatePicker =
                                                //     !controller
                                                //         .openFromDateToStartDatePicker;
                                                // controller.update(
                                                //     ['attendance-list-month']);
                                              },
                                              hintText:
                                                  '${controller.formattedFromdate.toString()} - ${controller.formattedTodate.toString()}',
                                            ),
                                          ],
                                        ),
                                        Dimens.boxWidth10,
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
                                  Container(
                                    height: ((controller.attendanceMonthModel
                                                .value.attendance!.length) *
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
                                      border:
                                          TableBorder.all(color: Colors.black),
                                      dataRowHeight: 40,
                                      headingRowHeight: 90,
                                      columns: _buildColumns(sortedDates),
                                      rows: _buildRows(),
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
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      right: 230,
                      top: 90,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorValues.appDarkBlueColor),
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
                          var dropDate =
                              DateTime.parse(data.endDate.toString());
                          dropDate != null
                              ? controller.toDate.value = dropDate
                              : controller.toDate.value = pickUpDate;
                          controller.openFromDateToStartDatePicker =
                              !controller.openFromDateToStartDatePicker;
                          controller.update(['attendance-list-month']);
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }

  List<DataColumn> _buildColumns(sortedDates) {
    List<DataColumn> columns = [
      DataColumn2(
        fixedWidth: 200,
        label: Text(
          'Employee Name',
        ),
      ),
    ];
    for (var detail in sortedDates) {
      columns.add(DataColumn2(
        fixedWidth: 75,
        label: RotatedBox(
          quarterTurns: 3,
          child: Text(
            detail,
          ),
        ),
      ));
    }
    return columns;
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];
    for (var employee
        in controller.attendanceMonthModel.value.attendance ?? []) {
      List<DataCell> cells = [
        DataCell(
          Tooltip(
            message:
                'Name: ${employee.employeeName}\nDate of Joining: ${employee.dateOfJoining}\nDate of Exit: ${employee.dateOfExit ?? 'N/A'}\nWorking Status: ${employee.workingStatus}',
            child: Text(employee.employeeName),
          ),
        ),
      ];
      for (var detail in employee.details) {
        cells.add(
          DataCell(
            Tooltip(
              message:
                  'Name: ${employee.employeeName}\nDate of Joining: ${detail.date}\nAttendance: Present\nTiming: ${detail.inTime}-${detail.outTime}',
              child: Text(detail.status),
            ),
          ),
        );
      }
      rows.add(DataRow(cells: cells));
    }
    return rows;
  }
}
