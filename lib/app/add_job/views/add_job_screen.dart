import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

import 'package:cmms/app/add_job/views/mobile/add_job_content_mobile.dart';
import 'package:cmms/app/add_job/views/web/add_job_content_web.dart';
import '../add_job_controller.dart';

class AddJobScreen extends GetView<AddJobController> {
  AddJobScreen({super.key});

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
              title: Text('Add Job'),
              centerTitle: true,
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
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
                    if (Responsive.isMobile(context) ||
                        Responsive.isTablet(context))
                      Expanded(
                        child: AddJobContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: AddJobContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}



// import 'package:cmms/app/add_job/views/mobile/add_job_content_mobile.dart';
// import 'package:cmms/app/add_job/views/web/add_job_content_web.dart';
// import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../home/widgets/home_drawer.dart';
// import '../../theme/color_values.dart';
// import '../../theme/dimens.dart';
// import '../../utils/responsive.dart';
// import '../add_job_controller.dart';

// class AddJobScreen extends GetView<AddJobController> {
//   AddJobScreen({Key? key}) : super(key: key);

//   ///
//   @override
//   Widget build(BuildContext context) {
//     ///
//     return Scaffold(
//       appBar: Responsive.isDesktop(context)
//           ? AppBar(
//               title: HeaderWidget(),
//               automaticallyImplyLeading: false,
//               elevation: 0,
//               toolbarHeight: 60,
//             )
//           : AppBar(
//               title: Text('Add Job'),
//               centerTitle: true,
//               elevation: 0,
//             ),
            
//       body: Row(
//         children: [
//           (Responsive.isMobile(context) || Responsive.isTablet(context))
//               ? Dimens.box0
//               : HomeDrawer(),
//           Expanded(
//             child: Column(
//               children: [
//                 if (Responsive.isMobile(context) ||
//                     Responsive.isTablet(context))
//                   Expanded(
//                     child: AddJobContentMobile(),
//                   ),
//                 if (Responsive.isDesktop(context)) AddJobContentWeb()
//               ],
//             ),
//           ),
//         ],
//       ),

//       //     //
//       //     Row(children: [
//       //   (Responsive.isMobile(context) || Responsive.isTablet(context))
//       //       ? Dimens.box0
//       //       : HomeDrawer(),

//       //   /// CARD

//       //   Expanded(
//       //     child: Container(
//       //       child: Padding(
//       //           padding: Dimens.edgeInsets10,
//       //           child: (() {
//       //             if (Responsive.isMobile(context) ||
//       //                 Responsive.isTablet(context)) {
//       //               return AddJobContentMobile();
//       //             } //
//       //             else if (Responsive.isDesktop(context)) {
//       //               return AddJobContentWeb();
//       //             }
//       //           }())
//       //           //
//       //           ),
//       //     ),
//       //   ),
//       // ]),
//     );

//     ///build ends
//   }

//   /// class ends
// }
