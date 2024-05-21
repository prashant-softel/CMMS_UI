import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/body_custom_app_bar.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';

import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../theme/dimens.dart';
import '../../add_job_controller.dart';

class AddJobContentWeb extends StatefulWidget {
  AddJobContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddJobContentWeb> createState() => _AddJobContentWebState();
}

class _AddJobContentWebState extends State<AddJobContentWeb> {
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddJobController>(
        id: 'stock_Mangement',
        builder: (controller) {
          return Obx(
            () => SelectionArea(
              child: SingleChildScrollView(
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
                              Get.offAllNamed(Routes.breakdown);
                            },
                            child: Text(" / BREAKDOWN MAINTENANCE",
                                style: Styles.greyLight14),
                          ),
                          Text(" / ADD NEW JOB", style: Styles.greyLight14)
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Card(
                          color: Color.fromARGB(255, 237, 240, 242),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Add NEW JOB",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer()
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                // margin: Dimens.edgeInsets20,
                                child: Column(
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            //
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Job Title: '),
                                                Dimens.boxWidth10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                                  height: MediaQuery.of(context)
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
                                                      focusNode: controller
                                                          .jobNameFocus,
                                                      scrollController:
                                                          controller
                                                              .jobNameScroll,
                                                      autofocus: false,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: ColorValues
                                                            .whiteColor,
                                                        filled: true,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
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
                                                                      5.0),
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
                                                        focusedErrorBorder: controller
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
                                                            : InputBorder.none,
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
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .deny(
                                                          RegExp('[\'^]'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Equipment Categories :'),
                                                Dimens.boxWidth10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorValues.whiteColor,
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
                                                    () =>
                                                        MultiSelectDialogField(
                                                      dialogWidth: 300,
                                                      dialogHeight: 400,
                                                      searchable: true,
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
                                                      decoration: BoxDecoration(
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
                                                            (equipCat) =>
                                                                MultiSelectItem<
                                                                    InventoryCategoryModel?>(
                                                              equipCat,
                                                              equipCat?.name ??
                                                                  '',
                                                            ),
                                                          )
                                                          .toList(),
                                                      onConfirm:
                                                          (selectedOptionsList) =>
                                                              {
                                                        controller
                                                            .equipmentCategoriesSelected(
                                                                selectedOptionsList),
                                                        controller
                                                                .isEquipmentCategorySelected
                                                                .value =
                                                            selectedOptionsList
                                                                .isNotEmpty,
                                                      },
                                                      chipDisplay:
                                                          MultiSelectChipDisplay(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Dimens.boxHeight10,

                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Work Area / Equipments :'),
                                                Dimens.boxWidth10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorValues.whiteColor,
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
                                                    () => SizedBox(
                                                      // height:
                                                      //     MediaQuery.of(context).size.height *
                                                      //         0.040,
                                                      child:
                                                          MultiSelectDialogField(
                                                        dialogWidth: 300,
                                                        dialogHeight: 400,
                                                        searchable: true,
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
                                                            .map((e) =>
                                                                MultiSelectItem(
                                                                    e,
                                                                    e?.name ??
                                                                        ''))
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) =>
                                                                {
                                                          controller
                                                              .workAreasSelected(
                                                                  selectedOptionsList),
                                                          controller
                                                                  .isWorkAreaSelected
                                                                  .value =
                                                              selectedOptionsList
                                                                  .isNotEmpty,
                                                        },
                                                        chipDisplay:
                                                            MultiSelectChipDisplay(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Breakdown Time: '),
                                                Dimens.boxWidth10,
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
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
                                                      ), //BoxShadow
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .whiteColor,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ), //BoxShadow
                                                    ],
                                                    color:
                                                        ColorValues.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: TextField(
                                                    style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          fontSize: 16.0,
                                                          height: 1.0,
                                                          color: Colors.black),
                                                    ),
                                                    onTap: () {
                                                      controller.pickDateTime(
                                                          context);
                                                    },
                                                    controller: controller
                                                        .breakdownTimeCtrlr,
                                                    autofocus: false,
                                                    readOnly: true,
                                                    decoration: InputDecoration(
                                                      fillColor: ColorValues
                                                          .whiteColor,
                                                      filled: true,
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              5.0,
                                                              10.0,
                                                              5.0,
                                                              10.0),
                                                      border: InputBorder.none,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                    ),
                                                    onChanged: (value) {},
                                                  ),
                                                ),

                                                // CustomTextFieldForStock(
                                                //   width: MediaQuery.of(context)
                                                //           .size
                                                //           .width /
                                                //       5,
                                                //   numberTextField: true,
                                                //   onTap: () {
                                                //     controller
                                                //             .openbreaketimeDatePicker =
                                                //         !controller
                                                //             .openbreaketimeDatePicker;
                                                //     controller.update(
                                                //         ['stock_Mangement']);
                                                //   },
                                                //   textController: controller
                                                //       .breakdownTimeCtrlr,
                                                // ),
                                              ],
                                            ),

                                            //  Dimens.boxHeight10,
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            ///
                                            //   Dimens.boxHeight10,

                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Select Block :'),
                                                Dimens.boxWidth10,
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
                                                    () => DropdownWebWidget(
                                                      dropdownList:
                                                          controller.blockList,
                                                      isValueSelected:
                                                          controller
                                                              .isBlockSelected
                                                              .value,
                                                      selectedValue: controller
                                                          .selectedBlock.value,
                                                      onValueChanged: controller
                                                          .onDropdownValueChanged,
                                                      // focusNode: controller.focusNode,
                                                    ),

                                                    // MultiSelectDialogField(
                                                    //   dialogWidth: 300,
                                                    //   dialogHeight: 400,
                                                    //   searchable: true,
                                                    //   validator: (selectedItems) {
                                                    //     if (controller.isBlockSelected.value == false) {
                                                    //       return "Required field";
                                                    //     } else {
                                                    //       return null;
                                                    //     }
                                                    //   },
                                                    //   autovalidateMode: AutovalidateMode.always,
                                                    //   decoration: BoxDecoration(
                                                    //     border: Border.all(
                                                    //       color: controller.isBlockSelected.value == false ? Colors.red : Colors.transparent,
                                                    //       width: 1.0,
                                                    //     ),
                                                    //     borderRadius: BorderRadius.circular(5),
                                                    //   ),
                                                    //   buttonIcon: Icon(Icons.arrow_drop_down),
                                                    //   items: controller.blockList.map((e) => MultiSelectItem<BlockModel>(e!, e.name ?? '')).toList(),
                                                    //   onConfirm: (selectedOptionsList) => {
                                                    //     controller.blockSelected(selectedOptionsList),
                                                    //     controller.isBlockSelected.value = selectedOptionsList.isNotEmpty,
                                                    //   },
                                                    //   chipDisplay: MultiSelectChipDisplay(),
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: 'Fault :'),
                                                Dimens.boxWidth10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorValues.whiteColor,
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
                                                    () =>
                                                        MultiSelectDialogField(
                                                      dialogWidth: 300,
                                                      dialogHeight: 400,
                                                      searchable: true,
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
                                                      decoration: BoxDecoration(
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
                                                                .circular(5),
                                                      ),
                                                      buttonIcon: Icon(Icons
                                                          .arrow_drop_down),
                                                      items: controller
                                                          .workTypeList
                                                          .map((e) =>
                                                              MultiSelectItem(
                                                                  e,
                                                                  e?.name ??
                                                                      ''))
                                                          .toList(),
                                                      onConfirm:
                                                          (selectedOptionsList) =>
                                                              {
                                                        controller
                                                            .workTypesSelected(
                                                                selectedOptionsList),
                                                        controller
                                                                .isWorkTypeSelected
                                                                .value =
                                                            selectedOptionsList
                                                                .isNotEmpty,
                                                      },
                                                      chipDisplay:
                                                          MultiSelectChipDisplay(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              children: [
                                                CustomRichText(
                                                  title:
                                                      'Tools Required For Error :',
                                                  includeAsterisk:
                                                      false, // Explicitly exclude the asterisk
                                                ),
                                                Dimens.boxWidth10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorValues.whiteColor,
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
                                                  child: MultiSelectDialogField(
                                                    dialogWidth: 300,
                                                    dialogHeight: 400,
                                                    searchable: true,
                                                    // validator: (selectedItems) {
                                                    //   if (controller.isToolRequiredToWorkTypeSelected.value == false) {
                                                    //     return "Required field";
                                                    //   } else {
                                                    //     return null;
                                                    //   }
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode.always,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            //     controller.isToolRequiredToWorkTypeSelected.value == false
                                                            //         ? Colors.red
                                                            //         :
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    buttonIcon: Icon(
                                                        Icons.arrow_drop_down),
                                                    initialValue: controller
                                                        .toolsRequiredToWorkTypeList
                                                        .toList(), // Select all items initially

                                                    items: controller
                                                        .toolsRequiredToWorkTypeList
                                                        .map((e) => MultiSelectItem(
                                                            e,
                                                            e?.linkedToolName ??
                                                                ''))
                                                        .toList(),

                                                    onConfirm:
                                                        (selectedOptionsList) =>
                                                            {
                                                      controller
                                                          .toolsRequiredSelected(
                                                              selectedOptionsList),
                                                      controller
                                                              .isToolRequiredToWorkTypeSelected
                                                              .value =
                                                          selectedOptionsList
                                                              .isNotEmpty,
                                                    },
                                                    chipDisplay:
                                                        MultiSelectChipDisplay(),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            // Dimens.boxHeight10,
                                            // Row(
                                            //   children: [
                                            //     CustomRichText(
                                            //         title: 'Assigned To :'),
                                            //     Dimens.boxWidth10,
                                            //     Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(10),
                                            //         border: Border.all(
                                            //           color: Color.fromARGB(
                                            //               255, 227, 224, 224),
                                            //           width: 1,
                                            //         ),
                                            //         boxShadow: [
                                            //           BoxShadow(
                                            //             color: Color.fromARGB(
                                            //                     255, 236, 234, 234)
                                            //                 .withOpacity(0.5),
                                            //             spreadRadius: 2,
                                            //             blurRadius: 5,
                                            //             offset: Offset(0, 2),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       width: (MediaQuery.of(context)
                                            //               .size
                                            //               .width *
                                            //           .2),
                                            //       child: DropdownWebWidget(
                                            //         controller: controller,
                                            //         dropdownList:
                                            //             controller.assignedToList,
                                            //         isValueSelected: controller
                                            //             .isAssignedToSelected.value,
                                            //         selectedValue: controller
                                            //             .selectedAssignedTo.value,
                                            //         onValueChanged: controller
                                            //             .onDropdownValueChanged,
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            // Dimens.boxHeight10,

                                            Dimens.boxHeight10,
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    Dimens.boxHeight15,
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 20,
                                          ),
                                          child: CustomRichText(
                                              title: 'Job Description: '),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              right: 110,
                                            ),
                                            child: Container(
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
                                                  .width),
                                              child: Obx(
                                                () => TextField(
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontSize: 16.0,
                                                        height: 1.0,
                                                        color: Colors.black),
                                                  ),
                                                  controller: controller
                                                      .jobDescriptionCtrlr,
                                                  focusNode:
                                                      controller.descFocus,
                                                  scrollController:
                                                      controller.descScroll,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: 5,
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
                                                    focusedErrorBorder: controller
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
                                                        : InputBorder.none,
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
                                                    if (value.trim().length >
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              ///File Upload
                              Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: SizedBox(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Container(
                                      margin: Dimens.edgeInsets16,
                                      height: Get.height,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(.3)),
                                      ),
                                      constraints: BoxConstraints(
                                        maxWidth: 1100,
                                      ),
                                      child: Column(
                                        children: [
                                          CustomAppBar(
                                            title: 'File Attach Here'.tr,
                                          ),
                                          Dimens.boxHeight10,
                                          Wrap(
                                            children: [
                                              Column(
                                                children: [
                                                  /// FILE UPLOAD WIDGET
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Container(
                                                      height: Get.height * 0.2,
                                                      width: Get.width,
                                                      child: Row(
                                                          //
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  FileUploadWidgetWithDropzone(),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            Expanded(
                                                                flex: 8,
                                                                child:
                                                                    FileUploadDetailsWidgetWeb()),
                                                          ]),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Center(
                                child: CustomElevatedButton(
                                  text: 'Submit',
                                  onPressed: () => controller.saveJob(
                                      fileIds: dropzoneController.fileIds),
                                  backgroundColor: ColorValues.appDarkBlueColor,
                                ),
                              ),
                              Dimens.boxHeight20,
                            ],
                          ),
                        ),
                        if (controller.openbreaketimeDatePicker)
                          Positioned(
                            right: 120,
                            top: 250,
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
                                controller.openbreaketimeDatePicker =
                                    !controller.openbreaketimeDatePicker;
                                controller.update(['stock_Mangement']);
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
