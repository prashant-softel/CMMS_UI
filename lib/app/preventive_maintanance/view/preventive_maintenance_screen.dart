import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../preventive_maintenance_controller.dart';

class PreventiveScreen extends GetView<PreventiveController> {
  PreventiveScreen({super.key});
  final PreventiveController controller = Get.find();
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
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (Responsive.isMobile(context))
                              Obx(
                                () => Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Card(
                                      shadowColor: ColorValues.greyColor,
                                      elevation: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            // isExpanded: true,
                                            value: controller
                                                .selectedFacility.value,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            elevation: 9,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            onChanged: (String? selectedValue) {
                                              controller.isFacilitySelected
                                                  .value = true;
                                              controller.selectedFacility
                                                  .value = selectedValue ?? '';
                                            },
                                            items: controller.facilityList
                                                .map<DropdownMenuItem<String>>(
                                                    (facility) {
                                              return DropdownMenuItem<String>(
                                                value: facility?.name ?? '',
                                                child:
                                                    Text(facility?.name ?? ''),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (Responsive.isDesktop(context)) HeaderWidget(),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Preventive Maintenance",
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
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 6,
                              crossAxisCount:
                                  Responsive.isMobile(context) ? 2 : 5,
                              childAspectRatio: Responsive.isMobile(context)
                                  ? (itemWidth / itemHeight)
                                  : 5,
                              children: <Widget>[
                                _priventiveList(
                                    tittle: "PM Plans",
                                    ontap: () {
                                      controller.pmPlanList();
                                    }),
                                _priventiveList(
                                    tittle: "Import Plan",
                                    ontap: () {
                                      controller.importPlan();
                                    }),
                                _priventiveList(
                                    tittle: "PM Tasks",
                                    ontap: () {
                                      controller.pmTask();
                                    }),
                              ],
                            ),
                            // GridView.count(
                            //   shrinkWrap: true,
                            //   primary: false,
                            //   padding: const EdgeInsets.all(16),
                            //   crossAxisSpacing: 40,
                            //   mainAxisSpacing: 6,
                            //   crossAxisCount:
                            //       Responsive.isMobile(context) ? 2 : 5,
                            //   childAspectRatio: Responsive.isMobile(context)
                            //       ? (itemWidth / itemHeight)
                            //       : 5,
                            //   children: <Widget>[
                            //     _priventiveList(
                            //         tittle: "PM Tasks",
                            //         ontap: () {
                            //           controller.pmTask();
                            //         }),
                            //   ],
                            // ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Masters",
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
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 6,
                              crossAxisCount:
                                  Responsive.isMobile(context) ? 2 : 5,
                              childAspectRatio: Responsive.isMobile(context)
                                  ? (itemWidth / itemHeight)
                                  : 5,
                              children: <Widget>[
                                _priventiveList(
                                    tittle: "Check List",
                                    ontap: () {
                                      controller.createChecklist();
                                    }),
                                _priventiveList(
                                    tittle: "Check Point",
                                    ontap: () {
                                      controller.checkPoint();
                                    }),
                                _priventiveList(
                                    tittle: "Import Checklist",
                                    ontap: () {
                                      controller.importChecklist();
                                    }),
                              ],
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
        ));
  }

  _priventiveList({required String tittle, Function()? ontap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorValues.skyBlueColor,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: EdgeInsets.all(9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  tittle,
                  style: TextStyle(
                      color: ColorValues.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
