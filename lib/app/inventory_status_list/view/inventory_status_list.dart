import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/inventory_status_list/view/inventory_status_list_mobile.dart';
import 'package:cmms/app/inventory_status_list/view/inventory_status_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../inventory_status_list_controller.dart';

class InventoryStatusListScreen extends GetView<InventoryStatusListController> {
  InventoryStatusListScreen({super.key});
  final controller = Get.find<InventoryStatusListController>();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer()
              : null,
      body: Obx(
        () => Stack(
          children: [
            AnimatedContainer(
                duration: Duration(milliseconds: 450),
                margin: EdgeInsets.only(
                    left: homecontroller.menuButton.value ? 250.0 : 70.0),
                width: Get.width,
                height: Get.height,
                child: Row(
                  children: [
                    (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                        ? Dimens.box0
                        : Container(),
                    Expanded(
                      child: Column(
                        children: [
                          if (Responsive.isMobile(context))
                            Expanded(
                              child: InventoryStatusListContentMobile(),
                            ),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: InventoryStatusListContentWeb(),
                            )
                        ],
                      ),
                    ),
                  ],
                )),
            AnimatedPositioned(
                child: HomeDrawer(), duration: Duration(milliseconds: 450))
          ],
        ),
      ),
    );
  }
}
