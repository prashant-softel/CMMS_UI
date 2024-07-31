import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_textfield.dart';

class ObservationUpdateDialog extends GetView {
  ObservationUpdateDialog();
  final PreventiveMaintenanceExecutionController controller = Get.find();

  @override
  Widget build(
    BuildContext context,
  ) {
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

    Widget _rowcpOkItem(int? defaultValue, {required Function(bool) onCheck}) {
      return CustomSwitchTroggle(
          value: defaultValue == 1 ? true : false,
          onChanged: (value) {
            print("object");
            controller.isToggleokOn.value = value!;
            onCheck(value);

            //  controller.toggle();
          });
    }

    return StatefulBuilder(builder: ((context, setState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Observation of  ${controller.selectedItem?.name ?? ""}",
              style: Styles.appDarkBlue13,
            ),
            Dimens.boxHeight5,
            Text(
              "  ${controller.selectedItem?.checklist_name ?? ""}",
              style: Styles.appDarkBlue13,
            ),
            Dimens.boxHeight5,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.rowItemobs.value.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.lightBlue.shade50,
                    elevation: 10,
                    shadowColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.rowItemobs.value[index]
                            .map<Widget>((map) {
                          return Column(
                            children: [
                              (map['key'] == "observation")
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Observation:",
                                            style: Styles.appDarkGrey12),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LoginCustomTextfield(
                                            textController:
                                                new TextEditingController(
                                                    text: map["value"] ?? ''),
                                            onChanged: (txt) {
                                              map["value"] = txt;
                                            },
                                            maxLine: 5,
                                          ),
                                        ),
                                      ],
                                    )
                                  : (map['key'] == "checkpoint")
                                      ? Row(
                                          children: [
                                            Text("Checkpoint:",
                                                style: Styles.appDarkGrey12),
                                            Expanded(
                                              child: Text(map['value'] ?? '',
                                                  style: Styles.appDarkBlue12),
                                            ),
                                          ],
                                        )
                                      : (map['key'] == "requirement")
                                          ? Row(
                                              children: [
                                                Text("Requirement:",
                                                    style:
                                                        Styles.appDarkGrey12),
                                                Text(map['value'] ?? '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              ],
                                            )
                                          : (map['key'] == "weightage")
                                              ? Row(
                                                  children: [
                                                    Text("Weightage:",
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    Text(map['value'] ?? '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  ],
                                                )
                                              : (map['key'] == "cpok")
                                                  ? Row(
                                                      children: [
                                                        Text("CP Ok:",
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        _rowcpOkItem(
                                                            int.tryParse(
                                                                '${map['value']}'),
                                                            onCheck: (val) {
                                                          map['value'] =
                                                              val == true
                                                                  ? "1"
                                                                  : "0";
                                                          Future.delayed(
                                                              Duration.zero,
                                                              () {
                                                            setState(() {});
                                                          });
                                                        }),
                                                      ],
                                                    )
                                                  : (map['key'] == "type" &&
                                                          map['inpute_type'] ==
                                                              "2")
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: [
                                                              LoginCustomTextfield(
                                                                  width:
                                                                      (Get.width *
                                                                          .8),
                                                                  textController:
                                                                      new TextEditingController(
                                                                          text: map["value"] ??
                                                                              ''),
                                                                  onChanged:
                                                                      (txt) {
                                                                    map["value"] =
                                                                        txt;
                                                                  }),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "Min:${map["min"]}"),
                                                                  Dimens
                                                                      .boxWidth15,
                                                                  Text(
                                                                      "Max:${map["max"]}")
                                                                ],
                                                              )
                                                            ],
                                                          ))
                                                      : (map['key'] == "type" &&
                                                              map['inpute_type'] ==
                                                                  "0")
                                                          ? Row(
                                                              children: [
                                                                Text("Type:",
                                                                    style: Styles
                                                                        .appDarkGrey12),
                                                                Text('Text',
                                                                    style: Styles
                                                                        .appDarkBlue12),
                                                              ],
                                                            )
                                                          : (map['key'] ==
                                                                  "job_created")
                                                              ?
                                                              // Obx(() {
                                                              //     return
                                                              Row(
                                                                  children: [
                                                                    Text(
                                                                        "Job Create:",
                                                                        style: Styles
                                                                            .appDarkGrey12),
                                                                    _rowItem(
                                                                        int.tryParse(
                                                                            '${map['job_value']}'),
                                                                        onCheck:
                                                                            (val) {
                                                                      map['job_value'] = val ==
                                                                              true
                                                                          ? "1"
                                                                          : "0";
                                                                      Future.delayed(
                                                                          Duration
                                                                              .zero,
                                                                          () {
                                                                        setState(
                                                                            () {});
                                                                      });

                                                                      // Update the reactive variable
                                                                      //  });
                                                                    }),
                                                                  ],
                                                                )
                                                              : Dimens.box0
                              // : Row(children: [
                              //     Text('${map['key']!}: ',
                              //         style: Styles.appDarkGrey12),
                              //     SizedBox(
                              //       width: 5,
                              //     ),
                              //     Expanded(
                              //       child: Text(
                              //           '${map['value']!}'
                              //           '',
                              //           style: Styles.appDarkBlue12),
                              //     ),
                              //   ]),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
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
                                  e.edit == UserAccessConstants.kHaveEditAccess)
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
                                  e.edit == UserAccessConstants.kHaveEditAccess)
                              .length >
                          0
                      ? Container(
                          height: 35,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.appDarkBlueColor,
                            text: "Update",
                            onPressed: () {
                              Get.back();
                              controller.transferItem();
                              controller.updatePmExecution();
                            },
                          ),
                        )
                      : Dimens.box0,
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
