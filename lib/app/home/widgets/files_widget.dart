import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class Files extends StatelessWidget {
  const Files({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimens.edgeInsets16,
      child: Row(
        children: [
          CircleAvatar(
            radius: 70,
            child: Text(
              'Drop Files Here',
              style: Styles.white13,
            ),
          ),
          Expanded(
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
                  minWidth: 100,
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
        ],
      ),
    );
  }
}
