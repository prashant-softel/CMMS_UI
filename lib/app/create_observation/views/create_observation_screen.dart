import 'package:cmms/app/create_observation/views/mobile/create_observation_mobile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../create_observation_controller.dart';
import 'web/create_observation_web.dart';

// ignore: must_be_immutable
class CreateObservationScreen extends StatelessWidget {
  CreateObservationScreen({Key? key});
  var controller = Get.find<CreateObservationController>();

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text(
                "CREATE OBSERVATION",
                style: TextStyle(
                  color: Color.fromARGB(255, 159, 156, 156),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Row(children: [
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? Dimens.box0
              : HomeDrawer(),
          Expanded(
            child: Column(children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: KeyedSubtree(
                    key: UniqueKey(),
                    child: CreateObservationWeb(),
                  ),
                )
              else
                Expanded(child: CreateObservationMobile())
            ]),
          ),
        ]),
      ),
    );

    ///
  }
}
