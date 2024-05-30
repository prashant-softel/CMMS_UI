import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dash_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../navigators/app_pages.dart';

class DashBoardHomeWeb extends StatefulWidget {
  DashBoardHomeWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardHomeWeb> createState() => _DashBoardHomeWebState();
}

class _DashBoardHomeWebState extends State<DashBoardHomeWeb> {
  final screenWidth = Get.width;
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'dashboard',
        builder: (controller) {
          return Stack(
            children: [
              SelectionArea(
                child: Container(
                    color: ColorValues.appBackgroundColor,
                    child: DefaultTabController(
                      length: 5,
                      child: Column(children: [
                        Container(
                          height: 50,
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
                              Text(
                                "DASHBOARD",
                                style: Styles.greyLight14,
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50,
                                    bottom:
                                        5), // Reduced top and bottom padding
                                child: Row(
                                  children: [
                                    Text('Select Plant',
                                        style: Styles.black13W400),
                                    Dimens.boxWidth10,
                                    Obx(
                                      () => SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child:
                                              DashCustomMultiSelectDialogField(
                                            title: 'Select Facility',
                                            initialValue: controller
                                                .facilityList
                                                .where((facility) =>
                                                    facility != null)
                                                .map((facility) => facility!.id)
                                                .toList(),
                                            items: controller.facilityList
                                                .where((facility) =>
                                                    facility != null)
                                                .map(
                                                  (facility) => MultiSelectItem(
                                                    facility!.id,
                                                    facility.name ?? '',
                                                  ),
                                                )
                                                .toList(),
                                            onConfirm: (selectedOptionsList) {
                                              controller.selectedMultiFacility(
                                                  selectedOptionsList
                                                      .cast<int>());
                                              print(
                                                  'Equipment list ${controller.selectedFacilityIdList}');
                                            },
                                            // titleTextStyle: TextStyle(
                                            //     fontSize:
                                            //         12), // Reduced font size
                                            // chipTextStyle: TextStyle(
                                            //     fontSize:
                                            //         12), // Reduced font size
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Date Range',
                                            style: Styles.black13W400),
                                        Dimens.boxWidth10,
                                        CustomTextFieldForStock(
                                            width:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    8,
                                            numberTextField: true,
                                            onTap: () {
                                              controller
                                                      .openFromDateToStartDatePicker =
                                                  !controller
                                                      .openFromDateToStartDatePicker;
                                              controller.update(['dashboard']);
                                            },
                                            hintText:
                                                '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                            hintStyle: Styles.black13W400),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Dimens.boxWidth10,
                              if (Responsive.isDesktop(context))
                                Icon(Icons.notifications_active,
                                    color: ColorValues.greyLightColor),
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                color: ColorValues.blueMediumColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Color.fromARGB(255, 206, 200, 200),
                                        child: Icon(Icons.person,
                                            color: ColorValues.blueMediumColor),
                                      ), // icon
                                      if (Responsive.isDesktop(context))
                                        SizedBox(
                                            width:
                                                5), // space between icon and text
                                      if (Responsive.isDesktop(context))
                                        GestureDetector(
                                          onTap: () {
                                            print(
                                                "${varUserAccessModel.value.user_name ?? ""}");
                                          },
                                          child: Text(
                                            "${varUserAccessModel.value.user_name}",
                                            style: TextStyle(
                                              color: Colors.black, // text color
                                              fontSize: 12, // text size
                                              fontWeight: FontWeight
                                                  .w500, // text weight
                                            ),
                                          ),
                                        ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.dialog(
                                            Stack(children: [
                                              Positioned(
                                                right: 1,
                                                top: 70,
                                                child: Container(
                                                  width: 200,
                                                  child: AlertDialog(
                                                    insetPadding: Dimens
                                                        .edgeInsets10_0_10_0,
                                                    contentPadding:
                                                        EdgeInsets.all(20),
                                                    backgroundColor: ColorValues
                                                        .appDarkBlueColor,
                                                    content: Column(
                                                        // mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .clearStoreData();

                                                              Get.toNamed(
                                                                  Routes
                                                                      .profile,
                                                                  arguments: {
                                                                    'userId': varUserAccessModel
                                                                        .value
                                                                        .user_id,
                                                                  });
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.person,
                                                                  color: Color(
                                                                      0xffD2D0D0),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text("Profile",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xffD2D0D0),
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: Color(
                                                                0xffD2D0D0),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                Routes.setting,
                                                              );
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .settings,
                                                                  color: Color(
                                                                      0xffD2D0D0),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text("Settings",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xffD2D0D0),
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: Color(
                                                                0xffD2D0D0),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              _isDeleteDialog();
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.logout,
                                                                  color: Color(
                                                                      0xffD2D0D0),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text("Log Out",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xffD2D0D0),
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    )),
                                                              ],
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          );
                                        },
                                        child: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: ColorValues.blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Dimens.boxWidth10,
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
                              //bm............................

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
                                                        '${((controller.dashboardBmList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
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
                                                                  '${((controller.dashboardBmList.value?.cmDashboadDetails?.schedule_compliance_completed ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.schedule_compliance_total ?? 1) * 100).toString()}%',
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
                                                                  '${controller.dashboardBmList.value?.cmDashboadDetails?.schedule_compliance_total}',
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
                                                                  '${controller.dashboardBmList.value?.cmDashboadDetails?.schedule_compliance_completed}',
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
                                                                  '${controller.dashboardBmList.value?.cmDashboadDetails?.schedule_compliance_pending}',
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
                                                      '${((controller.dashboardBmList.value?.cmDashboadDetails?.wo_on_time ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${((controller.dashboardBmList.value?.cmDashboadDetails?.wo_delay ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${((controller.dashboardBmList.value?.cmDashboadDetails?.wo_backlog ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.low_stock_items}'),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent:
                                                      '${controller.dashboardBmList.value?.cmDashboadDetails?.po_items_awaited}'),
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
                                                  DataCell(Text(controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .wo_decription ??
                                                      "")),
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
                                                          onPress: () {
                                                            controller
                                                                .clearStoreJobData();
                                                            // controller
                                                            //     .clearStoreDatatype();

                                                            int jobId = controller
                                                                    .dashboardBmList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list?[
                                                                        index]
                                                                    .wo_number ??
                                                                0;
                                                            if (jobId != 0) {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .jobDetails,
                                                                  arguments: {
                                                                    'jobId':
                                                                        jobId
                                                                  });
                                                            }
                                                          },
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

                              //pm......................

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
                                                        '${((controller.dashboardPmList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardPmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
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
                                                                  '${((controller.dashboardPmList.value?.cmDashboadDetails?.schedule_compliance_completed ?? 0) / (controller.dashboardPmList.value?.cmDashboadDetails?.schedule_compliance_total ?? 1) * 100).toString()}%',
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
                                                                  '${controller.dashboardPmList.value?.cmDashboadDetails?.schedule_compliance_total}',
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
                                                                  '${controller.dashboardPmList.value?.cmDashboadDetails?.schedule_compliance_completed}',
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
                                                                  '${controller.dashboardPmList.value?.cmDashboadDetails?.schedule_compliance_pending}',
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
                                                      '${((controller.dashboardPmList.value?.cmDashboadDetails?.wo_on_time ?? 0) / (controller.dashboardPmList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%'),
                                              _gridList(
                                                  tittle: "WO delay",
                                                  percent:
                                                      '${((controller.dashboardPmList.value?.cmDashboadDetails?.wo_delay ?? 0) / (controller.dashboardPmList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%'),
                                              _gridList(
                                                  tittle: "WO backlog",
                                                  percent:
                                                      '${((controller.dashboardPmList.value?.cmDashboadDetails?.wo_backlog ?? 0) / (controller.dashboardPmList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%'),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent:
                                                      '${controller.dashboardPmList.value?.cmDashboadDetails?.low_stock_items}'),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent:
                                                      '${controller.dashboardPmList.value?.cmDashboadDetails?.po_items_awaited ?? 0}%'),
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
                                                  DataCell(Text(controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .wo_decription ??
                                                      '')),
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
                                                          onPress: () {
                                                            controller
                                                                .clearStorePmData();
                                                            // controller
                                                            //     .clearStoreDatatype();

                                                            int pmTaskId = controller
                                                                    .dashboardPmList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list?[
                                                                        index]
                                                                    .wo_number ??
                                                                0;
                                                            if (pmTaskId != 0) {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .pmTaskView,
                                                                  arguments: {
                                                                    'pmTaskId':
                                                                        pmTaskId
                                                                  });
                                                            }
                                                          },
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

                              // mc......................

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
                                                        '${((controller.dashboardMcList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardMcList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
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
                                                                  '${((controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_completed ?? 0) / (controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_total ?? 1) * 100).toString()}%',
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
                                                                  '${controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_total}',
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
                                                                  '${controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_completed}',
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
                                                                  '${controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_pending}',
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
                                                    '${((controller.dashboardMcList.value?.cmDashboadDetails?.wo_on_time ?? 0) / (controller.dashboardMcList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%',
                                              ),
                                              _gridList(
                                                tittle: "WO delay",
                                                percent:
                                                    '${((controller.dashboardMcList.value?.cmDashboadDetails?.wo_delay ?? 0) / (controller.dashboardMcList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%',
                                              ),
                                              _gridList(
                                                tittle: "WO backlog",
                                                percent:
                                                    '${((controller.dashboardMcList.value?.cmDashboadDetails?.wo_backlog ?? 0) / (controller.dashboardMcList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%',
                                              ),
                                              _gridList(
                                                tittle: "Low stock items",
                                                percent:
                                                    '${controller.dashboardMcList.value?.cmDashboadDetails?.low_stock_items} %',
                                              ),
                                              _gridList(
                                                tittle: "PO Items Awaited",
                                                percent:
                                                    '${controller.dashboardMcList.value?.cmDashboadDetails?.po_items_awaited}',
                                              ),
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
                                                  DataCell(Text(controller
                                                          .dashboardMcList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .wo_decription ??
                                                      '')),
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
                                                          onPress: () {
                                                            // controller
                                                            //     .clearStoreData();
                                                            // controller
                                                            //     .clearStoreDatatype();

                                                            int pmTaskId = controller
                                                                    .dashboardMcList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list?[
                                                                        index]
                                                                    .wo_number ??
                                                                0;
                                                            if (pmTaskId != 0) {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .pmTaskView,
                                                                  arguments: {
                                                                    'pmTaskId':
                                                                        pmTaskId
                                                                  });
                                                            }
                                                          },
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

                              ///ir...............................

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
                                                        '${((controller.dashboardIrList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardIrList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
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
                                                                  '${((controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_completed ?? 0) / (controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_total ?? 1) * 100).toString()}%',
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
                                                                  '${controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_total}',
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
                                                                  '${controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_completed}',
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
                                                                  '${controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_pending}',
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
                                                    '${((controller.dashboardIrList.value?.cmDashboadDetails?.wo_on_time ?? 0) / (controller.dashboardIrList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%',
                                              ),
                                              _gridList(
                                                tittle: "WO delay",
                                                percent:
                                                    '${((controller.dashboardIrList.value?.cmDashboadDetails?.wo_delay ?? 0) / (controller.dashboardIrList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%',
                                              ),
                                              _gridList(
                                                tittle: "WO backlog",
                                                percent:
                                                    '${((controller.dashboardIrList.value?.cmDashboadDetails?.wo_backlog ?? 0) / (controller.dashboardIrList.value?.cmDashboadDetails?.total ?? 1) * 100).toString()}%',
                                              ),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent:
                                                      '${controller.dashboardIrList.value?.cmDashboadDetails?.low_stock_items}'),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent:
                                                      '${controller.dashboardIrList.value?.cmDashboadDetails?.po_items_awaited}'),
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
                                                  DataCell(Text(controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .wo_decription ??
                                                      '')),
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
                                                          onPress: () {
                                                            controller
                                                                .clearStoreIrData();
                                                            // controller
                                                            //     .clearStoreDatatype();

                                                            int iRId = controller
                                                                    .dashboardIrList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list?[
                                                                        index]
                                                                    .wo_number ??
                                                                0;
                                                            if (iRId != 0) {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .viewIncidentReportScreen,
                                                                  arguments: {
                                                                    'irId': iRId
                                                                  });
                                                            }
                                                          },
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

                              //sm.................................

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
                                                        '${((controller.dashboardSmList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardSmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
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
                                                                  '${((controller.dashboardSmList.value?.cmDashboadDetails?.schedule_compliance_completed ?? 0) / (controller.dashboardSmList.value?.cmDashboadDetails?.schedule_compliance_total ?? 1) * 100).toString()}%',
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
                                                                  '${controller.dashboardSmList.value?.cmDashboadDetails?.schedule_compliance_total}',
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
                                                                  '${controller.dashboardSmList.value?.cmDashboadDetails?.schedule_compliance_completed}',
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
                                                                  '${controller.dashboardSmList.value?.cmDashboadDetails?.schedule_compliance_pending}',
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
                                                    '${((controller.dashboardBmList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1).toString()}%',
                                              ),
                                              _gridList(
                                                tittle: "WO delay",
                                                percent:
                                                    '${((controller.dashboardBmList.value?.cmDashboadDetails?.wo_delay ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1).toString()}%',
                                              ),
                                              _gridList(
                                                tittle: "WO backlog",
                                                percent:
                                                    '${((controller.dashboardBmList.value?.cmDashboadDetails?.wo_backlog ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1).toString()}%',
                                              ),
                                              _gridList(
                                                  tittle: "Low stock items",
                                                  percent:
                                                      '${controller.dashboardSmList.value?.cmDashboadDetails?.low_stock_items}'),
                                              _gridList(
                                                  tittle: "PO Items Awaited",
                                                  percent:
                                                      '${controller.dashboardSmList.value?.cmDashboadDetails?.po_items_awaited}'),
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
                                                  DataCell(Text(controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list?[index]
                                                          .wo_decription ??
                                                      '')),
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
                                                          onPress: () {
                                                            // controller
                                                            //     .clearStoreData();
                                                            // controller
                                                            //     .clearStoreDatatype();

                                                            int pmTaskId = controller
                                                                    .dashboardSmList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list?[
                                                                        index]
                                                                    .wo_number ??
                                                                0;
                                                            if (pmTaskId != 0) {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .pmTaskView,
                                                                  arguments: {
                                                                    'pmTaskId':
                                                                        pmTaskId
                                                                  });
                                                            }
                                                          },
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
                          ),
                        ),

                        ///

                        ///
                      ]),
                    )),
              ),
              if (controller.openFromDateToStartDatePicker)
                Positioned(
                  right: 270,
                  top: 55,
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
                      controller.getDashBordListByDate();
                      controller.openFromDateToStartDatePicker =
                          !controller.openFromDateToStartDatePicker;
                      controller.update(['dashboard']);

                      // Get.toNamed(
                      //   Routes.stockManagementGoodsOrdersScreen,
                      // );
                    },
                  ),
                ),
            ],
          );
        });
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

  _isDeleteDialog() {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.logout_outlined, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          Text(
            'Are you sure you want to logout?',
            style: Styles.blackBold14w500,
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  Get.offAllNamed(Routes.login);
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
