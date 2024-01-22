import 'package:cmms/app/app.dart';
// import 'package:cmms/app/preventive_maintanance/preventive.dart';
import 'package:cmms/app/breakdown_maintenance/breakdown_maintenance_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
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
    var size = Get;
    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;
    final double itemWidth = size.width / 2;

    return //
        Scaffold(
      appBar: //
          Responsive.isDesktop(context)
              ? AppBar(
                  title: HeaderWidget(),
                  elevation: 0,
                  toolbarHeight: 60,
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
                        child: Row(
                          children: [
                            Text(
                              "BreakDown Maintenance",
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

                    /// GRID TILES
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
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants.kJobFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? createContentTile(
                                title: "Job List",
                                onTap: () {
                                  controller.goToJobListScreen();
                                })
                            : Container(),
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants.kJobFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0
                            ? createContentTile(
                                title: 'Add New Job',
                                onTap: () {
                                  controller.addNewJob();
                                })
                            : Container(),
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kJobCardFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? createContentTile(
                                title: "JobCard List",
                                onTap: () {
                                  controller.goToJobCardList();
                                })
                            : Container(),
                      ],
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
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPermitFeatureId &&
                                        e.view ==
                                            UserAccessConstants.kHaveViewAccess)
                                    .length >
                                0
                            ? createContentTile(
                                title: "Permit List",
                                onTap: () {
                                  controller.newPermitList();
                                })
                            : Container(),

                        //Add New Permit
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPermitFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0
                            ? createContentTile(
                                title: "Add New Permit",
                                onTap: () {
                                  controller.createNewPermit();
                                })
                            : Container(),
                      ],
                    ),

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
                      padding: Dimens.edgeInsets15,
                      crossAxisSpacing: 70,
                      mainAxisSpacing: 6,
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                      childAspectRatio: Responsive.isMobile(context)
                          ? (itemWidth / itemHeight)
                          : 5,
                      children: <Widget>[
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == 5 &&
                                        e.view == 1 &&
                                        e.add == 1)
                                    .length >
                                0
                            ? createContentTile(
                                title: "Permit Type",
                                onTap: () {
                                  controller.goToPermitTypeScreen();
                                })
                            : Dimens.box0,
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == 5 &&
                                        e.view == 1 &&
                                        e.add == 1)
                                    .length >
                                0
                            ? createContentTile(
                                title: "Permit Type Checklist",
                                onTap: () {
                                  controller.gotToSafetyQuestionsList();
                                })
                            : Dimens.box0,
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == 5 &&
                                        e.view == 1 &&
                                        e.add == 1)
                                    .length >
                                0
                            ? createContentTile(
                                title: "JOB Type",
                                onTap: () {
                                  controller.goToJobTypeList();
                                })
                            : Dimens.box0,
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == 5 &&
                                        e.view == 1 &&
                                        e.add == 1)
                                    .length >
                                0
                            ? createContentTile(
                                title: "TBT SOP List",
                                onTap: () {
                                  controller.goToJobSOPList();
                                })
                            : Dimens.box0
                      ],
                    ),
                  ]),
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
