import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/stock_management/stock_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/header_widget_all_dash.dart';
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
              // leading: IconButton(
              //   icon: Icons.menu,
              //   onPressed: () {},
              // ),
              title: Text(
                "Stock Management",
              ),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawerMobile() //ResponsiveSideMenu()
              : null,
      body: Stack(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          HeaderWidgetAllDash(),
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
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
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
                            //   tittle: "Receive Goods Order",
                            //    ontap: () {
                            //   Get.toNamed(
                            //         Routes.receiveGoodsOrders,
                            //       );

                            //       // controller.receiveGoodsOrders();
                            //    }),
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
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
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
                          crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
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
                            _importPlan(
                                tittle: "Import Material",
                                ontap: () {
                                  controller.importMaterial();
                                }),
                          ],
                        ),
                      ]),
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
    );
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
