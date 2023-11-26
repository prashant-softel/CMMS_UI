import 'package:cmms/app/app.dart';
import 'package:cmms/app/business_List/business_list_controller.dart';

import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class BusinessListContentWeb extends GetView<BusinessListController> {
  BusinessListContentWeb({Key? key}) : super(key: key);
  final BusinessListController controller = Get.find();

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
                      Get.offNamed(Routes.masterDashboard);
                    },
                    child: Text(" / MASTERS", style: Styles.greyLight14),
                  ),
                  Text(" / BUSINESS LIST", style: Styles.greyLight14)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: (Get.width * .30),
                    margin: EdgeInsets.only(left: 30, top: 30),
                    height: Get.height / 1,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              controller.selectedItem == null
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                                  dropdownList: controller
                                                      .businessCategoryList,
                                                  isValueSelected: controller
                                                      .isSelectedBusinessType
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedBusinessType
                                                      .value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
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
                                            child:
                                                CustomRichText(title: 'Name ')),
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
                                                  color: ColorValues.whiteColor,
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
                                            child: LoginCustomTextfield(
                                              // ishint:
                                              // 'Enter Description',
                                              textController: controller
                                                  .businesslistNumberCtrlr,
                                            )),
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
                                            child: LoginCustomTextfield(
                                              // ishint:
                                              // 'Enter Description',
                                              textController:
                                                  controller.emailCtrlr,
                                            )),
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
                                                title: 'Contact ')),
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                          child: TextField(
                                            controller:
                                                controller.contactpersonCtrlr,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 1,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              fillColor: ColorValues.whiteColor,
                                              filled: true,
                                              border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedErrorBorder: controller
                                                      .isPersonInvalid.value
                                                  ? OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                        color: ColorValues
                                                            .redColorDark,
                                                      ),
                                                    )
                                                  : InputBorder.none,
                                              errorBorder: controller
                                                      .isPersonInvalid.value
                                                  ? OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
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
                                              ),
                                            ],
                                            color: ColorValues.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .20),
                                          child: TextField(
                                            controller:
                                                controller.contactnumberCtrlr,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 1,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              fillColor: ColorValues.whiteColor,
                                              filled: true,
                                              contentPadding:
                                                  Dimens.edgeInsets05_10,
                                              border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedErrorBorder: controller
                                                      .isNumberInvalid.value
                                                  ? OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                        color: ColorValues
                                                            .redColorDark,
                                                      ),
                                                    )
                                                  : InputBorder.none,
                                              errorBorder: controller
                                                      .isNumberInvalid.value
                                                  ? OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
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
                                            child: CustomRichText(
                                                title: 'Website ')),
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                            child: LoginCustomTextfield(
                                              textController:
                                                  controller.websiteCtrlr,
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
                                          child: RichText(
                                            text: TextSpan(
                                                text: "Location",
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
                                                .20),
                                            child: LoginCustomTextfield(
                                              textController:
                                                  controller.locationCtrlr,
                                            )),
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
                                                text: "Address",
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                            child: LoginCustomTextfield(
                                              textController:
                                                  controller.addressCtrlr,
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
                                          child: RichText(
                                            text: TextSpan(
                                                text: "Country",
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                                  color: ColorValues.whiteColor,
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                              controller: controller,
                                              dropdownList:
                                                  controller.countryList,
                                              isValueSelected: controller
                                                  .isSelectedCountryType.value,
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
                                          child: RichText(
                                            text: TextSpan(
                                                text: "State",
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                                  color: ColorValues.whiteColor,
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                              controller: controller,
                                              dropdownList:
                                                  controller.stateList,
                                              isValueSelected: controller
                                                  .isSelectedStateType.value,
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
                                          child: RichText(
                                            text: TextSpan(
                                                text: "City",
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
                                              ),
                                            ],
                                            color: ColorValues.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                            controller: controller,
                                            dropdownList: controller.cityList,
                                            isValueSelected: controller
                                                .isSelectedCityType.value,
                                            selectedValue:
                                                controller.selectedCity.value,
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
                                          child: RichText(
                                            text: TextSpan(
                                                text: "Zip",
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                            child: LoginCustomTextfield(
                                              textController:
                                                  controller.zipCtrlr,
                                            ),
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
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .createBusinessListNumber()
                                                  .then((value) {
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatebusinesslist();
                                              });
                                            },
                                            text: 'Create Business ')
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            onPressed: () {
                                              controller
                                                  .updateBusinesslistNumber(
                                                      controller
                                                          .selectedItem?.id,
                                                      controller
                                                          .selectedItem?.status,
                                                      controller.selectedItem
                                                          ?.addedAt)
                                                  .then((value) {
                                                print("value,$value");
                                                if (value == true)
                                                  controller
                                                      .issuccessCreatebusinesslist();
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
                  Expanded(
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
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        height: 1.0,
                                        color: Colors.black,
                                      ),
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
                            ),

                            // Row(
                            //   children: [
                            //     Spacer(),

                            //   ],
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Obx(
                                () => DataTable2(
                                  key: UniqueKey(),
                                  dataRowHeight: 60,
                                  columnSpacing: 10,
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 206, 229, 234)),
                                  columns: [
                                    DataColumn2(
                                        fixedWidth: 45,
                                        label: Text(
                                          "Sr No",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 250,
                                        label: Text(
                                          "Name",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        // fixedWidth: 150,
                                        label: Text(
                                      "Email",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        // fixedWidth: 300,
                                        label: Text(
                                      "Contact Person",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          "Contact Number",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          "Website",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          "Location",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          "Address",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    DataColumn2(
                                        // fixedWidth: 150,
                                        label: Text(
                                      "City",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        // fixedWidth: 60,
                                        label: Text(
                                      "State",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        // fixedWidth: 60,
                                        label: Text(
                                      "Country",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        // fixedWidth: 60,
                                        label: Text(
                                      "Zip",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text(
                                          'Action',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                  rows: List<DataRow>.generate(
                                    controller.moduleList?.length ?? 0,
                                    (index) => DataRow(cells: [
                                      DataCell(Text((index + 1).toString())),
                                      DataCell(Text(
                                          controller.moduleList?[index]?.name ??
                                              '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.email ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]
                                              ?.contactPerson ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]
                                              ?.contactnumber ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.website
                                              .toString() ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.location
                                              .toString() ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.address
                                              .toString() ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.city
                                              .toString() ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.state
                                              .toString() ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.country
                                              .toString() ??
                                          '')),
                                      DataCell(Text(controller
                                              .moduleList?[index]?.zip
                                              .toString() ??
                                          '')),
                                      DataCell(Row(
                                        children: [
                                          TableActionButton(
                                              color: ColorValues.editColor,
                                              icon: Icons.edit,
                                              message: 'Edit',
                                              onPress: () {
                                                controller.selectedItem =
                                                    controller
                                                        .moduleList!
                                                        .firstWhere((element) =>
                                                            "${element!.id}" ==
                                                            controller
                                                                .moduleList?[
                                                                    index]
                                                                ?.id
                                                                .toString());

                                                controller.selectedCity.value =
                                                    controller.selectedItem
                                                            ?.city ??
                                                        '';
                                                controller.selectedState.value =
                                                    controller.selectedItem
                                                            ?.state ??
                                                        '';
                                                controller.selectedCountry
                                                    .value = controller
                                                        .selectedItem
                                                        ?.country ??
                                                    '';
                                              }),
                                          TableActionButton(
                                            color: ColorValues.deleteColor,
                                            icon: Icons.delete,
                                            message: 'Delete',
                                            onPress: () {
                                              controller.isDeleteDialog(
                                                  business_id: controller
                                                      .moduleList?[index]?.id
                                                      .toString(),
                                                  business: controller
                                                      .moduleList?[index]
                                                      ?.name);
                                            },
                                          ),
                                        ],
                                      )),
                                    ]),
                                  ),
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
    );
  }
}
