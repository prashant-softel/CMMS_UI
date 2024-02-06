import 'package:cmms/app/create_observation/views/mobile/create_observation_mobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../create_observation_controller.dart';
import 'web/create_observation_web.dart';

class CreateObservationScreen extends GetView<CreateObservationController> {
  CreateObservationScreen({super.key});
  final controller = Get.find<CreateObservationController>();

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
                        child: CreateObservationMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: CreateObservationWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
