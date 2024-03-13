import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/mobile_drawer.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit/view/new_permit_mobile.dart';
import 'package:cmms/app/new_permit/view/new_permit_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePermitScreen extends GetView<NewPermitController> {
  CreatePermitScreen({super.key});
  // final NewPermitController _controller = Get.find();
  final HomeController homecontroller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? AppBar(
                title: HeaderWidgetMobile(),
                centerTitle: true,
                elevation: 0,
              )
            : null,
        drawer: (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? HomeDrawerMobile() //ResponsiveSideMenu()
            : null,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 450),
              margin: EdgeInsets.only(
                left: Responsive.isDesktop(context)
                    ? homecontroller.menuButton.value
                        ? 250.0
                        : 70.0
                    : 0,
              ),
              width: Get.width,
              height: Get.height,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context))
                          Expanded(
                            child: NewPermitMobile(),
                          ),
                        if (Responsive.isDesktop(context))
                          Expanded(
                            child: NewPermitWeb(),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Responsive.isDesktop(context)
                ? AnimatedPositioned(
                    duration: Duration(milliseconds: 450),
                    child: HomeDrawer(),
                  )
                : Dimens.box0
          ],
        ),
      ),
    );
  }
}
