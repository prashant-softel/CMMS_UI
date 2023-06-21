import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../theme/dimens.dart';
import '../../theme/styles.dart';

class Files extends StatelessWidget {
  const Files({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimens.edgeInsets16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 70,
            child: Text(
              'Drop Files Here',
              style: Styles.white13,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 227, 224, 224),
                  width: 1,
                ),
              ),
              child: ScrollableTableView(
                columns: [
                  "#",
                  "Name",
                  "File Category",
                  "Size",
                  "Status",
                  "Remove",
                ].map((column) {
                  return TableViewColumn(
                    minWidth: Get.width * 0.12,
                    label: column,
                  );
                }).toList(),
                rows: [
                  [
                    "1",
                    "Test.png",
                    "20.00",
                    "sdvf",
                    "sfv",
                    "remove",
                  ],
                  [
                    "1",
                    "Test.png",
                    "20.00",
                    "sdvf",
                    "sfv",
                    "remove",
                  ],
                ].map((record) {
                  return TableViewRow(
                    height: 60,
                    cells: record.map((value) {
                      if (value == 'remove')
                        return TableViewCell(
                          child: Icon(Icons.delete),
                        );
                      return TableViewCell(
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
