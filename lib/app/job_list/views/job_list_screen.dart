import 'package:cmms/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../job_list_controller.dart';
import 'web/job_list_content_web.dart';

class JobListScreen extends GetView<JobListController> {
  JobListScreen({super.key});
  final controller = Get.find<JobListController>();
  final HomeController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
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
                    children: [
                      (Responsive.isMobile(context) ||
                              Responsive.isTablet(context))
                          ? Dimens.box0
                          : Container(),
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
                                child: JobListContentWeb(),
                              )
                          ],
                        ),
                      ),
                    ],
                  )),
              AnimatedPositioned(
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
