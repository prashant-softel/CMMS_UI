import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/master_dashboard/master_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onHover.dart';

// import '../../navigators/app_pages.dart';

class MastersDashboard extends GetView<MastersController> {
  MastersDashboard({super.key});

  final MastersController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                title: Text("Master"),
                centerTitle: true,
                elevation: 0,
              )
            : null,
        drawer: //
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? HomeDrawerMobile() //ResponsiveSideMenu()
                : null,
        body: Obx(
          () => Stack(
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
                    // (Responsive.isMobile(context) || Responsive.isTablet(context))
                    //     ? Dimens.box0
                    //     :
                    //     //
                    //     HomeDrawer(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (Responsive.isDesktop(context))
                            HeaderWidgetAllDash(),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "Masters",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            // height: Get.height,
                            // margin: EdgeInsets.only(left: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kFacilityFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Facility",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kFacilityFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kFacilityFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "SPV List",
                                                        onTap: () {
                                                          controller
                                                              .goToSPVList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kFacilityFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Facility List",
                                                        onTap: () {
                                                          controller
                                                              .goToFacilityTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kFacilityFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Block List",
                                                        onTap: () {
                                                          controller
                                                              .goToBlockTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  // Container(
                                  //   margin: EdgeInsets.only(left: 20),
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         "Work Type",
                                  //         style: TextStyle(
                                  //           color: Color.fromARGB(
                                  //               255, 159, 156, 156),
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
                                  // GridView.count(
                                  //   shrinkWrap: true,
                                  //   primary: false,
                                  //   padding: Dimens.edgeInsets15,
                                  //   crossAxisSpacing: 70,
                                  //   mainAxisSpacing: 6,
                                  //   crossAxisCount:
                                  //       Responsive.isMobile(context) ? 2 : 5,
                                  //   childAspectRatio: Responsive.isMobile(context)
                                  //       ? (itemWidth / itemHeight)
                                  //       : 5,
                                  //   children: <Widget>[
                                  //     OnHover(builder: (((isHovered) {
                                  //       return
                                  //           //  varUserAccessModel.value.access_list!
                                  //           //             .where((e) =>
                                  //           //                 e.feature_id == 5 && e.add == 0)
                                  //           //             .length >
                                  //           //         0
                                  //           //     ?
                                  //           createContentTile(
                                  //               title: "Work Type",
                                  //               onTap: () {
                                  //                 controller.goToWorkTypeList();
                                  //               });
                                  //     }))),
                                  //     OnHover(builder: (((isHovered) {
                                  //       return
                                  //           //  varUserAccessModel.value.access_list!
                                  //           //             .where((e) =>
                                  //           //                 e.feature_id == 5 && e.add == 0)
                                  //           //             .length >
                                  //           //         0
                                  //           //     ?
                                  //           createContentTile(
                                  //               title: "Work Tool Type",
                                  //               onTap: () {
                                  //                 controller.goToToolTypeList();
                                  //               });

                                  //       // : Dimens.box0;
                                  //     }))),
                                  //     // OnHover(builder: (((isHovered) {
                                  //     //   return
                                  //     //       // varUserAccessModel.value.access_list!
                                  //     //       //             .where((e) =>
                                  //     //       //                 e.feature_id == 5 && e.add == 0)
                                  //     //       //             .length >
                                  //     //       //         0
                                  //     //       //     ?
                                  //     //       createContentTile(
                                  //     //           title: "Body Injured",
                                  //     //           onTap: () {
                                  //     // controller.goToBodyinjured();
                                  //     //           });
                                  //     //   // : Dimens.box0;
                                  //     // }))),
                                  //   ],
                                  // ),
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kBusinessFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Business ",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kBusinessFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kBusinessFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title:
                                                            "Business Type List",
                                                        onTap: () {
                                                          controller
                                                              .goToBusinessTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kBusinessFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Business List",
                                                        onTap: () {
                                                          controller
                                                              .goToBusinessList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kBusinessFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title:
                                                            "Business List Import",
                                                        onTap: () {
                                                          controller
                                                              .goToImportBusiness();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kUserFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Users Management",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kUserFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "User List",
                                                        onTap: () {
                                                          controller
                                                              .goToUserList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Add User",
                                                        onTap: () {
                                                          controller
                                                              .clearStoreUserIdData();

                                                          controller
                                                              .goToAddUser();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Import User",
                                                        onTap: () {
                                                          controller
                                                              .goToImportUser();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Responsibility",
                                                        onTap: () {
                                                          // controller.clearStoreUserIdData();

                                                          controller
                                                              .goToResponsibility();
                                                        });
                                                  })))
                                                : Dimens.box0
                                            // OnHover(builder: (((isHovered) {
                                            //   return createContentTile(
                                            //       title: "Designation",
                                            //       onTap: () {
                                            //         controller.goToDesignationScreen();
                                            //       });
                                            // }))),
                                            // OnHover(builder: (((isHovered) {
                                            //   return createContentTile(
                                            //       title: "Competencies",
                                            //       onTap: () {
                                            //         controller.goToCompetencyScreen();
                                            //       });
                                            // }))),
                                            // OnHover(builder: (((isHovered) {
                                            //   return createContentTile(
                                            //       title: "Escalation Matrix",
                                            //       onTap: () {
                                            //         controller.goToEscalationMatrixScreen();
                                            //       });
                                            // }))),
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kUserFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: ((isHovered) {
                                                      return createContentTile(
                                                          title: "Modules List",
                                                          onTap: () {
                                                            controller
                                                                .goToFeatureList();
                                                          });
                                                    }),
                                                  )
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Roles",
                                                        onTap: () {
                                                          controller
                                                              .goToRoleTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Role Access",
                                                        onTap: () {
                                                          controller
                                                              .goToRoleAccess();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title:
                                                            "Role Notifications",
                                                        onTap: () {
                                                          controller
                                                              .goToRoleNotification();
                                                        });
                                                  })))
                                                : Dimens.box0
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kUserFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Designation",
                                                        onTap: () {
                                                          controller
                                                              .goToDesignationScreen();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Competencies",
                                                        onTap: () {
                                                          controller
                                                              .goToCompetencyScreen();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kUserFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title:
                                                            "Escalation Matrix",
                                                        onTap: () {
                                                          controller
                                                              .goToEscalationMatrixScreen();
                                                        });
                                                  })))
                                                : Dimens.box0
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kGeneralFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "General ",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kGeneralFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kGeneralFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Blood List",
                                                        onTap: () {
                                                          controller
                                                              .goToBloodTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kGeneralFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Country List",
                                                        onTap: () {
                                                          controller
                                                              .goToCountryTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kGeneralFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "State List",
                                                        onTap: () {
                                                          controller
                                                              .goToStateTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kGeneralFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "City List",
                                                        onTap: () {
                                                          controller
                                                              .goToStateTypeList();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kGeneralFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kGeneralFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Frequency List",
                                                        onTap: () {
                                                          controller
                                                              .goToFrequencyList();
                                                        });
                                                  })))
                                                : Dimens.box0
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kAssetsFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Assets",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kAssetsFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAssetsFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Assets List",
                                                    onTap: () {
                                                      Get.toNamed(
                                                        Routes.inventoryList,
                                                      );
                                                      //  controller.createChecklist();
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAssetsFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Add Assets",
                                                    onTap: () {
                                                      controller
                                                          .clearAssetsIdStoreData();

                                                      Get.toNamed(
                                                        Routes
                                                            .addInventoryScreen,
                                                      );
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAssetsFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Import Assets",
                                                    onTap: () {
                                                      controller
                                                          .clearStoreData();
                                                      Get.toNamed(
                                                          Routes
                                                              .importInventory,
                                                          arguments: {
                                                            "importType":
                                                                AppConstants
                                                                    .kImportAsset
                                                          });
                                                    })
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kAssetsFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: const EdgeInsets.all(16),
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAssetsFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Assets Category",
                                                    onTap: () {
                                                      Get.toNamed(
                                                        Routes
                                                            .inventoryCategory,
                                                      );
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAssetsFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Assets Type",
                                                    onTap: () {
                                                      Get.toNamed(
                                                        Routes
                                                            .inventoryTypeListScreen,
                                                      );
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAssetsFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Assets Status",
                                                    onTap: () {
                                                      controller
                                                          .inventoryStatusScreen();
                                                    })
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kDocumentManagerFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Document Manager",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kDocumentManagerFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kDocumentManagerFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Document Type",
                                                    onTap: () {
                                                      Get.toNamed(Routes
                                                          .DocumentMaster);
                                                    })
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kWarrantyClaimFeatureId &&
                                                  e.add ==
                                                      UserAccessConstants
                                                          .kHaveAddAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Warranty",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kWarrantyClaimFeatureId &&
                                                  e.add ==
                                                      UserAccessConstants
                                                          .kHaveAddAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: const EdgeInsets.all(16),
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kWarrantyClaimFeatureId &&
                                                            e.add ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title:
                                                        "Create Warranty Claim",
                                                    onTap: () {
                                                      controller
                                                          .createWarrantyClaimList();
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kCalibrationFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Calibration List",
                                                    onTap: () {
                                                      Get.toNamed(
                                                        Routes.calibrationList,
                                                      );
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kWarrantyClaimcertiFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title:
                                                        "WC Certificates List",
                                                    onTap: () {
                                                      // Get.toNamed(
                                                      //   Routes
                                                      //       // .warrantyCertificatesList,
                                                      // );
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kWarrantyClaimFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title:
                                                        "Warranty Claims List",
                                                    onTap: () => controller
                                                        .breakdownMaintenance(),
                                                  )
                                                : Dimens.box0
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kHfeMasterFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "HSE Master",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 159, 156, 156),
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
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kHfeMasterFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: const EdgeInsets.all(16),
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Grievance Type",
                                                    onTap: () {
                                                      controller
                                                          .grievanceType();
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Water Type",
                                                    onTap: () {
                                                      controller
                                                          .waterTypeMaster();
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Waste Type",
                                                    onTap: () {
                                                      controller
                                                          .wasteTypeMaster();
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Body Injured",
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes.Bodyinjured);
                                                    })
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kHfeMasterFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title:
                                                            "Type of observation",
                                                        onTap: () {
                                                          controller
                                                              .goToTypeOfObservation();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title:
                                                            "Source of observation",
                                                        onTap: () {
                                                          controller
                                                              .goToSourceOfObservation();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Risk Type",
                                                        onTap: () {
                                                          controller
                                                              .goToRiskType();
                                                        });
                                                  })))
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,

                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kHfeMasterFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Incident Risk",
                                                    onTap: () {
                                                      Get.toNamed(Routes
                                                          .incidentRiskType);
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title:
                                                        "Statutory Compliance",
                                                    onTap: () {
                                                      Get.toNamed(Routes
                                                          .StatutoryCompliance);
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Compliance Status",
                                                    onTap: () {
                                                      Get.toNamed(Routes
                                                          .ComplianceStatus);
                                                    })
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? createContentTile(
                                                    title: "Course Category",
                                                    onTap: () {
                                                      Get.toNamed(Routes
                                                          .courseCategory);
                                                    })
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kHfeMasterFeatureId &&
                                                  e.view ==
                                                      UserAccessConstants
                                                          .kHaveViewAccess)
                                              .length >
                                          0
                                      ? GridView.count(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: Dimens.edgeInsets15,
                                          crossAxisSpacing: 70,
                                          mainAxisSpacing: 6,
                                          crossAxisCount:
                                              Responsive.isMobile(context)
                                                  ? 2
                                                  : 5,
                                          childAspectRatio:
                                              Responsive.isMobile(context)
                                                  ? (itemWidth / itemHeight)
                                                  : 5,
                                          children: <Widget>[
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kHfeMasterFeatureId &&
                                                            e.view ==
                                                                UserAccessConstants
                                                                    .kHaveViewAccess)
                                                        .length >
                                                    0
                                                ? OnHover(
                                                    builder: (((isHovered) {
                                                    return createContentTile(
                                                        title: "Targeted Group",
                                                        onTap: () {
                                                          Get.toNamed(Routes
                                                              .targetedGroup);
                                                        });
                                                  })))
                                                : Dimens.box0,
                                          ],
                                        )
                                      : Dimens.box0,
                                ],
                              ),
                            ),
                          ),
                        ],
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
        ));
  }

  createContentTile({required String title, Function()? onTap}) {
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
          // padding: EdgeInsets.all(9),
          child:
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              Center(
            child: Text(
              title,
              style: TextStyle(
                  color: ColorValues.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),

              textAlign: TextAlign.center, // Updated
            ),
            // ),
            // ],
          ),
        ),
      ),
    );
  }
}
