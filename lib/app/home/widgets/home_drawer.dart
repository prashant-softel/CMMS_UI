import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';

class HomeDrawer extends GetView<HomeController> {
  HomeDrawer({super.key});
  final HomeController controller = Get.find<HomeController>();

  ///
  @override
  Widget build(BuildContext context) {
    return
        //
        Obx(() => Drawer(
              width: controller.isExpanded.value ? 300 : 50,

              // Get.width * 0.19
              // : 50, // Get.width * 0.35,
              // width: (Responsive.isMobile(context) || Responsive.isTablet(context))
              //     ? Get.width * 0.75
              //     : Get.width * 0.19,
              child: //
                  ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                      //
                      children: [
                        ///
                        if (Responsive.isMobile(context))
                          DrawerHeader(
                            child: Center(
                              child: Image.asset(
                                'assets/files/logo.png',
                              ),
                            ),
                          ),
                        // Text("${controller.isExpanded.value}"),
                        SingleChildScrollView(
                          child: Container(
                              //  width: controller.isExpanded.value ? 300 : 50,
                              height: Get.height,
                              color: ColorValues.appDarkBlueColor,
                              child:
                                  // controller.isExpanded.value
                                  // ?
                                  MouseRegion(
                                      onEnter: (_) {
                                        controller.toggleExpansion();
                                      },
                                      onExit: (_) {
                                        controller.toggleExpansion();
                                      },
                                      child: ListView(
                                          //
                                          //shrinkWrap: true,
                                          children: [
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "DashBoard",
                                              icon: "assets/files/home.png",
                                              press: () {
                                                Get.offNamed(Routes.home);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Inventory",
                                              icon: "assets/files/warranty.png",
                                              press: () {
                                                Get.offNamed(Routes.inventory);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Breakdown Maintenance",
                                              icon:
                                                  "assets/files/preventive.png",
                                              press: () {
                                                Get.offNamed(Routes.breakdown);
                                              },
                                            ),
                                            // MenuItem(
                                            ////                                              isexpand: controller.isExpanded.valu
                                            ///e,
//title: "Warranty claim",
                                            //   icon: "assets/files/warranty.png",
                                            //   press: () {
                                            //     Get.offNamed(Routes.warrantyClaimList);
                                            //     //  Navigator.push(
                                            //     //         context,
                                            //     //         MaterialPageRoute(
                                            //     //             builder: (context) => WarrantyClaimListWeb()));
                                            //   },
                                            // ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Preventive Maintenance",
                                              icon:
                                                  "assets/files/preventive.png",
                                              press: () {
                                                Get.offNamed(Routes.preventive);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Stock Management",
                                              icon: "assets/files/maint.png",
                                              press: () {
                                                Get.offNamed(Routes
                                                    .stockManagementDashboardScreen);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Module Cleaning",
                                              icon:
                                                  "assets/files/maintenance.png",
                                              press: () {
                                                Get.offNamed(Routes.home);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Vegetation Control",
                                              icon:
                                                  "assets/files/preventive.png",
                                              press: () {
                                                Get.offNamed(Routes.home);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Incident Report",
                                              icon:
                                                  "assets/files/reportins.png",
                                              press: () {
                                                Get.offNamed(Routes
                                                    .incidentReportListWeb);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Calibration",
                                              icon:
                                                  "assets/files/preventive.png",
                                              press: () {
                                                Get.offNamed(
                                                    Routes.calibrationList);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Masters",
                                              icon: "assets/files/misc.png",
                                              press: () {
                                                Get.offNamed(
                                                    Routes.masterDashboard);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Settings",
                                              icon: "assets/files/setting.png",
                                              press: () {
                                                Get.offNamed(Routes.userList);
                                              },
                                            ),
                                            MenuItem(
                                              isexpand:
                                                  controller.isExpanded.value,
                                              title: "Log Out",
                                              icon:
                                                  "assets/files/dashboard.png",
                                              press: () {
                                                _isDeleteDialog();
                                              },
                                            ),
                                          ]))),
                        ),
                      ]),
                ),
              ),
            ));

    ///
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

  ///
}

class MenuItem extends StatelessWidget {
  MenuItem({
    Key? key,
    this.title,
    required this.icon,
    required this.press,
    this.isexpand,
  }) : super(key: key);

  String? title;
  String icon;
  bool? isexpand;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          onTap: press,
          horizontalTitleGap: 0.0,
          leading: Image.asset(
            icon,
            height: 15,
            color: Color(0xffD2D0D0),
          ),
          title: isexpand!
              ? Text(
                  title ?? "",
                  style: TextStyle(
                    color: Color(0xffD2D0D0),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Container()),
    );
  }
}
