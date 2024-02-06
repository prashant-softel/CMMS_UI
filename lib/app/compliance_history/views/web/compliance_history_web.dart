import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/color_values.dart';
import '../../../theme/styles.dart';

class ComplianceHistoryWeb extends StatelessWidget {
  ComplianceHistoryWeb({Key? key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final arguments = Get.arguments as Map<String, dynamic>?;

    // Check if arguments exist and contain 'reNew'
    final int? reNew = arguments?['reNew'] ?? 0;
    final int? viewStatutory = arguments?['viewStatutory'] ?? 0;
    List<Map<String, String>> staticDataList = [
      {
        "Sr No": "1",
        "Year": "2023",
        "Time Stamp Re New": "2023-10-07 10:00:00",
        "comment": "Static Comment 1",
        "location": "2024-10-07 10:00:00",
        "Approver Name": "Manager",
      },
      {
        "Sr No": "2",
        "Year": "2022",
        "Time Stamp Re New": "2022-10-07 10:00:00",
        "comment": "Static Comment 1",
        "location": "2023-10-07 10:00:00",
        "Approver Name": "Manager2",
      },
      {
        "Sr No": "3",
        "Year": "2021",
        "Time Stamp Re New": "2021-10-07 10:00:00",
        "comment": "Static Comment 1",
        "location": "2022-10-07 10:00:00",
        "Approver Name": "Admin",
      },
      {
        "Sr No": "4",
        "Year": "2020",
        "Time Stamp Re New": "2020-10-07 10:00:00",
        "comment": "Static Comment 1",
        "location": "2021-10-07 10:00:00",
        "Approver Name": "Admin",
      },
      {
        "Sr No": "5",
        "Year": "2019",
        "Time Stamp Re New": "2019-10-07 10:00:00",
        "comment": "Warrenty Start",
        "location": "2020-10-07 10:00:00",
        "Approver Name": "Admin",
      },
    ];

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
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
                      Get.offNamed(Routes.statutory);
                    },
                    child: Text(" / STATUTORY", style: Styles.greyLight14),
                  ),
                  Text(
                    " / COMPLIANCE HISTORY",
                    style: Styles.greyLight14,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
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
                                "COMPLIANCE HISTORY",
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
                                child: Container(
                                  margin: Dimens.edgeInsets20,
                                  child: Column(
                                    children: [
                                      Dimens.boxHeight20,
                                      Container(
                                        margin: Dimens.edgeInsets20,
                                        height:
                                            350, // Adjust the height as needed
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorValues
                                                .lightGreyColorWithOpacity35,
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorValues
                                                  .appBlueBackgroundColor,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Fire NOC Status",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color:
                                                  ColorValues.greyLightColour,
                                            ),
                                            Expanded(
                                              child: DataTable2(
                                                border: TableBorder.all(
                                                    color: Color.fromARGB(
                                                        255, 206, 229, 234)),
                                                columns: [
                                                  DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Sr No",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Year",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Time Stamp Re New",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Comment",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Expires Date",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "Approver Name",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                                rows: List<DataRow>.generate(
                                                  staticDataList.length,
                                                  (index) => DataRow(cells: [
                                                    DataCell(
                                                      Text(staticDataList[index]
                                                          ["Sr No"]!),
                                                    ),
                                                    DataCell(Text(
                                                        staticDataList[index]
                                                            ["Year"]!)),
                                                    DataCell(
                                                      Text(staticDataList[index]
                                                          [
                                                          "Time Stamp Re New"]!),
                                                    ),
                                                    DataCell(Text(
                                                        staticDataList[index]
                                                            ["comment"]!)),
                                                    DataCell(Text(
                                                        staticDataList[index]
                                                            ["location"]!)),
                                                    DataCell(Text(
                                                        staticDataList[index][
                                                            "Approver Name"]!)),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Dimens.boxHeight15,
                                      // if (viewStatutory == 0)
                                      //   Row(
                                      //     children: [
                                      //       Spacer(),
                                      //       CustomElevatedButton(
                                      //         backgroundColor:
                                      //             ColorValues.appRedColor,
                                      //         text: 'cancel',
                                      //         onPressed: () {
                                      //           // controller.AddInventory();
                                      //         },
                                      //       ),
                                      //       Dimens.boxWidth15,
                                      //       CustomElevatedButton(
                                      //         backgroundColor:
                                      //             ColorValues.appGreenColor,
                                      //         text: 'Update',
                                      //         onPressed: () {
                                      //           // controller.submitPurchaseOrderData();
                                      //         },
                                      //       ),
                                      //       Spacer()
                                      //     ],
                                      //   ),
                                      // Dimens.boxHeight15,
                                    ],
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
