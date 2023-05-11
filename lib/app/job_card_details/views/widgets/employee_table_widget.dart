import 'package:cmms/app/job_card_details/job_card_details_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/dropdown.dart';

class EmployeeTableWidget extends GetView<JobCardDetailsController> {
  EmployeeTableWidget({
    super.key,
    required this.controller,
  });

  ///
  final controller;

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(() {
      try {
        ///
        var employeeTableRows = controller.employeeTableRows;
        var employeeList = controller.employeeList;
        var isEmployeeSelected = controller.isEmployeeSelected.value;
        var selectedEmployeeName = controller.selectedEmployeeName.value;
        var currentIndex = controller.currentIndex.value;
        var responsibilityCtrlrs = controller.responsibilityCtrlrs;

        ///
        return //
            Column(
                mainAxisSize: MainAxisSize.min, //
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(
                child: //
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, //
                        children: [
                      Text("Team deployed to carry out the job"),
                      ActionButton(
                        label: "Add Employee",
                        onPressed: () {
                          controller.addNewTextEditingController();
                          final rowIndex = controller.currentIndex.value;
                          controller.currentIndex.value += 1;

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
                                controller: responsibilityCtrlrs[
                                    employeeTableRows.length],
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
                          // controller.currentIndex.value = currentIndex + 1;
                          // Add a new text editing controller
                          controller.addNewTextEditingController();
                        },
                        icon: Icons.add,
                        color: ColorValues.appGreenColor,
                      ),
                    ]),
              ),
              Container(
                height: (controller.employeeTableRows.length + 1) * 60,
                child: //
                    Flexible(
                  child: DataTable2(
                    headingRowHeight: 50,
                    border:
                        TableBorder.all(color: ColorValues.appLightBlueColor),
                    dataRowHeight: 60,
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
              ),
            ]);
      } //
      catch (e) {
        print(e);
        return Container();
      }
    });
  }

  ///
}
