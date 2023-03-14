import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors_value.dart';

class TransposedTable extends StatelessWidget {
  ///
  TransposedTable(this.tableDataMap);
  final tableDataMap;

  @override
  Widget build(BuildContext context) {
    return

        ///
        Obx(
      () =>

          ///
          //   Expanded(
          // child: //
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                color: ColorsValue.blackColor,
              ),
              children: [
            for (var i = 0; i < tableDataMap.length; i++)
              TableRow(
                  decoration: BoxDecoration(
                    color: i % 2 == 0
                        ? ColorsValue.lightGreyColorWithOpacity50
                        : ColorsValue.lightBlueishColor,
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
