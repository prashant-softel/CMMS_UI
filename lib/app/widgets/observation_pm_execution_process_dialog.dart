import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class ObservationPmExecutionViewDialog extends GetView {
  ObservationPmExecutionViewDialog();

  final PreventiveMaintenanceExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Widget _rowItem(int? defaultValue, {required Function(bool) onCheck}) {
      return CustomSwitchTroggle(
          value: defaultValue == 1 ? true : false,
          onChanged: (value) {
            print("object");
            controller.isToggleOn.value = value!;
            onCheck(value);

            //  controller.toggle();
          });
    }

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
            height: height,
            // width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ////Assets
                          Container(
                            margin: Dimens.edgeInsets20,
                            height: ((controller.selectedItem
                                            ?.checklist_observation?.length ??
                                        0) *
                                    80) +
                                250,
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
                                    dataRowHeight: 100,
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
                                          fixedWidth: 400,
                                          label: Text(
                                            "Check Point",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 400,
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
                                      // DataColumn2(
                                      //     fixedWidth: 200,
                                      //     label: Text(
                                      //       "Upload Images",
                                      //       style: TextStyle(
                                      //           fontSize: 15,
                                      //           fontWeight: FontWeight.bold),
                                      //     )),
                                      DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "CP ok ?",
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
                                          fixedWidth: 150,
                                          label: Text(
                                            "Create Job",
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
                                                .check_point_name
                                                .toString() ??
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
                                        DataCell(Text('???')),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LoginCustomTextfield(
                                            width: (Get.width * .4),
                                            textController: controller
                                                    .selectedItem
                                                    ?.checklist_observation?[index]
                                                    .observation_value_controller
                                                as TextEditingController,
                                            maxLine: 5,
                                          ),
                                        )),
                                        DataCell(controller
                                                    .selectedItem
                                                    ?.checklist_observation?[
                                                        index]
                                                    .linked_job_id
                                                    .value ==
                                                0
                                            ? Obx(() {
                                                return _rowItem(
                                                    controller
                                                        .selectedItem
                                                        ?.checklist_observation?[
                                                            index]
                                                        .linked_job_id
                                                        .value, onCheck: (val) {
                                                  controller
                                                      .selectedItem
                                                      ?.checklist_observation?[
                                                          index]
                                                      .linked_job_id
                                                      .value = val ==
                                                          true
                                                      ? 1
                                                      : 0;
                                                });
                                              })
                                            : Text(
                                                " JOB${controller.selectedItem?.checklist_observation?[index].linked_job_id.value.toString() ?? ""}",
                                                style:
                                                    Styles.primary15Underlined,
                                              )),
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
                                        "Material Used ",
                                        style: Styles.blue700,
                                      ),
                                    ],
                                  ),
                                ),
                                ScrollableTableView(
                                  columns: [
                                    "Material Name",
                                    "Material Type",
                                    "Image",
                                    "Available Qty",
                                  ].map((column) {
                                    return TableViewColumn(
                                      label: column,
                                      minWidth: Get.width * 0.18,
                                      //  height: Get.height / 2,
                                    );
                                  }).toList(),
                                  rows: controller.rowItem.value.map((record) {
                                    return TableViewRow(
                                      height: 85,
                                      cells: record.map((mapData) {
                                        return TableViewCell(
                                          child: (mapData['key'] == "Drop_down")
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Column(
                                                    children: [
                                                      DropdownWebWidget(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4,
                                                        dropdownList: controller
                                                            .cmmrsItems,
                                                        selectedValue:
                                                            mapData["value"],
                                                        onValueChanged: (list,
                                                            selectedValue) {
                                                          // print({
                                                          //   selectedValue:
                                                          //       selectedValue
                                                          // });
                                                          mapData["value"] =
                                                              selectedValue;
                                                          controller.dropdownMapperData[
                                                                  selectedValue] =
                                                              list.firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .name ==
                                                                      selectedValue,
                                                                  orElse: null);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : (mapData['key'] ==
                                                      "Available_Qty")
                                                  ? Text(
                                                      "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}")
                                                  : (mapData['key'] ==
                                                          "Material_Type")
                                                      ? Text(
                                                          "${controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? ""}")
                                                      : Text(
                                                          mapData['key'] ?? ''),
                                        );
                                      }).toList(),
                                    );
                                  }).toList(),
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
                Container(
                  //   margin: EdgeInsets.only(bottom: 30, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPmExecutionFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .length >
                              0
                          ? Container(
                              height: 35,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appRedColor,
                                text: "Close",
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            )
                          : Dimens.box0,
                      SizedBox(
                        width: 20,
                      ),
                      varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPmExecutionFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .length >
                              0
                          ? Container(
                              height: 35,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appDarkBlueColor,
                                text: "Update",
                                onPressed: () {
                                  Get.back();
                                  controller.updatePmExecution();
                                },
                              ),
                            )
                          : Dimens.box0,
                    ],
                  ),
                ),
                Spacer(),

                // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //   SizedBox(
                //     width: 15,
                //   ),
                //   Container(
                //     height: 35,
                //     child: CustomElevatedButton(
                //       icon: Icons.print,
                //       backgroundColor: ColorValues.linktopermitColor,
                //       text: "Print",
                //       onPressed: () {
                //         //controller.printScreen();
                //       },
                //     ),
                //   ),
                //   SizedBox(
                //     width: 20,
                //   ),
                //   Container(
                //     height: 35,
                //     child: CustomElevatedButton(
                //       // icon: Icons.link,
                //       backgroundColor: ColorValues.appRedColor,
                //       text: "Close",
                //       onPressed: () {
                //         Get.back();
                //       },
                //     ),
                //   )
                // ]),
                // Spacer(),
              ],
            ),
          );
        }),
      );
    }));
  }
}
