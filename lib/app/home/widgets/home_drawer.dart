import 'package:cmms/app/app.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';

class HomeDrawer extends GetView<HomeController> {
  HomeDrawer({super.key});
  final HomeController controller = Get.find<HomeController>();
  var repository = Get.find<Repository>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(() {
        return AnimatedContainer(
          duration: Duration(milliseconds: 450),
          width: controller.menuButton == true
              ? 250
              : (controller.isExpanded.value ? 250 : 70),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: Get.height,
                      color: Color(0xFF363A40),
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
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 11,
                                wid: 7,
                                title: "HERO \nFUTURE \nENERGIES",
                                icon: "assets/files/logodrawer.jpg",
                                press: () {
                                  Get.offNamed(Routes.home);
                                },
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 0.5,
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                title: "DashBoard",
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                icon: "assets/files/home.png",
                                press: () {
                                  Get.offAllNamed(Routes.home);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                title: "Breakdown Maintenance",
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                icon: "assets/files/preventive.png",
                                press: () {
                                  Get.offAllNamed(Routes.breakdown);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                title: "Preventive Maintenance",
                                fontSize: 14,
                                width: 40,
                                color: Color(0xffD2D0D0),
                                height: 16,
                                icon: "assets/files/correct.png",
                                press: () {
                                  Get.offAllNamed(Routes.preventive);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                title: "Module Cleaning",
                                icon: "assets/files/reportins.png",
                                fontSize: 14,
                                width: 40,
                                color: Color(0xffD2D0D0),
                                height: 16,
                                press: () {
                                  Get.offAllNamed(
                                      Routes.moduleCleaningDashboard);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Vegetation Control",
                                icon: "assets/files/maint.png",
                                press: () {
                                  Get.offAllNamed(Routes.vegetationDashboard);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Incident Report",
                                icon: "assets/files/misc.png",
                                press: () {
                                  Get.offAllNamed(
                                      Routes.incidentReportDashboard);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
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
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Document Manager",
                                icon: "assets/files/inventory.png",
                                press: () {
                                  Get.offAllNamed(Routes.docVersionDashboard);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Masters",
                                icon: "assets/files/inventory.png",
                                press: () {
                                  Get.offAllNamed(Routes.masterDashboard);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Calender View",
                                icon: "assets/files/inventory.png",
                                press: () {
                                  Get.offAllNamed(Routes.calendarViewDashbord);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "HSE MIS",
                                icon: "assets/files/warranty.png",
                                press: () {
                                  Get.offAllNamed(Routes.misDashboard);
                                },
                              ),

                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Audit",
                                icon: "assets/files/images.png",
                                press: () {
                                  Get.offAllNamed(Routes.audit);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "F&S DSM Charges",
                                icon: "assets/files/images.png",
                                press: () {
                                  Get.offAllNamed(Routes.dsmDashboardScreen);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Report",
                                icon: "assets/files/maint.png",
                                press: () {
                                  Get.offAllNamed(Routes.cmmsReport);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Administration",
                                icon: "assets/files/admin.png",
                                press: () {
                                  Get.offAllNamed(Routes.admin_dashboard);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
                                title: "Settings",
                                icon: "assets/files/setting.png",
                                press: () {
                                  Get.offAllNamed(Routes.setting);
                                },
                              ),
                              MenuItem(
                                isexpand: controller.isExpanded.value,
                                menuButton: controller.menuButton.value,
                                fontSize: 14,
                                width: 40,
                                height: 16,
                                color: Color(0xffD2D0D0),
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
      }),
    );
  }

  _isDeleteDialog() {
    Get.dialog(
      SelectionArea(
        child: AlertDialog(
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
                    repository.deleteAllSecuredValues();
                    Get.offAllNamed(Routes.login);
                  },
                  child: Text('YES'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    this.isexpand,
    this.width,
    this.height,
    this.menuButton,
    this.fontSize,
    this.wid,
    this.color,
  }) : super(key: key);

  final String title;
  final String icon;
  final bool? isexpand;
  final bool? menuButton;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color? color;
  final double? wid;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          child: Column(
            children: [
              Dimens.boxHeight10,
              InkWell(
                onTap: press,
                child: Row(
                  children: [
                    SizedBox(
                      width: width,
                      child: Image.asset(
                        icon,
                        height: height,
                        color: color,
                      ),
                    ),
                    SizedBox(width: wid),
                    isexpand! || menuButton!
                        ? Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: Color(0xffD2D0D0),
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        : Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(""),
                            ),
                          ),
                  ],
                ),
              ),
              Dimens.boxHeight10
            ],
          ),
        ),
      ),
    );
  }
}
