import 'package:cmms/app/app.dart';
import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_controlller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
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
        return Obx(
          () => Scaffold(
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
                                                      .openFromDateToStartDatePicker =
                                                  !controller
                                                      .openFromDateToStartDatePicker;
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
                                        height:
                                            ((controller.attendance.length) *
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
                                          maxWidth: Get.width * 6,
                                        ),
                                        child: DataTable2(
                                          fixedLeftColumns: 1,
                                          minWidth: Get.width * 5,
                                          border: TableBorder.all(
                                              color: Colors.black),
                                          dataRowHeight: 40,
                                          headingRowHeight: 90,
                                          columns: _buildColumns(
                                              controller.sortedDates),
                                          rows: _buildRows(
                                              controller.attendance,
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
              ],
            ),
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
