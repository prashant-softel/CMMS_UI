import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/dimens.dart';
import '../../../widgets/dropdown.dart';

class EmployeeTable extends StatelessWidget {
  EmployeeTable({
    super.key,
    this.controller,
  });

  ///
  final controller;

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Container(
      width: Get.width * 0.99,
      child: SingleChildScrollView(
        child: DataTable(
          dataRowHeight: Get.height * 0.06,
          columnSpacing: 12,
          horizontalMargin: 12,
          columns: [
            DataColumn2(
              label: Text('Employee Name / Designation'),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Text('Responsibility'),
            ),
            DataColumn2(
              label: Text('Competencies'),
            ),
            DataColumn2(
              label: Text('Remove'),
            ),
          ],
          rows: List<DataRow>.generate(
            1,
            (index) => DataRow(//
                cells: [
              DataCell(
                Container(
                  padding: Dimens.edgeInsets5,
                  child: DropdownWidget(
                    controller: controller,
                    dropdownList: controller?.employeeList ?? [],
                    isValueSelected: controller?.isEmployeeSelected.value,
                    selectedValue: controller?.selectedEmployee.value,
                    onValueChanged: controller?.onValueChanged(),
                  ),
                ),
              ),
              DataCell(Text('B')),
              DataCell(Text('C')),
              DataCell(Text('D')),
            ]),
            growable: false,
          ),
        ),
      ),
    );
  }

  ///
}
