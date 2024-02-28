import 'package:cmms/app/edit_vegetation_plan/edit_vegetation_plan_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/veg_set_equipments.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditVegetationPlanWeb extends StatefulWidget {
  EditVegetationPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<EditVegetationPlanWeb> createState() => _EditVegetationPlanWebState();
}

class _EditVegetationPlanWebState extends State<EditVegetationPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditVegetationPlanController>(
      // id: 'stock_Mangement',
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
                                  Get.offNamed(Routes.vegetationDashboard);
                                },
                                child: Text(" / VEGETATION CONTROL",
                                    style: Styles.greyLight14),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(Routes.vegetationPlanListScreen);
                                },
                                child: Text(" / VEGETATION CONTROL PLANNING",
                                    style: Styles.greyLight14),
                              ),
                              Text(
                                " / EDIT VEGETATION PLAN",
                                style: Styles.greyLight14,
                              )
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
                                        color:
                                            Color.fromARGB(255, 245, 248, 250),
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            right: 10,
                                                            left: 10),
                                                    child: Text(
                                                      "Add Vegetation Plan",
                                                      style: Styles.blackBold14,
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
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CustomRichText(
                                                              title: 'Title :'),
                                                          Dimens.boxWidth10,
                                                          GoodsOrderTextField(
                                                            textController:
                                                                controller
                                                                    .vegTitleController,
                                                            focusnode: controller
                                                                .vegTitleFocus,
                                                            scroll: controller
                                                                .vegTitleScroll,
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
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.040,
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
                                                                    ), //BoxShadow
                                                                    BoxShadow(
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      offset: const Offset(
                                                                          0.0,
                                                                          0.0),
                                                                      blurRadius:
                                                                          0.0,
                                                                      spreadRadius:
                                                                          0.0,
                                                                    ), //BoxShadow
                                                                  ],
                                                                  color: ColorValues
                                                                      .whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    TextField(
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            16.0,
                                                                        height:
                                                                            1.0,
                                                                        color: Colors
                                                                            .black),
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
                                                                    contentPadding:
                                                                        EdgeInsets.fromLTRB(
                                                                            5.0,
                                                                            10.0,
                                                                            5.0,
                                                                            10.0),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.transparent),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.transparent),
                                                                    ),
                                                                  ),
                                                                  onChanged:
                                                                      (value) {},
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
                                                              textController:
                                                                  controller
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
                                            controller.vegPlanId == 0
                                                ? Center(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // controller.schedules.
                                                        controller.dayCount(
                                                            dayCount: int.tryParse(
                                                                    '${controller.durationInDayCtrlr.text}') ??
                                                                0);
                                                        Get.dialog(
                                                            VegSetEquipment(
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
                                                          border: Border.all(
                                                            color: ColorValues
                                                                .lightGreyColorWithOpacity35,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
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
                                                : Dimens.box0,

                                            // controller.filteredInventoryNameList.length > 0
                                            //     ?

                                            controller.vegPlanId == 0
                                                ? Dimens.box0
                                                : Container(
                                                    margin: Dimens.edgeInsets20,
                                                    height: ((controller
                                                                .schedules
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
                                                          offset: Offset(0, 2),
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
                                                              GestureDetector(
                                                                onTap: () {
                                                                  // var selectedEqp = [];
                                                                  // controller
                                                                  //     .mcPlanDetailsModel
                                                                  //     .value
                                                                  //     ?.schedules
                                                                  //     .forEach(
                                                                  //         (schedule) {
                                                                  //   schedule.equipments
                                                                  //       ?.forEach(
                                                                  //           (element) {
                                                                  //     var ee = element;
                                                                  //     ee!.cleaningDay =
                                                                  //         schedule
                                                                  //             .cleaningDay;
                                                                  //     ;
                                                                  //     selectedEqp
                                                                  //         .add(element);
                                                                  //     print(element
                                                                  //         ?.toJson());
                                                                  //   });
                                                                  // });
                                                                  // selectedEqp.forEach(
                                                                  //     (element) {
                                                                  //   try {
                                                                  //     var selectedParentIndex = controller
                                                                  //         .equipmentList
                                                                  //         .value
                                                                  //         .indexWhere((eqp) =>
                                                                  //             eqp?.invId ==
                                                                  //             element
                                                                  //                 .parentId);
                                                                  //     print({
                                                                  //       "selectedParentIndex":
                                                                  //           selectedParentIndex
                                                                  //     });
                                                                  //     if (selectedParentIndex >
                                                                  //         -1) {
                                                                  //       var selectedChildIndex = controller
                                                                  //               .equipmentList
                                                                  //               .value[
                                                                  //                   selectedParentIndex]
                                                                  //               ?.smbs
                                                                  //               .indexWhere((smb) =>
                                                                  //                   smb.smbId ==
                                                                  //                   element.id) ??
                                                                  //           -1;

                                                                  //       if (selectedChildIndex >
                                                                  //           -1) {
                                                                  //         var ss = controller
                                                                  //             .equipmentList
                                                                  //             .value[
                                                                  //                 selectedParentIndex]
                                                                  //             ?.smbs[selectedChildIndex];
                                                                  //         ss?.selectedDay =
                                                                  //             "${element.cleaningDay}";
                                                                  //         controller
                                                                  //             .equipmentList
                                                                  //             .value[
                                                                  //                 selectedParentIndex]
                                                                  //             ?.smbs[selectedChildIndex] = ss!;
                                                                  //       }
                                                                  //       print({
                                                                  //         "selectedChildIndex":
                                                                  //             selectedChildIndex
                                                                  //       });
                                                                  //     }
                                                                  //   } catch (e) {
                                                                  //     print({
                                                                  //       "eadfds": e
                                                                  //     });
                                                                  //   }
                                                                  // });
                                                                  // // controller
                                                                  // //     .equipmentList
                                                                  // //     .value
                                                                  // //     .forEach(
                                                                  // //         (element) {

                                                                  // //         });

                                                                  // // print(
                                                                  // //     'MC plan Detail:${controller.schedules.toJson()}');

                                                                  // controller.dayCount(
                                                                  //     dayCount:
                                                                  //         int.tryParse(
                                                                  //                 '${controller.durationInDayCtrlr.text}') ??
                                                                  //             0);

                                                                  // Get.dialog(
                                                                  //     SetEquipmentDialog(
                                                                  //   estimateDurationDays:
                                                                  //       int.tryParse(
                                                                  //           '${controller.durationInDayCtrlr.text}'),
                                                                  // ));
                                                                },
                                                                // color: ColorValues.appDarkBlueColor,
                                                                // onTap: () {
                                                                //   controller.addRowItem();
                                                                // },
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
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .w100,
                                                                          color:
                                                                              Colors.white),
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
                                                                color: Color
                                                                    .fromARGB(
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
                                                                      fontSize:
                                                                          15,
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
                                                                      fontSize:
                                                                          15,
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
                                                                      fontSize:
                                                                          15,
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
                                                                      fontSize:
                                                                          15,
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
                                                                      fontSize:
                                                                          15,
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
                                                                cells: record.map(
                                                                    (mapData) {
                                                                  return DataCell(
                                                                    (mapData['key'] ==
                                                                            "cleaningType")
                                                                        ? Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              left: 10,
                                                                              right: 10,
                                                                              top: 10,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                // DropdownWebStock(
                                                                                //   width: MediaQuery.of(context)
                                                                                //       .size
                                                                                //       .width,
                                                                                //   dropdownList:
                                                                                //       controller.cleaningType,
                                                                                //   selectedValue:
                                                                                //       mapData["value"],
                                                                                //   onValueChanged:
                                                                                //       (list, selectedValue) {
                                                                                //     // print('paifcghb:${controller.assetList}');
                                                                                //     // print({selectedValue: selectedValue});
                                                                                //     mapData["value"] =
                                                                                //         selectedValue;
                                                                                //     controller.typedropdownMapperData[selectedValue] =
                                                                                //         list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                                //   },
                                                                                // ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "")
                                                                            ? Text(mapData['value'] ??
                                                                                "")
                                                                            : Text(mapData['value'] ??
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
