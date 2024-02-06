import 'package:cmms/app/block_type_list/block_type_list_controller.dart';
import 'package:cmms/app/block_type_list/view/block_type_list_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'block_type_list_mobile.dart';

class BlockTypeListScreen extends GetView<BlockTypeListController> {
  BlockTypeListScreen({super.key});
  final controller = Get.find<BlockTypeListController>();

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
                        child: BlockTypeListMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: BlockTypeListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
