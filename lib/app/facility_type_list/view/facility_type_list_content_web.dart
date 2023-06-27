import 'package:clipboard/clipboard.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/facility_type_list/facility_type_list_controller.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class FacilityTypeListContentWeb extends GetView<FacilityTypeListController> {
  FacilityTypeListContentWeb({Key? key}) : super(key: key);
  final FacilityTypeListController controller = Get.find();

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
                  Text(" / FACILITY LIST", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.add == 0)
                              .length >
                          0
                      ? Container(
                          width: (Get.width * .3),
                          margin: EdgeInsets.only(left: 30, top: 30),
                          height: Get.height,
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
                                            "Add Facility",
                                            style: Styles.blackBold16,
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Visibility(
                                            visible: controller.isSuccess.value,
                                            child: Center(
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    controller.selectedFacilityId ==
                                                            null
                                                        ? "Facility added Successfully in the List."
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

                                              CustomRichText(title: 'Title '),
                                              Expanded(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                .2) -
                                                            45,
                                                    child: LoginCustomTextfield(
                                                      ishint: 'Enter Title',
                                                      textController:
                                                          controller.titleCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomRichText(title: 'Owner '),
                                              Expanded(
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
                                                      45,
                                                  child: Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3),
                                                    child: DropdownWidget(
                                                      controller: controller,
                                                      dropdownList:
                                                          controller.ownerList,
                                                      isValueSelected:
                                                          controller
                                                              .isSelectedOwner
                                                              .value,
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
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomRichText(
                                                  title: 'Customer '),
                                              Expanded(
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
                                                      45,
                                                  child: Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3),
                                                    child: DropdownWidget(
                                                      controller: controller,
                                                      dropdownList: controller
                                                          .customerList,
                                                      isValueSelected: controller
                                                          .isSelectedCustomer
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedCustomer
                                                          .value,
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
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomRichText(
                                                  title: 'Operator '),
                                              Expanded(
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
                                                      45,
                                                  child: Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3),
                                                    child: DropdownWidget(
                                                      controller: controller,
                                                      dropdownList: controller
                                                          .operatorList,
                                                      isValueSelected: controller
                                                          .isSelectedOperator
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedOperator
                                                          .value,
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
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomRichText(title: 'SPV '),
                                              Expanded(
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
                                                      45,
                                                  child: Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3),
                                                    child: DropdownWidget(
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
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomRichText(title: 'Address '),
                                              Expanded(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                .2) -
                                                            45,
                                                    child: LoginCustomTextfield(
                                                      ishint: 'Enter Address',
                                                      textController: controller
                                                          .addressCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomRichText(title: 'Country '),
                                              Expanded(
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
                                                      45,
                                                  child: Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3),
                                                    child: DropdownWidget(
                                                      controller: controller,
                                                      dropdownList: controller
                                                          .countryList,
                                                      isValueSelected:
                                                          controller
                                                              .isSelectedCountry
                                                              .value,
                                                      selectedValue: controller
                                                          .selectedCountry
                                                          .value,
                                                      onValueChanged:
                                                          (selectedValue,
                                                              isValueSelected) {
                                                        controller
                                                            .onValueChangedCountry(
                                                                selectedValue,
                                                                isValueSelected);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomRichText(title: 'State '),
                                              Expanded(
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
                                                      45,
                                                  child: Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3),
                                                    child: DropdownWidget(
                                                      controller: controller,
                                                      dropdownList:
                                                          controller.stateList,
                                                      isValueSelected:
                                                          controller
                                                              .isSelectedState
                                                              .value,
                                                      selectedValue: controller
                                                          .selectedState.value,
                                                      onValueChanged:
                                                          (selectedValue,
                                                              isValueSelected) {
                                                        controller
                                                            .onValueChangedState(
                                                                selectedValue,
                                                                isValueSelected);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomRichText(title: 'City '),
                                              Expanded(
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
                                                      45,
                                                  child: Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3),
                                                    child: DropdownWidget(
                                                      controller: controller,
                                                      dropdownList:
                                                          controller.cityList,
                                                      isValueSelected:
                                                          controller
                                                              .isSelectedCity
                                                              .value,
                                                      selectedValue: controller
                                                          .selectedCity.value,
                                                      // onValueChanged:
                                                      //     controller.onValueChanged(46, 46),
                                                      onValueChanged:
                                                          (selectedValue,
                                                              isValueSelected) {
                                                        controller
                                                            .onValueChangedCity(
                                                                selectedValue,
                                                                isValueSelected);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomRichText(title: 'Pin '),
                                              Expanded(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                .2) -
                                                            45,
                                                    child: LoginCustomTextfield(
                                                      ishint: 'Enter Pin',
                                                      textController: controller
                                                          .zipcodeCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "Description ",
                                              //   style: Styles.blackBold16,
                                              // ),

                                              CustomRichText(
                                                  title: 'Description '),
                                              Expanded(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                .2) -
                                                            45,
                                                    child: LoginCustomTextfield(
                                                      ishint:
                                                          'Enter Description',
                                                      textController: controller
                                                          .descriptionCtrlr,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
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
                                            height: 20,
                                          ),
                                        ]),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: (Get.width * .1),
                                          height: 40,
                                          child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appRedColor,
                                              onPressed: () {},
                                              text: 'Cancel')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: (Get.width * .2) - 50,
                                          height: 40,
                                          child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .createFacilityType()
                                                    .then((value) {
                                                  print("value,$value");
                                                  if (value == true)
                                                    controller
                                                        .issuccessCreatechecklist();
                                                });
                                              },
                                              text: 'Submit')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 5 && e.view == 0)
                              .length >
                          0
                      ? Expanded(
                          child: Container(
                            width: Get.width * 7,
                            margin: EdgeInsets.only(left: 10, top: 30),
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
                                      "List of Facilities",
                                      style: Styles.blackBold16,
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: (Get.width * .1) - 60,
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
                                        width: (Get.width * .1) - 60,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'Excel'),
                                      ),
                                      Container(
                                        width: (Get.width * .1) - 70,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {},
                                            text: 'PDF'),
                                      ),
                                      Container(
                                        width: (Get.width * .2) - 100,
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
                                  // controller.preventiveCheckList!.isEmpty
                                  //     ? Expanded(
                                  //         child: ScrollableTableView(
                                  //           columns: [
                                  //             "Checklist Number ",
                                  //             "Active Status ",
                                  //             "Category ",
                                  //             "Frequency ",
                                  //             "PM Manpower",
                                  //             "PM Duration(in Min.)",
                                  //             "Action",
                                  //           ].map((column) {
                                  //             return TableViewColumn(
                                  //               label: column,
                                  //               minWidth: Get.width * 0.16,
                                  //             );
                                  //           }).toList(),
                                  //           rows: [
                                  //             ...List.generate(
                                  //               controller.preventiveCheckList
                                  //                       ?.length ??
                                  //                   0,
                                  //               (index) {
                                  //                 return [
                                  //                   '',
                                  //                   '',
                                  //                   '',
                                  //                   '',
                                  //                   '',
                                  //                   '',
                                  //                 ];
                                  //               },
                                  //             ),
                                  //           ].map((record) {
                                  //             return TableViewRow(
                                  //               height: 60,
                                  //               cells: record.map((value) {
                                  //                 return TableViewCell(
                                  //                   child: Text(value),
                                  //                 );
                                  //               }).toList(),
                                  //             );
                                  //           }).toList(),
                                  //         ),
                                  //       )
                                  //     :
                                  Expanded(
                                    child: ScrollableTableView(
                                      paginationController: controller
                                          .facilityTypeListPaginationController,
                                      columns: [
                                        "Sr.No.",
                                        "Title",
                                        "Address",
                                        "City",
                                        "State",
                                        "Country",
                                        "Pin",
                                        "Blocks",
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
                                          controller.facilityTypeList.length,
                                          (index) {
                                            var facilityTypeListDetails =
                                                controller
                                                    .facilityTypeList[index];
                                            return [
                                              '${facilityTypeListDetails.id}',
                                              '${facilityTypeListDetails.name}',
                                              '${facilityTypeListDetails.address}',
                                              '${facilityTypeListDetails.city}',
                                              '${facilityTypeListDetails.state}',
                                              '${facilityTypeListDetails.country}',
                                              '${facilityTypeListDetails.blocks}',
                                              '${facilityTypeListDetails.pin}',
                                              "Action"
                                            ];
                                          },
                                        ),
                                      ].map((_permitTypeList) {
                                        return TableViewRow(
                                            height: 60,
                                            cells: _permitTypeList.map((value) {
                                              return TableViewCell(
                                                  child: (value == 'Checkbox')
                                                      ? Checkbox(
                                                          value: controller
                                                              .isChecked.value,
                                                          onChanged: (val) {})
                                                      : (value == "Action")
                                                          ? Wrap(children: [
                                                              // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.edit == 1).length >
                                                              //         0
                                                              //     ?
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                child: Column(
                                                                  children: [
                                                                    TableActionButton(
                                                                      color: ColorValues
                                                                          .appLightBlueColor,
                                                                      icon: Icons
                                                                          .visibility,
                                                                      label:
                                                                          'View Blocks',
                                                                      onPress:
                                                                          () {},
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              10),
                                                                      child: Row(
                                                                          children: [
                                                                            TableActionButton(
                                                                              color: ColorValues.appLightBlueColor,
                                                                              icon: Icons.edit,
                                                                              label: 'Edit',
                                                                              onPress: () {
                                                                                print(_permitTypeList[0]);
                                                                                controller.selectedFacilityId = controller.facilityList.firstWhere((element) => "${element?.id}" == _permitTypeList[0]);

                                                                                controller.titleCtrlr.text = controller.selectedFacilityId?.name ?? '';
                                                                                controller.addressCtrlr.text = controller.selectedFacilityId?.address ?? '';
                                                                                controller.zipcodeCtrlr.text = "${controller.selectedFacilityId?.pincode}";
                                                                                // controller.descriptionCtrlr.text = "${controller.selectedFacilityId?.description}";

                                                                                controller.selectedCountry.value = controller.selectedFacilityId?.country ?? "";
                                                                                controller.selectedState.value = controller.selectedFacilityId?.state ?? "";
                                                                                controller.selectedCity.value = controller.selectedFacilityId?.city ?? "";
                                                                                // controller.selectedOwner.value = controller.selectedFacilityId?.owner ?? "";
                                                                                // controller.selectedequipment.value = controller.selectedItem?.category_name ?? "";
                                                                                // controller.manpowerCtrlr.text = "${controller.selectedItem?.manPower}";
                                                                                // controller.selectedEquipmentId = controller.selectedItem?.category_id ?? 0;
                                                                                // controller.selectedfrequencyId = controller.selectedItem?.frequency_id ?? 0;
                                                                              },
                                                                            ),
                                                                            TableActionButton(
                                                                              color: ColorValues.appRedColor,
                                                                              icon: Icons.delete,
                                                                              label: 'Delete',
                                                                              onPress: () {
                                                                                controller.selectedFacilityId = controller.facilityList.firstWhere((element) => "${element?.id}" == _permitTypeList[0]);
                                                                              },
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              // : Container()
                                                            ])
                                                          : Text(
                                                              value,
                                                            ));
                                            }).toList());
                                      }).toList(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .facilityTypeListPaginationController,
                                        builder: (context, value, child) {
                                          return Row(children: [
                                            Text(
                                                "${controller.facilityTypeListPaginationController.currentPage}  of ${controller.facilityTypeListPaginationController.pageCount}"),
                                            Row(children: [
                                              IconButton(
                                                onPressed: controller
                                                            .facilityTypeListPaginationController
                                                            .currentPage <=
                                                        1
                                                    ? null
                                                    : () {
                                                        controller
                                                            .facilityTypeListPaginationController
                                                            .previous();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  color: controller
                                                              .facilityTypeListPaginationController
                                                              .currentPage <=
                                                          1
                                                      ? Colors.black26
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: controller
                                                            .facilityTypeListPaginationController
                                                            .currentPage >=
                                                        controller
                                                            .facilityTypeListPaginationController
                                                            .pageCount
                                                    ? null
                                                    : () {
                                                        controller
                                                            .facilityTypeListPaginationController
                                                            .next();
                                                      },
                                                iconSize: 20,
                                                splashRadius: 20,
                                                icon: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: controller
                                                              .facilityTypeListPaginationController
                                                              .currentPage >=
                                                          controller
                                                              .facilityTypeListPaginationController
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
