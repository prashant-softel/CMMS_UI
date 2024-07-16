import 'package:cmms/app/controllers/affected_parts_upload_controller.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/affected_part_detail_widget.dart';
import 'package:cmms/app/widgets/affected_part_dropzone.dart';
import 'package:cmms/app/widgets/body_custom_app_bar.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
// import 'package:cmms/app/widgets/table_action_button.dart';
// import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';

class CreateWarrantyClaimWeb extends GetView<WarrantyClaimController> {
  CreateWarrantyClaimWeb({Key? key}) : super(key: key);
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  final AffectedPartUploadController affectedPartController =
      Get.put(AffectedPartUploadController());
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarrantyClaimController>(
      id: "create-warranty-claim",
      builder: ((controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                      left: homecontroller.menuButton.value ? 250.0 : 70.0),
                  width: Get.width,
                  height: Get.height,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
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
                                      Get.offNamed(
                                        Routes.warrantyClaimList,
                                      );
                                    },
                                    child: Text(
                                      " / Warranty Claim List",
                                      style: Styles.greyLight14,
                                    ),
                                  ),
                                  Text(
                                    " / Add Warranty Claim",
                                    style: Styles.greyLight14,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ScrollConfiguration(
                                behavior:
                                    ScrollConfiguration.of(context).copyWith(
                                  scrollbars: false,
                                ),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: Get.width * 7,
                                    margin: EdgeInsets.all(15),
                                    child: Card(
                                      color: ColorValues.cardColor,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Text(
                                              "New Warranty Claim",
                                              style: Styles.blackBold14,
                                            ),
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          Dimens.boxHeight10,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                      title:
                                                          'Warranty Claim Title: ',
                                                    ),
                                                    Dimens.boxWidth10,
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child:
                                                          LoginCustomTextfield(
                                                        width:
                                                            (Get.width * 0.3),
                                                        keyboardType:
                                                            TextInputType.text,
                                                        maxLine: 1,
                                                        textController: controller
                                                            .warrantyClaimTitleTextController,
                                                        focusNode: controller
                                                            .wtitleFocus,
                                                        scrollController:
                                                            controller
                                                                .wtitleScroll,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight15,
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                      title:
                                                          'Warranty Brief Description: ',
                                                    ),
                                                    Dimens.boxWidth10,
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                              5.0,
                                                              5.0,
                                                            ),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child:
                                                          LoginCustomTextfield(
                                                        width:
                                                            (Get.width * 0.3),
                                                        keyboardType:
                                                            TextInputType.text,
                                                        maxLine: 3,
                                                        textController: controller
                                                            .warrantyClaimBriefDescTextController,
                                                        focusNode: controller
                                                            .wdescFocus,
                                                        scrollController:
                                                            controller
                                                                .wdescScroll,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight15,
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title:
                                                            'Equipment Categories: '),
                                                    SizedBox(
                                                      width: 27,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4.2,
                                                      child: DropdownWebWidget(
                                                        dropdownList: controller
                                                            .equipmentCategoryList,
                                                        isValueSelected: controller
                                                            .isEquipmentCategorySelected
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedEquipmentCategory
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 55,
                                                    ),
                                                    CustomRichText(
                                                        title:
                                                            'Equipment Name: '),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4.2,
                                                      child: DropdownWebWidget(
                                                        dropdownList: controller
                                                            .eqipmentNameList,
                                                        isValueSelected: controller
                                                            .isEquipmentNameSelected
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedEquipmentName
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: Dimens.edgeInsets20,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: ColorValues
                                                          .lightGreyColorWithOpacity35,
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: ColorValues
                                                            .appBlueBackgroundColor,
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Select Affected Part ",
                                                        style: Styles.blue700,
                                                      ),
                                                      Container(
                                                        height:
                                                            Get.height * 0.2,
                                                        width: Get.width,
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                  AffectedPartDropzone(),
                                                            ),
                                                            Dimens.boxWidth5,
                                                            Expanded(
                                                              flex: 8,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            15),
                                                                child:
                                                                    AffectedPartWidgetWeb(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Dimens.boxHeight10,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: 50,
                                                          bottom: 130,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Failure Date & Time: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    maxLine: 1,
                                                                    textController:
                                                                        controller
                                                                            .failureDateTimeCtrlrWeb,
                                                                    widget:
                                                                        Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                    ),
                                                                    ontap: () {
                                                                      pickFailureDateTime_web(
                                                                          context);
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Approximate Daily Loss: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    maxLine: 1,
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
                                                                    textController:
                                                                        controller
                                                                            .approxdailylosstxtcontroller,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Applied At: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    widget:
                                                                        Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                    ),
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    maxLine: 1,
                                                                    ontap: () {
                                                                      pickcurrentStartDate_web(
                                                                          context);
                                                                    },
                                                                    textController:
                                                                        controller
                                                                            .currentStartDateCtrlrWeb,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            IgnorePointer(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Affected Sr.No.: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      ishint:
                                                                          "${controller.inventoryDetailsModel.value?.serialNumber}",
                                                                      textController:
                                                                          controller
                                                                              .affectedSerialNoTextController,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Dimens.boxHeight10,
                                                            IgnorePointer(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Manufacturer Name: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      ishint:
                                                                          '${controller.inventoryDetailsModel.value?.manufacturerName}',
                                                                      textController:
                                                                          controller
                                                                              .manufacturerNameTextController,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Contract Reference No.: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    maxLine: 1,
                                                                    textController:
                                                                        controller
                                                                            .orderReferenceNoTextController,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Warranty Start Date: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    maxLine: 1,
                                                                    widget:
                                                                        Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                    ),
                                                                    ontap: () {
                                                                      pickWarrantyStartDateTime_web(
                                                                          context);
                                                                    },
                                                                    textController:
                                                                        controller
                                                                            .warrantyStartDateTimeCtrlrWeb,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Warranty End Date: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    maxLine: 1,
                                                                    widget: Icon(
                                                                        Icons
                                                                            .calendar_month),
                                                                    ontap: () {
                                                                      pickWarrantyEndDateTime_web(
                                                                          context);
                                                                    },
                                                                    textController:
                                                                        controller
                                                                            .warrantyEndDateTimeCtrlrWeb,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Cost of Replacement: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    maxLine: 1,
                                                                    ishint:
                                                                        '${controller.inventoryDetailsModel.value?.cost}',
                                                                    textController:
                                                                        controller
                                                                            .costOfReplacementTextController,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Immediate Corrective Action by Buyer: ',
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black26,
                                                                        offset:
                                                                            const Offset(
                                                                          5.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            5.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                    color: ColorValues
                                                                        .whiteColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      LoginCustomTextfield(
                                                                    width: (Get
                                                                            .width *
                                                                        0.15),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    maxLine: 1,
                                                                    textController:
                                                                        controller
                                                                            .immediateCorrectiveActionTextController,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Dimens.boxHeight10,
                                                            IgnorePointer(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Request to Warrenty Provider: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      ishint:
                                                                          '${controller.inventoryDetailsModel.value?.supplierName}',
                                                                      textController:
                                                                          controller
                                                                              .requestManufactureTextController,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            // Dimens.boxHeight90,
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Dimens.boxWidth10,
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                title:
                                                                    'Severity: ',
                                                              ),
                                                              Row(
                                                                children: [
                                                                  buildRadioButton(
                                                                      'Critical',
                                                                      Colors
                                                                          .red,
                                                                      context),
                                                                  buildRadioButton(
                                                                      'High',
                                                                      Colors
                                                                          .orange,
                                                                      context),
                                                                  buildRadioButton(
                                                                      'Medium',
                                                                      Colors
                                                                          .yellow,
                                                                      context),
                                                                  buildRadioButton(
                                                                      'Low',
                                                                      Colors
                                                                          .green,
                                                                      context),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight10,
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Select Currency Unit: '),
                                                              Dimens.boxWidth5,
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    6.3,
                                                                child: Obx(
                                                                  () =>
                                                                      DropdownWebWidget(
                                                                    dropdownList:
                                                                        controller
                                                                            .unitCurrencyList,
                                                                    isValueSelected:
                                                                        controller
                                                                            .isUnitCurrencySelected
                                                                            .value,
                                                                    selectedValue:
                                                                        controller
                                                                            .selectedUnitCurrency
                                                                            .value,
                                                                    onValueChanged:
                                                                        controller
                                                                            .onValueChanged,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 500,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.2,
                                                            child: Center(
                                                              child: Container(
                                                                margin: Dimens
                                                                    .edgeInsets16,
                                                                height:
                                                                    Get.height,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              .3)),
                                                                ),
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      1100,
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Obx(
                                                                    () =>
                                                                        Column(
                                                                      children: [
                                                                        CustomAppBar(
                                                                          title:
                                                                              'Additional Emails'.tr,
                                                                        ),
                                                                        Dimens
                                                                            .boxHeight10,
                                                                        Wrap(
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width / 1.5,
                                                                                  child: DefaultTabController(
                                                                                    length: 2,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(1.0),
                                                                                          child: Container(
                                                                                            height: 45,
                                                                                            decoration: BoxDecoration(
                                                                                              border: Border.all(color: Colors.grey),
                                                                                              color: Colors.white,
                                                                                              borderRadius: BorderRadius.circular(1),
                                                                                            ),
                                                                                            child: TabBar(
                                                                                              labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                                                              labelColor: Colors.black,
                                                                                              indicator: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(1)),
                                                                                              unselectedLabelColor: Colors.black,
                                                                                              tabs: [
                                                                                                Tab(
                                                                                                  child: Text('Employee'),
                                                                                                ),
                                                                                                Tab(
                                                                                                  child: Text(
                                                                                                    'External Emails',
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          height: 250,
                                                                                          width: MediaQuery.of(context).size.width / 2,
                                                                                          child: TabBarView(
                                                                                            children: [
                                                                                              Container(
                                                                                                  child: Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  SizedBox(
                                                                                                    height: 15,
                                                                                                  ),
                                                                                                  emailDropdown(
                                                                                                    context,
                                                                                                    'Select Employees',
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    height: 10,
                                                                                                  ),
                                                                                                ],
                                                                                              )),
                                                                                              SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      height: 10,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          width: 75,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Name',
                                                                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                        ),
                                                                                                        Dimens.boxWidth15,
                                                                                                        Text(
                                                                                                          'Email',
                                                                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                        ),
                                                                                                        Dimens.boxWidth15,
                                                                                                        Text(
                                                                                                          'Email',
                                                                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                        ),
                                                                                                        Dimens.boxWidth15,
                                                                                                        Text(
                                                                                                          'Mobile',
                                                                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: 10,
                                                                                                    ),
                                                                                                    Column(
                                                                                                        children: []..addAll(controller.externalEmails.map((data) => Row(
                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                              children: [
                                                                                                                SizedBox(
                                                                                                                  width: 75,
                                                                                                                ),
                                                                                                                SizedBox(width: 100, child: Text('${data.name}')),
                                                                                                                SizedBox(width: 200, child: Text('${data.email}')),
                                                                                                                SizedBox(width: 100, child: Text('${data.role}')),
                                                                                                                SizedBox(width: 100, child: Text('${data.mobile}')),
                                                                                                              ],
                                                                                                            )))),
                                                                                                    Dimens.boxHeight10,
                                                                                                    SizedBox(
                                                                                                        width: MediaQuery.of(context).size.width / 3,
                                                                                                        child: Row(
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              ' Name: ',
                                                                                                              style: Styles.black14,
                                                                                                            ),
                                                                                                            Container(
                                                                                                              decoration: BoxDecoration(
                                                                                                                  border: Border.all(
                                                                                                                color: Color(0xFE50000),
                                                                                                                width: 0.5,
                                                                                                              )),
                                                                                                              height: MediaQuery.of(context).size.height * 0.040,
                                                                                                              // margin: Dimens.edgeInsets5,
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                                minWidth: 100,
                                                                                                              ),
                                                                                                              child: LoginCustomTextfield(
                                                                                                                textController: controller.nameTextFieldController,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      width: MediaQuery.of(context).size.width / 3,
                                                                                                      child: Row(
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            '  Email: ',
                                                                                                            style: Styles.black14,
                                                                                                          ),
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                                border: Border.all(
                                                                                                              color: Color(0xFE50000),
                                                                                                              width: 0.5,
                                                                                                            )),
                                                                                                            height: MediaQuery.of(context).size.height * 0.040,
                                                                                                            // margin: Dimens.edgeInsets5,
                                                                                                            constraints: BoxConstraints(
                                                                                                              maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                              minWidth: 100,
                                                                                                            ),
                                                                                                            child: LoginCustomTextfield(
                                                                                                              textController: controller.emailTextFieldController,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      width: MediaQuery.of(context).size.width / 3,
                                                                                                      child: Row(
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            '     Role: ',
                                                                                                            style: Styles.black14,
                                                                                                          ),
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                                border: Border.all(
                                                                                                              color: Color(0xFE50000),
                                                                                                              width: 0.5,
                                                                                                            )),
                                                                                                            height: MediaQuery.of(context).size.height * 0.040,
                                                                                                            // margin: Dimens.edgeInsets5,
                                                                                                            constraints: BoxConstraints(
                                                                                                              maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                              minWidth: 100,
                                                                                                            ),
                                                                                                            child: LoginCustomTextfield(
                                                                                                              textController: controller.roleTextFieldController,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      width: MediaQuery.of(context).size.width / 3,
                                                                                                      child: Row(
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Mobile: ',
                                                                                                            style: Styles.black14,
                                                                                                          ),
                                                                                                          Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                                border: Border.all(
                                                                                                              color: Color(0xFE50000),
                                                                                                              width: 0.5,
                                                                                                            )),
                                                                                                            height: MediaQuery.of(context).size.height * 0.040,
                                                                                                            // margin: Dimens.edgeInsets5,
                                                                                                            constraints: BoxConstraints(
                                                                                                              maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                              minWidth: 100,
                                                                                                            ),
                                                                                                            child: LoginCustomTextfield(
                                                                                                              inputFormatters: [
                                                                                                                FilteringTextInputFormatter.digitsOnly
                                                                                                              ],
                                                                                                              textController: controller.mobileTextFieldController,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    ElevatedButton(
                                                                                                      onPressed: () {
                                                                                                        controller.updateText(controller.nameTextFieldController.text, controller.roleTextFieldController.text, controller.emailTextFieldController.text, int.tryParse('${controller.mobileTextFieldController.text}'));
                                                                                                        controller.nameTextFieldController.clear();
                                                                                                        controller.emailTextFieldController.clear();
                                                                                                        controller.roleTextFieldController.clear();
                                                                                                        controller.mobileTextFieldController.clear();
                                                                                                      },
                                                                                                      child: Text(
                                                                                                        'Add',
                                                                                                        style: TextStyle(color: ColorValues.whiteColor),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight10,
                                                Container(
                                                  margin: Dimens.edgeInsets20,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1100,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        CustomAppBar(
                                                          title:
                                                              'Schedule of Supplier Actions'
                                                                  .tr,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Obx(
                                                          () => Wrap(
                                                            children: [
                                                              Row(children: [
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Text('#'),
                                                                SizedBox(
                                                                  width: 35,
                                                                ),
                                                                Text(
                                                                    'Supplier Action'),
                                                                SizedBox(
                                                                  width: 215,
                                                                ),
                                                                Text(
                                                                    'Required'),
                                                                SizedBox(
                                                                  width: 180,
                                                                ),
                                                                Text(
                                                                    'Required by Date'),
                                                                SizedBox(
                                                                  width: 150,
                                                                ),
                                                                // Text('Action'),
                                                              ]),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Column(
                                                                children: []
                                                                  ..addAll(controller
                                                                      .supplierActions
                                                                      .map((element) =>
                                                                          Row(
                                                                            children: [
                                                                              supplierActionData('${element.srNumber}', '${element.name}', context, 0, '${element.required_by_date}'),
                                                                            ],
                                                                          ))),
                                                              ),
                                                              Column(
                                                                children: [
                                                                  SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3,
                                                                      child:
                                                                          CustomTextField(
                                                                        textController:
                                                                            controller.supplierActionSrNumberTextFieldController,
                                                                        label:
                                                                            '  Serial Number',
                                                                      )),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        3,
                                                                    child:
                                                                        CustomTextField(
                                                                      textController:
                                                                          controller
                                                                              .supplierActionTextFieldController,
                                                                      label:
                                                                          'Supplier Action',
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                340),
                                                                        child:
                                                                            Text(
                                                                          'Required',
                                                                          style:
                                                                              TextStyle(fontSize: 15),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            70,
                                                                      ),
                                                                      Checkbox(
                                                                          value: controller
                                                                              .isCheckedRequire
                                                                              .value,
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            controller.requireToggleCheckbox();
                                                                          }),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        3,
                                                                    child:
                                                                        CustomTextField(
                                                                      label:
                                                                          ' Required Date ',
                                                                      suffixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                      ),
                                                                      textController:
                                                                          controller
                                                                              .supplierActionDateTimeCtrlrWeb,
                                                                      onTap:
                                                                          () {
                                                                        pickRequiredSupplierDate_web(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ),
                                                                  ElevatedButton(
                                                                    child: Text(
                                                                      'Add',
                                                                      style: TextStyle(
                                                                          color:
                                                                              ColorValues.appGreenColor),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .updateSupplierActionText(
                                                                        controller
                                                                            .supplierActionTextFieldController
                                                                            .text,
                                                                        controller
                                                                            .supplierActionDateTimeCtrlrWeb
                                                                            .text,
                                                                        controller
                                                                            .supplierActionSrNumberTextFieldController
                                                                            .text,
                                                                      );
                                                                      controller
                                                                          .supplierActionSrNumberTextFieldController
                                                                          .clear();
                                                                      controller
                                                                          .supplierActionTextFieldController
                                                                          .clear();
                                                                      controller
                                                                          .supplierActionDateTimeCtrlrWeb
                                                                          .clear();
                                                                    },
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Dimens.boxHeight10,
                                                Container(
                                                  height: Get.height * 0.2,
                                                  width: Get.width,
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child:
                                                            FileUploadWidgetWithDropzone(),
                                                      ),
                                                      Dimens.boxWidth5,
                                                      Expanded(
                                                        flex: 8,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15),
                                                          child:
                                                              FileUploadDetailsWidgetWeb(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //           top: 20),
                                                //   child: Wrap(
                                                //     children: [
                                                //       SizedBox(
                                                //         width: 20,
                                                //       ),
                                                //       Container(
                                                //         height: 250,
                                                //         width: MediaQuery.of(
                                                //                     context)
                                                //                 .size
                                                //                 .width /
                                                //             1.15,
                                                //         decoration: BoxDecoration(
                                                //             border: Border.all(
                                                //                 color: Colors
                                                //                     .grey)),
                                                //         child: Column(
                                                //           crossAxisAlignment:
                                                //               CrossAxisAlignment
                                                //                   .start,
                                                //           children: [
                                                //             Padding(
                                                //               padding:
                                                //                   const EdgeInsets
                                                //                       .only(
                                                //                       left: 20,
                                                //                       top: 15),
                                                //               child: Text(
                                                //                   'Attachments'),
                                                //             ),
                                                //             Dimens.boxHeight30,
                                                //             Row(
                                                //               children: [
                                                //                 /// File Upload Widget
                                                //                 Container(
                                                //                   height:
                                                //                       Get.height *
                                                //                           0.2,
                                                //                   width:
                                                //                       Get.width /
                                                //                           1.3,
                                                //                   child: Row(
                                                //                       //
                                                //                       children: [
                                                //                         Expanded(
                                                //                           flex:
                                                //                               2,
                                                //                           child:
                                                //                               FileUploadWidgetWithDropzone(),
                                                //                         ),
                                                //                         Dimens
                                                //                             .boxWidth10,
                                                //                         Expanded(
                                                //                             flex:
                                                //                                 8,
                                                //                             child:
                                                //                                 FileUploadDetailsWidgetWeb(position: 1)),
                                                //                       ]),
                                                //                 ),
                                                //               ],
                                                //             ),
                                                //           ],
                                                //         ),
                                                //       )
                                                //     ],
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Select Approver: '),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.2,
                                                        child: Obx(
                                                          () =>
                                                              DropdownWebWidget(
                                                            dropdownList:
                                                                controller
                                                                    .employeeList,
                                                            isValueSelected:
                                                                controller
                                                                    .isemployeeListSelected
                                                                    .value,
                                                            selectedValue:
                                                                controller
                                                                    .selectedEmployeeList
                                                                    .value,
                                                            onValueChanged:
                                                                controller
                                                                    .onValueChanged,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Dimens.boxHeight40,
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                AnimatedPositioned(
                  child: HomeDrawer(),
                  duration: Duration(milliseconds: 450),
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            children: <Widget>[
              Spacer(),
              Container(
                height: 30,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  onPressed: () {
                    controller.saveAsDraft();
                  },
                  text: 'Save As Draft',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 30,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.appGreenColor,
                  onPressed: () {
                    controller.createWarrantyClaim();
                  },
                  text: 'Submit For Release',
                ),
              ),
              Spacer(),
            ],
          ),
        );
      }),
    );
  }

  Future pickFailureDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedFailureDateTimeWeb.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedFailureDateTimeWeb.value = dateTime;
    controller.failureDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.failureDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print('FailureDateTime:${controller.failureDateTimeCtrlrWeb.text}');
    controller.failureDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedFailureDateTimeWeb.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedFailureDateTimeWeb.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }
    return newTime;
  }

  Widget buildRadioButton(String severity, Color color, BuildContext context) {
    return Obx(() {
      return Container(
        height: 35,
        width: MediaQuery.of(context).size.width / 10,
        child: RadioListTile(
          dense: true,
          title: Text(
            severity,
            style: TextStyle(color: color),
          ),
          value: severity,
          groupValue: controller.selectedSeverity.value,
          onChanged: (value) {
            controller.setSelectedSeverity(value as String);
            print('DAta:${controller.selectedSeverity.value}');
          },
        ),
      );
    });
  }

////Warranty Start Date
  Future pickWarrantyStartDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyStartDateTime.value;
    final date = await pickDate2_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.selectedWarrantyStartDateTime.value = dateTime;
    controller.warrantyStartDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyStartDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty Start Date Time: ${controller.warrantyStartDateTimeCtrlrWeb.text}');
    controller.warrantyStartDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print(
        'Warranty Start Date sending Time: ${controller.warrantyStartDateTimeCtrlrWebBuffer}');
  }

  Future<DateTime?> pickDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyStartDateTime.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;
    return newDate;
  }

  Future pickcurrentStartDate_web(BuildContext context) async {
    var dateTime = controller.selectedcurrentStartDate.value;
    final date = await pickDate2_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.dateController.value = dateTime;
    controller.currentStartDateCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.currentStartDateCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print('Current Date: ${controller.currentStartDateCtrlrWeb.text}');
    controller.currentStartDateCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print(
        'Current Date sending Time: ${controller.currentStartDateCtrlrWebBuffer}');
  }

  Future<DateTime?> pickcurrentDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedcurrentStartDate.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return null;
    return newDate;
  }

////Warranty End Date
  Future pickWarrantyEndDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyEndDateTime.value;
    final date = await pickDate3_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.selectedWarrantyEndDateTime.value = dateTime;
    controller.warrantyEndDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyEndDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty End Date Time: ${controller.warrantyEndDateTimeCtrlrWeb.text}');
    controller.warrantyEndDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate3_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyEndDateTime.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime3_web(BuildContext context) async {
    DateTime dateTime = controller.selectedWarrantyEndDateTime.value;
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });
    if (newTime == null) {
      return null;
    }
    return newTime;
  }

  ///Supplier Action Required by date
  Future pickRequiredSupplierDate_web(BuildContext context) async {
    var dateTime = controller.selectedSupplierActionDateTimeWeb.value;
    final date = await pickRequiredDate_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.selectedSupplierActionDateTimeWeb.value = dateTime;
    controller.supplierActionDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.supplierActionDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickRequiredDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedSupplierActionDateTimeWeb.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return null;
    return newDate;
  }

  Future<TimeOfDay?> pickRequiredTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedSupplierActionDateTimeWeb.value;
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });
    if (newTime == null) {
      return null;
    }
    return newTime;
  }

  emailDropdown(
    BuildContext context,
    String? title,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4.2,
          child: CustomMultiSelectDialogField(
            buttonText: '$title',
            title: 'Employees',
            // initialValue: [],
            initialValue: (controller.selectedEmployeeNameIdList.isNotEmpty)
                ? controller.selectedEmployeeNameIdList
                : [],
            items: controller.employeesList
                .map(
                  (equipmentCategory) => MultiSelectItem(
                    equipmentCategory.id,
                    equipmentCategory.name ?? '',
                  ),
                )
                .toList(),
            onConfirm: (selectedOptionsList) => {
              controller.employeesNameSelected(selectedOptionsList),
              print(
                  'Employees Name list Ids ${controller.selectedEmployeeNameIdList}')
            },
          ),
        ),
      ],
    );
  }

  supplierActionData(
    String? title,
    String? title2,
    BuildContext context,
    int? position,
    String? date,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title'),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Container(
                child: Container(
              height: 30,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$title2')),
            )),
          ),
          Checkbox(
            value: true,
            onChanged: null,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: CustomTextField(
              label: '',
              hintText: '$date',
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}
