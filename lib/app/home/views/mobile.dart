import 'package:cmms/app/home/dashboard_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/dash_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';

class DashBoardHomeMobile extends StatefulWidget {
  DashBoardHomeMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardHomeMobile> createState() => _DashBoardHomeMobileState();
}

class _DashBoardHomeMobileState extends State<DashBoardHomeMobile>
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
                        Obx(
                          () => Row(
                            children: [
                              Container(
                                width: Get.width * .8,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DashCustomMultiSelectDialogField(
                                  title: 'Select Facility',
                                  initialValue: controller
                                      .homecontroller.facilityList
                                      .where((facility) => facility != null)
                                      .map((facility) => facility!.id)
                                      .toList(),
                                  items: controller.homecontroller.facilityList
                                      .where((facility) => facility != null)
                                      .map(
                                        (facility) => MultiSelectItem(
                                          facility!.id,
                                          facility.name ?? '',
                                        ),
                                      )
                                      .toList(),
                                  onConfirm: (selectedOptionsList) {
                                    controller.selectedMultiFacility(
                                        selectedOptionsList.cast<int>());
                                    print(
                                        'Equipment list ${controller.homecontroller.selectedFacilityIdList}');
                                  },
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.date_range),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['dashboard']);
                                },
                              ),
                            ],
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: TabBar(
                              controller: _tabController,
                              indicatorColor: Color(0xFF363A40),
                              isScrollable: true,
                              tabs: [
                                CustomTabBar(
                                  width: 100,
                                  label: 'All'.tr,
                                ),
                                CustomTabBar(
                                  // width: 100,

                                  label: 'Breakdown Maintenance'.tr,
                                  // icon: Icons.menu,
                                ),
                                CustomTabBar(
                                  // width: 100,

                                  label: 'Preventive Maintenance'.tr,
                                  // icon: Icons.account_tree_sharp,
                                ),
                                CustomTabBar(
                                  // width: 100,

                                  label: 'Module Cleaning'.tr,
                                  // icon: Icons.location_on,
                                ),
                                CustomTabBar(
                                  // width: 100,

                                  label: 'Incident Report'.tr,
                                  // icon: Icons.location_on,
                                ),
                                CustomTabBar(
                                  // width: 100,

                                  label: 'Stock Management'.tr,
                                  // icon: Icons.location_on,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              //alll..........................
                              Container(
                                margin: EdgeInsets.all(15),
                                height: Get.height,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              // margin: EdgeInsets.only(left: 20),
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
                                              height: 160,
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Overview",
                                                          style:
                                                              Styles.black14),
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
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "Total",
                                                                          style:
                                                                              Styles.black13,
                                                                        ),
                                                                        Spacer(),

                                                                        Text(
                                                                            '${controller.totalSum}'),
                                                                        //  '${dashbo?.module_name}'),
                                                                      ],
                                                                    ),
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Completed",
                                                                          style:
                                                                              Styles.black13,
                                                                        ),
                                                                        Spacer(),
                                                                        Text(
                                                                            '${controller.completedSum}'),
                                                                      ],
                                                                    ),
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Pending",
                                                                          style:
                                                                              Styles.black13,
                                                                        ),
                                                                        Spacer(),
                                                                        Text(
                                                                            '${controller.pendingSum}'),
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
                                                        (controller.totalSum
                                                            .value), //vercentage value: 0.6 for 60% (60/100 = 0.6)
                                                    center: Text(
                                                      '${((controller.completedSum.value) / (controller.totalSum.value) * 100).toStringAsFixed(1)}%',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                          Dimens.boxHeight10,
                                          Container(
                                            // margin: EdgeInsets.only(left: 10),
                                            padding: EdgeInsets.only(
                                                left: 10, top: 12),
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
                                            height: 160,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Schedule Compliance",
                                                    style: Styles.black14),
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
                                                                    size: 30,
                                                                    color: Colors
                                                                        .red),
                                                                SizedBox(
                                                                    width: 10),

                                                                Text(
                                                                  "WO on-time",
                                                                  style: Styles
                                                                      .black13,
                                                                ),

                                                                // Dimens
                                                                //     .boxWidth20,
                                                                SizedBox(
                                                                    width: 20),
                                                                // Spacer(),
                                                                Text(
                                                                  '${controller.woOnTimeSum.value}',
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            SizedBox(height: 5),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .pie_chart,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .blue),
                                                                SizedBox(
                                                                    width: 10),

                                                                Text(
                                                                  "WO delay",
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                                // Dimens
                                                                //     .boxWidth37,
                                                                SizedBox(
                                                                    width: 35),
                                                                // Spacer(),
                                                                Text(
                                                                  '${controller.woDelaySum.value}',
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            SizedBox(height: 5),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .pie_chart,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .green),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  "WO backlog",
                                                                  style: Styles
                                                                      .black13,
                                                                ),

                                                                // Dimens
                                                                //     .boxWidth20,
                                                                SizedBox(
                                                                    width: 20),
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
                                          Dimens.boxHeight10,
                                          Container(
                                            // margin: EdgeInsets.only(
                                            //     left: 10, right: 10),
                                            // padding: EdgeInsets.only(
                                            //     left: 10, top: 10),
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
                                            height: 160,
                                            child: SfCircularChart(
                                              title: ChartTitle(
                                                  text: "Category",
                                                  textStyle: Styles.black12,
                                                  alignment:
                                                      ChartAlignment.near),
                                              tooltipBehavior: TooltipBehavior(
                                                enable: true,
                                                tooltipPosition:
                                                    TooltipPosition.pointer,
                                                builder: (dynamic data,
                                                    dynamic point,
                                                    dynamic series,
                                                    int pointIndex,
                                                    int seriesIndex) {
                                                  var entry = controller
                                                      .getDataMap.entries
                                                      .toList()[pointIndex];
                                                  double totalValue = controller
                                                      .getDataMap.values
                                                      .reduce((a, b) => a + b);
                                                  double percentage =
                                                      (entry.value /
                                                              totalValue) *
                                                          100;
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(
                                                      '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  );
                                                },
                                              ),
                                              legend: Legend(
                                                isVisible: true,
                                                position: LegendPosition
                                                    .right, // Position the legend to the right to stack vertically
                                                overflowMode:
                                                    LegendItemOverflowMode.wrap,
                                                textStyle: Styles.black10,
                                                alignment: ChartAlignment
                                                    .center, // Align the legend items to the center
                                                itemPadding:
                                                    2, // Adjust the padding between legend items
                                              ),
                                              series: <CircularSeries>[
                                                DoughnutSeries<
                                                    MapEntry<String, double>,
                                                    String>(
                                                  strokeWidth: 25,
                                                  innerRadius: '80%',
                                                  dataSource: controller
                                                      .getDataMap.entries
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
                                                      (MapEntry<String, double>
                                                              data,
                                                          _) {
                                                    var entriesList = controller
                                                        .getDataMap.entries
                                                        .toList();
                                                    int index = entriesList
                                                        .indexWhere((entry) =>
                                                            entry.key ==
                                                                data.key &&
                                                            entry.value ==
                                                                data.value);
                                                    var colorList = controller
                                                        .getWoColorList();
                                                    Color color = colorList[
                                                        index %
                                                            colorList.length];
                                                    return color;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Dimens.boxHeight10,
                                          Container(
                                              width: Get.width,
                                              // padding: EdgeInsets.only(top: 10),
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
                                              height: 160,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // Dimens.boxHeight5,
                                                  Text("Low Stock Items",
                                                      style: Styles.black15),
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
                                                      style: Styles.black15),
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
                                          SizedBox(height: 10),
                                          Container(
                                            height: 400,
                                            child: ListView.builder(
                                                //physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    controller.allItems != null
                                                        ? controller
                                                            .allItems.length
                                                        : 0,
                                                itemBuilder: (context, index) {
                                                  final alldetail =
                                                      (controller.allItems !=
                                                              null)
                                                          ? controller
                                                              .allItems[index]
                                                          : Itemlist();
                                                  return GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .clearStoreData();
                                                      controller
                                                          .clearStoreDatatype();
                                                      var _taskId = controller
                                                              .dashboardPmList
                                                              .value
                                                              ?.cmDashboadDetails
                                                              ?.item_list![
                                                                  index]
                                                              .wo_number ??
                                                          0;
                                                      // Get.toNamed(Routes.pmTaskView,
                                                      //     arguments: {'pmTaskId': _taskId});
                                                    },
                                                    child: Card(
                                                      color: Colors
                                                          .lightBlue.shade50,
                                                      elevation: 10,
                                                      shadowColor:
                                                          Colors.black87,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(children: [
                                                                Text(
                                                                  'Site Name: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    '${alldetail?.facility_name}'
                                                                    '',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  'WO Number: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    alldetail
                                                                            ?.wo_number ??
                                                                        '',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),

                                                              Row(children: [
                                                                Text(
                                                                  'WO Description: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "${alldetail?.wo_decription ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),

                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Status: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${alldetail?.status_long ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Asset Category: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    "${alldetail?.asset_category ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),

                                                              // Row(children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Asset Name: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${alldetail?.asset_name ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              // Spacer(),
                                                              // Expanded(
                                                              //   child: Column(
                                                              //     crossAxisAlignment:
                                                              //         CrossAxisAlignment
                                                              //             .start,
                                                              //     children: [
                                                              //       Text(
                                                              //         'Start Date',
                                                              //         style: const TextStyle(
                                                              //             color: ColorValues
                                                              //                 .blackColor,
                                                              //             fontWeight:
                                                              //                 FontWeight.w500),
                                                              //       ),
                                                              //       Text(
                                                              //         "${bmdetail?.start_date ?? ''}",
                                                              //         style:
                                                              //             const TextStyle(
                                                              //           color: ColorValues
                                                              //               .navyBlueColor,
                                                              //           fontWeight:
                                                              //               FontWeight
                                                              //                   .bold,
                                                              //         ),
                                                              //       )
                                                              //     ],
                                                              //   ),
                                                              // )

                                                              // ]),
                                                            ]),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                    ],
                                  ),
                                ),
                              ),

                              // //bm............................
                              Container(
                                margin: EdgeInsets.all(15),
                                height: Get.height,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              // margin: EdgeInsets.only(left: 20),
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
                                              height: 160,
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Overview",
                                                          style:
                                                              Styles.black14),
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
                                                                          MainAxisAlignment
                                                                              .center,
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
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
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
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
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
                                                              FontWeight.bold,
                                                          fontSize: 20.0),
                                                    ), //center text, you can set Icon as well
                                                    // footer: Text(
                                                    //   "Order this Month",
                                                    //   style: Styles.black13,
                                                    // ), //footer text
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
                                          SizedBox(height: 10),
                                          Container(
                                            // margin: EdgeInsets.only(left: 10),
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
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
                                            height: 160,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Schedule Compliance",
                                                    style: Styles.black14),
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
                                                                    size: 30,
                                                                    color: Colors
                                                                        .red),
                                                                SizedBox(
                                                                    width: 10),

                                                                Text(
                                                                  "WO on-time",
                                                                  style: Styles
                                                                      .black13,
                                                                ),

                                                                // Dimens
                                                                //     .boxWidth20,
                                                                SizedBox(
                                                                    width: 20),
                                                                // Spacer(),
                                                                Text(
                                                                  '${controller.woOnTimeSum.value}',
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            SizedBox(height: 5),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .pie_chart,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .blue),
                                                                SizedBox(
                                                                    width: 10),

                                                                Text(
                                                                  "WO delay",
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                                // Dimens
                                                                //     .boxWidth37,
                                                                SizedBox(
                                                                    width: 35),
                                                                // Spacer(),
                                                                Text(
                                                                  '${controller.woDelaySum.value}',
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .pie_chart,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .green),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  "WO backlog",
                                                                  style: Styles
                                                                      .black13,
                                                                ),

                                                                // Dimens
                                                                //     .boxWidth20,
                                                                SizedBox(
                                                                    width: 20),
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
                                          SizedBox(height: 10),
                                          Container(
                                            // margin: EdgeInsets.only(
                                            //     left: 10, right: 10),
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
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
                                            height: 160,
                                            child: SfCircularChart(
                                              title: ChartTitle(
                                                  text: "Category",
                                                  textStyle: Styles.black12,
                                                  alignment:
                                                      ChartAlignment.near),
                                              tooltipBehavior: TooltipBehavior(
                                                enable: true,
                                                tooltipPosition:
                                                    TooltipPosition.pointer,
                                                builder: (dynamic data,
                                                    dynamic point,
                                                    dynamic series,
                                                    int pointIndex,
                                                    int seriesIndex) {
                                                  var entry = controller
                                                      .categoryMapBMDouble
                                                      .entries
                                                      .toList()[pointIndex];
                                                  double totalValue = controller
                                                      .categoryMapBMDouble
                                                      .values
                                                      .reduce((a, b) => a + b);
                                                  double percentage =
                                                      (entry.value /
                                                              totalValue) *
                                                          100;
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(
                                                      '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  );
                                                },
                                              ),
                                              legend: Legend(
                                                isVisible: true,
                                                position: LegendPosition
                                                    .right, // Position the legend to the right to stack vertically
                                                overflowMode:
                                                    LegendItemOverflowMode.wrap,
                                                textStyle: Styles.black10,
                                                alignment: ChartAlignment
                                                    .center, // Align the legend items to the center
                                                itemPadding:
                                                    2, // Adjust the padding between legend items
                                              ),
                                              series: <CircularSeries>[
                                                DoughnutSeries<
                                                    MapEntry<String, double>,
                                                    String>(
                                                  strokeWidth: 15,
                                                  innerRadius: '80%',
                                                  dataSource: controller
                                                      .categoryMapBMDouble
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
                                                      (MapEntry<String, double>
                                                              data,
                                                          _) {
                                                    var entriesList = controller
                                                        .categoryMapBMDouble
                                                        .entries
                                                        .toList();
                                                    int index = entriesList
                                                        .indexWhere((entry) =>
                                                            entry.key ==
                                                                data.key &&
                                                            entry.value ==
                                                                data.value);
                                                    var colorList = controller
                                                        .getColorList();
                                                    Color color = colorList[
                                                        index %
                                                            colorList.length];
                                                    return color;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                              width: Get.width,
                                              //  padding: EdgeInsets.only(top: 10),
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
                                              height: 160,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("Low Stock Items",
                                                      style: Styles.black15),
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
                                                      style: Styles.black15),
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
                                        ],
                                      ),
                                      // Dimens.boxHeight10,
                                      SizedBox(height: 10),
                                      Container(
                                        height: 400,
                                        child: ListView.builder(
                                            //physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                        .dashboardBmList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list !=
                                                    null
                                                ? controller
                                                    .dashboardBmList
                                                    .value
                                                    ?.cmDashboadDetails
                                                    ?.item_list!
                                                    .length
                                                : 0,
                                            itemBuilder: (context, index) {
                                              final bmdetail = (controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list !=
                                                      null)
                                                  ? controller
                                                      .dashboardBmList
                                                      .value
                                                      ?.cmDashboadDetails
                                                      ?.item_list![index]
                                                  : Itemlist();
                                              return GestureDetector(
                                                onTap: () {
                                                  controller.clearStoreData();
                                                  controller
                                                      .clearStoreDatatype();
                                                  var _taskId = controller
                                                          .dashboardBmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list![index]
                                                          .wo_number ??
                                                      0;
                                                  // Get.toNamed(Routes.pmTaskView,
                                                  //     arguments: {'pmTaskId': _taskId});
                                                },
                                                child: Card(
                                                  color:
                                                      Colors.lightBlue.shade50,
                                                  elevation: 10,
                                                  shadowColor: Colors.black87,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              'Site Name: ',
                                                              style: const TextStyle(
                                                                  color: ColorValues
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${bmdetail?.facility_name}'
                                                                '',
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              'WO Number: ',
                                                              style: const TextStyle(
                                                                  color: ColorValues
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                bmdetail?.wo_number ??
                                                                    '',
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            )
                                                          ]),

                                                          Row(children: [
                                                            Text(
                                                              'WO Description: ',
                                                              style: const TextStyle(
                                                                  color: ColorValues
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                "${bmdetail?.wo_decription ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            )
                                                          ]),

                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Status: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                "${bmdetail?.status_long ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Asset Category: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Text(
                                                                "${bmdetail?.asset_category ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),

                                                          // Row(children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Asset Name: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                "${bmdetail?.asset_name ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          // Spacer(),
                                                          // Expanded(
                                                          //   child: Column(
                                                          //     crossAxisAlignment:
                                                          //         CrossAxisAlignment
                                                          //             .start,
                                                          //     children: [
                                                          //       Text(
                                                          //         'Start Date',
                                                          //         style: const TextStyle(
                                                          //             color: ColorValues
                                                          //                 .blackColor,
                                                          //             fontWeight:
                                                          //                 FontWeight.w500),
                                                          //       ),
                                                          //       Text(
                                                          //         "${bmdetail?.start_date ?? ''}",
                                                          //         style:
                                                          //             const TextStyle(
                                                          //           color: ColorValues
                                                          //               .navyBlueColor,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .bold,
                                                          //         ),
                                                          //       )
                                                          //     ],
                                                          //   ),
                                                          // )

                                                          // ]),
                                                        ]),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // //pm......................

                              Container(
                                margin: EdgeInsets.all(15),
                                height: Get.height,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              // margin: EdgeInsets.only(left: 20),
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
                                              height: 160,
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
                                                                          MainAxisAlignment
                                                                              .center,
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
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
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
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
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
                                                              FontWeight.bold,
                                                          fontSize: 20.0),
                                                    ), //center text, you can set Icon as well
                                                    // footer: Text(
                                                    //   "Order this Month",
                                                    //   style: Styles.black13,
                                                    // ), //footer text
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
                                          Dimens.boxHeight10,
                                          Container(
                                            // margin: EdgeInsets.only(left: 10),
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
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
                                            height: 160,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Schedule Compliance",
                                                    style: Styles.black15),
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
                                                                    size: 30,
                                                                    color: Colors
                                                                        .red),
                                                                SizedBox(
                                                                    width: 10),

                                                                Text(
                                                                  "WO on-time",
                                                                  style: Styles
                                                                      .black13,
                                                                ),

                                                                // Dimens
                                                                //     .boxWidth20,
                                                                SizedBox(
                                                                    width: 20),
                                                                // Spacer(),
                                                                Text(
                                                                  '${controller.woOnTimeSum.value}',
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            SizedBox(height: 5),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .pie_chart,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .blue),
                                                                SizedBox(
                                                                    width: 10),

                                                                Text(
                                                                  "WO delay",
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                                // Dimens
                                                                //     .boxWidth37,
                                                                SizedBox(
                                                                    width: 35),
                                                                // Spacer(),
                                                                Text(
                                                                  '${controller.woDelaySum.value}',
                                                                  style: Styles
                                                                      .black13,
                                                                ),
                                                              ],
                                                            ),
                                                            // Dimens.boxHeight5,
                                                            SizedBox(height: 5),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .pie_chart,
                                                                    size: 30,
                                                                    color: Colors
                                                                        .green),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  "WO backlog",
                                                                  style: Styles
                                                                      .black13,
                                                                ),

                                                                // Dimens
                                                                //     .boxWidth20,
                                                                SizedBox(
                                                                    width: 20),
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
                                          Dimens.boxHeight10,
                                          Container(
                                            // margin: EdgeInsets.only(
                                            //     left: 10, right: 10),
                                            // padding: EdgeInsets.only(
                                            //     left: 10, top: 10),
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
                                            height: 160,
                                            child: SfCircularChart(
                                              title: ChartTitle(
                                                  text: "Category",
                                                  textStyle: Styles.black12,
                                                  alignment:
                                                      ChartAlignment.near),
                                              tooltipBehavior: TooltipBehavior(
                                                enable: true,
                                                tooltipPosition:
                                                    TooltipPosition.pointer,
                                                builder: (dynamic data,
                                                    dynamic point,
                                                    dynamic series,
                                                    int pointIndex,
                                                    int seriesIndex) {
                                                  var entry = controller
                                                      .categoryMapPMDouble
                                                      .entries
                                                      .toList()[pointIndex];
                                                  double totalValue = controller
                                                      .categoryMapPMDouble
                                                      .values
                                                      .reduce((a, b) => a + b);
                                                  double percentage =
                                                      (entry.value /
                                                              totalValue) *
                                                          100;
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(
                                                      '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  );
                                                },
                                              ),
                                              legend: Legend(
                                                isVisible: true,
                                                position: LegendPosition
                                                    .right, // Position the legend to the right to stack vertically
                                                overflowMode:
                                                    LegendItemOverflowMode.wrap,
                                                textStyle: Styles.black10,
                                                alignment: ChartAlignment
                                                    .center, // Align the legend items to the center
                                                itemPadding:
                                                    2, // Adjust the padding between legend items
                                              ),
                                              series: <CircularSeries>[
                                                DoughnutSeries<
                                                    MapEntry<String, double>,
                                                    String>(
                                                  strokeWidth: 25,
                                                  innerRadius: '80%',
                                                  dataSource: controller
                                                      .categoryMapPMDouble
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
                                                      (MapEntry<String, double>
                                                              data,
                                                          _) {
                                                    var entriesList = controller
                                                        .categoryMapPMDouble
                                                        .entries
                                                        .toList();
                                                    int index = entriesList
                                                        .indexWhere((entry) =>
                                                            entry.key ==
                                                                data.key &&
                                                            entry.value ==
                                                                data.value);
                                                    var colorList = controller
                                                        .getColorList();
                                                    Color color = colorList[
                                                        index %
                                                            colorList.length];
                                                    return color;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Dimens.boxHeight10,
                                          Container(
                                              width: Get.width,
                                              padding: EdgeInsets.only(top: 10),
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
                                              height: 160,
                                              child: Column(
                                                children: [
                                                  Text("Low Stock Items",
                                                      style: Styles.black15),
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
                                                      style: Styles.black15),
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
                                          SizedBox(height: 10),
                                          Container(
                                            height: 400,
                                            child: ListView.builder(
                                                //physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: controller
                                                            .dashboardPmList
                                                            .value
                                                            ?.cmDashboadDetails
                                                            ?.item_list !=
                                                        null
                                                    ? controller
                                                        .dashboardPmList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list!
                                                        .length
                                                    : 0,
                                                itemBuilder: (context, index) {
                                                  final pmdetail = (controller
                                                              .dashboardPmList
                                                              .value
                                                              ?.cmDashboadDetails
                                                              ?.item_list !=
                                                          null)
                                                      ? controller
                                                          .dashboardPmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list![index]
                                                      : Itemlist();
                                                  return GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .clearStoreData();
                                                      controller
                                                          .clearStoreDatatype();
                                                      var _taskId = controller
                                                              .dashboardPmList
                                                              .value
                                                              ?.cmDashboadDetails
                                                              ?.item_list![
                                                                  index]
                                                              .wo_number ??
                                                          0;
                                                      // Get.toNamed(Routes.pmTaskView,
                                                      //     arguments: {'pmTaskId': _taskId});
                                                    },
                                                    child: Card(
                                                      color: Colors
                                                          .lightBlue.shade50,
                                                      elevation: 10,
                                                      shadowColor:
                                                          Colors.black87,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(children: [
                                                                Text(
                                                                  'Site Name: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    '${pmdetail?.facility_name}'
                                                                    '',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  'WO Number: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    pmdetail?.wo_number ??
                                                                        '',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),

                                                              Row(children: [
                                                                Text(
                                                                  'WO Description: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "${pmdetail?.wo_decription ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),

                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Status: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${pmdetail?.status_long ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Asset Category: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    "${pmdetail?.asset_category ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),

                                                              // Row(children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Asset Name: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${pmdetail?.asset_name ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              // Spacer(),
                                                              // Expanded(
                                                              //   child: Column(
                                                              //     crossAxisAlignment:
                                                              //         CrossAxisAlignment
                                                              //             .start,
                                                              //     children: [
                                                              //       Text(
                                                              //         'Start Date',
                                                              //         style: const TextStyle(
                                                              //             color: ColorValues
                                                              //                 .blackColor,
                                                              //             fontWeight:
                                                              //                 FontWeight.w500),
                                                              //       ),
                                                              //       Text(
                                                              //         "${bmdetail?.start_date ?? ''}",
                                                              //         style:
                                                              //             const TextStyle(
                                                              //           color: ColorValues
                                                              //               .navyBlueColor,
                                                              //           fontWeight:
                                                              //               FontWeight
                                                              //                   .bold,
                                                              //         ),
                                                              //       )
                                                              //     ],
                                                              //   ),
                                                              // )

                                                              // ]),
                                                            ]),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                      // Dimens.boxHeight10,
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),

                              // // mc......................
                              Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Data Coming Soon...."),
                                ],
                              )),

                              // ///ir...............................

                              Container(
                                margin: EdgeInsets.all(15),
                                height: Get.height,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              // margin: EdgeInsets.only(left: 20),
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
                                              height: 160,
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
                                                                          MainAxisAlignment
                                                                              .center,
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
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
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
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
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
                                                              FontWeight.bold,
                                                          fontSize: 20.0),
                                                    ), //center text, you can set Icon as well
                                                    // footer: Text(
                                                    //   "Order this Month",
                                                    //   style: Styles.black13,
                                                    // ), //footer text
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
                                          Dimens.boxHeight10,
                                          Container(
                                            // margin: EdgeInsets.only(
                                            //     left: 10, right: 10),
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
                                            height: 160,
                                            child: SfCartesianChart(
                                              tooltipBehavior: TooltipBehavior(
                                                enable: true,
                                                tooltipPosition:
                                                    TooltipPosition.pointer,
                                                builder: (dynamic data,
                                                    dynamic point,
                                                    dynamic series,
                                                    int pointIndex,
                                                    int seriesIndex) {
                                                  var entry = controller
                                                      .categoryMapIRDouble
                                                      .entries
                                                      .toList()[pointIndex];
                                                  double totalValue = controller
                                                      .categoryMapIRDouble
                                                      .values
                                                      .reduce((a, b) => a + b);
                                                  double percentage =
                                                      (entry.value /
                                                              totalValue) *
                                                          100;
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Text(
                                                      '${entry.key}: ${entry.value.toStringAsFixed(0)} (${percentage.toStringAsFixed(2)}%)',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  );
                                                },
                                              ),
                                              legend: Legend(
                                                isVisible: true,
                                                position: LegendPosition
                                                    .right, // Position the legend to the right to stack vertically
                                                overflowMode:
                                                    LegendItemOverflowMode.wrap,
                                                textStyle: Styles.black10,
                                                alignment: ChartAlignment
                                                    .center, // Align the legend items to the center
                                                itemPadding:
                                                    2, // Adjust the padding between legend items
                                              ),
                                              primaryXAxis: CategoryAxis(),
                                              primaryYAxis: NumericAxis(),
                                              series: <CartesianSeries>[
                                                ColumnSeries<
                                                    MapEntry<String, double>,
                                                    String>(
                                                  dataSource: controller
                                                      .categoryMapIRDouble
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
                                                  pointColorMapper:
                                                      (MapEntry<String, double>
                                                              data,
                                                          _) {
                                                    var entriesList = controller
                                                        .categoryMapIRDouble
                                                        .entries
                                                        .toList();
                                                    int index = entriesList
                                                        .indexWhere((entry) =>
                                                            entry.key ==
                                                                data.key &&
                                                            entry.value ==
                                                                data.value);
                                                    var colorList = controller
                                                        .getColorIrList();
                                                    Color color = colorList[
                                                        index %
                                                            colorList.length];
                                                    return color;
                                                  },
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            height: 400,
                                            child: ListView.builder(
                                                //physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: controller
                                                            .dashboardIrList
                                                            .value
                                                            ?.cmDashboadDetails
                                                            ?.item_list !=
                                                        null
                                                    ? controller
                                                        .dashboardIrList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list!
                                                        .length
                                                    : 0,
                                                itemBuilder: (context, index) {
                                                  final irdetail = (controller
                                                              .dashboardIrList
                                                              .value
                                                              ?.cmDashboadDetails
                                                              ?.item_list !=
                                                          null)
                                                      ? controller
                                                          .dashboardIrList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list![index]
                                                      : Itemlist();
                                                  return GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .clearStoreData();
                                                      controller
                                                          .clearStoreDatatype();
                                                      var _taskId = controller
                                                              .dashboardIrList
                                                              .value
                                                              ?.cmDashboadDetails
                                                              ?.item_list![
                                                                  index]
                                                              .wo_number ??
                                                          0;
                                                      // Get.toNamed(Routes.pmTaskView,
                                                      //     arguments: {'pmTaskId': _taskId});
                                                    },
                                                    child: Card(
                                                      color: Colors
                                                          .lightBlue.shade50,
                                                      elevation: 10,
                                                      shadowColor:
                                                          Colors.black87,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(children: [
                                                                Text(
                                                                  'ID: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    '${irdetail?.wo_number}'
                                                                    '',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]),
                                                              Row(//
                                                                  children: [
                                                                Text(
                                                                  'Title: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    irdetail?.title ??
                                                                        '',
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),
                                                              Row(children: [
                                                                Text(
                                                                  'Description: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "${irdetail?.wo_decription ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),
                                                              //   Row(children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Type Of Incident: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${irdetail?.type_of_incident ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              //  Spacer(),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Location: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    "${irdetail?.location_of_incident ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              // ]),
                                                              // Row(children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Incident Date & Time: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${irdetail?.incident_datetime ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Restoration Date & Time: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${irdetail?.restoration_datetime ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                      // Dimens.boxHeight10,
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),

                              // //sm.................................

                              Container(
                                margin: EdgeInsets.all(15),
                                height: Get.height,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      _isTaskbarVisible
                                          ? Row(
                                              children: [
                                                Spacer(),
                                                Text("Available"),
                                                Obx(
                                                  () => CustomSwitchTroggle(
                                                      value: controller
                                                          .isToggleOn.value,
                                                      onChanged: (value) {
                                                        controller.toggle();
                                                      }),
                                                ),
                                                Text("Consumption"),
                                                SizedBox(width: 10),
                                              ],
                                            )
                                          : Dimens.box0,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              // margin: EdgeInsets.only(left: 20),
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
                                              height: 160,
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
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "GR",
                                                                          style:
                                                                              Styles.black13,
                                                                        ),
                                                                        Spacer(),

                                                                        Text(
                                                                            '${controller.dashboardSmList.value?.cmDashboadDetails?.total}'),
                                                                        //  '${dashbo?.module_name}'),
                                                                      ],
                                                                    ),
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "GO Raised",
                                                                          style:
                                                                              Styles.black13,
                                                                        ),
                                                                        Spacer(),
                                                                        Text(
                                                                            '${controller.dashboardSmList.value?.cmDashboadDetails?.completed}'),
                                                                      ],
                                                                    ),
                                                                    // Dimens
                                                                    //     .boxHeight5,
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "GO Pending",
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
                                                              FontWeight.bold,
                                                          fontSize: 20.0),
                                                    ), //center text, you can set Icon as well
                                                    // footer: Text(
                                                    //   "Order this Month",
                                                    //   style: Styles.black13,
                                                    // ), //footer text
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
                                          Dimens.boxHeight10,
                                          Container(
                                              // margin: EdgeInsets.only(
                                              //     left: 10, right: 10),
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
                                              height: 160,
                                              child: SfCartesianChart(
                                                tooltipBehavior:
                                                    TooltipBehavior(
                                                  enable: true,
                                                  tooltipPosition:
                                                      TooltipPosition.pointer,
                                                  builder: (dynamic data,
                                                      dynamic point,
                                                      dynamic series,
                                                      int pointIndex,
                                                      int seriesIndex) {
                                                    var entry = controller
                                                        .stockOverviewmap
                                                        .entries
                                                        .toList()[pointIndex];
                                                    double totalValue =
                                                        controller
                                                            .stockOverviewmap
                                                            .values
                                                            .reduce((a, b) =>
                                                                a + b);
                                                    double percentage =
                                                        (entry.value /
                                                                totalValue) *
                                                            100;
                                                    return Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
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
                                                  isVisible:
                                                      false, // Hide the legend
                                                  position:
                                                      LegendPosition.right,
                                                  overflowMode:
                                                      LegendItemOverflowMode
                                                          .wrap,
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10),
                                                  alignment:
                                                      ChartAlignment.center,
                                                  itemPadding: 2,
                                                ),
                                                primaryXAxis: CategoryAxis(),
                                                primaryYAxis: NumericAxis(),
                                                series: <CartesianSeries>[
                                                  WaterfallSeries<
                                                      MapEntry<String, double>,
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
                                                    pointColorMapper: (MapEntry<
                                                                String, double>
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
                                                                  data.key &&
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
                                                            Radius.circular(5)),
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
                                          Dimens.boxHeight10,
                                          Obx(() {
                                            return controller
                                                        .isToggleOn.value ==
                                                    false
                                                ? SingleChildScrollView(
                                                    child: Container(
                                                      // margin: EdgeInsets.only(
                                                      //     left: 10, right: 10),
                                                      decoration: BoxDecoration(
                                                        color: ColorValues
                                                            .lightBlueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.0, 1.0),
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      height: 160,
                                                      child: SfCircularChart(
                                                        title: ChartTitle(
                                                          text:
                                                              "Stock Available/Consumption by Goods",
                                                          textStyle:
                                                              Styles.black12,
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
                                                              dynamic point,
                                                              dynamic series,
                                                              int pointIndex,
                                                              int seriesIndex) {
                                                            var entry = controller
                                                                    .categoryMapSmAvailableDouble
                                                                    .entries
                                                                    .toList()[
                                                                pointIndex];
                                                            double totalValue =
                                                                controller
                                                                    .categoryMapSmAvailableDouble
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
                                                                  EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .black,
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
                                                          position:
                                                              LegendPosition
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
                                                                .categoryMapSmAvailableDouble
                                                                .entries
                                                                .toList(),
                                                            xValueMapper:
                                                                (MapEntry<String,
                                                                                double>
                                                                            data,
                                                                        _) =>
                                                                    data.key,
                                                            yValueMapper:
                                                                (MapEntry<String,
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
                                                  )
                                                : SingleChildScrollView(
                                                    child: Container(
                                                      // margin: EdgeInsets.only(
                                                      //     left: 10, right: 10),
                                                      decoration: BoxDecoration(
                                                        color: ColorValues
                                                            .lightBlueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(
                                                                0.0, 1.0),
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      height: 160,
                                                      child: SfCircularChart(
                                                        title: ChartTitle(
                                                          text:
                                                              "Stock Available/Consumption by Goods",
                                                          textStyle:
                                                              Styles.black12,
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
                                                              dynamic point,
                                                              dynamic series,
                                                              int pointIndex,
                                                              int seriesIndex) {
                                                            var entry = controller
                                                                    .categoryMapSmConsumptionDouble
                                                                    .entries
                                                                    .toList()[
                                                                pointIndex];
                                                            double totalValue =
                                                                controller
                                                                    .categoryMapSmConsumptionDouble
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
                                                                  EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .black,
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
                                                          position:
                                                              LegendPosition
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
                                                                .categoryMapSmConsumptionDouble
                                                                .entries
                                                                .toList(),
                                                            xValueMapper:
                                                                (MapEntry<String,
                                                                                double>
                                                                            data,
                                                                        _) =>
                                                                    data.key,
                                                            yValueMapper:
                                                                (MapEntry<String,
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
                                                  );
                                          }),
                                          Dimens.boxHeight10,
                                          Obx(() {
                                            return controller
                                                        .isToggleOn.value ==
                                                    false
                                                ? Container(
                                                    // margin: EdgeInsets.only(
                                                    //     left: 10, right: 10),
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
                                                          text:
                                                              "Stock Available/Consumption by Sites",
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
                                                              .categoryMapSmAvailableSiteDouble
                                                              .entries
                                                              .toList()[pointIndex];
                                                          double totalValue =
                                                              controller
                                                                  .categoryMapSmAvailableSiteDouble
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
                                                            .right, // Position the legend to the right to stack vertically
                                                        overflowMode:
                                                            LegendItemOverflowMode
                                                                .wrap,
                                                        textStyle:
                                                            Styles.black10,
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
                                                              .categoryMapSmAvailableSiteDouble
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
                                                                    .categoryMapSmAvailableSiteDouble
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
                                                  )
                                                : Container(
                                                    // margin: EdgeInsets.only(
                                                    //     left: 10, right: 10),
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
                                                          text:
                                                              "Stock Available/Consumption by Sites",
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
                                                              .categoryMapSmConsumptionSiteDouble
                                                              .entries
                                                              .toList()[pointIndex];
                                                          double totalValue =
                                                              controller
                                                                  .categoryMapSmConsumptionSiteDouble
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
                                                            .right, // Position the legend to the right to stack vertically
                                                        overflowMode:
                                                            LegendItemOverflowMode
                                                                .wrap,
                                                        textStyle:
                                                            Styles.black10,
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
                                                              .categoryMapSmConsumptionSiteDouble
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
                                                                    .categoryMapSmConsumptionSiteDouble
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
                                                  );
                                          }),
                                        ],
                                      ),
                                      // Dimens.boxHeight10,
                                      SizedBox(height: 10),
                                      Container(
                                        height: 400,
                                        child: ListView.builder(
                                            //physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                        .dashboardSmList
                                                        .value
                                                        ?.cmDashboadDetails
                                                        ?.item_list !=
                                                    null
                                                ? controller
                                                    .dashboardSmList
                                                    .value
                                                    ?.cmDashboadDetails
                                                    ?.item_list!
                                                    .length
                                                : 0,
                                            itemBuilder: (context, index) {
                                              final smdetail = (controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list !=
                                                      null)
                                                  ? controller
                                                      .dashboardSmList
                                                      .value
                                                      ?.cmDashboadDetails
                                                      ?.item_list![index]
                                                  : Itemlist();
                                              return GestureDetector(
                                                onTap: () {
                                                  controller.clearStoreData();
                                                  controller
                                                      .clearStoreDatatype();
                                                  var _taskId = controller
                                                          .dashboardSmList
                                                          .value
                                                          ?.cmDashboadDetails
                                                          ?.item_list![index]
                                                          .wo_number ??
                                                      0;
                                                  // Get.toNamed(Routes.pmTaskView,
                                                  //     arguments: {'pmTaskId': _taskId});
                                                },
                                                child: Card(
                                                  color:
                                                      Colors.lightBlue.shade50,
                                                  elevation: 10,
                                                  shadowColor: Colors.black87,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              'Site Name: ',
                                                              style: const TextStyle(
                                                                  color: ColorValues
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${smdetail?.facility_name}'
                                                                '',
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                          Row(children: [
                                                            Text(
                                                              'GR No:',
                                                              style: const TextStyle(
                                                                  color: ColorValues
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "${smdetail?.grNo ?? ''}",
                                                              style:
                                                                  const TextStyle(
                                                                color: ColorValues
                                                                    .navyBlueColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              'GO No',
                                                              style: const TextStyle(
                                                                  color: ColorValues
                                                                      .blackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "GO${smdetail?.go_id ?? ''}",
                                                              style:
                                                                  const TextStyle(
                                                                color: ColorValues
                                                                    .navyBlueColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )
                                                          ]),

                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Status: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                "${smdetail?.status_long ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),

                                                          Container(
                                                            width: Get.width,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Product Name: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "${smdetail?.product_name ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          // Row(children: [
                                                          Row(children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'GR Date: ',
                                                                  style: const TextStyle(
                                                                      color: ColorValues
                                                                          .blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                Text(
                                                                  "${smdetail?.gr_date ?? ''}",
                                                                  style:
                                                                      const TextStyle(
                                                                    color: ColorValues
                                                                        .navyBlueColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'GO Date: ',
                                                                    style: const TextStyle(
                                                                        color: ColorValues
                                                                            .blackColor,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    "${smdetail?.go_date ?? ''}",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: ColorValues
                                                                          .navyBlueColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ]),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Requested Quantity: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "${smdetail?.requested_qty ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                'Order Quantity: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                "${smdetail?.ordered_qty ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),

                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Unit Amount: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                "${smdetail?.unit_amount ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Total Amount: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                "${smdetail?.total_amount ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'GRN Date: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                "${smdetail?.grn_date ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'GRN Quntity: ',
                                                                style: const TextStyle(
                                                                    color: ColorValues
                                                                        .blackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              Text(
                                                                "${smdetail?.grn_qty ?? ''}",
                                                                style:
                                                                    const TextStyle(
                                                                  color: ColorValues
                                                                      .navyBlueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                          ),

                                                          // Spacer(),
                                                          // Expanded(
                                                          //   child: Column(
                                                          //     crossAxisAlignment:
                                                          //         CrossAxisAlignment
                                                          //             .start,
                                                          //     children: [
                                                          //       Text(
                                                          //         'Start Date',
                                                          //         style: const TextStyle(
                                                          //             color: ColorValues
                                                          //                 .blackColor,
                                                          //             fontWeight:
                                                          //                 FontWeight.w500),
                                                          //       ),
                                                          //       Text(
                                                          //         "${bmdetail?.start_date ?? ''}",
                                                          //         style:
                                                          //             const TextStyle(
                                                          //           color: ColorValues
                                                          //               .navyBlueColor,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .bold,
                                                          //         ),
                                                          //       )
                                                          //     ],
                                                          //   ),
                                                          // )

                                                          // ]),
                                                        ]),
                                                  ),
                                                ),
                                              );
                                            }),
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
