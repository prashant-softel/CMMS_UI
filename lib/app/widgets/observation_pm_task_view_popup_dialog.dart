import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class ObservationPMTaskViewDialog extends GetView {
  ObservationPMTaskViewDialog();

  final PreventiveMaintenanceTaskViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        // insetPadding: Dimens.edgeInsets10_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Center(
          child: Text(
            "Observation of Demo_Block_1_Inv_1",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
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
                  color: ColorValues.whiteColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.only(right: 30, top: 10),
            // height: height / 2.3,
            // width: double.infinity,
            child: Column(
              children: [
              
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Container(
                    // height: MediaQuery.of(context).size.height / 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ////Assets
                          SizedBox(
                            height: 430,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Container(
                              margin: Dimens.edgeInsets20,
                              height: 250,
                              decoration: BoxDecoration(
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Demo_checklist_1",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                          scrollbarTheme: ScrollbarThemeData(
                                              isAlwaysShown: false,
                                              thumbColor: MaterialStateProperty
                                                  .all<Color>(
                                                      Colors.transparent))),
                                      child: ScrollableTableView(
                                        columns: [
                                          "Sr.No.",
                                          "Check Point No.",
                                          "Check Point",
                                          "Requirement",
                                          "Weightage",
                                          "Upload Images",
                                          "Observation",
                                          "Job ID",
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            minWidth: Get.width * 0.1,
                                          );
                                        }).toList(),
                                        rows: [
                                          [
                                            "1",
                                            "5676",
                                            "Check Each String Connection",
                                            "Check All Working or not",
                                            "50%",
                                            "IMG3547",
                                            "Checked",
                                            "-",
                                          ],
                                          [
                                            "2",
                                            "5677",
                                            "Check Each String Connection",
                                            "Check All Working or not",
                                            "50%",
                                            "IMG3548",
                                            "Checked",
                                            "-",
                                          ],
                                          [
                                            "3",
                                            "5678",
                                            "Check Each String Connection",
                                            "Check All Working or not",
                                            "80%",
                                            "IMG3549",
                                            "Working",
                                            "-",
                                          ],
                                          [
                                            "4",
                                            "5679",
                                            "Check Each String Connection",
                                            "Check All Working or not",
                                            "70%",
                                            "IMG3550",
                                            "Checked",
                                            "-",
                                          ],
                                          [
                                            "5",
                                            "5680",
                                            "Shouldbe clean",
                                            "Check All Working or not",
                                            "50%",
                                            "IMG3551",
                                            "Checked",
                                            "-",
                                          ],
                                        ].map((record) {
                                          return TableViewRow(
                                            height: 48,
                                            cells: record.map((value) {
                                              return TableViewCell(
                                                  child: Text(value));
                                              // (value == "Action")
                                              //     ? Wrap(children: [
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .viewColor,
                                              //           icon: Icons
                                              //               .remove_red_eye_outlined,
                                              //           message: 'View',
                                              //           onPress: () {},
                                              //         ),
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .appGreenColor,
                                              //           icon: Icons.add,
                                              //           message: 'Add',
                                              //           onPress: () {},
                                              //         ),
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .appRedColor,
                                              //           icon: Icons.remove,
                                              //           message: 'Delete',
                                              //           onPress: () {},
                                              //         ),
                                              //       ])
                                              //     : Text(value));
                                            }).toList(),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  
                          ////Associated Job cards
                          SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Container(
                              margin: Dimens.edgeInsets20,
                              height: 250,
                              decoration: BoxDecoration(
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Associated Job(s)",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                          scrollbarTheme: ScrollbarThemeData(
                                              isAlwaysShown: false,
                                              thumbColor: MaterialStateProperty
                                                  .all<Color>(
                                                      Colors.transparent))),
                                      child: ScrollableTableView(
                                        columns: [
                                          "Sr.No.",
                                          "Job ID",
                                          "For Check point No.",
                                          "Job Title",
                                          "Job Date",
                                          "Job Status",
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            minWidth: Get.width * 0.13,
                                          );
                                        }).toList(),
                                        rows: [
                                          [
                                            "1",
                                            "JQ34690",
                                            "5975",
                                            "Demo_Block_i_inv_1,check and clean charging",
                                            "15-08-2023",
                                            "In Progress",
                                          ],
                                        ].map((record) {
                                          return TableViewRow(
                                            height: 45,
                                            cells: record.map((value) {
                                              return TableViewCell(
                                                  child: Text(value));
                                              // (value == "Action")
                                              //     ? Wrap(children: [
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .viewColor,
                                              //           icon: Icons
                                              //               .remove_red_eye_outlined,
                                              //           message: 'View',
                                              //           onPress: () {},
                                              //         ),
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .appGreenColor,
                                              //           icon: Icons.add,
                                              //           message: 'Add',
                                              //           onPress: () {},
                                              //         ),
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .appRedColor,
                                              //           icon: Icons.remove,
                                              //           message: 'Delete',
                                              //           onPress: () {},
                                              //         ),
                                              //       ])
                                              //     : Text(value));
                                            }).toList(),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  
                          ////Material Used/Issued
                          SizedBox(
                            height: 270,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Container(
                              margin: Dimens.edgeInsets20,
                              height: 250,
                              decoration: BoxDecoration(
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Material Used/Issued",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                          scrollbarTheme: ScrollbarThemeData(
                                              isAlwaysShown: false,
                                              thumbColor: MaterialStateProperty
                                                  .all<Color>(
                                                      Colors.transparent))),
                                      child: ScrollableTableView(
                                        columns: [
                                          "Sr.No.",
                                          "Asset Name",
                                          "Asset Type",
                                          "Consumed Quantity",
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            minWidth: Get.width * 0.18,
                                          );
                                        }).toList(),
                                        rows: [
                                          [
                                            "1",
                                            "GasKit",
                                            "Consumable",
                                            "2",
                                          ],
                                          [
                                            "2",
                                            "String connected 85Qmm male MC4",
                                            "spare",
                                            "1",
                                          ],
                                        ].map((record) {
                                          return TableViewRow(
                                            height: 50,
                                            cells: record.map((value) {
                                              return TableViewCell(
                                                  child: Text(value));
                                              //  (value == "Action")
                                              //     ? Wrap(children: [
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .viewColor,
                                              //           icon: Icons
                                              //               .remove_red_eye_outlined,
                                              //           message: 'View',
                                              //           onPress: () {},
                                              //         ),
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .appGreenColor,
                                              //           icon: Icons.add,
                                              //           message: 'Add',
                                              //           onPress: () {},
                                              //         ),
                                              //         TableActionButton(
                                              //           color: ColorValues
                                              //               .appRedColor,
                                              //           icon: Icons.remove,
                                              //           message: 'Delete',
                                              //           onPress: () {},
                                              //         ),
                                              //       ])
                                              //     : Text(value));
                                            }).toList(),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              
                Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      icon: Icons.print,
                      backgroundColor: ColorValues.linktopermitColor,
                      text: "Print",
                      onPressed: () {
                        //controller.printScreen();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      // icon: Icons.link,
                      backgroundColor: ColorValues.appRedColor,
                      text: "Close",
                      onPressed: () {
                        //controller.printScreen();
                      },
                    ),
                  )
                ]),
                Spacer(),
              ],
            ),
          );
        }),
      );
    }));
  }
}
