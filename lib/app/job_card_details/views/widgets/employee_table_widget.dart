import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
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
      // contentPadding: EdgeInsets.zero,
      title: Text(
        'Add Employee',
        style: Styles.blackBold16,
      ),
      content: Builder(builder: (context) {
        var height = MediaQuery.of(context).size.height;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorValues.lightGreyColorWithOpacity35,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorValues.appBlueBackgroundColor,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.only(right: 30, top: 10),
          height: height / 4,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Dimens.boxHeight5,
                        RichText(
                          text: TextSpan(
                            text: 'Select: ',
                            style: Styles.blackBold16,
                          ),
                        ),
                        Dimens.boxHeight35,
                        RichText(
                          text: TextSpan(
                            text: 'Responsibility: ',
                            style: Styles.blackBold16,
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxWidth30,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownWebWidget(
                          width: MediaQuery.of(context).size.width / 5,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: ColorValues.whiteColor,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          controller: controller,
                          dropdownList: controller.employeeList,
                          isValueSelected: controller.isEmployeeSelected.value,
                          selectedValue: controller.selectedEmployeeName.value,
                          onValueChanged: controller.onDropdownValueChanged,
                        ),
                        Dimens.boxHeight10,
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 5,
                          child: TextField(
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16.0,
                                  height: 1.0,
                                  color: Colors.black),
                            ),
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
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
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Spacer(),
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
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ColorValues.whiteColor,
                    backgroundColor: ColorValues.addNewColor,
                  ),
                  child: Text(
                    'Add',
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      }),
    );
  }

  ///
}
