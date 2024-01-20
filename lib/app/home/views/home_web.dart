import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

class DashBoardHomeWeb extends StatefulWidget {
  DashBoardHomeWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardHomeWeb> createState() => _DashBoardHomeWebState();
}

final List<Map<String, dynamic>> statutoryData = [
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Aurad",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Barod",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Bellary",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Corrective maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
  {
    "Site name": "Aurad",
    'WO number': '123456',
    'WO description': 'Corrective maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
];

class _DashBoardHomeWebState extends State<DashBoardHomeWeb> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorValues.appBackgroundColor,
        child: DefaultTabController(
          length: 5,
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
                    Text(
                      "DASHBOARD",
                      style: Styles.greyLight14,
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  // width: 700,
                  child: TabBar(
                    tabs: [
                      CustomTabBar(
                        label: 'Breakdown Mentainance'.tr,
                        // icon: Icons.menu,
                      ),
                      CustomTabBar(
                        label: 'Preventive Mentainance'.tr,
                        // icon: Icons.account_tree_sharp,
                      ),
                      CustomTabBar(
                        label: 'Module Cleaning'.tr,
                        // icon: Icons.location_on,
                      ),
                      CustomTabBar(
                        label: 'Incident Report'.tr,
                        // icon: Icons.location_on,
                      ),
                      CustomTabBar(
                        label: 'Stock Management'.tr,
                        // icon: Icons.location_on,
                      ),
                    ],
                  ),
                ),
              ),

              ///

              ///
              GetBuilder<HomeController>(
                  id: 'stock_Mangement',
                  builder: (controller) {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              height: Get.height,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 245, 248, 250),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        padding:
                                            EdgeInsets.only(left: 20, top: 10),
                                        decoration: BoxDecoration(
                                          color: ColorValues.lightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.0, 1.0),
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                        ),
                                        height: 220,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Overview",
                                                      style: Styles.black20),
                                                  Dimens.boxHeight20,
                                                  Container(
                                                      height: 130,
                                                      width: 150,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Total",
                                                                style: Styles
                                                                    .black17,
                                                              ),
                                                              Spacer(),
                                                              Text("50"),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight10,
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Completed",
                                                                style: Styles
                                                                    .black17,
                                                              ),
                                                              Spacer(),
                                                              Text("35")
                                                            ],
                                                          ),
                                                          Dimens.boxHeight10,
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Pending",
                                                                style: Styles
                                                                    .black17,
                                                              ),
                                                              Spacer(),
                                                              Text("15")
                                                            ],
                                                          ),
                                                        ],
                                                      ))
                                                ]),
                                            Spacer(),
                                            // Container(
                                            //     padding: EdgeInsets.only(
                                            //         top: 30, right: 20, left: 10),
                                            //     child: CircularPercentIndicator(
                                            //       //circular progress indicator
                                            //       radius: 120.0, //radius for circle
                                            //       lineWidth:
                                            //           15.0, //width of circle line
                                            //       animation:
                                            //           true, //animate when it shows progress indicator first
                                            //       percent: 60 /
                                            //           100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                            //       center: Text(
                                            //         "60.0%",
                                            //         style: TextStyle(
                                            //             fontWeight: FontWeight.bold,
                                            //             fontSize: 20.0),
                                            //       ), //center text, you can set Icon as well
                                            //       footer: Text(
                                            //         "Order this Month",
                                            //         style: TextStyle(
                                            //             fontWeight: FontWeight.bold,
                                            //             fontSize: 17.0),
                                            //       ), //footer text
                                            //       backgroundColor: Colors
                                            //               .lightGreen[
                                            //           300], //backround of progress bar
                                            //       circularStrokeCap: CircularStrokeCap
                                            //           .round, //corner shape of progress bar at start/end
                                            //       progressColor: Colors
                                            //           .redAccent, //progress bar color
                                            //     )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        padding:
                                            EdgeInsets.only(left: 20, top: 10),
                                        decoration: BoxDecoration(
                                          color: ColorValues.lightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0.0, 1.0),
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                        ),
                                        height: 220,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        "Schedule Compliance",
                                                        style: Styles.black15)),
                                                Spacer(),
                                                Container(
                                                  height: 90,
                                                  width: 125,
                                                  margin: EdgeInsets.only(
                                                      left: 20, right: 10),
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          offset:
                                                              Offset(0.0, 1.0),
                                                          blurRadius: 6.0,
                                                        ),
                                                      ]),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Total - 100"),
                                                      // Dimens.boxHeight2,
                                                      Text("Completed - 51"),
                                                      // Dimens.boxHeight5,
                                                      Text("Pending - 49"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight20,
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SemicircularIndicator(
                                                  radius: 100,
                                                  color: Color.fromARGB(
                                                      255, 195, 146, 230),
                                                  backgroundColor:
                                                      Colors.lightGreen,
                                                  strokeWidth: 13,
                                                  bottomPadding: 0,
                                                  child: Text(
                                                    '75%',
                                                    style: TextStyle(
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Colors.redAccent),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20),
                                          padding: EdgeInsets.only(
                                              left: 20, top: 10),
                                          decoration: BoxDecoration(
                                            color: ColorValues.lightBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0.0, 1.0),
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                          ),
                                          height: 220,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          child: Row(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Category",
                                                      style: Styles.black15)),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  PieChart(
                                                    dataMap:
                                                        controller.getDataMap(),
                                                    chartType: ChartType.ring,
                                                    chartRadius: 100,
                                                    colorList: controller
                                                        .getColorList(),
                                                    // centerText: "Pie Chart",
                                                    legendOptions:
                                                        LegendOptions(
                                                      showLegendsInRow: true,
                                                      legendPosition:
                                                          LegendPosition.bottom,
                                                      showLegends: true,
                                                    ),
                                                    chartValuesOptions:
                                                        ChartValuesOptions(
                                                      showChartValueBackground:
                                                          false,
                                                      showChartValues: true,
                                                      showChartValuesInPercentage:
                                                          true,
                                                      showChartValuesOutside:
                                                          false,
                                                    ),
                                                    // onTapCallback: (index) {
                                                    //   chartController
                                                    //       .onChartTapped(index);
                                                    // },
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  Dimens.boxHeight20,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _gridList(
                                          tittle: "WO on-time", percent: "30%"),
                                      _gridList(
                                          tittle: "WO delay", percent: "45%"),
                                      _gridList(
                                          tittle: "WO backlog", percent: "15%"),
                                      _gridList(
                                          tittle: "Low stock items",
                                          percent: "03%"),
                                      _gridList(
                                          tittle: "PO Items Awaited",
                                          percent: "05%"),
                                    ],
                                  ),
                                  Dimens.boxHeight10,
                                  Container(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    width: Get.width,
                                    height: Get.height,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: DataTable2(
                                        headingRowHeight: 50,
                                        columnSpacing: 12,
                                        horizontalMargin: 12,
                                        headingRowColor:
                                            MaterialStateColor.resolveWith(
                                          (states) {
                                            return ColorValues.lightGreyColor;
                                          },
                                        ),
                                        minWidth: 1000,
                                        columns: [
                                          DataColumn2(
                                            fixedWidth: 100,
                                            label: Text(
                                              'Site name',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 120,
                                            label: Text(
                                              'WO number',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            // fixedWidth: 130,
                                            label: Text(
                                              'WO description',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 120,
                                            label: Text(
                                              'Status',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 120,
                                            label: Text(
                                              'Asset category',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 100,
                                            label: Text(
                                              'Asset Id',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 170,
                                            label: Text(
                                              'Schedule start date',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            // fixedWidth: 150,
                                            label: Text(
                                              'Schedule end date',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            label: Text(
                                              'Action',
                                              style: Styles.blackBold14,
                                            ),
                                          ),
                                        ],
                                        rows: statutoryData.map(
                                          (data) {
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                    Text(data['Site name'])),
                                                DataCell(
                                                    Text(data['WO number'])),
                                                DataCell(Text(
                                                    data['WO description'])),
                                                DataCell(Text(data['Status'])),
                                                DataCell(Text(
                                                    data['Asset category'])),
                                                DataCell(
                                                    Text(data['Asset Id'])),
                                                DataCell(Text(data[
                                                    'Schedule start date'])),
                                                DataCell(Text(
                                                    data['Schedule end date'])),
                                                DataCell(
                                                  Row(
                                                    children: [
                                                      TableActionButton(
                                                        color: ColorValues
                                                            .viewColor,
                                                        icon: Icons
                                                            .remove_red_eye_outlined,
                                                        message: 'View',
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}

//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       id: 'stock_Mangement',
//       builder: (controller) {
//         return
//             // Obx(
//             //   () =>
//             Scaffold(
//           body: Container(
//             color: Color.fromARGB(255, 234, 236, 238),
//             width: Get.width,
//             height: Get.height,
//             child: Column(
//               children: [
//                 AppBarDashboard(),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Stack(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                           height: Get.height,
//                           width: Get.width,
//                           decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 245, 248, 250),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Container(
//                                   width: 400,
//                                   child: TabBar(
//                                     tabs: [
//                                       CustomTabBar(
//                                         label: 'listView'.tr,
//                                         icon: Icons.menu,
//                                       ),
//                                       // CustomTabBar(
//                                       //   label: 'treeView'.tr,
//                                       //   icon: Icons.account_tree_sharp,
//                                       // ),
//                                       // CustomTabBar(
//                                       //   label: 'mapView'.tr,
//                                       //   icon: Icons.location_on,
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(left: 20),
//                                     padding: EdgeInsets.only(left: 20, top: 10),
//                                     decoration: BoxDecoration(
//                                       color: ColorValues.lightBlueColor,
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey,
//                                           offset: Offset(0.0, 1.0),
//                                           blurRadius: 6.0,
//                                         ),
//                                       ],
//                                     ),
//                                     height: 220,
//                                     width: MediaQuery.of(context).size.width *
//                                         0.25,
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text("Overview",
//                                                   style: Styles.black20),
//                                               Dimens.boxHeight20,
//                                               Container(
//                                                   height: 130,
//                                                   width: 150,
//                                                   child: Column(
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Text(
//                                                             "Total",
//                                                             style:
//                                                                 Styles.black17,
//                                                           ),
//                                                           Spacer(),
//                                                           Text("50"),
//                                                         ],
//                                                       ),
//                                                       Dimens.boxHeight10,
//                                                       Row(
//                                                         children: [
//                                                           Text(
//                                                             "Completed",
//                                                             style:
//                                                                 Styles.black17,
//                                                           ),
//                                                           Spacer(),
//                                                           Text("35")
//                                                         ],
//                                                       ),
//                                                       Dimens.boxHeight10,
//                                                       Row(
//                                                         children: [
//                                                           Text(
//                                                             "Pending",
//                                                             style:
//                                                                 Styles.black17,
//                                                           ),
//                                                           Spacer(),
//                                                           Text("15")
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ))
//                                             ]),
//                                         Spacer(),
//                                         // Container(
//                                         //     padding: EdgeInsets.only(
//                                         //         top: 30, right: 20, left: 10),
//                                         //     child: CircularPercentIndicator(
//                                         //       //circular progress indicator
//                                         //       radius: 120.0, //radius for circle
//                                         //       lineWidth:
//                                         //           15.0, //width of circle line
//                                         //       animation:
//                                         //           true, //animate when it shows progress indicator first
//                                         //       percent: 60 /
//                                         //           100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
//                                         //       center: Text(
//                                         //         "60.0%",
//                                         //         style: TextStyle(
//                                         //             fontWeight: FontWeight.bold,
//                                         //             fontSize: 20.0),
//                                         //       ), //center text, you can set Icon as well
//                                         //       footer: Text(
//                                         //         "Order this Month",
//                                         //         style: TextStyle(
//                                         //             fontWeight: FontWeight.bold,
//                                         //             fontSize: 17.0),
//                                         //       ), //footer text
//                                         //       backgroundColor: Colors
//                                         //               .lightGreen[
//                                         //           300], //backround of progress bar
//                                         //       circularStrokeCap: CircularStrokeCap
//                                         //           .round, //corner shape of progress bar at start/end
//                                         //       progressColor: Colors
//                                         //           .redAccent, //progress bar color
//                                         //     )),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(left: 20),
//                                     padding: EdgeInsets.only(left: 20, top: 10),
//                                     decoration: BoxDecoration(
//                                       color: ColorValues.lightBlueColor,
//                                       borderRadius: BorderRadius.circular(10),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey,
//                                           offset: Offset(0.0, 1.0),
//                                           blurRadius: 6.0,
//                                         ),
//                                       ],
//                                     ),
//                                     height: 220,
//                                     width: MediaQuery.of(context).size.width *
//                                         0.25,
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Align(
//                                                 alignment: Alignment.topLeft,
//                                                 child: Text(
//                                                     "Schedule Compliance",
//                                                     style: Styles.black15)),
//                                             Spacer(),
//                                             Container(
//                                               height: 90,
//                                               width: 125,
//                                               margin: EdgeInsets.only(
//                                                   left: 20, right: 10),
//                                               padding: EdgeInsets.only(
//                                                   left: 10, top: 10),
//                                               decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius:
//                                                       BorderRadius.circular(10),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.grey,
//                                                       offset: Offset(0.0, 1.0),
//                                                       blurRadius: 6.0,
//                                                     ),
//                                                   ]),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text("Total - 100"),
//                                                   // Dimens.boxHeight2,
//                                                   Text("Completed - 51"),
//                                                   // Dimens.boxHeight5,
//                                                   Text("Pending - 49"),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         // Dimens.boxHeight20,
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             SemicircularIndicator(
//                                               radius: 100,
//                                               color: Color.fromARGB(
//                                                   255, 195, 146, 230),
//                                               backgroundColor:
//                                                   Colors.lightGreen,
//                                               strokeWidth: 13,
//                                               bottomPadding: 0,
//                                               child: Text(
//                                                 '75%',
//                                                 style: TextStyle(
//                                                     fontSize: 32,
//                                                     fontWeight: FontWeight.w600,
//                                                     color: Colors.redAccent),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                       margin:
//                                           EdgeInsets.only(left: 20, right: 20),
//                                       padding:
//                                           EdgeInsets.only(left: 20, top: 10),
//                                       decoration: BoxDecoration(
//                                         color: ColorValues.lightBlueColor,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey,
//                                             offset: Offset(0.0, 1.0),
//                                             blurRadius: 6.0,
//                                           ),
//                                         ],
//                                       ),
//                                       height: 220,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.25,
//                                       child: Row(
//                                         children: [
//                                           Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text("Category",
//                                                   style: Styles.black15)),
//                                           Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               PieChart(
//                                                 dataMap:
//                                                     controller.getDataMap(),
//                                                 chartType: ChartType.ring,
//                                                 chartRadius: 100,
//                                                 colorList:
//                                                     controller.getColorList(),
//                                                 // centerText: "Pie Chart",
//                                                 legendOptions: LegendOptions(
//                                                   showLegendsInRow: true,
//                                                   legendPosition:
//                                                       LegendPosition.bottom,
//                                                   showLegends: true,
//                                                 ),
//                                                 chartValuesOptions:
//                                                     ChartValuesOptions(
//                                                   showChartValueBackground:
//                                                       false,
//                                                   showChartValues: true,
//                                                   showChartValuesInPercentage:
//                                                       true,
//                                                   showChartValuesOutside: false,
//                                                 ),
//                                                 // onTapCallback: (index) {
//                                                 //   chartController
//                                                 //       .onChartTapped(index);
//                                                 // },
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       )),
//                                 ],
//                               ),
//                               Dimens.boxHeight20,
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   _gridList(
//                                       tittle: "WO on-time", percent: "30%"),
//                                   _gridList(tittle: "WO delay", percent: "45%"),
//                                   _gridList(
//                                       tittle: "WO backlog", percent: "15%"),
//                                   _gridList(
//                                       tittle: "Low stock items",
//                                       percent: "03%"),
//                                   _gridList(
//                                       tittle: "PO Items Awaited",
//                                       percent: "05%"),
//                                 ],
//                               ),
//                               Dimens.boxHeight10,
//                               Container(
//                                 color: Color.fromARGB(255, 245, 248, 250),
//                                 width: Get.width,
//                                 height: Get.height,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16),
//                                   child: DataTable2(
//                                     headingRowHeight: 50,
//                                     columnSpacing: 12,
//                                     horizontalMargin: 12,
//                                     headingRowColor:
//                                         MaterialStateColor.resolveWith(
//                                       (states) {
//                                         return ColorValues.lightGreyColor;
//                                       },
//                                     ),
//                                     minWidth: 1000,
//                                     columns: [
//                                       DataColumn2(
//                                         fixedWidth: 100,
//                                         label: Text(
//                                           'Site name',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         fixedWidth: 120,
//                                         label: Text(
//                                           'WO number',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         // fixedWidth: 130,
//                                         label: Text(
//                                           'WO description',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         fixedWidth: 120,
//                                         label: Text(
//                                           'Status',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         fixedWidth: 120,
//                                         label: Text(
//                                           'Asset category',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         fixedWidth: 100,
//                                         label: Text(
//                                           'Asset Id',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         fixedWidth: 170,
//                                         label: Text(
//                                           'Schedule start date',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         // fixedWidth: 150,
//                                         label: Text(
//                                           'Schedule end date',
//                                           style: Styles.blackBold14,
//                                         ),
//                                         // size: ColumnSize.L,
//                                       ),
//                                       DataColumn2(
//                                         label: Text(
//                                           'Action',
//                                           style: Styles.blackBold14,
//                                         ),
//                                       ),
//                                     ],
//                                     rows: statutoryData.map(
//                                       (data) {
//                                         return DataRow(
//                                           cells: [
//                                             DataCell(Text(data['Site name'])),
//                                             DataCell(Text(data['WO number'])),
//                                             DataCell(
//                                                 Text(data['WO description'])),
//                                             DataCell(Text(data['Status'])),
//                                             DataCell(
//                                                 Text(data['Asset category'])),
//                                             DataCell(Text(data['Asset Id'])),
//                                             DataCell(Text(
//                                                 data['Schedule start date'])),
//                                             DataCell(Text(
//                                                 data['Schedule end date'])),
//                                             DataCell(
//                                               Row(
//                                                 children: [
//                                                   TableActionButton(
//                                                     color:
//                                                         ColorValues.viewColor,
//                                                     icon: Icons
//                                                         .remove_red_eye_outlined,
//                                                     message: 'View',
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     ).toList(),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

_gridList({
  required String tittle,
  required String percent,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFF353F4F),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 200,
      height: 60,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  tittle,
                  style: TextStyle(
                      color: ColorValues.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
                // Dimens.boxWidth10,
              ],
            ),
          ),
          Row(
            children: [
              Dimens.boxWidth40,
              Spacer(),
              Text(
                percent,
                style: TextStyle(
                    color: ColorValues.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    ),
  );
}


// class AppBarDashboard extends StatelessWidget {
//   const AppBarDashboard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Color.fromARGB(255, 227, 224, 224),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.home,
//             color: ColorValues.greyLightColor,
//           ),
//           Text(
//             "DASHBOARD",
//             style: Styles.greyLight14,
//           ),
//         ],
//       ),
//     );
//   }
// }
