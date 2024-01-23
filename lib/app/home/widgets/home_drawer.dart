// ignore_for_file: must_be_immutable

import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';

class HomeDrawer extends GetView<HomeController> {
  HomeDrawer({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: controller.isExpanded.value ? 250 : 60,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (Responsive.isMobile(context))
                  DrawerHeader(
                    child: Center(
                      child: Image.asset('assets/files/logo.png'),
                    ),
                  ),
                SingleChildScrollView(
                  child: Container(
                    height: Get.height,
                    color: Color(0xFF353F4F),
                    child: MouseRegion(
                      onEnter: (_) {
                        controller.toggleExpansion();
                      },
                      onExit: (_) {
                        controller.toggleExpansion();
                      },
                      child: ListView(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MenuItemLogo(
                              isexpand: controller.isExpanded.value,
                              icon: !controller.isExpanded.value
                                  ? "assets/files/logodrawer.jpg"
                                  : "assets/files/logo.png",
                              height: !controller.isExpanded.value ? 40 : 70,
                              width: !controller.isExpanded.value ? 40 : 100,
                              press: () {
                                Get.offNamed(Routes.home);
                              },
                            ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "DashBoard",
                              icon: "assets/files/home.png",
                              press: () {
                                Get.offAllNamed(Routes.home);
                              },
                            ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Breakdown Maintenance",
                              icon: "assets/files/preventive.png",
                              press: () {
                                Get.offAllNamed(Routes.breakdown);
                              },
                            ),

                            // MenuItem(
                            ////                                              isexpand: controller.isExpanded.valu
                            ///e,
                            //title: "Warranty claim",
                            //   icon: "assets/files/warranty.png",
                            //   press: () {
                            //     Get.offAllNamed(Routes.warrantyClaimList);
                            //     //  Navigator.push(
                            //     //         context,
                            //     //         MaterialPageRoute(
                            //     //             builder: (context) => WarrantyClaimListWeb()));
                            //   },
                            // ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Preventive Maintenance",
                              icon: "assets/files/correct.png",
                              press: () {
                                Get.offAllNamed(Routes.preventive);
                              },
                            ),

                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Module Cleaning",
                              icon: "assets/files/reportins.png",
                              press: () {
                                Get.offAllNamed(Routes.moduleCleaningDashboard);
                              },
                            ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Vegetation Control",
                              icon: "assets/files/maint.png",
                              press: () {
                                Get.offAllNamed(Routes.home);
                              },
                            ),
                            // MenuItem(
                            //   isexpand:
                            //       controller.isExpanded.value,
                            //   title: "Assets",
                            //   icon:
                            //       "assets/files/maintenance.png",
                            //   press: () {
                            //     Get.offAllNamed(
                            //         Routes.inventory);
                            //   },
                            // ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Incident Report",
                              icon: "assets/files/misc.png",
                              press: () {
                                Get.offAllNamed(Routes.incidentReportDashboard);
                              },
                            ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Stock Management",
                              icon: "assets/files/warranty.png",
                              press: () {
                                Get.offAllNamed(
                                    Routes.stockManagementDashboardScreen);
                              },
                            ),

                            // MenuItem(
                            //   isexpand:
                            //       controller.isExpanded.value,
                            //   title: "Calibration",
                            //   icon:
                            //       "assets/files/preventive.png",
                            //   press: () {
                            //     Get.offAllNamed(
                            //         Routes.calibrationList);
                            //   },
                            // ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Masters",
                              icon: "assets/files/inventory.png",
                              press: () {
                                Get.offAllNamed(Routes.masterDashboard);
                              },
                            ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "HSE Report",
                              icon: "assets/files/warranty.png",
                              press: () {
                                Get.offAllNamed(Routes.misDashboard);
                              },
                            ),

                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Audit",
                              icon: "assets/files/images.png",
                              press: () {
                                Get.offAllNamed(Routes.audit);
                              },
                            ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Settings",
                              icon: "assets/files/setting.png",
                              press: () {
                                Get.offAllNamed(Routes.setting);
                              },
                            ),
                            MenuItem(
                              isexpand: controller.isExpanded.value,
                              title: "Log Out",
                              icon: "assets/files/dashboard.png",
                              press: () {
                                _isDeleteDialog();
                              },
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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

// ... (remaining classes)
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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dimens.boxHeight15,
          InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,
            onTap: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  child: Image.asset(
                    icon,
                    height: 16,
                    color: Color(0xffD2D0D0),
                  ),
                ),
                // Dimens.boxWidth15,
                isexpand!
                    ? Expanded(
                        child: Text(
                          title ?? "",
                          style: TextStyle(
                            color: Color(0xffD2D0D0),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Dimens.box0
              ],
            ),
          ),
          Dimens.boxHeight10
        ],
      )),
    );
  }
}

class MenuItemLogo extends StatelessWidget {
  MenuItemLogo({
    Key? key,
    required this.height,
    this.title,
    required this.icon,
    required this.press,
    this.isexpand,
    required this.width,
  }) : super(key: key);

  String? title;
  String icon;
  bool? isexpand;
  final VoidCallback press;
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
          child: Column(
        children: [
          Dimens.boxHeight15,
          InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,
            onTap: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child:
                        Image.asset(icon, height: height, fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
          Dimens.boxHeight10
        ],
      )),
    );
  }
}
