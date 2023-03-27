import 'package:cmms/app/preventive_List/view/preventive_listContent_mobile.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../preventive_list_controller.dart';

class PreventiveListScreen extends GetView<PreventiveListController> {
  PreventiveListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
            )
          : AppBar(
              title: Text('Preventive List'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                        child: PreventiveChecklistListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: PreventiveChecklistListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
