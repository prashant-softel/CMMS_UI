import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/employee_model.dart';
import '../../../theme/color_values.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/dropdown.dart';
import '../../job_card_details_controller.dart';

///
class EmployeeTableWidgetMobile extends StatelessWidget {
  EmployeeTableWidgetMobile({super.key, this.controller});

  final controller;
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () =>
          //
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Team deployed to carry out the job"),
                  ActionButton(
                    label: "Add Employee",
                    onPressed: () {
                      final index = controller.employeeTableRows.length;
                      Get.dialog(
                        AlertDialog(
                          title: Text('Add Employee'),
                          content: EmployeeFormDialogMobile(index: index),
                          actions: [
                            CustomElevatedButton(
                              text: 'Add',
                              onPressed: () {
                                controller.addEmployee();
                                Get.back();
                              },
                            ),
                            CustomElevatedButton(
                              text: 'Cancel',
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icons.add,
                    color: ColorValues.appGreenColor,
                  ),
                ]),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.employeeList.length,
              itemBuilder: (context, index) {
                EmployeeModel employee = controller.employeeList[index];
                return //
                    Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(employee.name ?? ''), // Employee Name
                      Text(employee.responsibility ?? ''), // Responsibility
                      ActionButton(
                        label: "View Competencies",
                        color: ColorValues.appLightBlueColor,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          controller.deleteEmployee(index);
                        },
                      ),
                    ]),
                  ),
                );
              },
            ),
          ]),
    );
  }

  ///
}

class EmployeeFormDialogMobile extends GetView<JobCardDetailsController> {
  ///
  EmployeeFormDialogMobile({super.key, this.index});
  final int? index;

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Column(
      children: [
        DropdownWidget(
          controller: controller,
          dropdownList: controller.employeeList,
          isValueSelected: controller.isEmployeeSelected.value,
          selectedValue: controller.selectedEmployeeName.value,
          onValueChanged: (list, selectedValueText) {
            // controller.onEmployeeSelected(selectedValueText, index ?? 0);
          },
        ),
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
          controller: controller.responsibilityCtrlr,
        ),
        ActionButton(
          label: "View Competencies",
          color: ColorValues.appLightBlueColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
