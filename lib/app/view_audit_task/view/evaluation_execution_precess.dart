import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class EvaluationExecutionProcessDialog extends GetView {
  int? subtask_id;
  String? title;
  String? checkList_Number;
  int? scheduleID;
  EvaluationExecutionProcessDialog(
      {required this.subtask_id,
      required this.title,
      this.checkList_Number,
      this.scheduleID});

  final ViewAuditTaskController controller = Get.find();
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

  Widget _rowBoolItem(int? defaultValue, {required Function(bool) onCheck}) {
    return Checkbox(
        value: defaultValue == 1 ? true : false,
        checkColor: Colors.white,
        activeColor: ColorValues.appGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 1.0,
            color: ColorValues.blackColor,
          ),
        ),
        onChanged: (val) {
          controller.isToggleBoolOn.value = val!;
          onCheck(val);
        });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      Widget _rowcpOkItem(int? defaultValue,
          {required Function(bool) onCheck}) {
        return CustomSwitchTroggle(
            value: defaultValue == 1 ? true : false,
            onChanged: (value) {
              print("object");
              controller.isToggleokOn.value = value!;
              onCheck(value);

              //  controller.toggle();
            });
      }

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        // insetPadding: Dimens.edgeInsets10_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Center(
          child: Text(
            "Observation of  ${title}",
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
            child: Obx(
              () => Column(
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
                                  //  ((controller.auditTasknDetailModel.value.sub_PmTask != null&&) *
                                  //         80) +
                                  350,
                              width: MediaQuery.of(context).size.width / 1.2,
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
                                          "${checkList_Number}", // "  ${controller.auditTasknDetailModel.value.schedules![0].checklist_name ?? ""}",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Obx(
                                      () => DataTable2(
                                        dataRowHeight: 112,
                                        minWidth: 2500,
                                        border: TableBorder.all(
                                            color: Color.fromARGB(
                                                255, 206, 229, 234)),
                                        columns: [
                                          // DataColumn2(
                                          //     fixedWidth: 100,
                                          //     label: Text(
                                          //       "Sr.No.",
                                          //       style: TextStyle(
                                          //           fontSize: 15,
                                          //           fontWeight: FontWeight.bold),
                                          //     )),
                                          DataColumn2(
                                              fixedWidth: 400,
                                              label: Text(
                                                "Check Point",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 400,
                                              label: Text(
                                                "Requirement",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),

                                          DataColumn2(
                                              fixedWidth: 220,
                                              label: Text(
                                                "Accept",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 300,
                                              label: Text(
                                                "Observation",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 180,
                                              label: Text(
                                                "Upload Images",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 193,
                                              label: Text(
                                                "Type",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ],
                                        rows: controller.rowItemAuditobs.value
                                            .map((record) {
                                          return DataRow(
                                            // height: 130,
                                            cells: record.map((
                                              mapData,
                                            ) {
                                              return DataCell(commonUi(
                                                  setState, mapData, record));
                                            }).toList(),
                                          );
                                        }).toList(),
                                      ),
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
                                    // Get.back();
                                    // controller.transferItem();
                                    controller.updateAuditTaskExecution(
                                        exeType: 1,
                                        subtask_id: subtask_id,
                                        scheduleID: scheduleID);
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
            ),
          );
        }),
      );
    }));
  }

  Widget commonUi(
    void Function(void Function()) setState,
    Map<String, String> mapData,
    List<Map<String, String>> record,
  ) {
    int index = controller.rowItemAuditobs.value.indexOf(record);
    switch (mapData['key']) {
      case 'observation':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoginCustomTextfield(
            width: (Get.width * .4),
            textController:
                new TextEditingController(text: mapData["value"] ?? ''),
            onChanged: (txt) {
              mapData["value"] = txt;
            },
            maxLine: 5,
          ),
        );

      case 'type':
        return (mapData['inpute_type'] == "2" || mapData['inpute_type'] == "3")
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    LoginCustomTextfield(
                        // focusNode: controller.focusList[index],
                        width: (Get.width * .8),
                        textController:
                            TextEditingController(text: mapData["value"] ?? ''),

                        // textController:
                        //     controller.textEditingControllerList[index],
                        // new TextEditingController(
                        //     text: mapData["value"] == null ||
                        //             mapData["value"] == "null"
                        //         ? ""
                        //         : mapData["value"] ?? ''),
                        onChanged: (txt) {
                          controller.debounce.run(() {
                            mapData["value"] = txt;
                            // updateJob(record);
                            Future.delayed(Duration.zero, () {
                              setState(() {});
                            });
                          });
                        }),
                    Row(
                      children: [
                        Text("Min:${mapData["min"]}"),
                        Dimens.boxWidth15,
                        Text("Max:${mapData["max"]}")
                      ],
                    )
                  ],
                ))
            : (mapData['inpute_type'] == "0")
                ? LoginCustomTextfield(
                    width: (Get.width * .8),
                    textController: new TextEditingController(
                        text: mapData["value"] == null ||
                                mapData["value"] == "null"
                            ? ""
                            : mapData["value"] ?? ''),
                    onChanged: (txt) {
                      mapData["value"] = txt;
                      //  updateJob(record);
                      // Future.delayed(Duration.zero, () {
                      //   setState(() {});
                      // });
                    })
                : (mapData['inpute_type'] == "1")
                    ? _rowBoolItem(int.tryParse('${mapData['value']}'),
                        onCheck: (val) {
                        mapData['value'] = val == true ? "1" : "0";
                        Future.delayed(Duration.zero, () {
                          setState(() {});
                        });
                      })
                    : Text("");

      case 'job_created':
        //record[3]['value']=cpok
        //record[7]['cp_ok_value']=createjob

        // return Text(
        //     "${record[3]['value']},${record[7]['cp_ok_value']},${((record[7]['cp_ok_value'] == "0" && record[3]['value'] == "0") || (record[7]['cp_ok_value'] == "0" && record[3]['value'] == "1"))},${(record[3]['value'] != "1" && record[7]['cp_ok_value'] == "0")}");
        return Row(
          children: [
            (record[7]['value'] != "1" &&
                    record[7]['value'] != "0" &&
                    mapData['cp_ok_value'] != "1")
                ? Text('JOB${(record[7]['value'])}')
                : ((record[3]['value'] == "0")
                    //     ||
                    // (record[7]['cp_ok_value'] == "0" && record[3]['value'] == "1")
                    )
                    ?
                    // Obx(() {
                    //     return
                    _rowItem(int.tryParse('${record[7]['value']}'),
                        onCheck: (val) {
                        record[7]['value'] = val == true ? "1" : "0";
                        Future.delayed(Duration.zero, () {
                          setState(() {});
                        });

                        // Update the reactive variable
                        //  });
                      })
                    : Dimens.box0
          ],
        );

      case 'accept':
        return (mapData['three_type'] == "4")
            ? Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the radio buttons
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<int>(
                    title: Text('YES'),
                    value: 0,
                    groupValue: int.tryParse('${mapData['value']}'),
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    onChanged: (int? value) {
                      setState(() {
                        mapData['value'] = value.toString();
                      });
                    },
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  RadioListTile<int>(
                    title: Text('NO'),
                    value: 1,
                    groupValue: int.tryParse('${mapData['value']}'),
                    visualDensity: VisualDensity.compact,
                    onChanged: (int? value) {
                      setState(() {
                        mapData['value'] = value.toString();
                      });
                    },
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  RadioListTile<int>(
                    title: Text('NA'),
                    value: 2,
                    groupValue: int.tryParse('${mapData['value']}'),
                    visualDensity: VisualDensity.compact,
                    onChanged: (int? value) {
                      setState(() {
                        mapData['value'] = value.toString();
                      });
                    },
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              )
            : _rowcpOkItem(int.tryParse('${mapData['value']}'), onCheck: (val) {
                mapData['value'] = val == true ? "1" : "0";
                // updateJob(record);
                Future.delayed(Duration.zero, () {
                  setState(() {});
                });
              });

      case 'uploadimg':
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                try {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );
                  if (result != null && result.files.single.bytes != null) {
                    setState(() {
                      mapData['uploaded'] = result.files.single.name;
                      controller.fileName.value = result.files.single.name;
                      controller.fileBytes = result.files.single.bytes;
                    });
                    controller.browseFiles(
                      fileBytes: controller.fileBytes,
                    );
                  } else {
                    // Handle the case where no file is picked
                    print('No file selected');
                  }
                } catch (e) {
                  // Handle the error scenario
                  print('Error picking file: $e');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorValues.appDarkBlueColor,
                  border: Border.all(
                    color: ColorValues.appDarkBlueColor,
                    width: 1,
                  ),
                ),
                child:
                    Icon(Icons.upload, size: 30, color: ColorValues.whiteColor),
              ),
            ),
            SizedBox(width: 10), // Add some spacing between the icon and text
            Expanded(
              // Wrap with Expanded to handle long filenames gracefully
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  "${mapData['uploaded'] ?? 'No file selected'}",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        );

      default:
        return Text(mapData['value'] ?? '');
    }
    // return Text("data");
  }

  // updateJob(List<Map<String, String>> record) {
  //   var max = int.tryParse(record[6]["max"] ?? '0') ?? 0;
  //   var min = int.tryParse(record[6]["min"] ?? '0') ?? 0;
  //   var inputNumber = int.tryParse(record[6]["value"] ?? "0") ?? 0;
  //   if (((record[3]['value'] == "1") &&
  //       !(min <= inputNumber && inputNumber <= max))) {
  //     Fluttertoast.showToast(msg: 'Not within range', timeInSecForIosWeb: 5);
  //   } else if (!(min <= inputNumber && inputNumber <= max)) {
  //     record[7]['value'] = "1";
  //   } else if (((record[3]['value'] == "0") ||
  //       (min <= inputNumber && inputNumber <= max))) {
  //     record[7]['value'] = "0";
  //   } else if (record[3]['value'] == "0") {
  //     //hidelse
  //   }
  // }
}
