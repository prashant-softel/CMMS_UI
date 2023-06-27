import 'package:cmms/app/add_asset_master/view/add_asset_master_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../add_asset_master_controller.dart';

class AddAssetMasterScreen extends GetView<AddAssetMasterController> {
  AddAssetMasterScreen({super.key});
  final AddAssetMasterController controller = Get.find();

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
              title: Text('Add user'),
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
                    // if (Responsive.isMobile(context) ||
                    //     Responsive.isTablet(context))
                    //   Expanded(
                    //     child: AddUserContentMobile(),
                    //   ),

                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: AddAssetMasterWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
