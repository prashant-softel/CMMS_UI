import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          toolbarHeight: 100,
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
                  margin: Dimens.edgeInsets16,
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
                                child: Text(" / Incident Report List",
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
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height: 35,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Block Name: '),
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Incident date & Time: '),
                                                      SizedBox(
                                                        height: 60,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Incident Title: '),
                                                      SizedBox(
                                                        height: 60,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Incident Description: '),
                                                      SizedBox(
                                                        height: 110,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Incident Severity: '),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Obx(
                                                          () => DropdownWidget(
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
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4.8,
                                                      child:
                                                          _buildIncidentDateTimeField_web(
                                                        context,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.8,
                                                        child:
                                                            _buildIncidentReportTitleTextField_web(
                                                                context)),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              4.9,
                                                          child:
                                                              _buildIncidentReportDescriptionField_web(
                                                                  context)),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                   
    
                                  
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Row(

                                                          children: [
                                                            
                                                            ///Start Here

                                                            // RadioListTile(
                                                            //   title: Text(
                                                            //       'Option 1'),
                                                            //   value: true,
                                                            //   groupValue:
                                                            //       controller
                                                            //           .isSelected
                                                            //           .value,
                                                            //   onChanged: (value) =>
                                                            //       controller
                                                            //           .selectOption(value!),
                                                            // ),

                                                            // ListView.builder(
                                                            //   itemCount: 10,
                                                            //   itemBuilder:
                                                            //       (BuildContext
                                                            //               context,
                                                            //           int index) {
                                                            //     return
                                                            //      SizedBox(
                                                            //       height: 50,
                                                            //        child: Expanded(
                                                            //          child: RadioListTile(
                                                            //             title: Text(
                                                            //                 'Option 2'),
                                                            //             value:
                                                            //                 false,
                                                            //             groupValue:
                                                            //                 'null',
                                                            //             onChanged:
                                                            //                 (value) {}),
                                                            //        ),
                                                            //      ),
                                                            //   },
                                                            //   shrinkWrap:
                                                            //       true, // Add this line to shrink-wrap the ListView
                                                            //   physics:
                                                            //       NeverScrollableScrollPhysics(),
                                                            // ),

                                                            ///End here
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
                                                                      'Radio Critical ${controller.isSelected.value}');
                                                                }),
                                                            Text(
                                                              'Critical',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
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
                                                                      'Radio High ${controller.isSelected.value}');
                                                                }),
                                                            Text(
                                                              'High',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .orange),
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
                                                                      'Radio Medium ${controller.isSelected.value}');
                                                                }),
                                                            Text(
                                                              'Medium',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .yellow),
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
                                                                      'Radio Low ${controller.isSelected.value}');
                                                                }),
                                                            Text(
                                                              'Low',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                      ],
                                                    ),
                                                    
                                                  ],
                                                ),
                                                
                                                /////
                                                SizedBox(
                                                  width: 70,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 35,
                                                    ),
                                                    CustomRichText(
                                                        title:
                                                            'Equipment Name: '),
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    CustomRichText(
                                                        title:
                                                            'Reporting date & Time: '),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Obx(
                                                          () => DropdownWidget(
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
                                                    ),
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4.8,
                                                      child:
                                                          _buildReportingDateTimeField_web(
                                                        context,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            //  Wrap(
                                            //   alignment: WrapAlignment.start,
                                            //    children: 
                                            //                     [
                                            //                       RadioListTile(
                                            //                       title: Text(
                                            //                           'Critical',style: TextStyle(color: Colors.red),),
                                            //                       value: true,
                                            //                       groupValue:
                                            //                           controller
                                            //                               .isSelected
                                            //                               .value,
                                            //                       onChanged: (value) {
                                            //                         controller
                                            //                               .selectOption('Critical');
                                            //                         print('Critical Rdio: ${ controller
                                            //                               .isSelected
                                            //                               .value}');
                                            //                       }
                                                                      
                                                                      
                                            //                     ),
                                            //                      RadioListTile(
                                            //                   title: Text(
                                            //                       'High',style: TextStyle(color: Colors.orange),),
                                            //                   value: false,
                                            //                   groupValue:
                                            //                       controller
                                            //                           .isSelected
                                            //                           .value,
                                            //                   onChanged: (value) {
                                            //                     controller
                                            //                           .selectOption('High');
                                            //                      print('Critical Rdio: ${ controller
                                            //                               .isSelected
                                            //                               .value}');
                                            //                   }
                                                                  
                                            //                 ),
                                            //                 RadioListTile(
                                            //                   title: Text(
                                            //                       'Medium',style: TextStyle(color: Colors.yellow),),
                                            //                   value: false,
                                            //                   groupValue:
                                            //                       controller
                                            //                           .isSelected
                                            //                           .value,
                                            //                   onChanged: (value) {
                                            //                      controller
                                            //                           .selectOption('Medium');
                                            //                      print('Critical Rdio: ${ controller
                                            //                               .isSelected
                                            //                               .value}');
                                            //                   }
                                                                 
                                            //                 ),
                                            //                 RadioListTile(
                                            //                   title: Text(
                                            //                       'Low',style: TextStyle(color: Colors.green),),
                                            //                   value: false,
                                            //                   groupValue:
                                            //                       controller
                                            //                           .isSelected
                                            //                           .value,
                                            //                   onChanged: (value) {
                                            //                     controller
                                            //                           .selectOption('Low');
                                            //                      print('Critical Rdio: ${ controller
                                            //                               .isSelected
                                            //                               .value}');
                                            //                   }
                                                                  
                                            //                 ),


                                            //                   ],
                                            //  ),
                                                           
                                           SizedBox(height: 20,),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Victim Name: '),
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                      SizedBox(
                                                        width: 140,
                                                        child: CustomRichText(
                                                            title:
                                                                'Incident Investigation Done By: '),
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                      ),
                                                      CustomRichText(
                                                          title: 'Risk Type: '),
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Legal Applicability: '),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Obx(
                                                          () => DropdownWidget(
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
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Obx(
                                                          () => DropdownWidget(
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
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Obx(
                                                          () => DropdownWidget(
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
                                                    ),
                                                    Dimens.boxHeight35,
                                                    controller.id != null
                                                        ? controller
                                                                    .incidentReportDetailsModel
                                                                    .value
                                                                    ?.legal_applicability_name ==
                                                                "YES"
                                                            ? Obx(
                                                                () => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20),
                                                                  child: Switch(
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
                                                                ),
                                                              )
                                                            : Obx(
                                                                () => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 20),
                                                                  child: Switch(
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
                                                                ),
                                                              )
                                                        : Obx(
                                                            () => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 20),
                                                              child: Switch(
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
                                                SizedBox(
                                                  width: 120,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    CustomRichText(
                                                        title:
                                                            'Action taken Date & Time: '),
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: CustomRichText(
                                                          title:
                                                              'Incident Investigation Verification Done By: '),
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                    ),
                                                    CustomRichText(
                                                        title:
                                                            'ESI Applicability: '),
                                                    SizedBox(
                                                      height: 45,
                                                    ),
                                                    CustomRichText(
                                                        title:
                                                            'RCA Upload Required: '),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.8,
                                                        child:
                                                            _buildActionTakenDateTimeField_web(
                                                                context)),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      child: Obx(
                                                        () => DropdownWidget(
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
                                                    Dimens.boxHeight20,
                                                    controller.id != null
                                                        ? controller
                                                                    .incidentReportDetailsModel
                                                                    .value
                                                                    ?.esi_applicability_name ==
                                                                "YES"
                                                            ? Obx(
                                                                () => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          170,
                                                                      top: 5),
                                                                  child: Switch(
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
                                                                ),
                                                              )
                                                            : Obx(
                                                                () => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          170,
                                                                      top: 5),
                                                                  child: Switch(
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
                                                                ),
                                                              )
                                                        : Obx(
                                                            () => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          170,
                                                                      top: 5),
                                                              child: Switch(
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
                                                    Dimens.boxHeight20,
                                                    controller.id != null
                                                        ? controller
                                                                    .incidentReportDetailsModel
                                                                    .value
                                                                    ?.rca_required_name ==
                                                                "YES"
                                                            ? Obx(
                                                                () => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          170,
                                                                      top: 2),
                                                                  child: Switch(
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
                                                                ),
                                                              )
                                                            : Obx(
                                                                () => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          170,
                                                                      top: 2),
                                                                  child: Switch(
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
                                                                ),
                                                              )
                                                        : Obx(
                                                            () => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          170,
                                                                      top: 2),
                                                              child: Switch(
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
                                                )
                                              ],
                                            ),
                                            Dimens.boxHeight10,

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
                                            SizedBox(height: 15),
                                            ////
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Dimens.boxHeight20,
                                                      SizedBox(
                                                        width: 150,
                                                        child: CustomRichText(
                                                            title:
                                                                'Damaged Asset Cost Approx: '),
                                                      ),
                                                      Dimens.boxHeight20,
                                                      SizedBox(
                                                        width: 150,
                                                        child: CustomRichText(
                                                            title:
                                                                'Asset Restoration Action Taken By: '),
                                                      ),
                                                      Dimens.boxHeight40,
                                                      CustomRichText(
                                                          title:
                                                              'Insurance Applicable: '),
                                                      Dimens.boxHeight50,
                                                      controller.insuranceApplicableValue ==
                                                              true
                                                          ? CustomRichText(
                                                              title:
                                                                  'Insurance Available: ')
                                                          : Container(),
                                                      Dimens.boxHeight30,
                                                      CustomRichText(
                                                          title:
                                                              'Insurance Remark: '),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.5,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child:
                                                              _buildDamagedAssetsCostTextField_web(
                                                                  context),
                                                        )),
                                                    Dimens.boxHeight10,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Obx(
                                                          () => DropdownWidget(
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
                                                    ),
                                                    Dimens.boxHeight10,
                                                    Obx(
                                                      () => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 20),
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
                                                    Dimens.boxHeight10,
                                                    controller.insuranceApplicableValue ==
                                                            true
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20),
                                                            child: SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4.8,
                                                                child:
                                                                    _buildInsuranceAvailableTextField_web(
                                                                        context)),
                                                          )
                                                        : Container(),
                                                    Dimens.boxHeight10,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              4.9,
                                                          child:
                                                              _buildInsuranceRemarkField_web(
                                                                  context)),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxWidth100,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Dimens.boxHeight20,
                                                    SizedBox(
                                                        width: 150,
                                                        child: CustomRichText(
                                                            title:
                                                                'Gen Loss Due To Asset Damage')),
                                                    SizedBox(height: 140),
                                                    CustomRichText(
                                                        title:
                                                            'Insurance Status')
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.5,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20),
                                                          child:
                                                              _buildGenLossAssetDamageTextField_web(
                                                                  context),
                                                        )),
                                                    Dimens.boxHeight125,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        child: Obx(
                                                          () => DropdownWidget(
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
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 150,
                                                ),
                                                CustomElevatedButton(
                                                  backgroundColor: Colors.red,
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
                                                            Colors.green,
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
                                                                .navyBlueColor,
                                                        onPressed: () {
                                                          // showAlertDialog();
                                                          controller
                                                              .updateIncidentReport();
                                                        },
                                                        text: 'Update',
                                                      ),
                                              ],
                                            )
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
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 50,
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
      ),
      Dimens.boxHeight20,
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
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 50,
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
      ),
      Dimens.boxHeight20,
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
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 50,
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
      ),
      Dimens.boxHeight20,
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
              controller: controller.incidentreportDescriptionCtrlr,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
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
      Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Container(
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
      ),
      Dimens.boxHeight10,
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
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
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
      ),
      Dimens.boxHeight10,
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
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
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
      ),
      Dimens.boxHeight10,
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
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
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
      ),
      Dimens.boxHeight10,
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
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
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
      ),
      Dimens.boxHeight10,
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
