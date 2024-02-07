import 'package:cmms/app/change_password/change_password_controller.dart';
import 'package:cmms/app/change_password/view/change_password_content_web.dart';
import 'package:cmms/app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  ChangePasswordScreen({super.key});
  final controller = Get.find<ChangePasswordController>();

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
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Data Coming Soon......")),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: ChangePasswordContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
