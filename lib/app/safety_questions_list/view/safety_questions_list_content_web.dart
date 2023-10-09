import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/safety_questions_list/safety_questions_list_controller.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class SafetyQuestionsListContentWeb
    extends GetView<SafetyQuestionsListController> {
  SafetyQuestionsListContentWeb({Key? key}) : super(key: key);
  final SafetyQuestionsListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 227, 224, 224),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                  Text(
                    "DASHBOARD",
                    style: Styles.greyLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(" / MASTERS", style: Styles.greyMediumLight12),
                  ),
                  Text(" / Permit Type Checklist", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.add == 1)
                              .length >
                          0
                      ? Container(
                          width: (Get.width * .3),
                          margin: EdgeInsets.only(left: 30, top: 25),
                          height: Get.height / 0.20,
                          child: Card(
                            color: Color.fromARGB(255, 251, 252, 253),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                // Text(
                                //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Add Permit Type Checklist",
                                          style: Styles.blackBold16,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: CustomRichText(
                                              title: 'Select permit type: '),
                                        ),

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.040,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.9,
                                            child: DropdownWebWidget(
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
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                              dropdownList:
                                                  controller.typePermitList,
                                              isValueSelected: controller
                                                  .isTypePermitSelected.value,
                                              selectedValue: controller
                                                  .selectedTypePermit.value,
                                              onValueChanged:
                                                  controller.onValueChanged,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: CustomRichText(
                                                  title:
                                                      'Safety Measure Title '),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
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
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
                                                  // width: MediaQuery.of(context).size.width / 1.5,/
                                                  child: Obx(
                                                    () => TextField(
                                                      controller:
                                                          controller.titleCtrlr,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLines: 1,
                                                      autofocus: false,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: ColorValues
                                                            .whiteColor,
                                                        filled: true,
                                                        contentPadding: Dimens
                                                            .edgeInsets05_10,
                                                        border:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                        focusedErrorBorder: controller
                                                                .isTitleInvalid
                                                                .value
                                                            ? OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: ColorValues
                                                                      .redColorDark,
                                                                ),
                                                              )
                                                            : InputBorder.none,
                                                        errorBorder: controller
                                                                .isTitleInvalid
                                                                .value
                                                            ? OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: ColorValues
                                                                      .redColorDark,
                                                                ),
                                                              )
                                                            : null,
                                                        errorText: controller
                                                                .isTitleInvalid
                                                                .value
                                                            ? "Required field"
                                                            : null,
                                                      ),
                                                      onChanged: (value) {
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
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),

                                    ///Description
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Expanded(
                                    //       child: CustomRichText(title: 'Description '),
                                    //     ),
                                    //     Expanded(
                                    //       child: Container(
                                    //         padding: const EdgeInsets.only(right: 15),
                                    //         child: Container(
                                    //             decoration: BoxDecoration(
                                    //               boxShadow: [
                                    //                 BoxShadow(
                                    //                   color: Colors.black26,
                                    //                   offset: const Offset(
                                    //                     5.0,
                                    //                     5.0,
                                    //                   ),
                                    //                   blurRadius: 5.0,
                                    //                   spreadRadius: 1.0,
                                    //                 ),
                                    //                 BoxShadow(
                                    //                   color: ColorValues.whiteColor,
                                    //                   offset: const Offset(0.0, 0.0),
                                    //                   blurRadius: 0.0,
                                    //                   spreadRadius: 0.0,
                                    //                 ),
                                    //               ],
                                    //               color: ColorValues.whiteColor,
                                    //               borderRadius: BorderRadius.circular(5),
                                    //             ),
                                    //             // width: MediaQuery.of(context).size.width / 2,
                                    //             width: (MediaQuery.of(context).size.width * .2) - 30,
                                    //             child: Obx(
                                    //               () => TextField(
                                    //                 controller: controller.descriptionCtrlr,
                                    //                 keyboardType: TextInputType.multiline,
                                    //                 maxLines: 1,
                                    //                 autofocus: false,
                                    //                 decoration: InputDecoration(
                                    //                   fillColor: ColorValues.whiteColor,
                                    //                   filled: true,
                                    //                   contentPadding: Dimens.edgeInsets05_10,
                                    //                   border: InputBorder.none,
                                    //                   enabledBorder: OutlineInputBorder(
                                    //                     borderRadius: BorderRadius.circular(10.0),
                                    //                     borderSide: BorderSide(color: Colors.transparent),
                                    //                   ),
                                    //                   focusedBorder: OutlineInputBorder(
                                    //                     borderRadius: BorderRadius.circular(10.0),
                                    //                     borderSide: BorderSide(color: Colors.transparent),
                                    //                   ),
                                    //                   focusedErrorBorder: controller.isDescriptionInvalid.value
                                    //                       ? OutlineInputBorder(
                                    //                           borderRadius: BorderRadius.circular(5),
                                    //                           borderSide: BorderSide(
                                    //                             color: ColorValues.redColorDark,
                                    //                           ),
                                    //                         )
                                    //                       : InputBorder.none,
                                    //                   errorBorder: controller.isDescriptionInvalid.value
                                    //                       ? OutlineInputBorder(
                                    //                           borderRadius: BorderRadius.circular(5),
                                    //                           borderSide: BorderSide(
                                    //                             color: ColorValues.redColorDark,
                                    //                           ),
                                    //                         )
                                    //                       : null,
                                    //                   errorText: controller.isDescriptionInvalid.value ? "Required field" : null,
                                    //                 ),
                                    //                 onChanged: (value) {
                                    //                   if (value.trim().length > 1) {
                                    //                     controller.isDescriptionInvalid.value = false;
                                    //                   } else {
                                    //                     controller.isDescriptionInvalid.value = true;
                                    //                   }
                                    //                 },
                                    //               ),
                                    //             )),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                   
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: CustomRichText(title: 'Select confirmation type: '),
                                    ),
                                    //  DropdownWebStock(
                                    //                   width:
                                    //                       MediaQuery.of(context)
                                    //                               .size
                                    //                               .width /
                                    //                           4,
                                    //                   dropdownList:
                                    //                       controller.type2,
                                    //                   // selectedValue:
                                    //                   //     mapData["value"],
                                    //                   onValueChanged:
                                    //                       (list, selectedValue) {
                                    //                     print({
                                    //                       selectedValue:
                                    //                           selectedValue
                                    //                     });
                                    //                     // mapData["value"] =
                                    //                     //     selectedValue;
                                    //                     controller.typedropdownMapperData[
                                    //                             selectedValue] =
                                    //                         list.firstWhere(
                                    //                             (element) =>
                                    //                                 element
                                    //                                     .name ==
                                    //                                 selectedValue,
                                    //                             orElse: null);
                                    //                     // mapData["value"] =
                                    //                     //     selectedValue;
                                    //                   },
                                    //                 ),


                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 15),
                                    //   child: SizedBox(
                                    //     height: MediaQuery.of(context).size.height * 0.040,
                                    //     width: MediaQuery.of(context).size.width / 3.9,
                                    //     child:
                                    //     DropdownWebWidget(
                                    //       boxShadow: [
                                    //         BoxShadow(
                                    //           color: Colors.black26,
                                    //           offset: const Offset(
                                    //             5.0,
                                    //             5.0,
                                    //           ),
                                    //           blurRadius: 5.0,
                                    //           spreadRadius: 1.0,
                                    //         ),
                                    //         BoxShadow(
                                    //           color: ColorValues.whiteColor,
                                    //           offset: const Offset(0.0, 0.0),
                                    //           blurRadius: 0.0,
                                    //           spreadRadius: 0.0,
                                    //         ),
                                    //       ],
                                    //       // dropdownList: [],
                                    //       // onValueChanged: (p0, p1) {

                                    //       // },
                                    //       dropdownList: controller.type2,
                                    //       isValueSelected: controller.isTypePermitSelected.value,
                                    //       selectedValue: controller.selectedTypePermit.value,
                                    //       onValueChanged: controller.onValueChanged,
                                    //     ),
                                    //   ),
                                    // ),

                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: CustomRichText(
                                                  title: 'Required: '),
                                            ),
                                            Checkbox(
                                              value: controller
                                                  .isCheckedRequire.value,
                                              onChanged: (bool? value) {
                                                controller
                                                    .requiretoggleCheckbox();
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )

                                        // SizedBox(
                                        //   width: MediaQuery.of(context)
                                        //           .size
                                        //           .width /
                                        //       1.82,
                                        //   child: DropdownWebWidget(
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black26,
                                        //     offset: const Offset(
                                        //       5.0,
                                        //       5.0,
                                        //     ),
                                        //     blurRadius: 5.0,
                                        //     spreadRadius: 1.0,
                                        //   ),
                                        //   BoxShadow(
                                        //     color: ColorValues
                                        //         .whiteColor,
                                        //     offset: const Offset(
                                        //         0.0, 0.0),
                                        //     blurRadius: 0.0,
                                        //     spreadRadius: 0.0,
                                        //   ),
                                        // ],
                                        //     dropdownList:
                                        //         controller.typePermitList,
                                        //     isValueSelected: controller
                                        //         .isTypePermitSelected.value,
                                        //     selectedValue: controller
                                        //         .selectedTypePermit.value,
                                        //     onValueChanged:
                                        //         controller.onValueChanged,
                                        //   ),
                                        // ),
                                      ]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: (Get.width * .07),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appRedColor,
                                            onPressed: () {},
                                            text: 'Cancel')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        width: (Get.width * .15) - 50,
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .createSafetyMeasure()
                                                  .then((value) {
                                                print("value,$value");
                                                // if (value == true)
                                                controller
                                                    .issuccessSafetyMeasurelist();
                                              });
                                            },
                                            text: 'Submit')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.view == 1)
                              .length >
                          0
                      ? Expanded(
                          child: Container(
                            width: Get.width * 7,
                            margin: EdgeInsets.only(left: 10, top: 25),
                            height: Get.height,
                            child: Card(
                              color: Color.fromARGB(255, 251, 252, 253),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "List of Permit Type Checklist",
                                      style: Styles.blackBold16,
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              FlutterClipboard.copy(controller
                                                      // .preventiveCheckList![0]
                                                      .toString())
                                                  .then((value) {
                                                print("copy data");
                                              });
                                            },
                                            text: 'Copy'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'Excel'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'PDF'),
                                      ),
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'columnVisibility'.tr,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  controller.safetyMeasureList.isEmpty
                                      ? Expanded(
                                          child: ScrollableTableView(
                                            columns: [
                                              // "Id",

                                              "Title",
                                              // "Type",
                                              "Confirmation",
                                              "Required",
                                              "Action"
                                            ].map((column) {
                                              return TableViewColumn(
                                                label: column,
                                                minWidth: Get.width * 0.16,
                                              );
                                            }).toList(),
                                            rows: [
                                              ...List.generate(
                                                controller
                                                    .safetyMeasureList.length,
                                                (index) {
                                                  return [
                                                    '',
                                                    // '',
                                                    '',
                                                    '',
                                                    '',
                                                  ];
                                                },
                                              ),
                                            ].map((record) {
                                              return TableViewRow(
                                                height: 60,
                                                cells: record.map((value) {
                                                  return TableViewCell(
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              );
                                            }).toList(),
                                          ),
                                        )
                                      : Expanded(
                                          child: ScrollableTableView(
                                            paginationController: controller
                                                .safetyQuestionListPaginationController,
                                            columns: [
                                              // "Id",
                                              "Title",
                                              // "Type",
                                              "Confirmation",
                                              "Required",
                                              "Action"
                                            ].map((column) {
                                              return TableViewColumn(
                                                minWidth: Get.width * 0.12,
                                                label: column,
                                              );
                                            }).toList(),
                                            rows: //
                                                [
                                              ...List.generate(
                                                controller
                                                    .safetyMeasureList.length,
                                                (index) {
                                                  var safetyQuestionsListDetails =
                                                      controller
                                                              .safetyMeasureList[
                                                          index];
                                                  return [
                                                    // '${safetyQuestionsListDetails.id}',
                                                    '${safetyQuestionsListDetails.name}',
                                                    // '${safetyQuestionsListDetails.permitType}',
                                                    '${safetyQuestionsListDetails.inputName}',
                                                    'checkbox',
                                                    // 'yes',
                                                    "Action"
                                                  ];
                                                },
                                              ),
                                            ].map((_safetyMeasureList) {
                                              return TableViewRow(
                                                  height: 60,
                                                  cells: _safetyMeasureList
                                                      .map((value) {
                                                    return TableViewCell(
                                                        child: (value ==
                                                                'checkbox')
                                                            ? Checkbox(
                                                                value: controller
                                                                    .isChecked
                                                                    .value,
                                                                onChanged:
                                                                    (val) {})
                                                            : (value ==
                                                                    "Action")
                                                                ? Row(
                                                                    children: [
                                                                        // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                                        //         0
                                                                        //     ?
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.editColor,
                                                                          icon:
                                                                              Icons.edit,
                                                                          // label: 'Edit',
                                                                          message:
                                                                              'Edit',
                                                                          onPress:
                                                                              () {},
                                                                        ),
                                                                        // : Container(),
                                                                        // :Container(),
                                                                        // varUserAccessModel.value.access_list!.where((e) => e.feature_name == "PM Checklist Number" && e.delete == 1).length >
                                                                        //         0
                                                                        //     ?
                                                                        TableActionButton(
                                                                          color:
                                                                              ColorValues.appRedColor,
                                                                          icon:
                                                                              Icons.delete,
                                                                          message:
                                                                              'Delete',
                                                                          onPress:
                                                                              () {
                                                                            controller.isDeleteDialog(
                                                                                safetyMeasure_id: _safetyMeasureList[0],
                                                                                safetyMeasure: _safetyMeasureList[1]);
                                                                          },
                                                                        )
                                                                        // : Container()
                                                                      ])
                                                                : Text(
                                                                    value,
                                                                  ));
                                                  }).toList());
                                            }).toList(),
                                          ),
                                        ),
                                  //     ? CustomSwitchTroggle(
                                  //         value: value ==
                                  //                 'No'
                                  //             ? true
                                  //             : false,
                                  //         onChanged:
                                  //             (value) {},
                                  //       )
                                  //     :

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .safetyQuestionListPaginationController,
                                        builder: (context, value, child) {
                                          return Row(children: [
                                            Text(
                                                "${controller.safetyQuestionListPaginationController.currentPage}  of ${controller.safetyQuestionListPaginationController.pageCount}"),
                                            Row(children: [
                                              IconButton(
                                                onPressed: controller
                                                            .safetyQuestionListPaginationController
                                                            .currentPage <=
                                                        1
                                                    ? null
                                                    : () {
                                                        controller
                                                            .safetyQuestionListPaginationController
                                                            .previous();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: controller
                                                              .safetyQuestionListPaginationController
                                                              .currentPage <=
                                                          1
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                            .safetyQuestionListPaginationController
                                                            .currentPage >=
                                                        controller
                                                            .safetyQuestionListPaginationController
                                                            .pageCount
                                                    ? null
                                                    : () {
                                                        controller
                                                            .safetyQuestionListPaginationController
                                                            .next();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: controller
                                                              .safetyQuestionListPaginationController
                                                              .currentPage >=
                                                          controller
                                                              .safetyQuestionListPaginationController
                                                              .pageCount
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                            ]),
                                          ]);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
