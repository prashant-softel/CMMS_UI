import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
// import '../module_list_controller.dart';
import '../designation_list_controller.dart';
import 'designation_listContent_mobile.dart';
import 'designation_listContent_web.dart';

class DesignationListScreen extends GetView<DesignationListController> {
  DesignationListScreen({super.key});
  final controller = Get.find<DesignationListController>();

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
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
                    if (Responsive.isMobile(context))
                      Expanded(
                        child: DesignationListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: DesignationListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
