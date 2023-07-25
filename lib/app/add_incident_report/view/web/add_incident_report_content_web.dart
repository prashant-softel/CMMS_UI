import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
              child: Center(
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
                            color: Colors.lightBlue.shade50,
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
                                              padding: const EdgeInsets.only(left: 50),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment : CrossAxisAlignment.end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                               CustomRichText(
                                                                title:
                                                                    'Block Name: '),
                                                                    Dimens.boxWidth10,
                                                                  SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: Obx(
                                                                () => DropdownWebWidget(
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
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                title:
                                                                    'Incident date & Time: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                            width:
                                                                MediaQuery.of(context)
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
                                                                    'Incident Title: '),
                                                              Dimens.boxWidth10,
                                                               SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  
                                                                  5,
                                                              child:
                                                                  _buildIncidentReportTitleTextField_web(
                                                                      context)),
                                            
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                               CustomRichText(
                                                                title:
                                                                    'Incident Description: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                child:
                                                                    _buildIncidentReportDescriptionField_web(
                                                                        context)),
                                            
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                title:
                                                                    'Incident Severity: '),
                                                              Dimens.boxWidth10,
                                                                SizedBox(
                                                                  child: Row(
                                                                  children: [
                                                                   
                                                                    Radio(
                                                                        value: false,
                                                                        groupValue:
                                                                            controller
                                                                                .isSelected
                                                                                .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .selectOption(
                                                                                  'Critical');
                                                                          print(
                                                                              'Radio Critical: ${controller.isSelected.value}');
                                                                        }),
                                                                    Container(
                                                                      color: ColorValues.appRedColor,
                                                                      child: Text(
                                                                        'Critical',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white),
                                                                      ),
                                                                    ),
                                                                    Radio(
                                                                        value: true,
                                                                        groupValue:
                                                                            controller
                                                                                .isSelected
                                                                                .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .selectOption(
                                                                                  'High');
                                                                          print(
                                                                              'Radio High: ${controller.isSelected.value}');
                                                                        }),
                                                                    Container(
                                                                      color: ColorValues.orangeColor,
                                                                      child: Text(
                                                                        'High',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white),
                                                                      ),
                                                                    ),
                                                                    Radio(
                                                                        value: true,
                                                                        groupValue:
                                                                            controller
                                                                                .isSelected
                                                                                .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .selectOption(
                                                                                  'Medium');
                                                                          print(
                                                                              'Radio Medium: ${controller.isSelected.value}');
                                                                        }),
                                                                    Container(
                                                                      color: ColorValues.appYellowColor,
                                                                      child: Text(
                                                                        'Medium',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white),
                                                                      ),
                                                                    ),
                                                                    Radio(
                                                                        value: true,
                                                                        groupValue:
                                                                            controller
                                                                                .isSelected
                                                                                .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .selectOption(
                                                                                  'Low');
                                                                          print(
                                                                              'Radio Low: ${controller.isSelected.value}');
                                                                        }),
                                                                    Container(
                                                                      color: ColorValues.appGreenColor,
                                                                      child: Text(
                                                                        'Low',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white),
                                                                      ),
                                                                    )
                                                                  ],
                                                                                         ),
                                                                ),
                                            
                                                            ],
                                                          ),
                                                          Dimens.boxWidth10,
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
                                                              child: Obx(
                                                                () => DropdownWebWidget(
                                                                  dropdownList: controller
                                                                      .victimNameList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isVictimNameListSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedVictimNameList
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueVictimNameChanged,
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
                                                                () => DropdownWebWidget(
                                                                  dropdownList: controller
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
                                                               CustomRichText(
                                                                title: 'Risk Type: '),
                                                                Dimens.boxWidth10,
                                                                SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: Obx(
                                                                () => DropdownWebWidget(
                                                                  dropdownList: controller
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
                                                          Dimens.boxHeight20,
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
                                                                    child: controller.id != null
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
                                                                               'Legal Detail applicability: ${controller.legalApplicabilityValue.value}');
                                                                         },
                                                                       ),
                                                                     )
                                                                                                                             : Obx(
                                                                       () => Switch(
                                                                         activeColor:
                                                                             Colors
                                                                                 .green,
                                                                         value: controller
                                                                             .legalApplicabilityDetailFalseValue
                                                                             .value,
                                                                         onChanged:
                                                                             (value) {
                                                                           controller
                                                                               .legalApplicabilityDetailFalseValue
                                                                               .value = value;
                                                                           print(
                                                                               'Legal Detail False applicability: ${controller.legalApplicabilityValue.value}');
                                                                         },
                                                                       ),
                                                                     )
                                                                                                                         : Obx(
                                                                                                                             () => Switch(
                                                                     activeColor:
                                                                         Colors
                                                                             .green,
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
                                                                  )
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
                                                              child: _buildDamagedAssetsCostTextField_web(
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
                                                                () => DropdownWebWidget(
                                                                  dropdownList: controller
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
                                                                    'Insurance Applicable: '),
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
                                                                        'Insurance Available: ')
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
                                                          Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                title:
                                                                    'Insurance Remark: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                child:
                                                                    _buildInsuranceRemarkField_web(
                                                                        context)),
                                                            ],
                                                          )
                                            
                                                        ],
                                                    
                                                      ),
                                                      ////Changes from here top for left Column
                                                      
                                            
                                                      ///Changes from here below for right Column
                                                      Dimens.boxWidth50,
                                                      Column(
                                                        crossAxisAlignment : CrossAxisAlignment.end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                               CustomRichText(
                                                              title:
                                                                  'Equipment Name: '),
                                                              Dimens.boxWidth10,
                                                              SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              child: Obx(
                                                                () => DropdownWebWidget(
                                                                  dropdownList: controller
                                                                      .eqipmentNameList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isEquipmentNameSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
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
                                                          // Dimens.boxHeight5,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                              title:
                                                                  'Reporting date & Time: '),
                                                              Dimens.boxWidth10,
                                                               SizedBox(
                                                            width:
                                                                MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                            child:
                                                                _buildReportingDateTimeField_web(
                                                              context,
                                                            ),
                                                          ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight255,
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
                                                              child:
                                                                  _buildActionTakenDateTimeField_web(
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
                                                                    'Incident Investigation Verification Done By: '),
                                                          ),
                                                          Dimens.boxWidth10,
                                                           SizedBox(
                                                            width:
                                                                MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                            child: Obx(
                                                              () => DropdownWebWidget(
                                                                dropdownList: controller
                                                                    .incidentInvestigationVerificationDoneByList,
                                                                isValueSelected:
                                                                    controller
                                                                        .isincidentInvestigationVerificationDoneByListSelected
                                                                        .value,
                                                                selectedValue: controller
                                                                    .selectedIncidentInvestigationVerificationDoneByList
                                                                    .value,
                                                                onValueChanged: controller
                                                                    .onValueIncidentVerificationChanged,
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
                                                                  'ESI Applicability: '),
                                                              Dimens.boxWidth10,
                                                                   SizedBox(
                                                                     width:
                                                                MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                     child: controller.id != null
                                                                                                                          ? controller
                                                                          .incidentReportDetailsModel
                                                                          .value
                                                                          ?.esi_applicability_name ==
                                                                      "YES"
                                                                                                                             ? Obx(
                                                                      () => Switch(
                                                                        activeColor:
                                                                            Colors
                                                                                .green,
                                                                        value: controller
                                                                            .esiApplicabilityDetailValue
                                                                            .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .esiApplicabilityDetailValue
                                                                              .value = value;
                                                                          print(
                                                                              'ESI Detail applicability: ${controller.esiApplicabilityDetailValue.value}');
                                                                        },
                                                                      ),
                                                                    )
                                                                 : Obx(
                                                                      () => Switch(
                                                                        activeColor:
                                                                            Colors
                                                                                .green,
                                                                        value: controller
                                                                            .esiApplicabilityDetailFalseValue
                                                                            .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .esiApplicabilityDetailFalseValue
                                                                              .value = value;
                                                                          print(
                                                                              'ESI Detail False applicability: ${controller.esiApplicabilityDetailFalseValue.value}');
                                                                        },
                                                                      ),
                                                                                                                               )
                                                                    : Obx(
                                                                       () => Switch(
                                                                      activeColor:
                                                                          Colors
                                                                              .green,
                                                                      value: controller
                                                                          .esiApplicabilityValue
                                                                          .value,
                                                                      onChanged:
                                                                          (value) {
                                                                        controller
                                                                            .esiApplicabilityValue
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
                                                               CustomRichText(
                                                              title:
                                                                  'RCA Upload Required: '),
                                                              Dimens.boxWidth10,
                                                               SizedBox(
                                                                  width:
                                                                MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                 child: controller.id != null
                                                                                                                       ? controller
                                                                            .incidentReportDetailsModel
                                                                            .value
                                                                            ?.rca_required_name ==
                                                                        "YES"
                                                                    ? Obx(
                                                                        () => Switch(
                                                                          activeColor:
                                                                              Colors
                                                                                  .green,
                                                                          value: controller
                                                                              .rCAUploadRequiredDetailValue
                                                                              .value,
                                                                          onChanged:
                                                                              (value) {
                                                                            controller
                                                                                .rCAUploadRequiredDetailValue
                                                                                .value = value;
                                                                            print(
                                                                                'RCA Detail Upload Required: ${controller.rCAUploadRequiredDetailValue.value}');
                                                                          },
                                                                        ),
                                                                      )
                                                                    : Obx(
                                                                        () => Switch(
                                                                          activeColor:
                                                                              Colors
                                                                                  .green,
                                                                          value: controller
                                                                              .rCAUploadRequiredDetailFalseValue
                                                                              .value,
                                                                          onChanged:
                                                                              (value) {
                                                                            controller
                                                                                .rCAUploadRequiredDetailFalseValue
                                                                                .value = value;
                                                                            print(
                                                                                'RCA Detail False Upload Required: ${controller.rCAUploadRequiredDetailFalseValue.value}');
                                                                          },
                                                                        ),
                                                                      )
                                                                                                                       : Obx(
                                                                    () => Switch(
                                                                      activeColor:
                                                                          Colors
                                                                              .green,
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
                                                          Dimens.boxHeight10,
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
                                                     
                                                     
                                                      Dimens.boxHeight100,
                                                      Row(
                                                        children: [
                                                          CustomRichText(
                                                          title:
                                                              'Insurance Status'),
                                                          Dimens.boxWidth10,
                                                          SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                          child: Obx(
                                                            () => DropdownWebWidget(
                                                              dropdownList: controller
                                                                  .typePermitList,
                                                              isValueSelected:
                                                                  controller
                                                                      .isTypePermitSelected
                                                                      .value,
                                                              selectedValue:
                                                                  controller
                                                                      .selectedTypePermit
                                                                      .value,
                                                              onValueChanged:
                                                                  controller
                                                                      .onValueChanged,
                                                            ),
                                                          ),
                                                        ),
                                            
                                                        ],
                                                      )
                                                        
                                            
                                                        ],
                                                      ),
                                                     
                                                    
                                                    
                                                
                                                    ],
                                                  ),
                                                   Dimens.boxHeight20,
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
                                              ?Container(
                                                margin: Dimens.edgeInsets20,
                                                height: 200,
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
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Incident Report History ",
                                                            style:
                                                                Styles.blue700,
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
                                                                child:
                                                                    Text(value),
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
                                                  backgroundColor: ColorValues.appRedColor,
                                                  onPressed: () {
                                                    // controller.saveAsDraft();
                                                  },
                                                  text: 'Cancel',
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                controller.id == null
                                                    ? CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues.appGreenColor,
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
                                                  controller.incidentReportDetailsModel.value?.status_short == "Rejected"
                                                  ?
                                                  CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues.appGreenColor,
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
            ),
          ],
        ),

        // ),
      );

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
        height: MediaQuery.of(context).size.height*0.050,
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
        height: MediaQuery.of(context).size.height*0.050,
        
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
      Padding(
        padding: const EdgeInsets.only(left: 1),
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
                focusedErrorBorder:
                    controller.isIncidentDescriptionInvalid.value
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
      ),
      Dimens.boxHeight10,
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
              focusedErrorBorder:
                  controller.isInsuranceRemarkTextInvalid.value
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
              errorText: controller.isTitleTextInvalid.value
                  ? "Required field"
                  : null,
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
              focusedErrorBorder:
                  controller.isDamagedAssetCostTextInvalid.value
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
