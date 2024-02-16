import 'package:cmms/app/app.dart';
import 'package:cmms/app/stock_management/stock_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../navigators/app_pages.dart';

class StockManagementDashboardScreen
    extends GetView<StockManagementDashboardController> {
  StockManagementDashboardScreen({super.key});
  final StockManagementDashboardController controller = Get.find();
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
                    SizedBox(
                      height: 40,
                    ),
                    // (Responsive.isMobile(context) || Responsive.isTablet(context))
                    //     ? Dimens.box0
                    //     :
                    //     //
                    //     HomeDrawer(),
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
                                      // child: Padding(
                                      //   padding: const EdgeInsets.all(3.0),
                                      //   child: DropdownButtonHideUnderline(
                                      //     child: DropdownButton(
                                      //       onChanged: (value) {},

                                      //       icon: const Icon(
                                      //           Icons.keyboard_arrow_down_outlined),
                                      //       elevation: 9,
                                      //       style: const TextStyle(color: Colors.black),
                                      //       items: controller.facilityList
                                      //           .map<DropdownMenuItem<String>>(
                                      //               (facility) {
                                      //         return DropdownMenuItem<String>(
                                      //           value: facility?.name ?? '',
                                      //           child: Text(facility?.name ?? ''),
                                      //         );
                                      //       }).toList(),
                                      //     ),
                                      //   ),
                                      // ),
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
                                    "Stock Management",
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
                                _stockManagementList(
                                    tittle: "Request Orders",
                                    ontap: () {
                                      Get.offNamed(Routes.purchaseGoodsorder);
                                    }),

                                //  if (Responsive.isDesktop(context))
                                _stockManagementList(
                                    tittle: "Goods Order  List",
                                    ontap: () {
                                      Get.toNamed(
                                        Routes.stockManagementGoodsOrdersScreen,
                                      );
                                      //controller.checkPoint();
                                    }),
                                // _stockManagementList(
                                //     tittle: "Receive Goods Order ",
                                //     ontap: () {
                                //       Get.toNamed(
                                //         Routes.receiveGoodsOrders,
                                //       );

                                //       // controller.receiveGoodsOrders();
                                //     }),
                              ],
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
                                _stockManagementList(
                                    tittle: "MRS List",
                                    ontap: () {
                                      Get.offNamed(Routes.mrsListScreen);
                                    }),
                                _stockManagementList(
                                    tittle: "MRS Return",
                                    ontap: () {
                                      Get.offNamed(Routes.returnMrsList);
                                    }),
                                // _stockManagementList(
                                //   tittle: "S2S Material Transfer",
                                //   // ontap: () {
                                //   //   controller.pmTask();
                                //   // }
                                // ),
                              ],
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
                                _importPlan(
                                    tittle: "Import Material",
                                    ontap: () {
                                      controller.importMaterial();
                                    }),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Stock Report",
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
                                _stockManagementList(
                                    tittle: "Plant Stock Report",
                                    ontap: () {
                                      Get.toNamed(
                                        Routes.plantStockReport,
                                      );
                                      //  controller.checkPoint();
                                    }),
                                _stockManagementList(
                                    tittle: "Employee Stock Report",
                                    ontap: () {
                                      Get.toNamed(Routes.employeeStockReport);
                                    }),
                                _stockManagementList(
                                    tittle: "Transaction Report",
                                    ontap: () {
                                      Get.toNamed(Routes.transactionReport);
                                    }),
                                _stockManagementList(
                                    tittle: "Faulty Material Report",
                                    ontap: () {
                                      Get.offNamed(Routes.faultyMaterialReport);
                                    }),
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
                              crossAxisCount:
                                  Responsive.isMobile(context) ? 2 : 5,
                              childAspectRatio: Responsive.isMobile(context)
                                  ? (itemWidth / itemHeight)
                                  : 5,
                              children: <Widget>[
                                _stockManagementList(
                                    tittle: "Asset Master",
                                    ontap: () {
                                      Get.offNamed(Routes.assetMasterList);
                                    }),
                                _stockManagementList(
                                    tittle: "Add Asset Master",
                                    ontap: () {
                                      Get.offNamed(Routes.addassetMaster);
                                    }),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                child: HomeDrawer(),
                duration: Duration(milliseconds: 450),
              )
            ],
          ),
        ));
  }

  _stockManagementList({required String tittle, Function()? ontap}) {
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
                      fontSize: 14,
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

  _importPlan({required String tittle, Function()? ontap}) {
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  tittle,
                  style: TextStyle(
                      color: ColorValues.whiteColor,
                      fontSize: 14,
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
