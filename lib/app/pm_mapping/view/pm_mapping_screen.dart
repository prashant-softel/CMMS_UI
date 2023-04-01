import 'package:cmms/app/pm_mapping/view/pm_mapping_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../pm_mapping_controller.dart';

class PmMappingScreen
    extends GetView<PmMappingController> {
  PmMappingScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('PM Mapping'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
   if (Responsive.isDesktop(context))
                      Expanded(
                        child: PmMappingContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
