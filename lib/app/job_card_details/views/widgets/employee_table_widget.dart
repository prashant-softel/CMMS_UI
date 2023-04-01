import 'package:cmms/app/app.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    //List<TextEditingController> textEditingControllers = [];
    return //
        Obx(() {
      ///
      var employeeTableRows = controller.employeeTableRows;
      var employeeList = controller.employeeList;
      var isEmployeeSelected = controller.isEmployeeSelected.value;
      var selectedEmployeeName = controller.selectedEmployeeName.value;
      var currentIndex = controller.currentIndex.value;
      var responsibilityCtrlrs = controller.responsibilityCtrlrs;

      ///
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Flexible(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //
              children: [
                Text("Team deployed to carry out the job"),
                ActionButton(
                  label: "Add Employee",
                  onPressed: () {
                    //controller.addNewTextEditingController();
                    controller.currentIndex.value++;
                    // Create a new DataRow with the same cells as the first row
                    final newRow = DataRow2(//
                        cells: [
                      DataCell(
                        Container(
                          padding: Dimens.edgeInsets5,
                          child: DropdownWidget(
                            controller: controller,
                            dropdownList: employeeList,
                            isValueSelected: isEmployeeSelected,
                            selectedValue: selectedEmployeeName,

                            onValueChanged: (list, selectedValueText) {
                              final rowIndex = currentIndex;
                              controller.onEmployeeSelected(
                                  selectedValueText, rowIndex);
                            },
                            // onValueChanged: (list, selectedValueText) {
                            //   final rowIndex = controller.currentIndex.value;

                            //   controller.onEmployeeSelected(
                            //       selectedValueText, rowIndex, controller);
                            // },
                          ),
                        ),
                      ),
                      DataCell(
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorValues.appLightBlueColor,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorValues.appLightBlueColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          minLines: 3,
                          maxLines: null,
                          controller: responsibilityCtrlrs[currentIndex],
                        ),
                      ),
                      DataCell(
                        ActionButton(
                          label: "View Competencies",
                          color: ColorValues.appLightBlueColor,
                          onPressed: () {},
                        ),
                      ),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      ),
                    ]);

                    ///
                    // Add the new row to the DataTable2
                    employeeTableRows.add(newRow);
                    // Increment the current index
                    controller.currentIndex.value = currentIndex + 1;
                    // Add a new text editing controller
                    controller.addNewTextEditingController();
                  },
                  icon: Icons.add,
                  color: ColorValues.appGreenColor,
                ),
              ]),
        ),
        Flexible(
          child: //
              DataTable2(
            headingRowHeight: Get.height * 0.06,
            border: TableBorder.all(color: ColorValues.appLightBlueColor),
            dataRowHeight: Get.height * 0.08,
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
            rows: employeeTableRows,
          ),
        ),
      ]);
    } //

            );
  }

  ///
}
