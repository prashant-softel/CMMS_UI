import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class AddIncidentReportContentWeb extends GetView<AddIncidentReportController> {
  AddIncidentReportContentWeb({super.key});

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  bool valuefirst = false;
  bool _switchValue = false;

  // final controller = Get.find<HomeController>();
  final AddIncidentReportController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: HeaderWidget(),
          elevation: 0,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
        ),
        body: Row(
          children: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens.box0
                : HomeDrawer(),
            Expanded(
              child: Container(
                // margin: Dimens.edgeInsets16,
                height: Get.height,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.3)),
                ),
                constraints: BoxConstraints(
                  maxWidth: 1100,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
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
                            Text(
                              "Dashboard",
                              style: Styles.greyLight14,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(" / Incident Report",
                                  style: Styles.greyMediumLight12),
                            ),
                            Text(" / Add Incident Report",
                                style: Styles.greyMediumLight12)
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1,
                        // height: MediaQuery.of(context).size.height / 1,
                        child: Card(
                          // color: Colors.lightBlue.shade50,
                          color: Color.fromARGB(255, 237, 240, 242),
                          child: Wrap(
                            children: [
                              GetBuilder<AddIncidentReportController>(
                                  id: 'incident-report',
                                  builder: (controller) {
                                    return Obx(
                                      () => Column(
                                        children: [
                                          CustomAppBar(
                                            title: 'Add Incident Report'.tr,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 50),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title:
                                                            '           Incident Title: '),
                                                    Expanded(
                                                      child:
                                                          _buildIncidentReportTitleTextField_web(
                                                              context),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title:
                                                            'Incident Description: '),
                                                    Expanded(
                                                      child:
                                                          _buildIncidentReportDescriptionField_web(
                                                              context),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Incident date & Time: '),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child:
                                                                  _buildIncidentDateTimeField_web(
                                                                context,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Type of Incident: '),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: Obx(
                                                                () =>
                                                                    DropdownWebWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .riskTypeList,
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
                                                            ),
                                                          ],
                                                        ),

                                                        Dimens.boxHeight10,
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Victim Name: '),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child:
                                                                  CustomMultiSelectDialogField(
                                                                buttonText:
                                                                    'Select Victim Name',
                                                                title:
                                                                    'Employees',
                                                                // initialValue: [],
                                                                initialValue: (controller
                                                                        .selectedVictimNameIdList
                                                                        .isNotEmpty)
                                                                    ? controller
                                                                        .selectedVictimNameIdList
                                                                    : [],
                                                                items: controller
                                                                    .victimNameList
                                                                    .map(
                                                                      (victimName) =>
                                                                          MultiSelectItem(
                                                                        victimName
                                                                            .id,
                                                                        victimName.name ??
                                                                            '',
                                                                      ),
                                                                    )
                                                                    .toList(),
                                                                onConfirm:
                                                                    (selectedOptionsList) =>
                                                                        {
                                                                  controller
                                                                      .victimNameSelected(
                                                                          selectedOptionsList),
                                                                  print(
                                                                      'Victim Name list Ids ${controller.selectedVictimNameIdList}')
                                                                },
                                                              ),
                                                            ),
                                                            // SizedBox(
                                                            //   width: MediaQuery.of(
                                                            //               context)
                                                            //           .size
                                                            //           .width /
                                                            //       5,
                                                            //   child: Obx(
                                                            //     () =>
                                                            //         MultiSelectDialogField(
                                                            //       dialogWidth:
                                                            //           300,
                                                            //       dialogHeight:
                                                            //           400,
                                                            //       searchable:
                                                            //           true,
                                                            //       validator:
                                                            //           (selectedItems) {
                                                            //         if (controller
                                                            //                 .isVictimNameListSelected
                                                            //                 .value ==
                                                            //             false) {
                                                            //           return "Required field";
                                                            //         } else {
                                                            //           return null;
                                                            //         }
                                                            //       },
                                                            //       autovalidateMode:
                                                            //           AutovalidateMode
                                                            //               .always,
                                                            //       decoration:
                                                            //           BoxDecoration(
                                                            //         border:
                                                            //             Border
                                                            //                 .all(
                                                            //           color: controller.isVictimNameListSelected.value ==
                                                            //                   false
                                                            //               ? Colors
                                                            //                   .red
                                                            //               : Colors
                                                            //                   .grey,
                                                            //           width:
                                                            //               1.0,
                                                            //         ),
                                                            //         borderRadius:
                                                            //             BorderRadius
                                                            //                 .circular(5),
                                                            //       ),
                                                            //       buttonIcon:
                                                            //           Icon(Icons
                                                            //               .arrow_drop_down),
                                                            //       items: controller
                                                            //           .victimNameList
                                                            //           .map((e) =>
                                                            //               MultiSelectItem(
                                                            //                   e,
                                                            //                   e.name ?? ''))
                                                            //           .toList(),
                                                            //       onConfirm:
                                                            //           (selectedOptionsList) =>
                                                            //               {
                                                            //         controller
                                                            //             .onValueVictimNameChanged,
                                                            //         controller
                                                            //                 .isVictimNameListSelected
                                                            //                 .value =
                                                            //             selectedOptionsList
                                                            //                 .isNotEmpty,
                                                            //       },
                                                            //       chipDisplay:
                                                            //           MultiSelectChipDisplay(),
                                                            //     ),
                                                            //   ),

                                                            //   // Obx(
                                                            //   //   () =>
                                                            //   //       DropdownWebWidget(
                                                            //   //     dropdownList:
                                                            //   //         controller
                                                            //   //             .victimNameList,
                                                            //   //     isValueSelected:
                                                            //   //         controller
                                                            //   //             .isVictimNameListSelected
                                                            //   //             .value,
                                                            //   //     selectedValue:
                                                            //   //         controller
                                                            //   //             .selectedVictimNameList
                                                            //   //             .value,
                                                            //   //     onValueChanged:
                                                            //   //         controller
                                                            //   //             .onValueVictimNameChanged,
                                                            //   //   ),
                                                            //   // ),
                                                            // ),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight5,
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 140,
                                                              child: CustomRichText(
                                                                  title:
                                                                      'Incident Investigation Done By: '),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: Obx(
                                                                () =>
                                                                    DropdownWebWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .incidentInvestigationDoneByList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isincidentInvestigationDoneByListSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedIncidentInvestigationDoneByList
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight5,
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 140,
                                                              child: CustomRichText(
                                                                  title:
                                                                      'Corrective & Preventive action taken By: '),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: Obx(
                                                                () =>
                                                                    DropdownWebWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .incidentInvestigationVerificationDoneByList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isincidentInvestigationVerificationDoneByListSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedIncidentInvestigationVerificationDoneByList
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueIncidentVerificationChanged,
                                                                ),
                                                              ),
                                                              // _buildCorrectiveActionTextField_web(
                                                              //     context)
                                                            ),
                                                          ],
                                                        ),

                                                        Dimens.boxHeight15,
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Legal Applicability: '),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: controller
                                                                          .id !=
                                                                      null
                                                                  ? controller
                                                                              .incidentReportDetailsModel
                                                                              .value
                                                                              ?.legal_applicability_name ==
                                                                          "YES"
                                                                      ? Obx(
                                                                          () =>
                                                                              Switch(
                                                                            activeColor:
                                                                                Colors.green,
                                                                            value:
                                                                                controller.legalApplicabilityDetailValue.value,
                                                                            onChanged:
                                                                                (value) {
                                                                              controller.legalApplicabilityDetailValue.value = value;
                                                                              print('Legal Detail applicability: ${controller.legalApplicabilityValue.value}');
                                                                            },
                                                                          ),
                                                                        )
                                                                      : Obx(
                                                                          () =>
                                                                              Switch(
                                                                            activeColor:
                                                                                Colors.green,
                                                                            value:
                                                                                controller.legalApplicabilityDetailFalseValue.value,
                                                                            onChanged:
                                                                                (value) {
                                                                              controller.legalApplicabilityDetailFalseValue.value = value;
                                                                              print('Legal Detail False applicability: ${controller.legalApplicabilityValue.value}');
                                                                            },
                                                                          ),
                                                                        )
                                                                  : Obx(
                                                                      () =>
                                                                          Switch(
                                                                        activeColor:
                                                                            Colors.green,
                                                                        value: controller
                                                                            .legalApplicabilityValue
                                                                            .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .legalApplicabilityValue
                                                                              .value = value;
                                                                          print(
                                                                              'Legal applicability: ${controller.legalApplicabilityValue.value}');
                                                                        },
                                                                      ),
                                                                    ),
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight5,
                                                        Row(
                                                          children: [
                                                            controller.legalApplicabilityValue ==
                                                                    true
                                                                ? CustomRichText(
                                                                    title:
                                                                        'Legal Applicability Remark: ')
                                                                : Container(),
                                                            Dimens.boxWidth10,
                                                            controller.legalApplicabilityValue ==
                                                                    true
                                                                ? SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        5,
                                                                    child: _buildLegalApplicabilityRemarkTextField_web(
                                                                        context))
                                                                : Container(),
                                                          ],
                                                        ),
                                                        //   Dimens.boxHeight5,
                                                        // /// FILE UPLOAD WIDGET
                                                        // SizedBox(
                                                        //    width: MediaQuery.of(
                                                        //             context)
                                                        //         .size
                                                        //         .width /
                                                        //     3,
                                                        //   child: Container(
                                                        //     height: Get.height * 0.2,
                                                        //     width: Get.width,
                                                        //     child: Row(
                                                        //         //
                                                        //         children: [
                                                        //           Expanded(
                                                        //             flex: 2,
                                                        //             child:
                                                        //                 FileUploadWidgetWithDropzone(),
                                                        //           ),
                                                        //           Dimens.boxWidth10,
                                                        //           Expanded(
                                                        //               flex: 8,
                                                        //               child:
                                                        //                   FileUploadDetailsWidgetWeb()),
                                                        //         ]),
                                                        //   ),
                                                        // ),

                                                        Dimens.boxHeight5,
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 140,
                                                              child: CustomRichText(
                                                                  title:
                                                                      'Damaged Asset Cost Approx: '),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                child:
                                                                    _buildDamagedAssetsCostTextField_web(
                                                                        context)),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight5,
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 140,
                                                              child: CustomRichText(
                                                                  title:
                                                                      'Asset Restoration Action Taken By: '),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: Obx(
                                                                () =>
                                                                    DropdownWebWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .assetRestorationActionTakenByList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isAssetRestorationActionTakenByListSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedAssetRestorationActionTakenByList
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueAssetRestorationActionTakenByChanged,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxHeight5,
                                                        Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'RCA Upload Required: '),
                                                            Dimens.boxWidth10,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: controller
                                                                          .id !=
                                                                      null
                                                                  ? controller
                                                                              .incidentReportDetailsModel
                                                                              .value
                                                                              ?.rca_required_name ==
                                                                          "YES"
                                                                      ? Obx(
                                                                          () =>
                                                                              Switch(
                                                                            activeColor:
                                                                                Colors.green,
                                                                            value:
                                                                                controller.rCAUploadRequiredDetailValue.value,
                                                                            onChanged:
                                                                                (value) {
                                                                              controller.rCAUploadRequiredDetailValue.value = value;
                                                                              print('RCA Detail Upload Required: ${controller.rCAUploadRequiredDetailValue.value}');
                                                                            },
                                                                          ),
                                                                        )
                                                                      : Obx(
                                                                          () =>
                                                                              Switch(
                                                                            activeColor:
                                                                                Colors.green,
                                                                            value:
                                                                                controller.rCAUploadRequiredDetailFalseValue.value,
                                                                            onChanged:
                                                                                (value) {
                                                                              controller.rCAUploadRequiredDetailFalseValue.value = value;
                                                                              print('RCA Detail False Upload Required: ${controller.rCAUploadRequiredDetailFalseValue.value}');
                                                                            },
                                                                          ),
                                                                        )
                                                                  : Obx(
                                                                      () =>
                                                                          Switch(
                                                                        activeColor:
                                                                            Colors.green,
                                                                        value: controller
                                                                            .rCAUploadRequiredValue
                                                                            .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .rCAUploadRequiredValue
                                                                              .value = value;
                                                                        },
                                                                      ),
                                                                    ),
                                                            )
                                                          ],
                                                        ),

                                                        // Dimens.boxHeight5,
                                                        // Row(
                                                        //   children: [
                                                        //     CustomRichText(
                                                        //         title:
                                                        //             'Remark: '),
                                                        //     Dimens.boxWidth10,
                                                        //     SizedBox(
                                                        //         width: MediaQuery.of(
                                                        //                     context)
                                                        //                 .size
                                                        //                 .width /
                                                        //             5,
                                                        //         child:
                                                        //             _buildInsuranceRemarkField_web(
                                                        //                 context)),
                                                        //   ],
                                                        // ),
                                                        // Dimens.boxHeight20,
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(
                                                        //       width: 140,
                                                        //       child: CustomRichText(
                                                        //           title:
                                                        //               'Verified/Approved by: '),
                                                        //     ),
                                                        //     Dimens.boxWidth10,
                                                        //     SizedBox(
                                                        //         width: MediaQuery.of(
                                                        //                     context)
                                                        //                 .size
                                                        //                 .width /
                                                        //             5,
                                                        //         child:
                                                        //             _buildVerifiedApprovedTextField_web(
                                                        //                 context)),
                                                        //   ],
                                                        // ),
                                                      ],
                                                    ),

                                                    ////Changes from here top for left Column

                                                    ///Changes from here below for right Column
                                                    Spacer(),
                                                    // Dimens.boxWidth50,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Dimens.boxHeight10,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Location: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                child: Obx(
                                                                  () =>
                                                                      DropdownWebWidget(
                                                                    // margin: Dimens.edgeInsets5,
                                                                    dropdownList:
                                                                        controller
                                                                            .blockList,
                                                                    isValueSelected:
                                                                        controller
                                                                            .isBlockSelected
                                                                            .value,
                                                                    selectedValue:
                                                                        controller
                                                                            .selectedBlock
                                                                            .value,
                                                                    onValueChanged:
                                                                        controller
                                                                            .onValueChanged,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Incident Severity: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                                child: Column(
                                                                  children: [
                                                                    buildRadioButton(
                                                                        'Critical',
                                                                        Colors
                                                                            .red,
                                                                        Colors
                                                                            .white,
                                                                        context),
                                                                    buildRadioButton(
                                                                        'High',
                                                                        Colors
                                                                            .orange,
                                                                        Colors
                                                                            .white,
                                                                        context),
                                                                    buildRadioButton(
                                                                        'Medium',
                                                                        Colors
                                                                            .yellow,
                                                                        Colors
                                                                            .white,
                                                                        context),
                                                                    buildRadioButton(
                                                                        'Low',
                                                                        Colors
                                                                            .green,
                                                                        Colors
                                                                            .white,
                                                                        context),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Reporting date & Time: '),
                                                          //     Dimens.boxWidth10,
                                                          //     SizedBox(
                                                          //       width: MediaQuery.of(
                                                          //                   context)
                                                          //               .size
                                                          //               .width /
                                                          //           5,
                                                          //       child:
                                                          //           _buildReportingDateTimeField_web(
                                                          //         context,
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          Dimens.boxHeight30,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Action taken Date & Time: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  child: _buildActionTakenDateTimeField_web(
                                                                      context)),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          // Row(
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width: 200,
                                                          //       child:
                                                          //           CustomRichText(
                                                          //         // title:'Incident Investigation Verification Done By: '
                                                          //         title:
                                                          //             'Responsible Person Name',
                                                          //       ),
                                                          //     ),
                                                          //     Dimens.boxWidth10,
                                                          //     SizedBox(
                                                          //       width: MediaQuery.of(
                                                          //                   context)
                                                          //               .size
                                                          //               .width /
                                                          //           5,
                                                          //       child: Obx(
                                                          //         () =>
                                                          //             DropdownWebWidget(
                                                          //           dropdownList:
                                                          //               controller
                                                          //                   .incidentInvestigationVerificationDoneByList,
                                                          //           isValueSelected:
                                                          //               controller
                                                          //                   .isincidentInvestigationVerificationDoneByListSelected
                                                          //                   .value,
                                                          //           selectedValue:
                                                          //               controller
                                                          //                   .selectedIncidentInvestigationVerificationDoneByList
                                                          //                   .value,
                                                          //           onValueChanged:
                                                          //               controller
                                                          //                   .onValueIncidentVerificationChanged,
                                                          //         ),
                                                          //       ),
                                                          //     ),
                                                          //   ],
                                                          // ),

                                                          Dimens.boxHeight20,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'ESI Applicability: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                child: controller
                                                                            .id !=
                                                                        null
                                                                    ? controller.incidentReportDetailsModel.value?.esi_applicability_name ==
                                                                            "YES"
                                                                        ? Obx(
                                                                            () =>
                                                                                Switch(
                                                                              activeColor: Colors.green,
                                                                              value: controller.esiApplicabilityDetailValue.value,
                                                                              onChanged: (value) {
                                                                                controller.esiApplicabilityDetailValue.value = value;
                                                                                print('ESI Detail applicability: ${controller.esiApplicabilityDetailValue.value}');
                                                                              },
                                                                            ),
                                                                          )
                                                                        : Obx(
                                                                            () =>
                                                                                Switch(
                                                                              activeColor: Colors.green,
                                                                              value: controller.esiApplicabilityDetailFalseValue.value,
                                                                              onChanged: (value) {
                                                                                controller.esiApplicabilityDetailFalseValue.value = value;
                                                                                print('ESI Detail False applicability: ${controller.esiApplicabilityDetailFalseValue.value}');
                                                                              },
                                                                            ),
                                                                          )
                                                                    : Obx(
                                                                        () =>
                                                                            Switch(
                                                                          activeColor:
                                                                              Colors.green,
                                                                          value: controller
                                                                              .esiApplicabilityValue
                                                                              .value,
                                                                          onChanged:
                                                                              (value) {
                                                                            controller.esiApplicabilityValue.value =
                                                                                value;
                                                                          },
                                                                        ),
                                                                      ),
                                                              ),
                                                            ],
                                                          ),

                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              controller.esiApplicabilityValue ==
                                                                      true
                                                                  ? CustomRichText(
                                                                      title:
                                                                          'ESI Applicability Remark: ')
                                                                  : Container(),
                                                              Dimens.boxWidth10,
                                                              controller.esiApplicabilityValue ==
                                                                      true
                                                                  ? SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child: _buildESIApplicabilityRemarkTextField_web(
                                                                          context))
                                                                  : Container(),
                                                            ],
                                                          ),

                                                          // Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 150,
                                                                  child: CustomRichText(
                                                                      title:
                                                                          'Gen Loss Due To Asset Damage')),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  child: _buildGenLossAssetDamageTextField_web(
                                                                      context)),
                                                            ],
                                                          ),

                                                          // Dimens.boxHeight100,
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'Insurance Status'),
                                                          //     Dimens.boxWidth10,
                                                          //     SizedBox(
                                                          //       width: MediaQuery.of(
                                                          //                   context)
                                                          //               .size
                                                          //               .width /
                                                          //           5,
                                                          //       child: Text(
                                                          //           '${controller.incidentReportDetailsModel.value?.insurance_status_name}'),
                                                          //       // Obx(
                                                          //       //   () =>
                                                          //       //       DropdownWebWidget(
                                                          //       //     dropdownList:
                                                          //       //         controller
                                                          //       //             .typePermitList,
                                                          //       //     isValueSelected:
                                                          //       //         controller
                                                          //       //             .isTypePermitSelected
                                                          //       //             .value,
                                                          //       //     selectedValue:
                                                          //       //         controller
                                                          //       //             .selectedTypePermit
                                                          //       //             .value,
                                                          //       //     onValueChanged:
                                                          //       //         controller
                                                          //       //             .onValueChanged,
                                                          //       //   ),
                                                          //       // ),
                                                          //     ),
                                                          //   ],
                                                          // )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight5,
                                                controller.rCAUploadRequiredValue ==
                                                        true
                                                    ? Row(
                                                        children: [
                                                          CustomRichText(
                                                              title:
                                                                  '              RCA Required: '),
                                                          Expanded(
                                                            child:
                                                                _buildRCATextField_web(
                                                                    context),
                                                          )
                                                        ],
                                                      )
                                                    : Dimens.box0,

                                                Dimens.boxHeight5,
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title:
                                                            ' Insurance Applicable: '),
                                                    Dimens.boxWidth10,
                                                    Obx(
                                                      () => SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Switch(
                                                          activeColor:
                                                              Colors.green,
                                                          value: controller
                                                              .insuranceApplicableValue
                                                              .value,
                                                          onChanged: (value) {
                                                            controller
                                                                .insuranceApplicableValue
                                                                .value = value;
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight5,
                                                Row(
                                                  children: [
                                                    controller.insuranceApplicableValue ==
                                                            true
                                                        ? CustomRichText(
                                                            title:
                                                                '    Insurance Available: ')
                                                        : Container(),
                                                    Dimens.boxWidth10,
                                                    controller.insuranceApplicableValue ==
                                                            true
                                                        ? SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                5,
                                                            child:
                                                                _buildInsuranceAvailableTextField_web(
                                                                    context))
                                                        : Container(),
                                                  ],
                                                ),
                                                Dimens.boxHeight10,

                                                ///Personal Details
                                                Container(
                                                  margin: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 237, 240, 242),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Details of injured person involved",
                                                          style: Styles.blue700,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Name of the person involved/ injured: ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child:
                                                                          Obx(
                                                                        () =>
                                                                            DropdownWebWidget(
                                                                          dropdownList:
                                                                              controller.incidentInvestigationVerificationDoneByList,
                                                                          isValueSelected: controller
                                                                              .isincidentInvestigationVerificationDoneByListSelected
                                                                              .value,
                                                                          selectedValue: controller
                                                                              .selectedIncidentInvestigationVerificationDoneByList
                                                                              .value,
                                                                          onValueChanged:
                                                                              controller.onValueIncidentVerificationChanged,
                                                                        ),
                                                                      ),
                                                                      // _buildCorrectiveActionTextField_web(
                                                                      //     context)
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Gender:',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    buildGenderRadioButton(
                                                                        'Male',
                                                                        context),
                                                                    buildGenderRadioButton(
                                                                        'Female',
                                                                        context),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Trade/ designation:  ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child:
                                                                          Obx(
                                                                        () =>
                                                                            DropdownWebWidget(
                                                                          dropdownList:
                                                                              controller.incidentInvestigationVerificationDoneByList,
                                                                          isValueSelected: controller
                                                                              .isincidentInvestigationVerificationDoneByListSelected
                                                                              .value,
                                                                          selectedValue: controller
                                                                              .selectedIncidentInvestigationVerificationDoneByList
                                                                              .value,
                                                                          onValueChanged:
                                                                              controller.onValueIncidentVerificationChanged,
                                                                        ),
                                                                      ),
                                                                      // _buildCorrectiveActionTextField_web(
                                                                      //     context)
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Address:  ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                5,
                                                                        child: _buildAddressTextField_web(
                                                                            context)
                                                                        // _buildCorrectiveActionTextField_web(
                                                                        //     context)
                                                                        ),
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Name of the contractor:  ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child:
                                                                          Obx(
                                                                        () =>
                                                                            DropdownWebWidget(
                                                                          dropdownList:
                                                                              controller.incidentInvestigationVerificationDoneByList,
                                                                          isValueSelected: controller
                                                                              .isincidentInvestigationVerificationDoneByListSelected
                                                                              .value,
                                                                          selectedValue: controller
                                                                              .selectedIncidentInvestigationVerificationDoneByList
                                                                              .value,
                                                                          onValueChanged:
                                                                              controller.onValueIncidentVerificationChanged,
                                                                        ),
                                                                      ),
                                                                      // _buildCorrectiveActionTextField_web(
                                                                      //     context)
                                                                    ),
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Body part injured / involved & nature of injury:   ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child:
                                                                          Obx(
                                                                        () =>
                                                                            DropdownWebWidget(
                                                                          dropdownList:
                                                                              controller.incidentInvestigationVerificationDoneByList,
                                                                          isValueSelected: controller
                                                                              .isincidentInvestigationVerificationDoneByListSelected
                                                                              .value,
                                                                          selectedValue: controller
                                                                              .selectedIncidentInvestigationVerificationDoneByList
                                                                              .value,
                                                                          onValueChanged:
                                                                              controller.onValueIncidentVerificationChanged,
                                                                        ),
                                                                      ),
                                                                      // _buildCorrectiveActionTextField_web(
                                                                      //     context)
                                                                    ),
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Work experience (in years):  ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                5,
                                                                        child: _buildWorkExperienceTextField_web(
                                                                            context)
                                                                        // _buildCorrectiveActionTextField_web(
                                                                        //     context)
                                                                        ),
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight5,
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Plant & Equipment involved: ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child:
                                                                          Obx(
                                                                        () =>
                                                                            DropdownWebWidget(
                                                                          dropdownList:
                                                                              controller.eqipmentNameList,
                                                                          isValueSelected: controller
                                                                              .isEquipmentNameSelected
                                                                              .value,
                                                                          selectedValue: controller
                                                                              .selectedEquipmentName
                                                                              .value,
                                                                          onValueChanged:
                                                                              controller.onValueChanged,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight5,
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Exact location of incident:   ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                5,
                                                                        child: _buildExactLocationTextField_web(
                                                                            context)
                                                                        // _buildCorrectiveActionTextField_web(
                                                                        //     context)
                                                                        ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ///Investigation Block
                                                Dimens.boxHeight5,

                                                ///Investigation
                                                Container(
                                                  margin: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 237, 240, 242),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Investigation",
                                                          style: Styles.blue700,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'What task or type of job was being performed? ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        1)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Was the person involved in these activities trained and if so, when? ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        2)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Was the person authorized/licensed to carry out that type of work / use machinery? ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        3)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'What instructions had been given? By Whom? ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        4)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'What safety equipment and /protection was used/ available? ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        5)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Were correct safe procedures being observed? ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        6)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'What unsafe condition contributed to the incident? ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        7)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Did unsafe act/s cause the incident? If yes. Mention the same ',
                                                                      style: Styles
                                                                          .black15,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight3,
                                                                    investigationTextfields(
                                                                        context,
                                                                        8)
                                                                  ],
                                                                ),
                                                                Dimens
                                                                    .boxHeight10,
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                Dimens.boxHeight20,
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title:
                                                            'Why Why Analysis Required: '),
                                                    Dimens.boxWidth10,
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      child: controller.id !=
                                                              null
                                                          ? controller
                                                                      .incidentReportDetailsModel
                                                                      .value
                                                                      ?.legal_applicability_name ==
                                                                  "YES"
                                                              ? Obx(
                                                                  () => Switch(
                                                                    activeColor:
                                                                        Colors
                                                                            .green,
                                                                    value: controller
                                                                        .legalApplicabilityDetailValue
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      controller
                                                                          .legalApplicabilityDetailValue
                                                                          .value = value;
                                                                      print(
                                                                          'why why analysis required: ${controller.whyWhyAnalysisValue.value}');
                                                                    },
                                                                  ),
                                                                )
                                                              : Obx(
                                                                  () => Switch(
                                                                    activeColor:
                                                                        Colors
                                                                            .green,
                                                                    value: controller
                                                                        .whyWhyAnalysisFalseValue
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      controller
                                                                          .whyWhyAnalysisFalseValue
                                                                          .value = value;
                                                                      print(
                                                                          'why why analysis false: ${controller.whyWhyAnalysisValue.value}');
                                                                    },
                                                                  ),
                                                                )
                                                          : Obx(
                                                              () => Switch(
                                                                activeColor:
                                                                    Colors
                                                                        .green,
                                                                value: controller
                                                                    .whyWhyAnalysisValue
                                                                    .value,
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .whyWhyAnalysisValue
                                                                      .value = value;
                                                                  print(
                                                                      'Why Why Analysis required: ${controller.whyWhyAnalysisValue.value}');
                                                                },
                                                              ),
                                                            ),
                                                    ),
                                                  ],
                                                ),

                                                ///Why Why Analysis Block
                                                controller.whyWhyAnalysisValue ==
                                                        true
                                                    ? Container(
                                                        margin:
                                                            EdgeInsets.all(20),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        child: Container(
                                                          color: Color.fromARGB(
                                                              255,
                                                              237,
                                                              240,
                                                              242),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Why Why Analysis",
                                                                style: Styles
                                                                    .blue700,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        ' Why 1: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        'Why 2: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        'Why 3: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        'Why 4: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Text(
                                                                        'Why 5: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          1),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          3),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          5),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          7),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          9),
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        ' Cause 1: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        'Cause 2: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        'Cause 3: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight8,
                                                                      Text(
                                                                        'Cause 4: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight5,
                                                                      Text(
                                                                        'Cause 5: ',
                                                                        style: Styles
                                                                            .black15,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          2),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          4),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          6),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          8),
                                                                      whyWhyAnalysisTextfields(
                                                                          context,
                                                                          10),
                                                                    ],
                                                                  ),
                                                                  // Column(
                                                                  //   crossAxisAlignment:
                                                                  //       CrossAxisAlignment
                                                                  //           .start,
                                                                  //   children: [
                                                                  //     Row(
                                                                  //       crossAxisAlignment:
                                                                  //           CrossAxisAlignment.start,
                                                                  //       children: [
                                                                  //         Text(
                                                                  //           ' Why 1: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             1),
                                                                  //         Dimens
                                                                  //             .boxWidth10,
                                                                  //         Text(
                                                                  //           'Cause 1:  ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             2),
                                                                  //       ],
                                                                  //     ),
                                                                  //     Dimens
                                                                  //         .boxHeight5,
                                                                  //     Row(
                                                                  //       crossAxisAlignment:
                                                                  //           CrossAxisAlignment.start,
                                                                  //       children: [
                                                                  //         Text(
                                                                  //           'Why 2: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             3),
                                                                  //         Dimens
                                                                  //             .boxWidth10,
                                                                  //         Text(
                                                                  //           'Cause 2: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             4),
                                                                  //       ],
                                                                  //     ),
                                                                  //     Dimens
                                                                  //         .boxHeight5,
                                                                  //     Row(
                                                                  //       crossAxisAlignment:
                                                                  //           CrossAxisAlignment.start,
                                                                  //       children: [
                                                                  //         Text(
                                                                  //           'Why 3: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             5),
                                                                  //         Dimens
                                                                  //             .boxWidth10,
                                                                  //         Text(
                                                                  //           'Cause 3: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             6),
                                                                  //       ],
                                                                  //     ),
                                                                  //     Dimens
                                                                  //         .boxHeight5,
                                                                  //     Row(
                                                                  //       crossAxisAlignment:
                                                                  //           CrossAxisAlignment.start,
                                                                  //       children: [
                                                                  //         Text(
                                                                  //           'Why 4: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             7),
                                                                  //         Dimens
                                                                  //             .boxWidth10,
                                                                  //         Text(
                                                                  //           'Cause 4: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             8),
                                                                  //       ],
                                                                  //     ),
                                                                  //     Dimens
                                                                  //         .boxHeight5,
                                                                  //     Row(
                                                                  //       crossAxisAlignment:
                                                                  //           CrossAxisAlignment.start,
                                                                  //       children: [
                                                                  //         Text(
                                                                  //           'Why 5: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             9),
                                                                  //         Dimens
                                                                  //             .boxWidth10,
                                                                  //         Text(
                                                                  //           'Cause 5: ',
                                                                  //           style:
                                                                  //               Styles.black15,
                                                                  //         ),
                                                                  //         Dimens
                                                                  //             .boxHeight3,
                                                                  //         whyWhyAnalysisTextfields(
                                                                  //             context,
                                                                  //             10),
                                                                  //       ],
                                                                  //     ),
                                                                  //     Dimens
                                                                  //         .boxHeight5,
                                                                  //   ],
                                                                  // ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Dimens.box0,

                                                ///Root Cause
                                                Container(
                                                  margin: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 237, 240, 242),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Root Cause (s)/ Underlying causes",
                                                          style: Styles.blue700,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  ' 1. ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                rootCauseTextfields(
                                                                    context, 1)
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '2. ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                rootCauseTextfields(
                                                                    context, 2)
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '3. ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                rootCauseTextfields(
                                                                    context, 3)
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ///Immediate Correction
                                                Container(
                                                  margin: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 237, 240, 242),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Immediate Correction",
                                                          style: Styles.blue700,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  ' 1. ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                immediateCorrectionTextfields(
                                                                    context, 1)
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '2. ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                immediateCorrectionTextfields(
                                                                    context, 2)
                                                              ],
                                                            ),
                                                            Dimens.boxHeight5,
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  '3. ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                immediateCorrectionTextfields(
                                                                    context, 3)
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ///Proposed action plan
                                                Container(
                                                  margin: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 237, 240, 242),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Proposed Action Plan (based on CA & PA)",
                                                          style: Styles.blue700,
                                                        ),
                                                        Dimens.boxHeight10,
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  'Action as per plan ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                actionPlanTextfields(
                                                                    context)
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  'Responsibility ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  child: Obx(
                                                                    () =>
                                                                        DropdownWebWidget(
                                                                      dropdownList:
                                                                          controller
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
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  'Target Date ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  child:
                                                                      _buildTargetDateField_web(
                                                                    context,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  'Remark ',
                                                                  style: Styles
                                                                      .black15,
                                                                ),
                                                                remarkTextfields(
                                                                    context)
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ////Investigation team
                                                Container(
                                                  // width: MediaQuery.of(context).size.width / 1.15,
                                                  margin: EdgeInsets.all(20),
                                                  // height: Get.height,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1100,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "Investigation Team",
                                                          style: Styles.blue700,
                                                        ),
                                                      ),
                                                      Dimens.boxHeight10,
                                                      Obx(
                                                        () => Wrap(children: [
                                                          Row(children: [
                                                            Dimens.boxWidth80,
                                                            Text('Sr.No.'),
                                                            Dimens.boxWidth180,
                                                            Text('Name'),
                                                            SizedBox(
                                                              width: 310,
                                                            ),
                                                            Text('Designation'),
                                                            Dimens.boxWidth200,
                                                            Text('Signature'),

                                                            // Text('Action'),
                                                          ]),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Column(
                                                            children: []
                                                              ..addAll(controller
                                                                  .investigationTeam
                                                                  .map(
                                                                      (element) =>
                                                                          Row(
                                                                            children: [
                                                                              // Text('${element.name}'),
                                                                              // Text('${element.required_by_date}')

                                                                              investigationTeamData('${element.srNumber}', '${element.name}', '${element.designation}', context),
                                                                            ],
                                                                          ))),
                                                          ),

                                                          // supplierActionData(
                                                          //     '2',
                                                          //     'Material Replinishment',
                                                          //     context,
                                                          //     1),
                                                          // supplierActionData(
                                                          //     '3',
                                                          //     'Preventive Action Plan',
                                                          //     context,
                                                          //     2),
                                                          // supplierActionData(
                                                          //     '4',
                                                          //     'Claim Closure Date',
                                                          //     context,
                                                          //     3)
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3,
                                                                  child:
                                                                      CustomTextField(
                                                                    textController:
                                                                        controller
                                                                            .investigationTeamSrNumberTextFieldController,
                                                                    label:
                                                                        'Serial Number',
                                                                  )),
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3,
                                                                  child:
                                                                      CustomTextField(
                                                                    textController:
                                                                        controller
                                                                            .investigationTeamNameTextFieldController,
                                                                    label:
                                                                        'Name',
                                                                  )),

                                                              //Designation
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3,
                                                                  child:
                                                                      CustomTextField(
                                                                    textController:
                                                                        controller
                                                                            .investigationTeamDesignationTextFieldController,
                                                                    label:
                                                                        'Designation',
                                                                  )),

                                                              ElevatedButton(
                                                                child: Text(
                                                                  'Add',
                                                                  style: TextStyle(
                                                                      color: ColorValues
                                                                          .whiteColor),
                                                                ),
                                                                onPressed: () {
                                                                  controller
                                                                      .updateInvestigationTeamText(
                                                                    controller
                                                                        .investigationTeamSrNumberTextFieldController
                                                                        .text,
                                                                    controller
                                                                        .investigationTeamNameTextFieldController
                                                                        .text,
                                                                    controller
                                                                        .investigationTeamDesignationTextFieldController
                                                                        .text,

                                                                    // controller.isCheckedRequire
                                                                    //     .value
                                                                  );
                                                                  controller
                                                                      .investigationTeamSrNumberTextFieldController
                                                                      .clear();
                                                                  controller
                                                                      .investigationTeamNameTextFieldController
                                                                      .clear();
                                                                  controller
                                                                      .investigationTeamDesignationTextFieldController
                                                                      .clear();
                                                                  // controller.isCheckedRequire
                                                                  //     .value = false;
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                        ]),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                /// FILE UPLOAD WIDGET
                                                Container(
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

                                                ////Container used
                                                // Container(
                                                //       width: MediaQuery.of(context).size.width / 1,
                                                //       height: 50,
                                                //       color: Colors.red,
                                                //     ),
                                              ],
                                            ),
                                          ),
                                          ////

                                          ///Incident Report History
                                          controller.id != null
                                              ? Container(
                                                  margin: Dimens.edgeInsets20,
                                                  height: ((controller
                                                                  .historyList
                                                                  ?.length ??
                                                              0) *
                                                          50) +
                                                      125,
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
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Incident Report History ",
                                                              style: Styles
                                                                  .blue700,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        color: ColorValues
                                                            .greyLightColour,
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ScrollableTableView(
                                                          columns: [
                                                            "Time Stamp",
                                                            "Module Ref ID",
                                                            "Comment",
                                                            "Module Type",
                                                            "Status",
                                                          ].map((column) {
                                                            return TableViewColumn(
                                                              label: column,
                                                              minWidth:
                                                                  Get.width *
                                                                      0.15,
                                                            );
                                                          }).toList(),
                                                          rows: [
                                                            ...List.generate(
                                                              controller
                                                                      .historyList
                                                                      ?.length ??
                                                                  0,
                                                              (index) {
                                                                var getHistoryListDetails =
                                                                    controller
                                                                            .historyList?[
                                                                        index];
                                                                return [
                                                                  '${getHistoryListDetails?.createdAt}',
                                                                  '${getHistoryListDetails?.moduleRefId ?? ''}',
                                                                  '${getHistoryListDetails?.comment ?? ''}',
                                                                  '${getHistoryListDetails?.moduleType ?? ''}',
                                                                  '${getHistoryListDetails?.status_name ?? ''}',
                                                                ];
                                                              },
                                                            ),
                                                            // [
                                                          ].map((record) {
                                                            return TableViewRow(
                                                              height: 30,
                                                              cells: record
                                                                  .map((value) {
                                                                return TableViewCell(
                                                                  child: Text(
                                                                      value),
                                                                );
                                                              }).toList(),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 150,
                                              ),
                                              CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appRedColor,
                                                onPressed: () {
                                                  Get.offAndToNamed(Routes
                                                      .incidentReportListWeb);
                                                },
                                                text: 'Cancel',
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              controller.id == null
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appGreenColor,
                                                      onPressed: () {
                                                        // showAlertDialog();
                                                        controller
                                                            .createIncidentReport();
                                                      },
                                                      text: 'Submit',
                                                    )
                                                  : CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appDarkBlueColor,
                                                      onPressed: () {
                                                        // showAlertDialog();
                                                        controller
                                                            .updateIncidentReport();
                                                      },
                                                      text: 'Update',
                                                    ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              controller.incidentReportDetailsModel
                                                          .value?.status_short ==
                                                      "Rejected"
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appGreenColor,
                                                      onPressed: () {
                                                        // showAlertDialog();
                                                        controller
                                                            .createIncidentReport();
                                                      },
                                                      text: 'Re-Submit',
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
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

        // ),
      );

  investigationTeamData(
    String? serialNumber,
    String? name,
    String? designation,
    BuildContext context,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          Text('$serialNumber'),
          Spacer(),
          Dimens.boxWidth10,
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Container(
                child: Container(
              height: 30,
              // decoration:
              //     BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$name')),
            )),
          ),
          Spacer(),

          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Container(
                child: Container(
              height: 30,
              // decoration:
              //     BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$designation')),
            )),
          ),
          Spacer(),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width / 5,
          //   child: Container(
          //       child: Container(
          //     height: 30,
          //     // decoration:
          //     //     BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
          //     child: Center(child: Text('')),
          //   )),
          // ),
          // Spacer(),

          // position == 1 || position == 2 || position == 3
          // ?
          // ActionButton(
          //   icon: Icons.remove,
          //   label: 'Delete',
          //   // onPress:
          //   //     () async {},
          //   color: Colors.red,
          //   onPressed: () {
          //     controller.removeRow(index: 0);
          //   },
          // )

          // : Text('data')
        ],
      ),
    );
  }

  ///Below All For WEB
  ///
  /// Action Taken date and Time
  Widget _buildActionTakenDateTimeField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.topLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 385),
      //     child: RichText(
      //       text: TextSpan(
      //           text: position == 0 ? 'Start Date: ' : 'Valid Till: ',
      //           style: Styles.blackBold16, children: []),
      //     ),
      //   ),
      // ),
      // Align(
      //     alignment: Alignment.topLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(right: 385),
      //       child: CustomRichText(
      //         title: position == 0 ? '$title1' : '$title2',
      //       ),
      //     )),
      Dimens.boxHeight5,
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
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
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 3.7
              : MediaQuery.of(context).size.width / 1.0,
          child: TextField(
            onTap: () {
              pickActionTakenDateTime_web(context, 0);

              // : null;
            },
            controller: controller.actionTakenDateTimeCtrlr,

            // :null,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_month)
                // focusedErrorBorder:
                // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
                ),
          ),
        ),
      ),
    ]);
  }

//Action Taken Date and Time
  Future pickActionTakenDateTime_web(BuildContext context, int position) async {
    var dateTime = controller.selectedActionTakenTime.value;

    final date = await pickActionTakenDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickActionTakenTime_web(context, position);
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
    controller.selectedActionTakenTime.value;

    controller.actionTakenDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.actionTakenDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    // controller.validTillTimeCtrlr.text =
    //     DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    // controller.validTillTimeCtrlrBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    //         .format(dateTime.add(Duration(hours: 8)));
    // controller.startDateTimeCtrlrBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    //         .format(dateTime);
    controller.actionTakenDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    print(
        'Action TakenDate & Time ${controller.actionTakenDateTimeCtrlrBuffer}');
  }

  Future<DateTime?> pickActionTakenDate_web(
      BuildContext context, int position) async {
    DateTime? dateTime = controller.selectedActionTakenTime.value;

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

  Future<TimeOfDay?> pickActionTakenTime_web(
      BuildContext context, int position) async {
    DateTime dateTime = controller.selectedActionTakenTime.value;

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

  ///
  /// Reporting date and Time
  Widget _buildReportingDateTimeField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      Dimens.boxHeight5,
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
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
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 3.7
              : MediaQuery.of(context).size.width / 1.0,
          child: TextField(
            onTap: () {
              pickReportingDateTime_web(context, 0);

              // : null;
            },
            controller: controller.reportingDateTimeCtrlr,

            // :null,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_month)
                // focusedErrorBorder:
                // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
                ),
          ),
        ),
      ),
    ]);
  }

//Start Reporting Date and Time
  Future pickReportingDateTime_web(BuildContext context, int position) async {
    var dateTime = controller.selectedReportingDateTime.value;

    final date = await pickReportingDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickReportingTime_web(context, position);
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
    controller.selectedReportingDateTime.value;

    controller.reportingDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.reportingDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    // controller.validTillTimeCtrlr.text =
    //     DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    // controller.validTillTimeCtrlrBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    //         .format(dateTime.add(Duration(hours: 8)));
    // controller.startDateTimeCtrlrBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    //         .format(dateTime);
    controller.reportingDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    print('Reporting Date & Time ${controller.reportingDateTimeCtrlrBuffer}');
  }

  Future<DateTime?> pickReportingDate_web(
      BuildContext context, int position) async {
    DateTime? dateTime = controller.selectedReportingDateTime.value;

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

  Future<TimeOfDay?> pickReportingTime_web(
      BuildContext context, int position) async {
    DateTime dateTime = controller.selectedReportingDateTime.value;

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

  /// Incident date and Time
  Widget _buildIncidentDateTimeField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.topLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 385),
      //     child: RichText(
      //       text: TextSpan(
      //           text: position == 0 ? 'Start Date: ' : 'Valid Till: ',
      //           style: Styles.blackBold16, children: []),
      //     ),
      //   ),
      // ),
      // Align(
      //     alignment: Alignment.topLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(right: 385),
      //       child: CustomRichText(
      //         title: position == 0 ? '$title1' : '$title2',
      //       ),
      //     )),
      Dimens.boxHeight5,
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
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
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 3.9
              : MediaQuery.of(context).size.width / 1.0,
          child: TextField(
            onTap: () {
              pickDateTime_web(context);

              // : null;
            },
            controller: controller.startDateTimeCtrlr,

            // :null,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_month)
                // focusedErrorBorder:
                // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
                ),
          ),
        ),
      ),
      Dimens.boxHeight5,
    ]);
  }

//Start Date and valid Till
  Future pickDateTime_web(
    BuildContext context,
  ) async {
    var dateTime = controller.selectedBreakdownTime.value;

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
    controller.selectedBreakdownTime.value;

    controller.startDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.startDateTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime);

    controller.startDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    print('Incident reportDate & Time ${controller.startDateTimeCtrlrBuffer}');
  }

  Future<DateTime?> pickDate_web(
    BuildContext context,
  ) async {
    DateTime? dateTime = controller.selectedBreakdownTime.value;

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

  Future<TimeOfDay?> pickTime_web(
    BuildContext context,
  ) async {
    DateTime dateTime = controller.selectedBreakdownTime.value;

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

  ///Target Date

  Widget _buildTargetDateField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.topLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 385),
      //     child: RichText(
      //       text: TextSpan(
      //           text: position == 0 ? 'Start Date: ' : 'Valid Till: ',
      //           style: Styles.blackBold16, children: []),
      //     ),
      //   ),
      // ),
      // Align(
      //     alignment: Alignment.topLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(right: 385),
      //       child: CustomRichText(
      //         title: position == 0 ? '$title1' : '$title2',
      //       ),
      //     )),

      Container(
        height: MediaQuery.of(context).size.height * 0.040,
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
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 3.9
              : MediaQuery.of(context).size.width / 1.0,
          child: TextField(
            onTap: () {
              pickTargetDateTime_web(context);

              // : null;
            },
            controller: controller.targetDateTimeCtrlr,

            // :null,
            autofocus: false,
            decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_month)
                // focusedErrorBorder:
                // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
                ),
          ),
        ),
      ),
    ]);
  }

//Start Date and valid Till
  Future pickTargetDateTime_web(
    BuildContext context,
  ) async {
    var dateTime = controller.selectedtargetDateTime.value;

    final date = await pickTargetDate_web(context);
    if (date == null) {
      return;
    }

    // final time = await pickTargetTime_web(context);
    // if (time == null) {
    //   return;
    // }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      // time.hour,
      // time.minute,
    );
    controller.selectedtargetDateTime.value;

    controller.targetDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.targetDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.targetDateTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime);

    // controller.startDateTimeCtrlrBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    // print('Incident reportDate & Time ${controller.startDateTimeCtrlrBuffer}');
  }

  Future<DateTime?> pickTargetDate_web(
    BuildContext context,
  ) async {
    DateTime? dateTime = controller.selectedtargetDateTime.value;

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

  Future<TimeOfDay?> pickTargetTime_web(
    BuildContext context,
  ) async {
    DateTime dateTime = controller.selectedtargetDateTime.value;

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

  Widget _buildIncidentReportDescriptionField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text: TextSpan(
      //           text: 'Permit Description: ',
      //           style: Styles.blackBold16,
      //           children: [
      //             TextSpan(
      //               text: '*',
      //               style: TextStyle(
      //                 color: ColorValues.orangeColor,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        // margin: EdgeInsets.only(left: 5, right: 10),
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(
            controller: controller.incidentreportDescriptionCtrlr,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            maxLength: 200,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isIncidentDescriptionInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isIncidentDescriptionInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isIncidentDescriptionInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isIncidentDescriptionInvalid.value = false;
              } else {
                controller.isIncidentDescriptionInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

//Insurance Remarks
  Widget _buildInsuranceRemarkField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text: TextSpan(
      //           text: 'Permit Description: ',
      //           style: Styles.blackBold16,
      //           children: [
      //             TextSpan(
      //               text: '*',
      //               style: TextStyle(
      //                 color: ColorValues.orangeColor,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        // width: 500,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          child: TextField(
            controller: controller.insuranceRemarkTextCtrlr,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            maxLength: 200,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isInsuranceRemarkTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isInsuranceRemarkTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isInsuranceRemarkTextInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isInsuranceRemarkTextInvalid.value = false;
              } else {
                controller.isInsuranceRemarkTextInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  ///Radio Widget
  Widget buildRadioButton(
      String severity, Color color, Color color2, BuildContext context) {
    return Obx(() {
      return Container(
        height: 35,
        width: MediaQuery.of(context).size.width / 5,
        child: RadioListTile(
          dense: true,
          title: Container(
              color: color,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  severity,
                  style: TextStyle(color: color2),
                ),
              )),
          value: severity,
          groupValue: controller.selectedSeverity.value,
          onChanged: (value) {
            controller.setSelectedSeverity(value as String);
            print('Incident Severity:${controller.selectedSeverity.value}');
          },
        ),
      );
    });
  }

  ///Gender Radio
  Widget buildGenderRadioButton(String gender, BuildContext context) {
    return Obx(() {
      return Container(
        height: 35,
        width: MediaQuery.of(context).size.width / 9.8,
        child: RadioListTile(
          dense: true,
          title: Container(
              // color: color,
              child: Text(
            gender,
            style: Styles.black15,
            // style: TextStyle(color: color2),
          )),
          value: gender,
          groupValue: controller.selectedGender.value,
          onChanged: (value) {
            controller.setSelectedGender(value as String);
            print('Gender:${controller.selectedGender.value}');
          },
        ),
      );
    });
  }

  Widget _buildVerifiedApprovedTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),

      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 1.44
            : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.verifiedApprovedTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isCorrectiveTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isVerifiedApprovedextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isVerifiedApprovedextInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isVerifiedApprovedextInvalid.value = false;
              } else {
                controller.isVerifiedApprovedextInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  Widget _buildCorrectiveActionTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),

      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 1.44
            : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.correctiveActionTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isCorrectiveTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isCorrectiveTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isCorrectiveTextInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isCorrectiveTextInvalid.value = false;
              } else {
                controller.isCorrectiveTextInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  Widget _buildIncidentReportTitleTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),

      Container(
        // height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.44
        //     : MediaQuery.of(context).size.width / 1.1,
        // margin: EdgeInsets.only(left: 10, right: 18),
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(
            controller: controller.titleTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isTitleTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isTitleTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText:
                  controller.isTitleTextInvalid.value ? "Required field" : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isTitleTextInvalid.value = false;
              } else {
                controller.isTitleTextInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  ///Esi Applicability Remark Textfield
  Widget _buildESIApplicabilityRemarkTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        // height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.44
        //     : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(
            controller: controller.ESIApplicabilityRemarkTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isESIApplicabilityInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isESIApplicabilityInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isESIApplicabilityInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isESIApplicabilityInvalid.value = false;
              } else {
                controller.isESIApplicabilityInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  ///Legal Applicability Remark Tefield
  Widget _buildLegalApplicabilityRemarkTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        // height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.44
        //     : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(
            controller: controller.legalApplicabilityRemarkTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isLegalApplicabilityInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isLegalApplicabilityInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isLegalApplicabilityInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isLegalApplicabilityInvalid.value = false;
              } else {
                controller.isLegalApplicabilityInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  ///Root cause block Textfield
  rootCauseTextfields(BuildContext context, int position) {
    return Container(
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
        textController: position == 1
            ? controller.rootCause1TextCtrlr
            : position == 2
                ? controller.rootCause2TextCtrlr
                : position == 3
                    ? controller.rootCause3TextCtrlr
                    : null,
      ),
    );
  }

  ///action plan Textfield
  actionPlanTextfields(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Color(0xFE50000),
        width: 0.5,
      )),
      height: MediaQuery.of(context).size.height * 0.040,
      // margin: Dimens.edgeInsets5,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 7,
        minWidth: 100,
      ),
      child:
          LoginCustomTextfield(textController: controller.actionPlanTextCtrlr),
    );
  }

  ///Remark for proposed action block textfield
  ///action plan Textfield
  remarkTextfields(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Color(0xFE50000),
        width: 0.5,
      )),
      height: MediaQuery.of(context).size.height * 0.040,
      // margin: Dimens.edgeInsets5,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 7,
        minWidth: 100,
      ),
      child: LoginCustomTextfield(textController: controller.remarkTextCtrlr),
    );
  }

  ///Immediate Correction block Textfield
  immediateCorrectionTextfields(BuildContext context, int position) {
    return Container(
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
        textController: position == 1
            ? controller.immediateCorrection1TextCtrlr
            : position == 2
                ? controller.immediateCorrection2TextCtrlr
                : position == 3
                    ? controller.immediateCorrection3TextCtrlr
                    : null,
      ),
    );
  }

  ///Investigation Textfield
  investigationTextfields(BuildContext context, int position) {
    return Container(
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
        textController: position == 1
            ? controller.typeOfJbTextCtrlr
            : position == 2
                ? controller.personInvolvedTextCtrlr
                : position == 3
                    ? controller.personAuthorizedInvolvedTextCtrlr
                    : position == 4
                        ? controller.instructionsTextCtrlr
                        : position == 5
                            ? controller.SafetyEquipmetsTextCtrlr
                            : position == 6
                                ? controller.correctSafeTextCtrlr
                                : position == 7
                                    ? controller.unsafeConditionsTextCtrlr
                                    : position == 8
                                        ? controller.unsafeIncidentTextCtrlr
                                        : null,
      ),
    );
  }

  whyWhyAnalysisTextfields(BuildContext context, int position) {
    return Container(
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
        textController: position == 1
            ? controller.why1TextCtrlr
            : position == 2
                ? controller.cause1TextCtrlr
                : position == 3
                    ? controller.why2TextCtrlr
                    : position == 4
                        ? controller.cause2TextCtrlr
                        : position == 5
                            ? controller.why3TextCtrlr
                            : position == 6
                                ? controller.cause3TextCtrlr
                                : position == 7
                                    ? controller.why4TextCtrlr
                                    : position == 8
                                        ? controller.cause4TextCtrlr
                                        : position == 9
                                            ? controller.why5TextCtrlr
                                            : position == 10
                                                ? controller.cause5TextCtrlr
                                                : null,
      ),
    );
  }

  Widget _buildRCATextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        // height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.44
        //     : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(
            controller: controller.rcaTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isRCAInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isRCAInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText:
                  controller.isRCAInvalid.value ? "Required field" : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isRCAInvalid.value = false;
              } else {
                controller.isRCAInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  //Exact location Textfield
  Widget _buildExactLocationTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        // height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.44
        //     : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.exactLocationTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            maxLines: 5,
            maxLength: 200,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isExactLoactionInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isExactLoactionInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isExactLoactionInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isExactLoactionInvalid.value = false;
              } else {
                controller.isExactLoactionInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  Widget _buildAddressTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        // height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.44
        //     : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.addressTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            maxLines: 5,
            maxLength: 200,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isAddressInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isAddressInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText:
                  controller.isAddressInvalid.value ? "Required field" : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isAddressInvalid.value = false;
              } else {
                controller.isAddressInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  Widget _buildInsuranceAvailableTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 1.44
            : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.insuranceAvailableTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isInsuranceAvailableInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isInsuranceAvailableInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isInsuranceAvailableInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isInsuranceAvailableInvalid.value = false;
              } else {
                controller.isInsuranceAvailableInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

//Work experience
  Widget _buildWorkExperienceTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 1.44
            : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.workExperienceTextCtrlr,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixText: 'Number',
              // label: Text('INR'),
              focusedErrorBorder: controller.isWorkExperienceInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isWorkExperienceInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isWorkExperienceInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              print('value Damaged${value.length}');
              if (value.trim().length > 2) {
                controller.isWorkExperienceInvalid.value = false;
              } else {
                controller.isWorkExperienceInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  ///Damaged Aseets cost
  Widget _buildDamagedAssetsCostTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 1.44
            : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.damagedAssetCostTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixText: 'INR',
              // label: Text('INR'),
              focusedErrorBorder: controller.isDamagedAssetCostTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isDamagedAssetCostTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isDamagedAssetCostTextInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              print('value Damaged${value.length}');
              if (value.trim().length > 2) {
                controller.isDamagedAssetCostTextInvalid.value = false;
              } else {
                controller.isDamagedAssetCostTextInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  ///Gen Loss Due To Asset Damage
  Widget _buildGenLossAssetDamageTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        width: Responsive.isDesktop(context)
            ? MediaQuery.of(context).size.width / 1.44
            : MediaQuery.of(context).size.width / 1.1,
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
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: TextField(
            controller: controller.genLossAssetDamageTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixText: 'INR',
              // label: Text('INR'),
              focusedErrorBorder:
                  controller.isGenLossAssetDamageTextInvalid.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorValues.redColorDark,
                          ),
                        )
                      : InputBorder.none,
              errorBorder: controller.isGenLossAssetDamageTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isGenLossAssetDamageTextInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 2) {
                controller.isGenLossAssetDamageTextInvalid.value = false;
              } else {
                controller.isGenLossAssetDamageTextInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }

  // emailDropdown(
  //   BuildContext context,
  //   String? title,
  // ) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width / 4.2,
  //         child: CustomMultiSelectDialogField(
  //           buttonText: '$title',
  //           title: 'Employees',
  //           // initialValue: [],
  //           initialValue: (controller.selectedEmployeeNameIdList.isNotEmpty)
  //               ? controller.selectedEmployeeNameIdList
  //               : [],
  //           items: controller.employeesList
  //               .map(
  //                 (equipmentCategory) => MultiSelectItem(
  //                   equipmentCategory.id,
  //                   equipmentCategory.name ?? '',
  //                 ),
  //               )
  //               .toList(),
  //           onConfirm: (selectedOptionsList) => {
  //             controller.employeesNameSelected(selectedOptionsList),
  //             print(
  //                 'Employees Name list Ids ${controller.selectedEmployeeNameIdList}')
  //           },
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () {},
  //         child: Icon(
  //           Icons.delete,
  //           color: Colors.red,
  //         ),
  //       )
  //       // ActionButton(
  //       //   icon: Icons.delete_outline,
  //       //   label: 'Delete',
  //       //   // onPress:
  //       //   //     () async {},
  //       //   color: Colors.red,
  //       //   onPressed: () {},
  //       // ),
  //     ],
  //   );
  // }
}
