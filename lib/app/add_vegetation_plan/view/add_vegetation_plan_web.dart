import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/veg_set_equipments.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddVegetationPlanWeb extends StatefulWidget {
  AddVegetationPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddVegetationPlanWeb> createState() => _AddVegetationPlanWebState();
}

class _AddVegetationPlanWebState extends State<AddVegetationPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVegetationPlanController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Obx(
            () => Scaffold(
              backgroundColor: ColorValues.whiteColor,
              body: Container(
                color: Color.fromARGB(255, 234, 236, 238),
                width: Get.width,
                height: Get.height,
                child: Stack(
                  children: [
                    Column(
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
                                  controller.clearStoreData();
                                  Get.offNamed(Routes.vegetationPlanListScreen);
                                },
                                child: Text(" / VEGETATION PLANNING LIST",
                                    style: Styles.greyLight14),
                              ),
                              controller.vegid == 0
                                  ? Text(
                                      " / ADD VEGETATION PLAN",
                                      style: Styles.greyLight14,
                                    )
                                  : Text(" / UPDATE VEGETATION PLAN",
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
                                      height: Get.height * 0.85,
                                      child: Card(
                                        margin: EdgeInsets.all(20),
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    right: 10,
                                                    left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              right: 10,
                                                              left: 10),
                                                      child:
                                                          controller.vegid == 0
                                                              ? Text(
                                                                  "Add Vegetation Plan",
                                                                  style: Styles
                                                                      .blackBold14,
                                                                )
                                                              : Text(
                                                                  "Update Vegetation Plan",
                                                                  style: Styles
                                                                      .blackBold14,
                                                                ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColour,
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
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Title :'),
                                                            Dimens.boxWidth10,
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
                                                                            5.0),
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
                                                                  LoginCustomTextfield(
                                                                width:
                                                                    (Get.width *
                                                                        .2),
                                                                textController:
                                                                    controller
                                                                        .vegTitleController,
                                                                focusNode:
                                                                    controller
                                                                        .vegTitleFocus,
                                                                scroll: controller
                                                                    .vegTitleScroll,
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter
                                                                      .deny(
                                                                    RegExp(
                                                                        '[\'^]'),
                                                                  ),
                                                                ],
                                                                errorController:
                                                                    controller
                                                                            .isTitleInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                onChanged:
                                                                    (value) {
                                                                  if (value
                                                                          .trim()
                                                                          .length >
                                                                      1) {
                                                                    controller
                                                                        .isTitleInvalid
                                                                        .value = false;
                                                                  } else {
                                                                    controller
                                                                        .isTitleInvalid
                                                                        .value = true;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Row(
                                                          children: [
                                                            Dimens.boxWidth10,
                                                            CustomRichText(
                                                                title:
                                                                    'Frequency : '),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              child:
                                                                  DropdownWebWidget(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                controller:
                                                                    controller,
                                                                dropdownList:
                                                                    controller
                                                                        .frequencyList,
                                                                isValueSelected:
                                                                    controller
                                                                        .isSelectedfrequency
                                                                        .value,
                                                                selectedValue:
                                                                    controller
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
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Assigned To :'),
                                                            Dimens.boxWidth10,
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border:
                                                                    Border.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          227,
                                                                          224,
                                                                          224),
                                                                  width: 1,
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color.fromARGB(
                                                                            255,
                                                                            236,
                                                                            234,
                                                                            234)
                                                                        .withOpacity(
                                                                            0.5),
                                                                    spreadRadius:
                                                                        2,
                                                                    blurRadius:
                                                                        5,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            2),
                                                                  ),
                                                                ],
                                                              ),
                                                              width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .2),
                                                              child:
                                                                  DropdownWebWidget(
                                                                controller:
                                                                    controller,
                                                                dropdownList:
                                                                    controller
                                                                        .assignedToList,
                                                                isValueSelected:
                                                                    controller
                                                                        .isAssignedToSelected
                                                                        .value,
                                                                selectedValue:
                                                                    controller
                                                                        .selectedAssignedTo
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
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Start Date:'),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10),
                                                                  width:
                                                                      Get.width *
                                                                          0.2,
                                                                  height: 30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black12,
                                                                        offset: Offset(
                                                                            2.0,
                                                                            2.0),
                                                                        blurRadius:
                                                                            4.0,
                                                                        spreadRadius:
                                                                            0.5,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      TextField(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      textStyle: TextStyle(
                                                                          fontSize:
                                                                              16.0,
                                                                          height:
                                                                              1.0,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    onTap: () {
                                                                      controller
                                                                          .pickDateTime(
                                                                              context);
                                                                    },
                                                                    controller:
                                                                        controller
                                                                            .startDateTc,
                                                                    autofocus:
                                                                        false,
                                                                    readOnly:
                                                                        true,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      fillColor:
                                                                          ColorValues
                                                                              .whiteColor,
                                                                      filled:
                                                                          true,
                                                                      contentPadding: EdgeInsets.fromLTRB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                                      border: InputBorder
                                                                          .none,
                                                                      enabledBorder:
                                                                          InputBorder
                                                                              .none,
                                                                      focusedBorder:
                                                                          InputBorder
                                                                              .none,
                                                                      focusedErrorBorder: controller
                                                                              .isDateInvalid
                                                                              .value
                                                                          ? OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              borderSide: BorderSide(
                                                                                color: ColorValues.redColorDark,
                                                                              ),
                                                                            )
                                                                          : InputBorder
                                                                              .none,
                                                                      errorBorder: controller
                                                                              .isDateInvalid
                                                                              .value
                                                                          ? OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              borderSide: BorderSide(
                                                                                color: ColorValues.redColorDark,
                                                                              ),
                                                                            )
                                                                          : null,
                                                                      errorText: controller
                                                                              .isDateInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                    ),
                                                                    onChanged:
                                                                        (value) {
                                                                      if (controller
                                                                          .durationInDayCtrlr
                                                                          .text
                                                                          .trim()
                                                                          .isNotEmpty) {
                                                                        controller
                                                                            .isDateInvalid
                                                                            .value = false;
                                                                      } else {
                                                                        controller
                                                                            .isDateInvalid
                                                                            .value = true;
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
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
                                                                            5.0),
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
                                                                  LoginCustomTextfield(
                                                                width:
                                                                    (Get.width *
                                                                        .2),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                inputFormatters: <TextInputFormatter>[
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
                                                                textController:
                                                                    controller
                                                                        .durationInDayCtrlr,
                                                                errorController:
                                                                    controller
                                                                            .isDurationInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                onChanged:
                                                                    (value) {
                                                                  if (value
                                                                          .trim()
                                                                          .length >
                                                                      0) {
                                                                    controller
                                                                        .isDurationInvalid
                                                                        .value = false;
                                                                  } else {
                                                                    controller
                                                                        .isDurationInvalid
                                                                        .value = true;
                                                                  }
                                                                },
                                                                enabled: controller
                                                                    .isDurationEditable
                                                                    .value,
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
                                              controller.vegid == 0
                                                  ? Center(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .isFormInvalid
                                                              .value = false;
                                                          controller
                                                              .checkForm();
                                                          if (controller
                                                              .isFormInvalid
                                                              .value) {
                                                            return;
                                                          } else {
                                                            controller.dayCount(
                                                                dayCount:
                                                                    int.tryParse(
                                                                            '${controller.durationInDayCtrlr.text}') ??
                                                                        0);
                                                            Get.dialog(
                                                                VegSetEquipment(
                                                              estimateDurationDays:
                                                                  int.tryParse(
                                                                      '${controller.durationInDayCtrlr.text}'),
                                                            ));
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 150,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorValues
                                                                .addNewColor,
                                                            border: Border.all(
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
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                  .schedules!
                                                                  .length) *
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
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "Schedule",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                                Spacer(),
                                                                InkWell(
                                                                  onTap: () {
                                                                    var selectedEqp =
                                                                        [];
                                                                    controller
                                                                        .vegPlanDetailsModel
                                                                        .value
                                                                        ?.schedules
                                                                        ?.forEach(
                                                                            (schedule) {
                                                                      schedule
                                                                          .equipments
                                                                          ?.forEach(
                                                                              (element) {
                                                                        var ee =
                                                                            element;
                                                                        ee!.cleaningDay =
                                                                            schedule.cleaningDay;
                                                                        selectedEqp
                                                                            .add(element);
                                                                        print(element
                                                                            ?.toJson());
                                                                      });
                                                                    });
                                                                    selectedEqp
                                                                        .forEach(
                                                                            (element) {
                                                                      try {
                                                                        var selectedParentIndex = controller
                                                                            .equipmentList
                                                                            .indexWhere(
                                                                          (eqp) =>
                                                                              eqp?.invId ==
                                                                              element.parentId,
                                                                        );
                                                                        print({
                                                                          "selectedParentIndex":
                                                                              selectedParentIndex
                                                                        });
                                                                        if (selectedParentIndex >
                                                                            -1) {
                                                                          var selectedChildIndex =
                                                                              controller.equipmentList.value[selectedParentIndex]!.smbs?.indexWhere((smb) => smb.smbId == element.id) ?? -1;
                                                                          if (selectedChildIndex >
                                                                              -1) {
                                                                            var ss =
                                                                                controller.equipmentList[selectedParentIndex]?.smbs?[selectedChildIndex];
                                                                            ss?.selectedDay =
                                                                                "${element.cleaningDay}";
                                                                            controller.equipmentList[selectedParentIndex]!.smbs?[selectedChildIndex] =
                                                                                ss!;
                                                                          }
                                                                          print({
                                                                            "selectedChildIndex":
                                                                                selectedChildIndex
                                                                          });
                                                                        }
                                                                      } catch (e) {
                                                                        print({
                                                                          "eadfds":
                                                                              e
                                                                        });
                                                                      }
                                                                    });
                                                                    controller.dayCount(
                                                                        dayCount:
                                                                            int.tryParse('${controller.durationInDayCtrlr.text}') ??
                                                                                0);
                                                                    Get.dialog(
                                                                      VegSetEquipment(
                                                                        estimateDurationDays:
                                                                            int.tryParse('${controller.durationInDayCtrlr.text}'),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 150,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorValues
                                                                          .addNewColor,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: ColorValues
                                                                            .lightGreyColorWithOpacity35,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5)),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Set Equipments",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w100,
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn2(
                                                                  //fixedWidth: 150,
                                                                  label: Text(
                                                                    'Day',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  // fixedWidth: 150,
                                                                  label: Text(
                                                                    'No. of SMB',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  // fixedWidth: 300,
                                                                  label: Text(
                                                                    'No of Inverters',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  // fixedWidth: 300,
                                                                  label: Text(
                                                                    'Grass Cutting Area',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                              rows: controller
                                                                  .rowItem.value
                                                                  .map(
                                                                      (record) {
                                                                return DataRow(
                                                                  // height: 130,
                                                                  cells: record.map(
                                                                      (mapData) {
                                                                    return DataCell(
                                                                      (mapData['key'] ==
                                                                              "cleaningType")
                                                                          ? Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                left: 10,
                                                                                right: 10,
                                                                                top: 10,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  IgnorePointer(
                                                                                    child: DropdownWebStock(
                                                                                      width: MediaQuery.of(context).size.width,
                                                                                      dropdownList: controller.cleaningType,
                                                                                      selectedValue: mapData["value"],
                                                                                      onValueChanged: (list, selectedValue) {
                                                                                        mapData["value"] = selectedValue;
                                                                                        controller.typedropdownMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            )
                                                                          : (mapData['key'] == "")
                                                                              ? Text(mapData['value'] ?? "")
                                                                              : Text(mapData['value'] ?? ''),
                                                                    );
                                                                  }).toList(),
                                                                );
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                              // Container(
                                              //   margin: Dimens.edgeInsets20,
                                              //   decoration: BoxDecoration(
                                              //     border: Border.all(
                                              //       color: ColorValues
                                              //           .lightGreyColorWithOpacity35,
                                              //       width: 1,
                                              //     ),
                                              //     boxShadow: [
                                              //       BoxShadow(
                                              //         color: ColorValues
                                              //             .appBlueBackgroundColor,
                                              //         spreadRadius: 2,
                                              //         blurRadius: 5,
                                              //         offset: Offset(0, 2),
                                              //       ),
                                              //     ],
                                              //   ),
                                              //   child: Column(
                                              //     children: [
                                              //       Padding(
                                              //         padding:
                                              //             EdgeInsets.all(10.0),
                                              //         child: Row(
                                              //           children: [
                                              //             Text(
                                              //               "Schedule",
                                              //               style: Styles.blue700,
                                              //             ),
                                              //             Spacer(),
                                              //             InkWell(
                                              //               onTap: () {
                                              //                 var selectedEqp =
                                              //                     [];
                                              //                 controller
                                              //                     .vegPlanDetailsModel
                                              //                     .value
                                              //                     ?.schedules
                                              //                     ?.forEach(
                                              //                         (schedule) {
                                              //                   schedule
                                              //                       .equipments
                                              //                       ?.forEach(
                                              //                           (element) {
                                              //                     var ee =
                                              //                         element;
                                              //                     ee!.cleaningDay =
                                              //                         schedule
                                              //                             .cleaningDay;
                                              //                     selectedEqp.add(
                                              //                         element);
                                              //                     print(element
                                              //                         ?.toJson());
                                              //                   });
                                              //                 });
                                              //                 selectedEqp.forEach(
                                              //                     (element) {
                                              //                   try {
                                              //                     var selectedParentIndex =
                                              //                         controller
                                              //                             .equipmentList
                                              //                             .indexWhere(
                                              //                       (eqp) =>
                                              //                           eqp?.invId ==
                                              //                           element
                                              //                               .parentId,
                                              //                     );
                                              //                     print({
                                              //                       "selectedParentIndex":
                                              //                           selectedParentIndex
                                              //                     });
                                              //                     if (selectedParentIndex >
                                              //                         -1) {
                                              //                       var selectedChildIndex = controller
                                              //                               .equipmentList
                                              //                               .value[
                                              //                                   selectedParentIndex]!
                                              //                               .smbs
                                              //                               ?.indexWhere((smb) =>
                                              //                                   smb.smbId ==
                                              //                                   element.id) ??
                                              //                           -1;
                                              //                       if (selectedChildIndex >
                                              //                           -1) {
                                              //                         var ss = controller
                                              //                             .equipmentList[
                                              //                                 selectedParentIndex]
                                              //                             ?.smbs?[selectedChildIndex];
                                              //                         ss?.selectedDay =
                                              //                             "${element.cleaningDay}";
                                              //                         controller
                                              //                             .equipmentList[
                                              //                                 selectedParentIndex]!
                                              //                             .smbs?[selectedChildIndex] = ss!;
                                              //                       }
                                              //                       print({
                                              //                         "selectedChildIndex":
                                              //                             selectedChildIndex
                                              //                       });
                                              //                     }
                                              //                   } catch (e) {
                                              //                     print({
                                              //                       "eadfds": e
                                              //                     });
                                              //                   }
                                              //                 });
                                              //                 controller.dayCount(
                                              //                     dayCount:
                                              //                         int.tryParse(
                                              //                                 '${controller.durationInDayCtrlr.text}') ??
                                              //                             0);
                                              //                 Get.dialog(
                                              //                   VegSetEquipment(
                                              //                     estimateDurationDays:
                                              //                         int.tryParse(
                                              //                             '${controller.durationInDayCtrlr.text}'),
                                              //                   ),
                                              //                 );
                                              //               },
                                              //               child: Container(
                                              //                 height: 30,
                                              //                 width: 150,
                                              //                 decoration:
                                              //                     BoxDecoration(
                                              //                   color: ColorValues
                                              //                       .addNewColor,
                                              //                   border:
                                              //                       Border.all(
                                              //                     color: ColorValues
                                              //                         .lightGreyColorWithOpacity35,
                                              //                     width: 1,
                                              //                   ),
                                              //                   borderRadius:
                                              //                       BorderRadius
                                              //                           .all(Radius
                                              //                               .circular(
                                              //                                   5)),
                                              //                 ),
                                              //                 child: Center(
                                              //                   child: Text(
                                              //                     "Set Equipments",
                                              //                     style: TextStyle(
                                              //                         fontSize:
                                              //                             18,
                                              //                         fontWeight:
                                              //                             FontWeight
                                              //                                 .w100,
                                              //                         color: Colors
                                              //                             .white),
                                              //                   ),
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         ),
                                              //       ),
                                              //       SingleChildScrollView(
                                              //         scrollDirection:
                                              //             Axis.horizontal,
                                              //         child: Padding(
                                              //           padding:
                                              //               const EdgeInsets.all(
                                              //                   10.0),
                                              //           child: DataTable2(
                                              //             border: TableBorder.all(
                                              //                 color:
                                              //                     Color.fromARGB(
                                              //                         255,
                                              //                         206,
                                              //                         229,
                                              //                         234)),
                                              //             columns: [
                                              //               DataColumn2(
                                              //                 label: Text(
                                              //                   "Day",
                                              //                   style: TextStyle(
                                              //                       fontSize: 15,
                                              //                       fontWeight:
                                              //                           FontWeight
                                              //                               .bold),
                                              //                 ),
                                              //               ),
                                              //               DataColumn2(
                                              //                 label: Text(
                                              //                   'No. of Blocks',
                                              //                   style: TextStyle(
                                              //                       fontSize: 15,
                                              //                       fontWeight:
                                              //                           FontWeight
                                              //                               .bold),
                                              //                 ),
                                              //               ),
                                              //               DataColumn2(
                                              //                 label: Text(
                                              //                   'No. of Inverters',
                                              //                   style: TextStyle(
                                              //                       fontSize: 15,
                                              //                       fontWeight:
                                              //                           FontWeight
                                              //                               .bold),
                                              //                 ),
                                              //               ),
                                              //               DataColumn2(
                                              //                 label: Text(
                                              //                   'Area',
                                              //                   style: TextStyle(
                                              //                       fontSize: 15,
                                              //                       fontWeight:
                                              //                           FontWeight
                                              //                               .bold),
                                              //                 ),
                                              //               ),
                                              //             ],
                                              //             rows: controller
                                              //                 .rowItem.value
                                              //                 .map((record) {
                                              //               return DataRow(
                                              //                 cells: record
                                              //                     .map((mapData) {
                                              //                   return DataCell(
                                              //                     Text(mapData[
                                              //                             'value'] ??
                                              //                         ''),
                                              //                   );
                                              //                 }).toList(),
                                              //               );
                                              //             }).toList(),
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (controller.openStartDatePicker)
                                      Positioned(
                                        right: 175,
                                        top: 150,
                                        child: DatePickerWidget(
                                          minDate:
                                              DateTime(DateTime.now().year),
                                          maxDate: DateTime(DateTime.now().year,
                                              13, 0), // last date of this year
                                          controller:
                                              DateRangePickerController(),
                                          selectionChanges: (p0) {
                                            print(
                                                'po valu ${p0.value.toString()}');
                                            controller.startDateTc.text =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(p0.value);
                                            controller.openStartDatePicker =
                                                !controller.openStartDatePicker;
                                            controller
                                                .update(['stock_Mangement']);
                                          },
                                          onCancel: () {
                                            controller.openStartDatePicker =
                                                false;
                                            controller
                                                .update(['stock_Mangement']);
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
