import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/mis/mis_dashboard_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget_all_dash.dart';

class MisDashboardScreen extends GetView<MisDashboardController> {
  ///
  MisDashboardScreen({super.key});

  final MisDashboardController controller = Get.find();
  final HomeController homeController = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    ///
    var size = Get;
    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              // leading: IconButton(
              //   icon: Icons.menu,
              //   onPressed: () {},
              // ),
              title: Text("HSE Report"),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile() //ResponsiveSideMenu()
          : null,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 450),
            margin: EdgeInsets.only(
              left: Responsive.isDesktop(context)
                  ? homeController.menuButton.value
                      ? 250.0
                      : 70.0
                  : 0,
            ),
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Responsive.isDesktop(context)
                            ? HeaderWidgetAllDash()
                            : Dimens.box0,
                        // HeaderWidget(),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Checklist & Observations",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// GRID TILES
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                              title: "List Of observation",
                              onTap: () {
                                controller.goToObsListScreen();
                              },
                            ),
                            createContentTile(
                              title: 'Create observation ',
                              onTap: () {
                                controller.goToCreateObservation();
                                // controller.clearStoreData();
                              },
                            ),
                            createContentTile(
                              title: 'Observation Summary',
                              onTap: () {
                                controller.goToObservationSummary();
                              },
                            ),
                          ],
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: "MIS Checklist",
                                onTap: () {
                                  controller.createChecklist();
                                }),
                            //  if (Responsive.isDesktop(context))
                            createContentTile(
                                title: "MIS Check Point",
                                onTap: () {
                                  // Get.toNamed(
                                  //   Routes.preventive_checkPoint,
                                  // );
                                  controller.checkPoint();
                                }),
                            createContentTile(
                                title: "MIS Summary",
                                onTap: () {
                                  // Get.toNamed(
                                  //   Routes.preventive_checkPoint,
                                  // );
                                  controller.goToMisSummary();
                                }),
                          ],
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: "MIS Plan",
                                onTap: () {
                                  controller.goToPlanListScreen();
                                }),
                            createContentTile(
                                title: 'MIS Task',
                                onTap: () {
                                  controller.goToMisTaskScreen();
                                }),
                            createContentTile(
                              title: "Checklist Inspection",
                              onTap: () {
                                controller.goToChecklistInspectionScreen();
                              },
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Permit",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            // createContentTile(
                            //   title: 'CheckList Inspection',
                            //   onTap: () {
                            //     controller.goToCheckListOfObservation();
                            //   },
                            // ),
                            // createContentTile(
                            //     title: 'Statutory List',
                            //     onTap: () {
                            //       // controller.goToWasteDataScreen();
                            //     }),
                            createContentTile(
                              title: 'Permit List',
                              onTap: () {
                                // controller.clearStoreData();

                                Get.toNamed(Routes.newPermitList,
                                    arguments: {"misPermit": 1});
                              },
                            ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Statutory",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            // createContentTile(
                            //   title: 'CheckList Inspection',
                            //   onTap: () {
                            //     controller.goToCheckListOfObservation();
                            //   },
                            // ),
                            // createContentTile(
                            //     title: 'Statutory List',
                            //     onTap: () {
                            //       // controller.goToWasteDataScreen();
                            //     }),
                            createContentTile(
                                title: 'Statutory Report',
                                onTap: () {
                                  controller.goToStatutoryScreen();
                                }),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Grievance",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: "List Grievance",
                                onTap: () {
                                  controller.grievanceList();
                                }),
                            createContentTile(
                                title: "Create Grievance",
                                onTap: () {
                                  controller.addGrievance();
                                }),
                            createContentTile(
                                title: "Grievance Summary \nReport",
                                onTap: () {
                                  controller.GrievanceSummaryReport();
                                })
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Training Courses",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: "Training Courses",
                                onTap: () {
                                  controller.trainingCourse();
                                }),

                            createContentTile(
                                title: "Schedule Course",
                                onTap: () {
                                  controller.goToScheduleCourseList();
                                }),

                            createContentTile(
                                title: "Training Report",
                                onTap: () {
                                  controller.trainingSummary();
                                }),
                            // createContentTile(
                            //     title: "Course Category",
                            //     onTap: () {
                            //       controller.goToCourseCategory();
                            //     }),
                            // createContentTile(
                            //     title: "Targeted Group",
                            //     onTap: () {
                            //       controller.goToTargetedGroup();
                            //     })
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Waste data",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            // createContentTile(
                            //     title: 'Waste Data Report',
                            //     onTap: () {
                            //       controller.goToWasteDataScreen();
                            //     }),
                            createContentTile(
                              title: 'Hazardous Waste',
                              onTap: () {
                                controller.goToHazardousDataScreen();
                              },
                            ),
                            createContentTile(
                              title: 'Non-Hazardous Waste',
                              onTap: () {
                                controller.goToNonHazardousDataScreen();
                              },
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Water data Report",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            // createContentTile(
                            //   title: 'CheckList Inspection',
                            //   onTap: () {
                            //     controller.goToCheckListOfObservation();
                            //   },
                            // ),
                            createContentTile(
                                title: 'Water Data Report',
                                onTap: () {
                                  controller.goToWaterDataScreen();
                                }),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Occupational Health",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: 'Create Occupational',
                                onTap: () {
                                  controller.goToCreateOccupationalScreen();
                                }),
                            createContentTile(
                                title: 'List Of Occupational',
                                onTap: () {
                                  controller.goToOccupationalDataListScreen();
                                }),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Regulatary Visits and Notices",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: 'Create Regulatary',
                                onTap: () {
                                  controller.goToCreateRegulataryVisitsScreen();
                                }),
                            createContentTile(
                                title: 'List Of Regulatary',
                                onTap: () {
                                  controller.goToRegulataryDataListScreen();
                                }),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Permits to Work & TBT Data",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: 'Create Permits & TBT',
                                onTap: () {
                                  controller.goToCreatePermitsTBTScreen();
                                }),
                            createContentTile(
                                title: 'List Of Permits & TBT',
                                onTap: () {
                                  controller.goToPermitsTBTDataListScreen();
                                }),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Fuel Data",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: 'Create Fuel Data',
                                onTap: () {
                                  controller.goToCreateFuelDataScreen();
                                }),
                            createContentTile(
                                title: 'List Of Fuel Data',
                                onTap: () {
                                  controller.goToFuelDataListScreen();
                                }),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Plantation Data",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: 'Create Plantation Data',
                                onTap: () {
                                  controller.goToCreatePlantationDataScreen();
                                }),
                            createContentTile(
                                title: 'List Of Plantation Data',
                                onTap: () {
                                  controller.goToPlantationListScreen();
                                }),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Kaizens",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the text and the line
                              Expanded(
                                child: Divider(
                                  color: Colors
                                      .grey, // Customize the color of the line if needed
                                  height:
                                      1, // Adjust the height of the line if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          padding: Dimens.edgeInsets15,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            createContentTile(
                                title: 'Create Kaizens',
                                onTap: () {
                                  controller.goToCreateKaizensScreen();
                                }),
                            createContentTile(
                                title: 'List Of Kaizens',
                                onTap: () {
                                  controller.goToKaizensListScreen();
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Responsive.isDesktop(context)
              ? AnimatedPositioned(
                  duration: Duration(milliseconds: 450),
                  child: HomeDrawer(),
                )
              : Dimens.box0
        ],
      ),
    );
  }

  Widget createContentTile({required String title, Function()? onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              color: ColorValues.skyBlueColor,
              borderRadius: BorderRadius.circular(2),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            // child: Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: ColorValues.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center, // Updated
              ),
            )
            //   ],
            // ),
            ),
      ),
    );
  }
}
