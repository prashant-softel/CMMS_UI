import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DetailsOfInjuredPersonMobile extends StatefulWidget {
  DetailsOfInjuredPersonMobile({
    super.key,
  });

  @override
  State<DetailsOfInjuredPersonMobile> createState() =>
      _DetailsOfInjuredPersonMobileState();
}

class _DetailsOfInjuredPersonMobileState
    extends State<DetailsOfInjuredPersonMobile> {
  final AddIncidentReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Text(
                "Details of Injured Person",
                style: Styles.blue700,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  controller.addDetailsOfInjuredPersonRowItem();
                },
                child: Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: ColorValues.addNewColor,
                    border: Border.all(
                      color: ColorValues.lightGreyColorWithOpacity35,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      " + Add ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Dimens.boxHeight5,
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.rowInjuredPersonItem.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color.fromARGB(255, 232, 239, 242),
                elevation: 10,
                shadowColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.rowInjuredPersonItem[index]
                        .map<Widget>((mapData) {
                      return Column(
                        children: [
                          (mapData['key'] == "Name of Injured Person ")
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name of Injured Person: ",
                                      ),
                                      Container(
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          children: [
                                            IgnorePointer(
                                              ignoring: controller
                                                          .incidentReportDetailsModel
                                                          .value
                                                          ?.status ==
                                                      183
                                                  ? true
                                                  : false,
                                              child: DropdownWebStock(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                dropdownList:
                                                    controller.victimNameList,
                                                selectedValue: mapData["value"],
                                                onValueChanged:
                                                    (list, selectedValue) {
                                                  setState(() {
                                                    print({
                                                      selectedValue:
                                                          selectedValue
                                                    });
                                                    if (selectedValue != null) {
                                                      controller
                                                          .updateSelectedOption(
                                                              selectedValue);
                                                    }
                                                    mapData["value"] =
                                                        selectedValue;
                                                    controller.dropdownVictimNameMapperData[
                                                            selectedValue] =
                                                        list.firstWhere(
                                                            (element) =>
                                                                element.name ==
                                                                selectedValue,
                                                            orElse: null);

                                                    final injuredPersonData =
                                                        controller
                                                                .dropdownVictimNameMapperData[
                                                            selectedValue];
                                                    if (injuredPersonData !=
                                                        null) {
                                                      final genderValue =
                                                          injuredPersonData
                                                              .gender;
                                                      final designationValue =
                                                          injuredPersonData
                                                              .designation;
                                                      final city =
                                                          injuredPersonData
                                                              .city;
                                                      final String experince =
                                                          injuredPersonData
                                                              .experince
                                                              .toString();
                                                      // Find the corresponding row in the rowInjuredPersonItem list
                                                      final row = controller
                                                          .rowInjuredPersonItem
                                                          .firstWhere((row) =>
                                                              row[0]['value'] ==
                                                              selectedValue);
                                                      row[1]['value'] =
                                                          genderValue;
                                                      row[2]['value'] =
                                                          designationValue;
                                                      row[3]['value'] = city;
                                                      row[6]['value'] =
                                                          experince;
                                                      controller.update();
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Gender")
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Gender: ",
                                              ),
                                              Text(
                                                "${mapData["value"] != "" ? mapData["value"] : "Select Employee"}",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "Action ")
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TableActionButton(
                                                color: ColorValues.appRedColor,
                                                icon: Icons.delete,
                                                label: '',
                                                message: '',
                                                onPress: () {
                                                  controller
                                                      .rowInjuredPersonItem
                                                      .remove(controller
                                                          .rowInjuredPersonItem
                                                          .value[index]);
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      : (mapData['key'] == "Trade/Designation ")
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "Trade/Designation: ",
                                                      ),
                                                      Text(
                                                        "${mapData["value"] != "" ? mapData["value"] : "Select Employee"}",
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : (mapData['key'] == "Address ")
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Gender: ",
                                                      ),
                                                      Text(
                                                        "${mapData["value"] != "" ? mapData["value"] : "Select Employee"}",
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : (mapData['key'] ==
                                                      "Name of Contractor ")
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
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
                                                                  blurRadius:
                                                                      5.0,
                                                                  spreadRadius:
                                                                      1.0,
                                                                ),
                                                              ],
                                                              color: ColorValues
                                                                  .whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "Gender: ",
                                                                ),
                                                                IgnorePointer(
                                                                  ignoring: controller
                                                                              .incidentReportDetailsModel
                                                                              .value
                                                                              ?.status ==
                                                                          183
                                                                      ? true
                                                                      : false,
                                                                  child:
                                                                      DropdownWebStock(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        4,
                                                                    dropdownList:
                                                                        controller
                                                                            .businessList,
                                                                    selectedValue:
                                                                        mapData[
                                                                            "value"],
                                                                    onValueChanged:
                                                                        (list,
                                                                            selectedValue) {
                                                                      print({
                                                                        selectedValue:
                                                                            selectedValue
                                                                      });
                                                                      mapData["value"] =
                                                                          selectedValue;
                                                                      controller.dropdownBusinessListMapperData[selectedValue] = list.firstWhere(
                                                                          (element) =>
                                                                              element.name ==
                                                                              selectedValue,
                                                                          orElse:
                                                                              null);
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : (mapData['key'] ==
                                                          "Body part injured ")
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Gender: ",
                                                              ),
                                                              Container(
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
                                                                      blurRadius:
                                                                          5.0,
                                                                      spreadRadius:
                                                                          1.0,
                                                                    ),
                                                                  ],
                                                                  color: ColorValues
                                                                      .whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    IgnorePointer(
                                                                  ignoring: controller
                                                                              .incidentReportDetailsModel
                                                                              .value
                                                                              ?.status ==
                                                                          183
                                                                      ? true
                                                                      : false,
                                                                  child:
                                                                      DropdownWebStock(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        4,
                                                                    dropdownList:
                                                                        controller
                                                                            .bodyinjuredList,
                                                                    selectedValue:
                                                                        mapData[
                                                                            "value"],
                                                                    onValueChanged:
                                                                        (list,
                                                                            selectedValue) {
                                                                      print({
                                                                        selectedValue:
                                                                            selectedValue
                                                                      });
                                                                      mapData["value"] =
                                                                          selectedValue;
                                                                      controller.dropdownBodyinjuredListMapperData[selectedValue] = list.firstWhere(
                                                                          (element) =>
                                                                              element.name ==
                                                                              selectedValue,
                                                                          orElse:
                                                                              null);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : (mapData['key'] ==
                                                              "work experience ")
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 10,
                                                                      right: 10,
                                                                      top: 10),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Gender: ",
                                                                  ),
                                                                  Text(
                                                                    "${mapData["value"] != "" ? mapData["value"] : "Select Employee"}",
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : (mapData['key'] ==
                                                                  "Plant & Equipment ")
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Gender: ",
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
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
                                                                          color:
                                                                              ColorValues.whiteColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            IgnorePointer(
                                                                          ignoring: controller.incidentReportDetailsModel.value?.status == 183
                                                                              ? true
                                                                              : false,
                                                                          child:
                                                                              DropdownWebStock(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 4,
                                                                            dropdownList:
                                                                                controller.eqipmentNameList,
                                                                            selectedValue:
                                                                                mapData["value"],
                                                                            onValueChanged:
                                                                                (list, selectedValue) {
                                                                              print({
                                                                                selectedValue: selectedValue
                                                                              });
                                                                              mapData["value"] = selectedValue;
                                                                              controller.dropdownEquipmentNameMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : (mapData['key'] ==
                                                                      "Exact Location ")
                                                                  ? Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Gender: ",
                                                                          ),
                                                                          Container(
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
                                                                              child: IgnorePointer(
                                                                                ignoring: controller.incidentReportDetailsModel.value?.status == 183 ? true : false,
                                                                                child: LoginCustomTextfield(
                                                                                  keyboardType: TextInputType.text,
                                                                                  // inputFormatters: <
                                                                                  //     TextInputFormatter>[
                                                                                  //   FilteringTextInputFormatter
                                                                                  //       .digitsOnly
                                                                                  // ],
                                                                                  maxLine: 1,
                                                                                  textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                  onChanged: (txt) {
                                                                                    mapData["value"] = txt;
                                                                                  },
                                                                                ),
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Text(mapData[
                                                                          'key'] ??
                                                                      ''),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),

          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Details of Injured Person",
          //         style: Styles.blue700.copyWith(fontSize: 16),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           controller.addDetailsOfInjuredPersonRowItem();
          //         },
          //         child: Container(
          //           height: 25,
          //           width: 90,
          //           decoration: BoxDecoration(
          //             color: ColorValues.addNewColor,
          //             border: Border.all(
          //               color: ColorValues.lightGreyColorWithOpacity35,
          //               width: 1,
          //             ),
          //             borderRadius: BorderRadius.all(Radius.circular(5)),
          //           ),
          //           child: Center(
          //             child: Text(
          //               " + Add ",
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Obx(
          //   () => Expanded(
          //     child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: DataTable(
          //         columnSpacing: 10,
          //         border: TableBorder.all(
          //           color: Color.fromARGB(255, 206, 229, 234),
          //         ),
          //         columns: [
          //           DataColumn(
          //               label: Text("Name of Injured\nPerson",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Gender",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Trade/Designation",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Address",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Name of Contractor",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Body part injured",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Work experience",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Plant & Equipment",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Exact Location",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //           DataColumn(
          //               label: Text("Action",
          //                   style: TextStyle(
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.bold))),
          //         ],
          //         rows:
          //             controller.rowInjuredPersonItem.value.map((record) {
          //           return DataRow(
          //             cells: record.map((mapData) {
          //               if (mapData['key'] == "Name of Injured Person ") {
          //                 return DataCell(
          //                   _buildDropdownCell(
          //                     context,
          //                     screenWidth,
          //                     controller.victimNameList,
          //                     mapData,
          //                     (selectedValue) {
          //                       controller
          //                           .updateSelectedOption(selectedValue);
          //                       final injuredPersonData = controller
          //                               .dropdownVictimNameMapperData[
          //                           selectedValue];
          //                       if (injuredPersonData != null) {
          //                         final genderValue =
          //                             injuredPersonData.gender;
          //                         final designationValue =
          //                             injuredPersonData.designation;
          //                         final city = injuredPersonData.city;
          //                         final String experince =
          //                             injuredPersonData.experince
          //                                 .toString();
          //                         final row = controller
          //                             .rowInjuredPersonItem
          //                             .firstWhere((row) =>
          //                                 row[0]['value'] ==
          //                                 selectedValue);
          //                         row[1]['value'] = genderValue;
          //                         row[2]['value'] = designationValue;
          //                         row[3]['value'] = city;
          //                         row[6]['value'] = experince;
          //                         controller.update();
          //                       }
          //                     },
          //                   ),
          //                 );
          //               } else if (mapData['key'] == "Gender ") {
          //                 return DataCell(
          //                     Text(mapData["value"] ?? "Select"));
          //               } else if (mapData['key'] ==
          //                   "Trade/Designation ") {
          //                 return DataCell(
          //                     Text(mapData["value"] ?? "Select"));
          //               } else if (mapData['key'] == "Address ") {
          //                 return DataCell(
          //                     Text(mapData["value"] ?? "Select"));
          //               } else if (mapData['key'] ==
          //                   "Name of Contractor ") {
          //                 return DataCell(
          //                   _buildDropdownCell(
          //                     context,
          //                     screenWidth,
          //                     controller.businessList,
          //                     mapData,
          //                   ),
          //                 );
          //               } else if (mapData['key'] ==
          //                   "Body part injured ") {
          //                 return DataCell(
          //                   _buildDropdownCell(
          //                     context,
          //                     screenWidth,
          //                     controller.bodyinjuredList,
          //                     mapData,
          //                   ),
          //                 );
          //               } else if (mapData['key'] == "Work experience ") {
          //                 return DataCell(
          //                     Text(mapData["value"] ?? "Select"));
          //               } else if (mapData['key'] ==
          //                   "Plant & Equipment ") {
          //                 return DataCell(
          //                   _buildDropdownCell(
          //                     context,
          //                     screenWidth,
          //                     controller.eqipmentNameList,
          //                     mapData,
          //                   ),
          //                 );
          //               } else if (mapData['key'] == "Exact Location ") {
          //                 return DataCell(
          //                   Container(
          //                     width: screenWidth * 0.3,
          //                     child: LoginCustomTextfield(
          //                       keyboardType: TextInputType.text,
          //                       maxLine: 1,
          //                       textController: TextEditingController(
          //                           text: mapData["value"] ?? ''),
          //                       onChanged: (txt) {
          //                         mapData["value"] = txt;
          //                       },
          //                     ),
          //                   ),
          //                 );
          //               } else if (mapData['key'] == "Action ") {
          //                 return DataCell(
          //                   IconButton(
          //                     icon: Icon(Icons.delete,
          //                         color: ColorValues.appRedColor),
          //                     onPressed: () {
          //                       controller.rowInjuredPersonItem
          //                           .remove(record);
          //                     },
          //                   ),
          //                 );
          //               } else {
          //                 return DataCell(Text(mapData['value'] ?? ""));
          //               }
          //             }).toList(),
          //           );
          //         }).toList(),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildDropdownCell(
    BuildContext context,
    double screenWidth,
    List dropdownList,
    Map<String, dynamic> mapData, [
    Function? onValueChanged,
  ]) {
    return Container(
      width: screenWidth * 0.4,
      child: DropdownWebStock(
        width: screenWidth * 0.4,
        dropdownList: dropdownList,
        selectedValue: mapData["value"],
        onValueChanged: (list, selectedValue) {
          mapData["value"] = selectedValue;
          if (onValueChanged != null) {
            onValueChanged(selectedValue);
          }
        },
      ),
    );
  }
}
