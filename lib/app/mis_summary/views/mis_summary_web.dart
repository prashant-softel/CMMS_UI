import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/mis_summary/mis_summary_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class MisSummaryWeb extends StatefulWidget {
  MisSummaryWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<MisSummaryWeb> createState() => _NewMisSummaryWebState();
}

class _NewMisSummaryWebState extends State<MisSummaryWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MisSummaryController>(builder: (controller) {
      return SelectionArea(
        child: Stack(
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
                          // Get.back();
                          Get.offAllNamed(Routes.misDashboard);
                        },
                        child: Text(" / MIS ", style: Styles.greyLight14),
                      ),
                      Text(
                        " / MIS Summary".toUpperCase(),
                        style: Styles.greyLight14,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          child: Container(
                            color: Color.fromARGB(255, 221, 233, 236),
                            child: Column(
                                crossAxisAlignment:
                                            CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                    
                                    children: [
                                      Text(
                                        "SPV NAME:-",
                                        style: Styles.blackBold16,
                                      ),
                                      Text(
                                        "Project/Site Name:",
                                        style: Styles.black15,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "State:",
                                            style: Styles.black15,
                                          ),
                                          Text(
                                            "Contractor Name:",
                                            style: Styles.black15,
                                          ),
                                          Text(
                                            "Capacity (AC):",
                                            style: Styles.black15,
                                          ),
                                          Text(
                                            "No of WTG's:",
                                            style: Styles.black15,
                                          ),
                                          Text(
                                            "Rating of PSS ( Pooling substation):",
                                            style: Styles.black15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "District:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "Contractor Site In-charge Name:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "Total land Area:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "No of Internal Poles:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "No of Power Transformer in PSS:",
                                          style: Styles.black15,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Taluk/Mandal:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "HFE site in charge name:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "Length of Internal Transmission Line in:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "Length of External Transmission Line in Km:",
                                          style: Styles.black15,
                                        ),
                                        Text(
                                          "Transformer Capacity:",
                                          style: Styles.black15,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Color.fromARGB(255, 245, 248, 250),
                          width: Get.width,
                          height: Get.height,
                          child: DataTable2(
                              headingRowHeight: 45,
                              dataRowHeight: 40,
                              // columnSpacing: 12,
                              // horizontalMargin: 5,
                              headingRowColor: MaterialStateColor.resolveWith(
                                (states) {
                                  return ColorValues.lightGreyColor;
                                },
                              ),
                              minWidth: 2500,
                              columns: [
                                DataColumn2(
                                  fixedWidth: 150,
                                  label: Text(
                                    'Compliances',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 250,
                                  label: Text(
                                    'Status of NOC',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 250,
                                  label: Text(
                                    'Date of Received/Applied',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    'Validity in months',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 150,
                                  label: Text(
                                    'Expires On',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 150,
                                  label: Text(
                                    'Days left',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 180,
                                  label: Text(
                                    'Status of Expire',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                              ],
                              rows: [
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Fire NOC",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "Aplied for renewal",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Color.fromARGB(255, 245, 248, 250),
                          width: Get.width,
                          height: Get.height,
                          child: DataTable2(
                              headingRowHeight: 45,
                              dataRowHeight: 40,
                              // columnSpacing: 12,
                              // horizontalMargin: 5,
                              headingRowColor: MaterialStateColor.resolveWith(
                                (states) {
                                  return ColorValues.lightGreyColor;
                                },
                              ),
                              minWidth: 2500,
                              columns: [
                                DataColumn2(
                                  fixedWidth: 350,
                                  label: Text(
                                    'Description ',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Apr',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'May',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'June',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'July',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Aug',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Sep',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Oct',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Nov',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Dec',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Jan',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Feb',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'Mar',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                                DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    'YTD',
                                    style: Styles.blackBold14,
                                  ),
                                  // size: ColumnSize.L,
                                ),
                              ],
                              rows: [
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "1. Man-Power Data",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                                 DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Avg. No. of HFE Employee ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Man-days of HFE employee",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Man-hours worked by HFE employee",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Average number of contractor and sub contractor workers at site ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Man-hours worked by employees including workers of contracts & Sub contracts ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total Man-hours of the site ( Sum of all HFE employees, contractors, subcontractors)  ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                 DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "2. Incident/ Accident Data",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                  ],
                                ),
                                 DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Fatal Incident (6000 Man-days Lost)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Lost Time Injuries (LTI)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Medical Treatment Injuries ( MTI)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of First Aid ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                 DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Fire Incident & Other Incidents that causes property loss",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Near Misses",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Details of Lost Time Man-days & Cost of Accident",
                                        style: Styles.blackBold14,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Man-days Lost due to Injury",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total Man-days loss due to  & after effect of incident ( Calculate due to idleness of entire man power)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  specificRowHeight: 80,
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total Cost of Accident (Rs.) due to idleness of equipment/machine/manpower and Compensation/medical cost due to the incident.",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "3. HSE Trainings",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of Trainings (HFE Trainings & Special Trainings)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total Training Man-hours (HFE Trainings & Special Trainings)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of HFE trainings conducted (as per the HFE Calendar)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of HFE Training Man hours conducted",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of People Inducted (HSE Induction provided)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of HFE Mock Drills conducted",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of HFE Mock drill Man Hours ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Special Trainings conducted",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Special Mock Drills conducted",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "4.HSE Inspections & Audits",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of Observations Raised ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of Observation Closed ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of Observation Open ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of  Major Observation Raised",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Major Observation Open",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Major Observation Closed",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of  Significant Observation Raised",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Significant Observation Open",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Significant Observation Closed",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Moderate Observation Raised",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Moderate Observation Open",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Moderate Observation Closed",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Observation not closed within target date",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Unsafe Act recorded ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of Unsafe Conditions recorded ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of statutory non compliance recorded",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "5. Reports & Checklist Inspection ",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of reports need to be Inspected",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of reports Inspected in a month",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of reports are not Inspected in a month ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  specificRowHeight:60,
                                  cells: [
                                    DataCell(
                                      Text(
                                        "6. Permits to Work & TBT Data (Data to be entered manually in this summary sheet)",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No. of Permits issued (All types)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of TBT Conducted ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "7. Grievance Data ",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Grievances Raised ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Grievances Resolved",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Grievances Pending",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Workforce Grievances Raised",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Workforce Grievances Resolved",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Workforce Grievances Pending",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Local Community Grievances Raised",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Local Community Grievances Resolved",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Local Community Grievances Pending",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Grievances resolved at L1",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Grievances resolved at L2",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Total No of Grievances resolved at L3",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  specificRowHeight: 60,
                                  cells: [
                                    DataCell(
                                      Text(
                                        "8.Occupational Health (Data to be entered manually in this summary sheet)",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Health Examinations carried out for newly joined person",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of persons to which Periodic Health Examination conducted (Annual Physical Fitness)",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Occupational Health related illness",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  specificRowHeight: 70,
                                  cells: [
                                    DataCell(
                                      Text(
                                        "9.Regulatary Visits and Notices (Data to be entered manually in this summary sheet))",
                                        style: Styles.blackBold15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                 DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Govt. authorities visited the site",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Penalties/fines received by third parties ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No. of Show cause notices received by third parties ",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "No of warning or Non conformity notices issued by HFE to contractor",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Penalties imposed to the contractor by HFE in Amount",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                DataRow2(
                                  cells: [
                                    DataCell(
                                      Text(
                                        "Any other",
                                        style: Styles.blackBold13,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        "",
                                        style: Styles.black15,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
