import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color_values.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/table_action_button.dart';
import '../../grievance_list_controller.dart';

final List<Map<dynamic, dynamic>> grievanceData = [
  {
    "Month": "April",
    "Grievance Type": "Contractor Workforce",
    "Date": "2023-4-2",
    "Concern": "Test",
    "Resolved at Level": "Level 1",
    "Grievance Close Date": "2023-4-12",
    "Status": "Resolved"
  },
  {
    "Month": "May",
    "Grievance Type": "Local Communities",
    "Date": "2023-5-",
    "Concern": "Test",
    "Resolved at Level": "Level 2",
    "Grievance Close Date": "2023-5-12",
    "Status": "Pending"
  },
  {
    "Month": "June",
    "Grievance Type": "Contractor Workforce",
    "Date": "2023-6-2",
    "Concern": "Test",
    "Resolved at Level": "Level 3",
    "Grievance Close Date": "2023-6-12",
    "Status": "Ongoing"
  },
  {
    "Month": "July",
    "Grievance Type": "Local Communities",
    "Date": "2023-7-2",
    "Concern": "Test",
    "Resolved at Level": "Level 1",
    "Grievance Close Date": "2023-7-12",
    "Status": "Resolved"
  },
  {
    "Month": "August",
    "Grievance Type": "Contractor Workforce",
    "Date": "2023-8-3",
    "Concern": "Test",
    "Resolved at Level": "Level 2",
    "Grievance Close Date": "2023-8-12",
    "Status": "Resolved"
  },
  {
    "Month": "September",
    "Grievance Type": "Local Communities",
    "Date": "2023-9-3",
    "Concern": "Test",
    "Resolved at Level": "Level 3",
    "Grievance Close Date": "2023-9-12",
    "Status": "Pending"
  },
  {
    "Month": "October",
    "Grievance Type": "Local Communities",
    "Date": "2023-10-3",
    "Concern": "Test",
    "Resolved at Level": "Level 1",
    "Grievance Close Date": "2023-10-12",
    "Status": "Resolved"
  },
  {
    "Month": "November",
    "Grievance Type": "Contractor Workforce",
    "Date": "2023-11-23",
    "Concern": "Test",
    "Resolved at Level": "Level 2",
    "Grievance Close Date": "2023-11-12",
    "Status": "Resolved"
  },
  {
    "Month": "December",
    "Grievance Type": "Contractor Workforce",
    "Date": "2023-12-23",
    "Concern": "Test",
    "Resolved at Level": "Level 3",
    "Grievance Close Date": "2023-12-12",
    "Status": "Ongoing"
  },
  {
    "Month": "January",
    "Grievance Type": "Local Communities",
    "Date": "2023-1-23",
    "Concern": "Test",
    "Resolved at Level": "Level 1",
    "Grievance Close Date": "2023-1-12",
    "Status": "Resolved"
  },
  {
    "Month": "February",
    "Grievance Type": "Contractor Workforce",
    "Date": "2023-2-23",
    "Concern": "Test",
    "Resolved at Level": "Level 2",
    "Grievance Close Date": "2023-2-12",
    "Status": "Ongoing"
  },
  {
    "Month": "March",
    "Grievance Type": "Local Communities",
    "Date": "2023-3-23",
    "Concern": "Test",
    "Resolved at Level": "Level 3",
    "Grievance Close Date": "2023-3-12",
    "Status": "Pending"
  },
];

class GrievanceListContentWeb extends StatelessWidget {
  GrievanceListContentWeb({Key? key});

  ///
  Widget build(BuildContext context) {
    return GetBuilder<GrievanceController>(
      id: "stock_Mangement_Date",
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 227, 224, 224), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    )
                  ]),
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
                      Get.offNamed(Routes.misDashboard);
                    },
                    child: Text(
                      " / MIS",
                      style: Styles.greyLight14,
                    ),
                  ),
                  Text(
                    " / GRIEVANCE LIST",
                    style: Styles.greyLight14,
                  )
                ],
              ),
            ),
            Stack(children: [
              Container(
                  width: Get.width * 7,
                  margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                  height: Get.height,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              child: Column(
                                children: [
                                  Card(
                                      color: Color.fromARGB(255, 245, 248, 250),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                              ),
                                              child: Text(
                                                "Grievance List",
                                                style: Styles.blackBold16,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20, right: 20),
                                                child: Row(
                                                  children: [
                                                    ActionButton(
                                                      icon: Icons.add,
                                                      label: "Add New",
                                                      onPressed: () {
                                                        Get.offNamed(Routes
                                                            .addGrievance);
                                                      },
                                                      color: ColorValues
                                                          .addNewColor,
                                                    ),
                                                  ],
                                                ))
                                          ]),
                                          Divider(
                                            color: ColorValues.greyLightColor,
                                          ),
                                          Container(
                                            color: Color.fromARGB(
                                                255, 245, 248, 250),
                                            width: Get.width,
                                            height: Get.height,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: DataTable2(
                                                  // fixedLeftColumns: 1,
                                                  headingRowHeight: 70,
                                                  columnSpacing: 12,
                                                  horizontalMargin: 12,
                                                  headingRowColor:
                                                      MaterialStateColor
                                                          .resolveWith(
                                                    (states) {
                                                      return ColorValues
                                                          .lightGreyColor;
                                                    },
                                                  ),
                                                  columns: [
                                                    DataColumn2(
                                                      // fixedWidth: 70,
                                                      label: Text(
                                                        'Month',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 110,
                                                      label: Text(
                                                        'Grievance Type',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 160,
                                                      label: Text(
                                                        'Date',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 110,
                                                      label: Text(
                                                        'Concern',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 90,
                                                      label: Text(
                                                        'Resolved at\n Level',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 90,
                                                      label: Text(
                                                        'Grievance Close\n Date',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 90,
                                                      label: Text(
                                                        'Status',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                        label: Text('Action',
                                                            style: Styles
                                                                .blackBold14))
                                                  ],
                                                  rows: grievanceData.map(
                                                    (data) {
                                                      return DataRow(
                                                        cells: [
                                                          DataCell(Text(data[
                                                              'Month'
                                                                  .toString()])),
                                                          DataCell(Text(data[
                                                              'Grievance Type'])),
                                                          DataCell(Text(
                                                              data['Date'])),
                                                          DataCell(Text(
                                                              data['Concern'])),
                                                          DataCell(Text(data[
                                                              'Resolved at Level'])),
                                                          DataCell(Text(data[
                                                              'Grievance Close Date'
                                                                  .toString()])),
                                                          DataCell(Text(
                                                              data['Status'])),
                                                          DataCell(
                                                            Row(
                                                              children: [
                                                                TableActionButton(
                                                                  color: ColorValues
                                                                      .viewColor,
                                                                  icon: Icons
                                                                      .remove_red_eye_outlined,
                                                                  message:
                                                                      'View',
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                                TableActionButton(
                                                                  color: ColorValues
                                                                      .editColor,
                                                                  icon: Icons
                                                                      .edit,
                                                                  message:
                                                                      'Edit',
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ).toList(),
                                                )),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ))
                      ]))
            ]),
          ]),
        );
      },
    );
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

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          SizedBox(
            height: Get.height * 0.05,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onChanged: (value) {
                filterText.value = value;
                //   onSearchCallBack(value);
              },
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Filter',
                contentPadding:
                    EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
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
