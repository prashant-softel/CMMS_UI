import 'package:cmms/app/add_training_course/add_course_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCourseWeb extends GetView<AddCourseController> {
  AddCourseWeb({Key? key}) : super(key: key);

  final HomeController homecontroller = Get.find();
  final FileUploadController dropzoneController = Get.put(
    FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            SelectionArea(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 450),
                margin: EdgeInsets.only(
                    left: homecontroller.menuButton.value ? 250.0 : 70.0),
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
                              Get.offNamed(Routes.trainingCourse);
                            },
                            child: Text(
                              " / TRAINING COURSE",
                              style: Styles.greyLight14,
                            ),
                          ),
                          Text(
                            " / ADD TRAINING COURSE",
                            style: Styles.greyLight14,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                          child: Card(
                            margin: Dimens.edgeInsets20,
                            color: ColorValues.cardColor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
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
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Container(
                                  margin: Dimens.edgeInsets40,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              CustomRichText(title: 'Course Name: '),
                                              Dimens.boxWidth10,
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
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: LoginCustomTextfield(
                                                  width: (Get.width * .2),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  maxLine: 1,
                                                  textController:
                                                      controller.topic,
                                                  focusNode:
                                                      controller.topicFocus,
                                                  scrollController:
                                                      controller.topicScroll,
                                                  errorController: controller
                                                          .isNameInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                  onChanged: (value) {
                                                    if (value.trim().length >
                                                        1) {
                                                      controller.isNameInvalid
                                                          .value = false;
                                                    } else {
                                                      controller.isNameInvalid
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
                                              CustomRichText(
                                                  title: "Category: "),
                                              Dimens.boxWidth10,
                                              Container(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 227, 224, 244),
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
                                                    )
                                                  ],
                                                ),
                                                child: Obx(
                                                  () => DropdownWebWidget(
                                                    dropdownList: controller
                                                        .courseCategory,
                                                    isValueSelected: controller
                                                        .isCategorySelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedCategory.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: "Targetted Group: "),
                                              Dimens.boxWidth10,
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 244),
                                                        width: 1),
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
                                                      )
                                                    ]),
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
                                                height: 30,
                                                child: Obx(
                                                  () => DropdownWebWidget(
                                                    dropdownList: controller
                                                        .targetedGroup,
                                                    isValueSelected: controller
                                                        .isGroupSelected.value,
                                                    selectedValue: controller
                                                        .selectedGroup.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              )
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
                                              CustomRichText(
                                                  title: 'Number Of Days: '),
                                              Dimens.boxWidth10,
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
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: LoginCustomTextfield(
                                                  width: (Get.width * .2),
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  maxLine: 1,
                                                  textController:
                                                      controller.noOfDays,
                                                  errorController: controller
                                                          .isCodeInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                  onChanged: (value) {
                                                    if (value.trim().length >
                                                        0) {
                                                      controller.isCodeInvalid
                                                          .value = false;
                                                    } else {
                                                      controller.isCodeInvalid
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
                                              CustomRichText(
                                                  title:
                                                      'Duration in Minutes: '),
                                              Dimens.boxWidth10,
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
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: LoginCustomTextfield(
                                                  width: (Get.width * .2),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  maxLine: 1,
                                                  textController:
                                                      controller.minutes,
                                                  errorController: controller
                                                          .isTimeInvalid.value
                                                      ? "Required field"
                                                      : null,
                                                  onChanged: (value) {
                                                    if (value.trim().length >
                                                        0) {
                                                      controller.isTimeInvalid
                                                          .value = false;
                                                    } else {
                                                      controller.isTimeInvalid
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
                                              CustomRichText(
                                                  title: 'Maximum Capacity: '),
                                              Dimens.boxWidth10,
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
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: LoginCustomTextfield(
                                                  width: (Get.width * .2),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                  maxLine: 1,
                                                  textController: controller
                                                      .maximumCapacity,
                                                  errorController: controller
                                                          .isMaxCapacityInvalid
                                                          .value
                                                      ? "Required field"
                                                      : null,
                                                  onChanged: (value) {
                                                    if (value.trim().length >
                                                        0) {
                                                      controller
                                                          .isMaxCapacityInvalid
                                                          .value = false;
                                                    } else {
                                                      controller
                                                          .isMaxCapacityInvalid
                                                          .value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Row(
                                        children: [
                                          CustomRichText(
                                              title: 'Description: '),
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
                                                  color: Color.fromARGB(
                                                          255, 236, 234, 234)
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
                                                .5),
                                            child: Obx(
                                              () => TextField(
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                    fontSize: 16.0,
                                                    height: 1.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                controller:
                                                    controller.descCtrlr,
                                                scrollController:
                                                    controller.descScroll,
                                                focusNode: controller.descFocus,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 4,
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    height:
                                        (dropzoneController.pickedFiles.length *
                                                50) +
                                            80,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    constraints: BoxConstraints(
                                      maxWidth: 1400,
                                      minHeight: 160,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: FileUploadWidgetWithDropzone(),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                          flex: 8,
                                          child: FileUploadDetailsWidgetWeb2(),
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
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 450),
              child: HomeDrawer(),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            controller.courseId.value == 0
                ? Container(
                    height: 35,
                    child: CustomElevatedButton(
                      backgroundColor: ColorValues.greenColor,
                      text: 'Submit',
                      onPressed: () {
                        controller.isFormInvalid.value = false;
                        controller.addCourse(
                            fileIds: dropzoneController.fileIds);
                      },
                    ),
                  )
                : Container(
                    height: 35,
                    child: CustomElevatedButton(
                      backgroundColor: ColorValues.appDarkBlueColor,
                      text: 'Update',
                      onPressed: () {
                        controller.isFormInvalid.value = false;
                        controller.updateCourse(
                            fileIds: dropzoneController.fileIds);
                        // Get.toNamed(Routes.trainingCourse);
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
            Spacer(),
          ],
        ),
      ),
    );
  }
}
