// import 'package:cmms/app/app.dart';
// import 'package:cmms/domain/models/models.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ListWidget extends StatelessWidget {
//   const ListWidget({super.key});

//   @override
//   Widget build(BuildContext context) =>
//       GetBuilder<HomeController>(builder: (_controller) {
//         return SingleChildScrollView(
//           controller: ScrollController(),
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Padding(
//                 padding: Dimens.edgeInsets8,
//                 child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     controller: ScrollController(),
//                     child: Column(
//                       children: List.generate(
//                         _controller.inventoryList.length,
//                         (index) => Column(
//                           children: [
//                             if (index == 0) headerWidget(context, _controller),
//                             inventoryDetailWidget(
//                                 _controller, _controller.inventoryList[index])
//                           ],
//                         ),
//                       ),
//                     )),
//               )
//             ],
//           ),
//         );
//       });

//   Widget headerWidget(BuildContext context, HomeController controller) =>
//       Container(
//           height: Dimens.fifty,
//           padding: Dimens.edgeInsets0_10_0_10,
//           decoration: BoxDecoration(
//             color: Colors.blue.withOpacity(0.6),
//             border: Border.all(color: ColorsValue.blackColor, width: 0.4),
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(Dimens.ten),
//                 topLeft: Radius.circular(Dimens.ten)),
//           ),
//           child: Row(
//             children: controller.selectedInventoryColumnVisibility
//                 .map(
//                   (e) => Container(
//                     padding: Dimens.edgeInsets4,
//                     width: Get.width /
//                         controller.selectedInventoryColumnVisibility.length,
//                     child: Text(
//                       e.text,
//                       style: Styles.blackMedium14
//                           .copyWith(color: ColorsValue.blackColor),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ));

//   Widget inventoryDetailWidget(
//           HomeController controller, InventoryModel itemData) =>
//       Row(
//           children: controller.selectedInventoryColumnVisibility
//               .map(
//                 (e) => Container(
//                   padding: Dimens.edgeInsets4,
//                   width: Get.width /
//                       controller.selectedInventoryColumnVisibility.length,
//                   child: Text(
//                     controller.inventoryDetailsString(itemData),
//                     style: Styles.blackMedium14
//                         .copyWith(color: ColorsValue.blackColor),
//                   ),
//                 ),
//               )
//               .toList()
//           // Container(
//           //   padding: Dimens.edgeInsets4,
//           //   width:
//           //       Get.width / controller.selectedInventoryColumnVisibility.length,
//           //   child: Text(
//           //     itemData.name ?? '',
//           //     style:
//           //         Styles.blackMedium14.copyWith(color: ColorsValue.blackColor),
//           //   ),
//           // ),

//           );
// }
