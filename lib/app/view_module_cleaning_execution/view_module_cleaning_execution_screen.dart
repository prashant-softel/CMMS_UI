// import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';




// class ViewModuleCleaningExecutionScreen extends GetView<ViewModuleCleaningExecutionController> {
//   ViewModuleCleaningExecutionScreen({Key? key});
//   // final HomeController controller = Get.find();
  
//   @override
//   Widget build(BuildContext context) //
//   {
//     return //
//         Scaffold(
//            appBar: Responsive.isDesktop(context)
//           ? AppBar(
//               title: HeaderWidget(),
//               elevation: 0,
//               toolbarHeight: 60,
//               automaticallyImplyLeading: false,
//             )
//           : AppBar(
//               title: Text('Module Cleaning Execution'),
//               centerTitle: true,
//               elevation: 0,
//             ),
//       body:      
//           Container(
//           width: Get.width,
//           height: Get.height,
//           child: Row(
//             children: [
//               (Responsive.isMobile(context) || Responsive.isTablet(context))
//                   ? Dimens.box0
//                   : HomeDrawer(),
//               Expanded(
//                 child: Column(
//                   children: [
//                     // if (Responsive.isDesktop(context))
//                     //   Expanded(
//                     //     child: AddModuleCleaningExecutionContentWeb(),
//                     //   )
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );

//     ///
//   }
// }
