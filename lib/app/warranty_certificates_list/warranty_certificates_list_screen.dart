import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/warranty_certificates_list/view/web/warranty_certificates_list_content_web.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarrantyCertificatesListScreen
    extends GetView<WarrantyCertificatesListController> {
  WarrantyCertificatesListScreen({Key? key});

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
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: HeaderWidget(),
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body:
          //   Obx(
          // () => //
          Container(
        child: Row(
          children: [
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                :
                //
                HomeDrawer(),
            Expanded(
              child: Column(
                  //
                  children: [
                    // if (Responsive.isMobile(context))
                    //   Expanded(
                    //     child: InventoryListContentMobile(),
                    //   ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: //
                            WarrantyCertificatesListContentWeb(),
                      ),
                  ]),
            ),
          ],
        ),
      ),
    );

    ///
  }
}
