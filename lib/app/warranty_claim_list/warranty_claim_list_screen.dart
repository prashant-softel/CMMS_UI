import 'package:cmms/app/app.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/warranty_claim_list/mobile/warranty_claim_content_mobile.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/warranty_claim_list/web/warranty_claim_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../home/home_controller.dart';
// import '../../utils/responsive.dart';
// import 'mobile/inventory_list_content_mobile.dart';
// import 'web/inventory_list_content_web.dart';

class WarrantyClaimListScreen extends GetView<WarrantyClaimController> {
  WarrantyClaimListScreen({Key? key});
  // final HomeController controller = Get.find();
  

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      body:
           
          Container(
        child: Column(
            //
            children: [
              if (Responsive.isMobile(context))
                Expanded(
                  child: WarrantyClaimMobile(),
                ),
              if (Responsive.isDesktop(context))
                Expanded(
                  child: WarrantyClaimListWeb(),
                ),
            ]),
      ),
    );

    ///
  }
}
