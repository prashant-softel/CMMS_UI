import 'package:cmms/app/type_of_observation/view/type_of_obs_mobile.dart';
import 'package:cmms/app/type_of_observation/view/type_of_obs_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../type_of_obs_controller.dart';

class TypeOfObsScreen extends GetView<TypeOfObsController> {
  TypeOfObsScreen({super.key});
  final controller = Get.find<TypeOfObsController>();

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
                        child: TypeOfObsMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: TypeOfObsWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
