import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            "Observation of  ${controller.selectedItem?.name ?? ""}",
            style: Styles.blue700,
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
            // padding: EdgeInsets.only(right: 30, top: 10),
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
                          Container(
                            margin: Dimens.edgeInsets20,
                            height: ((controller.selectedItem
                                            ?.checklist_observation?.length ??
                                        0) *
                                    40) +
                                180,
                            width: MediaQuery.of(context).size.width / 1.2,
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
                                        "  ${controller.selectedItem?.checklist_name ?? ""}",
                                        style: Styles.blue700,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: DataTable2(
                                    minWidth: 2000,
                                    border: TableBorder.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234)),
                                    columns: [
                                      DataColumn2(
                                          fixedWidth: 100,
                                          label: Text(
                                            "Sr.No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 150,
                                          label: Text(
                                            "Check Point No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          // fixedWidth: 300,
                                          label: Text(
                                        "Check Point",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn2(
                                          // fixedWidth: 300,
                                          label: Text(
                                        "Requirement",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn2(
                                          fixedWidth: 150,
                                          label: Text(
                                            "Weightage",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 150,
                                          label: Text(
                                            "CP ok?",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Upload Images",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 300,
                                          label: Text(
                                            "Observation",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 100,
                                          label: Text(
                                            "Job ID",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                    rows: List<DataRow>.generate(
                                      controller.selectedItem
                                              ?.checklist_observation?.length ??
                                          0,
                                      (index) => DataRow(cells: [
                                        DataCell(Text('${index + 1}')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.checklist_observation?[index]
                                                .check_point_id
                                                .toString() ??
                                            '')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.checklist_observation?[index]
                                                .check_point_name ??
                                            '')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.checklist_observation?[index]
                                                .requirement ??
                                            '')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.checklist_observation?[index]
                                                .failure_waightage
                                                .toString() ??
                                            '')),
                                        DataCell(Text('--')),
                                        DataCell(Text('--')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.checklist_observation?[index]
                                                .observation ??
                                            '')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.checklist_observation?[index]
                                                .linked_job_id
                                                .toString() ??
                                            '')),
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ////Associated Job cards
                          Container(
                            margin: Dimens.edgeInsets20,
                            height: ((controller.selectedItem?.schedule_link_job
                                            ?.length ??
                                        0) *
                                    40) +
                                120,
                            width: MediaQuery.of(context).size.width / 1.2,
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
                                        "Associated JobCard(s) ",
                                        style: Styles.blue700,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: DataTable2(
                                    minWidth: 2000,
                                    border: TableBorder.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234)),
                                    columns: [
                                      DataColumn2(
                                          fixedWidth: 100,
                                          label: Text(
                                            "Sr.No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 150,
                                          label: Text(
                                            "Job ID",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "For Check point No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          // fixedWidth: 300,
                                          label: Text(
                                        "Job Title",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Job Date",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Job Status",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                    rows: List<DataRow>.generate(
                                      controller.selectedItem?.schedule_link_job
                                              ?.length ??
                                          0,
                                      (index) => DataRow(cells: [
                                        DataCell(Text('${index + 1}')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.schedule_link_job?[index]
                                                .job_id
                                                .toString() ??
                                            '')),
                                        DataCell(Text('--')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.schedule_link_job?[index]
                                                .job_title ??
                                            '')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.schedule_link_job?[index]
                                                .job_date ??
                                            '')),
                                        DataCell(Text(controller
                                                .selectedItem
                                                ?.schedule_link_job?[index]
                                                .job_status ??
                                            '')),
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ////Material Used/Issued
                          // SizedBox(
                          //   height: 270,
                          //   width: MediaQuery.of(context).size.width / 1.2,
                          //   child: Container(
                          //     margin: Dimens.edgeInsets20,
                          //     height: 250,
                          //     decoration: BoxDecoration(
                          //       border: Border.all(
                          //         color:
                          //             ColorValues.lightGreyColorWithOpacity35,
                          //         width: 1,
                          //       ),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: ColorValues.appBlueBackgroundColor,
                          //           spreadRadius: 2,
                          //           blurRadius: 5,
                          //           offset: Offset(0, 2),
                          //         ),
                          //       ],
                          //     ),
                          //     child: Column(
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(10.0),
                          //           child: Row(
                          //             children: [
                          //               Text(
                          //                 "Material Used/Issued",
                          //                 style: Styles.blue700,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //         Divider(
                          //           color: ColorValues.greyLightColour,
                          //         ),
                          //         Expanded(
                          //           child: Theme(
                          //             data: ThemeData(
                          //                 scrollbarTheme: ScrollbarThemeData(
                          //                     isAlwaysShown: false,
                          //                     thumbColor: MaterialStateProperty
                          //                         .all<Color>(
                          //                             Colors.transparent))),
                          //             child: ScrollableTableView(
                          //               columns: [
                          //                 "Sr.No.",
                          //                 "Asset Name",
                          //                 "Asset Type",
                          //                 "Consumed Quantity",
                          //               ].map((column) {
                          //                 return TableViewColumn(
                          //                   label: column,
                          //                   minWidth: Get.width * 0.18,
                          //                 );
                          //               }).toList(),
                          //               rows: [
                          //                 [
                          //                   "1",
                          //                   "GasKit",
                          //                   "Consumable",
                          //                   "2",
                          //                 ],
                          //                 [
                          //                   "2",
                          //                   "String connected 85Qmm male MC4",
                          //                   "spare",
                          //                   "1",
                          //                 ],
                          //               ].map((record) {
                          //                 return TableViewRow(
                          //                   height: 50,
                          //                   cells: record.map((value) {
                          //                     return TableViewCell(
                          //                         child: Text(value));
                          //                     //  (value == "Action")
                          //                     //     ? Wrap(children: [
                          //                     //         TableActionButton(
                          //                     //           color: ColorValues
                          //                     //               .viewColor,
                          //                     //           icon: Icons
                          //                     //               .remove_red_eye_outlined,
                          //                     //           message: 'View',
                          //                     //           onPress: () {},
                          //                     //         ),
                          //                     //         TableActionButton(
                          //                     //           color: ColorValues
                          //                     //               .appGreenColor,
                          //                     //           icon: Icons.add,
                          //                     //           message: 'Add',
                          //                     //           onPress: () {},
                          //                     //         ),
                          //                     //         TableActionButton(
                          //                     //           color: ColorValues
                          //                     //               .appRedColor,
                          //                     //           icon: Icons.remove,
                          //                     //           message: 'Delete',
                          //                     //           onPress: () {},
                          //                     //         ),
                          //                     //       ])
                          //                     //     : Text(value));
                          //                   }).toList(),
                          //                 );
                          //               }).toList(),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
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
                        Get.back();
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
