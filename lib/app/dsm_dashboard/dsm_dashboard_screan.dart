import 'package:cmms/app/app.dart';
import 'package:cmms/app/dsm_dashboard/dsm_dashboard_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onHover.dart';

// import '../../navigators/app_pages.dart';

class DsmDashboard extends GetView<DsmDashboardController> {
  DsmDashboard({super.key});

  final DsmDashboardController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

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
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
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
                children: [
                  // (Responsive.isMobile(context) || Responsive.isTablet(context))
                  //     ? Dimens.box0
                  //     :
                  //     //
                  //     HomeDrawer(),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (Responsive.isDesktop(context))
                            HeaderWidgetAllDash(),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "DSM Charges",
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
                                    // OnHover(builder: (((isHovered) {
                                    //   return createContentTile(
                                    //       title: "DSM Charges", onTap: () {});
                                    // }))),
                                    OnHover(builder: (((isHovered) {
                                      return createContentTile(
                                          title: "DSM List",
                                          onTap: () {
                                            controller
                                                .goToImportDsmListChargesScreen();
                                          });
                                    }))),
                                    OnHover(builder: (((isHovered) {
                                      return createContentTile(
                                          title: "Import DSM",
                                          onTap: () {
                                            controller
                                                .goToImportDsmChargesScreen();
                                          });
                                    }))),
                                  ],
                                ),
                              ],
                            )),
                          ),
                        ]),
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
          // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: ColorValues.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),

                  textAlign: TextAlign.center, // Updated
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
