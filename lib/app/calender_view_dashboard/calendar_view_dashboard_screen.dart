import 'package:cmms/app/app.dart';
import 'package:cmms/app/calender_view_dashboard/calendar_view_dashboard_controller.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onHover.dart';



class CalendarViewDashbordScreen
    extends GetView<CalendarViewDashbordController> {
  CalendarViewDashbordScreen({super.key});

  final CalendarViewDashbordController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;


    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: Text("Document Versioning"),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (Responsive.isDesktop(context))
                            HeaderWidgetAllDash(),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Calender View",
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
                                  ),
                                  GridView.count(
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: Dimens.edgeInsets15,
                                    crossAxisSpacing: 70,
                                    mainAxisSpacing: 6,
                                    crossAxisCount:
                                        Responsive.isMobile(context) ? 2 : 5,
                                    childAspectRatio:
                                        Responsive.isMobile(context)
                                            ? (itemWidth / itemHeight)
                                            : 5,
                                    children: <Widget>[
                                      OnHover(builder: (((isHovered) {
                                        return createContentTile(
                                            title: "Calender View ",
                                            onTap: () {
                                              // controller.goToDocumentManager();
                                            });
                                      }))),
                                    ],
                                  ),
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
