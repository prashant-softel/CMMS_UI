import 'package:cmms/app/app.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/app/breakdown_maintenance/breakdown_maintenance_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/onHover.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget_all_dash.dart';

// import '../../navigators/app_pages.dart';

class BreakdownMaintenanceScreen
    extends GetView<BreakdownMaintenanceController> {
  ///
  BreakdownMaintenanceScreen({super.key});

  final BreakdownMaintenanceController controller = Get.find();
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
                title: Text("Breakdown Maintenance"),
                centerTitle: true,
                elevation: 0,
              )
            : null,
        drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? HomeDrawerMobile() //ResponsiveSideMenu()
            : null,
        body: Obx(() => Stack(
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
                  child: Row(
                    children: [
                      Expanded(
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
                                      "Breakdown Maintenance",
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
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kJobFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "Job List",
                                          onTap: () {
                                            controller.goToJobListScreen();
                                          })
                                      : Container(),
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kJobFeatureId &&
                                                  e.add ==
                                                      UserAccessConstants
                                                          .kHaveAddAccess)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: 'Add New Job',
                                          onTap: () {
                                            controller.addNewJob();
                                          })
                                      : Container(),
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kJobCardFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "JobCard List",
                                          onTap: () {
                                            controller.goToJobCardList();
                                          })
                                      : Container(),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Permit",
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
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kPermitFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "Permit List",
                                          onTap: () {
                                            controller.newPermitList();
                                          })
                                      : Container(),

                                  // //Add New Permit
                                  // varUserAccessModel.value.access_list!
                                  //             .where((e) =>
                                  //                 e.feature_id ==
                                  //                     UserAccessConstants
                                  //                         .kPermitFeatureId &&
                                  //                 e.add ==
                                  //                     UserAccessConstants
                                  //                         .kHaveAddAccess)
                                  //             .length >
                                  //         0
                                  //     ? createContentTile(
                                  //         title: "Add New Permit",
                                  //         onTap: () {
                                  //           controller.createNewPermit();
                                  //         })
                                  //     : Container(),
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kPermitFeatureId &&
                                                  e.add ==
                                                      UserAccessConstants
                                                          .kHaveAddAccess)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "Add Permit",
                                          onTap: () {
                                            controller.additionalPermit();
                                          })
                                      : Container(),
                                ],
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Masters",
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
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id == 5 &&
                                                  e.view == 1 &&
                                                  e.add == 1)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "Permit Type Checklist",
                                          onTap: () {
                                            controller.goToPermitTypeScreen();
                                          })
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id == 5 &&
                                                  e.view == 1 &&
                                                  e.add == 1)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "Permit Type Checkpoint",
                                          onTap: () {
                                            controller
                                                .gotToSafetyQuestionsList();
                                          })
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id == 5 &&
                                                  e.view == 1 &&
                                                  e.add == 1)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "JOB Type",
                                          onTap: () {
                                            controller.goToJobTypeList();
                                          })
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id == 5 &&
                                                  e.view == 1 &&
                                                  e.add == 1)
                                              .length >
                                          0
                                      ? createContentTile(
                                          title: "TBT SOP List",
                                          onTap: () {
                                            controller.goToJobSOPList();
                                          })
                                      : Dimens.box0
                                ],
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
                                    return
                                        //  varUserAccessModel.value.access_list!
                                        //             .where((e) =>
                                        //                 e.feature_id == 5 && e.add == 0)
                                        //             .length >
                                        //         0
                                        //     ?
                                        createContentTile(
                                            title: "Fault",
                                            onTap: () {
                                              controller.goToWorkTypeList();
                                            });
                                  }))),
                                  OnHover(builder: (((isHovered) {
                                    return
                                        //  varUserAccessModel.value.access_list!
                                        //             .where((e) =>
                                        //                 e.feature_id == 5 && e.add == 0)
                                        //             .length >
                                        //         0
                                        //     ?
                                        createContentTile(
                                            title: "Tool Type",
                                            onTap: () {
                                              controller.goToToolTypeList();
                                            });

                                    // : Dimens.box0;
                                  }))),
                                  // OnHover(builder: (((isHovered) {
                                  //   return
                                  //       // varUserAccessModel.value.access_list!
                                  //       //             .where((e) =>
                                  //       //                 e.feature_id == 5 && e.add == 0)
                                  //       //             .length >
                                  //       //         0
                                  //       //     ?
                                  //       createContentTile(
                                  //           title: "Body Injured",
                                  //           onTap: () {
                                  // controller.goToBodyinjured();
                                  //           });
                                  //   // : Dimens.box0;
                                  // }))),
                                ],
                              ),
                            ]),
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
            )));
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
