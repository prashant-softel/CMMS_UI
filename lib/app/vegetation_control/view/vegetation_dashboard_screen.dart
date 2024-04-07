import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/vegetation_control/vegetation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegetationDashboardScreen extends GetView<VegetationDashboardController> {
  VegetationDashboardScreen({super.key});
  final VegetationDashboardController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 50) / 4;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              title: HeaderWidget(),
              elevation: 0,
            ),
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
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (Responsive.isMobile(context))
                            Obx(
                              () => Container(
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                ),
                              ),
                            ),
                          if (Responsive.isDesktop(context))
                            HeaderWidgetAllDash(),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Vegetation Control",
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
                            crossAxisSpacing: 70,
                            mainAxisSpacing: 6,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : 5,
                            children: <Widget>[
                              _vegetationList(
                                  tittle: "Planning",
                                  ontap: () {
                                    Get.offNamed(
                                      Routes.vegetationPlanListScreen,
                                    );
                                  }),
                              //  if (Responsive.isDesktop(context))
                              _vegetationList(
                                  tittle: "Execution",
                                  ontap: () {
                                    Get.offNamed(
                                      Routes.vegExecutionListScreen,
                                    );
                                  }),
                            ],
                          )
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

  _vegetationList({required String tittle, Function()? ontap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorValues.skyBlueColor,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child:
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              Center(
            child: Text(
              tittle,
              style: TextStyle(
                  color: ColorValues.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),

              textAlign: TextAlign.center, //☺ Updated
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          // ],
          // ),
        ),
      ),
    );
  }
}
