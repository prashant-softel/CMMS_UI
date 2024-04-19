import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/set_equipments_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ModuleCleaningPlanningWeb extends StatefulWidget {
  ModuleCleaningPlanningWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ModuleCleaningPlanningWeb> createState() =>
      _ModuleCleaningPlanningWebState();
}

class _ModuleCleaningPlanningWebState extends State<ModuleCleaningPlanningWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleCleaningPlanningController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(
          () => SelectionArea(
            child: Scaffold(
              backgroundColor: ColorValues.whiteColor,
              body: Column(
                children: [
                  HeaderWidget(),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 227, 224, 224),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 236, 234, 234)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: ColorValues.greyLightColor,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.home);
                          },
                          child: Text(
                            "DASHBOARD",
                            style: Styles.greyLight14,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.moduleCleaningDashboard);
                          },
                          child: Text(" / MODULE CLEANING",
                              style: Styles.greyLight14),
                        ),
                        Text(" / ADD MODULE CLEANING PLAN",
                            style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: Get.height,
                                child: Card(
                                  margin: EdgeInsets.all(20),
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10, left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, right: 10, left: 10),
                                              child: Text(
                                                "Add Module Cleaning Plan",
                                                style: Styles.blackBold14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Dimens.boxHeight15,
                                      Container(
                                        margin: Dimens.edgeInsets20,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                //
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Title :'),
                                                    Dimens.boxWidth10,
                                                    GoodsOrderTextField(
                                                      textController: controller
                                                          .mcTitelCtrlr,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .deny(
                                                          RegExp('[\'^]'),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                Dimens.boxHeight10,
                                                Row(
                                                  children: [
                                                    Dimens.boxWidth10,
                                                    CustomRichText(
                                                        title: 'Frequency : '),
                                                    Dimens.boxWidth10,
                                                    SizedBox(
                                                      child: DropdownWebWidget(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        controller: controller,
                                                        dropdownList: controller
                                                            .frequencyList,
                                                        isValueSelected: controller
                                                            .isSelectedfrequency
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedfrequency
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Dimens.boxHeight10,
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomRichText(
                                                            title:
                                                                'Start date:'),
                                                        Dimens.boxWidth10,

                                                        _buildStartValidTillDateField_web(
                                                          context,
                                                          0,
                                                        ),

                                                        // CustomTextFieldForStock(
                                                        //   width: MediaQuery.of(
                                                        //               context)
                                                        //           .size
                                                        //           .width /
                                                        //       5,
                                                        //   numberTextField: true,
                                                        //   onTap: () {
                                                        //     controller
                                                        //             .openStartDatePicker =
                                                        //         !controller
                                                        //             .openStartDatePicker;
                                                        //     controller.update([
                                                        //       'stock_Mangement'
                                                        //     ]);
                                                        //   },
                                                        //   textController:
                                                        //       controller
                                                        //           .startDateTc,
                                                        // ),
                                                      ],
                                                    ),
                                                    Dimens.boxHeight10
                                                  ],
                                                ),
                                                Dimens.boxHeight10,
                                                Row(
                                                  children: [
                                                    Dimens.boxWidth10,
                                                    CustomRichText(
                                                        title:
                                                            'Estimated Duration In Day'),
                                                    Dimens.boxWidth10,
                                                    SizedBox(
                                                      child:
                                                          LoginCustomTextfield(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        textController: controller
                                                            .durationInDayCtrlr,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      Dimens.boxHeight12,
                                      controller.id == 0
                                          ? Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  // controller.schedules.
                                                  controller.dayCount(
                                                      dayCount: int.tryParse(
                                                              '${controller.durationInDayCtrlr.text}') ??
                                                          0);

                                                  Get.dialog(SetEquipmentDialog(
                                                    estimateDurationDays:
                                                        int.tryParse(
                                                            '${controller.durationInDayCtrlr.text}'),
                                                  ));
                                                },
                                                // color: ColorValues.appDarkBlueColor,
                                                // onTap: () {
                                                //   controller.addRowItem();
                                                // },
                                                child: Container(
                                                  height: 30,
                                                  width: 150,
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
                                                      "Set Equipments",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Dimens.box0,

                                      // controller.filteredInventoryNameList.length > 0
                                      //     ?

                                      controller.id == 0
                                          ? Dimens.box0
                                          : Container(
                                              margin: Dimens.edgeInsets20,
                                              height: ((controller
                                                          .schedules.length) *
                                                      40) +
                                                  200,
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
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Schedule",
                                                          style: Styles.blue700,
                                                        ),
                                                        Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            var selectedEqp =
                                                                [];
                                                            controller
                                                                .mcPlanDetailsModel
                                                                .value
                                                                ?.schedules
                                                                .forEach(
                                                                    (schedule) {
                                                              schedule
                                                                  .equipments
                                                                  ?.forEach(
                                                                      (element) {
                                                                var ee =
                                                                    element;
                                                                ee!.cleaningDay =
                                                                    schedule
                                                                        .cleaningDay;
                                                                ;
                                                                selectedEqp.add(
                                                                    element);
                                                                print(element
                                                                    ?.toJson());
                                                              });
                                                            });
                                                            selectedEqp.forEach(
                                                                (element) {
                                                              try {
                                                                var selectedParentIndex = controller
                                                                    .equipmentList
                                                                    .value
                                                                    .indexWhere((eqp) =>
                                                                        eqp?.invId ==
                                                                        element
                                                                            .parentId);
                                                                print({
                                                                  "selectedParentIndex":
                                                                      selectedParentIndex
                                                                });
                                                                if (selectedParentIndex >
                                                                    -1) {
                                                                  var selectedChildIndex = controller
                                                                          .equipmentList
                                                                          .value[
                                                                              selectedParentIndex]
                                                                          ?.smbs
                                                                          .indexWhere((smb) =>
                                                                              smb.smbId ==
                                                                              element.id) ??
                                                                      -1;

                                                                  if (selectedChildIndex >
                                                                      -1) {
                                                                    var ss = controller
                                                                        .equipmentList
                                                                        .value[
                                                                            selectedParentIndex]
                                                                        ?.smbs[selectedChildIndex];
                                                                    ss?.selectedDay =
                                                                        "${element.cleaningDay}";
                                                                    controller
                                                                        .equipmentList
                                                                        .value[
                                                                            selectedParentIndex]
                                                                        ?.smbs[selectedChildIndex] = ss!;
                                                                  }
                                                                  print({
                                                                    "selectedChildIndex":
                                                                        selectedChildIndex
                                                                  });
                                                                }
                                                              } catch (e) {
                                                                print({
                                                                  "eadfds": e
                                                                });
                                                              }
                                                            });
                                                            // controller
                                                            //     .equipmentList
                                                            //     .value
                                                            //     .forEach(
                                                            //         (element) {

                                                            //         });

                                                            // print(
                                                            //     'MC plan Detail:${controller.schedules.toJson()}');

                                                            controller.dayCount(
                                                                dayCount:
                                                                    int.tryParse(
                                                                            '${controller.durationInDayCtrlr.text}') ??
                                                                        0);

                                                            Get.dialog(
                                                                SetEquipmentDialog(
                                                              estimateDurationDays:
                                                                  int.tryParse(
                                                                      '${controller.durationInDayCtrlr.text}'),
                                                            ));
                                                          },
                                                          // color: ColorValues.appDarkBlueColor,
                                                          // onTap: () {
                                                          //   controller.addRowItem();
                                                          // },
                                                          child: Container(
                                                            height: 30,
                                                            width: 150,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorValues
                                                                  .addNewColor,
                                                              border:
                                                                  Border.all(
                                                                color: ColorValues
                                                                    .lightGreyColorWithOpacity35,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "Set Equipments",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  // Column(
                                                  //     children: []..addAll(
                                                  //           controller
                                                  //               .rowItem.value
                                                  //               .map((e) {
                                                  //         return Text(
                                                  //             jsonEncode(e));
                                                  //       }))),
                                                  // Text(jsonEncode(controller
                                                  //     .typedropdownMapperData)),
                                                  Expanded(
                                                    child: DataTable2(
                                                      border: TableBorder.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              206,
                                                              229,
                                                              234)),
                                                      columns: [
                                                        DataColumn2(
                                                          fixedWidth: 100,
                                                          label: Text(
                                                            "Day",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          //fixedWidth: 150,
                                                          label: Text(
                                                            'No. of Inverters',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            'No. of SMBs',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          // fixedWidth: 300,
                                                          label: Text(
                                                            'No of modules',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          // fixedWidth: 300,
                                                          label: Text(
                                                            'Type',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),

                                                        // print({"mappedData": mappedData});
                                                      ],
                                                      rows: controller
                                                          .rowItem.value
                                                          .map((record) {
                                                        return DataRow(
                                                          // height: 130,
                                                          cells: record
                                                              .map((mapData) {
                                                            return DataCell(
                                                              (mapData['key'] ==
                                                                      "cleaningType")
                                                                  ? Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        top: 10,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          DropdownWebStock(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            dropdownList:
                                                                                controller.cleaningType,
                                                                            selectedValue:
                                                                                mapData["value"],
                                                                            onValueChanged:
                                                                                (list, selectedValue) {
                                                                              // print('paifcghb:${controller.assetList}');
                                                                              // print({selectedValue: selectedValue});
                                                                              mapData["value"] = selectedValue;
                                                                              controller.typedropdownMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : (mapData['key'] ==
                                                                          "")
                                                                      ? Text(
                                                                          mapData['value'] ??
                                                                              "")
                                                                      : Text(mapData[
                                                                              'value'] ??
                                                                          ''),
                                                            );
                                                          }).toList(),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                      // controller.id == 0
                                      //     ? Container()
                                      //     : Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         children: [
                                      //           Container(
                                      //             height: 35,
                                      //             child: CustomElevatedButton(
                                      //               backgroundColor:
                                      //                   ColorValues.redColor,
                                      //               text: "Cancel",
                                      //               onPressed: () {
                                      //                 // final _flutterSecureStorage =
                                      //                 // const FlutterSecureStorage();

                                      //                 // _flutterSecureStorage.delete(
                                      //                 // key: "userId");

                                      //                 Get.back();
                                      //               },
                                      //             ),
                                      //           ),
                                      //           Dimens.boxWidth20,
                                      //           Container(
                                      //             height: 35,
                                      //             child: CustomElevatedButton(
                                      //               backgroundColor:
                                      //                   ColorValues.greenColor,
                                      //               text: 'Submit',
                                      //               onPressed: () {
                                      //                 controller.updateMcPlan();
                                      //               },
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                    ],
                                  ),
                                ),
                              ),
                              if (controller.openStartDatePicker)
                                Positioned(
                                  right: 175,
                                  top: 150,
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate: DateTime(DateTime.now().year, 13,
                                        0), // last date of this year
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      print('po valu ${p0.value.toString()}');
                                      controller.startDateTc.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
                                      controller.openStartDatePicker =
                                          !controller.openStartDatePicker;
                                      controller.update(['stock_Mangement']);
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Dimens.boxHeight40,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStartValidTillDateField_web(
    BuildContext context,
    int position,
  ) {
    final ModuleCleaningPlanningController controller = Get.find();
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.050,
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
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 5
                : MediaQuery.of(context).size.width / 1.0,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onTap: () {
                position == 0
                    ? pickDateTime_web(context, 0)
                    : pickDateTime_web(context, 1);
              },
              controller: position == 0
                  ? controller.startDateTimeCtrlr
                  : controller.validTillTimeCtrlr,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        Dimens.boxHeight20,
      ],
    );
  }

  Future pickDateTime_web(BuildContext context, int position) async {
    final ModuleCleaningPlanningController controller = Get.find();
    var dateTime = position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value;
    final date = await pickDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context, position, date);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value = dateTime;
    position == 0
        ? controller.startDateTimeCtrlr
        : controller.validTillTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: position == 0
              ? controller.startDateTimeCtrlr.text.length
              : controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.validTillTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    controller.validTillTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
            .format(dateTime.add(Duration(hours: 8)));
    controller.startDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context, int position) async {
    final ModuleCleaningPlanningController controller = Get.find();
    DateTime? dateTime = position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value;
    // final currentDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    print('New Date is: $newDate');
    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(
      BuildContext context, int position, DateTime? selectedDate) async {
    final ModuleCleaningPlanningController controller = Get.find();
    DateTime dateTime = position == 0
        ? controller.selectedmcstarttime.value
        : controller.selectedValidTillTime.value;
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    print('New Date new time : $newTime');
    if (newTime == null) {
      return null;
    }

    final currentTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      TimeOfDay.now().hour,
      TimeOfDay.now().minute,
    );
    final selected = DateTime(
      selectedDate?.year ?? DateTime.now().year,
      selectedDate?.month ?? DateTime.now().month,
      selectedDate?.day ?? DateTime.now().day,
      newTime.hour,
      newTime.minute,
    );

    // If date is today and time is in the past, show an error message
    print('selected time : $selected');
    if (currentTime.isAfter(selected)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Time"),
            content: Text("Please select a time in the future."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return null;
    }

    return newTime;
  }
}
