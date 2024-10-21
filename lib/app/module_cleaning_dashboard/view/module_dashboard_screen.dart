import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/module_cleaning_dashboard/module_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleCleaningDashboardScreen
    extends GetView<ModuleCleaningDashboardController> {
  ModuleCleaningDashboardScreen({super.key});
  final ModuleCleaningDashboardController controller = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: Text("Module Cleaning"),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? HomeDrawerMobile()
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
                        children: [
                          (Responsive.isDesktop(context))
                              ? HeaderWidgetAllDash()
                              : Dimens.box0,
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Module Cleaning",
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
                            padding: const EdgeInsets.all(16),
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
                                                      .kModuleCleaningplanFeatureId &&
                                              e.view ==
                                                  UserAccessConstants
                                                      .kHaveViewAccess)
                                          .length >
                                      0
                                  ? _moduleCleaningList(
                                      tittle: "Planning",
                                      ontap: () {
                                        Get.toNamed(
                                          Routes.moduleCleaningListPlan,
                                        );
                                      })
                                  : Dimens.box0,
                              //  if (Responsive.isDesktop(context))
                              varUserAccessModel.value.access_list!
                                          .where((e) =>
                                              e.feature_id ==
                                                  UserAccessConstants
                                                      .kModuleCleaningexeFeatureId &&
                                              e.view ==
                                                  UserAccessConstants
                                                      .kHaveViewAccess)
                                          .length >
                                      0
                                  ? _moduleCleaningList(
                                      tittle: "Execution",
                                      ontap: () {
                                        Get.toNamed(
                                          Routes.moduleCleaningListExecution,
                                        );
                                      })
                                  : Dimens.box0
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
                                        ? _moduleCleaningList(
                                            tittle: "Add Plan",
                                            ontap: () {
                                              controller.clearStoreDataMcid();
                                              controller.clearStoreDataPlanid();
                                              Get.offNamed(
                                                Routes.moduleCleaningPlanning,
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

  _moduleCleaningList({required String tittle, Function()? ontap}) {
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
// //new tab code
// import 'dart:html' as html;
// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/constant/constant.dart';
// import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
// import 'package:cmms/app/module_cleaning_dashboard/module_controller.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/app/utils/user_access_constants.dart';
// import 'package:cmms/app/home/widgets/mobile_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ModuleCleaningDashboardScreen
//     extends GetView<ModuleCleaningDashboardController> {
//   ModuleCleaningDashboardScreen({super.key});
//   final ModuleCleaningDashboardController controller = Get.find();
//   final HomeController homeController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     var size = Get;

//     final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
//     final double itemWidth = size.width / 2;

//     return Scaffold(
//       appBar: Responsive.isMobile(context)
//           ? AppBar(
//               title: Text("Module Cleaning"),
//               centerTitle: true,
//               elevation: 0,
//             )
//           : null,
//       drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
//           ? HomeDrawerMobile()
//           : null,
//       body: Obx(
//         () => Stack(
//           children: [
//             AnimatedContainer(
//               duration: Duration(milliseconds: 450),
//               margin: EdgeInsets.only(
//                 left: Responsive.isDesktop(context)
//                     ? homeController.menuButton.value
//                         ? 250.0
//                         : 70.0
//                     : 0,
//               ),
//               width: Get.width,
//               height: Get.height,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           (Responsive.isDesktop(context))
//                               ? HeaderWidgetAllDash()
//                               : Dimens.box0,
//                           Container(
//                             margin: EdgeInsets.only(left: 20),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Module Cleaning",
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 159, 156, 156),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: Divider(
//                                     color: Colors.grey,
//                                     height: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           GridView.count(
//                             shrinkWrap: true,
//                             primary: false,
//                             padding: const EdgeInsets.all(16),
//                             crossAxisSpacing: 70,
//                             mainAxisSpacing: 6,
//                             crossAxisCount:
//                                 Responsive.isMobile(context) ? 2 : 5,
//                             childAspectRatio: Responsive.isMobile(context)
//                                 ? (itemWidth / itemHeight)
//                                 : 5,
//                             children: <Widget>[
//                               varUserAccessModel.value.access_list!
//                                           .where((e) =>
//                                               e.feature_id ==
//                                                   UserAccessConstants
//                                                       .kModuleCleaningplanFeatureId &&
//                                               e.view ==
//                                                   UserAccessConstants
//                                                       .kHaveViewAccess)
//                                           .length >
//                                       0
//                                   ? _moduleCleaningList(
//                                       title: "Planning",
//                                       ontap: () {
//                                         Get.toNamed(
//                                           Routes.moduleCleaningListPlan,
//                                         );
//                                       },
//                                       routeName: Routes.moduleCleaningListPlan, // Pass route name
//                                       context: context, // Pass the context
//                                     )
//                                   : Dimens.box0,
//                               varUserAccessModel.value.access_list!
//                                           .where((e) =>
//                                               e.feature_id ==
//                                                   UserAccessConstants
//                                                       .kModuleCleaningexeFeatureId &&
//                                               e.view ==
//                                                   UserAccessConstants
//                                                       .kHaveViewAccess)
//                                           .length >
//                                       0
//                                   ? _moduleCleaningList(
//                                       title: "Execution",
//                                       ontap: () {
//                                         Get.toNamed(
//                                           Routes.moduleCleaningListExecution,
//                                         );
//                                       },
//                                       routeName: Routes.moduleCleaningListExecution, // Pass route name
//                                       context: context, // Pass the context
//                                     )
//                                   : Dimens.box0
//                             ],
//                           ),
//                           Responsive.isMobile(context)
//                               ? GridView.count(
//                                   shrinkWrap: true,
//                                   primary: false,
//                                   padding: Dimens.edgeInsets15,
//                                   crossAxisSpacing: 70,
//                                   mainAxisSpacing: 6,
//                                   crossAxisCount:
//                                       Responsive.isMobile(context) ? 2 : 5,
//                                   childAspectRatio: Responsive.isMobile(context)
//                                       ? (itemWidth / itemHeight)
//                                       : 5,
//                                   children: <Widget>[
//                                     varUserAccessModel.value.access_list!
//                                                 .where((e) =>
//                                                     e.feature_id ==
//                                                         UserAccessConstants
//                                                             .kVegetationControlFeatureId &&
//                                                     e.add ==
//                                                         UserAccessConstants
//                                                             .kHaveAddAccess)
//                                                 .length >
//                                             0
//                                         ? _moduleCleaningList(
//                                             title: "Add Plan",
//                                             ontap: () {
//                                               controller.clearStoreDataMcid();
//                                               controller.clearStoreDataPlanid();
//                                               Get.offNamed(
//                                                 Routes.moduleCleaningPlanning,
//                                               );
//                                             },
//                                             routeName: Routes.moduleCleaningPlanning, // Pass route name
//                                             context: context, // Pass the context
//                                           )
//                                         : Dimens.box0,
//                                   ],
//                                 )
//                               : Dimens.box0,
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Responsive.isDesktop(context)
//                 ? AnimatedPositioned(
//                     duration: Duration(milliseconds: 450),
//                     child: HomeDrawer(),
//                   )
//                 : Dimens.box0
//           ],
//         ),
//       ),
//     );
//   }

//   // Updated function with right-click context menu
//   Widget _moduleCleaningList({
//     required String title,
//     Function()? ontap,
//     required String routeName, // Added routeName parameter
//     required BuildContext context, // Added context parameter
//   }) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: ontap,
//         onSecondaryTapDown: (details) {
//           _showContextMenu(details, routeName, context); // Pass context
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             color: ColorValues.skyBlueColor,
//             borderRadius: BorderRadius.circular(2),
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 color: ColorValues.whiteColor,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showContextMenu(TapDownDetails details, String routeName, BuildContext context) {
//     final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

//     showMenu(
//       context: context,
//       position: RelativeRect.fromRect(
//         details.globalPosition & const Size(40, 40),
//         Offset.zero & overlay.size,
//       ),
//       items: [
//         PopupMenuItem(
//           child: Text('Open in New Tab'),
//           onTap: () {
//             _openInNewTab(routeName);
//           },
//         ),
//       ],
//     );
//   }

//   void _openInNewTab(String routeName) {
//     // Use 'dart:html' to open a new tab in the browser
//     String fullUrl = '${html.window.location.origin}/#/$routeName';
//     html.window.open(fullUrl, '_blank');
//   }
// }
