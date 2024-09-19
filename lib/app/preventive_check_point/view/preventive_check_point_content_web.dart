import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../domain/models/checkpoint_list_model.dart';
import '../../constant/constant.dart';
import '../../navigators/app_pages.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textfield.dart';
import '../preventive_check_point_controller.dart';

class PreventiveCheckPointContentWeb
    extends GetView<PreventiveCheckPointController> {
  PreventiveCheckPointContentWeb({Key? key}) : super(key: key);
  final PreventiveCheckPointController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dataSource = CheckPointDataSource(controller);

      return SelectionArea(
        child: Container(
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
                        controller.type.value == AppConstants.kPM
                            ? Get.offNamed(Routes.preventive)
                            : controller.type.value == AppConstants.kAudit
                                ? Get.offNamed(Routes.audit)
                                : Get.offNamed(Routes.misDashboard);
                      },
                      child: controller.type.value == AppConstants.kPM
                          ? Text(" / PREVENTIVE MAINTENANCE",
                              style: Styles.greyLight14)
                          : controller.type.value == AppConstants.kAudit
                              ? Text(" / AUDIT", style: Styles.greyLight14)
                              : Text(" / MIS", style: Styles.greyLight14),
                    ),
                    Text(" / CHECK POINT CREATOR", style: Styles.greyLight14)
                  ],
                ),
              ),
              varUserAccessModel.value.access_list!
                          .where((e) =>
                              e.feature_id ==
                                  UserAccessConstants.kPMcheckpointFeatureId &&
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
                                ? 'Close Create Check Point'
                                : 'Open Create Check Point',
                          );
                        }),
                      ),
                    )
                  : Dimens.box0,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // varUserAccessModel.value.access_list!
                    //             .where((e) => e.feature_id == 6 && e.add == 1)
                    //             .length >
                    //         0
                    //     ?
                    Visibility(
                      visible: controller.isContainerVisible.value,
                      child: Container(
                        width: (Get.width * .3),
                        margin: EdgeInsets.only(left: 30, top: 10),
                        height: Get.height / 1.6,
                        child: Card(
                          color: Color.fromARGB(255, 251, 252, 253),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Check Point Creator",
                                          style: Styles.blackBold16,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Visibility(
                                          visible: controller.isSuccess.value,
                                          child: Center(
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  controller.selectedItem ==
                                                          null
                                                      ? "CheckPoint added Successfully in the List."
                                                      : "CheckPoint updated Successfully in the List.",
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
                                            CustomRichText(
                                                title: 'Check List Name'),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0),
                                                child: DropdownWebWidget(
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
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
                                                      controller.checkList,
                                                  isValueSelected: controller
                                                      .isSelectedchecklist
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedchecklist.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(
                                                title: 'Check Point'),
                                            SizedBox(
                                              width: 37,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
                                                  child: LoginCustomTextfield(
                                                    ishint: 'Enter Check Point',
                                                    textController: controller
                                                        .checkPointCtrlr,
                                                    //validate
                                                    // errorController: controller
                                                    //         .isCheckPointInvalid
                                                    //         .value
                                                    //     ? "Required field"
                                                    //     : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          0) {
                                                        controller
                                                            .isCheckPointInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isCheckPointInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                    focusNode:
                                                        controller.chckFocus,
                                                    scroll:
                                                        controller.chckScroll,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .deny(
                                                        RegExp('[\'^]'),
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(
                                                title: 'Requirement'),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .2) -
                                                      30,
                                                  child: LoginCustomTextfield(
                                                    ishint: 'Enter Requirement',
                                                    textController: controller
                                                        .requirementCtrlr,
                                                    //validate
                                                    // errorController: controller
                                                    //         .isRequiremetInvalid
                                                    //         .value
                                                    //     ? "Required field"
                                                    //     : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          0) {
                                                        controller
                                                            .isRequiremetInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isRequiremetInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                    focusNode:
                                                        controller.reqFocus,
                                                    scroll:
                                                        controller.reqScroll,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .deny(
                                                        RegExp('[\'^]'),
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(
                                                title: 'Image Upload?',
                                                includeAsterisk: false),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Text("No"),
                                            CustomSwitchTroggle(
                                                value:
                                                    controller.isToggleOn.value,
                                                onChanged: (value) {
                                                  controller.toggle();
                                                }),
                                            Text("Yes"),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: 'Failure Weightage'),
                                            Dimens.boxWidth10,
                                            Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 227, 224, 224),
                                                    width: 1,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                width: 100,
                                                child: LoginCustomTextfield(
                                                  // ishint: 'Enter Check Point',
                                                  textController: controller
                                                      .failurewtgCtrlr,

                                                  //validate
                                                  // errorController: controller
                                                  //         .isFailureInvalid
                                                  //         .value
                                                  //     ? "Required field"
                                                  //     : null,
                                                  onChanged: (value) {
                                                    if (value.trim().length >
                                                        0) {
                                                      controller
                                                          .isFailureInvalid
                                                          .value = false;
                                                    } else {
                                                      controller
                                                          .isFailureInvalid
                                                          .value = true;
                                                    }
                                                  },
                                                )),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRichText(title: 'Type '),
                                            SizedBox(
                                              width: 90,
                                            ),
                                            Expanded(
                                              child: Container(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                ),
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
                                                height: 35,
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    isExpanded: true,
                                                    value: controller
                                                        .checkpointType.value,
                                                    onChanged: (value) =>
                                                        controller
                                                          ..updatecheCkpointType(
                                                              value!),
                                                    items: <String>[
                                                      '',
                                                      'Text',
                                                      'Bool',
                                                      'Range'
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            value,
                                                            style:
                                                                Styles.black12,
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Visibility(
                                          visible:
                                              controller.checkpointType.value ==
                                                  "Range",
                                          child: Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            children: [
                                              Spacer(),
                                              CustomRichText(title: 'Min'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: 100,
                                                  child: LoginCustomTextfield(
                                                    // ishint: 'Enter Chec',
                                                    textController: controller
                                                        .minRangeCtrlr,
                                                  )),
                                              // Dimens.boxWidth20,
                                              Spacer(),
                                              CustomRichText(title: 'Max'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 224),
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                                255,
                                                                236,
                                                                234,
                                                                234)
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  width: 100,
                                                  child: LoginCustomTextfield(
                                                    // ishint: 'Enter Check Point',
                                                    textController: controller
                                                        .maxRangeCtrlr,
                                                  )),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Visibility(
                                  visible: controller.type == 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 10),
                                      CustomRichText(
                                          title: 'Type of Observation'),
                                      Dimens.boxWidth5,
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: DropdownWebWidget(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2) -
                                                30,
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
                                              ),
                                            ],
                                            controller: controller,
                                            dropdownList:
                                                controller.typeOfObsList,
                                            isValueSelected: controller
                                                .isSelectedTypeOfObs.value,
                                            selectedValue: controller
                                                .selectedTypeOfObs.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Visibility(
                                  visible: controller.type == 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 10),
                                      CustomRichText(title: 'Risk Type'),
                                      Dimens.boxWidth10,
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: DropdownWebWidget(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2) -
                                                30,
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
                                              ),
                                            ],
                                            controller: controller,
                                            dropdownList:
                                                controller.incidentrisktypeList,
                                            isValueSelected: controller
                                                .isRiskTypeListSelected.value,
                                            selectedValue: controller
                                                .selectedRiskTypeList.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Visibility(
                                  visible: controller.type == 4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 10),
                                      CustomRichText(title: 'Cost Type'),
                                      Dimens.boxWidth10,
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: DropdownWebWidget(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2) -
                                                30,
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
                                              ),
                                            ],
                                            controller: controller,
                                            dropdownList: controller.costType,
                                            isValueSelected: controller
                                                .isCostTypeListSelected.value,
                                            selectedValue: controller
                                                .selectedCostTypeList.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appRedColor,
                                          onPressed: () {
                                            controller.cleardata();
                                            controller.isContainerVisible
                                                .value = false;
                                          },
                                          text: 'Cancel'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 40,
                                        child: controller.selectedItem == null
                                            ? CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .createCheckpoint()
                                                      .then((value) {
                                                    if (value)
                                                      controller
                                                          .issuccessCreatecheckpont();
                                                    controller
                                                        .toggleContainer();
                                                  });
                                                },
                                                text: 'Create Check Point')
                                            : CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appDarkBlueColor,
                                                onPressed: () {
                                                  controller
                                                      .updateCheckPoint(
                                                          controller
                                                              .selectedItem?.id)
                                                      .then((value) {
                                                    print("value,$value");
                                                    if (value == true)
                                                      controller
                                                          .issuccessCreatecheckpont();
                                                    controller
                                                        .toggleContainer();
                                                  });
                                                },
                                                text: 'Update')),
                                  ],
                                ),
                                Dimens.boxHeight10
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    //  : Container(),
                    ,
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Check Point List",
                                      style: Styles.blackBold16,
                                    ),
                                    varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kPMcheckpointFeatureId &&
                                                    e.add ==
                                                        UserAccessConstants
                                                            .kHaveAddAccess)
                                                .length >
                                            0
                                        ? ActionButton(
                                            icon: Icons.upload,
                                            label: 'Import Check Point',
                                            onPressed: () {
                                              Get.toNamed(
                                                  Routes.importInventory,
                                                  arguments: {
                                                    'importType': AppConstants
                                                        .kImportChecklist
                                                  });
                                            },
                                            color: ColorValues.appDarkBlueColor,
                                          )
                                        : Dimens.box0
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  PopupMenuButton<String>(
                                    tooltip: "",
                                    elevation: 25.0,
                                    child: Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      padding: EdgeInsets.only(
                                          top: 4, bottom: 4, right: 8, left: 8),
                                      decoration: BoxDecoration(
                                          color: ColorValues.appLightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(4.0, 2.0),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                          ]),
                                      child: Text(
                                        'Column Visibility',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[]..addAll(
                                              controller.columnVisibility.value
                                                  .entries
                                                  .map((e) {
                                            return PopupMenuItem<String>(
                                                child: ValueListenableBuilder(
                                                    valueListenable: controller
                                                        .columnVisibility,
                                                    builder: (context, value,
                                                        child) {
                                                      return Row(
                                                        children: [
                                                          Checkbox(
                                                            value: value[e.key],
                                                            onChanged:
                                                                (newValue) {
                                                              controller
                                                                  .setColumnVisibility(
                                                                      e.key,
                                                                      newValue!);
                                                            },
                                                          ),
                                                          Text(e.key),
                                                        ],
                                                      );
                                                    }));
                                          })),
                                    onSelected: (String value) {
                                      // Handle column selection
                                    },
                                  ),
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //     backgroundColor:
                                  //         ColorValues.appLightBlueColor,
                                  //     onPressed: () {},
                                  //     text: 'Column Visibility',
                                  //   ),
                                  // ),
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {},
                                  //       text: 'Copy'),
                                  // ),
                                  Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: const Offset(2.0, 1.0),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      )
                                    ]),
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {
                                          controller.export();
                                        },
                                        text: 'Excel'),
                                  ),
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
                                    margin: EdgeInsets.only(right: 10),
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
                              SizedBox(
                                height: 20,
                              ),
                              controller.preventiveCheckpoint!.isEmpty ==
                                          true &&
                                      controller.isLoading == false
                                  ? Center(child: Text("No data"))
                                  : controller.isLoading.value == true
                                      ? Center(
                                          child: Text("Data Loading......"))
                                      : Expanded(
                                          child: ValueListenableBuilder(
                                              valueListenable:
                                                  controller.columnVisibility,
                                              builder: (context, value, child) {
                                                final dataSource =
                                                    CheckPointDataSource(
                                                        controller);

                                                return PaginatedDataTable2(
                                                  columnSpacing: 10,
                                                  source: dataSource,

                                                  minWidth: 2400,
                                                  showCheckboxColumn: false,
                                                  rowsPerPage:
                                                      10, // Number of rows per page
                                                  availableRowsPerPage: [
                                                    10,
                                                    20,
                                                    30,
                                                    50
                                                  ],
                                                  border: TableBorder.all(
                                                      color: Color.fromARGB(
                                                          255, 206, 229, 234)),
                                                  columns: [
                                                    for (var entry
                                                        in value.entries)
                                                      if (entry.value)
                                                        buildDataColumn(
                                                          entry.key,
                                                          controller
                                                                  .columnwidth[
                                                              entry.key],
                                                        ),
                                                    buildDataColumn(
                                                      'Actions',
                                                      150,
                                                    ),
                                                  ],
                                                );
                                              })),
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
      );
    });
  }

  DataColumn2 buildDataColumn(
    String header,
    double? fixedWidth,
  ) {
    return DataColumn2(
      fixedWidth: fixedWidth,
      label: Column(
          mainAxisAlignment: MainAxisAlignment.center, //
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: Styles.black15W600,
              ),
            ),
          ]),
    );
  }
}

class CheckPointDataSource extends DataTableSource {
  final PreventiveCheckPointController controller;

  late List<CheckPointModel?> checkList;

  CheckPointDataSource(this.controller) {
    filterUsers();
  }
  void filterUsers() {
    checkList = <CheckPointModel?>[];
    checkList = controller.preventiveCheckpoint!.where((User) {
      return (User?.id ?? '')
          .toString()
          .toLowerCase()
          .contains(controller.idFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});

    final checkPointDetails = checkList[index];

    var cellsBuffer = [
      '${index + 1}',
      'CP${checkPointDetails?.id ?? ''}',
      '${checkPointDetails?.checklist_name ?? ''}',
      '${checkPointDetails?.check_point ?? ''}',
      '${checkPointDetails?.requirement ?? ''}',
      "upload_image", // '${checkPointDetails?.u ?? ''}',
      '${checkPointDetails?.failure_weightage ?? ''}%',
      checkPointDetails?.checkpoint_type == "Range"
          ? '${checkPointDetails?.checkpoint_type}(Min:${checkPointDetails?.min},Max:${checkPointDetails?.max})'
          : "${checkPointDetails?.checkpoint_type}",
      '${checkPointDetails?.type_of_observation ?? ''}',
      '${checkPointDetails?.risk_type ?? ''}',
      '${checkPointDetails?.Cost_type_name ?? ''}',

      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'Actions')
                ? Wrap(children: [
                    varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants
                                            .kPMcheckpointFeatureId &&
                                    e.edit ==
                                        UserAccessConstants.kHaveEditAccess)
                                .length >
                            0
                        ? TableActionButton(
                            color: ColorValues.editColor,
                            icon: Icons.edit,
                            message: 'Edit',
                            onPress: () {
                              controller.selectedItem =
                                  controller.preventiveCheckpoint!.firstWhere(
                                (element) =>
                                    "${element?.id}" ==
                                    controller.preventiveCheckpoint![index]?.id
                                        .toString(),
                              );

                              controller.checkPointCtrlr.text =
                                  "${controller.selectedItem?.check_point}";
                              controller.checkpointType.value =
                                  "${controller.selectedItem?.checkpoint_type}";
                              controller.selectedchecklist.value =
                                  "${controller.selectedItem?.checklist_name}";

                              controller.failurewtgCtrlr.text =
                                  "${controller.selectedItem?.failure_weightage}";
                              controller.maxRangeCtrlr.text =
                                  "${controller.selectedItem?.max}";
                              controller.minRangeCtrlr.text =
                                  "${controller.selectedItem?.min}";
                              controller.requirementCtrlr.text =
                                  controller.selectedItem?.requirement ?? "";
                              controller.isToggleOn.value = controller
                                          .selectedItem?.is_document_required ==
                                      1
                                  ? true
                                  : false;
                              controller.selectedTypeOfObs.value =
                                  "${controller.selectedItem?.type_of_observation}";
                              controller.selectedRiskTypeList.value =
                                  "${controller.selectedItem?.risk_type}";
                              controller.isContainerVisible.value = true;
                            },
                          )
                        : Dimens.box0,
                    varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants
                                            .kPMcheckpointFeatureId &&
                                    e.delete ==
                                        UserAccessConstants.kHaveDeleteAccess)
                                .length >
                            0
                        ? TableActionButton(
                            color: ColorValues.deleteColor,
                            icon: Icons.delete,
                            message: 'Delete',
                            onPress: () {
                              controller.isDeleteDialog(
                                check_point: controller
                                    .preventiveCheckpoint![index]?.check_point
                                    .toString(),
                                check_point_id: controller
                                    .preventiveCheckpoint![index]?.id
                                    .toString(),
                              );
                            },
                          )
                        : Dimens.box0
                  ])
                : (value == "upload_image") //"0" || value == '1')
                    ? Wrap(
                        children: [
                          Text("No"),
                          CustomSwitchTroggle(
                            value: controller.preventiveCheckpoint![index]
                                        ?.is_document_required ==
                                    1
                                ? true
                                : false,
                            onChanged: (value) {},
                          ),
                          Text("Yes"),
                        ],
                      )
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
    );
  }

  @override
  int get rowCount => checkList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
