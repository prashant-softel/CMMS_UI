import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_dropdown.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../../widgets/table_action_button.dart';
import '../preventive_maintenance_execution_view_controller.dart';

class PreventiveMaintenanceExecutionViewContentWeb
    extends GetView<PreventiveMaintenanceExecutionViewController> {
  PreventiveMaintenanceExecutionViewContentWeb({super.key});

  ///
  var controller = Get.find<PreventiveMaintenanceExecutionViewController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 227, 224, 224),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.home,
                color: ColorValues.greyLightColor,
              ),
              Text(
                "DASHBOARD",
                style: Styles.greyLight14,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(" / Preventive Maintenance".toUpperCase(),
                    style: Styles.greyMediumLight12),
              ),
              Text(" / PM EXECUTION VIEW", style: Styles.greyMediumLight12)
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,

            margin: EdgeInsets.only(left: 20, top: 30, right: 20),
            // height: Get.height,
            child: Card(
              color: Color.fromARGB(255, 245, 248, 250),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "PM Execution Process ",
                          style: Styles.blue700,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorValues.greyLightColour,
                  ),
                  Expanded(
                    child: Container(
                      margin: Dimens.edgeInsets20,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Equipments: ",
                                  style: Styles.black17,
                                ),
                                Text("Demo_block_1_Inv_3",
                                    style: Styles.blue700),
                                Spacer(),
                                Text(
                                  "Maint. Order: ",
                                  style: Styles.black17,
                                ),
                                Text("PMSH02343", style: Styles.blue700),
                                Spacer(),
                                Text(
                                  "Check List: ",
                                  style: Styles.black17,
                                ),
                                Text("Check_list_001", style: Styles.blue700),
                                Spacer(),
                                Text(
                                  "Frequency: ",
                                  style: Styles.black17,
                                ),
                                Text("Monthly", style: Styles.blue700),
                              ],
                            ),
                            Dimens.boxHeight15,
                            Row(
                              children: [
                                Text(
                                  "Last Done Date: ",
                                  style: Styles.black17,
                                ),
                                Text("2022-02-15", style: Styles.blue700),
                                Dimens.boxWidth100,
                                Text(
                                  "Start Date: ",
                                  style: Styles.black17,
                                ),
                                Text("2022-02-15", style: Styles.blue700),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
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
                              child: ScrollableTableView(
                                columns: [
                                  "Check Point",
                                  "Requirement",
                                  "Upload Image",
                                  "Observation",
                                  "Create Job",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.15,
                                  );
                                }).toList(),
                                rows: [
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Checked",
                                    "Create_job"
                                  ],
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Working",
                                    "Create_job"
                                  ],
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Checked",
                                    "Create_job"
                                  ],
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Working",
                                    "Create_job"
                                  ]
                                ].map((record) {
                                  return TableViewRow(
                                    height: 90,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: (value == "Create_job")
                                            ? CustomSwitchTroggle(
                                                onChanged: (value) {},
                                              )
                                            : (value == "Upload_image")
                                                ? TableActionButton(
                                                    color: ColorValues
                                                        .appDarkBlueColor,
                                                    icon: Icons
                                                        .remove_red_eye_outlined,
                                                    label: '1 Files',
                                                    onPress: () {},
                                                  )
                                                : Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                            ),
                            Dimens.boxHeight30,
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Associated Job(s) ",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: ScrollableTableView(
                                      columns: [
                                        "Job ID",
                                        "Job Title",
                                        "Job Description",
                                        "Job Date",
                                        "Job Status",
                                      ].map((column) {
                                        return TableViewColumn(
                                          label: column,
                                          minWidth: Get.width * 0.15,
                                        );
                                      }).toList(),
                                      rows: [
                                        [
                                          "JQ325890",
                                          "Check and clean charging module",
                                          "Check and clean charging module should be clean",
                                          "2022-04-05",
                                          "In Progress",
                                        ],
                                      ].map((record) {
                                        return TableViewRow(
                                          height: 90,
                                          cells: record.map((value) {
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
                            ),
                            Dimens.boxHeight20,
                            Container(
                                width: Get.width,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorValues.appBlueBackgroundColor,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: CustomDropDownButton()),
                            Dimens.boxHeight20,
                            Container(
                                width: Get.width,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorValues.appBlueBackgroundColor,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: CustomDropDownButton()),
                            Dimens.boxHeight20,
                            Container(
                                width: Get.width,
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorValues.appBlueBackgroundColor,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: CustomDropDownButton()),
                            Dimens.boxHeight30,
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "PM History ",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: ScrollableTableView(
                                      columns: [
                                        "Time Stamp",
                                        "Posted By",
                                        "Comment",
                                        "Location",
                                        "Status",
                                      ].map((column) {
                                        return TableViewColumn(
                                          label: column,
                                          minWidth: Get.width * 0.15,
                                        );
                                      }).toList(),
                                      rows: [
                                        [
                                          "2022-04-05 16:40",
                                          "Sujit Kumar",
                                          "Execution Started",
                                          "--",
                                          "PM Execution Started",
                                        ],
                                        [
                                          "2022-04-05 16:40",
                                          "Sujit Kumar",
                                          "Execution Started",
                                          "--",
                                          "PM Execution Started",
                                        ],
                                      ].map((record) {
                                        return TableViewRow(
                                          height: 90,
                                          cells: record.map((value) {
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
                            ),
                            Dimens.boxHeight20,
                            Container(
                              margin: EdgeInsets.only(bottom: 30, top: 20),
                              child: Container(
                                height: 35,
                                width: (Get.width * .2) - 170,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.appDarkBlueColor,
                                  text: "Print",
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
