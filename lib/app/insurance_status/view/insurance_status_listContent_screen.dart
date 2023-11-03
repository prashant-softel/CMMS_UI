import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../insurance_status_listContent_controller.dart';
import 'insurance_status_listContent_mobile.dart';
import 'insurance_status_listContent_web.dart';


class InsuranceStatusScreen extends GetView<InsuranceStatusController> {
  InsuranceStatusScreen({super.key});

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
              title: Text('InsuranceStatus List'),
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
                        child: InsuranceStatusMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: InsuranceStatusWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
