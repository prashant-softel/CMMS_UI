import 'package:cmms/app/add_training_course/add_course_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:cmms/app/grievance_list/views/widgets/dropdown.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class AddCourseWeb extends GetView<AddCourseController> {
  AddCourseWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return
        // Obx(
        //         () =>
        Container(
      color: Color.fromARGB(255, 234, 236, 238),
      width: Get.width,
      height: Get.height,
      child: Column(
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
                    Get.offNamed(Routes.misDashboard);
                  },
                  child: Text(" / MIS", style: Styles.greyLight14),
                ),
                InkWell(
                    onTap: () {
                      Get.offNamed(Routes.trainingCourse);
                    },
                    child:
                        Text(" / TRAINING COURSE", style: Styles.greyLight14)),
                Text(" / ADD TRAINING COURSE", style: Styles.greyLight14)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: Dimens.edgeInsets20,
                color: Color.fromARGB(255, 245, 248, 250),
                child: Column(
                  children: [
                    Container(
                      height: 60,
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Add Training Course",
                              style: Styles.blackBold18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Divider(
                    //   color: ColorValues.greyLightColour,
                    // ),
                    Container(
                      margin: Dimens.edgeInsets40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: Dimens.edgeInsets30_0_0_0,
                            child: Dimens.boxWidth30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomRichText(title: 'Topic: '),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
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
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: Obx(
                                      () => TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        controller: controller.topic,
                                        focusNode: controller.topicFocus,
                                        scrollController:
                                            controller.topicScroll,
                                        keyboardType: TextInputType.multiline,
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
                                                  .isCodeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : InputBorder.none,
                                          errorBorder: controller
                                                  .isCodeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : null,
                                          errorText:
                                              controller.isCodeInvalid.value
                                                  ? "Required field"
                                                  : null,
                                        ),
                                        onChanged: (value) {
                                          if (value.trim().length > 1) {
                                            controller.isCodeInvalid.value =
                                                false;
                                          } else {
                                            controller.isCodeInvalid.value =
                                                true;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  CustomRichText(title: "Category: "),
                                  Dimens.boxWidth10,
                                  Container(
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 244),
                                            width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          )
                                        ]),
                                    child: Obx(() => DropdownWebWidget(
                                          dropdownList: controller.category,
                                          isValueSelected: controller
                                              .isCategorySelected.value,
                                          selectedValue:
                                              controller.selectedCategory.value,
                                          onValueChanged:
                                              (category, selectedV) {},
                                        )),
                                  )
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  CustomRichText(title: "Targetted Group: "),
                                  Dimens.boxWidth10,
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 244),
                                            width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          )
                                        ]),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    height: 40,
                                    child: Obx(() => DropdownWebWidget(
                                          dropdownList: controller.targetGroup,
                                          isValueSelected:
                                              controller.isGroupSelected.value,
                                          selectedValue:
                                              controller.selectedGroup.value,
                                          onValueChanged:
                                              (category, selectedV) {},
                                        )),
                                  )
                                ],
                              ),
                              Dimens.boxHeight10,
                            ],
                          ),
                          // SizedBox(
                          //   width: 250,
                          // ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomRichText(
                                      title: 'Duration in Minutes: '),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
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
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: Obx(
                                      () => TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        controller: controller.minutes,
                                        keyboardType: TextInputType.number,
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
                                                  .isCodeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : InputBorder.none,
                                          errorBorder: controller
                                                  .isCodeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : null,
                                          errorText:
                                              controller.isCodeInvalid.value
                                                  ? "Required field"
                                                  : null,
                                        ),
                                        onChanged: (value) {
                                          if (value.trim().length > 1 ||
                                              int.tryParse(value) == null) {
                                            controller.isCodeInvalid.value =
                                                false;
                                          } else {
                                            controller.isCodeInvalid.value =
                                                true;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  CustomRichText(title: 'Maximum Capacity: '),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
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
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: Obx(
                                      () => TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        controller: controller.maximumCapacity,
                                        keyboardType: TextInputType.number,
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
                                                  .isTimeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : InputBorder.none,
                                          errorBorder: controller
                                                  .isTimeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : null,
                                          errorText:
                                              controller.isTimeInvalid.value
                                                  ? "Required field"
                                                  : null,
                                        ),
                                        onChanged: (value) {
                                          if (value.trim().length >= 1) {
                                            controller.isTimeInvalid.value =
                                                false;
                                          } else {
                                            controller.isTimeInvalid.value =
                                                true;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [SizedBox(height: 60)],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Dimens.edgeInsets20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: Dimens.edgeInsets30_0_0_0,
                            child: Dimens.boxWidth30,
                          ),
                          Container(
                            margin: Dimens.edgeInsets10,
                            child: Row(
                              children: [
                                CustomRichText(title: 'Description: '),
                                Dimens.boxWidth10,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 236, 234, 234)
                                                .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  width:
                                      (MediaQuery.of(context).size.width * .5),
                                  child: Obx(
                                    () => TextField(
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 16.0,
                                            height: 1.0,
                                            color: Colors.black),
                                      ),
                                      controller: controller.descCtrlr,
                                      scrollController: controller.descScroll,
                                      focusNode: controller.descFocus,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 8,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        fillColor: ColorValues.whiteColor,
                                        filled: true,
                                        contentPadding: Dimens.edgeInsets05_10,
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
                                                .isDescriptionInvalid.value
                                            ? OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorValues.redColorDark,
                                                ),
                                              )
                                            : InputBorder.none,
                                        errorBorder: controller
                                                .isDescriptionInvalid.value
                                            ? OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorValues.redColorDark,
                                                ),
                                              )
                                            : null,
                                        errorText: controller
                                                .isDescriptionInvalid.value
                                            ? "Required field"
                                            : null,
                                      ),
                                      onChanged: (value) {
                                        if (value.trim().length >= 1) {
                                          controller.isDescriptionInvalid
                                              .value = false;
                                        } else {
                                          controller.isDescriptionInvalid
                                              .value = true;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.userId == 0
                                ? Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.greenColor,
                                      text: 'Submit',
                                      onPressed: () {
                                        // controller.addCourse().then((value) {
                                        //   print("value,$value");
                                        //   if (value == true)
                                        //     controller
                                        //         .issuccessCreateAssetlist();
                                        // }); //  controller.saveAccessLevel();
                                      },
                                    ),
                                  )
                                : Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appDarkBlueColor,
                                      text: 'Update',
                                      onPressed: () {
                                        // controller.updateCourse().then((value) {
                                        //   if (value == true) {
                                        //     // controller.userId = 0;
                                        //     controller.saveAccessLevel();
                                        //     //   controller.saveNotification();
                                        //   }
                                        // });
                                        //  controller.saveAccessLevel();
                                      },
                                    ),
                                  ),
                            Dimens.boxWidth20,
                            Container(
                              height: 35,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.redColor,
                                text: "Cancel",
                                onPressed: () {
                                  controller.cleardata();
                                  Get.back();
                                },
                              ),
                            ),
                          ],
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
    );
    // );
  }
}


// Row(
                              //   children: [
                              //     CustomRichText(title: 'Category: '),
                              //     Dimens.boxWidth10,
                              //     Container(
                              //       width: (MediaQuery.of(context).size.width *
                              //           .2),
                              //       // height : 100,

                              //       child: Obx(
                              //         () => DropdownWebWidget(
                              //           boxShadow: [
                              //             BoxShadow(
                              //               color: Colors.black26,
                              //               offset: const Offset(
                              //                 5.0,
                              //                 5.0,
                              //               ),
                              //               blurRadius: 5.0,
                              //               spreadRadius: 1.0,
                              //             ),
                              //             BoxShadow(
                              //               color: ColorValues.whiteColor,
                              //               offset: const Offset(0.0, 0.0),
                              //               blurRadius: 0.0,
                              //               spreadRadius: 0.0,
                              //             ),
                              //           ],
                              //           controller: controller,
                              //           dropdownList: controller.category,
                              //           // isValueSelected: controller
                              //           //     .isSelectedMaterialType.value,
                              //           selectedValue: controller
                              //               .selectedMaterialType.value,
                              //           onValueChanged:
                              //               (category, selectedValue) {},
                              //           // controller.onValueChanged,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),


                              // Row(
                              //   children: [
                              //     CustomRichText(title: 'Targetted Group: '),
                              //     Dimens.boxWidth10,
                              //     Container(
                              //       width: (MediaQuery.of(context).size.width *
                              //           .2),
                              //       child: Obx(
                              //         () => DropdownWebWidget(
                              //           boxShadow: [
                              //             BoxShadow(
                              //               color: Colors.black26,
                              //               offset: const Offset(
                              //                 5.0,
                              //                 5.0,
                              //               ),
                              //               blurRadius: 5.0,
                              //               spreadRadius: 1.0,
                              //             ),
                              //             BoxShadow(
                              //               color: ColorValues.whiteColor,
                              //               offset: const Offset(0.0, 0.0),
                              //               blurRadius: 0.0,
                              //               spreadRadius: 0.0,
                              //             ),
                              //           ],
                              //           controller: controller,
                              //           dropdownList: controller.targetGroup,
                              //           // isValueSelected: controller
                              //           //     .isSelectedUnitOfMeasurement.value,
                              //           // selectedValue: controller
                              //           //     .selectedUnitOfMeasurement.value,
                              //           onValueChanged:
                              //               (targettedGroup, selctedValue) {},
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),