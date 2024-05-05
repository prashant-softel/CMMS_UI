import 'package:cmms/app/home/views/custom_ui_dash.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:cmms/app/app.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
    "Site name": "Alote",
    'WO number': '123456',
    'WO description': 'Preventive maintenance',
    'Status': 'Under Progress ',
    'Asset category': 'Inverter',
    'Asset Id': 'ICR1_Inv1',
    'Schedule start date': '01-04-2023 18:00',
    'Schedule end date': '01-04-2023 19:00',
  },
];

class _DashBoardHomeWebState extends State<DashBoardHomeWeb> {
  final screenWidth = Get.width;
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
          color: ColorValues.appBackgroundColor,
          child: DefaultTabController(
            length: 6,
            child: Column(children: [
              // HeaderWidgetAllDash(),
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
                    Text(
                      "DASHBOARD",
                      style: Styles.greyLight14,
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  child: TabBar(
                    indicatorColor: Color(0xFF363A40),
                    isScrollable: true,
                    tabs: [
                      CustomTabBar(
                        label: "All Module".tr,
                      ),
                      CustomTabBar(
                        label: 'Breakdown Maintenance'.tr,
                        // icon: Icons.menu,
                      ),
                      CustomTabBar(
                        label: 'Preventive Maintenance'.tr,
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
              Expanded(
                child: TabBarView(
                  children: [
                    // alll.............
                    GetBuilder<HomeController>(
                        id: 'dashboard',
                        builder: (controller) {
                          return Stack(
                            children: [
                              Obx(
                                () => Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Overview",
                                                            style:
                                                                Styles.black15),
                                                        // Dimens.boxHeight20,
                                                        // Spacer(),
                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  height: 100,
                                                                  width: 150,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Total",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),

                                                                          Text(
                                                                              '${controller.dashboardBmList.value?.cmDashboadDetails?.total}'),
                                                                          //  '${dashbo?.module_name}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Completed",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardBmList.value?.cmDashboadDetails?.completed}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Pending",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardBmList.value?.cmDashboadDetails?.pending}'),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Dimens.boxWidth20,
                                                    Container(
                                                        // padding: EdgeInsets.only(
                                                        //     top: 30,
                                                        //     right: 20,
                                                        //     left: 10),
                                                        child:
                                                            CircularPercentIndicator(
                                                      //circular progress indicator
                                                      radius:
                                                          50.0, //radius for circle
                                                      lineWidth:
                                                          15.0, //width of circle line
                                                      animation:
                                                          true, //animate when it shows progress indicator first
                                                      percent: 50 /
                                                          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                      center: Text(
                                                        "50.0%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      ), //center text, you can set Icon as well
                                                      footer: Text(
                                                        "Order this Month",
                                                        style: Styles.black13,
                                                      ), //footer text
                                                      backgroundColor: ColorValues
                                                          .addNewColor, //backround of progress bar
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round, //corner shape of progress bar at start/end
                                                      progressColor: Colors
                                                          .redAccent, //progress bar color
                                                    )),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorValues.lightBlueColor,
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
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Schedule Compliance",
                                                                  style: Styles
                                                                      .black15),
                                                              Dimens
                                                                  .boxHeight10,
                                                              SemicircularIndicator(
                                                                radius: 60,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        195,
                                                                        146,
                                                                        230),
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreen,
                                                                strokeWidth: 13,
                                                                bottomPadding:
                                                                    0,
                                                                child: Text(
                                                                  '75%',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                          .redAccent),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            Get.height * 0.09,
                                                        width: Get.width * 0.09,
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            right: 10),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10,
                                                                right: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                                blurRadius: 6.0,
                                                              ),
                                                            ]),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "100",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight2,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Completed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "51",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Pending",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "49",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Dimens.boxHeight20,
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text("Category",
                                                            style: Styles
                                                                .black15)),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: PieChart(
                                                        dataMap: controller
                                                            .getDataMap(),
                                                        chartType:
                                                            ChartType.ring,
                                                        chartRadius: 100,
                                                        colorList: controller
                                                            .getColorList(),
                                                        // centerText: "Pie Chart",
                                                        legendOptions:
                                                            LegendOptions(
                                                          showLegendsInRow:
                                                              false,
                                                          // legendPosition:
                                                          //     LegendPosition.left,
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
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          // height: 70,
                                          width: Get.width * .92,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              _gridList(
                                                  tittle: "WO on-time",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.wo_on_time}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.wo_delay}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.wo_backlog}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent: "03%"),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent: "05%"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Dimens.boxHeight10,
                                      Expanded(
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: DataTable2(
                                              headingRowHeight: 40,
                                              dataRowHeight: 35,
                                              columnSpacing: 12,
                                              // horizontalMargin: 5,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  return ColorValues
                                                      .lightGreyColor;
                                                },
                                              ),
                                              minWidth: 2500,
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
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    'WO description',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 300,
                                                  label: Text(
                                                    'Status',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Asset category',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 400,
                                                  label: Text(
                                                    'Asset name',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule start date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule end date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .dashboardBmList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(Text(
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.item_list?[index].facility_name.toString() ?? ''}')),
                                                  DataCell(Text(
                                                      'BM${controller.dashboardBmList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}')),
                                                  DataCell(Text(
                                                      // controller
                                                      //       .dashboardBmList
                                                      //       .value
                                                      //       ?.cmDashboadDetails
                                                      //       ?.item_list?[index]
                                                      //       ?.status_long ??
                                                      'Wo des harcode')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .status_long ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_category ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_name ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .start_date ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .end_date ??
                                                      '')),
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
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    //bm............................
                    GetBuilder<HomeController>(
                        id: 'dashboard',
                        builder: (controller) {
                          return Stack(
                            children: [
                              Obx(
                                () => Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Overview",
                                                            style:
                                                                Styles.black15),
                                                        // Dimens.boxHeight20,
                                                        // Spacer(),
                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  height: 100,
                                                                  width: 150,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Total",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),

                                                                          Text(
                                                                              '${controller.dashboardBmList.value?.cmDashboadDetails?.total}'),
                                                                          //  '${dashbo?.module_name}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Completed",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardBmList.value?.cmDashboadDetails?.completed}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Pending",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardBmList.value?.cmDashboadDetails?.pending}'),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Dimens.boxWidth20,
                                                    Container(
                                                        // padding: EdgeInsets.only(
                                                        //     top: 30,
                                                        //     right: 20,
                                                        //     left: 10),
                                                        child:
                                                            CircularPercentIndicator(
                                                      //circular progress indicator
                                                      radius:
                                                          50.0, //radius for circle
                                                      lineWidth:
                                                          15.0, //width of circle line
                                                      animation:
                                                          true, //animate when it shows progress indicator first
                                                      percent: 50 /
                                                          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                      center: Text(
                                                        "50.0%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      ), //center text, you can set Icon as well
                                                      footer: Text(
                                                        "Order this Month",
                                                        style: Styles.black13,
                                                      ), //footer text
                                                      backgroundColor: ColorValues
                                                          .addNewColor, //backround of progress bar
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round, //corner shape of progress bar at start/end
                                                      progressColor: Colors
                                                          .redAccent, //progress bar color
                                                    )),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorValues.lightBlueColor,
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
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Schedule Compliance",
                                                                  style: Styles
                                                                      .black15),
                                                              Dimens
                                                                  .boxHeight10,
                                                              SemicircularIndicator(
                                                                radius: 60,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        195,
                                                                        146,
                                                                        230),
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreen,
                                                                strokeWidth: 13,
                                                                bottomPadding:
                                                                    0,
                                                                child: Text(
                                                                  '75%',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                          .redAccent),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            Get.height * 0.09,
                                                        width: Get.width * 0.09,
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            right: 10),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10,
                                                                right: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                                blurRadius: 6.0,
                                                              ),
                                                            ]),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "100",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight2,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Completed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "51",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Pending",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "49",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Dimens.boxHeight20,
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text("Category",
                                                            style: Styles
                                                                .black15)),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: PieChart(
                                                        dataMap: controller
                                                            .getDataMap(),
                                                        chartType:
                                                            ChartType.ring,
                                                        chartRadius: 100,
                                                        colorList: controller
                                                            .getColorList(),
                                                        // centerText: "Pie Chart",
                                                        legendOptions:
                                                            LegendOptions(
                                                          showLegendsInRow:
                                                              false,
                                                          // legendPosition:
                                                          //     LegendPosition.left,
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
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          // height: 70,
                                          width: Get.width * .92,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              _gridList(
                                                  tittle: "WO on-time",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.wo_on_time}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.wo_delay}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.wo_backlog}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent: "03%"),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent: "05%"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Dimens.boxHeight10,
                                      Expanded(
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: DataTable2(
                                              headingRowHeight: 40,
                                              dataRowHeight: 35,
                                              columnSpacing: 12,
                                              // horizontalMargin: 5,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  return ColorValues
                                                      .lightGreyColor;
                                                },
                                              ),
                                              minWidth: 2500,
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
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    'WO description',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 300,
                                                  label: Text(
                                                    'Status',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Asset category',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 400,
                                                  label: Text(
                                                    'Asset name',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule start date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule end date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .dashboardBmList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .facility_name
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(
                                                      'BM${controller.dashboardBmList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}')),
                                                  DataCell(Text(
                                                      // controller
                                                      //       .dashboardBmList
                                                      //       .value
                                                      //       ?.cmDashboadDetails
                                                      //       ?.item_list?[index]
                                                      //       ?.status_long ??
                                                      'Wo des harcode')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .status_long ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_category ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_name ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .start_date ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .end_date ??
                                                      '')),
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
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    //pm......................
                    GetBuilder<HomeController>(
                        id: 'dashboard',
                        builder: (controller) {
                          return Stack(
                            children: [
                              Obx(
                                () => Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Overview",
                                                            style:
                                                                Styles.black15),
                                                        // Dimens.boxHeight20,
                                                        // Spacer(),
                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  height: 100,
                                                                  width: 150,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Total",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),

                                                                          Text(
                                                                              '${controller.dashboardPmList.value?.cmDashboadDetails?.total}'),
                                                                          //  '${dashbo?.module_name}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Completed",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardPmList.value?.cmDashboadDetails?.completed}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Pending",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardPmList.value?.cmDashboadDetails?.pending}'),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Dimens.boxWidth20,
                                                    Container(
                                                        // padding: EdgeInsets.only(
                                                        //     top: 30,
                                                        //     right: 20,
                                                        //     left: 10),
                                                        child:
                                                            CircularPercentIndicator(
                                                      //circular progress indicator
                                                      radius:
                                                          50.0, //radius for circle
                                                      lineWidth:
                                                          15.0, //width of circle line
                                                      animation:
                                                          true, //animate when it shows progress indicator first
                                                      percent: 50 /
                                                          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                      center: Text(
                                                        "50.0%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      ), //center text, you can set Icon as well
                                                      footer: Text(
                                                        "Order this Month",
                                                        style: Styles.black13,
                                                      ), //footer text
                                                      backgroundColor: ColorValues
                                                          .addNewColor, //backround of progress bar
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round, //corner shape of progress bar at start/end
                                                      progressColor: Colors
                                                          .redAccent, //progress bar color
                                                    )),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorValues.lightBlueColor,
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
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Schedule Compliance",
                                                                  style: Styles
                                                                      .black15),
                                                              Dimens
                                                                  .boxHeight10,
                                                              SemicircularIndicator(
                                                                radius: 60,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        195,
                                                                        146,
                                                                        230),
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreen,
                                                                strokeWidth: 13,
                                                                bottomPadding:
                                                                    0,
                                                                child: Text(
                                                                  '75%',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                          .redAccent),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            Get.height * 0.09,
                                                        width: Get.width * 0.09,
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            right: 10),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10,
                                                                right: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                                blurRadius: 6.0,
                                                              ),
                                                            ]),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "100",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight2,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Completed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "51",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Pending",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "49",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Dimens.boxHeight20,
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text("Category",
                                                            style: Styles
                                                                .black15)),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: PieChart(
                                                        dataMap: controller
                                                            .getDataMap(),
                                                        chartType:
                                                            ChartType.ring,
                                                        chartRadius: 100,
                                                        colorList: controller
                                                            .getColorList(),
                                                        // centerText: "Pie Chart",
                                                        legendOptions:
                                                            LegendOptions(
                                                          showLegendsInRow:
                                                              false,
                                                          // legendPosition:
                                                          //     LegendPosition.left,
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
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          // height: 70,
                                          width: Get.width * .92,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              _gridList(
                                                  tittle: "WO on-time",
                                                  percent:
                                                      '${controller.dashboardPmList.value?.cmDashboadDetails?.wo_on_time}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${controller.dashboardPmList.value?.cmDashboadDetails?.wo_delay}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${controller.dashboardPmList.value?.cmDashboadDetails?.wo_backlog}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent: "03%"),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent: "05%"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Dimens.boxHeight10,
                                      Expanded(
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: DataTable2(
                                              headingRowHeight: 40,
                                              dataRowHeight: 35,
                                              columnSpacing: 12,
                                              // horizontalMargin: 5,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  return ColorValues
                                                      .lightGreyColor;
                                                },
                                              ),
                                              minWidth: 2500,
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
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    'WO description',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 300,
                                                  label: Text(
                                                    'Status',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Asset category',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 400,
                                                  label: Text(
                                                    'Asset name',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule start date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule end date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .dashboardPmList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(Text(controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .facility_name
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(
                                                      'PM${controller.dashboardPmList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}')),
                                                  DataCell(Text(
                                                      // controller
                                                      //       .dashboardPmList
                                                      //       .value
                                                      //       ?.cmDashboadDetails
                                                      //       ?.item_list?[index]
                                                      //       ?.status_long ??
                                                      'Wo des harcode')),
                                                  DataCell(Text(controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .status_long ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_category ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_name ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .start_date ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .end_date ??
                                                      '')),
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
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    // mc......................
                    GetBuilder<HomeController>(
                        id: 'dashboard',
                        builder: (controller) {
                          return Stack(
                            children: [
                              Obx(
                                () => Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Overview",
                                                            style:
                                                                Styles.black15),
                                                        // Dimens.boxHeight20,
                                                        // Spacer(),
                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  height: 100,
                                                                  width: 150,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Total",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),

                                                                          Text(
                                                                              '${controller.dashboardMcList.value?.cmDashboadDetails?.total}'),
                                                                          //  '${dashbo?.module_name}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Completed",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardMcList.value?.cmDashboadDetails?.completed}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Pending",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardMcList.value?.cmDashboadDetails?.pending}'),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Dimens.boxWidth20,
                                                    Container(
                                                        // padding: EdgeInsets.only(
                                                        //     top: 30,
                                                        //     right: 20,
                                                        //     left: 10),
                                                        child:
                                                            CircularPercentIndicator(
                                                      //circular progress indicator
                                                      radius:
                                                          50.0, //radius for circle
                                                      lineWidth:
                                                          15.0, //width of circle line
                                                      animation:
                                                          true, //animate when it shows progress indicator first
                                                      percent: 50 /
                                                          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                      center: Text(
                                                        "50.0%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      ), //center text, you can set Icon as well
                                                      footer: Text(
                                                        "Order this Month",
                                                        style: Styles.black13,
                                                      ), //footer text
                                                      backgroundColor: ColorValues
                                                          .addNewColor, //backround of progress bar
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round, //corner shape of progress bar at start/end
                                                      progressColor: Colors
                                                          .redAccent, //progress bar color
                                                    )),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorValues.lightBlueColor,
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
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Schedule Compliance",
                                                                  style: Styles
                                                                      .black15),
                                                              Dimens
                                                                  .boxHeight10,
                                                              SemicircularIndicator(
                                                                radius: 60,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        195,
                                                                        146,
                                                                        230),
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreen,
                                                                strokeWidth: 13,
                                                                bottomPadding:
                                                                    0,
                                                                child: Text(
                                                                  '75%',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                          .redAccent),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            Get.height * 0.09,
                                                        width: Get.width * 0.09,
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            right: 10),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10,
                                                                right: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                                blurRadius: 6.0,
                                                              ),
                                                            ]),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "100",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight2,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Completed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "51",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Pending",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "49",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Dimens.boxHeight20,
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text("Category",
                                                            style: Styles
                                                                .black15)),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: PieChart(
                                                        dataMap: controller
                                                            .getDataMap(),
                                                        chartType:
                                                            ChartType.ring,
                                                        chartRadius: 100,
                                                        colorList: controller
                                                            .getColorList(),
                                                        // centerText: "Pie Chart",
                                                        legendOptions:
                                                            LegendOptions(
                                                          showLegendsInRow:
                                                              false,
                                                          // legendPosition:
                                                          //     LegendPosition.left,
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
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          // height: 70,
                                          width: Get.width * .92,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              _gridList(
                                                  tittle: "WO on-time",
                                                  percent:
                                                      '${controller.dashboardMcList.value?.cmDashboadDetails?.wo_on_time}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${controller.dashboardMcList.value?.cmDashboadDetails?.wo_delay}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${controller.dashboardMcList.value?.cmDashboadDetails?.wo_backlog}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent: "03%"),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent: "05%"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Dimens.boxHeight10,
                                      Expanded(
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: DataTable2(
                                              headingRowHeight: 40,
                                              dataRowHeight: 35,
                                              columnSpacing: 12,
                                              // horizontalMargin: 5,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  return ColorValues
                                                      .lightGreyColor;
                                                },
                                              ),
                                              minWidth: 2500,
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
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    'WO description',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 300,
                                                  label: Text(
                                                    'Status',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Asset category',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 400,
                                                  label: Text(
                                                    'Asset name',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule start date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule end date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .dashboardMcList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(Text(controller
                                                          .dashboardMcList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .facility_name
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(
                                                      'MC${controller.dashboardMcList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}')),
                                                  DataCell(Text(
                                                      // controller
                                                      //       .dashboardMcList
                                                      //       .value
                                                      //       ?.cmDashboadDetails
                                                      //       ?.item_list?[index]
                                                      //       ?.status_long ??
                                                      'Wo des harcode')),
                                                  DataCell(Text(controller
                                                          .dashboardMcList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .status_long ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardMcList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_category ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardMcList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_name ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardMcList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .start_date ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardMcList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .end_date ??
                                                      '')),
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
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),

                    ///ir...............................
                    GetBuilder<HomeController>(
                        id: 'dashboard',
                        builder: (controller) {
                          return Stack(
                            children: [
                              Obx(
                                () => Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Overview",
                                                            style:
                                                                Styles.black15),
                                                        // Dimens.boxHeight20,
                                                        // Spacer(),
                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  height: 100,
                                                                  width: 150,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Total",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),

                                                                          Text(
                                                                              '${controller.dashboardIrList.value?.cmDashboadDetails?.total}'),
                                                                          //  '${dashbo?.module_name}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Completed",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardIrList.value?.cmDashboadDetails?.completed}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Pending",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardIrList.value?.cmDashboadDetails?.pending}'),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Dimens.boxWidth20,
                                                    Container(
                                                        // padding: EdgeInsets.only(
                                                        //     top: 30,
                                                        //     right: 20,
                                                        //     left: 10),
                                                        child:
                                                            CircularPercentIndicator(
                                                      //circular progress indicator
                                                      radius:
                                                          50.0, //radius for circle
                                                      lineWidth:
                                                          15.0, //width of circle line
                                                      animation:
                                                          true, //animate when it shows progress indicator first
                                                      percent: 50 /
                                                          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                      center: Text(
                                                        "50.0%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      ), //center text, you can set Icon as well
                                                      footer: Text(
                                                        "Order this Month",
                                                        style: Styles.black13,
                                                      ), //footer text
                                                      backgroundColor: ColorValues
                                                          .addNewColor, //backround of progress bar
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round, //corner shape of progress bar at start/end
                                                      progressColor: Colors
                                                          .redAccent, //progress bar color
                                                    )),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorValues.lightBlueColor,
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
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Schedule Compliance",
                                                                  style: Styles
                                                                      .black15),
                                                              Dimens
                                                                  .boxHeight10,
                                                              SemicircularIndicator(
                                                                radius: 60,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        195,
                                                                        146,
                                                                        230),
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreen,
                                                                strokeWidth: 13,
                                                                bottomPadding:
                                                                    0,
                                                                child: Text(
                                                                  '75%',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                          .redAccent),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            Get.height * 0.09,
                                                        width: Get.width * 0.09,
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            right: 10),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10,
                                                                right: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                                blurRadius: 6.0,
                                                              ),
                                                            ]),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "100",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight2,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Completed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "51",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Pending",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "49",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Dimens.boxHeight20,
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text("Category",
                                                            style: Styles
                                                                .black15)),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: PieChart(
                                                        dataMap: controller
                                                            .getDataMap(),
                                                        chartType:
                                                            ChartType.ring,
                                                        chartRadius: 100,
                                                        colorList: controller
                                                            .getColorList(),
                                                        // centerText: "Pie Chart",
                                                        legendOptions:
                                                            LegendOptions(
                                                          showLegendsInRow:
                                                              false,
                                                          // legendPosition:
                                                          //     LegendPosition.left,
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
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          // height: 70,
                                          width: Get.width * .92,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              _gridList(
                                                  tittle: "WO on-time",
                                                  percent:
                                                      '${controller.dashboardIrList.value?.cmDashboadDetails?.wo_on_time}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${controller.dashboardIrList.value?.cmDashboadDetails?.wo_delay}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${controller.dashboardIrList.value?.cmDashboadDetails?.wo_backlog}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent: "03%"),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent: "05%"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Dimens.boxHeight10,
                                      Expanded(
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: DataTable2(
                                              headingRowHeight: 40,
                                              dataRowHeight: 35,
                                              columnSpacing: 12,
                                              // horizontalMargin: 5,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  return ColorValues
                                                      .lightGreyColor;
                                                },
                                              ),
                                              minWidth: 2500,
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
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    'WO description',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 300,
                                                  label: Text(
                                                    'Status',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Asset category',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 400,
                                                  label: Text(
                                                    'Asset name',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule start date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule end date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .dashboardIrList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(Text(controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .facility_name
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(
                                                      'IR${controller.dashboardIrList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}')),
                                                  DataCell(Text(
                                                      // controller
                                                      //       .dashboardIrList
                                                      //       .value
                                                      //       ?.cmDashboadDetails
                                                      //       ?.item_list?[index]
                                                      //       ?.status_long ??
                                                      'Wo des harcode')),
                                                  DataCell(Text(controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .status_long ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_category ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_name ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .start_date ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .end_date ??
                                                      '')),
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
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    //sm.................................
                    GetBuilder<HomeController>(
                        id: 'dashboard',
                        builder: (controller) {
                          return Stack(
                            children: [
                              Obx(
                                () => Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
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
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Overview",
                                                            style:
                                                                Styles.black15),
                                                        // Dimens.boxHeight20,
                                                        // Spacer(),
                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  height: 100,
                                                                  width: 150,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            "Total",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),

                                                                          Text(
                                                                              '${controller.dashboardSmList.value?.cmDashboadDetails?.total}'),
                                                                          //  '${dashbo?.module_name}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Completed",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardSmList.value?.cmDashboadDetails?.completed}'),
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Pending",
                                                                            style:
                                                                                Styles.black13,
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                              '${controller.dashboardSmList.value?.cmDashboadDetails?.pending}'),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Dimens.boxWidth20,
                                                    Container(
                                                        // padding: EdgeInsets.only(
                                                        //     top: 30,
                                                        //     right: 20,
                                                        //     left: 10),
                                                        child:
                                                            CircularPercentIndicator(
                                                      //circular progress indicator
                                                      radius:
                                                          50.0, //radius for circle
                                                      lineWidth:
                                                          15.0, //width of circle line
                                                      animation:
                                                          true, //animate when it shows progress indicator first
                                                      percent: 50 /
                                                          100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                      center: Text(
                                                        "50.0%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0),
                                                      ), //center text, you can set Icon as well
                                                      footer: Text(
                                                        "Order this Month",
                                                        style: Styles.black13,
                                                      ), //footer text
                                                      backgroundColor: ColorValues
                                                          .addNewColor, //backround of progress bar
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round, //corner shape of progress bar at start/end
                                                      progressColor: Colors
                                                          .redAccent, //progress bar color
                                                    )),
                                                  ],
                                                )),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorValues.lightBlueColor,
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
                                              height: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Schedule Compliance",
                                                                  style: Styles
                                                                      .black15),
                                                              Dimens
                                                                  .boxHeight10,
                                                              SemicircularIndicator(
                                                                radius: 60,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        195,
                                                                        146,
                                                                        230),
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightGreen,
                                                                strokeWidth: 13,
                                                                bottomPadding:
                                                                    0,
                                                                child: Text(
                                                                  '75%',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                          .redAccent),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                      Spacer(),
                                                      Container(
                                                        height:
                                                            Get.height * 0.09,
                                                        width: Get.width * 0.09,
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            right: 10),
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                top: 10,
                                                                right: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                                blurRadius: 6.0,
                                                              ),
                                                            ]),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "100",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight2,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Completed",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "51",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Pending",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  "49",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Get.width * 0.009 -
                                                                              1),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Dimens.boxHeight20,
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 20),
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 10),
                                                decoration: BoxDecoration(
                                                  color: ColorValues
                                                      .lightBlueColor,
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
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text("Category",
                                                            style: Styles
                                                                .black15)),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: PieChart(
                                                        dataMap: controller
                                                            .getDataMap(),
                                                        chartType:
                                                            ChartType.ring,
                                                        chartRadius: 100,
                                                        colorList: controller
                                                            .getColorList(),
                                                        // centerText: "Pie Chart",
                                                        legendOptions:
                                                            LegendOptions(
                                                          showLegendsInRow:
                                                              false,
                                                          // legendPosition:
                                                          //     LegendPosition.left,
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
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          // height: 70,
                                          width: Get.width * .92,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              _gridList(
                                                  tittle: "WO on-time",
                                                  percent:
                                                      '${controller.dashboardMcList.value?.cmDashboadDetails?.wo_on_time}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${controller.dashboardSmList.value?.cmDashboadDetails?.wo_delay}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${controller.dashboardSmList.value?.cmDashboadDetails?.wo_backlog}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent: "03%"),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent: "05%"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Dimens.boxHeight10,
                                      Expanded(
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: DataTable2(
                                              headingRowHeight: 40,
                                              dataRowHeight: 35,
                                              columnSpacing: 12,
                                              // horizontalMargin: 5,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  return ColorValues
                                                      .lightGreyColor;
                                                },
                                              ),
                                              minWidth: 2500,
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
                                                  fixedWidth: 200,
                                                  label: Text(
                                                    'WO description',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 300,
                                                  label: Text(
                                                    'Status',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Asset category',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 400,
                                                  label: Text(
                                                    'Asset name',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule start date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 250,
                                                  label: Text(
                                                    'Schedule end date',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .dashboardSmList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(Text(controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .facility_name
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(
                                                      'SM${controller.dashboardSmList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}')),
                                                  DataCell(Text(
                                                      // controller
                                                      //       .dashboardSmList
                                                      //       .value
                                                      //       ?.cmDashboadDetails
                                                      //       ?.item_list?[index]
                                                      //       ?.status_long ??
                                                      'Wo des harcode')),
                                                  DataCell(Text(controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .status_long ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_category ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .asset_name ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .start_date ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .end_date ??
                                                      '')),
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
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),

              ///

              ///
            ]),
          )),
    );
  }

  _gridList({
    required String tittle,
    required String percent,
  }) {
    return SelectionArea(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF363A40),
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
          width: 180,
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
      ),
    );
  }
}
