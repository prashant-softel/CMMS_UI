import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class ObservationPmExecutionViewDialog extends GetView {
  ObservationPmExecutionViewDialog();

  final PreventiveMaintenanceExecutionController controller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
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

    //  return StatefulBuilder(builder: ((context, setState) {
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
      content: StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
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
                                  child: Obx(
                                    () => DataTable2(
                                      dataRowHeight: 100,
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
                                            fixedWidth: 145,
                                            label: Text(
                                              "Weightage",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 120,
                                            label: Text(
                                              "CP OK ?",
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
                                            fixedWidth: 180,
                                            label: Text(
                                              "Upload Images",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        DataColumn2(
                                            fixedWidth: 193,
                                            label: Text(
                                              "Input Type",
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
                                      rows: controller.rowItemobs.value
                                          .map((record) {
                                        return DataRow(
                                          // height: 130,
                                          cells: record.map((mapData) {
                                            return DataCell(
                                              (mapData['key'] == "observation")
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child:
                                                          LoginCustomTextfield(
                                                        width: (Get.width * .4),
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
                                                    )
                                                  : (mapData['key'] ==
                                                          "checkpoint")
                                                      ? Text(mapData['value'] ??
                                                          '')
                                                      : (mapData['key'] ==
                                                              "requirement")
                                                          ? Text(mapData[
                                                                  'value'] ??
                                                              '')
                                                          : (mapData['key'] ==
                                                                  "weightage")
                                                              ? Text(mapData[
                                                                      'value'] ??
                                                                  '')
                                                              : (mapData['key'] ==
                                                                      "uploadimg")
                                                                  ? Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
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
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: ColorValues.appDarkBlueColor,
                                                                              border: Border.all(
                                                                                color: ColorValues.appDarkBlueColor,
                                                                                width: 1,
                                                                              ),
                                                                            ),
                                                                            child: Icon(Icons.upload,
                                                                                size: 30,
                                                                                color: ColorValues.whiteColor),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                10), // Add some spacing between the icon and text
                                                                        Expanded(
                                                                          // Wrap with Expanded to handle long filenames gracefully
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Text(
                                                                              "${mapData['uploaded'] ?? 'No file selected'}",
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  : (mapData['key'] ==
                                                                          "cpok")
                                                                      ? _rowcpOkItem(
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
                                                                              Duration.zero,
                                                                              () {
                                                                            setState(() {});
                                                                          });
                                                                        })
                                                                      : (mapData['key'] == "type" &&
                                                                              mapData['inpute_type'] == "2")
                                                                          ? Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                children: [
                                                                                  LoginCustomTextfield(
                                                                                      width: (Get.width * .8),
                                                                                      textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                      onChanged: (txt) {
                                                                                        mapData["value"] = txt;
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
                                                                          : (mapData['key'] == "type" && mapData['inpute_type'] == "0")
                                                                              ? Text('Text')
                                                                              : (mapData['key'] == "job_created" && mapData['cp_ok_value'] == "0" && mapData['job_value'] == "0" || mapData['key'] == "job_created" && mapData['cp_ok_value'] == "0" && mapData['job_value'] == "1")
                                                                                  ?
                                                                                  // Obx(() {
                                                                                  //     return
                                                                                  _rowItem(int.tryParse('${mapData['job_value']}'), onCheck: (val) {
                                                                                      mapData['job_value'] = val == true ? "1" : "0";
                                                                                      Future.delayed(Duration.zero, () {
                                                                                        setState(() {});
                                                                                      });

                                                                                      // Update the reactive variable
                                                                                      //  });
                                                                                    })
                                                                                  : mapData['job_value'] != "1" && mapData['cp_ok_value'] != "1"
                                                                                      ? Text('JOB${mapData['job_value']}')
                                                                                      : Dimens.box0,
                                              // : Text(mapData['value'] ?? ''),
                                            );
                                          }).toList(),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ////Associated Job cards
                          controller.cmmrsItems!.isEmpty
                              ? Dimens.box0
                              : Container(
                                  margin: Dimens.edgeInsets20,
                                  height: 300,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Material Used For ",
                                              style: Styles.blue700,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.addRowItem();
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorValues.addNewColor,
                                                  border: Border.all(
                                                    color: ColorValues
                                                        .lightGreyColorWithOpacity35,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    " + Add ",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Obx(() {
                                          return DataTable2(
                                            // minWidth: 2000,
                                            dataRowHeight: 70,
                                            columnSpacing: 10,
                                            border: TableBorder.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234)),
                                            columns: [
                                              DataColumn2(
                                                  //  fixedWidth: 500,
                                                  label: Text(
                                                "Material Name",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    "Sr No.",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              DataColumn2(
                                                  fixedWidth: 150,
                                                  label: Text(
                                                    "MDM Code",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              DataColumn2(
                                                  // fixedWidth: 350,
                                                  label: Text(
                                                "Material Type",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 350,
                                                  label: Text(
                                                "Issued Qty",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 350,
                                                  label: Text(
                                                "Used Qty",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  //  fixedWidth: 350,
                                                  label: Text(
                                                "Consumed  Qty",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    "Action",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ],
                                            rows: controller.rowItem.value
                                                .map((record) {
                                              return DataRow(
                                                // height: 130,
                                                cells: record.map((mapData) {
                                                  return DataCell(
                                                    (mapData['key'] ==
                                                            "Drop_down")
                                                        ? DropdownWebStock(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            dropdownList:
                                                                controller
                                                                    .cmmrsItems,
                                                            selectedValue:
                                                                mapData[
                                                                    "value"],
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
                                                                      orElse:
                                                                          null);
                                                              Future.delayed(
                                                                  Duration.zero,
                                                                  () {
                                                                setState(() {});
                                                              });
                                                            },
                                                          )
                                                        : (mapData['key'] ==
                                                                "Sr_No")
                                                            ? Text(
                                                                "${controller.dropdownMapperData[record[0]['value']]?.serial_number ?? ""}")
                                                            : (mapData['key'] ==
                                                                    "code")
                                                                ? Text(
                                                                    "${controller.dropdownMapperData[record[0]['value']]?.asset_MDM_code ?? ""}")
                                                                : (mapData['key'] ==
                                                                        "Material_Type")
                                                                    ? Text(
                                                                        "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}")
                                                                    : (mapData['key'] ==
                                                                            "Action ")
                                                                        ? Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 10),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                TableActionButton(
                                                                                  color: ColorValues.appRedColor,
                                                                                  icon: Icons.delete,
                                                                                  label: '',
                                                                                  message: '',
                                                                                  onPress: () {
                                                                                    controller.rowItem.remove(record);
                                                                                  },
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "Issued_Qty")
                                                                            ? Text("${(controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? 0)}")
                                                                            : (mapData['key'] == "Used_Qty")
                                                                                ? Text("${(controller.dropdownMapperData[record[0]['value']]?.used_qty ?? 0)}")
                                                                                : (mapData['key'] == "Consumed_Qty")
                                                                                    ? Padding(
                                                                                        padding: const EdgeInsets.only(top: 10),
                                                                                        child: Container(
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
                                                                                              ),
                                                                                            ],
                                                                                            color: ColorValues.whiteColor,
                                                                                            borderRadius: BorderRadius.circular(5),
                                                                                          ),
                                                                                          child: LoginCustomTextfield(
                                                                                            width: (Get.width * .4),
                                                                                            keyboardType: TextInputType.number,
                                                                                            inputFormatters: <TextInputFormatter>[
                                                                                              FilteringTextInputFormatter.digitsOnly
                                                                                            ],
                                                                                            maxLine: 1,
                                                                                            textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                            onChanged: (txt) {
                                                                                              // Ensure the entered value is less than or equal to the issued qty
                                                                                              num issuedQty = controller.dropdownMapperData[record[0]['value']]?.issued_qty ?? 0;
                                                                                              num usedQty = controller.dropdownMapperData[record[0]['value']]?.used_qty ?? 0;
                                                                                              int consumedQty = int.tryParse(txt) ?? 0;

                                                                                              if (consumedQty <= issuedQty && (usedQty == 0 || consumedQty <= usedQty)) {
                                                                                                mapData["value"] = txt;
                                                                                              } else {
                                                                                                // If the entered quantity exceeds the issued quantity, show an error message or handle it accordingly
                                                                                                Fluttertoast.showToast(msg: "Enter appropriate consumed quantity.");
                                                                                                // Reset the consumed quantity to the previous valid value
                                                                                                setState(() {
                                                                                                  mapData["value"] = mapData["value"]!;
                                                                                                });
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : Text(mapData['value'] ?? ''),
                                                  );
                                                }).toList(),
                                              );
                                            }).toList(),
                                          );
                                        }),
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
    // );
    // }
    // ));
  }
}
