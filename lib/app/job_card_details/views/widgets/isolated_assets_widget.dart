import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/dimens.dart';
import '../../job_card_details_controller.dart';

class IsolatedAssetsWidget extends GetView<JobCardDetailsController> {
  const IsolatedAssetsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return //
        Container(
      width: Get.width * 0.99,
      child: //
          SingleChildScrollView(
        child: //
            Obx(
          () => DataTable(
            dataRowHeight: Get.height * 0.06,
            columnSpacing: 12,
            horizontalMargin: 12,
            columns: [
              DataColumn2(
                label: Text('Asset Name / Designation'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Normalized'),
                size: ColumnSize.L,
              ),
            ],
            //   headingRowHeight: 50,
            //   headingRowColor:
            //       MaterialStateColor.resolveWith((states) => Colors.grey[200]!),
            //   headingTextStyle:
            //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // : (columns) {
            //     return DataRow(cells: [
            //       DataCell(
            //           MergeSemantics(
            //             child: Container(
            //               alignment: Alignment.center,
            //               child: Text('My Table Heading'),
            //             ),
            //           ),
            //           columnSpan: columns.length),
            //     ]);
            //   },
            rows: List<DataRow>.generate(
              1,
              (index) => DataRow(//
                  cells: [
                DataCell(
                  Container(
                    padding: Dimens.edgeInsets5,
                    child: Text('Category'),
                  ),
                ),
                DataCell(
                  Switch(
                    value: controller.isNormalized.value,
                    onChanged: (value) =>
                        controller.toggleIsNormalizedSwitch(value),
                  ),
                ),
              ]),
              growable: false,
            ),
          ),
        ),
      ),
    );
  }
}
