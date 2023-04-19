import 'package:cmms/app/preventive_maintenance_execution_view/view/preventive_maintenance_execution_view_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../preventive_maintenance_execution_view_controller.dart';

class PreventiveMaintenanceExecutionViewScreen
    extends GetView<PreventiveMaintenanceExecutionViewController> {
  PreventiveMaintenanceExecutionViewScreen({super.key});

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
              title: Text('PM Execution View'),
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
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: PreventiveMaintenanceExecutionViewContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
