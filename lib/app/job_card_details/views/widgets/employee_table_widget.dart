import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/dropdown.dart';
import '../../job_card_details_controller.dart';

class EmployeeTableWidget extends StatelessWidget {
  ///
  EmployeeTableWidget({
    Key? key,
    required this.isWeb,
    required this.controller,
  }) : super(key: key);

  ///
  final bool isWeb;
  final JobCardDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return //

        Column(//
            children: [
      isWeb // this line checks if it is web
          ? Row(
              // and renders a Row if it is
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text("Team deployed to carry out the job"),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddEmployeeDialog();
                        },
                      );
                    },
                    child: Text("Add Employee"),
                  ),
                ])
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // and renders a Column if it is not
              children: [
                  Text("Team deployed"),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddEmployeeDialog();
                        },
                      );
                    },
                    child: Text("Add Employee"),
                  ),
                ]),

      Obx(() {
        // Obx widget to listen for changes in employeeTableRows
        return //
            controller.employeeList.length > 0
                ? Container(
                    height: (controller.employeeTableRows.length + 1) * 60,
                    child: //
                        DataTable2(
                            dataRowHeight: 60,
                            columnSpacing: 10,
                            border: TableBorder.all(
                                color: ColorValues.appLightGreyColor),
                            columns: isWeb
                                ? [
                                    DataColumn2(
                                        label: Text('Employee Name'),
                                        size: ColumnSize.L),
                                    DataColumn2(
                                        label: Text('Responsibility'),
                                        size: ColumnSize.L),
                                    DataColumn2(
                                        label: Text('View Competencies'),
                                        size: ColumnSize.L),
                                    DataColumn2(
                                        label: Text('Delete'),
                                        size: ColumnSize.S),
                                  ]
                                : [
                                    DataColumn2(
                                        label: Text('Employee'),
                                        size: ColumnSize.M),
                                    DataColumn2(
                                        label: Text('Responsibility'),
                                        size: ColumnSize.L),
                                    DataColumn2(
                                        label: Text(''), size: ColumnSize.S),
                                  ],
                            rows: controller
                                .employeeTableRows // Using the list of rows from the controller
                            ),
                  )
                : Dimens.box0;
      }),
      // ),
    ]);
    // );
  }
}

class AddEmployeeDialog extends StatelessWidget {
  ///

  final JobCardDetailsController controller = Get.find();

  ///

  Widget build(BuildContext context) {
    ///
    return //
        AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Add Employee',
        textAlign: TextAlign.center,
      ),
      content: //
          Builder(builder: (context) {
        return //
            SingleChildScrollView(
          child: //
              Container(
            width: Get.width * 0.9,
            margin: Dimens.edgeInsets5,
            child: //
                Column(
                    //
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Select: ',
                          style: Styles.blackBold16,
                          children: [
                            // TextSpan(
                            //   text: '*',
                            //   style: TextStyle(
                            //     color: ColorValues.orangeColor,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ]),
                    ),
                  ),
                  DropdownWidget(
                    controller: controller,
                    dropdownList: controller.employeeList,
                    isValueSelected: controller.isEmployeeSelected.value,
                    selectedValue: controller.selectedEmployeeName.value,
                    onValueChanged: controller.onDropdownValueChanged,
                  ),
                  Dimens.boxHeight20,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Responsibility: ',
                          style: Styles.blackBold16,
                          children: [
                            // TextSpan(
                            //   text: '*',
                            //   style: TextStyle(
                            //     color: ColorValues.orangeColor,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ]),
                    ),
                  ),
                  Dimens.boxHeight5,
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: ColorValues.whiteColor,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                      color: ColorValues.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      minLines: 3,
                      maxLines: 5,
                      controller: controller.responsibilityCtrlr,
                      autofocus: false,
                      decoration: InputDecoration(
                        fillColor: ColorValues.whiteColor,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      // onChanged: (value) {
                      //   if (value.trim().length > 3) {
                      //     controller.isJobTitleInvalid.value = false;
                      //   } else {
                      //     controller.isJobTitleInvalid.value = true;
                      //   }
                      // },
                    ),
                  ),
                  Dimens.boxHeight20,
                  ElevatedButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()) {
                      controller.addNewEmployee(
                        controller.selectedEmployee.value,
                        controller.responsibilityCtrlr.text,
                      );
                      Get.back();
                      //}
                    },
                    child: Text('Add'),
                  ),
                ]),
          ),
        );
      }),
    );
  }

  ///
}
