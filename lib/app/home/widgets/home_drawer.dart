import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/warranty_claim_list/web/warranty_claim_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';
import '../../theme/styles.dart';
import '../../utils/responsive.dart';
import '../../theme/color_values.dart';

class HomeDrawer extends GetView {
  HomeDrawer({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return
        //
        Drawer(
      width:
          Responsive.isDesktop(context) ? Get.width * 0.19 : Get.height * 0.35,
      // width: (Responsive.isMobile(context) || Responsive.isTablet(context))
      //     ? Get.width * 0.75
      //     : Get.width * 0.19,
      child: //
          ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
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

                SingleChildScrollView(
                  child: Container(
                    height: Get.height,
                    color: ColorValues.appDarkBlueColor,
                    child: ListView(shrinkWrap: true, children: [
                      MenuItem(
                        title: "DashBoard",
                        icon: "assets/files/home.png",
                        press: () {
                          Get.offNamed(Routes.home);
                        },
                      ),
                      MenuItem(
                        title: "Inventory",
                        icon: "assets/files/warranty.png",
                        press: () {
                          Get.offNamed(Routes.inventory);
                        },
                      ),
                      MenuItem(
                        title: "Breakdown Maintenance",
                        icon: "assets/files/preventive.png",
                        press: () {
                          Get.offNamed(Routes.breakdown);
                        },
                      ),
                      // MenuItem(
                      //   title: "Warranty claim",
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
                        title: "Preventive Maintenance",
                        icon: "assets/files/preventive.png",
                        press: () {
                          Get.offNamed(Routes.preventive);
                        },
                      ),
                      MenuItem(
                        title: "Stock Management",
                        icon: "assets/files/maint.png",
                        press: () {
                          Get.offNamed(Routes.stockManagementDashboardScreen);
                        },
                      ),
                      MenuItem(
                        title: "Module Cleaning",
                        icon: "assets/files/maintenance.png",
                        press: () {
                          Get.offNamed(Routes.home);
                        },
                      ),
                      MenuItem(
                        title: "Vegetation Control",
                        icon: "assets/files/preventive.png",
                        press: () {
                          Get.offNamed(Routes.home);
                        },
                      ),
                      MenuItem(
                        title: "Incident Report",
                        icon: "assets/files/reportins.png",
                        press: () {
                          Get.offNamed(Routes.incidentReportListWeb);
                        },
                      ),
                      MenuItem(
                        title: "Calibration",
                        icon: "assets/files/preventive.png",
                        press: () {
                          Get.offNamed(Routes.calibrationList);
                        },
                      ),
                      MenuItem(
                        title: "Masters",
                        icon: "assets/files/misc.png",
                        press: () {
                          Get.offNamed(Routes.masterDashboard);
                        },
                      ),
                      MenuItem(
                        title: "Settings",
                        icon: "assets/files/setting.png",
                        press: () {
                          Get.offNamed(Routes.userList);
                        },
                      ),
                      MenuItem(
                        title: "Log Out",
                        icon: "assets/files/dashboard.png",
                        press: () {
                          _isDeleteDialog();
                        },
                      ),
                    ]),
                  ),
                ),
              ]),
        ),
      ),
    );

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
  const MenuItem({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        icon,
        height: 15,
        color: Color(0xffD2D0D0),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xffD2D0D0),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
