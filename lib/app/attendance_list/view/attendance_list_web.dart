import 'package:cmms/app/attendance_list/attendance_list_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/domain/models/attendance_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceListWeb extends StatefulWidget {
  AttendanceListWeb({Key? key}) : super(key: key);

  @override
  State<AttendanceListWeb> createState() => _AttendanceListWebState();
}

class _AttendanceListWebState extends State<AttendanceListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceListController>(
        id: "attendance-list",
        builder: (controller) {
          // final uniqueDates = <int>{};
          // controller.attendance_list.forEach((month) {
          //   month.month_data?.forEach((data) {
          //     uniqueDates.add(data.date ?? 0);
          //   });
          // });
          // List<int> sortedDates = uniqueDates.toList();
          // sortedDates.sort(); // Call sort on the list
          // List<DataRow> _rows = []; // Initialize _rows as an empty list
          // for (var date in sortedDates) {
          //   DataRow row = DataRow(cells: [
          //     DataCell(Text(date.toString())),
          //   ]);
          //   for (var month in controller.attendance_list) {
          //     final data = month.month_data?.firstWhere(
          //       (d) => d.date == date,
          //       orElse: () => MonthData(
          //         date: date,
          //         hfe_employees: 0,
          //         less_than_35: 0,
          //         between_30_to_50: 0,
          //         greater_than_50: 0,
          //       ),
          //     );
          //     row.cells.addAll([
          //       DataCell(Text(data!.hfe_employees.toString())),
          //       DataCell(Text(data.less_than_35.toString())),
          //       DataCell(Text(data.between_30_to_50.toString())),
          //       DataCell(Text(data.greater_than_50.toString())),
          //     ]);
          //   }
          //   _rows.add(row);
          // }
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
                            width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 236, 234, 234)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          )
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
                            " / ATTENDANCE SUMMARY",
                            style: Styles.greyLight14,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: Get.width * 7,
                            margin: EdgeInsets.all(10),
                            // height: Get.height,
                            child: Card(
                              color: Color.fromARGB(255, 245, 248, 250),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Attendance List",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),
                                          Dimens.boxWidth10,
                                          // Container(
                                          //   margin: EdgeInsets.only(right: 10),
                                          //   height: 30,
                                          //   child: CustomElevatedButton(
                                          //     backgroundColor:
                                          //         ColorValues.addNewColor,
                                          //     onPressed: () {
                                          //       controller.addAttendance();
                                          //     },
                                          //     text: 'Add New',
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: ColorValues.greyLightColour,
                                    ),
                                    Dimens.boxHeight10,
                                    // First way of data showing
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: controller.attendance_list
                                          .map((attendance) {
                                        return _buildSection(attendance);
                                      }).toList(),
                                    ),
                                    // Second way of data showing
                                    // DataTable(
                                    //   columns: [
                                    //     DataColumn(label: Text('Date')),
                                    //     ...controller.attendance_list
                                    //         .expand((month) {
                                    //       return [
                                    //         DataColumn(
                                    //             label: Text(
                                    //                 '${month.month_name} HFE')),
                                    //         DataColumn(
                                    //             label: Text(
                                    //                 '${month.month_name} < 35')),
                                    //         DataColumn(
                                    //             label: Text(
                                    //                 '${month.month_name} 30-50')),
                                    //         DataColumn(
                                    //             label: Text(
                                    //                 '${month.month_name} > 50')),
                                    //       ];
                                    //     }).toList(),
                                    //   ],
                                    //   rows: sortedDates.map((date) {
                                    //     return DataRow(cells: [
                                    //       DataCell(Text(date.toString())),
                                    //       ...controller.attendance_list
                                    //           .expand((month) {
                                    //         final data =
                                    //             month.month_data?.firstWhere(
                                    //           (d) => d.date == date,
                                    //           orElse: () => MonthData(
                                    //               date: date,
                                    //               hfe_employees: 0,
                                    //               less_than_35: 0,
                                    //               between_30_to_50: 0,
                                    //               greater_than_50: 0),
                                    //         );
                                    //         return [
                                    //           DataCell(Text(data!.hfe_employees
                                    //               .toString())),
                                    //           DataCell(Text(
                                    //               data.less_than_35.toString())),
                                    //           DataCell(Text(data.between_30_to_50
                                    //               .toString())),
                                    //           DataCell(Text(data.greater_than_50
                                    //               .toString())),
                                    //         ];
                                    //       }).toList(),
                                    //     ]);
                                    //   }).toList(),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  // bool _sortAscending = true;
  // int _sortColumnIndex = 0;
  Widget _buildSection(
    AttendanceListModel attendance,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.blueAccent,
              child: Text(
                '${attendance.month_name} ${attendance.year}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            DataTable(
              // sortAscending: _sortAscending,
              // sortColumnIndex: _sortColumnIndex,
              columns: [
                DataColumn(
                  label: Text('Date'),
                  // onSort: (columnIndex, ascending) => _onSort(
                  //     columnIndex,
                  //     ascending,
                  //     attendance.month_data ?? [],
                  //     (d) => d.date ?? 0),
                ),
                DataColumn(
                  label: Text('HFE'),
                  // onSort: (columnIndex, ascending) => _onSort(
                  //     columnIndex,
                  //     ascending,
                  //     attendance.month_data ?? [],
                  //     (d) => d.hfe_employees ?? 0),
                ),
                DataColumn(
                  label: Text('< 35'),
                  // onSort: (columnIndex, ascending) => _onSort(
                  //   columnIndex,
                  //   ascending,
                  //   attendance.month_data ?? [],
                  //   (d) => d.less_than_35 ?? 0,
                  // ),
                ),
                DataColumn(
                  label: Text('30-50'),
                  // onSort: (columnIndex, ascending) => _onSort(
                  //   columnIndex,
                  //   ascending,
                  //   attendance.month_data ?? [],
                  //   (d) => d.between_30_to_50 ?? 0,
                  // ),
                ),
                DataColumn(
                  label: Text('> 50'),
                  // onSort: (columnIndex, ascending) => _onSort(
                  //   columnIndex,
                  //   ascending,
                  //   attendance.month_data ?? [],
                  //   (d) => d.greater_than_50 ?? 0,
                  // ),
                ),
              ],
              rows: attendance.month_data!.map((data) {
                return DataRow(cells: [
                  DataCell(Text(data.date.toString())),
                  DataCell(Text(data.hfe_employees.toString())),
                  DataCell(Text(data.less_than_35.toString())),
                  DataCell(Text(data.between_30_to_50.toString())),
                  DataCell(Text(data.greater_than_50.toString())),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // void _onSort<T>(int columnIndex, bool ascending, List<MonthData> data,
  //     Comparable<T> Function(MonthData) getField) {
  //   setState(() {
  //     _sortColumnIndex = columnIndex;
  //     _sortAscending = ascending;

  //     data.sort((a, b) {
  //       final aValue = getField(a);
  //       final bValue = getField(b);
  //       return ascending
  //           ? Comparable.compare(aValue, bValue)
  //           : Comparable.compare(bValue, aValue);
  //     });
  //   });
  // }
}
