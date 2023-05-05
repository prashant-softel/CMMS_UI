import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../navigators/app_pages.dart';
import '../preventive_maintenance_controller.dart';

class PreventiveScreen extends GetView<PreventiveController> {
  PreventiveScreen({super.key});
  final PreventiveController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 90) / 10;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 3;

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: HeaderWidget(),
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Row(
          children: [
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                :
                //
                HomeDrawer(),
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
                            child: Card(
                              shadowColor: ColorValues.greyColor,
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    // isExpanded: true,
                                    value: controller.selectedFacility.value,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    elevation: 9,
                                    style: const TextStyle(color: Colors.black),
                                    onChanged: (String? selectedValue) {
                                      controller.isFacilitySelected.value =
                                          true;
                                      controller.selectedFacility.value =
                                          selectedValue ?? '';
                                    },
                                    items: controller.facilityList
                                        .map<DropdownMenuItem<String>>(
                                            (facility) {
                                      return DropdownMenuItem<String>(
                                        value: facility?.name ?? '',
                                        child: Text(facility?.name ?? ''),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (Responsive.isDesktop(context))
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Preventive Maintenance",
                          style: TextStyle(
                              color: Color.fromARGB(255, 159, 156, 156),
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(16),
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                      childAspectRatio: Responsive.isMobile(context)
                          ? (itemWidth / itemHeight)
                          : (itemWidth / itemHeightWeb),
                      children: <Widget>[
                        _priventiveList(
                            tittle: "Create CheckList",
                            ontap: () {
                              controller.createChecklist();
                            }),
                        //  if (Responsive.isDesktop(context))
                        _priventiveList(
                            tittle: "Check Point Creator",
                            ontap: () {
                              // Get.toNamed(
                              //   Routes.preventive_checkPoint,
                              // );
                              controller.checkPoint();
                            }),
                        _priventiveList(
                            tittle: "CheckList Mapping",
                            ontap: () {
                              Get.toNamed(
                                Routes.preventiveMaintenanceMapping,
                              );
                              //    controller.pmMapping();
                            }),
                        _priventiveList(
                            tittle: "PM Schedule",
                            ontap: () {
                              controller.pmSchedule();
                            }),
                        _priventiveList(
                            tittle: "PM Tasks",
                            ontap: () {
                              controller.pmTask();
                            }),
                        _priventiveList(tittle: "PM Report"),
                        _priventiveList(
                            tittle: "PM Execution",
                            ontap: () {
                              controller.pmExecution();
                            }),
                        _priventiveList(tittle: "Maintenance Report"),
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  _priventiveList({required String tittle, Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorValues.appLightBlueColor,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.all(9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                tittle,
                style: TextStyle(
                    color: ColorValues.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 245, 245),
                border: Border.all(
                  color: ColorValues.whiteColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.format_list_bulleted,
                size: 30,
                color: ColorValues.appLightBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
