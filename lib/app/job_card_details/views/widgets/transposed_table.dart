import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';

class TransposedTable extends StatelessWidget {
  ///
  TransposedTable(this.tableDataMap);
  final tableDataMap;

  @override
  Widget build(BuildContext context) {
    return

        ///
        Obx(
      () => Table(
          border: TableBorder.all(
            style: BorderStyle.solid,
            color: ColorValues.appDarkBlueColor,
          ),
          children: [
            for (var i = 0; i < tableDataMap.length; i++)
              TableRow(
                  decoration: BoxDecoration(
                    color: i % 2 == 0
                        ? ColorValues.appLightBlueColor.withOpacity(0.1)
                        : ColorValues.whiteColor,
                  ),
                  children: [
                    TableCell(
                      //verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: Get.height * 0.05,
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tableDataMap.keys.toList()[i],
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      //verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        height: Get.height * 0.05,
                        padding: Dimens.edgeInsets10_0_10_0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tableDataMap.values.toList()[i],
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ]),
          ]),
      //),
    );
  }

  ///
}
