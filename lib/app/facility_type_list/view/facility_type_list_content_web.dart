import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/facility_type_list/facility_type_list_controller.dart';
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

class FacilityTypeListContentWeb extends GetView<FacilityTypeListController> {
  FacilityTypeListContentWeb({Key? key}) : super(key: key);
  final FacilityTypeListController controller = Get.find();

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
                    Text(" / FACILITY LIST", style: Styles.greyLight14)
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
                                ? 'Close Create Facility'
                                : 'Open Create Facility',
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
                        margin: EdgeInsets.only(left: 10, top: 30),
                        height: Get.height / 1.40,
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
                                          "Create Facility",
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
                                                  controller.selectedFacilityId ==
                                                          null
                                                      ? "Facility Create Successfully in the List."
                                                      : "Facility updated Successfully in the List.",
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
                                            // Text(
                                            //   "Title",
                                            //   style: Styles.blackBold16,
                                            // ),

                                            Expanded(
                                                child: CustomRichText(
                                                    title: 'Plant Name ')),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20),
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
                                                    controller.titleCtrlr,
                                                focusNode: controller.nameFocus,
                                                scrollController:
                                                    controller.nameScroll,
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
                                                      Dimens.edgeInsets05_10,
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
                                        Dimens.boxHeight10,

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: CustomRichText(
                                              title: "Description",
                                            )),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20),
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
                                                    controller.descriptionCtrlr,
                                                focusNode: controller.descFocus,
                                                scrollController:
                                                    controller.descScroll,
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
                                                      Dimens.edgeInsets05_10,
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
                                                          .isDescriptionInvalid
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
                                                          .isDescriptionInvalid
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
                                                          .isDescriptionInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller
                                                        .isDescriptionInvalid
                                                        .value = false;
                                                  } else {
                                                    controller
                                                        .isDescriptionInvalid
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
                                              title: "Latitude",
                                            )),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20),
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
                                                    controller.latitudeCtrlr,
                                                focusNode: controller.latiFocus,
                                                scrollController:
                                                    controller.latiScroll,
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
                                                      Dimens.edgeInsets05_10,
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
                                                          .islatiInvalid
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
                                                          .islatiInvalid
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
                                                          .islatiInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller
                                                        .islatiInvalid
                                                        .value = false;
                                                  } else {
                                                    controller
                                                        .islatiInvalid
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
                                              title: "Longitude",
                                            )),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20),
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
                                                    controller.longitudeCtrlr,
                                                focusNode: controller.longiFocus,
                                                scrollController:
                                                    controller.longiScroll,
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
                                                      Dimens.edgeInsets05_10,
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
                                                          .islongiInvalid
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
                                                          .islongiInvalid
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
                                                          .islongiInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller
                                                        .islongiInvalid
                                                        .value = false;
                                                  } else {
                                                    controller
                                                        .islongiInvalid
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
                                                    title: 'SPV ')),
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
                                                      .20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.040,
                                                  child: Obx(
                                                    () => DropdownWebWidget(
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
                                                      controller: controller,
                                                      dropdownList:
                                                          controller.SpvList,
                                                      isValueSelected:
                                                          controller
                                                              .isSelectedSpv
                                                              .value,
                                                      selectedValue: controller
                                                          .selectedSpv.value,
                                                      onValueChanged:
                                                          (selectedValue,
                                                              isValueSelected) {
                                                        controller
                                                            .onValueChangedSpv(
                                                                selectedValue,
                                                                isValueSelected);
                                                      },
                                                    ),
                                                  )),
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
                                                    title: 'Owner ')),
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
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .20),
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  controller: controller,
                                                  dropdownList:
                                                      controller.ownerList,
                                                  isValueSelected: controller
                                                      .isSelectedOwner.value,
                                                  selectedValue: controller
                                                      .selectedOwner.value,
                                                  // onValueChanged:
                                                  //     controller.onValueChanged(46, 46),
                                                  onValueChanged:
                                                      (selectedValue,
                                                          isValueSelected) {
                                                    controller
                                                        .onValueChangedOwner(
                                                            selectedValue,
                                                            isValueSelected);
                                                  },
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
                                                  title: 'Operator '),
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
                                                    .20),
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  controller: controller,
                                                  dropdownList:
                                                      controller.customerList,
                                                  isValueSelected: controller
                                                      .isSelectedCustomer.value,
                                                  selectedValue: controller
                                                      .selectedCustomer.value,
                                                  onValueChanged:
                                                      (selectedValue,
                                                          isValueSelected) {
                                                    controller
                                                        .onValueChangedCustomer(
                                                            selectedValue,
                                                            isValueSelected);
                                                  },
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
                                                    title: 'Customer ')),
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
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.040,
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .20),
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  controller: controller,
                                                  dropdownList:
                                                      controller.operatorList,
                                                  isValueSelected: controller
                                                      .isSelectedOperator.value,
                                                  selectedValue: controller
                                                      .selectedOperator.value,
                                                  onValueChanged:
                                                      (selectedValue,
                                                          isValueSelected) {
                                                    controller
                                                        .onValueChangedOperator(
                                                            selectedValue,
                                                            isValueSelected);
                                                  },
                                                ),
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
                                                    title: 'Address ')),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20),
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
                                                      Dimens.edgeInsets05_10,
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
                                                    .20),
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.countryList,
                                                    isValueSelected: controller
                                                        .isSelectedCountryType
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedCountry.value,
                                                    onValueChanged: controller
                                                        .onValueChanged),
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
                                                    .20),
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.stateList,
                                                    isValueSelected: controller
                                                        .isSelectedStateType
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedState.value,
                                                    onValueChanged: controller
                                                        .onValueChanged),
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
                                                    .20),
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
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    controller: controller,
                                                    dropdownList:
                                                        controller.cityList,
                                                    isValueSelected: controller
                                                        .isSelectedCityType
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedCity.value,
                                                    onValueChanged: controller
                                                        .onValueChanged),
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
                                                  CustomRichText(title: 'Pin '),
                                            ),
                                            Container(
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20),
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
                                                    controller.zipcodeCtrlr,
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
                                                      Dimens.edgeInsets05_10,
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
                                                          .isZipCodeInvalid
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
                                                          .isZipCodeInvalid
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
                                                          .isZipCodeInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                ),
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isZipCodeInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isZipCodeInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     CustomRichText(
                                        //         title: 'Require SOP/JSA: '),
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Checkbox(
                                        //       value: controller
                                        //           .isCheckedRequire.value,
                                        //       onChanged: (bool? value) {
                                        //         controller.requiretoggleCheckbox();
                                        //       },
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 10,
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
                                                      .createFacilityType()
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatechecklist();
                                                    // controller.toggleContainer();
                                                  });
                                                },
                                                text: 'Create Facility ')
                                            : CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .updateFacilityList(
                                                          controller
                                                              .selectedItem?.id)
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatechecklist();
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
                        margin: EdgeInsets.only(right: 10, left: 10, top: 20),
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
                                      "List of Facilities",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 300,
                                      height: 40,
                                       margin: EdgeInsets.only(right: 5),
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
                                          contentPadding:
                                              Dimens.edgeInsets05_10,
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
                              controller.facilityTypeList.isEmpty == true &&
                                      controller.isLoading == false
                                  ? Center(child: Text("No Data"))
                                  : controller.isLoading.value == true
                                      ? Center(
                                          child: Text("Data Loading......"))
                                      : Expanded(
                                          child: DataTable2(
                                            key: UniqueKey(),
                                            dataRowHeight: 60,
                                            columnSpacing: 10,
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
                                                  )),
                                              DataColumn2(
                                                  // fixedWidth: 150,
                                                  label: Text(
                                                "Facility Name",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              // DataColumn2(
                                              //     // fixedWidth: 300,
                                              //     label: Text(
                                              //   "Desc",
                                              //   style: TextStyle(
                                              //       fontSize: 15,
                                              //       fontWeight: FontWeight.bold),
                                              // )),
                                              DataColumn2(
                                                  // fixedWidth: 150,
                                                  label: Text(
                                                "SPV",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 300,
                                                  label: Text(
                                                "Owner",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              // DataColumn2(
                                              //     fixedWidth: 100,
                                              //     label: Text(
                                              //       "State",
                                              //       style: TextStyle(
                                              //           fontSize: 15,
                                              //           fontWeight: FontWeight.bold),
                                              //     )),
                                              DataColumn2(
                                                  // fixedWidth: 150,
                                                  label: Text(
                                                "Operator",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 60,
                                                  label: Text(
                                                "Customer",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  // fixedWidth: 60,
                                                  label: Text(
                                                "City",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Action',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ],
                                            rows: List<DataRow>.generate(
                                              controller.facilityTypeList
                                                      .length ??
                                                  0,
                                              (index) => DataRow(cells: [
                                                DataCell(Text(
                                                    (index + 1).toString())),
                                                DataCell(Text(controller
                                                        .facilityTypeList[index]
                                                        .name
                                                        .toString() ??
                                                    '')),
                                                // DataCell(Text(controller
                                                //         .facilityTypeList?[index]
                                                //         ?.description ??
                                                //     '')),
                                                DataCell(Text(controller
                                                        .facilityTypeList[index]
                                                        .spv ??
                                                    '')),
                                                DataCell(Text(controller
                                                        .facilityTypeList[index]
                                                        .owner ??
                                                    '')),
                                                // DataCell(Text(controller
                                                //         .facilityTypeList?[index]
                                                //         ?.state ??
                                                //     '')),
                                                DataCell(Text(controller
                                                        .facilityTypeList[index]
                                                        .operator ??
                                                    '')),
                                                DataCell(Text(controller
                                                        .facilityTypeList[index]
                                                        .customer ??
                                                    '')),
                                                DataCell(Text(controller
                                                        .facilityTypeList[index]
                                                        .city
                                                        .toString() ??
                                                    '')),
                                                DataCell(Row(
                                                  children: [
                                                    varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        UserAccessConstants
                                                                            .kMasterFeatureId &&
                                                                    e.edit ==
                                                                        UserAccessConstants
                                                                            .kHaveEditAccess)
                                                                .length >
                                                            0
                                                        ? TableActionButton(
                                                            color: ColorValues
                                                                .editColor,
                                                            icon: Icons.edit,
                                                            message: 'Edit',
                                                            onPress: () {
                                                              controller.selectedItem = controller
                                                                  .facilityTypeList
                                                                  .firstWhere((element) =>
                                                                      "${element.id}" ==
                                                                      controller
                                                                          .facilityTypeList[
                                                                              index]
                                                                          .id
                                                                          .toString());

                                                              controller
                                                                  .titleCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.name ??
                                                                  '';
                                                              controller
                                                                  .descriptionCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.description ??
                                                                  '';
                                                              controller
                                                                  .addressCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.address ??
                                                                  '';
                                                              controller
                                                                  .zipcodeCtrlr
                                                                  .text = controller
                                                                      .selectedItem
                                                                      ?.pin
                                                                      .toString() ??
                                                                  '';

                                                              controller
                                                                  .selectedSpv
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.spv ??
                                                                  '';
                                                              controller
                                                                  .selectedOwner
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.owner ??
                                                                  '';
                                                              controller
                                                                  .selectedOperator
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.customer ??
                                                                  '';
                                                              controller
                                                                  .selectedCustomer
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.operator ??
                                                                  '';
                                                              controller
                                                                  .selectedCity
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.city ??
                                                                  '';
                                                              controller
                                                                  .selectedState
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.state ??
                                                                  '';
                                                              controller
                                                                  .selectedStateId = controller
                                                                      .selectedItem
                                                                      ?.stateid ??
                                                                  0;
                                                              if (controller
                                                                      .selectedStateId >
                                                                  0) {
                                                                controller.getCityList(
                                                                    controller
                                                                        .selectedStateId);
                                                              }
                                                              controller
                                                                  .selectedCountry
                                                                  .value = controller
                                                                      .selectedItem
                                                                      ?.country ??
                                                                  '';
                                                              controller
                                                                  .selectedCountryId = controller
                                                                      .selectedItem
                                                                      ?.countryid ??
                                                                  0;
                                                              if (controller
                                                                      .selectedCountryId >
                                                                  0) {
                                                                controller.getStateList(
                                                                    controller
                                                                        .selectedCountryId);
                                                              }
                                                              controller
                                                                  .selectedCityId = controller
                                                                      .selectedItem
                                                                      ?.cityId ??
                                                                  0;
                                                              controller
                                                                  .isContainerVisible
                                                                  .value = true;

                                                              // controller.descriptionCtrlr
                                                              //     .text = controller
                                                              //         .selectedItem
                                                              //         ?. ??
                                                              //     '';

                                                              // int spvId = int.tryParse(
                                                              //         facilityTypeList?.name ??
                                                              //             "") ??
                                                              //     0;
                                                              // if (spvId != 0) {
                                                              //   Get.toNamed(
                                                              //       Routes.SPVListScreen,
                                                              //       arguments: {"spvId": spvId});
                                                              // }
                                                              // controller.selectedItem =
                                                              //     controller.facilityTypeList.firstWhere(
                                                              //         (element) =>
                                                              //             "${element.id}" ==
                                                              //             _permitTypeList[0]);
                                                              // controller.selectedItem =
                                                              //     controller.facilityTypeList.firstWhere(
                                                              //         (element) =>
                                                              //             "${element.id}" ==
                                                              //             _permitTypeList[0]);
                                                            })
                                                        : Dimens.box0,
                                                    varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        UserAccessConstants
                                                                            .kMasterFeatureId &&
                                                                    e.delete ==
                                                                        UserAccessConstants
                                                                            .kHaveDeleteAccess)
                                                                .length >
                                                            0
                                                        ? TableActionButton(
                                                            color: ColorValues
                                                                .deleteColor,
                                                            icon: Icons.delete,
                                                            message: 'Delete',
                                                            onPress: () {
                                                              controller.isDeleteDialog(
                                                                  business_id: controller
                                                                      .facilityTypeList[
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  business: controller
                                                                      .facilityTypeList[
                                                                          index]
                                                                      .name);
                                                            },
                                                          )
                                                        : Dimens.box0,
                                                  ],
                                                )),
                                              ]),
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
