import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WidgetAddPrposedAction extends StatefulWidget {
  WidgetAddPrposedAction({
    super.key,
  });

  @override
  State<WidgetAddPrposedAction> createState() => _WidgetAddPrposedActionState();
}

class _WidgetAddPrposedActionState extends State<WidgetAddPrposedAction> {
  final AddIncidentReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Dimens.boxHeight15,
              Text(
                "Proposed Action Plan",
                style: Styles.blue700,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  controller.addRowItem();
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
            itemCount: controller.rowItem.length,
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
                    children: controller.rowItem[index].map<Widget>((mapData) {
                      return Column(
                        children: [
                          (mapData['key'] == "Action as per plan ")
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Action as per plan ",
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
                                            LoginCustomTextfield(
                                              keyboardType: TextInputType.text,
                                              maxLine: 1,
                                              textController:
                                                  TextEditingController(
                                                      text: mapData["value"] ??
                                                          ''),
                                              onChanged: (txt) {
                                                mapData["value"] = txt;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Remark")
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Remark",
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
                                                LoginCustomTextfield(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  maxLine: 1,
                                                  textController:
                                                      TextEditingController(
                                                          text: mapData[
                                                                  "value"] ??
                                                              ''),
                                                  onChanged: (txt) {
                                                    mapData["value"] = txt;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "HSE Remark")
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "HSE Remark",
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
                                                    LoginCustomTextfield(
                                                      keyboardType:
                                                          TextInputType.text,
                                                      maxLine: 1,
                                                      textController:
                                                          TextEditingController(
                                                              text: mapData[
                                                                      "value"] ??
                                                                  ''),
                                                      onChanged: (txt) {
                                                        mapData["value"] = txt;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : (mapData['key'] == "Target Date ")
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Target Date ",
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        _buildTargetDateField_web(
                                                          context,
                                                          new TextEditingController(
                                                              text: mapData[
                                                                      "value"] ??
                                                                  ''),
                                                          onChanged: (txt) {
                                                            mapData["value"] =
                                                                txt;
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : (mapData['key'] == "Drop_down")
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
                                                        "Responsibility",
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
                                                        child: Column(
                                                          children: [
                                                            DropdownWebWidget(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.1,
                                                              dropdownList:
                                                                  controller
                                                                      .responsbilityList,
                                                              selectedValue:
                                                                  mapData[
                                                                      "value"],
                                                              onValueChanged: (list,
                                                                  selectedValue) {
                                                                print({
                                                                  selectedValue:
                                                                      selectedValue
                                                                });
                                                                mapData["value"] =
                                                                    selectedValue;
                                                                controller.dropdownMapperData[
                                                                        selectedValue] =
                                                                    list.firstWhere(
                                                                        (element) =>
                                                                            element.name ==
                                                                            selectedValue,
                                                                        orElse:
                                                                            null);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : (mapData['key'] == "Status")
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
                                                          Text(
                                                            "Status ",
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
                                                            child: Column(
                                                              children: [
                                                                DropdownWebWidget(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1.1,
                                                                  dropdownList:
                                                                      controller
                                                                          .statusList,
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
                                                                    controller.statusDropDownMapperData[selectedValue] = list.firstWhere(
                                                                        (element) =>
                                                                            element.name ==
                                                                            selectedValue,
                                                                        orElse:
                                                                            null);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : (mapData['key'] ==
                                                          "Action ")
                                                      ? Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                            child:
                                                                TableActionButton(
                                                              color: ColorValues
                                                                  .appRedColor,
                                                              icon:
                                                                  Icons.delete,
                                                              label: '',
                                                              message: '',
                                                              onPress: () {
                                                                controller
                                                                    .rowOtherInjuredPersonItem
                                                                    .remove(controller
                                                                        .rowOtherInjuredPersonItem
                                                                        .value[index]);
                                                              },
                                                            ),
                                                          ),
                                                        )
                                                      : Text(
                                                          mapData['key'] ?? ''),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTargetDateField_web(
      BuildContext context, TextEditingController textDateController,
      {required Function(String) onChanged}) {
    return StatefulBuilder(builder: ((context, setState) {
      return Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.040,
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
              ), //BoxShadow
              BoxShadow(
                color: ColorValues.whiteColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onTap: () {
                setState(() {
                  pickTargetDateTime_web(
                    context,
                    textDateController,
                  );
                });

                // }

                // : null;
              },
              controller: textDateController,
              onChanged: (value) {
                setState(
                  () {
                    textDateController.text = value;
                    onChanged(value);
                  },
                );
              },

              // :null,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_month),
              ),
            ),
          ),
        ),
      ]);
    }));
  }

  //Start Date and valid Till
  Future pickTargetDateTime_web(
    BuildContext context,
    TextEditingController textcontroller,
    // {required Function(String) onChanged}
  ) async {
    var dateTime = controller.selectedtargetDateTime.value;

    final date = await pickTargetDate_web(context);
    if (date == null) {
      return;
    }

    // final time = await pickTargetTime_web(context);
    // if (time == null) {
    //   return;
    // }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      // time.hour,
      // time.minute,
    );
    controller.selectedtargetDateTime.value;

    textcontroller
      // ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: textcontroller.text.length,
          affinity: TextAffinity.upstream,
        ),
      );

    textcontroller.text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime);

    // controller.testDataTextCtrlr.text = textcontroller.text;
    print('Incident reportDate & Time ${textcontroller.text}');
  }

  Future<DateTime?> pickTargetDate_web(
    BuildContext context,
  ) async {
    DateTime? dateTime = controller.selectedtargetDateTime.value;

    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTargetTime_web(
    BuildContext context,
  ) async {
    DateTime dateTime = controller.selectedtargetDateTime.value;

    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }
}
