import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home_controller.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../asset_master_Controller.dart';
import 'asset_master_mobile.dart';
import 'asset_master_web.dart';
// import '../mrs_Details_Controller.dart';
// import 'mrs_Details_mobile.dart';
// import 'mrs_Details_web.dart';

class AssetMasterScreen extends GetView<AssetMasterController> {
  AssetMasterScreen({super.key});

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
              title: Text('Asset Master List'),
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
                        child: AssetMasterMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: AssetMasterWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
