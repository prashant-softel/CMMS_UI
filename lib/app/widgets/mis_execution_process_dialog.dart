import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_mis_plan/view_mis_plan_controller.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class MisExecutionProcessDialog extends GetView {
  MisExecutionProcessDialog();

  final ViewAuditTaskController controller = Get.find();

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
            "Observation of ", // ${controller.selectedItem?.name ?? ""}",
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
                            height:
                                // ((controller.selectedItem
                                //                 ?.checklist_observation?.length ??
                                //             0) *
                                //         80) +
                                400,
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
                                        "checkloist001", //   "  ${controller.selectedItem?.checklist_name ?? ""}",
                                        style: Styles.blue700,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: DataTable2(
                                    dataRowHeight: 150,
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
                                          fixedWidth: 300,
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
                                          fixedWidth: 200,
                                          label: Text(
                                            "Input",
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
                                    ],
                                    rows: [
                                      [
                                        "1",
                                        "checkpoint1",
                                        "requirment",
                                        "Upload_image",
                                        "Observation",
                                      ],
                                      [
                                        "2",
                                        "checkpoint2",
                                        "requirment",
                                        "Upload_image",
                                        "Observation",
                                      ],
                                    ].map((record) {
                                      return DataRow(
                                        // height: 40,
                                        cells: record.map((value) {
                                          return DataCell(
                                            //  child:
                                            value == "Observation"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: LoginCustomTextfield(
                                                      width: (Get.width * .4),
                                                      // textController:
                                                      // controller
                                                      //         .selectedItem
                                                      //         ?.checklist_observation?[index]
                                                      //         .observation_value_controller
                                                      //     as TextEditingController,
                                                      maxLine: 5,
                                                    ),
                                                  )
                                                : (value == "Upload_image")
                                                    ? Column(
                                                        children: [
                                                          Obx(
                                                            () => Transform.scale(
                                                                scale: 0.8, // Adjust the scale factor as needed
                                                                child: RadioListTile(
                                                                  title: Text(
                                                                      'YES'),
                                                                  value: 1,
                                                                  groupValue:
                                                                      controller
                                                                          .selectedValue
                                                                          .value,
                                                                  onChanged: (value) =>
                                                                      controller
                                                                          .onRadioValueChanged(
                                                                              value!),
                                                                )),
                                                          ),
                                                          Obx(() =>
                                                              Transform.scale(
                                                                scale:
                                                                    0.8, // Adjust the scale factor as needed
                                                                child:
                                                                    RadioListTile(
                                                                  title: Text(
                                                                      'NO'),
                                                                  value: 2,
                                                                  groupValue:
                                                                      controller
                                                                          .selectedValue
                                                                          .value,
                                                                  onChanged: (value) =>
                                                                      controller
                                                                          .onRadioValueChanged(
                                                                              value!),
                                                                ),
                                                              )),
                                                          Obx(() =>
                                                              Transform.scale(
                                                                scale:
                                                                    0.8, // Adjust the scale factor as needed
                                                                child:
                                                                    RadioListTile(
                                                                  title: Text(
                                                                      'NA'),
                                                                  value: 3,
                                                                  groupValue:
                                                                      controller
                                                                          .selectedValue
                                                                          .value,
                                                                  onChanged: (value) =>
                                                                      controller
                                                                          .onRadioValueChanged(
                                                                              value!),
                                                                ),
                                                              )),
                                                        ],
                                                      )
                                                    : Text(value),
                                          );
                                        }).toList(),
                                      );
                                    }).toList(),
                                    //  List<DataRow>.generate(
                                    //   controller.selectedItem
                                    //           ?.checklist_observation?.length ??
                                    //       0,
                                    //   (index) =>
                                    //   DataRow(cells: [
                                    //     DataCell(Text(
                                    //       "jksdfjsdj",
                                    //     )),
                                    //     DataCell(Text(
                                    //       "jksdfjsdj",
                                    //     )),
                                    //     DataCell(Text(
                                    //       "jksdfjsdj",
                                    //     )),
                                    //     DataCell(Text(
                                    //       "jksdfjsdj",
                                    //     )),
                                    //     DataCell(Text('???')),
                                    //     DataCell(Padding(
                                    //       padding: const EdgeInsets.all(8.0),
                                    //       child: LoginCustomTextfield(
                                    //         width: (Get.width * .4),
                                    //         // textController:
                                    //         // controller
                                    //         //         .selectedItem
                                    //         //         ?.checklist_observation?[index]
                                    //         //         .observation_value_controller
                                    //         //     as TextEditingController,
                                    //         maxLine: 5,
                                    //       ),
                                    //     )),
                                    //   ]),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                      // varUserAccessModel.value.access_list!
                      //             .where((e) =>
                      //                 e.feature_id ==
                      //                     UserAccessConstants
                      //                         .kPmExecutionFeatureId &&
                      //                 e.edit ==
                      //                     UserAccessConstants.kHaveEditAccess)
                      //             .length >
                      //         0
                      //     ?
                      Container(
                        height: 35,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.appRedColor,
                          text: "Close",
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      //  : Dimens.box0,
                      SizedBox(
                        width: 20,
                      ),
                      // varUserAccessModel.value.access_list!
                      //             .where((e) =>
                      //                 e.feature_id ==
                      //                     UserAccessConstants
                      //                         .kPmExecutionFeatureId &&
                      //                 e.edit ==
                      //                     UserAccessConstants.kHaveEditAccess)
                      //             .length >
                      //         0
                      //     ?
                      Container(
                        height: 35,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.appDarkBlueColor,
                          text: "Update",
                          onPressed: () {
                            Get.back();
                            // controller.transferItem();
                            // controller.updatePmExecution();
                          },
                        ),
                      )
                      // : Dimens.box0,
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
