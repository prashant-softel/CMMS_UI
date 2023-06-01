import 'package:cmms/app/job_list/views/mobile/job_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../job_list_controller.dart';
import 'web/job_list_content_web.dart';

class JobListScreen extends StatelessWidget {
  JobListScreen({Key? key});
  var controller = Get.find<JobListController>();

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
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Jobs'),
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
                    child: JobListContentWeb(),
                  ),
                )
              else
                Expanded(child: JobListContentMobile())
            ]),
          ),
        ]),
      ),
    );

    ///
  }
}
