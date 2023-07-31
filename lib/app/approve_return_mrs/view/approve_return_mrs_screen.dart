import 'package:cmms/app/approve_return_mrs/approve_return_mrs_controller.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../utils/responsive.dart';
import 'approve_return_mrs_content_web.dart';

class ApproveReturnMrsScreen extends GetView<ApproveReturnMrsController> {
  ApproveReturnMrsScreen({super.key});
  final ApproveReturnMrsController controller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Preventive Check Point'),
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
                    //     child: ApproveReturnMrsContentMobile(),
                    //   ),

                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: ApproveReturnMrsContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
