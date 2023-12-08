import 'package:cmms/app/navigators/app_pages.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/styles.dart';

class StatutoryWeb extends StatelessWidget {
  StatutoryWeb({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 227, 224, 224),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                  Text(
                    "DASHBOARD",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.misDashboard);
                    },
                    child: Text(" / MIS", style: Styles.greyLight14),
                  ),
                  Text(
                    " / STATUTORY",
                    style: Styles.greyLight14,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 30, right: 10),
                  child: Column(
                    children: [
                      Card(
                        color: Color.fromARGB(255, 245, 248, 250),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                "STATUTORY REPORT",
                                style: Styles.blackBold16,
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Container(
                              color: Color.fromARGB(255, 245, 248, 250),
                              width: Get.width,
                              height: Get.height,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: DataTable2(
                                  headingRowHeight: 35,
                                  columnSpacing: 12,
                                  horizontalMargin: 12,
                                  minWidth: 600,
                                  columns: [
                                    DataColumn2(
                                      label: Text(
                                        'Compliance',
                                        style: Styles.blackBold14,
                                      ),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'Status OF Application',
                                        style: Styles.blackBold14,
                                      ),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Date of received',
                                        style: Styles.blackBold14,
                                      ),
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'Validity (In months),',
                                        style: Styles.blackBold14,
                                      ),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Days Left',
                                        style: Styles.blackBold14,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Expires on ',
                                        style: Styles.blackBold14,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Action',
                                        style: Styles.blackBold14,
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    4,
                                    (index) => DataRow(
                                      cells: [
                                        DataCell(Text('Fire NOC status')),
                                        DataCell(Text('Received')),
                                        DataCell(Text('10/07/2023')),
                                        DataCell(Text('5')),
                                        DataCell(Text('28')),
                                        DataCell(Text("10/07/2024")),
                                        DataCell(Text("Action")),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
