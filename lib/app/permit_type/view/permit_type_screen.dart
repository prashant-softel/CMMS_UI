import 'package:cmms/app/permit_type/permit_type_controller.dart';
import 'package:cmms/app/permit_type/view/permit_type_content_web.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_mobile.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'permit_type_mobile.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';


class PermitTypeScreen extends GetView<PermitTypeController> {
  PermitTypeScreen({super.key});

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
              title: Text('Preventive List'),
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
                        child: PermitTypeMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: PermitTypeContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
