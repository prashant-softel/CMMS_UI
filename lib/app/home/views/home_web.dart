import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/dashboard_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/dash_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';

class DashBoardHomeWeb extends StatefulWidget {
  DashBoardHomeWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardHomeWeb> createState() => _DashBoardHomeWebState();
}

class _DashBoardHomeWebState extends State<DashBoardHomeWeb>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isTaskbarVisible = false;
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _isTaskbarVisible = _tabController.index ==
            5; // 5 is the index of the Stock Management tab
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final screenWidth = Get.width;

  Color getColor(String category) {
    switch (category) {
      case 'WO On-time':
        return Colors.green;
      case 'WO Delay':
        return Colors.red;
      case 'WO Backlog':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        id: 'dashboard',
        builder: (controller) {
          return Stack(
            children: [
              SelectionArea(
                child: Container(
                    color: ColorValues.appBackgroundColor,
                    child: DefaultTabController(
                      length: 6,
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
                                    // Dimens.boxWidth10,
                                    SizedBox(width: 10),
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
                                                .homecontroller.facilityList
                                                .where((facility) =>
                                                    facility != null)
                                                .map((facility) => facility!.id)
                                                .toList(),
                                            items: controller
                                                .homecontroller.facilityList
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
                                                  'Equipment list ${controller.homecontroller.selectedFacilityIdList}');
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
                                        // Dimens.boxWidth10,
                                        SizedBox(width: 10),
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
                              // Dimens.boxWidth10,
                              SizedBox(width: 10),
                              _isTaskbarVisible
                                  ? Row(
                                      children: [
                                        Text("Available"),
                                        Obx(
                                          () => CustomSwitchTroggle(
                                              value:
                                                  controller.isToggleOn.value,
                                              onChanged: (value) {
                                                controller.toggle();
                                              }),
                                        ),
                                        Text("Consumption"),
                                        SizedBox(width: 10),
                                      ],
                                    )
                                  : Dimens.box0,

                              if (Responsive.isDesktop(context))
                                Icon(Icons.notifications_active,
                                    color: ColorValues.greyLightColor),
                              InkWell(
                                onTap: () {
                                  Get.dialog(
                                    Stack(children: [
                                      Positioned(
                                        right: 1,
                                        top: 70,
                                        child: Container(
                                          width: 200,
                                          child: AlertDialog(
                                            insetPadding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            contentPadding: EdgeInsets.all(20),
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            content: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.clearStoreData();
                                                    Get.toNamed(Routes.profile,
                                                        arguments: {
                                                          'userId':
                                                              varUserAccessModel
                                                                  .value
                                                                  .user_id,
                                                        });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.person,
                                                          color: Color(
                                                              0xffD2D0D0)),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "Profile",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xffD2D0D0),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                    color: Color(0xffD2D0D0)),
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(Routes.setting);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.settings,
                                                          color: Color(
                                                              0xffD2D0D0)),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "Settings",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xffD2D0D0),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                    color: Color(0xffD2D0D0)),
                                                InkWell(
                                                  onTap: () {
                                                    _isDeleteDialog();
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.logout,
                                                          color: Color(
                                                              0xffD2D0D0)),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "Log Out",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xffD2D0D0),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  );
                                },
                                child: Card(
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
                                          backgroundColor: Color.fromARGB(
                                              255, 206, 200, 200),
                                          child: Icon(Icons.person,
                                              color:
                                                  ColorValues.blueMediumColor),
                                        ), // icon
                                        if (Responsive.isDesktop(context))
                                          SizedBox(
                                              width:
                                                  5), // space between icon and text
                                        if (Responsive.isDesktop(context))
                                          Text(
                                            "${varUserAccessModel.value.user_name}",
                                            style: TextStyle(
                                              color: Colors.black, // text color
                                              fontSize: 12, // text size
                                              fontWeight: FontWeight
                                                  .w500, // text weight
                                            ),
                                          ),
                                        Icon(Icons.keyboard_arrow_down_outlined,
                                            color: ColorValues.blackColor),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Dimens.boxWidth10,
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kDashboardFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: TabBar(
                                    controller: _tabController,
                                    indicatorColor: Color(0xFF363A40),
                                    isScrollable: true,
                                    tabs: [
                                      CustomTabBar(
                                        width: 240,
                                        label: 'All'.tr,
                                        // icon: Icons.menu,
                                      ),
                                      CustomTabBar(
                                        width: 240,

                                        label: 'Breakdown Maintenance'.tr,
                                        // icon: Icons.menu,
                                      ),
                                      CustomTabBar(
                                        width: 240,
                                        label: 'Preventive Maintenance'.tr,
                                        // icon: Icons.account_tree_sharp,
                                      ),
                                      CustomTabBar(
                                        width: 240,
                                        label: 'Module Cleaning'.tr,
                                        // icon: Icons.location_on,
                                      ),
                                      CustomTabBar(
                                        width: 240,
                                        label: 'Incident Report'.tr,
                                        // icon: Icons.location_on,
                                      ),
                                      CustomTabBar(
                                        width: 240,
                                        label: 'Stock Management'.tr,
                                        // icon: Icons.location_on,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Dimens.box0,

                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kDashboardFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    //alll..........................
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      height: Get.height,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
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
                                                    margin: EdgeInsets.only(
                                                        left: 0),
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Overview",
                                                                style: Styles
                                                                    .black14),
                                                            // Dimens.boxHeight20,
                                                            // Spacer(),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Total",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),

                                                                              Text('${controller.totalSum}'),
                                                                              //  '${dashbo?.module_name}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Completed",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.completedSum}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Pending",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.pendingSum}'),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Dimens.boxWidth20,
                                                        SizedBox(width: 20),

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
                                                              10.0, //width of circle line
                                                          animation:
                                                              true, //animate when it shows progress indicator first
                                                          percent: (controller
                                                                  .completedSum
                                                                  .value) /
                                                              (controller
                                                                  .totalSum
                                                                  .value), //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                          center: Text(
                                                            '${((controller.completedSum.value) / (controller.totalSum.value) * 100).toStringAsFixed(1)}%',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0),
                                                          ), //center text, you can set Icon as well
                                                          // footer: Text(
                                                          //   "Order this Month",
                                                          //   style: Styles.black13,
                                                          // ), //footer text
                                                          backgroundColor: Colors
                                                              .redAccent, //backround of progress bar
                                                          circularStrokeCap:
                                                              CircularStrokeCap
                                                                  .round, //corner shape of progress bar at start/end
                                                          progressColor: ColorValues
                                                              .addNewColor, //progress bar color
                                                        )),
                                                      ],
                                                    )),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 12),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Schedule Compliance",
                                                          style:
                                                              Styles.black14),
                                                      // Dimens.boxHeight5,
                                                      SizedBox(height: 5),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // Dimens.boxHeight8,
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.red),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO on-time",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woOnTimeSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.blue),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO delay",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                      // Dimens
                                                                      //     .boxWidth37,
                                                                      SizedBox(
                                                                          width:
                                                                              35),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woDelaySum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.green),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Text(
                                                                        "WO backlog",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woBacklogSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  //  Dimens.boxHeight8,
                                                                ],
                                                              ),
                                                            ),
                                                            // Dimens.boxWidth5,
                                                            // Column(
                                                            //   children: [
                                                            //     Row(
                                                            //       children: [
                                                            //         Container(

                                                            //           height: 140,
                                                            //           width: 150,
                                                            //           child: SfCircularChart(
                                                            //             // title: ChartTitle(
                                                            //             //     textStyle: Styles
                                                            //             //         .black15,
                                                            //             //     text:
                                                            //             //         'Work Order Statistics'),
                                                            //             legend: Legend(
                                                            //                 isVisible: true,
                                                            //                 overflowMode:
                                                            //                     LegendItemOverflowMode
                                                            //                         .wrap),
                                                            //             series: <PieSeries<
                                                            //                 _ChartData,
                                                            //                 String>>[
                                                            //               PieSeries<
                                                            //                   _ChartData,
                                                            //                   String>(
                                                            //                 dataSource: [
                                                            //                   _ChartData(
                                                            //                       'WO On-time',
                                                            //                       (controller
                                                            //                               .woOnTimeSum
                                                            //                               .value) /
                                                            //                           (controller
                                                            //                               .totalSum
                                                            //                               .value) *
                                                            //                           100),
                                                            //                   _ChartData(
                                                            //                       'WO Delay',
                                                            //                       (controller
                                                            //                               .woDelaySum
                                                            //                               .value) /
                                                            //                           (controller
                                                            //                               .totalSum
                                                            //                               .value) *
                                                            //                           100),
                                                            //                   _ChartData(
                                                            //                       'WO Backlog',
                                                            //                       (controller
                                                            //                               .woBacklogSum
                                                            //                               .value) /
                                                            //                           (controller
                                                            //                               .totalSum
                                                            //                               .value) *
                                                            //                           100),
                                                            //                 ],
                                                            //                 xValueMapper:
                                                            //                     (_ChartData data,
                                                            //                             _) =>
                                                            //                         data.category,
                                                            //                 yValueMapper:
                                                            //                     (_ChartData data,
                                                            //                             _) =>
                                                            //                         data.value,
                                                            //                 // dataLabelSettings:
                                                            //                 //     DataLabelSettings(
                                                            //                 //   isVisible: true,
                                                            //                 //   labelAlignment:
                                                            //                 //       ChartDataLabelAlignment
                                                            //                 //           .top,
                                                            //                 //   labelPosition:
                                                            //                 //       ChartDataLabelPosition
                                                            //                 //           .outside,
                                                            //                 //   textStyle: TextStyle(
                                                            //                 //       fontSize:
                                                            //                 //           12,
                                                            //                 //       color: Colors
                                                            //                 //           .black),
                                                            //                 // ),
                                                            //                 // borderRadius: BorderRadius.circular(15),
                                                            //                 // color: const Color.fromRGBO(52, 138, 199, 1),
                                                            //                 animationDuration:
                                                            //                     1000,
                                                            //                 animationDelay: 0,
                                                            //                 explode: true,
                                                            //                 // explodeIndex: 0,
                                                            //                 // explodeOffset:
                                                            //                 //     '10%',
                                                            //                 // radius: '75%',
                                                            //                 dataLabelSettings:
                                                            //                     DataLabelSettings(
                                                            //                   isVisible: true,
                                                            //                   labelPosition:
                                                            //                       ChartDataLabelPosition
                                                            //                           .outside,
                                                            //                   textStyle:
                                                            //                       TextStyle(
                                                            //                           fontSize:
                                                            //                               12),
                                                            //                   connectorLineSettings:
                                                            //                       ConnectorLineSettings(
                                                            //                     color: const Color
                                                            //                         .fromARGB(
                                                            //                         255,
                                                            //                         151,
                                                            //                         66,
                                                            //                         66),
                                                            //                     width: 30,
                                                            //                   ),
                                                            //                 ),
                                                            //                 dataLabelMapper:
                                                            //                     (_ChartData data,
                                                            //                             _) =>
                                                            //                         '${data.category}\n${data.value.toStringAsFixed(1)}%',

                                                            //                 pointColorMapper:
                                                            //                     (_ChartData data,
                                                            //                             _) =>
                                                            //                         getColor(data
                                                            //                             .category),
                                                            //                 enableTooltip:
                                                            //                     true,
                                                            //               ),
                                                            //             ],
                                                            //           ),
                                                            //         ),
                                                            //       ],
                                                            //     ),
                                                            //   ],
                                                            // ),

                                                            // Spacer(),
                                                          ]),
                                                      // Dimens.boxHeight20,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  // padding: EdgeInsets.only(
                                                  //     left: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: SfCircularChart(
                                                    title: ChartTitle(
                                                        text: "Category",
                                                        textStyle:
                                                            Styles.black12,
                                                        alignment:
                                                            ChartAlignment
                                                                .near),
                                                    tooltipBehavior:
                                                        TooltipBehavior(
                                                      enable: true,
                                                      tooltipPosition:
                                                          TooltipPosition
                                                              .pointer,
                                                      builder: (dynamic data,
                                                          dynamic point,
                                                          dynamic series,
                                                          int pointIndex,
                                                          int seriesIndex) {
                                                        var entry =
                                                            controller
                                                                    .getDataMap
                                                                    .entries
                                                                    .toList()[
                                                                pointIndex];
                                                        double totalValue =
                                                            controller
                                                                .getDataMap
                                                                .values
                                                                .reduce(
                                                                    (a, b) =>
                                                                        a + b);
                                                        double percentage =
                                                            (entry.value /
                                                                    totalValue) *
                                                                100;
                                                        return Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Text(
                                                            '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    legend: Legend(
                                                      isVisible: true,
                                                      position: LegendPosition
                                                          .right, // Position the legend to the right to stack vertically
                                                      overflowMode:
                                                          LegendItemOverflowMode
                                                              .wrap,
                                                      textStyle: Styles.black10,
                                                      alignment: ChartAlignment
                                                          .center, // Align the legend items to the center
                                                      itemPadding:
                                                          2, // Adjust the padding between legend items
                                                    ),
                                                    series: <CircularSeries>[
                                                      DoughnutSeries<
                                                          MapEntry<String,
                                                              double>,
                                                          String>(
                                                        strokeWidth: 25,
                                                        innerRadius: '80%',
                                                        dataSource: controller
                                                            .getDataMap.entries
                                                            .toList(),
                                                        xValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.key,
                                                        yValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.value,
                                                        // dataLabelSettings:
                                                        //     DataLabelSettings(
                                                        //   isVisible: true,
                                                        //   labelPosition:
                                                        //       ChartDataLabelPosition
                                                        //           .outside,
                                                        //   useSeriesColor: true,
                                                        //   textStyle:
                                                        //       TextStyle(fontSize: 12),
                                                        // ),
                                                        pointColorMapper:
                                                            (MapEntry<String,
                                                                        double>
                                                                    data,
                                                                _) {
                                                          var entriesList =
                                                              controller
                                                                  .getDataMap
                                                                  .entries
                                                                  .toList();
                                                          int index = entriesList
                                                              .indexWhere((entry) =>
                                                                  entry.key ==
                                                                      data
                                                                          .key &&
                                                                  entry.value ==
                                                                      data.value);
                                                          var colorList = controller
                                                              .getWoColorList();
                                                          Color color =
                                                              colorList[index %
                                                                  colorList
                                                                      .length];
                                                          return color;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Column(
                                                      children: [
                                                        Text("Low Stock Items",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.lowStockItemsSum}'),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text("PO Items Awaited",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.poItemsAwaitedSum}'),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          Expanded(
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                double screenWidth =
                                                    constraints.maxWidth;

                                                double getColumnWidth(
                                                    double defaultWidth) {
                                                  if (screenWidth < 600) {
                                                    return defaultWidth *
                                                        0.8; // For small screens
                                                  } else if (screenWidth <
                                                      1200) {
                                                    return defaultWidth *
                                                        0.9; // For medium screens
                                                  }
                                                  return defaultWidth;
                                                }

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: screenWidth,
                                                      maxWidth: screenWidth * 1,
                                                    ),
                                                    child: DataTable2(
                                                      showCheckboxColumn: false,
                                                      headingRowHeight: 45,
                                                      dataRowHeight: 40,
                                                      columnSpacing: 12,
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
                                                          label: Text(
                                                              'Site Name',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'WO Number',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'WO Description',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text('Status',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'Asset Category',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'Asset Name',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'Plan Date',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'End Date',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        DataColumn2(
                                                          label: Text('Action',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                      ],
                                                      rows: List<
                                                          DataRow>.generate(
                                                        controller
                                                            .allItems.length,
                                                        (index) => DataRow(
                                                          onSelectChanged:
                                                              (selected) {
                                                            if (selected!) {
                                                              controller
                                                                  .clearStoreJobData();
                                                              controller
                                                                  .clearStorePmData();
                                                              controller
                                                                  .clearStoreMcData();
                                                              controller
                                                                  .clearStoreMcPlanIdData();
                                                              String Id = controller
                                                                      .allItems[
                                                                          index]
                                                                      ?.wo_number ??
                                                                  "";
                                                              String planId = controller
                                                                      .allItems[
                                                                          index]
                                                                      ?.plan_id
                                                                      .toString() ??
                                                                  "";
                                                              String prefix =
                                                                  Id.replaceAll(
                                                                      RegExp(
                                                                          r'\d+$'),
                                                                      '');

                                                              String jobId =
                                                                  Id.substring(
                                                                      Id.indexOf(
                                                                              "BM") +
                                                                          2);
                                                              String taskId =
                                                                  Id.substring(
                                                                      Id.indexOf(
                                                                              "PM") +
                                                                          2);
                                                              String mcId =
                                                                  Id.substring(
                                                                      Id.indexOf(
                                                                              "MC") +
                                                                          2);
                                                              if (prefix ==
                                                                  'BM') {
                                                                Get.toNamed(
                                                                  Routes
                                                                      .jobDetails,
                                                                  arguments: {
                                                                    'jobId': int
                                                                        .tryParse(
                                                                            jobId)
                                                                  },
                                                                );
                                                              } else if (prefix ==
                                                                  'PM') {
                                                                Get.toNamed(
                                                                  Routes
                                                                      .pmTaskView,
                                                                  arguments: {
                                                                    'pmTaskId':
                                                                        int.tryParse(
                                                                            taskId)
                                                                  },
                                                                );
                                                              } else if (prefix ==
                                                                  'MC') {
                                                                Get.toNamed(
                                                                    Routes
                                                                        .addModuleCleaningExecutionContentWeb,
                                                                    arguments: {
                                                                      "mcid": int
                                                                          .tryParse(
                                                                              mcId),
                                                                      "planId":
                                                                          int.tryParse(
                                                                              planId)
                                                                    });
                                                              }
                                                            }
                                                          },
                                                          cells: [
                                                            DataCell(Text(controller
                                                                    .allItems[
                                                                        index]
                                                                    ?.facility_name ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .allItems[
                                                                        index]
                                                                    ?.wo_number ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .allItems[
                                                                        index]
                                                                    ?.wo_decription ??
                                                                "")),
                                                            DataCell(Text(controller
                                                                    .allItems[
                                                                        index]
                                                                    ?.status_long ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .allItems[
                                                                        index]
                                                                    ?.asset_category ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .allItems[
                                                                        index]
                                                                    ?.asset_name ??
                                                                '')),
                                                            DataCell(
                                                              Text(controller
                                                                          .allItems[
                                                                              index]
                                                                          ?.start_date !=
                                                                      null
                                                                  ? controller
                                                                      .allItems[
                                                                          index]!
                                                                      .start_date!
                                                                      .substring(
                                                                          0,
                                                                          controller.allItems[index]!.start_date!.length -
                                                                              9)
                                                                  : controller
                                                                          .allItems[
                                                                              index]
                                                                          ?.start_date ??
                                                                      ''),
                                                            ),
                                                            DataCell(
                                                              Text(controller
                                                                          .allItems[
                                                                              index]
                                                                          ?.end_date !=
                                                                      null
                                                                  ? controller
                                                                      .allItems[
                                                                          index]!
                                                                      .end_date!
                                                                      .substring(
                                                                          0,
                                                                          controller.allItems[index]!.end_date!.length -
                                                                              9)
                                                                  : controller
                                                                          .allItems[
                                                                              index]
                                                                          ?.end_date ??
                                                                      ''),
                                                            ),
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
                                                                        () {
                                                                      controller
                                                                          .clearStoreJobData();
                                                                      controller
                                                                          .clearStorePmData();
                                                                      controller
                                                                          .clearStoreMcData();
                                                                      controller
                                                                          .clearStoreMcPlanIdData();
                                                                      String
                                                                          Id =
                                                                          controller.allItems[index]?.wo_number ??
                                                                              "";
                                                                      String
                                                                          planId =
                                                                          controller.allItems[index]?.plan_id.toString() ??
                                                                              "";
                                                                      String
                                                                          prefix =
                                                                          Id.replaceAll(
                                                                              RegExp(r'\d+$'),
                                                                              '');

                                                                      String
                                                                          jobId =
                                                                          Id.substring(Id.indexOf("BM") +
                                                                              2);
                                                                      String
                                                                          taskId =
                                                                          Id.substring(Id.indexOf("PM") +
                                                                              2);
                                                                      String
                                                                          mcId =
                                                                          Id.substring(Id.indexOf("MC") +
                                                                              2);
                                                                      if (prefix ==
                                                                          'BM') {
                                                                        Get.toNamed(
                                                                            Routes.jobDetails,
                                                                            arguments: {
                                                                              'jobId': int.tryParse(jobId)
                                                                            });
                                                                      } else if (prefix ==
                                                                          'PM') {
                                                                        Get.toNamed(
                                                                            Routes.pmTaskView,
                                                                            arguments: {
                                                                              'pmTaskId': int.tryParse(taskId)
                                                                            });
                                                                      } else if (prefix ==
                                                                          'MC') {
                                                                        Get.toNamed(
                                                                            Routes.addModuleCleaningExecutionContentWeb,
                                                                            arguments: {
                                                                              "mcid": int.tryParse(mcId),
                                                                              "planId": int.tryParse(planId)
                                                                            });
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    //bm............................
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      height: Get.height,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
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
                                                    margin: EdgeInsets.only(
                                                        left: 0),
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Overview",
                                                                style: Styles
                                                                    .black14),
                                                            // Dimens.boxHeight20,
                                                            // Spacer(),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Total",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),

                                                                              Text('${controller.dashboardBmList.value?.cmDashboadDetails?.total}'),
                                                                              //  '${dashbo?.module_name}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Completed",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardBmList.value?.cmDashboadDetails?.completed}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Pending",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardBmList.value?.cmDashboadDetails?.pending}'),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Dimens.boxWidth20,
                                                        SizedBox(width: 20),
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
                                                              10.0, //width of circle line
                                                          animation:
                                                              true, //animate when it shows progress indicator first
                                                          percent: (controller
                                                                      .dashboardBmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.completed ??
                                                                  0) /
                                                              (controller
                                                                      .dashboardBmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.total ??
                                                                  0), //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                          center: Text(
                                                            '${((controller.dashboardBmList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardBmList.value?.cmDashboadDetails?.total ?? 0) * 100).toStringAsFixed(1)}%',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0),
                                                          ), //center text, you can set Icon as well
                                                          // footer: Text(
                                                          //   "Order this Month",
                                                          //   style: Styles.black13,
                                                          // ), //footer text
                                                          backgroundColor:
                                                              ColorValues
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
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Schedule Compliance",
                                                          style:
                                                              Styles.black14),
                                                      // Dimens.boxHeight5,
                                                      SizedBox(height: 5),

                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // Dimens.boxHeight8,
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.red),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO on-time",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woOnTimeSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.blue),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO delay",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                      // Dimens
                                                                      //     .boxWidth37,
                                                                      SizedBox(
                                                                          width:
                                                                              35),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woDelaySum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight5,
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.green),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Text(
                                                                        "WO backlog",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woBacklogSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight8,
                                                                ],
                                                              ),
                                                            ),
                                                          ]),
                                                      // Dimens.boxHeight20,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  // padding: EdgeInsets.only(
                                                  //     left: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: SfCircularChart(
                                                    title: ChartTitle(
                                                        text: "Category",
                                                        textStyle:
                                                            Styles.black12,
                                                        alignment:
                                                            ChartAlignment
                                                                .near),
                                                    tooltipBehavior:
                                                        TooltipBehavior(
                                                      enable: true,
                                                      tooltipPosition:
                                                          TooltipPosition
                                                              .pointer,
                                                      builder: (dynamic data,
                                                          dynamic point,
                                                          dynamic series,
                                                          int pointIndex,
                                                          int seriesIndex) {
                                                        var entry = controller
                                                            .categoryMapBMDouble
                                                            .entries
                                                            .toList()[pointIndex];
                                                        double totalValue =
                                                            controller
                                                                .categoryMapBMDouble
                                                                .values
                                                                .reduce(
                                                                    (a, b) =>
                                                                        a + b);
                                                        double percentage =
                                                            (entry.value /
                                                                    totalValue) *
                                                                100;
                                                        return Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Text(
                                                            '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    legend: Legend(
                                                      isVisible: true,
                                                      position: LegendPosition
                                                          .right, // Position the legend to the right to stack vertically
                                                      overflowMode:
                                                          LegendItemOverflowMode
                                                              .wrap,
                                                      textStyle: Styles.black10,
                                                      alignment: ChartAlignment
                                                          .center, // Align the legend items to the center
                                                      itemPadding:
                                                          2, // Adjust the padding between legend items
                                                    ),
                                                    series: <CircularSeries>[
                                                      DoughnutSeries<
                                                          MapEntry<String,
                                                              double>,
                                                          String>(
                                                        strokeWidth: 15,
                                                        innerRadius: '80%',
                                                        dataSource: controller
                                                            .categoryMapBMDouble
                                                            .entries
                                                            .toList(),
                                                        xValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.key,
                                                        yValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.value,
                                                        // dataLabelSettings:
                                                        //     DataLabelSettings(
                                                        //   isVisible: true,
                                                        //   labelPosition:
                                                        //       ChartDataLabelPosition
                                                        //           .outside,
                                                        //   useSeriesColor: true,
                                                        //   textStyle:
                                                        //       TextStyle(fontSize: 12),
                                                        // ),
                                                        pointColorMapper:
                                                            (MapEntry<String,
                                                                        double>
                                                                    data,
                                                                _) {
                                                          var entriesList =
                                                              controller
                                                                  .categoryMapBMDouble
                                                                  .entries
                                                                  .toList();
                                                          int index = entriesList
                                                              .indexWhere((entry) =>
                                                                  entry.key ==
                                                                      data
                                                                          .key &&
                                                                  entry.value ==
                                                                      data.value);
                                                          var colorList =
                                                              controller
                                                                  .getColorList();
                                                          Color color =
                                                              colorList[index %
                                                                  colorList
                                                                      .length];
                                                          return color;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Column(
                                                      children: [
                                                        Text("Low Stock Items",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.dashboardBmList.value?.cmDashboadDetails?.low_stock_items ?? 0}'),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text("PO Items Awaited",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.dashboardBmList.value?.cmDashboadDetails?.po_items_awaited ?? 0}'),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                          // Dimens.boxHeight10,
                                          SizedBox(height: 10),
                                          Expanded(
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                double screenWidth =
                                                    constraints.maxWidth;

                                                double getColumnWidth(
                                                    double defaultWidth) {
                                                  if (screenWidth < 600) {
                                                    return defaultWidth *
                                                        0.8; // For small screens
                                                  } else if (screenWidth <
                                                      1200) {
                                                    return defaultWidth *
                                                        0.9; // For medium screens
                                                  }
                                                  return defaultWidth; // Default for larger screens
                                                }

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: screenWidth,
                                                      maxWidth: screenWidth * 1,
                                                    ),
                                                    child: DataTable2(
                                                      showCheckboxColumn: false,
                                                      headingRowHeight: 45,
                                                      dataRowHeight: 40,
                                                      columnSpacing: 12,
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
                                                          label: Text(
                                                              'Site Name',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'WO Number',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'WO Description',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text('Status',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'Asset Category',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'Asset Name',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'Start Date',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text(
                                                              'End Date',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                        DataColumn2(
                                                          label: Text('Action',
                                                              style: Styles
                                                                  .blackBold14),
                                                        ),
                                                      ],
                                                      rows: List<
                                                          DataRow>.generate(
                                                        controller
                                                                .dashboardBmList
                                                                .value
                                                                ?.cmDashboadDetails
                                                                ?.item_list
                                                                ?.length ??
                                                            0,
                                                        (index) => DataRow(
                                                          onSelectChanged:
                                                              (selected) {
                                                            if (selected!) {
                                                              controller
                                                                  .clearStoreJobData();
                                                              controller
                                                                  .clearStorePmData();
                                                              String Id = controller
                                                                      .allItems[
                                                                          index]
                                                                      ?.wo_number ??
                                                                  "";
                                                              String prefix =
                                                                  Id.replaceAll(
                                                                      RegExp(
                                                                          r'\d+$'),
                                                                      '');

                                                              String jobId =
                                                                  Id.substring(
                                                                      Id.indexOf(
                                                                              "BM") +
                                                                          2);
                                                              if (prefix ==
                                                                  'BM') {
                                                                Get.toNamed(
                                                                  Routes
                                                                      .jobDetails,
                                                                  arguments: {
                                                                    'jobId': int
                                                                        .tryParse(
                                                                            jobId)
                                                                  },
                                                                );
                                                              }
                                                            }
                                                          },
                                                          cells: [
                                                            DataCell(
                                                              Text(controller
                                                                      .dashboardBmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.item_list?[
                                                                          index]
                                                                      .facility_name
                                                                      .toString() ??
                                                                  ''),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  '${controller.dashboardBmList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}'),
                                                            ),
                                                            DataCell(
                                                              Text(controller
                                                                      .dashboardBmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.item_list?[
                                                                          index]
                                                                      .wo_decription ??
                                                                  ""),
                                                            ),
                                                            DataCell(
                                                              Text(controller
                                                                      .dashboardBmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.item_list?[
                                                                          index]
                                                                      .status_long ??
                                                                  ''),
                                                            ),
                                                            DataCell(
                                                              Text(controller
                                                                      .dashboardBmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.item_list?[
                                                                          index]
                                                                      .asset_category ??
                                                                  ''),
                                                            ),
                                                            DataCell(
                                                              Text(controller
                                                                      .dashboardBmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.item_list?[
                                                                          index]
                                                                      .asset_name ??
                                                                  ''),
                                                            ),
                                                            DataCell(
                                                              Text(controller
                                                                          .dashboardBmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .start_date !=
                                                                      null
                                                                  ? controller
                                                                      .dashboardBmList
                                                                      .value!
                                                                      .cmDashboadDetails!
                                                                      .item_list![
                                                                          index]
                                                                      .start_date!
                                                                      .substring(
                                                                          0,
                                                                          controller.dashboardBmList.value!.cmDashboadDetails!.item_list![index].start_date!.length -
                                                                              9)
                                                                  : controller
                                                                          .dashboardBmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .start_date ??
                                                                      ''),
                                                            ),
                                                            DataCell(
                                                              Text(controller
                                                                          .dashboardBmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .end_date !=
                                                                      null
                                                                  ? controller
                                                                      .dashboardBmList
                                                                      .value!
                                                                      .cmDashboadDetails!
                                                                      .item_list![
                                                                          index]
                                                                      .end_date!
                                                                      .substring(
                                                                          0,
                                                                          controller.dashboardBmList.value!.cmDashboadDetails!.item_list![index].end_date!.length -
                                                                              9)
                                                                  : controller
                                                                          .dashboardBmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .end_date ??
                                                                      ''),
                                                            ),
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
                                                                        () {
                                                                      controller
                                                                          .clearStoreJobData();
                                                                      String Id = controller
                                                                              .dashboardBmList
                                                                              .value
                                                                              ?.cmDashboadDetails
                                                                              ?.item_list?[index]
                                                                              .wo_number ??
                                                                          "";
                                                                      String
                                                                          jobId =
                                                                          Id.substring(Id.indexOf("BM") +
                                                                              2);

                                                                      if (jobId !=
                                                                          null) {
                                                                        Get.toNamed(
                                                                          Routes
                                                                              .jobDetails,
                                                                          arguments: {
                                                                            'jobId':
                                                                                int.tryParse(jobId)
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    //pm......................

                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      height: Get.height,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
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
                                                    margin: EdgeInsets.only(
                                                        left: 0),
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Overview",
                                                                style: Styles
                                                                    .black15),
                                                            // Dimens.boxHeight20,
                                                            // Spacer(),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Total",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),

                                                                              Text('${controller.dashboardPmList.value?.cmDashboadDetails?.total}'),
                                                                              //  '${dashbo?.module_name}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Completed",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardPmList.value?.cmDashboadDetails?.completed}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Pending",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardPmList.value?.cmDashboadDetails?.pending}'),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Dimens.boxWidth20,
                                                        SizedBox(width: 20),
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
                                                              10.0, //width of circle line
                                                          animation:
                                                              true, //animate when it shows progress indicator first
                                                          percent: (controller
                                                                      .dashboardPmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.completed ??
                                                                  0) /
                                                              (controller
                                                                      .dashboardPmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.total ??
                                                                  0), //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                          center: Text(
                                                            '${((controller.dashboardPmList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardPmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0),
                                                          ), //center text, you can set Icon as well
                                                          // footer: Text(
                                                          //   "Order this Month",
                                                          //   style: Styles.black13,
                                                          // ), //footer text
                                                          backgroundColor:
                                                              ColorValues
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
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Schedule Compliance",
                                                          style:
                                                              Styles.black15),
                                                      // Dimens.boxHeight5,
                                                      SizedBox(height: 5),

                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // Dimens.boxHeight8,
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.red),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO on-time",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woOnTimeSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.blue),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO delay",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                      // Dimens
                                                                      //     .boxWidth37,
                                                                      SizedBox(
                                                                          width:
                                                                              35),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woDelaySum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.green),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Text(
                                                                        "WO backlog",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woBacklogSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight8,
                                                                ],
                                                              ),
                                                            ),
                                                          ]),
                                                      // Dimens.boxHeight20,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  // padding: EdgeInsets.only(
                                                  //     left: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: SfCircularChart(
                                                    title: ChartTitle(
                                                        text: "Category",
                                                        textStyle:
                                                            Styles.black12,
                                                        alignment:
                                                            ChartAlignment
                                                                .near),
                                                    tooltipBehavior:
                                                        TooltipBehavior(
                                                      enable: true,
                                                      tooltipPosition:
                                                          TooltipPosition
                                                              .pointer,
                                                      builder: (dynamic data,
                                                          dynamic point,
                                                          dynamic series,
                                                          int pointIndex,
                                                          int seriesIndex) {
                                                        var entry = controller
                                                            .categoryMapPMDouble
                                                            .entries
                                                            .toList()[pointIndex];
                                                        double totalValue =
                                                            controller
                                                                .categoryMapPMDouble
                                                                .values
                                                                .reduce(
                                                                    (a, b) =>
                                                                        a + b);
                                                        double percentage =
                                                            (entry.value /
                                                                    totalValue) *
                                                                100;
                                                        return Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Text(
                                                            '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    legend: Legend(
                                                      isVisible: true,
                                                      position: LegendPosition
                                                          .right, // Position the legend to the right to stack vertically
                                                      overflowMode:
                                                          LegendItemOverflowMode
                                                              .wrap,
                                                      textStyle: Styles.black10,
                                                      alignment: ChartAlignment
                                                          .center, // Align the legend items to the center
                                                      itemPadding:
                                                          2, // Adjust the padding between legend items
                                                    ),
                                                    series: <CircularSeries>[
                                                      DoughnutSeries<
                                                          MapEntry<String,
                                                              double>,
                                                          String>(
                                                        strokeWidth: 25,
                                                        innerRadius: '80%',
                                                        dataSource: controller
                                                            .categoryMapPMDouble
                                                            .entries
                                                            .toList(),
                                                        xValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.key,
                                                        yValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.value,
                                                        // dataLabelSettings:
                                                        //     DataLabelSettings(
                                                        //   isVisible: true,
                                                        //   labelPosition:
                                                        //       ChartDataLabelPosition
                                                        //           .outside,
                                                        //   useSeriesColor: true,
                                                        //   textStyle:
                                                        //       TextStyle(fontSize: 12),
                                                        // ),
                                                        pointColorMapper:
                                                            (MapEntry<String,
                                                                        double>
                                                                    data,
                                                                _) {
                                                          var entriesList =
                                                              controller
                                                                  .categoryMapPMDouble
                                                                  .entries
                                                                  .toList();
                                                          int index = entriesList
                                                              .indexWhere((entry) =>
                                                                  entry.key ==
                                                                      data
                                                                          .key &&
                                                                  entry.value ==
                                                                      data.value);
                                                          var colorList =
                                                              controller
                                                                  .getColorList();
                                                          Color color =
                                                              colorList[index %
                                                                  colorList
                                                                      .length];
                                                          return color;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Column(
                                                      children: [
                                                        Text("Low Stock Items",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.dashboardPmList.value?.cmDashboadDetails?.low_stock_items ?? 0}'),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text("PO Items Awaited",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.dashboardPmList.value?.cmDashboadDetails?.po_items_awaited ?? 0}'),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                          // Dimens.boxHeight10,
                                          SizedBox(height: 10),
                                          Expanded(
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                double screenWidth =
                                                    constraints.maxWidth;

                                                double getColumnWidth(
                                                    double defaultWidth) {
                                                  if (screenWidth < 600) {
                                                    return defaultWidth *
                                                        0.8; // For small screens
                                                  } else if (screenWidth <
                                                      1200) {
                                                    return defaultWidth *
                                                        0.9; // For medium screens
                                                  }
                                                  return defaultWidth; // Default for larger screens
                                                }

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: screenWidth,
                                                      maxWidth: screenWidth * 1,
                                                    ),
                                                    child: Container(
                                                      color: Color.fromARGB(
                                                          255, 245, 248, 250),
                                                      width: Get.width,
                                                      height: Get.height,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 0,
                                                                right: 0),
                                                        child: DataTable2(
                                                          showCheckboxColumn:
                                                              false,
                                                          headingRowHeight: 45,
                                                          dataRowHeight: 40,
                                                          columnSpacing: 12,
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
                                                              label: Text(
                                                                  'Site Name',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'WO Number',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'WO Description',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Status',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Asset Category',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Asset Name',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Start Date',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'End Date',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Action',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                          ],
                                                          rows: List<
                                                              DataRow>.generate(
                                                            controller
                                                                    .dashboardPmList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list
                                                                    ?.length ??
                                                                0,
                                                            (index) => DataRow(
                                                              onSelectChanged:
                                                                  (selected) {
                                                                if (selected!) {
                                                                  controller
                                                                      .clearStoreJobData();
                                                                  controller
                                                                      .clearStorePmData();
                                                                  String Id = controller
                                                                          .allItems[
                                                                              index]
                                                                          ?.wo_number ??
                                                                      "";
                                                                  String
                                                                      prefix =
                                                                      Id.replaceAll(
                                                                          RegExp(
                                                                              r'\d+$'),
                                                                          '');

                                                                  String
                                                                      taskId =
                                                                      Id.substring(
                                                                          Id.indexOf("PM") +
                                                                              2);
                                                                  if (prefix ==
                                                                      'PM') {
                                                                    Get.toNamed(
                                                                      Routes
                                                                          .pmTaskView,
                                                                      arguments: {
                                                                        'pmTaskId':
                                                                            int.tryParse(taskId)
                                                                      },
                                                                    );
                                                                  }
                                                                }
                                                              },
                                                              cells: [
                                                                DataCell(
                                                                  Text(controller
                                                                          .dashboardPmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .facility_name
                                                                          .toString() ??
                                                                      ''),
                                                                ),
                                                                DataCell(
                                                                  Text(
                                                                      '${controller.dashboardPmList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}'),
                                                                ),
                                                                DataCell(
                                                                  Text(controller
                                                                          .dashboardPmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .wo_decription ??
                                                                      ''),
                                                                ),
                                                                DataCell(
                                                                  Text(controller
                                                                          .dashboardPmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .status_long ??
                                                                      ''),
                                                                ),
                                                                DataCell(
                                                                  Text(controller
                                                                          .dashboardPmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .asset_category ??
                                                                      ''),
                                                                ),
                                                                DataCell(
                                                                  Text(controller
                                                                          .dashboardPmList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .asset_name ??
                                                                      ''),
                                                                ),
                                                                DataCell(
                                                                  Text(controller
                                                                              .dashboardPmList
                                                                              .value
                                                                              ?.cmDashboadDetails
                                                                              ?.item_list?[
                                                                                  index]
                                                                              .start_date !=
                                                                          null
                                                                      ? controller
                                                                          .dashboardPmList
                                                                          .value!
                                                                          .cmDashboadDetails!
                                                                          .item_list![
                                                                              index]
                                                                          .start_date!
                                                                          .substring(
                                                                              0,
                                                                              controller.dashboardPmList.value!.cmDashboadDetails!.item_list![index].start_date!.length -
                                                                                  9)
                                                                      : controller
                                                                              .dashboardPmList
                                                                              .value
                                                                              ?.cmDashboadDetails
                                                                              ?.item_list?[index]
                                                                              .start_date ??
                                                                          ''),
                                                                ),
                                                                DataCell(
                                                                  Text(controller
                                                                              .dashboardPmList
                                                                              .value
                                                                              ?.cmDashboadDetails
                                                                              ?.item_list?[
                                                                                  index]
                                                                              .end_date !=
                                                                          null
                                                                      ? controller
                                                                          .dashboardPmList
                                                                          .value!
                                                                          .cmDashboadDetails!
                                                                          .item_list![
                                                                              index]
                                                                          .end_date!
                                                                          .substring(
                                                                              0,
                                                                              controller.dashboardPmList.value!.cmDashboadDetails!.item_list![index].end_date!.length -
                                                                                  9)
                                                                      : controller
                                                                              .dashboardPmList
                                                                              .value
                                                                              ?.cmDashboadDetails
                                                                              ?.item_list?[index]
                                                                              .end_date ??
                                                                          ''),
                                                                ),
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
                                                                            () {
                                                                          controller
                                                                              .clearStorePmData();
                                                                          String
                                                                              Id =
                                                                              controller.dashboardPmList.value?.cmDashboadDetails?.item_list?[index].wo_number ?? "";
                                                                          String
                                                                              pmTaskId =
                                                                              Id.substring(Id.indexOf("PM") + 2);

                                                                          if (pmTaskId !=
                                                                              null) {
                                                                            Get.toNamed(
                                                                              Routes.pmTaskView,
                                                                              arguments: {
                                                                                'pmTaskId': int.tryParse(pmTaskId)
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    //mc......................

                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      height: Get.height,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
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
                                                    margin: EdgeInsets.only(
                                                        left: 0),
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Overview",
                                                                style: Styles
                                                                    .black15),
                                                            // Dimens.boxHeight20,
                                                            // Spacer(),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Total",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),

                                                                              Text('${controller.dashboardMcList.value?.cmDashboadDetails?.total}'),
                                                                              //  '${dashbo?.module_name}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Completed",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardMcList.value?.cmDashboadDetails?.completed}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Pending",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardMcList.value?.cmDashboadDetails?.pending}'),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Dimens.boxWidth20,
                                                        SizedBox(width: 5),
                                                        Container(
                                                            // padding: EdgeInsets.only(
                                                            //     top: 30,
                                                            //     right: 20,
                                                            //     left: 10),
                                                            child:
                                                                CircularPercentIndicator(
                                                          //circular progress indicator
                                                          radius:
                                                              45.0, //radius for circle
                                                          lineWidth:
                                                              10.0, //width of circle line
                                                          animation:
                                                              true, //animate when it shows progress indicator first
                                                          percent: (controller
                                                                      .dashboardMcList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.completed ??
                                                                  0) /
                                                              (controller
                                                                      .dashboardMcList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.total ??
                                                                  0),
                                                          center: Text(
                                                            '${((controller.dashboardMcList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardMcList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0),
                                                          ), //center text, you can set Icon as well
                                                          // footer: Text(
                                                          //   "Order this Month",
                                                          //   style: Styles.black13,
                                                          // ), //footer text
                                                          backgroundColor:
                                                              ColorValues
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
                                              // Expanded(
                                              //   flex: 2,
                                              //   child: Container(
                                              //     margin: EdgeInsets.only(left: 5),
                                              //     padding: EdgeInsets.only(
                                              //         left: 5, top: 10),
                                              //     decoration: BoxDecoration(
                                              //       color: ColorValues.lightBlueColor,
                                              //       borderRadius:
                                              //           BorderRadius.circular(10),
                                              //       boxShadow: [
                                              //         BoxShadow(
                                              //           color: Colors.grey,
                                              //           offset: Offset(0.0, 1.0),
                                              //           blurRadius: 6.0,
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     height: 160,
                                              //     child: Column(
                                              //       children: [
                                              //         Row(
                                              //           crossAxisAlignment:
                                              //               CrossAxisAlignment.start,
                                              //           children: [
                                              //             Align(
                                              //                 alignment:
                                              //                     Alignment.topLeft,
                                              //                 child: Column(
                                              //                   children: [
                                              //                     Text(
                                              //                         "Schedule Compliance",
                                              //                         style: Styles
                                              //                             .black15),
                                              //                     Dimens.boxHeight10,
                                              //                     SemicircularIndicator(
                                              //                       radius: 60,
                                              //                       color: Color
                                              //                           .fromARGB(
                                              //                               255,
                                              //                               195,
                                              //                               146,
                                              //                               230),
                                              //                       backgroundColor:
                                              //                           Colors
                                              //                               .lightGreen,
                                              //                       strokeWidth: 13,
                                              //                       bottomPadding: 0,
                                              //                       child: Text(
                                              //                         '${((controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_completed ?? 0) / (controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_total ?? 1) * 100).toString()}%',
                                              //                         style: TextStyle(
                                              //                             fontWeight:
                                              //                                 FontWeight
                                              //                                     .bold,
                                              //                             fontSize:
                                              //                                 20.0,
                                              //                             color: Colors
                                              //                                 .redAccent),
                                              //                       ),
                                              //                     ),
                                              //                   ],
                                              //                 )),
                                              //             Spacer(),
                                              //             Container(
                                              //               height: Get.height * 0.09,
                                              //               width: Get.width * 0.09,
                                              //               margin: EdgeInsets.only(
                                              //                   left: 20, right: 10),
                                              //               padding: EdgeInsets.only(
                                              //                   left: 10,
                                              //                   top: 10,
                                              //                   right: 10),
                                              //               decoration: BoxDecoration(
                                              //                   color: Colors.white,
                                              //                   borderRadius:
                                              //                       BorderRadius
                                              //                           .circular(10),
                                              //                   boxShadow: [
                                              //                     BoxShadow(
                                              //                       color:
                                              //                           Colors.grey,
                                              //                       offset: Offset(
                                              //                           0.0, 1.0),
                                              //                       blurRadius: 6.0,
                                              //                     ),
                                              //                   ]),
                                              //               child: Column(
                                              //                 crossAxisAlignment:
                                              //                     CrossAxisAlignment
                                              //                         .start,
                                              //                 children: [
                                              //                   Row(
                                              //                     children: [
                                              //                       Text(
                                              //                         "Total",
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                       Spacer(),
                                              //                       Text(
                                              //                         '${controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_total}',
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                     ],
                                              //                   ),
                                              //                   // Dimens.boxHeight2,
                                              //                   Row(
                                              //                     children: [
                                              //                       Text(
                                              //                         "Completed",
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                       Spacer(),
                                              //                       Text(
                                              //                         '${controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_completed}',
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                     ],
                                              //                   ),
                                              //                   // Dimens.boxHeight5,
                                              //                   Row(
                                              //                     children: [
                                              //                       Text(
                                              //                         "Pending",
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                       Spacer(),
                                              //                       Text(
                                              //                         '${controller.dashboardMcList.value?.cmDashboadDetails?.schedule_compliance_pending}',
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                     ],
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //         // Dimens.boxHeight20,
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 10),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Schedule Compliance",
                                                          style:
                                                              Styles.black15),
                                                      // Dimens.boxHeight5,
                                                      SizedBox(height: 5),

                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // Dimens.boxHeight8,
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.red),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO on-time",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woOnTimeSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.blue),
                                                                      SizedBox(
                                                                          width:
                                                                              10),

                                                                      Text(
                                                                        "WO delay",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                      // Dimens
                                                                      //     .boxWidth37,
                                                                      SizedBox(
                                                                          width:
                                                                              35),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woDelaySum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  SizedBox(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                          Icons
                                                                              .pie_chart,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              Colors.green),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Text(
                                                                        "WO backlog",
                                                                        style: Styles
                                                                            .black13,
                                                                      ),

                                                                      // Dimens
                                                                      //     .boxWidth20,
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      // Spacer(),
                                                                      Text(
                                                                        '${controller.woBacklogSum.value}',
                                                                        style: Styles
                                                                            .black13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight8,
                                                                ],
                                                              ),
                                                            ),
                                                          ]),
                                                      // Dimens.boxHeight20,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5, right: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: SfCircularChart(
                                                      title: ChartTitle(
                                                        text: "Type",
                                                        textStyle:
                                                            Styles.black12,
                                                        alignment:
                                                            ChartAlignment.near,
                                                      ),
                                                      tooltipBehavior:
                                                          TooltipBehavior(
                                                        enable: true,
                                                        tooltipPosition:
                                                            TooltipPosition
                                                                .pointer,
                                                        builder: (dynamic data,
                                                            dynamic point,
                                                            dynamic series,
                                                            int pointIndex,
                                                            int seriesIndex) {
                                                          var entry = controller
                                                              .mcTypeMapMcDouble
                                                              .entries
                                                              .toList()[pointIndex];
                                                          double totalValue =
                                                              controller
                                                                  .mcTypeMapMcDouble
                                                                  .values
                                                                  .reduce((a,
                                                                          b) =>
                                                                      a + b);
                                                          double percentage =
                                                              (entry.value /
                                                                      totalValue) *
                                                                  100;
                                                          return Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Text(
                                                              '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      legend: Legend(
                                                        isVisible: true,
                                                        position: LegendPosition
                                                            .right,
                                                        overflowMode:
                                                            LegendItemOverflowMode
                                                                .wrap,
                                                        textStyle:
                                                            Styles.black10,
                                                        alignment:
                                                            ChartAlignment
                                                                .center,
                                                        itemPadding: 2,
                                                      ),
                                                      series: <CircularSeries>[
                                                        DoughnutSeries<
                                                            MapEntry<String,
                                                                double>,
                                                            String>(
                                                          strokeWidth: 15,
                                                          innerRadius: '80%',
                                                          dataSource: controller
                                                              .mcTypeMapMcDouble
                                                              .entries
                                                              .toList(),
                                                          xValueMapper: (MapEntry<
                                                                          String,
                                                                          double>
                                                                      data,
                                                                  _) =>
                                                              data.key,
                                                          yValueMapper: (MapEntry<
                                                                          String,
                                                                          double>
                                                                      data,
                                                                  _) =>
                                                              data.value,
                                                          pointColorMapper:
                                                              (MapEntry<String,
                                                                          double>
                                                                      data,
                                                                  _) {
                                                            var entriesList =
                                                                controller
                                                                    .mcTypeMapMcDouble
                                                                    .entries
                                                                    .toList();
                                                            int index = entriesList
                                                                .indexWhere((entry) =>
                                                                    entry.key ==
                                                                        data
                                                                            .key &&
                                                                    entry.value ==
                                                                        data.value);
                                                            var colorList =
                                                                controller
                                                                    .getColorList();
                                                            Color color =
                                                                colorList[index %
                                                                    colorList
                                                                        .length];
                                                            return color;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5, right: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: SfCircularChart(
                                                      title: ChartTitle(
                                                        text:
                                                            "Water Used Site Wise",
                                                        textStyle:
                                                            Styles.black12,
                                                        alignment:
                                                            ChartAlignment.near,
                                                      ),
                                                      tooltipBehavior:
                                                          TooltipBehavior(
                                                        enable: true,
                                                        tooltipPosition:
                                                            TooltipPosition
                                                                .pointer,
                                                        builder: (dynamic data,
                                                            dynamic point,
                                                            dynamic series,
                                                            int pointIndex,
                                                            int seriesIndex) {
                                                          var entry = controller
                                                                  .waterUsedDouble
                                                                  .entries
                                                                  .toList()[
                                                              pointIndex];
                                                          double totalValue =
                                                              controller
                                                                  .waterUsedDouble
                                                                  .values
                                                                  .reduce((a,
                                                                          b) =>
                                                                      a + b);
                                                          double percentage =
                                                              (entry.value /
                                                                      totalValue) *
                                                                  100;
                                                          return Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Text(
                                                              '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      legend: Legend(
                                                        isVisible: true,
                                                        position: LegendPosition
                                                            .right,
                                                        overflowMode:
                                                            LegendItemOverflowMode
                                                                .wrap,
                                                        textStyle:
                                                            Styles.black10,
                                                        alignment:
                                                            ChartAlignment
                                                                .center,
                                                        itemPadding: 2,
                                                      ),
                                                      series: <CircularSeries>[
                                                        DoughnutSeries<
                                                            MapEntry<String,
                                                                double>,
                                                            String>(
                                                          strokeWidth: 15,
                                                          innerRadius: '80%',
                                                          dataSource: controller
                                                              .waterUsedDouble
                                                              .entries
                                                              .toList(),
                                                          xValueMapper: (MapEntry<
                                                                          String,
                                                                          double>
                                                                      data,
                                                                  _) =>
                                                              data.key,
                                                          yValueMapper: (MapEntry<
                                                                          String,
                                                                          double>
                                                                      data,
                                                                  _) =>
                                                              data.value,
                                                          pointColorMapper:
                                                              (MapEntry<String,
                                                                          double>
                                                                      data,
                                                                  _) {
                                                            var entriesList =
                                                                controller
                                                                    .waterUsedDouble
                                                                    .entries
                                                                    .toList();
                                                            int index = entriesList
                                                                .indexWhere((entry) =>
                                                                    entry.key ==
                                                                        data
                                                                            .key &&
                                                                    entry.value ==
                                                                        data.value);
                                                            var colorList =
                                                                controller
                                                                    .getColorList();
                                                            Color color =
                                                                colorList[index %
                                                                    colorList
                                                                        .length];
                                                            return color;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Column(
                                                      children: [
                                                        Text("Water Used",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.dashboardMcList.value?.cmDashboadDetails?.low_stock_items ?? 0}'),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text("Water Saved",
                                                            style:
                                                                Styles.black15),
                                                        SizedBox(height: 2),
                                                        Container(
                                                          height: 35,
                                                          child: CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appLightBlueColor,
                                                              onPressed: () {},
                                                              text:
                                                                  '${controller.dashboardMcList.value?.cmDashboadDetails?.po_items_awaited ?? 0}'),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                          // Dimens.boxHeight10,
                                          SizedBox(height: 10),
                                          Expanded(
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                double screenWidth =
                                                    constraints.maxWidth;

                                                double getColumnWidth(
                                                    double defaultWidth) {
                                                  if (screenWidth < 600) {
                                                    return defaultWidth *
                                                        0.8; // For small screens
                                                  } else if (screenWidth <
                                                      1200) {
                                                    return defaultWidth *
                                                        0.9; // For medium screens
                                                  }
                                                  return defaultWidth; // Default for larger screens
                                                }

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: screenWidth,
                                                      maxWidth: screenWidth * 1,
                                                    ),
                                                    child: Container(
                                                      color: Color.fromARGB(
                                                          255, 245, 248, 250),
                                                      width: Get.width,
                                                      height: Get.height,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 0,
                                                                right: 0),
                                                        child: DataTable2(
                                                          headingRowHeight: 45,
                                                          dataRowHeight: 40,
                                                          columnSpacing: 12,
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
                                                              label: Text(
                                                                  'Site Name',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'WO Number',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'WO Description',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Status',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'MC Type',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Water Used',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  '% of module cleaned',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Start Date',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'End Date',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Action',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                          ],
                                                          rows: List<
                                                              DataRow>.generate(
                                                            controller
                                                                    .dashboardMcList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list
                                                                    ?.length ??
                                                                0,
                                                            (index) => DataRow(
                                                              onSelectChanged:
                                                                  (selected) {
                                                                if (selected!) {
                                                                  controller
                                                                      .clearStoreMcData();
                                                                  controller
                                                                      .clearStoreMcPlanIdData();
                                                                  String Id = controller
                                                                          .dashboardMcList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          ?.wo_number ??
                                                                      "";
                                                                  String
                                                                      prefix =
                                                                      Id.replaceAll(
                                                                          RegExp(
                                                                              r'\d+$'),
                                                                          '');

                                                                  String mcId =
                                                                      Id.substring(
                                                                          Id.indexOf("MC") +
                                                                              2);
                                                                  String planId = controller
                                                                          .dashboardMcList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          ?.plan_id
                                                                          .toString() ??
                                                                      "";
                                                                  if (prefix ==
                                                                      'MC') {
                                                                    Get.toNamed(
                                                                        Routes
                                                                            .addModuleCleaningExecutionContentWeb,
                                                                        arguments: {
                                                                          "mcid":
                                                                              int.tryParse(mcId),
                                                                          "planId":
                                                                              int.tryParse(planId)
                                                                        });
                                                                  }
                                                                }
                                                              },
                                                              cells: [
                                                                DataCell(Text(controller
                                                                        .dashboardMcList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .facility_name
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(
                                                                    '${controller.dashboardMcList.value?.cmDashboadDetails?.item_list?[index].wo_number.toString() ?? ''}')),
                                                                DataCell(Text(controller
                                                                        .dashboardMcList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .wo_decription ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardMcList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .status_long ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardMcList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .mC_Type
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardMcList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .totalWaterUsed
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(
                                                                    Text(() {
                                                                  final item = controller
                                                                      .dashboardMcList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.item_list?[index];
                                                                  if (item ==
                                                                          null ||
                                                                      item.no_of_cleaned ==
                                                                          null ||
                                                                      item.scheduled ==
                                                                          null) {
                                                                    return "N/A";
                                                                  }

                                                                  final noOfCleaned =
                                                                      item.no_of_cleaned!;
                                                                  final scheduled =
                                                                      item.scheduled!;

                                                                  if (scheduled ==
                                                                      0) {
                                                                    return "N/A";
                                                                  }

                                                                  final percentage =
                                                                      (noOfCleaned *
                                                                              100) /
                                                                          scheduled;
                                                                  return percentage
                                                                          .toStringAsFixed(
                                                                              2) +
                                                                      "%";
                                                                }())),
                                                                DataCell(Text(controller
                                                                            .dashboardMcList
                                                                            .value
                                                                            ?.cmDashboadDetails
                                                                            ?.item_list?[
                                                                                index]
                                                                            .start_date !=
                                                                        null
                                                                    ? controller
                                                                        .dashboardMcList
                                                                        .value!
                                                                        .cmDashboadDetails!
                                                                        .item_list![
                                                                            index]
                                                                        .start_date!
                                                                        .substring(
                                                                            0,
                                                                            controller.dashboardMcList.value!.cmDashboadDetails!.item_list![index].start_date!.length -
                                                                                9)
                                                                    : controller
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
                                                                            ?.item_list?[
                                                                                index]
                                                                            .end_date !=
                                                                        null
                                                                    ? controller
                                                                        .dashboardMcList
                                                                        .value!
                                                                        .cmDashboadDetails!
                                                                        .item_list![
                                                                            index]
                                                                        .end_date!
                                                                        .substring(
                                                                            0,
                                                                            controller.dashboardMcList.value!.cmDashboadDetails!.item_list![index].end_date!.length -
                                                                                9)
                                                                    : controller
                                                                            .dashboardMcList
                                                                            .value
                                                                            ?.cmDashboadDetails
                                                                            ?.item_list?[index]
                                                                            .end_date ??
                                                                        '')),
                                                                DataCell(Row(
                                                                  children: [
                                                                    TableActionButton(
                                                                      color: ColorValues
                                                                          .viewColor,
                                                                      icon: Icons
                                                                          .remove_red_eye_outlined,
                                                                      message:
                                                                          'View',
                                                                      onPress:
                                                                          () {
                                                                        controller
                                                                            .clearStoreMcData();
                                                                        controller
                                                                            .clearStoreMcPlanIdData();
                                                                        String
                                                                            Id =
                                                                            controller.dashboardMcList.value?.cmDashboadDetails?.item_list?[index]?.wo_number ??
                                                                                "";
                                                                        String
                                                                            mcId =
                                                                            Id.substring(Id.indexOf("MC") +
                                                                                2);
                                                                        String
                                                                            planId =
                                                                            controller.dashboardMcList.value?.cmDashboadDetails?.item_list?[index]?.plan_id.toString() ??
                                                                                "";

                                                                        if (mcId !=
                                                                            null) {
                                                                          Get.toNamed(
                                                                              Routes.addModuleCleaningExecutionContentWeb,
                                                                              arguments: {
                                                                                "mcid": int.tryParse(mcId),
                                                                                "planId": int.tryParse(planId)
                                                                              });
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    ///ir...............................

                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      height: Get.height,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
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
                                                    margin: EdgeInsets.only(
                                                        left: 0),
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Overview",
                                                                style: Styles
                                                                    .black15),
                                                            // Dimens.boxHeight20,
                                                            // Spacer(),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Total",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),

                                                                              Text('${controller.dashboardIrList.value?.cmDashboadDetails?.total}'),
                                                                              //  '${dashbo?.module_name}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Completed",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardIrList.value?.cmDashboadDetails?.completed}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Pending",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardIrList.value?.cmDashboadDetails?.pending}'),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Dimens.boxWidth20,
                                                        SizedBox(width: 20),
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
                                                              10.0, //width of circle line
                                                          animation:
                                                              true, //animate when it shows progress indicator first
                                                          percent: (controller
                                                                      .dashboardIrList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.completed ??
                                                                  0) /
                                                              (controller
                                                                      .dashboardIrList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.total ??
                                                                  0),
                                                          center: Text(
                                                            '${((controller.dashboardIrList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardIrList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0),
                                                          ), //center text, you can set Icon as well
                                                          // footer: Text(
                                                          //   "Order this Month",
                                                          //   style: Styles.black13,
                                                          // ), //footer text
                                                          backgroundColor:
                                                              ColorValues
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
                                                  margin: EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: ColorValues
                                                        .lightBlueColor,
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
                                                    ],
                                                  ),
                                                  height: 160,
                                                  child: SfCartesianChart(
                                                    tooltipBehavior:
                                                        TooltipBehavior(
                                                      enable: true,
                                                      tooltipPosition:
                                                          TooltipPosition
                                                              .pointer,
                                                      builder: (dynamic data,
                                                          dynamic point,
                                                          dynamic series,
                                                          int pointIndex,
                                                          int seriesIndex) {
                                                        var entry = controller
                                                            .categoryMapIRDouble
                                                            .entries
                                                            .toList()[pointIndex];
                                                        double totalValue =
                                                            controller
                                                                .categoryMapIRDouble
                                                                .values
                                                                .reduce(
                                                                    (a, b) =>
                                                                        a + b);
                                                        double percentage =
                                                            (entry.value /
                                                                    totalValue) *
                                                                100;
                                                        return Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Text(
                                                            '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    legend: Legend(
                                                      isVisible: true,
                                                      position: LegendPosition
                                                          .right, // Position the legend to the right to stack vertically
                                                      overflowMode:
                                                          LegendItemOverflowMode
                                                              .wrap,
                                                      textStyle: Styles.black10,
                                                      alignment: ChartAlignment
                                                          .center, // Align the legend items to the center
                                                      itemPadding:
                                                          2, // Adjust the padding between legend items
                                                    ),
                                                    primaryXAxis:
                                                        CategoryAxis(),
                                                    primaryYAxis: NumericAxis(),
                                                    series: <CartesianSeries>[
                                                      ColumnSeries<
                                                          MapEntry<String,
                                                              double>,
                                                          String>(
                                                        dataSource: controller
                                                            .categoryMapIRDouble
                                                            .entries
                                                            .toList(),
                                                        xValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.key,
                                                        yValueMapper: (MapEntry<
                                                                        String,
                                                                        double>
                                                                    data,
                                                                _) =>
                                                            data.value,
                                                        pointColorMapper:
                                                            (MapEntry<String,
                                                                        double>
                                                                    data,
                                                                _) {
                                                          var entriesList =
                                                              controller
                                                                  .categoryMapIRDouble
                                                                  .entries
                                                                  .toList();
                                                          int index = entriesList
                                                              .indexWhere((entry) =>
                                                                  entry.key ==
                                                                      data
                                                                          .key &&
                                                                  entry.value ==
                                                                      data.value);
                                                          var colorList = controller
                                                              .getColorIrList();
                                                          Color color =
                                                              colorList[index %
                                                                  colorList
                                                                      .length];
                                                          return color;
                                                        },
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              // Expanded(
                                              //   flex: 2,
                                              //   child: Container(
                                              //     margin: EdgeInsets.only(left: 5),
                                              //     padding: EdgeInsets.only(
                                              //         left: 5, top: 10),
                                              //     decoration: BoxDecoration(
                                              //       color: ColorValues.lightBlueColor,
                                              //       borderRadius:
                                              //           BorderRadius.circular(10),
                                              //       boxShadow: [
                                              //         BoxShadow(
                                              //           color: Colors.grey,
                                              //           offset: Offset(0.0, 1.0),
                                              //           blurRadius: 6.0,
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     height: 160,
                                              //     child: Column(
                                              //       children: [
                                              //         Row(
                                              //           crossAxisAlignment:
                                              //               CrossAxisAlignment.start,
                                              //           children: [
                                              //             Align(
                                              //                 alignment:
                                              //                     Alignment.topLeft,
                                              //                 child: Column(
                                              //                   children: [
                                              //                     Text(
                                              //                         "Schedule Compliance",
                                              //                         style: Styles
                                              //                             .black15),
                                              //                     Dimens.boxHeight10,
                                              //                     SemicircularIndicator(
                                              //                       radius: 60,
                                              //                       color: Color
                                              //                           .fromARGB(
                                              //                               255,
                                              //                               195,
                                              //                               146,
                                              //                               230),
                                              //                       backgroundColor:
                                              //                           Colors
                                              //                               .lightGreen,
                                              //                       strokeWidth: 13,
                                              //                       bottomPadding: 0,
                                              //                       child: Text(
                                              //                         '${((controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_completed ?? 0) / (controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_total ?? 1) * 100).toString()}%',
                                              //                         style: TextStyle(
                                              //                             fontWeight:
                                              //                                 FontWeight
                                              //                                     .bold,
                                              //                             fontSize:
                                              //                                 20.0,
                                              //                             color: Colors
                                              //                                 .redAccent),
                                              //                       ),
                                              //                     ),
                                              //                   ],
                                              //                 )),
                                              //             Spacer(),
                                              //             Container(
                                              //               height: Get.height * 0.09,
                                              //               width: Get.width * 0.09,
                                              //               margin: EdgeInsets.only(
                                              //                   left: 20, right: 10),
                                              //               padding: EdgeInsets.only(
                                              //                   left: 10,
                                              //                   top: 10,
                                              //                   right: 10),
                                              //               decoration: BoxDecoration(
                                              //                   color: Colors.white,
                                              //                   borderRadius:
                                              //                       BorderRadius
                                              //                           .circular(10),
                                              //                   boxShadow: [
                                              //                     BoxShadow(
                                              //                       color:
                                              //                           Colors.grey,
                                              //                       offset: Offset(
                                              //                           0.0, 1.0),
                                              //                       blurRadius: 6.0,
                                              //                     ),
                                              //                   ]),
                                              //               child: Column(
                                              //                 crossAxisAlignment:
                                              //                     CrossAxisAlignment
                                              //                         .start,
                                              //                 children: [
                                              //                   Row(
                                              //                     children: [
                                              //                       Text(
                                              //                         "Total",
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                       Spacer(),
                                              //                       Text(
                                              //                         '${controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_total}',
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                     ],
                                              //                   ),
                                              //                   // Dimens.boxHeight2,
                                              //                   Row(
                                              //                     children: [
                                              //                       Text(
                                              //                         "Completed",
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                       Spacer(),
                                              //                       Text(
                                              //                         '${controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_completed}',
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                     ],
                                              //                   ),
                                              //                   // Dimens.boxHeight5,
                                              //                   Row(
                                              //                     children: [
                                              //                       Text(
                                              //                         "Pending",
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                       Spacer(),
                                              //                       Text(
                                              //                         '${controller.dashboardIrList.value?.cmDashboadDetails?.schedule_compliance_pending}',
                                              //                         style: TextStyle(
                                              //                             fontSize:
                                              //                                 Get.width *
                                              //                                         0.009 -
                                              //                                     1),
                                              //                       ),
                                              //                     ],
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //         // Dimens.boxHeight20,
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),
                                              // Expanded(
                                              //   flex: 2,
                                              //   child: Container(
                                              //     margin: EdgeInsets.only(left: 10),
                                              //     padding: EdgeInsets.only(
                                              //         left: 10, top: 10),
                                              //     decoration: BoxDecoration(
                                              //       color: ColorValues.lightBlueColor,
                                              //       borderRadius:
                                              //           BorderRadius.circular(10),
                                              //       boxShadow: [
                                              //         BoxShadow(
                                              //           color: Colors.grey,
                                              //           offset: Offset(0.0, 1.0),
                                              //           blurRadius: 6.0,
                                              //         ),
                                              //       ],
                                              //     ),
                                              //     height: 160,
                                              //     child: Column(
                                              //       crossAxisAlignment:
                                              //           CrossAxisAlignment.start,
                                              //       children: [
                                              //         Text("Schedule Compliance",
                                              //             style: Styles.black15),
                                              //         // Dimens.boxHeight5,
                                              //         SizedBox(height: 5),

                                              //         Row(
                                              //             mainAxisAlignment:
                                              //                 MainAxisAlignment
                                              //                     .center,
                                              //             children: [
                                              //               Container(
                                              //                 child: Column(
                                              //                   crossAxisAlignment:
                                              //                       CrossAxisAlignment
                                              //                           .start,
                                              //                   children: [
                                              //                     // Dimens.boxHeight8,
                                              //                     Row(
                                              //                       children: [
                                              //                         Icon(
                                              //                             Icons
                                              //                                 .pie_chart,
                                              //                             size: 30,
                                              //                             color: Colors
                                              //                                 .red),
                                              //                         SizedBox(
                                              //                             width: 10),

                                              //                         Text(
                                              //                           "WO on-time",
                                              //                           style: Styles
                                              //                               .black13,
                                              //                         ),

                                              //                         // Dimens
                                              //                         //     .boxWidth20,
                                              //                         SizedBox(width: 20),
                                              //                         // Spacer(),
                                              //                         Text(
                                              //                           '${controller.woOnTimeSum.value}',
                                              //                           style: Styles
                                              //                               .black13,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                     // Dimens.boxHeight5,
                                              //                     SizedBox(height: 5),
                                              //                     Row(
                                              //                       children: [
                                              //                         Icon(
                                              //                             Icons
                                              //                                 .pie_chart,
                                              //                             size: 30,
                                              //                             color: Colors
                                              //                                 .blue),
                                              //                         SizedBox(
                                              //                             width: 10),

                                              //                         Text(
                                              //                           "WO delay",
                                              //                           style: Styles
                                              //                               .black13,
                                              //                         ),
                                              //                         // Dimens
                                              //                         //     .boxWidth37,
                                              //                         SizedBox(width: 35),
                                              //                         // Spacer(),
                                              //                         Text(
                                              //                           '${controller.woDelaySum.value}',
                                              //                           style: Styles
                                              //                               .black13,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                     // Dimens.boxHeight5,
                                              //                     SizedBox(height: 5),
                                              //                     Row(
                                              //                       children: [
                                              //                         Icon(
                                              //                             Icons
                                              //                                 .pie_chart,
                                              //                             size: 30,
                                              //                             color: Colors
                                              //                                 .green),
                                              //                         SizedBox(
                                              //                             width: 10),
                                              //                         Text(
                                              //                           "WO backlog",
                                              //                           style: Styles
                                              //                               .black13,
                                              //                         ),

                                              //                         // Dimens
                                              //                         //     .boxWidth20,
                                              //                         SizedBox(width: 20),
                                              //                         // Spacer(),
                                              //                         Text(
                                              //                           '${controller.woBacklogSum.value}',
                                              //                           style: Styles
                                              //                               .black13,
                                              //                         ),
                                              //                       ],
                                              //                     ),
                                              //                     // Dimens.boxHeight8,
                                              //                   ],
                                              //                 ),
                                              //               ),
                                              //             ]),
                                              //         // Dimens.boxHeight20,
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),
                                              // Expanded(
                                              //   flex: 2,
                                              //   child: Container(
                                              //       margin: EdgeInsets.only(
                                              //           left: 10, right: 10),
                                              //       padding: EdgeInsets.only(
                                              //           left: 10, top: 10),
                                              //       decoration: BoxDecoration(
                                              //         color:
                                              //             ColorValues.lightBlueColor,
                                              //         borderRadius:
                                              //             BorderRadius.circular(10),
                                              //         boxShadow: [
                                              //           BoxShadow(
                                              //             color: Colors.grey,
                                              //             offset: Offset(0.0, 1.0),
                                              //             blurRadius: 6.0,
                                              //           ),
                                              //         ],
                                              //       ),
                                              //       height: 160,
                                              //       child: Row(
                                              //         children: [
                                              //           Align(
                                              //               alignment:
                                              //                   Alignment.topLeft,
                                              //               child: Text("Category",
                                              //                   style:
                                              //                       Styles.black15)),
                                              //           Align(
                                              //             alignment:
                                              //                 Alignment.centerLeft,
                                              //             child: Obx(() {
                                              //               // Access the dataMap from the controller
                                              //               Map<String, double> data =
                                              //                   controller.getDataMap;
                                              //               return PieChart(
                                              //                 dataMap: data,
                                              //                 totalValue: data.values
                                              //                     .reduce((a, b) =>
                                              //                         a +
                                              //                         b), // Sum of all values in the map
                                              //                 chartType:
                                              //                     ChartType.ring,
                                              //                 chartRadius: 100,
                                              //                 colorList: controller
                                              //                     .getColorList(),
                                              //                 legendOptions:
                                              //                     LegendOptions(
                                              //                   showLegendsInRow:
                                              //                       false,
                                              //                   showLegends: true,
                                              //                 ),
                                              //                 chartValuesOptions:
                                              //                     ChartValuesOptions(
                                              //                   showChartValueBackground:
                                              //                       false,
                                              //                   showChartValues: true,
                                              //                   showChartValuesInPercentage:
                                              //                       true,
                                              //                   showChartValuesOutside:
                                              //                       false,
                                              //                 ),
                                              //               );
                                              //             }),
                                              //           )
                                              //         ],
                                              //       )),
                                              // ),
                                              // Expanded(
                                              //   flex: 2,
                                              //   child: Container(
                                              //       padding: EdgeInsets.only(top: 10),
                                              //       decoration: BoxDecoration(
                                              //         color:
                                              //             ColorValues.lightBlueColor,
                                              //         borderRadius:
                                              //             BorderRadius.circular(10),
                                              //         boxShadow: [
                                              //           BoxShadow(
                                              //             color: Colors.grey,
                                              //             offset: Offset(0.0, 1.0),
                                              //             blurRadius: 6.0,
                                              //           ),
                                              //         ],
                                              //       ),
                                              //       height: 160,
                                              //       child: Column(
                                              //         children: [
                                              //           Text("Low Stock Items",
                                              //               style: Styles.black15),
                                              //           SizedBox(height: 2),
                                              //           Container(
                                              //             height: 35,
                                              //             child: CustomElevatedButton(
                                              //                 backgroundColor:
                                              //                     ColorValues
                                              //                         .appLightBlueColor,
                                              //                 onPressed: () {},
                                              //                 text:
                                              //                     '${controller.dashboardIrList.value?.cmDashboadDetails?.low_stock_items ?? 0}'),
                                              //           ),
                                              //           SizedBox(height: 8),
                                              //           Text("PO Items Awaited",
                                              //               style: Styles.black15),
                                              //           SizedBox(height: 2),
                                              //           Container(
                                              //             height: 35,
                                              //             child: CustomElevatedButton(
                                              //                 backgroundColor:
                                              //                     ColorValues
                                              //                         .appLightBlueColor,
                                              //                 onPressed: () {},
                                              //                 text:
                                              //                     '${controller.dashboardIrList.value?.cmDashboadDetails?.po_items_awaited ?? 0}'),
                                              //           ),
                                              //         ],
                                              //       )),
                                              // ),
                                            ],
                                          ),
                                          // Dimens.boxHeight10,
                                          Dimens.boxHeight10,
                                          Expanded(
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                double screenWidth =
                                                    constraints.maxWidth;

                                                double getColumnWidth(
                                                    double defaultWidth) {
                                                  if (screenWidth < 600) {
                                                    return defaultWidth *
                                                        0.8; // For small screens
                                                  } else if (screenWidth <
                                                      1200) {
                                                    return defaultWidth *
                                                        0.9; // For medium screens
                                                  }
                                                  return defaultWidth; // Default for larger screens
                                                }

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: screenWidth,
                                                      maxWidth: screenWidth * 1,
                                                    ),
                                                    child: Container(
                                                      color: Color.fromARGB(
                                                          255, 245, 248, 250),
                                                      width: Get.width,
                                                      height: Get.height,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 0,
                                                                right: 0),
                                                        child: DataTable2(
                                                          headingRowHeight: 45,
                                                          dataRowHeight: 40,
                                                          columnSpacing: 12,
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
                                                              label: Text('ID',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Title',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Description',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Type Of Incident',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Location',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Incident Date & Time',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Restoration Date & Time',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Severity',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Action',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                          ],
                                                          rows: List<
                                                              DataRow>.generate(
                                                            controller
                                                                    .dashboardIrList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list
                                                                    ?.length ??
                                                                0,
                                                            (index) => DataRow(
                                                                cells: [
                                                                  DataCell(Text(controller
                                                                          .dashboardIrList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .wo_number
                                                                          .toString() ??
                                                                      '')),
                                                                  DataCell(Text(
                                                                      '${controller.dashboardIrList.value?.cmDashboadDetails?.item_list?[index].title.toString() ?? ''}')),
                                                                  DataCell(Text(controller
                                                                          .dashboardIrList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .wo_decription ??
                                                                      '')),
                                                                  DataCell(Text(controller
                                                                          .dashboardIrList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .type_of_incident ??
                                                                      '')),
                                                                  DataCell(Text(controller
                                                                          .dashboardIrList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .location_of_incident ??
                                                                      '')),
                                                                  DataCell(Text(controller
                                                                          .dashboardIrList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .incident_datetime ??
                                                                      '')),
                                                                  DataCell(Text(controller
                                                                          .dashboardIrList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .restoration_datetime ??
                                                                      '')),
                                                                  DataCell(Text(controller
                                                                          .dashboardIrList
                                                                          .value
                                                                          ?.cmDashboadDetails
                                                                          ?.item_list?[
                                                                              index]
                                                                          .severity ??
                                                                      '')),
                                                                  DataCell(
                                                                    Row(
                                                                      children: [
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.viewColor,
                                                                          icon:
                                                                              Icons.remove_red_eye_outlined,
                                                                          message:
                                                                              'View',
                                                                          onPress:
                                                                              () {
                                                                            controller.clearStoreIrData();

                                                                            String
                                                                                Id =
                                                                                controller.dashboardIrList.value?.cmDashboadDetails?.item_list?[index].wo_number ?? "";
                                                                            String
                                                                                iRId =
                                                                                Id.substring(Id.indexOf("IR") + 2);

                                                                            if (iRId !=
                                                                                null) {
                                                                              Get.toNamed(Routes.viewIncidentReportScreen, arguments: {
                                                                                'irId': int.tryParse(iRId)
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
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    //sm.................................

                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      height: Get.height,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
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
                                                    margin: EdgeInsets.only(
                                                        left: 0),
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("Overview",
                                                                style: Styles
                                                                    .black15),
                                                            // Dimens.boxHeight20,
                                                            // Spacer(),
                                                            Center(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "GR",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),

                                                                              Text('${controller.dashboardSmList.value?.cmDashboadDetails?.total}'),
                                                                              //  '${dashbo?.module_name}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "GO Raised",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardSmList.value?.cmDashboadDetails?.completed}'),
                                                                            ],
                                                                          ),
                                                                          // Dimens
                                                                          //     .boxHeight5,
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "GO Pending",
                                                                                style: Styles.black13,
                                                                              ),
                                                                              Spacer(),
                                                                              Text('${controller.dashboardSmList.value?.cmDashboadDetails?.pending}'),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Dimens.boxWidth20,
                                                        SizedBox(width: 20),
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
                                                              10.0, //width of circle line
                                                          animation:
                                                              true, //animate when it shows progress indicator first
                                                          percent: (controller
                                                                      .dashboardSmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.completed ??
                                                                  0) /
                                                              (controller
                                                                      .dashboardSmList
                                                                      .value
                                                                      ?.cmDashboadDetails
                                                                      ?.total ??
                                                                  0),
                                                          center: Text(
                                                            '${((controller.dashboardSmList.value?.cmDashboadDetails?.completed ?? 0) / (controller.dashboardSmList.value?.cmDashboadDetails?.total ?? 1) * 100).toStringAsFixed(1)}%',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20.0),
                                                          ), //center text, you can set Icon as well
                                                          // footer: Text(
                                                          //   "Order this Month",
                                                          //   style: Styles.black13,
                                                          // ), //footer text
                                                          backgroundColor:
                                                              ColorValues
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
                                                    margin: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    decoration: BoxDecoration(
                                                      color: ColorValues
                                                          .lightBlueColor,
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
                                                      ],
                                                    ),
                                                    height: 160,
                                                    child: SfCartesianChart(
                                                      tooltipBehavior:
                                                          TooltipBehavior(
                                                        enable: true,
                                                        tooltipPosition:
                                                            TooltipPosition
                                                                .pointer,
                                                        builder: (dynamic data,
                                                            dynamic point,
                                                            dynamic series,
                                                            int pointIndex,
                                                            int seriesIndex) {
                                                          var entry = controller
                                                                  .stockOverviewmap
                                                                  .entries
                                                                  .toList()[
                                                              pointIndex];
                                                          double totalValue =
                                                              controller
                                                                  .stockOverviewmap
                                                                  .values
                                                                  .reduce((a,
                                                                          b) =>
                                                                      a + b);
                                                          double percentage =
                                                              (entry.value /
                                                                      totalValue) *
                                                                  100;
                                                          return Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Text(
                                                              '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      legend: Legend(
                                                        isVisible:
                                                            false, // Hide the legend
                                                        position: LegendPosition
                                                            .right,
                                                        overflowMode:
                                                            LegendItemOverflowMode
                                                                .wrap,
                                                        textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10),
                                                        alignment:
                                                            ChartAlignment
                                                                .center,
                                                        itemPadding: 2,
                                                      ),
                                                      primaryXAxis:
                                                          CategoryAxis(),
                                                      primaryYAxis:
                                                          NumericAxis(),
                                                      series: <CartesianSeries>[
                                                        WaterfallSeries<
                                                            MapEntry<String,
                                                                double>,
                                                            String>(
                                                          dataSource: controller
                                                              .stockOverviewmap
                                                              .entries
                                                              .toList(),
                                                          xValueMapper: (MapEntry<
                                                                          String,
                                                                          double>
                                                                      data,
                                                                  _) =>
                                                              data.key,
                                                          yValueMapper: (MapEntry<
                                                                          String,
                                                                          double>
                                                                      data,
                                                                  _) =>
                                                              data.value,
                                                          pointColorMapper:
                                                              (MapEntry<String,
                                                                          double>
                                                                      data,
                                                                  _) {
                                                            var entriesList =
                                                                controller
                                                                    .stockOverviewmap
                                                                    .entries
                                                                    .toList();
                                                            int index = entriesList
                                                                .indexWhere((entry) =>
                                                                    entry.key ==
                                                                        data
                                                                            .key &&
                                                                    entry.value ==
                                                                        data.value);
                                                            Color color = controller
                                                                    .colorList()[
                                                                index %
                                                                    controller
                                                                        .colorList()
                                                                        .length];
                                                            return color;
                                                          },
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          intermediateSumPredicate:
                                                              (MapEntry<String,
                                                                              double>
                                                                          data,
                                                                      _) =>
                                                                  data.key ==
                                                                  'Balance',
                                                          totalSumPredicate:
                                                              (MapEntry<String,
                                                                              double>
                                                                          data,
                                                                      _) =>
                                                                  data.key ==
                                                                  'Balance',
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                              Obx(() {
                                                return controller
                                                            .isToggleOn.value ==
                                                        false
                                                    ? Expanded(
                                                        flex: 2,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 5,
                                                                    right: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorValues
                                                                  .lightBlueColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
                                                                  blurRadius:
                                                                      6.0,
                                                                ),
                                                              ],
                                                            ),
                                                            height: 160,
                                                            child:
                                                                SfCircularChart(
                                                              title: ChartTitle(
                                                                text:
                                                                    "Stock Available/Consumption by Goods",
                                                                textStyle: Styles
                                                                    .black12,
                                                                alignment:
                                                                    ChartAlignment
                                                                        .near,
                                                              ),
                                                              tooltipBehavior:
                                                                  TooltipBehavior(
                                                                enable: true,
                                                                tooltipPosition:
                                                                    TooltipPosition
                                                                        .pointer,
                                                                builder: (dynamic
                                                                        data,
                                                                    dynamic
                                                                        point,
                                                                    dynamic
                                                                        series,
                                                                    int pointIndex,
                                                                    int seriesIndex) {
                                                                  var entry = controller
                                                                      .categoryMapSmAvailableDouble
                                                                      .entries
                                                                      .toList()[pointIndex];
                                                                  double totalValue = controller
                                                                      .categoryMapSmAvailableDouble
                                                                      .values
                                                                      .reduce((a,
                                                                              b) =>
                                                                          a +
                                                                          b);
                                                                  double
                                                                      percentage =
                                                                      (entry.value /
                                                                              totalValue) *
                                                                          100;
                                                                  return Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child: Text(
                                                                      '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                              legend: Legend(
                                                                isVisible: true,
                                                                position:
                                                                    LegendPosition
                                                                        .right,
                                                                overflowMode:
                                                                    LegendItemOverflowMode
                                                                        .wrap,
                                                                textStyle: Styles
                                                                    .black10,
                                                                alignment:
                                                                    ChartAlignment
                                                                        .center,
                                                                itemPadding: 2,
                                                              ),
                                                              series: <CircularSeries>[
                                                                DoughnutSeries<
                                                                    MapEntry<
                                                                        String,
                                                                        double>,
                                                                    String>(
                                                                  strokeWidth:
                                                                      15,
                                                                  innerRadius:
                                                                      '80%',
                                                                  dataSource: controller
                                                                      .categoryMapSmAvailableDouble
                                                                      .entries
                                                                      .toList(),
                                                                  xValueMapper:
                                                                      (MapEntry<String, double> data,
                                                                              _) =>
                                                                          data.key,
                                                                  yValueMapper:
                                                                      (MapEntry<String, double> data,
                                                                              _) =>
                                                                          data.value,
                                                                  pointColorMapper:
                                                                      (MapEntry<String, double>
                                                                              data,
                                                                          _) {
                                                                    var entriesList = controller
                                                                        .categoryMapSmAvailableDouble
                                                                        .entries
                                                                        .toList();
                                                                    int index = entriesList.indexWhere((entry) =>
                                                                        entry.key ==
                                                                            data
                                                                                .key &&
                                                                        entry.value ==
                                                                            data.value);
                                                                    var colorList =
                                                                        controller
                                                                            .getColorList();
                                                                    Color
                                                                        color =
                                                                        colorList[index %
                                                                            colorList.length];
                                                                    return color;
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Expanded(
                                                        flex: 2,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorValues
                                                                  .lightBlueColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
                                                                  blurRadius:
                                                                      6.0,
                                                                ),
                                                              ],
                                                            ),
                                                            height: 160,
                                                            child:
                                                                SfCircularChart(
                                                              title: ChartTitle(
                                                                text:
                                                                    "Stock Available/Consumption by Goods",
                                                                textStyle: Styles
                                                                    .black12,
                                                                alignment:
                                                                    ChartAlignment
                                                                        .near,
                                                              ),
                                                              tooltipBehavior:
                                                                  TooltipBehavior(
                                                                enable: true,
                                                                tooltipPosition:
                                                                    TooltipPosition
                                                                        .pointer,
                                                                builder: (dynamic
                                                                        data,
                                                                    dynamic
                                                                        point,
                                                                    dynamic
                                                                        series,
                                                                    int pointIndex,
                                                                    int seriesIndex) {
                                                                  var entry = controller
                                                                      .categoryMapSmConsumptionDouble
                                                                      .entries
                                                                      .toList()[pointIndex];
                                                                  double totalValue = controller
                                                                      .categoryMapSmConsumptionDouble
                                                                      .values
                                                                      .reduce((a,
                                                                              b) =>
                                                                          a +
                                                                          b);
                                                                  double
                                                                      percentage =
                                                                      (entry.value /
                                                                              totalValue) *
                                                                          100;
                                                                  return Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child: Text(
                                                                      '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                              legend: Legend(
                                                                isVisible: true,
                                                                position:
                                                                    LegendPosition
                                                                        .right,
                                                                overflowMode:
                                                                    LegendItemOverflowMode
                                                                        .wrap,
                                                                textStyle: Styles
                                                                    .black10,
                                                                alignment:
                                                                    ChartAlignment
                                                                        .center,
                                                                itemPadding: 2,
                                                              ),
                                                              series: <CircularSeries>[
                                                                DoughnutSeries<
                                                                    MapEntry<
                                                                        String,
                                                                        double>,
                                                                    String>(
                                                                  strokeWidth:
                                                                      15,
                                                                  innerRadius:
                                                                      '80%',
                                                                  dataSource: controller
                                                                      .categoryMapSmConsumptionDouble
                                                                      .entries
                                                                      .toList(),
                                                                  xValueMapper:
                                                                      (MapEntry<String, double> data,
                                                                              _) =>
                                                                          data.key,
                                                                  yValueMapper:
                                                                      (MapEntry<String, double> data,
                                                                              _) =>
                                                                          data.value,
                                                                  pointColorMapper:
                                                                      (MapEntry<String, double>
                                                                              data,
                                                                          _) {
                                                                    var entriesList = controller
                                                                        .categoryMapSmConsumptionDouble
                                                                        .entries
                                                                        .toList();
                                                                    int index = entriesList.indexWhere((entry) =>
                                                                        entry.key ==
                                                                            data
                                                                                .key &&
                                                                        entry.value ==
                                                                            data.value);
                                                                    var colorList =
                                                                        controller
                                                                            .getColorList();
                                                                    Color
                                                                        color =
                                                                        colorList[index %
                                                                            colorList.length];
                                                                    return color;
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                              }),
                                              Obx(() {
                                                return controller
                                                            .isToggleOn.value ==
                                                        false
                                                    ? Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(),
                                                          // padding: EdgeInsets.only(
                                                          //     left: 10, top: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorValues
                                                                .lightBlueColor,
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
                                                            ],
                                                          ),
                                                          height: 160,
                                                          child:
                                                              SfCircularChart(
                                                            title: ChartTitle(
                                                                text:
                                                                    "Stock Available/Consumption by Sites",
                                                                textStyle: Styles
                                                                    .black12,
                                                                alignment:
                                                                    ChartAlignment
                                                                        .near),
                                                            tooltipBehavior:
                                                                TooltipBehavior(
                                                              enable: true,
                                                              tooltipPosition:
                                                                  TooltipPosition
                                                                      .pointer,
                                                              builder: (dynamic
                                                                      data,
                                                                  dynamic point,
                                                                  dynamic
                                                                      series,
                                                                  int pointIndex,
                                                                  int seriesIndex) {
                                                                var entry = controller
                                                                        .categoryMapSmAvailableSiteDouble
                                                                        .entries
                                                                        .toList()[
                                                                    pointIndex];
                                                                double
                                                                    totalValue =
                                                                    controller
                                                                        .categoryMapSmAvailableSiteDouble
                                                                        .values
                                                                        .reduce((a,
                                                                                b) =>
                                                                            a +
                                                                            b);
                                                                double
                                                                    percentage =
                                                                    (entry.value /
                                                                            totalValue) *
                                                                        100;
                                                                return Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child: Text(
                                                                    '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            legend: Legend(
                                                              isVisible: true,
                                                              position:
                                                                  LegendPosition
                                                                      .right, // Position the legend to the right to stack vertically
                                                              overflowMode:
                                                                  LegendItemOverflowMode
                                                                      .wrap,
                                                              textStyle: Styles
                                                                  .black10,
                                                              alignment:
                                                                  ChartAlignment
                                                                      .center, // Align the legend items to the center
                                                              itemPadding:
                                                                  2, // Adjust the padding between legend items
                                                            ),
                                                            series: <CircularSeries>[
                                                              DoughnutSeries<
                                                                  MapEntry<
                                                                      String,
                                                                      double>,
                                                                  String>(
                                                                strokeWidth: 15,
                                                                innerRadius:
                                                                    '80%',
                                                                dataSource: controller
                                                                    .categoryMapSmAvailableSiteDouble
                                                                    .entries
                                                                    .toList(),
                                                                xValueMapper:
                                                                    (MapEntry<String, double>
                                                                                data,
                                                                            _) =>
                                                                        data.key,
                                                                yValueMapper:
                                                                    (MapEntry<String, double>
                                                                                data,
                                                                            _) =>
                                                                        data.value,
                                                                // dataLabelSettings:
                                                                //     DataLabelSettings(
                                                                //   isVisible: true,
                                                                //   labelPosition:
                                                                //       ChartDataLabelPosition
                                                                //           .outside,
                                                                //   useSeriesColor: true,
                                                                //   textStyle:
                                                                //       TextStyle(fontSize: 12),
                                                                // ),
                                                                pointColorMapper:
                                                                    (MapEntry<String,
                                                                                double>
                                                                            data,
                                                                        _) {
                                                                  var entriesList =
                                                                      controller
                                                                          .categoryMapSmAvailableSiteDouble
                                                                          .entries
                                                                          .toList();
                                                                  int index = entriesList.indexWhere((entry) =>
                                                                      entry.key ==
                                                                          data
                                                                              .key &&
                                                                      entry.value ==
                                                                          data.value);
                                                                  var colorList =
                                                                      controller
                                                                          .getColorList();
                                                                  Color color =
                                                                      colorList[
                                                                          index %
                                                                              colorList.length];
                                                                  return color;
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                            left: 10,
                                                          ),
                                                          // padding: EdgeInsets.only(
                                                          //     left: 10, top: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorValues
                                                                .lightBlueColor,
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
                                                            ],
                                                          ),
                                                          height: 160,
                                                          child:
                                                              SfCircularChart(
                                                            title: ChartTitle(
                                                                text:
                                                                    "Stock Available/Consumption by Sites",
                                                                textStyle: Styles
                                                                    .black12,
                                                                alignment:
                                                                    ChartAlignment
                                                                        .near),
                                                            tooltipBehavior:
                                                                TooltipBehavior(
                                                              enable: true,
                                                              tooltipPosition:
                                                                  TooltipPosition
                                                                      .pointer,
                                                              builder: (dynamic
                                                                      data,
                                                                  dynamic point,
                                                                  dynamic
                                                                      series,
                                                                  int pointIndex,
                                                                  int seriesIndex) {
                                                                var entry = controller
                                                                        .categoryMapSmConsumptionSiteDouble
                                                                        .entries
                                                                        .toList()[
                                                                    pointIndex];
                                                                double
                                                                    totalValue =
                                                                    controller
                                                                        .categoryMapSmConsumptionSiteDouble
                                                                        .values
                                                                        .reduce((a,
                                                                                b) =>
                                                                            a +
                                                                            b);
                                                                double
                                                                    percentage =
                                                                    (entry.value /
                                                                            totalValue) *
                                                                        100;
                                                                return Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child: Text(
                                                                    '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            legend: Legend(
                                                              isVisible: true,
                                                              position:
                                                                  LegendPosition
                                                                      .right, // Position the legend to the right to stack vertically
                                                              overflowMode:
                                                                  LegendItemOverflowMode
                                                                      .wrap,
                                                              textStyle: Styles
                                                                  .black10,
                                                              alignment:
                                                                  ChartAlignment
                                                                      .center, // Align the legend items to the center
                                                              itemPadding:
                                                                  2, // Adjust the padding between legend items
                                                            ),
                                                            series: <CircularSeries>[
                                                              DoughnutSeries<
                                                                  MapEntry<
                                                                      String,
                                                                      double>,
                                                                  String>(
                                                                strokeWidth: 15,
                                                                innerRadius:
                                                                    '80%',
                                                                dataSource: controller
                                                                    .categoryMapSmConsumptionSiteDouble
                                                                    .entries
                                                                    .toList(),
                                                                xValueMapper:
                                                                    (MapEntry<String, double>
                                                                                data,
                                                                            _) =>
                                                                        data.key,
                                                                yValueMapper:
                                                                    (MapEntry<String, double>
                                                                                data,
                                                                            _) =>
                                                                        data.value,
                                                                // dataLabelSettings:
                                                                //     DataLabelSettings(
                                                                //   isVisible: true,
                                                                //   labelPosition:
                                                                //       ChartDataLabelPosition
                                                                //           .outside,
                                                                //   useSeriesColor: true,
                                                                //   textStyle:
                                                                //       TextStyle(fontSize: 12),
                                                                // ),
                                                                pointColorMapper:
                                                                    (MapEntry<String,
                                                                                double>
                                                                            data,
                                                                        _) {
                                                                  var entriesList =
                                                                      controller
                                                                          .categoryMapSmConsumptionSiteDouble
                                                                          .entries
                                                                          .toList();
                                                                  int index = entriesList.indexWhere((entry) =>
                                                                      entry.key ==
                                                                          data
                                                                              .key &&
                                                                      entry.value ==
                                                                          data.value);
                                                                  var colorList =
                                                                      controller
                                                                          .getColorList();
                                                                  Color color =
                                                                      colorList[
                                                                          index %
                                                                              colorList.length];
                                                                  return color;
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                              }),
                                            ],
                                          ),
                                          // Dimens.boxHeight10,
                                          Dimens.boxHeight10,
                                          Expanded(
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                double screenWidth =
                                                    constraints.maxWidth;

                                                double getColumnWidth(
                                                    double defaultWidth) {
                                                  if (screenWidth < 600) {
                                                    return defaultWidth *
                                                        0.8; // Small screens
                                                  } else if (screenWidth <
                                                      1200) {
                                                    return defaultWidth *
                                                        0.9; // Medium screens
                                                  }
                                                  return defaultWidth; // Large screens
                                                }

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth: screenWidth,
                                                      maxWidth: screenWidth * 1,
                                                    ),
                                                    child: Container(
                                                      color: Color.fromARGB(
                                                          255, 245, 248, 250),
                                                      width: Get.width,
                                                      height: Get.height,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 0,
                                                                right: 0),
                                                        child: DataTable2(
                                                          headingRowHeight: 45,
                                                          dataRowHeight: 40,
                                                          columnSpacing: 12,
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
                                                              label: Text(
                                                                  'Site Name',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'GR No',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'GO No',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Status',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Product Name',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Requested Quantity',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'GR Date',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Order Quantity',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'GO Date',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Unit Amount',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Total Amount',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'GRN Date',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'GRN Quantity',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                            DataColumn2(
                                                              label: Text(
                                                                  'Action',
                                                                  style: Styles
                                                                      .blackBold14),
                                                            ),
                                                          ],
                                                          rows: List<
                                                              DataRow>.generate(
                                                            controller
                                                                    .dashboardSmList
                                                                    .value
                                                                    ?.cmDashboadDetails
                                                                    ?.item_list
                                                                    ?.length ??
                                                                0,
                                                            (index) => DataRow(
                                                              cells: [
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .facility_name
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(
                                                                    '${controller.dashboardSmList.value?.cmDashboadDetails?.item_list?[index].grNo.toString() ?? ''}')),
                                                                DataCell(Text(
                                                                    'GO${controller.dashboardSmList.value?.cmDashboadDetails?.item_list?[index].go_id.toString() ?? ''}')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .status_long ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .product_name ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .requested_qty
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .gr_date ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .ordered_qty
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .go_date
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .unit_amount
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .total_amount
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .grn_date ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .dashboardSmList
                                                                        .value
                                                                        ?.cmDashboadDetails
                                                                        ?.item_list?[
                                                                            index]
                                                                        .grn_qty
                                                                        .toString() ??
                                                                    '')),
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
                                                                            () {
                                                                          controller
                                                                              .clearStoreSmData();
                                                                          controller
                                                                              .clearStoreDatatype();

                                                                          int goId =
                                                                              controller.dashboardSmList.value?.cmDashboadDetails?.item_list?[index].go_id ?? 0;
                                                                          if (goId !=
                                                                              0) {
                                                                            Get.toNamed(
                                                                              Routes.receiveGoodsOrders,
                                                                              arguments: {
                                                                                'goId': goId,
                                                                                "goType": 1
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Dimens.box0,

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
                      controller.openFromDateToStartDatePicker = false;
                      controller.update(['dashboard']);

                      // Get.toNamed(
                      //   Routes.stockManagementGoodsOrdersScreen,
                      // );
                    },
                    onCancel: () {
                      controller.openFromDateToStartDatePicker = false;
                      controller.update(['dashboard']);
                    },
                  ),
                ),
            ],
          );
        });
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

class _ChartData {
  _ChartData(this.category, this.value);

  final String category;
  final double value;
}
