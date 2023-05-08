import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../widgets/action_button.dart';
import '../../job_details_controller.dart';

class LinkToPermitTableWidget extends StatelessWidget {
  LinkToPermitTableWidget({super.key});

  ///
  final controller = Get.find<JobDetailsController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Container(
      height: Get.height,
      child: //

          Row(
              mainAxisAlignment: MainAxisAlignment.end, //
              children: [
            ActionButton(
              label: "Link to Existing Permit",
              icon: Icons.link,
              onPressed: () => controller.showPermitsDialog(),
              color: ColorValues.appYellowColor,
            ),
            ActionButton(
              label: "Create New Permit",
              icon: Icons.add,
              onPressed: () => controller.createNewPermit(),
              color: ColorValues.appLightBlueColor,
            ),
          ]),
      //         Expanded(
      //           child: DataTable2(
      //             headingRowHeight: Get.height * 0.06,
      //             border: TableBorder.all(color: ColorValues.appLightBlueColor),
      //             dataRowHeight: Get.height * 0.08,
      //             horizontalMargin: 12,
      //             columns: [
      //               DataColumn(label: Text('Permit To Work')),
      //               DataColumn(label: Text('Site Permit No.')),
      //               DataColumn(label: Text('Permit Type')),
      //               DataColumn(label: Text('Assigned To')),
      //               DataColumn(label: Text('Permit Status')),
      //               DataColumn(label: Text('Permit Date')),
      //               DataColumn(label: Text('Job Card')),
      //             ],
      //             rows: List<DataRow>.generate(
      //               controller.permitDropdownValues.length,
      //               (rowIndex) => DataRow(
      //                 cells: [
      //                   DataCell(
      //                     DropdownButtonFormField(
      //                       items: controller.associatedPermitList?.map((item) {
      //                         return DropdownMenuItem(
      //                             child: Text(item.permitTypeName ?? ''),
      //                             value: item);
      //                       }).toList(),
      //                       value: controller.permitDropdownValues[rowIndex],
      //                       onChanged: (value) => controller.setDropdownValue(
      //                           rowIndex, value?.toString() ?? ''),
      //                     ),
      //                   ),
      //                   for (int i = 0; i < 5; i++)
      //                     DataCell(
      //                       TextField(
      //                         controller: controller.textControllers[rowIndex]
      //                             [i],
      //                         onChanged: (value) =>
      //                             controller.setTextValue(rowIndex, i, value),
      //                       ),
      //                     ),
      //                   DataCell(
      //                     TableActionButton(
      //                       color: ColorValues.appPurpleColor,
      //                       icon: Icons.add,
      //                       label: 'Job Card',
      //                       onPress: () {
      //                         controller.goToJobCardScreen();
      //                       },
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ]),
      // ),
    );
  }

  ///
}
