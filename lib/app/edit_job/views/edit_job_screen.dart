import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../utils/responsive.dart';
import '../edit_job_controller.dart';
import 'mobile/edit_job_content_mobile.dart';
import 'web/edit_job_content_web.dart';

class EditJobScreen extends GetView<EditJobController> {
  EditJobScreen({Key? key}) : super(key: key);
  final HomeController homecontroller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
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
              height: Get.height,
              width: Get.width,
              child: Row(children: [
                Expanded(
                  child: Container(
                    // child: Expanded(
                    child: (() {
                      if (Responsive.isMobile(context)) {
                        return //
                            EditJobContentMobile();
                      } //
                      else if (Responsive.isDesktop(context)) {
                        return //
                            EditJobContentWeb();
                      }
                    }()),
                  ),
                ),
                // ),
              ]),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 450),
              child: HomeDrawer(),
            ),
          ],
        ),
      ),
    );

    ///build ends
  }

  /// class ends
}
