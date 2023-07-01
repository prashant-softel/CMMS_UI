// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/add_incident_report.dart/add_incident_report_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/new_warranty_claim_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddIncidentReportContentWeb extends GetView<AddIncidentReportController> {
  AddIncidentReportContentWeb({super.key});

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  bool valuefirst = false;
  bool _switchValue = false;

  // final controller = Get.find<HomeController>();
  // final AddIncidentReportController controller = Get.find();

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
                        SizedBox(
                          height: 10,
                        ),
                        CustomAppBar(
                          title: 'Add Incident Report'.tr,
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
                                      return Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 35,
                                                    ),
                                                    CustomRichText(
                                                        title: 'Plant Name: '),
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      child: Obx(
                                                        () => DropdownWidget(
                                                          dropdownList: controller
                                                              .facilityPlantList,
                                                          isValueSelected:
                                                              controller
                                                                  .isFacilityPlantSelected
                                                                  .value,
                                                          selectedValue: controller
                                                              .selectedPlantFacility
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
                                                        _buildStartValidTillDateField_web(
                                                      context,
                                                      0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                          Radio(
                                                              value: 1,
                                                              groupValue:
                                                                  'null',
                                                              onChanged:
                                                                  (value) {}),
                                                          Text(
                                                            'Critical',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Radio(
                                                              value: 1,
                                                              groupValue:
                                                                  'null',
                                                              onChanged:
                                                                  (value) {}),
                                                          Text(
                                                            'High',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .orange),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Radio(
                                                              value: 1,
                                                              groupValue:
                                                                  'null',
                                                              onChanged:
                                                                  (index) {}),
                                                          Text(
                                                            'Medium',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Radio(
                                                              value: 1,
                                                              groupValue:
                                                                  'null',
                                                              onChanged:
                                                                  (index) {}),
                                                          Text(
                                                            'Low',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green),
                                                          )
                                                        ],
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
                                                      width:
                                                          MediaQuery.of(context)
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
                                                          selectedValue: controller
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
                                                        _buildStartValidTillDateField_web(
                                                      context,
                                                      0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    CustomRichText(
                                                        title: 'Victim Name: '),
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
                                                      height: 40,
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
                                                            left: 20),
                                                    child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.8,
                                                        child:
                                                            _buildVictimNameTextField_web(
                                                                context)),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                          selectedValue: controller
                                                              .selectedTypePermit
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
                                                      width:
                                                          MediaQuery.of(context)
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
                                                          selectedValue: controller
                                                              .selectedTypePermit
                                                              .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Obx(
                                                    () => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Switch(
                                                        activeColor:
                                                            Colors.green,
                                                        value: controller
                                                            .switchValue3.value,
                                                        onChanged: (value) {
                                                          controller
                                                              .switchValue3
                                                              .value = value;
                                                        },
                                                      ),
                                                    ),
                                                  ),
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
                                                    height: 35,
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
                                                    height: 15,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4.8,
                                                      child:
                                                          _buildActionTakenDateTimeField_web(
                                                              context)),
                                                  SizedBox(
                                                    height: 15,
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
                                                            .typePermitList,
                                                        isValueSelected: controller
                                                            .isTypePermitSelected
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedTypePermit
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxHeight20,
                                                  Obx(
                                                    () => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 170),
                                                      child: Switch(
                                                        activeColor:
                                                            Colors.green,
                                                        value: controller
                                                            .switchValue.value,
                                                        onChanged: (value) {
                                                          controller.switchValue
                                                              .value = value;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxHeight20,
                                                  Obx(
                                                    () => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 170),
                                                      child: Switch(
                                                        activeColor:
                                                            Colors.green,
                                                        value: controller
                                                            .switchValue2.value,
                                                        onChanged: (value) {
                                                          controller
                                                              .switchValue2
                                                              .value = value;
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
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
                                          SizedBox(height:15),
                                          ////
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Dimens.boxHeight20,
                                                     SizedBox(
                                                      width: 150,
                                                       child: CustomRichText(
                                                            title: 'Damaged Asset Cost Approx: '),
                                                     ),
                                                     Dimens.boxHeight20,
                                                     SizedBox(
                                                      width: 150,
                                                       child: CustomRichText(
                                                            title: 'Asset Restoration Action Taken By: '),
                                                     ),
                                                     Dimens.boxHeight40,
                                                     CustomRichText(
                                                            title: 'Insurance Applicable: '),
                                                      Dimens.boxHeight50,
                                                     CustomRichText(
                                                            title: 'Insurance Available: '),
                                                      Dimens.boxHeight30,
                                                     CustomRichText(
                                                            title: 'Insurance Remark: '),
                                              
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                   SizedBox(
                                                    width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 20),
                                                      child: _buildDamagedAssetsCostTextField_web(context),
                                                    )),
                                                    Dimens.boxHeight10,
                                                   Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                          selectedValue: controller
                                                              .selectedTypePermit
                                                              .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                   
                                                    Dimens.boxHeight10,
                                                  Obx(
                                                    () => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Switch(
                                                        activeColor:
                                                            Colors.green,
                                                        value: controller
                                                            .switchValue4.value,
                                                        onChanged: (value) {
                                                          controller
                                                              .switchValue4
                                                              .value = value;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                    Dimens.boxHeight10,
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                          selectedValue: controller
                                                              .selectedTypePermit
                                                              .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 30),
                                                    child: SizedBox(
                                                      width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              4.9,
                                                      child: _buildInsuranceRemarkField_web(context)),
                                                  ),
                                                  
                                                ],
                                              ),
                                              Dimens.boxWidth100,
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Dimens.boxHeight20,
                                                      SizedBox(
                                                        width: 150,
                                                        child: CustomRichText(title: 'Gen Loss Due To Asset Damage')),
                                                        SizedBox(height:200),
                                                        CustomRichText(title:'Insurance Status')
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                    width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            4.5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 20),
                                                      child: _buildGenLossAssetDamageTextField_web(context),
                                                    )),
                                                        Dimens.boxHeight200,
                                                        Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
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
                                                          selectedValue: controller
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
                                          )
                                        ],
                                      );
                                    }),

                               

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    CustomElevatedButton(
                                      backgroundColor: Colors.green,
                                      onPressed: () {
                                        // showAlertDialog();
                                        // controller.createWarrantyClaim();
                                      },
                                      text: 'Submit',
                                    ),
                                  ],
                                )

                              
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
  /// Incident and Reporting date Time
  Widget _buildStartValidTillDateField_web(
    BuildContext context,
    int position,
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
                position == 0
                    ? pickDateTime_web(context, 0)
                    : pickDateTime_web(context, 1);
                // : null;
              },
              controller: position == 0
                  ? controller.startDateTimeCtrlr
                  : controller.validTillTimeCtrlr,

              // :null,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
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
  Future pickDateTime_web(BuildContext context, int position) async {
    var dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final date = await pickDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context, position);
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
    position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value = dateTime;
    position == 0
        ? controller.startDateTimeCtrlr
        : controller.validTillTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: position == 0
              ? controller.startDateTimeCtrlr.text.length
              : controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.validTillTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    controller.validTillTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
            .format(dateTime.add(Duration(hours: 8)));
    controller.startDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context, int position) async {
    DateTime? dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
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

  Future<TimeOfDay?> pickTime_web(BuildContext context, int position) async {
    DateTime dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
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
                focusedErrorBorder: controller.isJobDescriptionInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : InputBorder.none,
                errorBorder: controller.isJobDescriptionInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isJobDescriptionInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isJobDescriptionInvalid.value = false;
                } else {
                  controller.isJobDescriptionInvalid.value = true;
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

  Widget _buildVictimNameTextField_web(BuildContext context) {
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
              controller: controller.victimNameTextCtrlr,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: controller.isVictimNameTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : InputBorder.none,
                errorBorder: controller.isVictimNameTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isVictimNameTextInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isVictimNameTextInvalid.value = false;
                } else {
                  controller.isVictimNameTextInvalid.value = true;
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
                if (value.trim().length > 3) {
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
                focusedErrorBorder: controller.isGenLossAssetDamageTextInvalid.value
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
                if (value.trim().length > 3) {
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
