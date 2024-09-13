import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../navigators/app_pages.dart';
import '../inventory_controller.dart';

class InventoryScreen extends GetView<InventoryController> {
  InventoryScreen({super.key});
  final InventoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 2;

    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
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
                      if (Responsive.isDesktop(context))
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "Assets",
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
                        crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                        childAspectRatio: Responsive.isMobile(context)
                            ? (itemWidth / itemHeight)
                            : 5,
                        children: <Widget>[
                          _inventoryList(
                              tittle: "Assets List",
                              ontap: () {
                                Get.toNamed(
                                  Routes.inventoryList,
                                );
                                //  controller.createChecklist();
                              }),
                          _inventoryList(
                              tittle: "Add Assets",
                              ontap: () {
                                Get.toNamed(
                                  Routes.addInventoryScreen,
                                );
                              }),
                          _inventoryList(
                              tittle: "Import Assets",
                              ontap: () {
                                Get.toNamed(Routes.importInventory, arguments: {
                                  'importType': AppConstants.kImportAsset
                                });
                              }),
                          // _inventoryList(
                          //     tittle: "Inventory Category",
                          //     ontap: () {
                          //       Get.toNamed(
                          //         Routes.assetTypeListScreen,
                          //       );
                          //     }),
                          // _inventoryList(
                          //     tittle: "Inventory Type",
                          //     ontap: () {
                          //       Get.toNamed(
                          //       Routes.inventoryTypeListScreen,
                          //     );
                          //   }),
                          // _inventoryList(
                          //     tittle: "Inventory Status",
                          //     ontap: () {
                          //       Get.toNamed(
                          //         Routes.inventoryStatusListScreen,
                          //       );
                          //     }),
                        ],
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(16),
                        crossAxisSpacing: 70,
                        mainAxisSpacing: 6,
                        crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                        childAspectRatio: Responsive.isMobile(context)
                            ? (itemWidth / itemHeight)
                            : 5,
                        children: <Widget>[
                          // _inventoryList(
                          //     tittle: "Warranty Certificates",
                          //     ontap: () {
                          //       // controller.pmSchedule();
                          //       Get.toNamed(
                          //         Routes.warrantyCertificate,
                          //       );
                          //     }),
                          varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kWarrantyClaimFeatureId &&
                                          e.view ==
                                              UserAccessConstants.kHaveViewAccess)
                                      .length >
                                  0
                              ? _inventoryList(
                                  tittle: "Warranty Claims List",
                                  ontap: () => controller.breakdownMaintenance(),
                                )
                              : Container(),
      
                          varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kWarrantyClaimFeatureId &&
                                          e.add ==
                                              UserAccessConstants.kHaveAddAccess)
                                      .length >
                                  0
                              ? _inventoryList(
                                  tittle: "New Warranty Claim",
                                  ontap: () {
                                    controller.newWarrantyClaimList();
                                  })
                              : Container(),
      
                          // _inventoryList(
                          //     tittle: "Inventory Category",
                          //     ontap: () {
                          //       Get.toNamed(
                          //         Routes.assetTypeListScreen,
                          //       );
                          //     }),
                          // _inventoryList(
                          //     tittle: "Inventory Type",
                          //     ontap: () {
                          //       Get.toNamed(
                          //       Routes.inventoryTypeListScreen,
                          //     );
                          //   }),
                          // _inventoryList(
                          //     tittle: "Inventory Status",
                          //     ontap: () {
                          //       Get.toNamed(
                          //         Routes.inventoryStatusListScreen,
                          //       );
                          //     }),
                        ],
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(16),
                        crossAxisSpacing: 70,
                        mainAxisSpacing: 6,
                        crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                        childAspectRatio: Responsive.isMobile(context)
                            ? (itemWidth / itemHeight)
                            : 5,
                        children: <Widget>[
                          // _inventoryList(
                          //     tittle: "Calibration Certificates",
                          //     ontap: () {
                          //       Get.toNamed(
                          //         Routes.calibrationCertificate,
                          //       );
                          //     }),
                          _inventoryList(
                              tittle: "Calibration List",
                              ontap: () {
                                Get.toNamed(
                                  Routes.calibrationList,
                                );
                              }),
                         
                          // _inventoryList(
                          //     tittle: "Inventory Category",
                          //     ontap: () {
                          //       Get.toNamed(
                          //         Routes.assetTypeListScreen,
                          //       );
                          //     }),
                          // _inventoryList(
                          //     tittle: "Inventory Type",
                          //     ontap: () {
                          //       Get.toNamed(
                          //       Routes.inventoryTypeListScreen,
                          //     );
                          //   }),
                          // _inventoryList(
                          //     tittle: "Inventory Status",
                          //     ontap: () {
                          //       Get.toNamed(
                          //         Routes.inventoryStatusListScreen,
                          //       );
                          //     }),
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
                        padding: const EdgeInsets.all(16),
                        crossAxisSpacing: 70,
                        mainAxisSpacing: 6,
                        crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                        childAspectRatio: Responsive.isMobile(context)
                            ? (itemWidth / itemHeight)
                            : 5,
                        children: <Widget>[
                          _inventoryList(
                              tittle: "Assets Category",
                              ontap: () {
                                Get.toNamed(
                                  Routes.inventoryCategory,
                                );
                              }),
                          _inventoryList(
                              tittle: "Assets Type",
                              ontap: () {
                                Get.toNamed(
                                  Routes.inventoryTypeListScreen,
                                );
                              }),
                          _inventoryList(
                              tittle: "Assets Status",
                              ontap: () {
                                controller.inventoryStatusScreen();
                              }),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _inventoryList({required String tittle, Function()? ontap}) {
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
          // padding: EdgeInsets.all(9),
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
