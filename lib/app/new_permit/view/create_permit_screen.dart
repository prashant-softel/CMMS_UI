import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
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
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: HeaderWidget(),
                automaticallyImplyLeading: false,
                elevation: 0,
                toolbarHeight: 60,
              )
            : null,
        body: Obx(
          () => Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
                margin: EdgeInsets.only(
                    left: homecontroller.menuButton.value ? 250.0 : 70.0),
                    width: Get.width,
                  height: Get.height,
                child: Row(
                  children: [(Responsive.isMobile(context) ||
                              Responsive.isTablet(context))
                          ? Dimens.box0
                          : Container(),
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
                      ),],
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
                child: HomeDrawer(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
