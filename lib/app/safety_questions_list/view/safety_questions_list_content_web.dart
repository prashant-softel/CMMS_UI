import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/safety_questions_list/safety_questions_list_controller.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Get.offAllNamed(Routes.breakdown);
                    },
                    child: Text(" / BREAKDOWN MAINTENANCE",
                        style: Styles.greyLight14),
                  ),
                  Text(" / PERMIT TYPE CHECKLIST", style: Styles.greyLight14)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: ElevatedButton(
                style: Styles.navyBlueElevatedButtonStyle,
                onPressed: () {
                  controller.toggleContainer();
                },
                child: Obx(() {
                  return Text(
                    controller.isContainerVisible.value
                        ? 'Close Permit checklist'
                        : 'Open Permit Checklist',
                  );
                }),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: controller.isContainerVisible.value,
                    child: Container(
                      width: (Get.width * .3),
                      margin: EdgeInsets.only(left: 30, top: 10),
                      height: Get.height / 2.3,
                      child: Card(
                        color: Color.fromARGB(255, 251, 252, 253),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SingleChildScrollView(
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
                                        height: 20,
                                      ),
                                      Visibility(
                                        visible: controller.isSuccess.value,
                                        child: Center(
                                          child: Wrap(
                                            children: [
                                              Text(
                                                controller.selectedItem == null
                                                    ? "permit type added Successfully in the List."
                                                    : "permit type updated Successfully in the List.",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 24, 243, 123)),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomRichText(
                                                title: 'Permit Type: '),
                                          ),
                                          Container(
                                            height: 30,
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2),
                                            padding:
                                                const EdgeInsets.only(left: 15),
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
                                        ],
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 15, right: 15),
                                      //   child: CustomRichText(
                                      //       title: 'Select permit type: '),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 15),
                                      //   child: SizedBox(
                                      //     height:
                                      //         MediaQuery.of(context).size.height *
                                      //             0.040,
                                      //     width:
                                      //         MediaQuery.of(context).size.width /
                                      //             3.9,
                                      //     child: DropdownWebWidget(
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
                                      //       dropdownList:
                                      //           controller.typePermitList,
                                      //       isValueSelected: controller
                                      //           .isTypePermitSelected.value,
                                      //       selectedValue: controller
                                      //           .selectedTypePermit.value,
                                      //       onValueChanged:
                                      //           controller.onValueChanged,
                                      //     ),
                                      //   ),
                                      // ),
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
                                                title: 'Checklist Title'),
                                          ),
                                          Container(
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2),
                                            height: 30,
                                            padding:
                                                const EdgeInsets.only(left: 15),
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
                                                    color:
                                                        ColorValues.whiteColor,
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 0.0,
                                                    spreadRadius: 0.0,
                                                  ),
                                                ],
                                                color: ColorValues.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2) -
                                                  30,
                                              // width: MediaQuery.of(context).size.width / 1.5,/
                                              child: Obx(
                                                () => TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      height: 1.0,
                                                      color: Colors.black),
                                                  controller:
                                                      controller.titleCtrlr,
                                                  focusNode:
                                                      controller.titleFocus,
                                                  scrollController:
                                                      controller.titleScroll,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: 1,
                                                  autofocus: false,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        ColorValues.whiteColor,
                                                    filled: true,
                                                    contentPadding:
                                                        Dimens.edgeInsets05_10,
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                        controller
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
                                                    if (value.trim().length >
                                                        1) {
                                                      controller.isTitleInvalid
                                                          .value = false;
                                                    } else {
                                                      controller.isTitleInvalid
                                                          .value = true;
                                                    }
                                                  },
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .deny(
                                                      RegExp('[\'^]'),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 15, right: 15),
                                      //   child: CustomRichText(
                                      //       title: 'Checklist Title '),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 15),
                                      //   child: Container(
                                      //     padding:
                                      //         const EdgeInsets.only(right: 15),
                                      //     child: Container(
                                      //       decoration: BoxDecoration(
                                      //         boxShadow: [
                                      //           BoxShadow(
                                      //             color: Colors.black26,
                                      //             offset: const Offset(
                                      //               5.0,
                                      //               5.0,
                                      //             ),
                                      //             blurRadius: 5.0,
                                      //             spreadRadius: 1.0,
                                      //           ),
                                      //           BoxShadow(
                                      //             color: ColorValues.whiteColor,
                                      //             offset: const Offset(0.0, 0.0),
                                      //             blurRadius: 0.0,
                                      //             spreadRadius: 0.0,
                                      //           ),
                                      //         ],
                                      //         color: ColorValues.whiteColor,
                                      //         borderRadius:
                                      //             BorderRadius.circular(5),
                                      //       ),
                                      //       width: (MediaQuery.of(context)
                                      //                   .size
                                      //                   .width *
                                      //               .17) -
                                      //           30,
                                      //       // width: MediaQuery.of(context).size.width / 1.5,/
                                      //       child: Obx(
                                      //         () => TextField(
                                      //           style: GoogleFonts.lato(
                                      //             textStyle: TextStyle(
                                      //                 fontSize: 16.0,
                                      //                 height: 1.0,
                                      //                 color: Colors.black),
                                      //           ),
                                      //           controller: controller.titleCtrlr,
                                      //           focusNode: controller.titleFocus,
                                      //           scrollController:
                                      //               controller.titleScroll,
                                      //           keyboardType:
                                      //               TextInputType.multiline,
                                      //           maxLines: 1,
                                      //           autofocus: false,
                                      //           decoration: InputDecoration(
                                      //             fillColor:
                                      //                 ColorValues.whiteColor,
                                      //             filled: true,
                                      //             contentPadding:
                                      //                 Dimens.edgeInsets05_10,
                                      //             border: InputBorder.none,
                                      //             enabledBorder:
                                      //                 OutlineInputBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       10.0),
                                      //               borderSide: BorderSide(
                                      //                   color:
                                      //                       Colors.transparent),
                                      //             ),
                                      //             focusedBorder:
                                      //                 OutlineInputBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       10.0),
                                      //               borderSide: BorderSide(
                                      //                   color:
                                      //                       Colors.transparent),
                                      //             ),
                                      //             focusedErrorBorder: controller
                                      //                     .isTitleInvalid.value
                                      //                 ? OutlineInputBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(5),
                                      //                     borderSide: BorderSide(
                                      //                       color: ColorValues
                                      //                           .redColorDark,
                                      //                     ),
                                      //                   )
                                      //                 : InputBorder.none,
                                      //             errorBorder: controller
                                      //                     .isTitleInvalid.value
                                      //                 ? OutlineInputBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(5),
                                      //                     borderSide: BorderSide(
                                      //                       color: ColorValues
                                      //                           .redColorDark,
                                      //                     ),
                                      //                   )
                                      //                 : null,
                                      //             errorText: controller
                                      //                     .isTitleInvalid.value
                                      //                 ? "Required field"
                                      //                 : null,
                                      //           ),
                                      //           onChanged: (value) {
                                      //             if (value.trim().length > 1) {
                                      //               controller.isTitleInvalid
                                      //                   .value = false;
                                      //             } else {
                                      //               controller.isTitleInvalid
                                      //                   .value = true;
                                      //             }
                                      //           },
                                      //           inputFormatters: [
                                      //             FilteringTextInputFormatter
                                      //                 .deny(
                                      //               RegExp('[\'^]'),
                                      //             )
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
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
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Expanded(
                                      //       child: CustomRichText(
                                      //           title: 'Select Type: '),
                                      //     ),
                                      //     DropdownButtonHideUnderline(
                                      //       child: DropdownButton<String>(
                                      //         isExpanded: true,
                                      //         value: controller.updateType.value,
                                      //         onChanged: (value) => controller
                                      //           ..updateChecklistType(value!),
                                      //         items: <String>[
                                      //           '',
                                      //           'Checkbox',
                                      //           'Radio',
                                      //           'Text'
                                      //         ].map<DropdownMenuItem<String>>(
                                      //             (String value) {
                                      //           return DropdownMenuItem<String>(
                                      //             value: value,
                                      //             child: Container(
                                      //               margin:
                                      //                   EdgeInsets.only(left: 10),
                                      //               child: Text(
                                      //                 value,
                                      //                 style: Styles.black12,
                                      //               ),
                                      //             ),
                                      //           );
                                      //         }).toList(),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 15),
                                      //   child: CustomRichText(
                                      //       title: 'Select Type: '),
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: CustomRichText(
                                                  title: "Select Type")),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 227, 224, 224),
                                                width: 1,
                                              ),
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
                                            ),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .1),
                                            height: 30,
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                isExpanded: true,
                                                value:
                                                    controller.updateType.value,
                                                onChanged: (value) => controller
                                                  ..updateChecklistType(value!),
                                                items: <String>[
                                                  '',
                                                  'Checkbox',
                                                  'Radio',
                                                  'Text'
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        value,
                                                        style: Styles.black12,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomRichText(
                                                title: 'Require SOP/JSA: '),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Checkbox(
                                            value: controller
                                                .isCheckedRequire.value,
                                            onChanged: (bool? value) {
                                              controller
                                                  .requiretoggleCheckbox();
                                              print(
                                                  'Checkbox:${controller.isCheckedRequire.value}');
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 40,
                                      width: (Get.width * .08),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appRedColor,
                                          onPressed: () {
                                            controller.clearData();
                                          },
                                          text: 'Cancel')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      height: 40,
                                      width: (Get.width * .15) - 50,
                                      child: controller.selectedItem == null
                                          ? CustomElevatedButton(
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
                                              text: 'Submit')
                                          : CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .updateSafetyMeasure(
                                                        controller
                                                            .selectedItem?.id)
                                                    .then((value) {
                                                  print("value,$value");
                                                  if (value == true)
                                                    controller
                                                        .issuccessSafetyMeasurelist();
                                                });
                                              },
                                              text: 'Update')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.only(left: 10, top: 10),
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
                            Row(
                              children: [
                                // PopupMenuButton<String>(
                                //   tooltip: "",
                                //   elevation: 25.0,
                                //   child: Container(
                                //     height: 35,
                                //     margin: EdgeInsets.only(left: 10),
                                //     padding: EdgeInsets.only(
                                //         top: 4,
                                //         bottom: 4,
                                //         right: 8,
                                //         left: 8),
                                //     decoration: BoxDecoration(
                                //         color: ColorValues
                                //             .appLightBlueColor,
                                //         borderRadius:
                                //             BorderRadius.circular(5),
                                //         boxShadow: [
                                //           BoxShadow(
                                //             color: Colors.black26,
                                //             offset:
                                //                 const Offset(4.0, 2.0),
                                //             blurRadius: 5.0,
                                //             spreadRadius: 1.0,
                                //           ),
                                //         ]),
                                //     child: Text(
                                //       'Column Visibility',
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.w400,
                                //       ),
                                //     ),
                                //   ),
                                //   itemBuilder: (BuildContext context) =>
                                //       <PopupMenuEntry<String>>[]
                                //         ..addAll(controller
                                //             .columnVisibility
                                //             .value
                                //             .entries
                                //             .map((e) {
                                //           return PopupMenuItem<String>(
                                //               child:
                                //                   ValueListenableBuilder(
                                //                       valueListenable:
                                //                           controller
                                //                               .columnVisibility,
                                //                       builder: (context,
                                //                           value,
                                //                           child) {
                                //                         return Row(
                                //                           children: [
                                //                             Checkbox(
                                //                               value: value[
                                //                                   e.key],
                                //                               onChanged:
                                //                                   (newValue) {
                                //                                 controller.setColumnVisibility(
                                //                                     e.key,
                                //                                     newValue!);
                                //                               },
                                //                             ),
                                //                             Text(e.key),
                                //                           ],
                                //                         );
                                //                       }));
                                //         })),
                                //   onSelected: (String value) {
                                //     // Handle column selection
                                //   },
                                // ),
                                // // Container(
                                // //   height: 35,
                                // //   margin: EdgeInsets.only(left: 10),
                                // //   child: CustomElevatedButton(
                                // //     backgroundColor:
                                // //         ColorValues.appLightBlueColor,
                                // //     onPressed: () {},
                                // //     text: 'Column Visibility',
                                // //   ),
                                // // ),
                                // // Container(
                                // //   height: 35,
                                // //   margin: EdgeInsets.only(left: 10),
                                // //   child: CustomElevatedButton(
                                // //       backgroundColor:
                                // //           ColorValues.appLightBlueColor,
                                // //       onPressed: () {},
                                // //       text: 'Copy'),
                                // // ),
                                // Container(
                                //   decoration: BoxDecoration(boxShadow: [
                                //     BoxShadow(
                                //       color: Colors.black26,
                                //       offset: const Offset(2.0, 1.0),
                                //       blurRadius: 5.0,
                                //       spreadRadius: 1.0,
                                //     )
                                //   ]),
                                //   height: 35,
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {
                                //         controller.export();
                                //       },
                                //       text: 'Excel'),
                                // ),
                                // Container(
                                //   height: 35,
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {},
                                //       text: 'PDF'),
                                // ),
                                Spacer(),
                                Container(
                                  width: 300,
                                  height: 40,
                                  margin: Dimens.edgeInsets0_0_16_0,
                                  child: TextField(
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.0,
                                        color: Colors.black),
                                    onChanged: (value) =>
                                        controller.search(value),
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      contentPadding: Dimens.edgeInsets05_10,
                                      hintText: 'search'.tr,
                                      hintStyle: Styles.grey16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight10,
                            controller.safetyMeasureList.isEmpty == true && controller.isLoading == false
                            ? Center(child: Text("No Data"))
                            : controller.isLoading.value ==true
                            ? Center(child: Text("Data Loading......"))
                                : Expanded(
                                    child: DataTable2(
                                      key: UniqueKey(),
                                      dataRowHeight: 50,
                                      columnSpacing: 10,
                                      border: TableBorder.all(
                                          color: Color.fromARGB(
                                              255, 206, 229, 234)),
                                      columns: [
                                        DataColumn2(
                                          fixedWidth: 100,
                                          label: Text(
                                            "Id",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Permit Type",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Title",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.L,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Confirmation",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                        DataColumn2(
                                          label: Text(
                                            "Required SOP/JSA",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          size: ColumnSize.S,
                                        ),
                                        DataColumn2(
                                          fixedWidth: 100,
                                          label: Text(
                                            "Action",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                        controller.safetyMeasureList.length,
                                        (index) {
                                          var safetyQuestionsListDetails =
                                              controller
                                                  .safetyMeasureList[index];
                                          return DataRow(cells: [
                                            DataCell(
                                                Text((index + 1).toString())),
                                            DataCell(Text(controller
                                                .safetyMeasureList[index]
                                                .permitType
                                                .toString())),
                                            DataCell(Text(controller
                                                .safetyMeasureList[index].name
                                                .toString())),
                                            DataCell(Text(controller
                                                .safetyMeasureList[index]
                                                .inputName
                                                .toString())),
                                            DataCell(Checkbox(
                                              value: controller.isChecked.value,
                                              onChanged: (val) {},
                                            )),
                                            // DataCell(Text(
                                            //     '${safetyQuestionsListDetails.isRequired}')),
                                            DataCell(Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                TableActionButton(
                                                  color: ColorValues.editColor,
                                                  icon: Icons.edit,
                                                  message: 'Edit',
                                                  onPress: () {
                                                    controller.selectedItem =
                                                        safetyQuestionsListDetails;
                                                    controller.titleCtrlr.text =
                                                        controller.selectedItem
                                                                ?.name ??
                                                            '';
                                                    controller.isCheckedRequire
                                                        .value = controller
                                                                .selectedItem
                                                                ?.isRequired ==
                                                            1
                                                        ? true
                                                        : false;
                                                    controller
                                                        .isContainerVisible
                                                        .value = true;
                                                    // Your edit logic...
                                                  },
                                                ),
                                                TableActionButton(
                                                    color:
                                                        ColorValues.appRedColor,
                                                    icon: Icons.delete,
                                                    message: 'Delete',
                                                    onPress: () {
                                                      controller.isDeleteDialog(
                                                        safetyMeasure_id:
                                                            '${safetyQuestionsListDetails.id}',
                                                        safetyMeasure:
                                                            safetyQuestionsListDetails
                                                                .name,
                                                      );
                                                    }),
                                              ],
                                            )),
                                          ]);
                                        },
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
