// import 'package:cmms/app/app.dart';
// import 'package:cmms/domain/models/grievance_List_model.dart';
// import 'package:cmms/domain/models/grievance_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../grievance_list_controller.dart';

// class GrievanceListContentMobile extends GetView<GrievanceController> {
//   GrievanceListContentMobile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ///
//     return //
//         Scaffold(
//       //
//       body: //
//           Container(
//         child: //
//             Obx(
//           () => //
//               Column(
//             children: [
//               Expanded(
//                 child: //
//                     ListView.builder(
//                         shrinkWrap: true,
//                         // ignore: unnecessary_null_comparison
//                         itemCount: controller.grievanceList != null
//                             ? controller.grievanceList.length
//                             : 0,
//                         itemBuilder: (context, index) {
//                           final GrievanceListModel =
//                               // ignore: unnecessary_null_comparison
//                               (controller.grievanceList != null)
//                                   ? controller.grievanceList[index]
//                                   : GrievanceListModel();
//                           // var _statusString =
//                           //     GrievanceStatusData.getStatusStringFromStatusEnumValue(
//                           //         GrievanceListModel?.status);

//                           return GestureDetector(
//                             onTap: () {
//                               var _grievanceId =
//                                   GrievanceListModel?.facilityId ?? 0;
//                               controller
//                                   .goToGrievanceDetailsScreen(_grievanceId);
//                             },
//                             child: //
//                                 SizedBox(
//                               width: double.infinity,
//                               child: //
//                                   Card(
//                                 color: Colors.lightBlue.shade50,
//                                 elevation: 10,
//                                 shadowColor: Colors.black87,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                 ),
//                                 child: //
//                                     Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: //
//                                       Column(
//                                           //
//                                           children: [
//                                         Row(
//                                             //
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Expanded(
//                                                 child: Text(
//                                                   'Grievance${GrievanceListModel?.facilityId ?? 0}',
//                                                   style: const TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     color: ColorValues
//                                                         .navyBlueColor,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     // color: GrievanceStatusData
//                                                     //     .getStatusColor(
//                                                     //         _statusString),
//                                                   ),
//                                                   padding: const EdgeInsets
//                                                       .symmetric(
//                                                     horizontal: 10,
//                                                     vertical: 5,
//                                                   ),
//                                                   child: Center(
//                                                     child: Text(
//                                                       '${GrievanceListModel?.grievanceType ?? 'Unassigned'}',
//                                                       style: const TextStyle(
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]),
//                                         Row(children: [
//                                           Expanded(
//                                             child: Text(
//                                               'Assigned To: ',
//                                               style: const TextStyle(
//                                                 color: ColorValues.blackColor,
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               '${GrievanceListModel?.concern ?? 'Unassigned'}',
//                                               style: const TextStyle(
//                                                 color: ColorValues.blackColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ]),
//                                         Row(//
//                                             children: [
//                                           Expanded(
//                                             child: Text(
//                                               '${GrievanceListModel?.facilityId ?? ''}',
//                                               style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color.fromARGB(
//                                                     255, 239, 87, 27),
//                                               ),
//                                             ),
//                                           ),
//                                         ]),
//                                         Row(//
//                                             children: [
//                                           Expanded(
//                                             child: Text(
//                                               GrievanceListModel?.description ??
//                                                   '',
//                                               style: const TextStyle(),
//                                             ),
//                                           )
//                                         ]),
//                                         Row(//
//                                             children: [
//                                           Expanded(
//                                             child: Text(
//                                               'Grievance Type: ',
//                                               style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               '${GrievanceListModel?.grievanceType ?? ''}',
//                                               style: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           )
//                                         ]),
//                                         Row(
//                                             //
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Description: ',
//                                                 style: TextStyle(
//                                                   color: Colors.blue.shade900,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(GrievanceListModel
//                                                         ?.description ??
//                                                     ''),
//                                               ),
//                                             ]),
//                                         Row(
//                                             //
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Concern: ',
//                                                 style: TextStyle(
//                                                   color: Colors.blue.shade900,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(GrievanceListModel
//                                                         ?.concern ??
//                                                     ''),
//                                               ),
//                                             ]),
//                                         Row(
//                                             //
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Action Taken: ',
//                                                 style: TextStyle(
//                                                   color: Colors.blue.shade900,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(GrievanceListModel
//                                                         ?.actionTaken ??
//                                                     ''),
//                                               ),
//                                             ]),
//                                         Row(
//                                             //
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 'Resolution Level: ',
//                                                 style: TextStyle(
//                                                   color: Colors.blue.shade900,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(
//                                                   '${GrievanceListModel?.resolutionLevel ?? ''}',
//                                                 ),
//                                               ),
//                                             ]),
//                                       ]),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//               ),
//             ],
//           ),
//         ),
//       ),
//       //
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => controller.goToAddGrievanceScreen(),
//         backgroundColor: ColorValues.navyBlueColor,
//         child: //
//             Icon(
//           Icons.add,
//           color: ColorValues.whiteColor,
//         ),
//       ),
//     );
//   }

//   ///
// }
