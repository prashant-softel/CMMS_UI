import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget_all_dash.dart';
import '../preventive_maintenance_controller.dart';

class PreventiveScreen extends GetView<PreventiveController> {
  PreventiveScreen({super.key});
  final PreventiveController controller = Get.find();
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
              title: Text("Preventive Maintenance"),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile()
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
            child: Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          HeaderWidgetAllDash(),

                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Preventive Maintenance",
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
                          padding: const EdgeInsets.all(16),
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmPlanFeatureId &&
                                            e.view ==
                                                UserAccessConstants
                                                    .kHaveViewAccess)
                                        .length >
                                    0
                                ? _priventiveList(
                                    tittle: "PM Plans",
                                    ontap: () {
                                      controller.pmPlanList();
                                    })
                                : Dimens.box0,
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kMasterFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0
                                ? _priventiveList(
                                    tittle: "Import Plan",
                                    ontap: () {
                                      controller.importPlan();
                                    })
                                : Dimens.box0,
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmTaskFeatureId &&
                                            e.view ==
                                                UserAccessConstants
                                                    .kHaveViewAccess)
                                        .length >
                                    0
                                ? _priventiveList(
                                    tittle: "PM Tasks",
                                    ontap: () {
                                      controller.pmTask();
                                    })
                                : Dimens.box0,
                          ],
                        ),
                        // GridView.count(
                        //   shrinkWrap: true,
                        //   primary: false,
                        //   padding: const EdgeInsets.all(16),
                        //   crossAxisSpacing: 40,
                        //   mainAxisSpacing: 6,
                        //   crossAxisCount:
                        //       Responsive.isMobile(context) ? 2 : 5,
                        //   childAspectRatio: Responsive.isMobile(context)
                        //       ? (itemWidth / itemHeight)
                        //       : 5,
                        //   children: <Widget>[
                        //     _priventiveList(
                        //         tittle: "PM Tasks",
                        //         ontap: () {
                        //           controller.pmTask();
                        //         }),
                        //   ],
                        // ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Masters",
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
                          padding: const EdgeInsets.all(16),
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 6,
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                          childAspectRatio: Responsive.isMobile(context)
                              ? (itemWidth / itemHeight)
                              : 5,
                          children: <Widget>[
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPMchecklistFeatureId &&
                                            e.view ==
                                                UserAccessConstants
                                                    .kHaveViewAccess)
                                        .length >
                                    0
                                ? _priventiveList(
                                    tittle: "Check List",
                                    ontap: () {
                                      controller.createChecklist();
                                    })
                                : Dimens.box0,
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPMcheckpointFeatureId &&
                                            e.view ==
                                                UserAccessConstants
                                                    .kHaveViewAccess)
                                        .length >
                                    0
                                ? _priventiveList(
                                    tittle: "Check Point",
                                    ontap: () {
                                      controller.checkPoint();
                                    })
                                : Dimens.box0,
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kMasterFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0
                                ? _priventiveList(
                                    tittle: "Import Checklist",
                                    ontap: () {
                                      controller.importChecklist();
                                    })
                                : Dimens.box0,
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
      ),
    );
  }

  _priventiveList({required String tittle, Function()? ontap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorValues.skyBlueColor,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: EdgeInsets.all(9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  tittle,
                  style: TextStyle(
                      color: ColorValues.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
