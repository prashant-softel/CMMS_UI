import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/home_controller.dart';
import '../../utils/responsive.dart';
import 'mobile/inventory_list_content_mobile.dart';
import 'web/inventory_list_content_web.dart';

class InventoryListScreen extends GetView<HomeController> {
  InventoryListScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body:
          //   Obx(
          // () => //
          Container(
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
    );

    ///
  }
}
