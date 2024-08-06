import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';

class HomeDrawerMobile extends GetView<HomeController> {
  HomeDrawerMobile({super.key});
  // final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
        child: Container(
      width: 250,
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: Get.height,
              color: Color(0xFF363A40),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuItemHeader(
                      fontSize: 35,
                      wid: 7,
                      title: "A R E I S",
                      icon: 'assets/files/logodrawer.png',
                      press: () {
                        Get.offNamed(Routes.home);
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    MenuItem(
                      title: "DashBoard",
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      icon: "assets/files/home.png",
                      press: () {
                        Get.offAllNamed(Routes.home);
                      },
                    ),
                    MenuItem(
                      title: "Breakdown Maintenance",
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      icon: "assets/files/preventive.png",
                      press: () {
                        Get.offAllNamed(Routes.breakdown);
                      },
                    ),
                    MenuItem(
                      title: "Preventive Maintenance",
                      fontSize: 15,
                      color: Color(0xffD2D0D0),
                      height: 16,
                      icon: "assets/files/correct.png",
                      press: () {
                        Get.offAllNamed(Routes.preventive);
                      },
                    ),
                    MenuItem(
                      title: "Module Cleaning",
                      icon: "assets/files/reportins.png",
                      fontSize: 15,
                      color: Color(0xffD2D0D0),
                      height: 16,
                      press: () {
                        Get.offAllNamed(Routes.moduleCleaningDashboard);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "Vegetation Control",
                      icon: "assets/files/maint.png",
                      press: () {
                        Get.offAllNamed(Routes.vegetationDashboard);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "Incident Report",
                      icon: "assets/files/misc.png",
                      press: () {
                        Get.offAllNamed(Routes.incidentReportDashboard);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "Stock Management",
                      icon: "assets/files/warranty.png",
                      press: () {
                        Get.offAllNamed(Routes.stockManagementDashboardScreen);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "Masters",
                      icon: "assets/files/inventory.png",
                      press: () {
                        Get.offAllNamed(Routes.masterDashboard);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "HSE Report",
                      icon: "assets/files/warranty.png",
                      press: () {
                        Get.offAllNamed(Routes.misDashboard);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "Audit",
                      icon: "assets/files/images.png",
                      press: () {
                        Get.offAllNamed(Routes.audit);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "Administration",
                      icon: "assets/files/admin.png",
                      press: () {
                        Get.offAllNamed(Routes.admin_dashboard);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
                      height: 16,
                      color: Color(0xffD2D0D0),
                      title: "Settings",
                      icon: "assets/files/setting.png",
                      press: () {
                        Get.offAllNamed(Routes.setting);
                      },
                    ),
                    MenuItem(
                      fontSize: 15,
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
        ],
      ),
    ));
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
    this.title,
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

  String? title;
  String icon;
  bool? isexpand;
  bool? menuButton;
  double? fontSize;
  double? height;
  double? width;
  Color? color;
  double? wid;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Dimens.boxHeight15,
                InkWell(
                  onTap: press,
                  child: Row(
                    children: [
                      Image.asset(
                        icon,
                        width: 20,
                        height: 20,
                      ),
                      Dimens.boxWidth15,
                      Expanded(
                        child: Text(
                          title ?? "",
                          style: TextStyle(
                            color: Color(0xffD2D0D0),
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class MenuItemHeader extends StatelessWidget {
  MenuItemHeader({
    Key? key,
    this.title,
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

  String? title;
  String icon;
  bool? isexpand;
  bool? menuButton;
  double? fontSize;
  double? height;
  double? width;
  Color? color;
  double? wid;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
            child: Column(
          children: [
            Dimens.boxHeight15,
            InkWell(
              onTap: press,
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    width: 50,
                    height: 50,
                  ),
                  Dimens.boxWidth15,
                  Expanded(
                    child: Text(
                      title ?? "",
                      style: TextStyle(
                        color: Color(0xffD2D0D0),
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
