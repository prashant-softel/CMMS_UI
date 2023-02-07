// import 'package:cmms/app/app.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final controller = Get.find<HomeController>();
//   @override
//   void initState() {
//     controller.getInventoryList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text('${'hello'.tr}'),
//         ),
//         drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
//             ? HomeDrawer()
//             : null,
//         body: Row(
//           children: [
//             Responsive.isMobile(context) || Responsive.isTablet(context)
//                 ? Dimens.box0
//                 : HomeDrawer(),
//             Expanded(
//               child: Center(
//                 child: Container(
//                   margin: Dimens.edgeInsets16,
//                   height: Get.height,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.withOpacity(.3)),
//                   ),
//                   constraints: BoxConstraints(
//                     maxWidth: 1100,
//                   ),
//                   child: InventoryModule(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }
