import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../frequency_list_controller.dart';
import 'frequency_listContent_mobile.dart';
import 'frequency_listContent_web.dart';

class FrequencyListScreen extends GetView<FrequencyListController> {
  FrequencyListScreen({super.key});
  final controller = Get.find<FrequencyListController>();

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
                        child: FrequencyListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: FrequencyListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
