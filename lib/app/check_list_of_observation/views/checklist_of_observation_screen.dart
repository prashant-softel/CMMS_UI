import 'package:cmms/app/check_list_of_observation/views/mobile/checklist_of_observation_mobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../checklist_of_observation_controller.dart';
import 'web/checklist_of_observation_web.dart';

class CheckListOfObservationScreen
    extends GetView<CheckListOfObservationController> {
  CheckListOfObservationScreen({super.key});
  final controller = Get.find<CheckListOfObservationController>();

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
                        child: CheckListOfObservationMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: CheckListOfObservationWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
