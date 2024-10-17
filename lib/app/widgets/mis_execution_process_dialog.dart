import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../utils/user_access_constants.dart';
import 'custom_swich_toggle.dart';

class MisExecutionProcessDialog extends GetView {
  MisExecutionProcessDialog();

  final ViewAuditTaskController controller = Get.find();

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
            "Observation of  ${controller.auditTasknDetailModel.value.plan_title ?? ""}",
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
                              height: ((controller
                                              .auditTasknDetailModel
                                              .value
                                              .schedules![0]
                                              .checklist_observation
                                              ?.length ??
                                          0) *
                                      80) +
                                  250,
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
                                          "  ${controller.auditTasknDetailModel.value.schedules![0].checklist_name ?? ""}",
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
                                                "Input Type",
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
                                            cells: record.map((mapData) {
                                              return DataCell(
                                                (mapData['key'] ==
                                                        "observation")
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            LoginCustomTextfield(
                                                          width:
                                                              (Get.width * .4),
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
                                                        ? Text(
                                                            mapData['value'] ??
                                                                '')
                                                        : (mapData['key'] ==
                                                                "requirement")
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
                                                                            final result =
                                                                                await FilePicker.platform.pickFiles(
                                                                              type: FileType.image,
                                                                            );
                                                                            if (result != null &&
                                                                                result.files.single.bytes != null) {
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            color:
                                                                                ColorValues.appDarkBlueColor,
                                                                            border:
                                                                                Border.all(
                                                                              color: ColorValues.appDarkBlueColor,
                                                                              width: 1,
                                                                            ),
                                                                          ),
                                                                          child: Icon(
                                                                              Icons.upload,
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
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "accept")
                                                                    ? Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center, // Center the radio buttons
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          RadioListTile<
                                                                              int>(
                                                                            title:
                                                                                Text('YES'),
                                                                            value:
                                                                                1,
                                                                            groupValue:
                                                                                int.tryParse('${mapData['value']}'),
                                                                            visualDensity:
                                                                                const VisualDensity(
                                                                              horizontal: VisualDensity.minimumDensity,
                                                                              vertical: VisualDensity.minimumDensity,
                                                                            ),
                                                                            onChanged:
                                                                                (int? value) {
                                                                              setState(() {
                                                                                mapData['value'] = value.toString();
                                                                              });
                                                                            },
                                                                            dense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                          RadioListTile<
                                                                              int>(
                                                                            title:
                                                                                Text('NO'),
                                                                            value:
                                                                                2,
                                                                            groupValue:
                                                                                int.tryParse('${mapData['value']}'),
                                                                            visualDensity:
                                                                                VisualDensity.compact,
                                                                            onChanged:
                                                                                (int? value) {
                                                                              setState(() {
                                                                                mapData['value'] = value.toString();
                                                                              });
                                                                            },
                                                                            dense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                          RadioListTile<
                                                                              int>(
                                                                            title:
                                                                                Text('NA'),
                                                                            value:
                                                                                3,
                                                                            groupValue:
                                                                                int.tryParse('${mapData['value']}'),
                                                                            visualDensity:
                                                                                VisualDensity.compact,
                                                                            onChanged:
                                                                                (int? value) {
                                                                              setState(() {
                                                                                mapData['value'] = value.toString();
                                                                              });
                                                                            },
                                                                            dense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : (mapData['key'] ==
                                                                                "type" &&
                                                                            mapData['inpute_type'] ==
                                                                                "0")
                                                                        ? Text(
                                                                            'Text')
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
                                                                            : Text(mapData['value'] ?? ''),
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
                                    controller.updateAuditTaskExecution();
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
            //      Column(
            //       children: [
            //         Container(
            //           height: MediaQuery.of(context).size.height / 1.4,
            //           child: ScrollConfiguration(
            //             behavior: ScrollConfiguration.of(context)
            //                 .copyWith(scrollbars: false),
            //             child: SingleChildScrollView(
            //               child: Column(
            //                 children: [
            //                   ////Assets
            //                   Container(
            //                     margin: Dimens.edgeInsets20,
            //                     height:
            //                         // ((controller.selectedItem
            //                         //                 ?.checklist_observation?.length ??
            //                         //             0) *
            //                         //         80) +
            //                         400,
            //                     width: MediaQuery.of(context).size.width / 1.2,
            //                     decoration: BoxDecoration(
            //                       border: Border.all(
            //                         color: ColorValues.lightGreyColorWithOpacity35,
            //                         width: 1,
            //                       ),
            //                       boxShadow: [
            //                         BoxShadow(
            //                           color: ColorValues.appBlueBackgroundColor,
            //                           spreadRadius: 2,
            //                           blurRadius: 5,
            //                           offset: Offset(0, 2),
            //                         ),
            //                       ],
            //                     ),
            //                     child: Column(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.all(10.0),
            //                           child: Row(
            //                             children: [
            //                               Text(
            //                                 "checkloist001", //   "  ${controller.selectedItem?.checklist_name ?? ""}",
            //                                 style: Styles.blue700,
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Expanded(
            //                           child: DataTable2(
            //                             dataRowHeight: 150,
            //                             minWidth: 2500,
            //                             border: TableBorder.all(
            //                                 color:
            //                                     Color.fromARGB(255, 206, 229, 234)),
            //                             columns: [
            //                               DataColumn2(
            //                                   fixedWidth: 100,
            //                                   label: Text(
            //                                     "Sr.No.",
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         fontWeight: FontWeight.bold),
            //                                   )),
            //                               DataColumn2(
            //                                   fixedWidth: 300,
            //                                   label: Text(
            //                                     "Check Point",
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         fontWeight: FontWeight.bold),
            //                                   )),
            //                               DataColumn2(
            //                                   fixedWidth: 400,
            //                                   label: Text(
            //                                     "Requirement",
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         fontWeight: FontWeight.bold),
            //                                   )),
            //                               DataColumn2(
            //                                   fixedWidth: 200,
            //                                   label: Text(
            //                                     "Upload Image",
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         fontWeight: FontWeight.bold),
            //                                   )),
            //                               DataColumn2(
            //                                   fixedWidth: 200,
            //                                   label: Text(
            //                                     "Accept/Reject",
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         fontWeight: FontWeight.bold),
            //                                   )),
            //                               DataColumn2(
            //                                   fixedWidth: 300,
            //                                   label: Text(
            //                                     "Observation",
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         fontWeight: FontWeight.bold),
            //                                   )),
            //                             ],
            //                             rows: [
            //                               [
            //                                 "1",
            //                                 "checkpoint1",
            //                                 "requirment",
            //                                 "Upload_image",
            //                                 "acept",
            //                                 "Observation",
            //                               ],
            //                               [
            //                                 "2",
            //                                 "checkpoint2",
            //                                 "requirment",
            //                                 "Upload_image",
            //                                 "acept",
            //                                 "Observation",
            //                               ],
            //                             ].map((record) {
            //                               return DataRow(
            //                                 // height: 40,
            //                                 cells: record.map((value) {
            //                                   return DataCell(
            //                                     //  child:
            //                                     value == "Observation"
            //                                         ? Padding(
            //                                             padding:
            //                                                 const EdgeInsets.all(
            //                                                     8.0),
            //                                             child: LoginCustomTextfield(
            //                                               width: (Get.width * .4),
            //                                               // textController:
            //                                               // controller
            //                                               //         .selectedItem
            //                                               //         ?.checklist_observation?[index]
            //                                               //         .observation_value_controller
            //                                               //     as TextEditingController,
            //                                               maxLine: 5,
            //                                             ),
            //                                           )
            //                                         : (value == "Upload_image")
            //                                             ? Row(
            //                                                 mainAxisAlignment:
            //                                                     MainAxisAlignment
            //                                                         .center,
            //                                                 children: [
            //                                                   InkWell(
            //                                                     onTap: () async {
            //                                                       try {} catch (e) {
            //                                                         // Handle the error scenario
            //                                                         print(
            //                                                             'Error picking file: $e');
            //                                                       }
            //                                                     },
            //                                                     child: Container(
            //                                                       decoration:
            //                                                           BoxDecoration(
            //                                                         borderRadius:
            //                                                             BorderRadius
            //                                                                 .circular(
            //                                                                     5),
            //                                                         color: ColorValues
            //                                                             .appDarkBlueColor,
            //                                                         border:
            //                                                             Border.all(
            //                                                           color: ColorValues
            //                                                               .appDarkBlueColor,
            //                                                           width: 1,
            //                                                         ),
            //                                                       ),
            //                                                       child: Icon(
            //                                                           Icons.upload,
            //                                                           size: 30,
            //                                                           color: ColorValues
            //                                                               .whiteColor),
            //                                                     ),
            //                                                   ),
            //                                                   SizedBox(
            //                                                       width:
            //                                                           10), // Add some spacing between the icon and text
            //                                                   Expanded(
            //                                                     // Wrap with Expanded to handle long filenames gracefully
            //                                                     child:
            //                                                         SingleChildScrollView(
            //                                                       scrollDirection:
            //                                                           Axis.horizontal,
            //                                                       child: Text(
            //                                                         "Imge1233", // "${mapData['uploaded'] ?? 'No file selected'}",
            //                                                         overflow:
            //                                                             TextOverflow
            //                                                                 .ellipsis,
            //                                                       ),
            //                                                     ),
            //                                                   ),
            //                                                 ],
            //                                               )
            //                                             : (value == "acept")
            //                                                 ? Row(
            //                                                     mainAxisAlignment:
            //                                                         MainAxisAlignment
            //                                                             .center,
            //                                                     children: [
            //                                                       InkWell(
            //                                                         onTap:
            //                                                             () async {
            //                                                           try {} catch (e) {
            //                                                             // Handle the error scenario
            //                                                             print(
            //                                                                 'Error picking file: $e');
            //                                                           }
            //                                                         },
            //                                                         child:
            //                                                             Container(
            //                                                           decoration:
            //                                                               BoxDecoration(
            //                                                             borderRadius:
            //                                                                 BorderRadius
            //                                                                     .circular(5),
            //                                                             color: ColorValues
            //                                                                 .appDarkBlueColor,
            //                                                             border:
            //                                                                 Border
            //                                                                     .all(
            //                                                               color: ColorValues
            //                                                                   .appDarkBlueColor,
            //                                                               width: 1,
            //                                                             ),
            //                                                           ),
            //                                                           child: Icon(
            //                                                               Icons
            //                                                                   .upload,
            //                                                               size: 30,
            //                                                               color: ColorValues
            //                                                                   .whiteColor),
            //                                                         ),
            //                                                       ),
            //                                                       SizedBox(
            //                                                           width:
            //                                                               10), // Add some spacing between the icon and text
            //                                                       Expanded(
            //                                                         // Wrap with Expanded to handle long filenames gracefully
            //                                                         child:
            //                                                             SingleChildScrollView(
            //                                                           scrollDirection:
            //                                                               Axis.horizontal,
            //                                                           child: Text(
            //                                                             "Imge1233", // "${mapData['uploaded'] ?? 'No file selected'}",
            //                                                             overflow:
            //                                                                 TextOverflow
            //                                                                     .ellipsis,
            //                                                           ),
            //                                                         ),
            //                                                       ),
            //                                                     ],
            //                                                   )
            //                                                 : Text(value),
            //                                   );
            //                                 }).toList(),
            //                               );
            //                             }).toList(),
            //                             //  List<DataRow>.generate(
            //                             //   controller.selectedItem
            //                             //           ?.checklist_observation?.length ??
            //                             //       0,
            //                             //   (index) =>
            //                             //   DataRow(cells: [
            //                             //     DataCell(Text(
            //                             //       "jksdfjsdj",
            //                             //     )),
            //                             //     DataCell(Text(
            //                             //       "jksdfjsdj",
            //                             //     )),
            //                             //     DataCell(Text(
            //                             //       "jksdfjsdj",
            //                             //     )),
            //                             //     DataCell(Text(
            //                             //       "jksdfjsdj",
            //                             //     )),
            //                             //     DataCell(Text('???')),
            //                             //     DataCell(Padding(
            //                             //       padding: const EdgeInsets.all(8.0),
            //                             //       child: LoginCustomTextfield(
            //                             //         width: (Get.width * .4),
            //                             //         // textController:
            //                             //         // controller
            //                             //         //         .selectedItem
            //                             //         //         ?.checklist_observation?[index]
            //                             //         //         .observation_value_controller
            //                             //         //     as TextEditingController,
            //                             //         maxLine: 5,
            //                             //       ),
            //                             //     )),
            //                             //   ]),
            //                             // ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Spacer(),
            //         Container(
            //           //   margin: EdgeInsets.only(bottom: 30, top: 20),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               // varUserAccessModel.value.access_list!
            //               //             .where((e) =>
            //               //                 e.feature_id ==
            //               //                     UserAccessConstants
            //               //                         .kPmExecutionFeatureId &&
            //               //                 e.edit ==
            //               //                     UserAccessConstants.kHaveEditAccess)
            //               //             .length >
            //               //         0
            //               //     ?
            //               Container(
            //                 height: 35,
            //                 child: CustomElevatedButton(
            //                   backgroundColor: ColorValues.appRedColor,
            //                   text: "Close",
            //                   onPressed: () {
            //                     Get.back();
            //                   },
            //                 ),
            //               ),
            //               //  : Dimens.box0,
            //               SizedBox(
            //                 width: 20,
            //               ),
            //               // varUserAccessModel.value.access_list!
            //               //             .where((e) =>
            //               //                 e.feature_id ==
            //               //                     UserAccessConstants
            //               //                         .kPmExecutionFeatureId &&
            //               //                 e.edit ==
            //               //                     UserAccessConstants.kHaveEditAccess)
            //               //             .length >
            //               //         0
            //               //     ?
            //               Container(
            //                 height: 35,
            //                 child: CustomElevatedButton(
            //                   backgroundColor: ColorValues.appDarkBlueColor,
            //                   text: "Update",
            //                   onPressed: () {
            //                     Get.back();
            //                     // controller.transferItem();
            //                     // controller.updatePmExecution();
            //                   },
            //                 ),
            //               )
            //               // : Dimens.box0,
            //             ],
            //           ),
            //         ),
            //         Spacer(),

            //         // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //         //   SizedBox(
            //         //     width: 15,
            //         //   ),
            //         //   Container(
            //         //     height: 35,
            //         //     child: CustomElevatedButton(
            //         //       icon: Icons.print,
            //         //       backgroundColor: ColorValues.linktopermitColor,
            //         //       text: "Print",
            //         //       onPressed: () {
            //         //         //controller.printScreen();
            //         //       },
            //         //     ),
            //         //   ),
            //         //   SizedBox(
            //         //     width: 20,
            //         //   ),
            //         //   Container(
            //         //     height: 35,
            //         //     child: CustomElevatedButton(
            //         //       // icon: Icons.link,
            //         //       backgroundColor: ColorValues.appRedColor,
            //         //       text: "Close",
            //         //       onPressed: () {
            //         //         Get.back();
            //         //       },
            //         //     ),
            //         //   )
            //         // ]),
            //         // Spacer(),
            //       ],
            //     ),
            // //
          );
        }),
      );
    }));
  }
}
