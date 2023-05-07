import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../edit_job_controller.dart';
import 'mobile/edit_job_content_mobile.dart';
import 'web/edit_job_content_web.dart';

class EditJobScreen extends GetView<EditJobController> {
  EditJobScreen({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
            )
          : AppBar(
              title: Text('Add Job'),
              centerTitle: true,
              elevation: 0,
            ),
      body:
          //
          Row(children: [
        (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? Dimens.box0
            : HomeDrawer(),

        /// CARD
        // Obx(
        //   () => //
        Expanded(
          child: Container(
            // child: Expanded(
            child: Card(
              color: ColorValues.appLightGreyColor,
              elevation: 20,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                  padding: Dimens.edgeInsets10,
                  child: (() {
                    if (Responsive.isMobile(context)) {
                      return //
                          EditJobContentMobile();
                    } //
                    else if (Responsive.isDesktop(context)) {
                      return //
                          EditJobContentWeb();
                    }
                  }())
                  //
                  ),
            ),
          ),
        ),
        // ),
      ]),
    );

    ///build ends
  }

  /// class ends
}
