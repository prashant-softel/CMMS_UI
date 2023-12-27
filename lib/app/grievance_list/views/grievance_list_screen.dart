import 'package:cmms/app/grievance_list/views/mobile/grievance_list_content_mobile.dart';
import 'package:cmms/app/grievance_list/views/web/grievance_list_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../grievance_list_controller.dart';

// ignore: must_be_immutable
class GrievanceListScreen extends StatelessWidget {
  GrievanceListScreen({Key? key});
  var controller = Get.find<GrievanceController>();

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
              title: Text('Grievances'),
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
                    child: GrievanceListContentWeb(),
                  ),
                )
              else
                Expanded(child: GrievanceListContentMobile())
            ]),
          ),
        ]),
      ),
    );

    ///
  }
}
