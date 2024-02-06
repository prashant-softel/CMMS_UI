import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../business_list_controller.dart';
import 'business_listContent_mobile.dart';
import 'business_listContent_web.dart';

class BusinessListScreen extends GetView<BusinessListController> {
  BusinessListScreen({super.key});
  final controller = Get.find<BusinessListController>();

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
                        child: BusinessListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: BusinessListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
