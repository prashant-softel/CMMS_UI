import 'package:cmms/app/app.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/app/breakdown_maintenance/breakdown_maintenance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';

// import '../../navigators/app_pages.dart';

class BreakdownMaintenanceScreen
    extends GetView<BreakdownMaintenanceController> {
  ///
  BreakdownMaintenanceScreen({super.key});

  final BreakdownMaintenanceController controller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    ///
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 6;
    final double itemWidth = size.width / 2;

    return //
        Scaffold(
      appBar: //
          Responsive.isDesktop(context)
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
                    SizedBox(
                      height: 40,
                    ),
                    if (Responsive.isMobile(context) ||
                        Responsive.isTablet(context))
                      Obx(
                        () => //
                            Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              shadowColor: ColorValues.greyColor,
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: controller.selectedFacility.value,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    elevation: 7,
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
                          "Breakdown Maintenance",
                          style: TextStyle(
                            color: Color.fromARGB(255, 159, 156, 156),
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                    /// GRID TILES
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: Dimens.edgeInsets15,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 2,
                      childAspectRatio: Responsive.isMobile(context)
                          ? (itemWidth / itemHeight)
                          : (itemWidth / itemHeightWeb),
                      children: <Widget>[
                        createContentTile(
                            title: "Job List",
                            onTap: () {
                              controller.goToJobListScreen();
                            }),
                        createContentTile(
                            title: 'Add New Job',
                            onTap: () {
                              controller.addNewJob();
                            }),
                        createContentTile(
                            title: "Permit List",
                            onTap: () {
                              controller.newPermitList();
                            }),
                        createContentTile(
                            title: "Add New Permit",
                            onTap: () {
                              controller.createNewPermit();
                            }),
                        createContentTile(
                            title: "Permit Type",
                            onTap: () {
                              controller.goToPermitTypeScreen();
                            }),
                        createContentTile(
                            title: "Safety Questions",
                            onTap: () {
                              controller.gotToSafetyQuestionsList();
                            }),
                        createContentTile(
                            title: "TBT Type",
                            onTap: () {
                              controller.goToJobTypeList();
                            }),
                        createContentTile(
                            title: "TBT SOP List",
                            onTap: () {
                              controller.goToJobSOPList();
                            }),
                        createContentTile(title: "Job Card List"),
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget createContentTile({required String title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
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
                title,
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
