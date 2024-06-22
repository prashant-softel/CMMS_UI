import 'package:cmms/app/administration_dashboard_screen/admin_dash_controller.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                title: "Attendace List",
                                onTap: () {
                                  Get.offNamed(Routes.attendanceListScreen);
                                },
                              ),
                              createContentTile(
                                title: "Attendace List MonthWise",
                                onTap: () {
                                  Get.offNamed(Routes.attendanceListMonthwise);
                                },
                              ),
                              createContentTile(
                                title: "Attendace",
                                onTap: () {
                                  controller.clearStoreData();
                                  DateTime date = DateTime.now();
                                  String currentDate =
                                      DateFormat("yyyy-MM-dd").format(date);
                                  print("current date : ${currentDate}");
                                  Get.offNamed(Routes.attendanceScreen,
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
