import 'package:cmms/app/administration_dashboard_screen/admin_dash_controller.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class AdminDashboardScreen extends GetView<AdminDashboardController> {
  AdminDashboardScreen({super.key});

  final AdminDashboardController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;
    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: Text("Administration"),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile()
          : null,
      body:
          // Obx(() =>
          Stack(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Responsive.isDesktop(context)
                            ? HeaderWidgetAllDash()
                            : Dimens.box0,
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Attendance",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 159, 156, 156),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  height: 1,
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
                              title: "Attendance Summary",
                              onTap: () {
                                Get.toNamed(Routes.attendanceListScreen);
                              },
                            ),
                            createContentTile(
                              title: "Attendance List",
                              onTap: () {
                                Get.toNamed(Routes.attendanceListMonthwise);
                              },
                            ),
                            createContentTile(
                              title: "Mark Attendace",
                              onTap: () {
                                controller.clearStoreData();
                                DateTime date = DateTime.now();
                                String currentDate =
                                    DateFormat("yyyy-MM-dd").format(date);
                                print("current date : ${currentDate}");
                                Get.toNamed(Routes.attendanceScreen,
                                    arguments: {"date": currentDate});
                              },
                            ),
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
      // ),
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
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: ColorValues.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
