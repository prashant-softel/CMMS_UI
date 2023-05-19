import 'package:cmms/app/job_card_details/job_card_details_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/dropdown.dart';

class EmployeeTableWidgetWeb extends GetView<JobCardDetailsController> {
  EmployeeTableWidgetWeb({
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
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Team deployed to carry out the job"),
                  ActionButton(
                    label: "Add Employee",
                    onPressed: () {
                      final index = controller.employeeTableRows.length;

                      // Add a new row to the observable list
                      controller.employeeTableRows.add(
                        DataRow2(//
                            cells: [
                          DataCell(
                            Container(
                              padding: Dimens.edgeInsets5,
                              child: DropdownWidget(
                                controller: controller,
                                dropdownList: controller.employeeList,
                                isValueSelected:
                                    controller.isEmployeeSelected.value,
                                selectedValue:
                                    controller.selectedEmployeeName.value,
                                onValueChanged: (list, selectedValueText) {
                                  // controller.onEmployeeSelected(
                                  //     selectedValueText, index);
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
                              // controller: controller.responsibilityCtrlrs[index],
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
                              onPressed: () {
                                // Remove the row from the observable list
                                // controller.deleteEmployee(index);
                              },
                            ),
                          ),
                        ]),
                      );

                      // Add a new text editing controller
                      // controller.addNewTextEditingController();
                    },
                    icon: Icons.add,
                    color: ColorValues.appGreenColor,
                  ),
                ],
              ),
              Container(
                height: (controller.employeeTableRows.length + 1) * 60,
                child: Flexible(
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
                    rows: controller.employeeTableRows,
                  ),
                ),
              ),
            ]);
      } catch (e) {
        print(e);
        return Container();
      }
    });
  }

  ///
}
