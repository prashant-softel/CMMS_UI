import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/vegetation_control/vegetation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';

class VegetationDashboardScreen extends GetView<VegetationDashboardController> {
  VegetationDashboardScreen({super.key});
  final VegetationDashboardController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              // leading: IconButton(
              //   icon: Icons.menu,
              //   onPressed: () {},
              // ),
              title: Text("Vegetation Control"),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
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
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Responsive.isDesktop(context)
                              ? HeaderWidgetAllDash()
                              : Dimens.box0,
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
                            crossAxisCount:
                                Responsive.isMobile(context) ? 2 : 5,
                            childAspectRatio: Responsive.isMobile(context)
                                ? (itemWidth / itemHeight)
                                : 5,
                            children: <Widget>[
                              varUserAccessModel.value.access_list!
                                          .where((e) =>
                                              e.feature_id ==
                                                  UserAccessConstants
                                                      .kVegetationControlFeatureId &&
                                              e.view ==
                                                  UserAccessConstants
                                                      .kHaveViewAccess)
                                          .length >
                                      0
                                  ? _vegetationList(
                                      tittle: "Planning",
                                      ontap: () {
                                        Get.toNamed(
                                          Routes.vegetationPlanListScreen,
                                        );
                                      },
                                    )
                                  : Dimens.box0,
                              //  if (Responsive.isDesktop(context))
                              varUserAccessModel.value.access_list!
                                          .where((e) =>
                                              e.feature_id ==
                                                  UserAccessConstants
                                                      .kVegetationControlexeFeatureId &&
                                              e.view ==
                                                  UserAccessConstants
                                                      .kHaveViewAccess)
                                          .length >
                                      0
                                  ? _vegetationList(
                                      tittle: "Execution",
                                      ontap: () {
                                        Get.toNamed(
                                          Routes.vegExecutionListScreen,
                                        );
                                      },
                                    )
                                  : Dimens.box0,
                            ],
                          ),
                          Responsive.isMobile(context)
                              ? GridView.count(
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
                                    varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kVegetationControlFeatureId &&
                                                    e.add ==
                                                        UserAccessConstants
                                                            .kHaveAddAccess)
                                                .length >
                                            0
                                        ? _vegetationList(
                                            tittle: "Add Plan",
                                            ontap: () {
                                              Get.toNamed(
                                                Routes.addVegetationPlanScreen,
                                              );
                                            },
                                          )
                                        : Dimens.box0,
                                  ],
                                )
                              : Dimens.box0,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //       height: 40,
              //     ),
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           if (Responsive.isMobile(context))
              //             Obx(
              //               () => Container(
              //                 width: Get.width,
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(15.0),
              //                 ),
              //               ),
              //             ),
              //           if (Responsive.isDesktop(context))
              //             HeaderWidgetAllDash(),
              //           Container(
              //             margin: EdgeInsets.only(left: 20),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   "Vegetation Control",
              //                   style: TextStyle(
              //                     color: Color.fromARGB(255, 159, 156, 156),
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w400,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                     width:
              //                         10), // Add some space between the text and the line
              //                 Expanded(
              //                   child: Divider(
              //                     color: Colors
              //                         .grey, // Customize the color of the line if needed
              //                     height:
              //                         1, // Adjust the height of the line if needed
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           GridView.count(
              //             shrinkWrap: true,
              //             primary: false,
              //             padding: const EdgeInsets.all(16),
              //             crossAxisSpacing: 70,
              //             mainAxisSpacing: 6,
              //             crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
              //             childAspectRatio: Responsive.isMobile(context)
              //                 ? (itemWidth / itemHeight)
              //                 : 5,
              //             children: <Widget>[
              //               varUserAccessModel.value.access_list!
              //                           .where((e) =>
              //                               e.feature_id ==
              //                                   UserAccessConstants
              //                                       .kVegetationControlFeatureId &&
              //                               e.view ==
              //                                   UserAccessConstants
              //                                       .kHaveViewAccess)
              //                           .length >
              //                       0
              //                   ? _vegetationList(
              //                       tittle: "Planning",
              //                       ontap: () {
              //                         Get.offNamed(
              //                           Routes.vegetationPlanListScreen,
              //                         );
              //                       })
              //                   : Dimens.box0,
              //               //  if (Responsive.isDesktop(context))
              //               varUserAccessModel.value.access_list!
              //                           .where((e) =>
              //                               e.feature_id ==
              //                                   UserAccessConstants
              //                                       .kVegetationControlexeFeatureId &&
              //                               e.view ==
              //                                   UserAccessConstants
              //                                       .kHaveViewAccess)
              //                           .length >
              //                       0
              //                   ? _vegetationList(
              //                       tittle: "Execution",
              //                       ontap: () {
              //                         Get.offNamed(
              //                           Routes.vegExecutionListScreen,
              //                         );
              //                       })
              //                   : Dimens.box0,
              //             ],
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ),
            Responsive.isDesktop(context)
                ? AnimatedPositioned(
                    duration: Duration(milliseconds: 450),
                    child: HomeDrawer(),
                  )
                : Dimens.box0
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
          child: Center(
            child: Text(
              tittle,
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
