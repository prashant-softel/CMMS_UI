import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/warranty_claim_list/web/warranty_claim_list_web.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarrantyClaimListScreen extends GetView<WarrantyClaimController> {
  WarrantyClaimListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Calibration History'),
              centerTitle: true,
              elevation: 0,
            ),
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
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: WarrantyClaimListWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}




// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:cmms/app/utils/responsive.dart';
// import 'package:cmms/app/warranty_claim_list/mobile/warranty_claim_content_mobile.dart';
// import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
// import 'package:cmms/app/warranty_claim_list/web/warranty_claim_list_web.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class WarrantyClaimListScreen extends GetView<WarrantyClaimController> {
//   WarrantyClaimListScreen({Key? key});

//   ///
//   @override
//   Widget build(BuildContext context) //
//   {
//     return //
//         Scaffold(
//       appBar: Responsive.isDesktop(context)
//           ? AppBar(
//               title: HeaderWidget(),
//               elevation: 0,
//               toolbarHeight: 60,
//               automaticallyImplyLeading: false,
//             )
//           : AppBar(
//               title: Text(' Warranty Claim'),
//               centerTitle: true,
//               elevation: 0,
//             ),
//       drawer: //
//           (Responsive.isMobile(context) || Responsive.isTablet(context))
//               ? HomeDrawer() //ResponsiveSideMenu()
//               : null,
//       body: Container(
//         width: Get.width,
//         height: Get.height,
//         child: Column(
//             //
//             children: [
//               if (Responsive.isMobile(context))
//                 Expanded(
//                   child: WarrantyClaimMobile(),
//                 ),
//               if (Responsive.isDesktop(context))
//                 Expanded(
//                   child: WarrantyClaimListWeb(),
//                 ),
//             ]),
//       ),
//     );

//     ///
//   }
// }
