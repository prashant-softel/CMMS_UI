import 'package:cmms/app/app.dart';

import 'package:cmms/app/mis/mis_dashboard_controller.dart';
import 'package:cmms/app/onHover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/header_widget_all_dash.dart';

// import '../../navigators/app_pages.dart';

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

    return //
        Scaffold(
          appBar: //
              Responsive.isMobile(context)
                  ? AppBar(
                      title: HeaderWidget(),
                      elevation: 0,
                      toolbarHeight: 60,
                      automaticallyImplyLeading: false,
                    )
                  : null,
          drawer: //
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? HomeDrawer() //ResponsiveSideMenu()
                  : null,
          body: Obx(
            () => Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                      left: homeController.menuButton.value ? 250.0 : 70.0),
                  width: Get.width,
                  height: Get.height,
                  child: Row(
                    children: [
                      // (Responsive.isMobile(context) || Responsive.isTablet(context))
                      //     ? Dimens.box0
                      //     :
                      //     //
                      //     HomeDrawer(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (Responsive.isMobile(context) ||
                                    Responsive.isTablet(context))
                                  Obx(
                                    () => //
                                        Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Card(
                                          shadowColor: ColorValues.greyColor,
                                          elevation: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                isExpanded: true,
                                                value: controller
                                                    .selectedFacility.value,
                                                icon: const Icon(Icons
                                                    .keyboard_arrow_down_outlined),
                                                elevation: 7,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                onChanged:
                                                    (String? selectedValue) {
                                                  controller.isFacilitySelected
                                                      .value = true;
                                                  controller.selectedFacility
                                                          .value =
                                                      selectedValue ?? '';
                                                },
                                                items: controller.facilityList
                                                    .map<
                                                        DropdownMenuItem<
                                                            String>>((facility) {
                                                  return DropdownMenuItem<String>(
                                                    value: facility?.name ?? '',
                                                    child: Text(
                                                        facility?.name ?? ''),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Responsive.isDesktop(context)
                                    ? HeaderWidgetAllDash()
                                    : Dimens.box0,
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Checklist & Observations",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 159, 156, 156),
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
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
                                  childAspectRatio: Responsive.isMobile(context)
                                      ? (itemWidth / itemHeight)
                                      : 5,
                                  children: <Widget>[
                                    createContentTile(
                                      title: "List Of observation",
                                      onTap: () {
                                        controller.goToJobListScreen();
                                      },
                                    ),
                                    createContentTile(
                                      title: 'Create observation ',
                                      onTap: () {
                                        controller.goToCreateObservation();
                                      },
                                    ),
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
                                    // createContentTile(
                                    //   title: 'CheckList Inspection',
                                    //   onTap: () {
                                    //     controller.goToCheckListOfObservation();
                                    //   },
                                    // ),
                                    // createContentTile(
                                    //     title: 'Statutory',
                                    //     onTap: () {
                                    //       controller.goToStatutoryScreen();
                                    //     }),
                                    // createContentTile(
                                    //     title: 'Waste Data',
                                    //     onTap: () {
                                    //       controller.goToWasteDataScreen();
                                    //     })
                                  ],
                                ),
                                // GridView.count(
                                //   shrinkWrap: true,
                                //   primary: false,
                                //   padding: const EdgeInsets.all(15),
                                //   crossAxisSpacing: 70,
                                //   mainAxisSpacing: 6,
                                //   crossAxisCount:
                                //       Responsive.isMobile(context) ? 2 : 5,
                                //   childAspectRatio: Responsive.isMobile(context)
                                //       ? (itemWidth / itemHeight)
                                //       : 5,
                                //   children: <Widget>[],
                                // ),

                                /// GRID TILES

                                /// GRID TILES
                                GridView.count(
                                  shrinkWrap: true,
                                  primary: false,
                                  padding: Dimens.edgeInsets15,
                                  crossAxisSpacing: 70,
                                  mainAxisSpacing: 6,
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
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
                                        })
                                  ],
                                ),
                                // if (Responsive.isDesktop(context))
                                // Container(
                                //   margin: EdgeInsets.only(left: 20),
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         "MIS Master",
                                //         style: TextStyle(
                                //           color: Color.fromARGB(255, 159, 156, 156),
                                //           fontSize: 16,
                                //           fontWeight: FontWeight.w400,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //           width:
                                //               10), // Add some space between the text and the line
                                //       Expanded(
                                //         child: Divider(
                                //           color: Colors
                                //               .grey, // Customize the color of the line if needed
                                //           height:
                                //               1, // Adjust the height of the line if needed
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Statutory",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 159, 156, 156),
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
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
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
                                          color:
                                              Color.fromARGB(255, 159, 156, 156),
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
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
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
                                          color:
                                              Color.fromARGB(255, 159, 156, 156),
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
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
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
                                        // createContentTile(
                                        // title: "Course Category",
                                        // onTap: () {
                                        //   controller.goToCourseCategory();
                                        // })
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Waste data",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 159, 156, 156),
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
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
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
                                    //     title: 'Waste Data List',
                                    //     onTap: () {
                                    //       // controller.goToWasteDataScreen();
                                    //     }),
                                    createContentTile(
                                        title: 'Waste Data Report',
                                        onTap: () {
                                          controller.goToWasteDataScreen();
                                        }),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Water data Report",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 159, 156, 156),
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
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
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
                                        "Master",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 159, 156, 156),
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
                                  crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 5,
                                  childAspectRatio: Responsive.isMobile(context)
                                      ? (itemWidth / itemHeight)
                                      : 5,
                                  children: <Widget>[
                                    OnHover(builder: (((isHovered) {
                                      return createContentTile(
                                          title: "Type of observation",
                                          onTap: () {
                                            controller.goToTypeOfObservation();
                                          });
                                    }))),
                                    OnHover(builder: (((isHovered) {
                                      return createContentTile(
                                          title: "Source of observation",
                                          onTap: () {
                                            controller.goToSourceOfObservation();
                                          });
                                    }))),
                                    OnHover(builder: (((isHovered) {
                                      return createContentTile(
                                          title: "Risk Type",
                                          onTap: () {
                                            controller.goToRiskType();
                                          });
                                    }))),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 450),
                  child: HomeDrawer(),
                ),
              ],
            ),
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
