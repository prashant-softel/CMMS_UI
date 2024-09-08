import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/create_observation/create_observation_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cmms/app/app.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateObservationWeb extends StatefulWidget {
  CreateObservationWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateObservationWeb> createState() => _ViewHazWasteDataWebState();
}

class _ViewHazWasteDataWebState extends State<CreateObservationWeb> {
  final HomeController homecontroller = Get.find();
  final FileUploadController dropzoneController = Get.put(
    FileUploadController(),
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateObservationController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Obx(
              () => Container(
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
                              Get.offNamed(Routes.misDashboard);
                              controller.clearStoreData();
                            },
                            child: Text(" / MIS", style: Styles.greyLight14),
                          ),
                          Text(" / CREATE OBSERVATION",
                              style: Styles.greyLight14),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              child: Column(
                                children: [
                                  Card(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 20,
                                              top: 5,
                                              bottom: 5,
                                              left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Create Observation",
                                                style: Styles.blackBold16,
                                              ),
                                              Spacer(),
                                              controller.obsId == 0
                                                  ? Dimens.box0
                                                  : Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: ColorValues
                                                              .approveColor,
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: ColorValues
                                                                  .approveColor),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Status ${controller.getObsById.value!.short_status == null ? "" : controller.getObsById.value!.short_status}",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: ColorValues.greyLightColour,
                                        ),
                                        Container(
                                          color: Color.fromARGB(
                                              255, 245, 248, 250),
                                          width: Get.width,
                                          height: Get.height,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Container(
                                              margin: Dimens.edgeInsets20,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Spacer(),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Contractor Name'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  textController:
                                                                      controller
                                                                          .contractorNameCtrlr,
                                                                  //validate
                                                                  errorController: controller
                                                                          .isContractorInvalid
                                                                          .value
                                                                      ? "Required field"
                                                                      : null,
                                                                  onChanged:
                                                                      (value) {
                                                                    if (value
                                                                            .trim()
                                                                            .length >
                                                                        0) {
                                                                      controller
                                                                          .isContractorInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isContractorInvalid
                                                                          .value = true;
                                                                    }
                                                                  }),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Risk Type'),
                                                              Dimens.boxWidth3,
                                                              Obx(
                                                                () =>
                                                                    DropdownWebStock(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  dropdownList:
                                                                      controller
                                                                          .incidentrisktypeList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isRiskTypeListSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedRiskTypeList
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Corrective/Preventive Action'),
                                                          //     Dimens.boxWidth3,
                                                          //     LoginCustomTextfield(
                                                          //         width: (MediaQuery.of(
                                                          //                     context)
                                                          //                 .size
                                                          //                 .width *
                                                          //             .2),
                                                          //         textController:
                                                          //             controller
                                                          //                 .correctivePreventiveCtrlr,
                                                          //         //validate
                                                          //         errorController: controller
                                                          //                 .isCorrectiveInvalid
                                                          //                 .value
                                                          //             ? "Required field"
                                                          //             : null,
                                                          //         onChanged:
                                                          //             (value) {
                                                          //           if (value
                                                          //                   .trim()
                                                          //                   .length >
                                                          //               0) {
                                                          //             controller
                                                          //                 .isCorrectiveInvalid
                                                          //                 .value = false;
                                                          //           } else {
                                                          //             controller
                                                          //                 .isCorrectiveInvalid
                                                          //                 .value = true;
                                                          //           }
                                                          //         }),
                                                          //   ],
                                                          // ),
                                                          Dimens.boxHeight5,
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Responsible Person'),
                                                          //     Dimens.boxWidth3,
                                                          //     LoginCustomTextfield(
                                                          //         width: (MediaQuery.of(
                                                          //                     context)
                                                          //                 .size
                                                          //                 .width *
                                                          //             .2),
                                                          //         textController:
                                                          //             controller
                                                          //                 .responsiblePersonCtrlr,
                                                          //         //validate
                                                          //         errorController: controller
                                                          //                 .isResponsibleInvalid
                                                          //                 .value
                                                          //             ? "Required field"
                                                          //             : null,
                                                          //         onChanged:
                                                          //             (value) {
                                                          //           if (value
                                                          //                   .trim()
                                                          //                   .length >
                                                          //               0) {
                                                          //             controller
                                                          //                 .isResponsibleInvalid
                                                          //                 .value = false;
                                                          //           } else {
                                                          //             controller
                                                          //                 .isResponsibleInvalid
                                                          //                 .value = true;
                                                          //           }
                                                          //         }),
                                                          //   ],
                                                          // ),
                                                          Dimens.boxHeight5,
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Contact Number'),
                                                          //     Dimens.boxWidth3,
                                                          //     LoginCustomTextfield(
                                                          //         width: (MediaQuery.of(
                                                          //                     context)
                                                          //                 .size
                                                          //                 .width *
                                                          //             .2),
                                                          //         inputFormatters: [
                                                          //           FilteringTextInputFormatter
                                                          //               .digitsOnly
                                                          //         ],
                                                          //         keyboardType:
                                                          //             TextInputType
                                                          //                 .number,
                                                          //         textController:
                                                          //             controller
                                                          //                 .contactNumberCtrlr,
                                                          //         //validate
                                                          //         errorController: controller
                                                          //                 .isContactNumberInvalid
                                                          //                 .value
                                                          //             ? "Required field"
                                                          //             : null,
                                                          //         onChanged:
                                                          //             (value) {
                                                          //           if (value
                                                          //                   .trim()
                                                          //                   .length >
                                                          //               0) {
                                                          //             controller
                                                          //                 .isContactNumberInvalid
                                                          //                 .value = false;
                                                          //           } else {
                                                          //             controller
                                                          //                 .isContactNumberInvalid
                                                          //                 .value = true;
                                                          //           }
                                                          //         }),
                                                          //   ],
                                                          // ),
                                                          Dimens.boxHeight5,
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Cost Type'),
                                                          //     Dimens.boxWidth3,
                                                          //     Obx(
                                                          //       () =>
                                                          //           DropdownWebStock(
                                                          //         width: MediaQuery.of(
                                                          //                     context)
                                                          //                 .size
                                                          //                 .width /
                                                          //             5,
                                                          //         dropdownList:
                                                          //             controller
                                                          //                 .costType,
                                                          //         isValueSelected:
                                                          //             controller
                                                          //                 .isCostTypeListSelected
                                                          //                 .value,
                                                          //         selectedValue:
                                                          //             controller
                                                          //                 .selectedCostTypeList
                                                          //                 .value,
                                                          //         onValueChanged:
                                                          //             controller
                                                          //                 .onValueChanged,
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Cost Type'),
                                                          //     Dimens.boxWidth10,
                                                          //     Container(
                                                          //       decoration:
                                                          //           BoxDecoration(
                                                          //         borderRadius:
                                                          //             BorderRadius
                                                          //                 .circular(
                                                          //                     5),
                                                          //       ),
                                                          //       child:
                                                          //           LoginCustomTextfield(
                                                          //               width: (MediaQuery.of(context).size.width *
                                                          //                   .2),
                                                          //               textController:
                                                          //                   controller
                                                          //                       .costTypeCtrlr,
                                                          //               //validate
                                                          //               errorController: controller.isCostInvalid.value
                                                          //                   ? "Required field"
                                                          //                   : null,
                                                          //               onChanged:
                                                          //                   (value) {
                                                          //                 if (value.trim().length >
                                                          //                     0) {
                                                          //                   controller.isCostInvalid.value =
                                                          //                       false;
                                                          //                 } else {
                                                          //                   controller.isCostInvalid.value =
                                                          //                       true;
                                                          //                 }
                                                          //               }),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          Dimens.boxHeight5,
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Dimens.boxWidth5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Date of Observation'),
                                                              Dimens.boxWidth3,
                                                              CustomTextFieldForStock(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                numberTextField:
                                                                    true,
                                                                onTap: () {
                                                                  controller
                                                                          .openObsDatePicker =
                                                                      !controller
                                                                          .openObsDatePicker;
                                                                  controller
                                                                      .update([
                                                                    'stock_Mangement'
                                                                  ]);
                                                                },
                                                                textController:
                                                                    controller
                                                                        .obsDateTc,
                                                                errorController:
                                                                    controller
                                                                            .isObsDateTcInvalid
                                                                            .value
                                                                        ? "Required field"
                                                                        : null,
                                                                onChanged:
                                                                    (value) {
                                                                  if (value
                                                                          .trim()
                                                                          .length >
                                                                      0) {
                                                                    controller
                                                                        .isObsDateTcInvalid
                                                                        .value = false;
                                                                  } else {
                                                                    controller
                                                                        .isObsDateTcInvalid
                                                                        .value = true;
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Type of Observation'),
                                                              Dimens.boxWidth3,
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    DropdownWebStock(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  dropdownList:
                                                                      controller
                                                                          .typeOfObsList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isSelectedTypeOfObs
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedTypeOfObs
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Location of Observation'),
                                                              Dimens.boxWidth3,
                                                              LoginCustomTextfield(
                                                                  width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .2),
                                                                  textController:
                                                                      controller
                                                                          .locationOfObservationCtrlr,
                                                                  //validate
                                                                  errorController: controller
                                                                          .islocationofObservationInvalid
                                                                          .value
                                                                      ? "Required field"
                                                                      : null,
                                                                  onChanged:
                                                                      (value) {
                                                                    if (value
                                                                            .trim()
                                                                            .length >
                                                                        0) {
                                                                      controller
                                                                          .islocationofObservationInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .islocationofObservationInvalid
                                                                          .value = true;
                                                                    }
                                                                  }),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Source of Observation'),
                                                              Dimens.boxWidth3,
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    DropdownWebStock(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  dropdownList:
                                                                      controller
                                                                          .sourceOfObsList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isSelectedSourceOfObs
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedSourceOfObs
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Target Date'),
                                                          //     Dimens.boxWidth3,
                                                          //     CustomTextFieldForStock(
                                                          //       width: MediaQuery.of(
                                                          //                   context)
                                                          //               .size
                                                          //               .width /
                                                          //           5,
                                                          //       numberTextField:
                                                          //           true,
                                                          //       onTap: () {
                                                          //         controller
                                                          //                 .openTargetObsDatePicker =
                                                          //             !controller
                                                          //                 .openTargetObsDatePicker;
                                                          //         controller
                                                          //             .update([
                                                          //           'stock_Mangement'
                                                          //         ]);
                                                          //       },
                                                          //       textController:
                                                          //           controller
                                                          //               .targetDateTc,
                                                          //       errorController:
                                                          //           controller
                                                          //                   .isTargetDateInvalid
                                                          //                   .value
                                                          //               ? "Required field"
                                                          //               : null,
                                                          //       onChanged:
                                                          //           (value) {
                                                          //         if (value
                                                          //                 .trim()
                                                          //                 .length >
                                                          //             0) {
                                                          //           controller
                                                          //               .isTargetDateInvalid
                                                          //               .value = false;
                                                          //         } else {
                                                          //           controller
                                                          //               .isTargetDateInvalid
                                                          //               .value = true;
                                                          //         }
                                                          //       },
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          Dimens.boxHeight5,
                                                        ],
                                                      ),
                                                      Spacer(),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight20,
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    child: Row(children: [
                                                      Text(
                                                          'Observation Description: ',
                                                          style: Styles.blue14),
                                                      Expanded(
                                                        child: TextField(
                                                          controller: controller
                                                              .discriptionCtrlr,
                                                          style:
                                                              GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                fontSize: 16.0,
                                                                height: 1.0,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          decoration:
                                                              InputDecoration(
                                                            disabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: ColorValues
                                                                    .appLightGreyColor,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: ColorValues
                                                                    .appLightBlueColor,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: ColorValues
                                                                    .appLightBlueColor,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                          minLines: 3,
                                                          maxLines: null,
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                  Dimens.boxHeight15,
                                                  Center(
                                                    child: Container(
                                                      height: Get.height * 0.2,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.2,
                                                      constraints:
                                                          BoxConstraints(
                                                              maxWidth: 1400),
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child:
                                                                FileUploadWidgetWithDropzone(),
                                                          ),
                                                          Dimens.boxWidth10,
                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15),
                                                              child:
                                                                  FileUploadDetailsWidgetWeb2(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxHeight15,
                                                  (controller.historyList !=
                                                              null &&
                                                          controller
                                                              .historyList!
                                                              .isNotEmpty)
                                                      ? Container(
                                                          margin: Dimens
                                                              .edgeInsets20,
                                                          height: ((controller
                                                                          .historyList
                                                                          ?.length ??
                                                                      0) *
                                                                  40) +
                                                              120,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: ColorValues
                                                                  .lightGreyColorWithOpacity35,
                                                              width: 1,
                                                            ),
                                                          ),
                                                          child: //
                                                              Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Statutory Compliance  History ",
                                                                      style: Styles
                                                                          .blue700,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    HistoryTableWidgetWeb(
                                                                  historyList:
                                                                      controller
                                                                          .historyList,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : Dimens.box0,
                                                  Dimens.boxHeight15,
                                                ],
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
                            if (controller.openObsDatePicker)
                              Positioned(
                                right: 65,
                                top: 230,
                                child: DatePickerWidget(
                                  // last date of this year
                                  controller: DateRangePickerController(),
                                  selectionChanges: (p0) {
                                    print('po valu ${p0.value.toString()}');
                                    controller.obsDateTc.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(p0.value);
                                    controller.openObsDatePicker = false;

                                    controller.isObsDateTcInvalid.value = false;
                                    controller.update(['stock_Mangement']);
                                  },
                                  onCancel: () {
                                    controller.openObsDatePicker = false;
                                    controller.update(['stock_Mangement']);
                                  },
                                ),
                              ),
                            if (controller.openTargetObsDatePicker)
                              Positioned(
                                right: 65,
                                top: 230,
                                child: DatePickerWidget(
                                  // last date of this year
                                  controller: DateRangePickerController(),
                                  selectionChanges: (p0) {
                                    print('po valu ${p0.value.toString()}');
                                    controller.targetDateTc.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(p0.value);
                                    controller.openTargetObsDatePicker = false;

                                    controller.isTargetDateInvalid.value =
                                        false;
                                    controller.update(['stock_Mangement']);
                                  },
                                  onCancel: () {
                                    controller.openTargetObsDatePicker = false;
                                    controller.update(['stock_Mangement_Date']);
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
            floatingActionButton: Obx(() =>
                    // varUserAccessModel
                    //             .value.access_list!
                    //             .where((e) =>
                    //                 e.feature_id ==
                    //                     UserAccessConstants.kGoodsFeatureId &&
                    //                 e.add == UserAccessConstants.kHaveAddAccess)
                    //             .length >
                    //         0
                    //     ?
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 40,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.cancelColor,
                            text: 'Cancel',
                            onPressed: () {
                              Get.offAllNamed(Routes.misDashboard);
                            },
                          ),
                        ),
                        Dimens.boxWidth15,
                        controller.obsId == 0
                            ? Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.submitColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    controller.isFormInvalid.value = false;
                                    controller.createObs(
                                        position: 1,
                                        fileIds: dropzoneController.fileIds);
                                  },
                                ),
                              )
                            : Container(
                                height: 40,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.submitColor,
                                  text: 'Update',
                                  onPressed: () {
                                    controller.isFormInvalid.value = false;
                                    controller.createObs(
                                        position: 0,
                                        fileIds: dropzoneController.fileIds);
                                  },
                                ),
                              ),
                        Spacer(),
                      ],
                    )
                // : Dimens.box0
                ),
          ),
        );
        // );
      },
    );
  }
}
