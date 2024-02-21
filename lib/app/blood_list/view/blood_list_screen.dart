import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/home/home_controller.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';
import '../blood_list_controller.dart';
import 'blood_listContent_mobile.dart';
import 'blood_listContent_web.dart';

class BloodListScreen extends GetView<BloodListController> {
  BloodListScreen({super.key});
  final controller = Get.find<BloodListController>();
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
                    Expanded(
                      child: Column(
                        children: [
                          if (Responsive.isMobile(context))
                            Expanded(
                              child: BloodListContentMobile(),
                            ),
                          if (Responsive.isDesktop(context))
                            Expanded(
                              child: BloodListContentWeb(),
                            )
                        ],
                      ),
                    ),
                  ],
                )),
            AnimatedPositioned(
              child: HomeDrawer(),
              duration: Duration(milliseconds: 450),
            )
          ],
        ),
      ),
    );
  }
}
