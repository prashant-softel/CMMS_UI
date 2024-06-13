import 'package:cmms/app/app.dart';
import 'package:cmms/app/business_List/business_list_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';

import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class BusinessListContentWeb extends GetView<BusinessListController> {
  BusinessListContentWeb({Key? key}) : super(key: key);
  final BusinessListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
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
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        Get.offNamed(Routes.masterDashboard);
                      },
                      child: Text(" / MASTERS", style: Styles.greyLight14),
                    ),
                    Text(" / BUSINESS LIST", style: Styles.greyLight14)
                  ],
                ),
              ),
              varUserAccessModel.value.access_list!
                          .where((e) =>
                              e.feature_id ==
                                  UserAccessConstants.kMasterFeatureId &&
                              e.add == UserAccessConstants.kHaveAddAccess)
                          .length >
                      0
                  ? Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: ElevatedButton(
                        style: Styles.navyBlueElevatedButtonStyle,
                        onPressed: () {
                          controller.toggleContainer();
                        },
                        child: Obx(() {
                          return Text(
                            controller.isContainerVisible.value
                                ? 'Close Create Business'
                                : 'Open Create Business',
                          );
                        }),
                      ),
                    )
                  : Dimens.box0,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: controller.isContainerVisible.value,
                      child: Container(
                        width: (Get.width * .30),
                        margin: EdgeInsets.only(left: 10, top: 10),
                        height: Get.height / 1.3,
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
                                          "Create Business List",
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
                                                  controller.selectedItem ==
                                                          null
                                                      ? "Businesslist Create Successfully in the List."
                                                      : "Businesslist updated Successfully in the List.",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 24, 243, 123)),
                                                ),
                                                SizedBox(
                                                  height: 5,
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
                                                    title: 'Business Type ')),
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
                                              child: Container(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .18),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.040,
                                                  child: Obx(
                                                    () => DropdownWebWidget(
                                                      controller: controller,
                                                      dropdownList: controller
                                                          .businessCategoryList,
                                                      isValueSelected: controller
                                                          .isSelectedBusinessType
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedBusinessType
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Company Name ')),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller: controller
                                                    .businesslistNumberCtrlr,
                                                focusNode:
                                                    controller.cnameFocus,
                                                scrollController:
                                                    controller.cnameScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isNameInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isNameInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isNameInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isNameInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isNameInvalid
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
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Email ')),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller:
                                                    controller.emailCtrlr,
                                                focusNode:
                                                    controller.emailFocus,
                                                scrollController:
                                                    controller.emailScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isEmailInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isEmailInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isEmailInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isEmailInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isEmailInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Contact Person')),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller: controller
                                                    .contactpersonCtrlr,
                                                focusNode:
                                                    controller.contactpFocus,
                                                scrollController:
                                                    controller.contactpScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isPersonInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isPersonInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isPersonInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isPersonInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isPersonInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CustomRichText(
                                                  title: 'Contact No '),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller: controller
                                                    .contactnumberCtrlr,
                                                focusNode:
                                                    controller.contactnoFocus,
                                                scrollController:
                                                    controller.contactnoScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 1,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isNumberInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isNumberInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isNumberInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isNumberInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isNumberInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: RichText(
                                                text: TextSpan(
                                                    text: "Website",
                                                    style: Styles.blackBold16,
                                                    children: [
                                                      TextSpan(
                                                        style: TextStyle(
                                                          color: ColorValues
                                                              .orangeColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller:
                                                    controller.websiteCtrlr,
                                                focusNode: controller.webFocus,
                                                scrollController:
                                                    controller.webScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 1,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  // focusedErrorBorder: controller
                                                  //         .isWebsiteInvalid
                                                  //         .value
                                                  //     ? OutlineInputBorder(
                                                  //         borderRadius:
                                                  //             BorderRadius
                                                  //                 .circular(5),
                                                  //         borderSide:
                                                  //             BorderSide(
                                                  //           color: ColorValues
                                                  //               .redColorDark,
                                                  //         ),
                                                  //       )
                                                  //     : InputBorder.none,
                                                  // errorBorder: controller
                                                  //         .isWebsiteInvalid
                                                  //         .value
                                                  //     ? OutlineInputBorder(
                                                  //         borderRadius:
                                                  //             BorderRadius
                                                  //                 .circular(5),
                                                  //         borderSide:
                                                  //             BorderSide(
                                                  //           color: ColorValues
                                                  //               .redColorDark,
                                                  //         ),
                                                  //       )
                                                  //     : null,
                                                  // errorText: controller
                                                  //         .isWebsiteInvalid
                                                  //         .value
                                                  //     ? "Required field"
                                                  //     : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isWebsiteInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isWebsiteInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Location ')),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller:
                                                    controller.locationCtrlr,
                                                focusNode: controller.locFocus,
                                                scrollController:
                                                    controller.locScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 1,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isLocationInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isLocationInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isLocationInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isLocationInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isLocationInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CustomRichText(
                                                  title: 'Address '),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller:
                                                    controller.addressCtrlr,
                                                focusNode: controller.addFocus,
                                                scrollController:
                                                    controller.addScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 1,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isAddressInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isAddressInvalid
                                                          .value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isAddressInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isAddressInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isAddressInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CustomRichText(
                                                  title: 'Country '),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.040,
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
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .18),
                                                child: DropdownWebWidget(
                                                  controller: controller,
                                                  dropdownList:
                                                      controller.countryList,
                                                  isValueSelected: controller
                                                      .isSelectedCountryType
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedCountry.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CustomRichText(
                                                  title: 'State '),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.040,
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
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .18),
                                                child: DropdownWebWidget(
                                                  controller: controller,
                                                  dropdownList:
                                                      controller.stateList,
                                                  isValueSelected: controller
                                                      .isSelectedStateType
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedState.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CustomRichText(
                                                  title: 'City '),
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
                                                  .18),
                                              child: DropdownWebWidget(
                                                controller: controller,
                                                dropdownList:
                                                    controller.cityList,
                                                isValueSelected: controller
                                                    .isSelectedCityType.value,
                                                selectedValue: controller
                                                    .selectedCity.value,
                                                onValueChanged:
                                                    controller.onValueChanged,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child:
                                                  CustomRichText(title: 'Zip '),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.18),
                                              height: 30,
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
                                              child: TextField(
                                                controller: controller.zipCtrlr,
                                                focusNode: controller.zipFocus,
                                                scrollController:
                                                    controller.zipScroll,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 1,
                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  fillColor:
                                                      ColorValues.whiteColor,
                                                  filled: true,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 12),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder: controller
                                                          .isZipInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : InputBorder.none,
                                                  errorBorder: controller
                                                          .isZipInvalid.value
                                                      ? OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorValues
                                                                .redColorDark,
                                                          ),
                                                        )
                                                      : null,
                                                  errorText: controller
                                                          .isZipInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isZipInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isZipInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: (Get.width * .1),
                                        height: 30,
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appRedColor,
                                            onPressed: () {
                                              controller.cleardata();
                                              controller.isContainerVisible
                                                  .value = false;
                                            },
                                            text: 'Cancel')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        width: (Get.width * .2) - 50,
                                        height: 30,
                                        // print("$controller.selectedItem");
                                        child: controller.selectedItem == null
                                            ? CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .createBusinessListNumber()
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatebusinesslist();
                                                    // controller.toggleContainer();
                                                  });
                                                },
                                                text: 'Create Business ')
                                            : CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .updateBusinesslistNumber(
                                                          controller
                                                              .selectedItem?.id,
                                                          controller
                                                              .selectedItem
                                                              ?.status,
                                                          controller
                                                              .selectedItem
                                                              ?.addedAt)
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatebusinesslist();
                                                    controller
                                                        .toggleContainer();
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
                        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
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
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Business List",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 300,
                                      height: 40,
                                      // margin: Dimens.edgeInsets0_0_16_0,
                                      child: TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        onChanged: (value) =>
                                            controller.search(value),
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 0.0,
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 0.0,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 12),
                                          hintText: 'search'.tr,
                                          hintStyle: Styles.grey16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Row(
                              //   children: [
                              //     Spacer(),

                              //   ],
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              controller.moduleList!.isEmpty == true &&
                                      controller.isLoading == false
                                  ? Center(child: Text("No Data"))
                                  : controller.isLoading.value == true
                                      ? Center(
                                          child: Text("Data Loading......"))
                                      : Expanded(
                                          child: DataTable2(
                                            key: UniqueKey(),
                                            dataRowHeight: 50,
                                            columnSpacing: 8,
                                            border: TableBorder.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234)),
                                            columns: [
                                              DataColumn2(
                                                fixedWidth: 45,
                                                label: Text(
                                                  "Sr No",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                fixedWidth: 350,
                                                label: Text(
                                                  "Company Name",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  "Business Type",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  "Contact Person",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  "Contact No",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  "Email",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  "City",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                fixedWidth: 100,
                                                label: Text(
                                                  'Action',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                              controller.moduleList?.length ??
                                                  0,
                                              (index) {
                                                var module = controller
                                                    .moduleList?[index];
                                                var businessType = controller
                                                    .businessCategoryList
                                                    .firstWhereOrNull(
                                                        (element) =>
                                                            element?.id ==
                                                            module?.type);
                                                return DataRow(cells: [
                                                  DataCell(Text(
                                                      (index + 1).toString())),
                                                  DataCell(
                                                      Text(module?.name ?? '')),
                                                  DataCell(Text(
                                                      businessType?.name ??
                                                          '')),
                                                  DataCell(Text(
                                                      module?.contactPerson ??
                                                          '')),
                                                  DataCell(Text(module
                                                          ?.contactnumber
                                                          ?.toString() ??
                                                      '')),
                                                  DataCell(Text(module?.email
                                                          ?.toString() ??
                                                      '')),
                                                  DataCell(Text(module?.city
                                                          ?.toString() ??
                                                      '')),
                                                  DataCell(Row(
                                                    children: [
                                                      if (varUserAccessModel
                                                          .value.access_list!
                                                          .any((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kMasterFeatureId &&
                                                              e.edit ==
                                                                  UserAccessConstants
                                                                      .kHaveEditAccess))
                                                        TableActionButton(
                                                          color: ColorValues
                                                              .editColor,
                                                          icon: Icons.edit,
                                                          message: 'Edit',
                                                          onPress: () {
                                                            controller.selectedItem = controller
                                                                .moduleList
                                                                ?.firstWhereOrNull(
                                                                    (element) =>
                                                                        "${element?.id}" ==
                                                                        module
                                                                            ?.id
                                                                            ?.toString());

                                                            if (controller
                                                                    .selectedItem !=
                                                                null) {
                                                              controller
                                                                  .businesslistNumberCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.name ??
                                                                  '';
                                                              controller
                                                                  .emailCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.email ??
                                                                  '';
                                                              controller
                                                                  .contactpersonCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.contactPerson ??
                                                                  '';
                                                              controller
                                                                  .contactnumberCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.contactnumber ??
                                                                  '';
                                                              controller
                                                                  .websiteCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.website ??
                                                                  '';
                                                              controller
                                                                  .locationCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.location ??
                                                                  '';
                                                              controller
                                                                  .addressCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.address ??
                                                                  '';
                                                              controller
                                                                  .selectedCity
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.city ??
                                                                  '';
                                                              controller
                                                                  .selectedCityId = controller
                                                                      .selectedItem
                                                                      ?.cityId ??
                                                                  0;
                                                              controller
                                                                  .selectedState
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.state ??
                                                                  '';
                                                              controller
                                                                  .selectedStateId = controller
                                                                      .selectedItem
                                                                      ?.stateId ??
                                                                  0;
                                                              controller
                                                                  .selectedCountry
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.country ??
                                                                  '';
                                                              controller
                                                                  .selectedCountryId = controller
                                                                      .selectedItem
                                                                      ?.countryId ??
                                                                  0;
                                                              controller
                                                                  .zipCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.zip ??
                                                                  '';
                                                              controller
                                                                  .isContainerVisible
                                                                  .value = true;
                                                            }
                                                          },
                                                        ),
                                                      if (varUserAccessModel
                                                          .value.access_list!
                                                          .any((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kMasterFeatureId &&
                                                              e.delete ==
                                                                  UserAccessConstants
                                                                      .kHaveDeleteAccess))
                                                        TableActionButton(
                                                          color: ColorValues
                                                              .deleteColor,
                                                          icon: Icons.delete,
                                                          message: 'Delete',
                                                          onPress: () {
                                                            controller
                                                                .isDeleteDialog(
                                                              business_id: module
                                                                  ?.id
                                                                  ?.toString(),
                                                              business:
                                                                  module?.name,
                                                            );
                                                          },
                                                        ),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
