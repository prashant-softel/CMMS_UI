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

class _DashBoardHomeWebState extends State<DashBoardHomeWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return
            // Obx(
            //   () =>
            Scaffold(
          body: Container(
            color: Color.fromARGB(255, 234, 236, 238),
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                AppBarDashboard(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 248, 250),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [Text("Tabs Comming Soon")],
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    decoration: BoxDecoration(
                                      color: ColorValues.lightBlueColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    height: 250,
                                    width: 400,
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
                                                            style:
                                                                Styles.black17,
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
                                                            style:
                                                                Styles.black17,
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
                                                            style:
                                                                Styles.black17,
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
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    decoration: BoxDecoration(
                                      color: ColorValues.lightBlueColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    height: 250,
                                    width: 400,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
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
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(0.0, 1.0),
                                                      blurRadius: 6.0,
                                                    ),
                                                  ]),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.redAccent),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      padding:
                                          EdgeInsets.only(left: 20, top: 10),
                                      decoration: BoxDecoration(
                                        color: ColorValues.lightBlueColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                      height: 250,
                                      width: 400,
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
                                                chartRadius: 120,
                                                colorList:
                                                    controller.getColorList(),
                                                // centerText: "Pie Chart",
                                                legendOptions: LegendOptions(
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
                                                  showChartValuesOutside: false,
                                                ),
                                                // onTapCallback: (index) {
                                                //   chartController
                                                //       .onChartTapped(index);
                                                // },
                                              ),
                                              SizedBox(height: 20),
                                              // Text(
                                              //   // 'Selected Section: ${chartController.selectedSection.value}',
                                              //   // style: TextStyle(fontSize: 18),
                                              // ),
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  _gridList(tittle: "WO on-time", value: "25%")
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _gridList({
    required String tittle,
    required String value,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: ColorValues.skyBlueColor,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.all(9),
        child: Expanded(
          child: Text(
            tittle,
            style: TextStyle(
                color: ColorValues.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class AppBarDashboard extends StatelessWidget {
  const AppBarDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
