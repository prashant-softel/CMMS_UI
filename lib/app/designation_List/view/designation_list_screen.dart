import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home_controller.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
// import '../module_list_controller.dart';
import '../designation_list_controller.dart';
import 'designation_listContent_mobile.dart';
import 'designation_listContent_web.dart';

  class DesignationListScreen extends GetView<DesignationListController> {
  DesignationListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Module List'),
              centerTitle: true,
              elevation: 0,
            ),
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
                    if (Responsive.isMobile(context) ||
                        Responsive.isTablet(context))
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
