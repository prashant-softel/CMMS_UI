import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
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
          Obx(
        () => DataTable2(
          dataRowHeight: Get.height * 0.06,
          headingRowHeight: Get.height * 0.06,
          border: TableBorder.all(color: ColorValues.appLightBlueColor),
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
          rows: List<DataRow>.generate(
            controller.isolationAssetsCategoryList.length ?? 0,
            (index) => DataRow(//
                cells: [
              DataCell(
                Container(
                  padding: Dimens.edgeInsets5,
                  child: Text(controller.isolationAssetsCategoryList[index]
                          .isolationAssetsCatName ??
                      ''),
                ),
              ),
              DataCell(
                Switch(
                  value: (controller.isolationAssetsCategoryList.isNotEmpty)
                      ? (controller.isolationAssetsCategoryList[index]
                                      .isNormalized ==
                                  0 ||
                              controller.isolationAssetsCategoryList[index]
                                      .isNormalized ==
                                  null)
                          ? false
                          : true
                      : false,
                  onChanged: (value) =>
                      controller.toggleIsNormalizedSwitch(value, index),
                  activeColor: ColorValues.appGreenColor,
                ),
              ),
            ]),
            growable: false,
          ),
        ),
      ),
    );
  }
}
