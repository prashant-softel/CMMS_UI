import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../job_card_details_controller.dart';

class LotoAppliedAssetsWidget extends GetView<JobCardDetailsController> {
  const LotoAppliedAssetsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return //
        Container(
      width: Get.width,
      child: //
          Obx(
        () => //
            Container(
          height: (controller.isolationAssetsCategoryList.length + 1) * 50,
          child: //
              Flexible(
            child: DataTable2(
              dataRowHeight: 50,
              headingRowHeight: 50,
              border: TableBorder.all(color: ColorValues.appLightBlueColor),
              columnSpacing: 12,
              horizontalMargin: 12,
              columns: [
                DataColumn2(
                  label: Text('Asset Name / Designation'),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('LOTO Removed'),
                  size: ColumnSize.L,
                ),
              ],
              rows: List<DataRow>.generate(
                controller.lotoAppliedAssets.length ?? 0,
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
                          controller.toggleIsNormalizedSwitch(value, index),
                      activeColor: ColorValues.appGreenColor,
                    ),
                  ),
                ]),
                growable: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
