import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'mobile/inventory_list_content_mobile.dart';
import 'web/inventory_list_content_web.dart';

class InventoryListScreen extends GetView<InventoryListController> {
  InventoryListScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
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
      body:
          //   Obx(
          // () => //
          Container(
        child: Row(
          children: [
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                :
                //
                HomeDrawer(),
            Expanded(
              child: Column(
                  //
                  children: [
                    if (Responsive.isMobile(context))
                      Expanded(
                        child: InventoryListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: //
                            InventoryListContentWeb(),
                      ),
                  ]),
            ),
          ],
        ),
      ),
    );

    ///
  }
}
