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
      width: Get.width,
      child: //
          Obx(
        () => //
            Container(
          height: (controller.isolationAssetsCategoryList.length + 1) * 50,
          child: //
              Flexible(
            child: DataTable2(
              headingRowHeight: 50,
              border: TableBorder.all(color: ColorValues.appLightBlueColor),
              dataRowHeight: 50,
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
                controller.isolationAssetsCategoryList.length,
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
        ),
      ),
    );
  }
}
