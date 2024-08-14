import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../theme/dimens.dart';
import '../../edit_job_controller.dart';

import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditJobContentWeb extends StatefulWidget {
  EditJobContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<EditJobContentWeb> createState() => _EditJobContentWebState();
}

class _EditJobContentWebState extends State<EditJobContentWeb> {
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditJobController>(
        id: 'stock_Mangement',
        builder: (controller) {
          return Obx(
            () => SelectionArea(
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
                            final _flutterSecureStorage =
                                const FlutterSecureStorage();
                            _flutterSecureStorage.delete(key: "jobId");
                            Get.offNamed(Routes.breakdown);
                          },
                          child: Text(" / BREAKDOWN MAINTENANCE",
                              style: Styles.greyMediumLight12),
                        ),
                        InkWell(
                          onTap: () {
                            final _flutterSecureStorage =
                                const FlutterSecureStorage();
                            _flutterSecureStorage.delete(key: "jobId");
                            Get.offNamed(Routes.jobList);
                          },
                          child: Text(" / JOB LIST",
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / REASSIGN JOB", style: Styles.greyMediumLight12)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        // height: 700,
                        //   height: Get.height,
                        child: Card(
                          color: Color.fromARGB(255, 245, 248, 250),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "REASSIGN JOB",
                                        style: Styles.blackBold16,
                                      ),
                                      // ActionButton(
                                      //   icon: Icons.add,
                                      //   label: "Add New",
                                      //   onPressed: () {
                                      //     //  Get.offNamed(Routes.addUser);
                                      //   },
                                      //   color: ColorValues.greenlightColor,
                                      // ),
                                      Spacer()
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    margin: Dimens.edgeInsets20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IgnorePointer(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              //
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Job Title: '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
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
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.040,
                                                    child: Obx(
                                                      () => TextField(
                                                        style: GoogleFonts.lato(
                                                          textStyle: TextStyle(
                                                              fontSize: 16.0,
                                                              height: 1.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        controller: controller
                                                            .jobTitleCtrlr,
                                                        autofocus: false,
                                                        decoration:
                                                            InputDecoration(
                                                          fillColor: ColorValues
                                                              .whiteColor,
                                                          filled: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      5.0,
                                                                      10.0,
                                                                      5.0,
                                                                      10.0),
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
                                                                        5.0),
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .transparent),
                                                          ),
                                                          focusedErrorBorder:
                                                              controller
                                                                      .isJobTitleInvalid
                                                                      .value
                                                                  ? OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: ColorValues
                                                                            .redColorDark,
                                                                      ),
                                                                    )
                                                                  : InputBorder
                                                                      .none,
                                                          errorBorder: controller
                                                                  .isJobTitleInvalid
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
                                                                  .isJobTitleInvalid
                                                                  .value
                                                              ? "Required field"
                                                              : null,
                                                        ),
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              3) {
                                                            controller
                                                                .isJobTitleInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isJobTitleInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              // Dimens.boxHeight10,
                                              SizedBox(height: 10),
                                              IgnorePointer(
                                                child: Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Fault :'),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              227,
                                                              224,
                                                              224),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        234,
                                                                        234)
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 2,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .2),
                                                      child: Obx(
                                                        () =>
                                                            MultiSelectDialogField(
                                                          searchable: true,
                                                          initialValue: //
                                                              controller
                                                                  .selectedWorkTypeIdList
                                                                  .map((workTypeId) =>
                                                                      workTypeId) // Extract the IDs from the list of WorkTypeModel objects
                                                                  .toList(),
                                                          validator:
                                                              (selectedItems) {
                                                            if (controller
                                                                    .isWorkTypeSelected
                                                                    .value ==
                                                                false) {
                                                              return "Required field";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .always,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: controller
                                                                          .isWorkTypeSelected
                                                                          .value ==
                                                                      false
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          buttonIcon: Icon(Icons
                                                              .arrow_drop_down),
                                                          items: controller
                                                              .workTypeList
                                                              .map((workType) =>
                                                                  MultiSelectItem(
                                                                      workType
                                                                          ?.id,
                                                                      workType?.name ??
                                                                          ''))
                                                              .toList(),
                                                          onConfirm:
                                                              (selectedOptionsList) =>
                                                                  {
                                                            controller
                                                                .workTypesSelected(
                                                                    selectedOptionsList)
                                                          },
                                                          chipDisplay:
                                                              MultiSelectChipDisplay(),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Dimens.boxHeight10,
                                              SizedBox(height: 10),

                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Work Area / Equipments :'),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
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
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: Obx(
                                                      () =>
                                                          MultiSelectDialogField(
                                                        searchable: true,
                                                        initialValue: //
                                                            controller
                                                                .selectedWorkAreaIdList
                                                                .map((equipmentId) =>
                                                                    equipmentId) // Extract the IDs from the list of InventoryCategoryModel objects
                                                                .toList(),
                                                        validator:
                                                            (selectedItems) {
                                                          if (controller
                                                                  .isWorkAreaSelected
                                                                  .value ==
                                                              false) {
                                                            return "Required field";
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .always,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: controller
                                                                        .isWorkAreaSelected
                                                                        .value ==
                                                                    false
                                                                ? Colors.red
                                                                : Colors
                                                                    .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        buttonIcon: Icon(Icons
                                                            .arrow_drop_down),
                                                        items: controller
                                                            .workAreaList
                                                            .map(
                                                              (equipment) =>
                                                                  MultiSelectItem(
                                                                equipment?.id,
                                                                equipment
                                                                        ?.name ??
                                                                    '',
                                                              ),
                                                            )
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) =>
                                                                {
                                                          controller
                                                              .workAreasSelected(
                                                                  selectedOptionsList)
                                                        },
                                                        chipDisplay:
                                                            MultiSelectChipDisplay(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Dimens.boxHeight10,
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                    title:
                                                        'Tools Required For Fault :',
                                                    includeAsterisk: false,
                                                  ),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
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
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: Obx(
                                                      () =>
                                                          MultiSelectDialogField(
                                                        searchable: true,
                                                        // validator: (selectedItems) {
                                                        //   if (controller.isToolRequiredToWorkTypeSelected.value == false) {
                                                        //     return "Required field";
                                                        //   } else {
                                                        //     return null;
                                                        //   }
                                                        // },
                                                        initialValue: //
                                                            controller
                                                                .selectedtoolsRequiredToWorkTypeIdList
                                                                .map((toolId) =>
                                                                    toolId) // Extract the IDs from the list of InventoryCategoryModel objects
                                                                .toList(),
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .always,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                // con troller.isToolRequiredToWorkTypeSelected.value == false
                                                                //     ? Colors.red
                                                                //     :
                                                                Colors
                                                                    .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        buttonIcon: Icon(Icons
                                                            .arrow_drop_down),
                                                        items: controller
                                                            .toolsRequiredToWorkTypeList!
                                                            .map(
                                                              (linkedToolName) =>
                                                                  MultiSelectItem(
                                                                linkedToolName
                                                                    ?.id,
                                                                linkedToolName
                                                                        ?.linkedToolName ??
                                                                    '',
                                                              ),
                                                            )
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) =>
                                                                {
                                                          controller
                                                              .toolsRequiredSelected(
                                                                  selectedOptionsList)
                                                        },
                                                        chipDisplay:
                                                            MultiSelectChipDisplay(),
                                                      ),
                                                    ),

                                                    // DropdownWidget(
                                                    //   dropdownList: controller.toolsRequiredToWorkTypeList,
                                                    //   onValueChanged: controller.onDropdownValueChanged,
                                                    //   selectedValue: controller.selectedToolRequiredToWorkType.value,
                                                    // ),
                                                  ),
                                                ],
                                              ),
                                              // Dimens.boxHeight10,
                                              SizedBox(height: 10),

                                              // Dimens.boxHeight10,
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Breakdown Time: '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openbreaketimeDatePicker =
                                                          !controller
                                                              .openbreaketimeDatePicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController: controller
                                                        .breakdownTimeCtrlr,
                                                  ),
                                                ],
                                              ),

                                              // Dimens.boxHeight10,
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Select Block :'),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: Obx(
                                                    () => IgnorePointer(
                                                      child: DropdownWebWidget(
                                                        dropdownList: controller
                                                            .blockList,
                                                        isValueSelected:
                                                            controller
                                                                .isBlockSelected
                                                                .value,
                                                        selectedValue:
                                                            controller
                                                                .selectedBlock
                                                                .value,
                                                        onValueChanged: controller
                                                            .onDropdownValueChanged,
                                                        // focusNode: controller.focusNode,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight10,
                                            SizedBox(height: 10),

                                            ///
                                            IgnorePointer(
                                              child: Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Equipment Categories :'),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
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
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: Obx(
                                                      () =>
                                                          MultiSelectDialogField(
                                                        searchable: true,
                                                        initialValue: //
                                                            controller
                                                                .selectedEquipmentCategoryList
                                                                .map((equipmentCategory) =>
                                                                    equipmentCategory
                                                                        ?.id) // Extract the IDs from the list of InventoryCategoryModel objects
                                                                .toList(),
                                                        validator:
                                                            (selectedItems) {
                                                          if (controller
                                                                  .isEquipmentCategorySelected
                                                                  .value ==
                                                              false) {
                                                            return "Required field";
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .always,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: controller
                                                                        .isEquipmentCategorySelected
                                                                        .value ==
                                                                    false
                                                                ? Colors.red
                                                                : Colors
                                                                    .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        buttonIcon: Icon(Icons
                                                            .arrow_drop_down),
                                                        items: controller
                                                            .equipmentCategoryList
                                                            .map(
                                                              (equipmentCategory) =>
                                                                  MultiSelectItem(
                                                                equipmentCategory
                                                                    ?.id,
                                                                equipmentCategory
                                                                        ?.name ??
                                                                    '',
                                                              ),
                                                            )
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) =>
                                                                {
                                                          controller
                                                              .equipmentCategoriesSelected(
                                                                  selectedOptionsList)
                                                        },
                                                        chipDisplay:
                                                            MultiSelectChipDisplay(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Dimens.boxHeight10,
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Assigned To :'),
                                                // Dimens.boxWidth10,
                                                SizedBox(width: 10),
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
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .2),
                                                  child: DropdownWebWidget(
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .assignedToList,
                                                    isValueSelected: controller
                                                        .isAssignedToSelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedAssignedTo
                                                        .value,
                                                    onValueChanged: controller
                                                        .onDropdownValueChanged,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Dimens.boxHeight10,
                                            SizedBox(height: 10),
                                            IgnorePointer(
                                              child: Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Job Description: '),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
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
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: Obx(
                                                      () => TextField(
                                                        style: GoogleFonts.lato(
                                                          textStyle: TextStyle(
                                                              fontSize: 16.0,
                                                              height: 1.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        controller: controller
                                                            .jobDescriptionCtrlr,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        maxLines: 5,
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
                                                          focusedErrorBorder:
                                                              controller
                                                                      .isJobDescriptionInvalid
                                                                      .value
                                                                  ? OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: ColorValues
                                                                            .redColorDark,
                                                                      ),
                                                                    )
                                                                  : InputBorder
                                                                      .none,
                                                          errorBorder: controller
                                                                  .isJobDescriptionInvalid
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
                                                                  .isJobDescriptionInvalid
                                                                  .value
                                                              ? "Required field"
                                                              : null,
                                                        ),
                                                        onChanged: (value) {
                                                          if (value
                                                                  .trim()
                                                                  .length >
                                                              3) {
                                                            controller
                                                                .isJobDescriptionInvalid
                                                                .value = false;
                                                          } else {
                                                            controller
                                                                .isJobDescriptionInvalid
                                                                .value = true;
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Dimens.boxHeight10,
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                ///File Upload
                                //   SizedBox(
                                //   width: MediaQuery.of(context).size.width / 1.5,
                                //   child: Container(
                                //     height: Get.height * 0.2,
                                //     width: Get.width,
                                //     child: Row(
                                //         //
                                //         children: [
                                //           Expanded(
                                //             flex: 2,
                                //             child: FileUploadWidgetWithDropzone(),
                                //           ),
                                //           Dimens.boxWidth10,
                                //           Expanded(flex: 8, child: FileUploadDetailsWidgetWeb()),
                                //         ]),
                                //   ),
                                // ),
                                Center(
                                  child: CustomElevatedButton(
                                    text: 'Update',
                                    onPressed: controller.assignReAssignJob,
                                    backgroundColor:
                                        ColorValues.appDarkBlueColor,
                                  ),
                                ),
                                // Dimens.boxHeight20,
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (controller.openbreaketimeDatePicker)
                    Positioned(
                      left: 290,
                      top: 200,
                      child: DatePickerWidget(
                        showActionButtons: false,
                        minDate: DateTime(DateTime.now().year),
                        maxDate: DateTime(DateTime.now().year, 13,
                            0), // last date of this year
                        controller: DateRangePickerController(),
                        selectionChanges: (p0) {
                          print('po valu ${p0.value.toString()}');
                          controller.breakdownTimeCtrlr.text =
                              DateFormat('yyyy-MM-dd').format(p0.value);
                          controller.openbreaketimeDatePicker = false;

                          controller.update(['stock_Mangement']);
                        },
                        onCancel: () {
                          controller.openbreaketimeDatePicker = false;
                          controller.update(['stock_Mangement']);
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }
}
