import 'package:cmms/app/job_list/views/mobile/job_list_content_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'web/job_list_content_web.dart';

class JobListScreen extends StatelessWidget {
  JobListScreen({Key? key});

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
            )
          : AppBar(
              title: Text('Jobs'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Container(
        width: double.infinity,
        child: //
            SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                : HomeDrawer(),
            Column(
                //
                children: [
                  ///ListView
                  if (Responsive.isMobile(context))
                    Expanded(
                      child: JobListContentMobile(),
                    ),

                  if (Responsive.isDesktop(context))
                    Expanded(
                      child: Container(
                        height: Get.height,
                        width: Get.width,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //HomeDrawer(),
                              Expanded(child: JobListContentWeb()),
                            ]),
                      ),
                    ),
                ]),
          ]),
        ),
      ),
    );

    ///
  }
}
