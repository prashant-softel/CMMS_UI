import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class MobileObservationPmExecutionViewDialog
    extends GetView<PreventiveMaintenanceExecutionController> {
  MobileObservationPmExecutionViewDialog();

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  Widget _rowItem(int? defaultValue, {required Function(bool) onCheck}) {
    return CustomSwitchTroggle(
      value: defaultValue == 1 ? true : false,
      onChanged: (value) {
        controller.isToggleOn.value = value!;
        onCheck(value);
      },
    );
  }

  Widget _rowcpOkItem(int? defaultValue, {required Function(bool) onCheck}) {
    return CustomSwitchTroggle(
      value: defaultValue == 1 ? true : false,
      onChanged: (value) {
        controller.isToggleokOn.value = value!;
        onCheck(value);
      },
    );
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showObservationPmExecutionViewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            var height = MediaQuery.of(context).size.height;
            return
                // Obx(
                //   () =>
                Column(
              children: [
                Container(
                  height: Get.height / 1.1,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: Dimens.edgeInsets10,
                          // width: MediaQuery.of(context).size.width / 1.2,
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
                              Container(
                                width: Get.width,
                                child: Obx(
                                  () => Container(
                                    margin: Dimens.edgeInsets10,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorValues
                                            .lightGreyColorWithOpacity35,
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorValues
                                              .appBlueBackgroundColor,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: controller.rowItemobs.value
                                          .map((record) {
                                        return Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: record.map((mapData) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Text(
                                                    //   '${mapData['key'] ?? ''}:',
                                                    //   style:
                                                    //       Styles.appDarkGrey12,
                                                    // ),
                                                    if (mapData['key'] ==
                                                        "observation")
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Observation:',
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                          LoginCustomTextfield(
                                                            width: (Get.width *
                                                                .7),
                                                            textController:
                                                                new TextEditingController(
                                                                    text: mapData[
                                                                            "value"] ??
                                                                        ''),
                                                            onChanged: (txt) {
                                                              mapData["value"] =
                                                                  txt;
                                                            },
                                                            maxLine: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    if (mapData['key'] ==
                                                        "cpok")
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'CP OK ?:',
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                          _rowcpOkItem(
                                                              int.tryParse(
                                                                  '${mapData['value']}'),
                                                              onCheck: (val) {
                                                            mapData['value'] =
                                                                val == true
                                                                    ? "1"
                                                                    : "0";
                                                            updateJob(record);
                                                            Future.delayed(
                                                                Duration.zero,
                                                                () {
                                                              setState(() {});
                                                            });
                                                          }),
                                                        ],
                                                      ),
                                                    if (mapData['key'] ==
                                                        "job_created")
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Created Job:',
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                          (record[7][
                                                                          'value'] !=
                                                                      "1" &&
                                                                  record[7][
                                                                          'value'] !=
                                                                      "0" &&
                                                                  mapData['cp_ok_value'] !=
                                                                      "1")
                                                              ? Text(
                                                                  'JOB${(record[7]['value'])}')
                                                              : ((record[3][
                                                                          'value'] ==
                                                                      "0")
                                                                  //     ||
                                                                  // (record[7]['cp_ok_value'] == "0" && record[3]['value'] == "1")
                                                                  )
                                                                  ?
                                                                  // Obx(() {
                                                                  //     return
                                                                  _rowItem(
                                                                      int.tryParse(
                                                                          '${record[7]['value']}'),
                                                                      onCheck:
                                                                          (val) {
                                                                      record[7][
                                                                          'value'] = val ==
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
                                                                    })
                                                                  : Dimens.box0
                                                        ],
                                                      ),
                                                    if (mapData['key'] ==
                                                        "weightage")
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Weightage:',
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                          Text(
                                                              mapData['value'] ??
                                                                  '',
                                                              style: Styles
                                                                  .appDarkBlue12)
                                                        ],
                                                      ),
                                                    if (mapData['key'] ==
                                                        "requirement")
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Requirement:',
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                          Text(
                                                              mapData['value'] ??
                                                                  '',
                                                              style: Styles
                                                                  .appDarkBlue12)
                                                        ],
                                                      ),
                                                    if (mapData['key'] ==
                                                        "checkpoint")
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Check Point:',
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                          Text(
                                                              mapData['value'] ??
                                                                  '',
                                                              style: Styles
                                                                  .appDarkBlue12)
                                                        ],
                                                      ),
                                                    if (mapData['key'] ==
                                                        "type")
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Type:',
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                          (mapData['inpute_type'] ==
                                                                  "2")
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    children: [
                                                                      LoginCustomTextfield(
                                                                          width: (Get.width *
                                                                              .8),
                                                                          textController: new TextEditingController(
                                                                              text: mapData["value"] ??
                                                                                  ''),
                                                                          onChanged:
                                                                              (txt) {
                                                                            mapData["value"] =
                                                                                txt;
                                                                            updateJob(record);
                                                                            Future.delayed(Duration.zero,
                                                                                () {
                                                                              setState(() {});
                                                                            });
                                                                          }),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                              "Min:${mapData["min"]}"),
                                                                          Dimens
                                                                              .boxWidth15,
                                                                          Text(
                                                                              "Max:${mapData["max"]}")
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ))
                                                              : (mapData['inpute_type'] ==
                                                                      "0")
                                                                  ? Text('Text')
                                                                  : _rowBoolItem(
                                                                      int.tryParse(
                                                                          '${mapData['value']}'),
                                                                      onCheck:
                                                                          (val) {
                                                                      mapData[
                                                                          'value'] = val ==
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
                                                                    })
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 5),
                          child: Text(
                            "Material Used For ",
                            style: Styles.blue700,
                          ),
                        ),
                        Container(
                          width: Get.width,
                          child: Obx(
                            () => Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
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
                                children: controller.rowItem.map((record) {
                                  return Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: record.map((mapData) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (mapData['key'] == "Drop_down")
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Material Name:',
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    DropdownWebStock(
                                                      width: (Get.width * .9),
                                                      dropdownList: controller
                                                          .cmmrsItems!
                                                          .where((p0) {
                                                            return !controller
                                                                .rowItem
                                                                .map((p0) => p0[
                                                                    0]["value"])
                                                                .contains(
                                                                    p0!.name);
                                                          })
                                                          .toList()
                                                          .obs,
                                                      selectedValue:
                                                          mapData["value"],
                                                      onValueChanged: (list,
                                                          selectedValue) {
                                                        // print('paifcghb:${controller.assetList}');
                                                        // print({selectedValue: selectedValue});
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
                                                        Future.delayed(
                                                            Duration.zero, () {
                                                          setState(() {});
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              if (mapData['key'] == "Sr_No")
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Sr No.:",
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    Text(
                                                        "${controller.dropdownMapperData[record[0]['value']]?.serial_number ?? ""}"),
                                                  ],
                                                ),
                                              if (mapData['key'] == "code")
                                                Row(
                                                  children: [
                                                    Text(
                                                      "MDM Code:",
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    Text(
                                                        "${controller.dropdownMapperData[record[0]['value']]?.asset_MDM_code ?? ""}"),
                                                  ],
                                                ),
                                              if (mapData['key'] ==
                                                  "Material_Type")
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Material Type:",
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    Text(
                                                        "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}"),
                                                  ],
                                                ),
                                              if (mapData['key'] ==
                                                  "Issued_Qty")
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Issued Qty:",
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    Text(
                                                        "${(controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? 0)}"),
                                                  ],
                                                ),
                                              if (mapData['key'] == "Used_Qty")
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Consumed By All:",
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    Text(
                                                        "${(controller.dropdownMapperData[record[0]['value']]?.used_qty ?? 0)}"),
                                                  ],
                                                ),
                                              if (mapData['key'] ==
                                                  "Consumed_Qty")
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Consumed By This: ",
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              offset:
                                                                  const Offset(
                                                                5.0,
                                                                5.0,
                                                              ),
                                                              blurRadius: 5.0,
                                                              spreadRadius: 1.0,
                                                            ),
                                                          ],
                                                          color: ColorValues
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child:
                                                            LoginCustomTextfield(
                                                          width:
                                                              (Get.width * .4),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          maxLine: 1,
                                                          enabled: controller
                                                                          .listMrsByTaskId!
                                                                          .value
                                                                          .firstWhereOrNull(
                                                                            (element) =>
                                                                                element?.jobCardId != 0 ||
                                                                                element?.pmId != 0,
                                                                          )
                                                                          ?.mrs_return_ID ==
                                                                      0 &&
                                                                  controller
                                                                          .allTrue
                                                                          .value ==
                                                                      false
                                                              ? true
                                                              : false,
                                                          textController:
                                                              new TextEditingController(
                                                                  text: mapData[
                                                                          "value"] ??
                                                                      ''),
                                                          onChanged: (txt) {
                                                            int intialQty =
                                                                int.tryParse(mapData[
                                                                            'value'] ??
                                                                        "") ??
                                                                    0;

                                                            num issuedQty = controller
                                                                    .dropdownMapperData[
                                                                        record[0]
                                                                            [
                                                                            'value']]
                                                                    ?.issued_qty ??
                                                                0;
                                                            num usedQty = controller
                                                                    .dropdownMapperData[
                                                                        record[0]
                                                                            [
                                                                            'value']]
                                                                    ?.used_qty ??
                                                                0;
                                                            num intiAllowedQty =
                                                                usedQty -
                                                                    intialQty;

                                                            num maxAllowedQty =
                                                                issuedQty -
                                                                    intiAllowedQty;
                                                            if (txt
                                                                .isNotEmpty) {
                                                              num enteredValue =
                                                                  num.tryParse(
                                                                          txt) ??
                                                                      0;
                                                              if (enteredValue >
                                                                  maxAllowedQty) {
                                                                // If the entered quantity exceeds the allowed maximum, truncate it
                                                                setState(() {
                                                                  txt = intialQty
                                                                      .toString();
                                                                  mapData['value'] =
                                                                      intialQty
                                                                          .toString();
                                                                });
                                                                // Optionally, you can show an error message or handle the situation
                                                                Fluttertoast
                                                                    .showToast(
                                                                        msg:
                                                                            "Enter appropriate consumed quantity.");
                                                              }
                                                            } else if (txt
                                                                .isEmpty) {
                                                              txt = intialQty
                                                                  .toString();
                                                            }
                                                            mapData["value"] =
                                                                txt;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),

                        // Container(
                        //   margin: Dimens.edgeInsets20,
                        //   height: 100,
                        //   width: MediaQuery.of(context).size.width / 1.2,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: ColorValues.lightGreyColorWithOpacity35,
                        //       width: 1,
                        //     ),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: ColorValues.appBlueBackgroundColor,
                        //         spreadRadius: 2,
                        //         blurRadius: 5,
                        //         offset: Offset(0, 2),
                        //       ),
                        //     ],
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.all(10.0),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               "Material Used For ",
                        //               style: Styles.blue700,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Obx(() {
                        //           return DataTable2(
                        //             minWidth: 1600,
                        //             dataRowHeight: 70,
                        //             columnSpacing: 10,
                        //             border: TableBorder.all(
                        //               color: Color.fromARGB(255, 206, 229, 234),
                        //             ),
                        //             columns: [
                        //               DataColumn2(
                        //                 fixedWidth: 350,
                        //                 label: Text(
                        //                   "Material Name",
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               ),
                        //               DataColumn2(
                        //                 fixedWidth: 150,
                        //                 label: Text(
                        //                   "Sr No.",
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               ),
                        //               DataColumn2(
                        //                 fixedWidth: 150,
                        //                 label: Text(
                        //                   "MDM Code",
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               ),
                        //               DataColumn2(
                        //                 fixedWidth: 250,
                        //                 label: Text(
                        //                   "Material Type",
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               ),
                        //               DataColumn2(
                        //                 fixedWidth: 150,
                        //                 label: Text(
                        //                   "Issued Qty",
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               ),
                        //               DataColumn2(
                        //                 fixedWidth: 150,
                        //                 label: Text(
                        //                   "Consumed By All",
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               ),
                        //               DataColumn2(
                        //                 fixedWidth: 200,
                        //                 label: Text(
                        //                   "Consumed By This",
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               ),
                        //             ],
                        //             rows:
                        //                 controller.rowItem.value.map((record) {
                        //               return DataRow(
                        //                 cells: record.map((mapData) {
                        //                   return DataCell(
                        //                     (mapData['key'] == "Drop_down")
                        //                         ? DropdownWebStock(
                        //                             width:
                        //                                 MediaQuery.of(context)
                        //                                     .size
                        //                                     .width,
                        //                             dropdownList: controller
                        //                                 .cmmrsItems!
                        //                                 .where((p0) {
                        //                                   return !controller
                        //                                       .rowItem
                        //                                       .map((p0) => p0[0]
                        //                                           ["value"])
                        //                                       .contains(
                        //                                           p0!.name);
                        //                                 })
                        //                                 .toList()
                        //                                 .obs,
                        //                             selectedValue:
                        //                                 mapData["value"],
                        //                             onValueChanged:
                        //                                 (list, selectedValue) {
                        //                               mapData["value"] =
                        //                                   selectedValue;
                        //                               controller.dropdownMapperData[
                        //                                       selectedValue] =
                        //                                   list.firstWhere(
                        //                                 (element) =>
                        //                                     element.name ==
                        //                                     selectedValue,
                        //                                 orElse: null,
                        //                               );
                        //                               Future.delayed(
                        //                                   Duration.zero, () {
                        //                                 setState(() {});
                        //                               });
                        //                             },
                        //                           )
                        //                         : (mapData['key'] == "Sr_No")
                        //                             ? Text(
                        //                                 "${controller.dropdownMapperData[record[0]['value']]?.serial_number ?? ""}")
                        //                             : (mapData['key'] == "code")
                        //                                 ? Text(
                        //                                     "${controller.dropdownMapperData[record[0]['value']]?.asset_MDM_code ?? ""}")
                        //                                 : (mapData['key'] ==
                        //                                         "Material_Type")
                        //                                     ? Text(
                        //                                         "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}")
                        //                                     : (mapData['key'] ==
                        //                                             "Issued_Qty")
                        //                                         ? Text(
                        //                                             "${(controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? 0)}")
                        //                                         : (mapData['key'] ==
                        //                                                 "Used_Qty")
                        //                                             ? Text(
                        //                                                 "${(controller.dropdownMapperData[record[0]['value']]?.used_qty ?? 0)}")
                        //                                             : (mapData['key'] ==
                        //                                                     "Consumed_Qty")
                        //                                                 ? Padding(
                        //                                                     padding:
                        //                                                         const EdgeInsets.only(top: 10),
                        //                                                     child:
                        //                                                         Container(
                        //                                                       decoration: BoxDecoration(
                        //                                                         boxShadow: [
                        //                                                           BoxShadow(
                        //                                                             color: Colors.black26,
                        //                                                             offset: const Offset(5.0, 5.0),
                        //                                                             blurRadius: 5.0,
                        //                                                             spreadRadius: 1.0,
                        //                                                           ),
                        //                                                         ],
                        //                                                         color: ColorValues.whiteColor,
                        //                                                         borderRadius: BorderRadius.circular(5),
                        //                                                       ),
                        //                                                       child: LoginCustomTextfield(
                        //                                                         width: (Get.width * .4),
                        //                                                         keyboardType: TextInputType.number,
                        //                                                         inputFormatters: <TextInputFormatter>[
                        //                                                           FilteringTextInputFormatter.digitsOnly
                        //                                                         ],
                        //                                                         maxLine: 1,
                        //                                                         enabled: controller.listMrsByTaskId!.value.firstWhereOrNull((element) => element?.jobCardId != 0 || element?.pmId != 0)?.mrs_return_ID == 0 && controller.allTrue.value == false ? true : false,
                        //                                                         textController: new TextEditingController(text: mapData["value"] ?? ''),
                        //                                                         onChanged: (txt) {
                        //                                                           int intialQty = int.tryParse(mapData['value'] ?? "") ?? 0;

                        //                                                           num issuedQty = controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? 0;
                        //                                                           num usedQty = controller.dropdownMapperData[record[0]['value']]?.used_qty ?? 0;
                        //                                                           num intiAllowedQty = usedQty - intialQty;

                        //                                                           num maxAllowedQty = issuedQty - intiAllowedQty;
                        //                                                           if (txt.isNotEmpty) {
                        //                                                             num enteredValue = num.tryParse(txt) ?? 0;
                        //                                                             if (enteredValue > maxAllowedQty) {
                        //                                                               setState(() {
                        //                                                                 txt = intialQty.toString();
                        //                                                                 mapData['value'] = intialQty.toString();
                        //                                                               });
                        //                                                               Fluttertoast.showToast(msg: "Enter appropriate consumed quantity.");
                        //                                                             }
                        //                                                           } else if (txt.isEmpty) {
                        //                                                             txt = intialQty.toString();
                        //                                                           }
                        //                                                           mapData["value"] = txt;
                        //                                                         },
                        //                                                       ),
                        //                                                     ),
                        //                                                   )
                        //                                                 : Text(mapData['value'] ??
                        //                                                     ''),
                        //                   );
                        //                 }).toList(),
                        //               );
                        //             }).toList(),
                        //           );
                        //         }),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                Container(
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
                                  controller.transferItem();
                                  controller.updatePmExecution();
                                },
                              ),
                            )
                          : Dimens.box0,
                    ],
                  ),
                ),

                //  Spacer(),
                // Spacer(),
              ],
              // ),
            );
          },
        );
      },
    );
  }

  updateJob(List<Map<String, String>> record) {
    var max = int.tryParse(record[6]["max"] ?? '0') ?? 0;
    var min = int.tryParse(record[6]["min"] ?? '0') ?? 0;
    var inputNumber = int.tryParse(record[6]["value"] ?? "0") ?? 0;
    if (((record[3]['value'] == "1") &&
        !(min <= inputNumber && inputNumber <= max))) {
      Fluttertoast.showToast(msg: 'Not within range', timeInSecForIosWeb: 5);
    } else if (!(min <= inputNumber && inputNumber <= max)) {
      record[7]['value'] = "1";
    } else if (((record[3]['value'] == "0") ||
        (min <= inputNumber && inputNumber <= max))) {
      record[7]['value'] = "0";
    } else if (record[3]['value'] == "0") {
      //hidelse
    }
  }
}
