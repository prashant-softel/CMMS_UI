import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_web.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddIncidentReportContentWeb extends GetView<AddIncidentReportController> {
  AddIncidentReportContentWeb({super.key});

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  // bool valuefirst = false;
  // bool _switchValue = false;

  // final controller = Get.find<HomeController>();
  final AddIncidentReportController controller = Get.find();

  @override
  Widget build(BuildContext context) => SelectionArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: HeaderWidget(),
          //   elevation: 0,
          //   toolbarHeight: 60,
          //   automaticallyImplyLeading: false,
          // ),
          body: Row(
            children: [
              Responsive.isMobile(context) || Responsive.isTablet(context)
                  ? Dimens.box0
                  : Container(),
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
                        Card(
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
                                          HeaderWidget(),
                                          Container(
                                            height: 55,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0),
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
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.home,
                                                  color: ColorValues
                                                      .greyLightColor,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.offNamed(Routes.home);
                                                  },
                                                  child: Text(
                                                    "Dashboard",
                                                    style: Styles.greyLight14,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.offNamed(Routes
                                                        .incidentReportListWeb);
                                                  },
                                                  child: Text(
                                                      " / Incident Report"
                                                          .toUpperCase(),
                                                      style:
                                                          Styles.greyLight14),
                                                ),
                                                controller.irId.value > 0
                                                    ? Text(
                                                        " / Update Incident Report"
                                                            .toUpperCase(),
                                                        style:
                                                            Styles.greyLight14)
                                                    : Text(
                                                        " / Add Incident Report"
                                                            .toUpperCase(),
                                                        style:
                                                            Styles.greyLight14)
                                              ],
                                            ),
                                          ),
                                          Dimens.boxHeight10,

                                          CustomAppBar(
                                              title: controller.irId.value > 0
                                                  ? 'Update Incident Report'.tr
                                                  : 'Add Incident Report'.tr,
                                              action: controller.irId.value > 0
                                                  ? Row(
                                                      children: [
                                                        Text(
                                                          'Id: ',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          '${controller.irId.value}',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    )
                                                  : Dimens.box0),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10, right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    IgnorePointer(
                                                      ignoring: controller
                                                                  .incidentReportDetailsModel
                                                                  .value
                                                                  ?.status ==
                                                              183
                                                          ? true
                                                          : false,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            50),
                                                                child: CustomRichText(
                                                                    title:
                                                                        'Incident Title: '),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    _buildIncidentReportTitleTextField_web(
                                                                        context),
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight10,
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
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Dimens
                                                                      .boxHeight10,
                                                                  Row(
                                                                    children: [
                                                                      CustomRichText(
                                                                          title:
                                                                              'Type of Incident: '),
                                                                      Dimens
                                                                          .boxWidth10,
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                5,
                                                                        child:
                                                                            Obx(
                                                                          () =>
                                                                              DropdownWebWidget(
                                                                            dropdownList:
                                                                                controller.incidentrisktypeList,
                                                                            isValueSelected:
                                                                                controller.isRiskTypeListSelected.value,
                                                                            selectedValue:
                                                                                controller.selectedRiskTypeList.value,
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
                                                                    children: [
                                                                      CustomRichText(
                                                                          title:
                                                                              'Incident date & Time: '),
                                                                      Dimens
                                                                          .boxWidth10,
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                5,
                                                                        child:
                                                                            _buildIncidentDateTimeField_web(
                                                                          context,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Dimens.boxHeight5,
                                                                  // Row(
                                                                  //   children: [
                                                                  //     SizedBox(
                                                                  //       width: 140,
                                                                  //       child: CustomRichText(
                                                                  //           title:
                                                                  //               'Incident Investigation Team: '),
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
                                                                  //                   .incidentInvestigationDoneByList,
                                                                  //           isValueSelected:
                                                                  //               controller
                                                                  //                   .isincidentInvestigationDoneByListSelected
                                                                  //                   .value,
                                                                  //           selectedValue:
                                                                  //               controller
                                                                  //                   .selectedIncidentInvestigationDoneByList
                                                                  //                   .value,
                                                                  //           onValueChanged:
                                                                  //               controller
                                                                  //                   .onValueChanged,
                                                                  //         ),
                                                                  //       ),
                                                                  //     ),
                                                                  //   ],
                                                                  // ),
                                                                  Dimens
                                                                      .boxHeight5,
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            140,
                                                                        child: CustomRichText(
                                                                            title:
                                                                                'Asset Restoration Action Taken By: '),
                                                                      ),
                                                                      Dimens
                                                                          .boxWidth10,
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                5,
                                                                        child:
                                                                            Obx(
                                                                          () =>
                                                                              DropdownWebWidget(
                                                                            dropdownList:
                                                                                controller.assetRestorationActionTakenByList,
                                                                            isValueSelected:
                                                                                controller.isAssetRestorationActionTakenByListSelected.value,
                                                                            selectedValue:
                                                                                controller.selectedAssetRestorationActionTakenByList.value,
                                                                            onValueChanged:
                                                                                controller.onValueAssetRestorationActionTakenByChanged,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight5,
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            140,
                                                                        child: CustomRichText(
                                                                            title:
                                                                                'Damaged Asset Cost Approx: '),
                                                                      ),
                                                                      Dimens
                                                                          .boxWidth10,
                                                                      SizedBox(
                                                                          width: MediaQuery.of(context).size.width /
                                                                              5,
                                                                          child:
                                                                              _buildDamagedAssetsCostTextField_web(context)),
                                                                    ],
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight5,
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              CustomRichText(title: 'Gen Loss Due To Asset Damage')),
                                                                      Dimens
                                                                          .boxWidth10,
                                                                      SizedBox(
                                                                          width: MediaQuery.of(context).size.width /
                                                                              5,
                                                                          child:
                                                                              _buildGenLossAssetDamageTextField_web(context)),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),

                                                              ////Changes from here top for left Column

                                                              ///Changes from here below for right Column
                                                              Spacer(),
                                                              // Dimens.boxWidth50,
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            20),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Dimens
                                                                        .boxHeight10,
                                                                    Row(
                                                                      children: [
                                                                        CustomRichText(
                                                                            title:
                                                                                'Location: '),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 5,
                                                                          child:
                                                                              Obx(
                                                                            () =>
                                                                                DropdownWebWidget(
                                                                              // margin: Dimens.edgeInsets5,
                                                                              dropdownList: controller.blockList,
                                                                              isValueSelected: controller.isBlockSelected.value,
                                                                              selectedValue: controller.selectedBlock.value,
                                                                              onValueChanged: controller.onValueChanged,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight10,
                                                                    Row(
                                                                      children: [
                                                                        CustomRichText(
                                                                            title:
                                                                                'Incident Severity: '),
                                                                        Column(
                                                                          children: [
                                                                            buildRadioButton(
                                                                                'Critical',
                                                                                Colors.red,
                                                                                Colors.white,
                                                                                context),
                                                                            buildRadioButton(
                                                                                'High',
                                                                                Colors.orange,
                                                                                Colors.white,
                                                                                context),
                                                                          ],
                                                                        ),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        Column(
                                                                          children: [
                                                                            buildRadioButton(
                                                                                'Medium',
                                                                                Colors.yellow,
                                                                                Colors.white,
                                                                                context),
                                                                            buildRadioButton(
                                                                                'Low',
                                                                                Colors.green,
                                                                                Colors.white,
                                                                                context),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),

                                                                    Dimens
                                                                        .boxHeight10,
                                                                    Row(
                                                                      children: [
                                                                        CustomRichText(
                                                                            title:
                                                                                'Asset Restoration Date & Time: '),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        SizedBox(
                                                                            width: MediaQuery.of(context).size.width /
                                                                                5,
                                                                            child:
                                                                                _buildActionTakenDateTimeField_web(context)),
                                                                      ],
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight5,

                                                                    Dimens
                                                                        .boxHeight20,
                                                                    Row(
                                                                      children: [
                                                                        CustomRichText(
                                                                            title:
                                                                                'ESI Applicability: '),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 5,
                                                                          child:
                                                                              // controller
                                                                              //             .id !=
                                                                              //         null
                                                                              //     ? controller.incidentReportDetailsModel.value?.esi_applicability_name ==
                                                                              //             "YES"
                                                                              //         ? Obx(
                                                                              //             () =>
                                                                              //                 Switch(
                                                                              //               activeColor: Colors.green,
                                                                              //               value: controller.esiApplicabilityDetailValue.value,
                                                                              //               onChanged: (value) {
                                                                              //                 controller.esiApplicabilityDetailValue.value = value;
                                                                              //                 print('ESI Detail applicability: ${controller.esiApplicabilityDetailValue.value}');
                                                                              //               },
                                                                              //             ),
                                                                              //           )
                                                                              //         : Obx(
                                                                              //             () =>
                                                                              //                 Switch(
                                                                              //               activeColor: Colors.green,
                                                                              //               value: controller.esiApplicabilityDetailFalseValue.value,
                                                                              //               onChanged: (value) {
                                                                              //                 controller.esiApplicabilityDetailFalseValue.value = value;
                                                                              //                 print('ESI Detail False applicability: ${controller.esiApplicabilityDetailFalseValue.value}');
                                                                              //               },
                                                                              //             ),
                                                                              //           )
                                                                              //     :
                                                                              Obx(
                                                                            () =>
                                                                                Switch(
                                                                              activeColor: Colors.green,
                                                                              value: controller.esiApplicabilityValue.value,
                                                                              onChanged: (value) {
                                                                                controller.esiApplicabilityValue.value = value;
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),

                                                                    Dimens
                                                                        .boxHeight5,
                                                                    // controller
                                                                    //             .incidentReportDetailsModel
                                                                    //             .value
                                                                    //             ?.esi_applicability_name ==
                                                                    //         "YES"
                                                                    //     ? Text('Hello')
                                                                    //     : Dimens.box0,

                                                                    Row(
                                                                      children: [
                                                                        controller.esiApplicabilityValue ==
                                                                                true
                                                                            ? CustomRichText(title: 'ESI Applicability Remark: ')
                                                                            : Container(),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        controller.esiApplicabilityValue ==
                                                                                true
                                                                            ? SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 5,
                                                                                child: _buildESIApplicabilityRemarkTextField_web(context))
                                                                            : Container(),
                                                                      ],
                                                                    ),

                                                                    Dimens
                                                                        .boxHeight15,
                                                                    Row(
                                                                      children: [
                                                                        CustomRichText(
                                                                            title:
                                                                                'Legal Applicability: '),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 5,
                                                                          child:
                                                                              Obx(
                                                                            () =>
                                                                                Switch(
                                                                              activeColor: Colors.green,
                                                                              value: controller.legalApplicabilityValue.value,
                                                                              onChanged: (value) {
                                                                                controller.legalApplicabilityValue.value = value;
                                                                                print('Legal applicability: ${controller.legalApplicabilityValue.value}');
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight5,
                                                                    Row(
                                                                      children: [
                                                                        controller.legalApplicabilityValue ==
                                                                                true
                                                                            ? CustomRichText(title: 'Legal Applicability Remark: ')
                                                                            : Container(),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        controller.legalApplicabilityValue ==
                                                                                true
                                                                            ? SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 5,
                                                                                child: _buildLegalApplicabilityRemarkTextField_web(context))
                                                                            : Container(),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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
                                                                        Colors
                                                                            .green,
                                                                    value: controller
                                                                        .insuranceApplicableValue
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
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
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child: _buildInsuranceAvailableTextField_web(
                                                                          context))
                                                                  : Container(),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Dimens.boxHeight20,

                                                    ///Personal Details
                                                    DetailsOfInjuredPerson(),

                                                    ///Investigation Block
                                                    Dimens.boxHeight5,

                                                    ///Investigation
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(20),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    .3)),
                                                      ),
                                                      child: Container(
                                                        color: Color.fromARGB(
                                                            255, 237, 240, 242),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 20),
                                                              child: Text(
                                                                "Investigation",
                                                                style: Styles
                                                                    .blue700,
                                                              ),
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              20),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'What task or type of job was being performed? ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Was the person involved in these activities trained and if so, when? ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Was the person authorized/licensed to carry out that type of work / use machinery? ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'What instructions had been given? By Whom? ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'What safety equipment and /protection was used/ available? ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Were correct safe procedures being observed? ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'What unsafe condition contributed to the incident? ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Did unsafe act/s cause the incident? If yes. Mention the same ',
                                                                            style:
                                                                                Styles.black15,
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
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    Dimens.boxHeight20,
                                                  ],
                                                ),
                                                controller
                                                                .incidentReportDetailsModel.value?.status ==
                                                            181 ||
                                                        controller
                                                                .incidentReportDetailsModel
                                                                .value
                                                                ?.status ==
                                                            182 ||
                                                        controller.irId.value ==
                                                            0
                                                    ? Dimens.box0
                                                    : Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          IgnorePointer(
                                                            child: Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Detail Investigation Required: '),
                                                                SizedBox(
                                                                  width: 3,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  child: Obx(
                                                                    () =>
                                                                        Switch(
                                                                      activeColor:
                                                                          Colors
                                                                              .green,
                                                                      value: controller
                                                                          .detailInvestigationTeamValue
                                                                          .value,
                                                                      onChanged:
                                                                          (value) {
                                                                        controller
                                                                            .detailInvestigationTeamValue
                                                                            .value = value;
                                                                        print(
                                                                            'detail investigation required: ${controller.detailInvestigationTeamValue.value}');
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          ////Investigation team
                                                          controller.detailInvestigationTeamValue ==
                                                                  true
                                                              ? Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20),
                                                                  // height: Get.height,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(.3)),
                                                                  ),
                                                                  // constraints: BoxConstraints(
                                                                  //   maxWidth: 1100,
                                                                  // ),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10,
                                                                            left:
                                                                                10),
                                                                        child:
                                                                            Text(
                                                                          "Investigation Team",
                                                                          style:
                                                                              Styles.blue700,
                                                                        ),
                                                                      ),
                                                                      // Dimens.boxHeight10,
                                                                      Row(
                                                                        children: [
                                                                          Spacer(),
                                                                          Row(
                                                                            children: [
                                                                              CustomRichText(title: 'Name: '),
                                                                              Dimens.boxWidth10,
                                                                              GoodsOrderTextField(
                                                                                textController: controller.investigationTeamNameTextFieldController,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Dimens
                                                                              .boxWidth50,
                                                                          Row(
                                                                            children: [
                                                                              CustomRichText(title: 'Designation: '),
                                                                              Dimens.boxWidth10,
                                                                              GoodsOrderTextField(
                                                                                textController: controller.investigationTeamDesignationTextFieldController,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Dimens
                                                                              .boxWidth20,
                                                                          ElevatedButton(
                                                                            child:
                                                                                Text(
                                                                              'Add',
                                                                              style: TextStyle(color: ColorValues.whiteColor),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              controller.updateInvestigationTeamText(
                                                                                controller.investigationTeamSrNumberTextFieldController.text,
                                                                                controller.investigationTeamNameTextFieldController.text,
                                                                                controller.investigationTeamDesignationTextFieldController.text,

                                                                                // controller.isCheckedRequire
                                                                                //     .value
                                                                              );
                                                                              controller.investigationTeamSrNumberTextFieldController.clear();
                                                                              controller.investigationTeamNameTextFieldController.clear();
                                                                              controller.investigationTeamDesignationTextFieldController.clear();
                                                                              // controller.isCheckedRequire
                                                                              //     .value = false;
                                                                              print('Investigation Data${controller.investigationTeam.length}');
                                                                            },
                                                                          ),
                                                                          Spacer()
                                                                        ],
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight10,
                                                                      //Designation

                                                                      Obx(
                                                                        () => Wrap(
                                                                            children: [
                                                                              Row(
                                                                                children: [
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
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              controller.irId.value > 0
                                                                                  ? Column(
                                                                                      children: []..addAll(controller.investigationTeamList!.map((element) => Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.only(left: 150),
                                                                                                child: Text('${element?.name}'),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.only(right: 160),
                                                                                                child: Text('${element?.designation}'),
                                                                                              ),
                                                                                            ],
                                                                                          ))),
                                                                                    )
                                                                                  : Dimens.box0,
                                                                              Column(
                                                                                children: []..addAll(controller.investigationTeam.map((element) => Row(
                                                                                      children: [
                                                                                        // Text('${element.name}'),
                                                                                        // Text('${element.required_by_date}')
                                                                                        // Obx(
                                                                                        //   () => ListView.builder(
                                                                                        //       itemCount: controller.investigationTeam.length,
                                                                                        //       itemBuilder: (context, index) {
                                                                                        //         return investigationTeamData('${controller.investigationTeam[index]}', '${element.name}', '${element.designation}', context);
                                                                                        //       }),
                                                                                        // )

                                                                                        investigationTeamData('${element.srNumber}', '${element.name}', '${element.designation}', context),
                                                                                      ],
                                                                                    ))),
                                                                              ),
                                                                            ]),
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight10
                                                                    ],
                                                                  ),
                                                                )
                                                              : Dimens.box0,

                                                          IgnorePointer(
                                                            child: Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Why Why Analysis Required: '),
                                                                Dimens
                                                                    .boxWidth10,
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      5,
                                                                  child: Obx(
                                                                    () =>
                                                                        Switch(
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
                                                          ),

                                                          ///Why Why Analysis Block
                                                          controller.whyWhyAnalysisValue ==
                                                                  true
                                                              ? WhyWhyAnalysis()
                                                              : Dimens.box0,

                                                          ///Root Cause
                                                          Dimens.boxHeight10,
                                                          // Row(
                                                          //   children: [
                                                          //     CustomRichText(
                                                          //         title:
                                                          //             'RCA Upload Required: '),
                                                          //     Dimens.boxWidth10,
                                                          //     // SizedBox(
                                                          //     //   width:
                                                          //     //       MediaQuery.of(context)
                                                          //     //               .size
                                                          //     //               .width /
                                                          //     //           5,
                                                          //     //   child: Obx(
                                                          //     //     () => Switch(
                                                          //     //       activeColor:
                                                          //     //           Colors.green,
                                                          //     //       value: controller
                                                          //     //           .rCAUploadRequiredValue
                                                          //     //           .value,
                                                          //     //       onChanged: (value) {
                                                          //     //         controller
                                                          //     //             .rCAUploadRequiredValue
                                                          //     //             .value = value;
                                                          //     //       },
                                                          //     //     ),
                                                          //     //   ),
                                                          //     // )
                                                          //   ],
                                                          // ),
                                                          Text(
                                                            "RCA  Required",
                                                            style: Styles
                                                                .blackBold14,
                                                          ),
                                                          Dimens.boxHeight10,

                                                          // controller.rCAUploadRequiredValue ==
                                                          //         true
                                                          // ?
                                                          RootCauseAnalysis(),
                                                          // : Dimens.box0,

                                                          ///Immediate Correction
                                                          ImmediateCorrection(),

                                                          ///Proposed action plan
                                                          AddPrposedAction(),

                                                          /// FILE UPLOAD WIDGET
                                                          Dimens.boxHeight10,
                                                        ],
                                                      ),
                                                Text(
                                                  "Add Photo Of Incident Below ↓",
                                                  style: Styles.black15W400,
                                                ),
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
                                              ],
                                            ),
                                          ),
                                          ////

                                          ///Incident Report History
                                          controller.incidentReportDetailsModel
                                                          .value?.status ==
                                                      181 ||
                                                  controller.irId.value == 0
                                              ? Dimens.box0
                                              : Container(
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
                                                        child: DataTable2(
                                                          border:
                                                              TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                          columns: [
                                                            DataColumn(
                                                                label: Text(
                                                              "Time Stamp",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            DataColumn(
                                                                label: Text(
                                                              "Module Ref ID",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            DataColumn(
                                                                label: Text(
                                                              "Comment",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            DataColumn(
                                                                label: Text(
                                                              "Module Type",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            DataColumn(
                                                                label: Text(
                                                              "Status",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                          ],
                                                          rows: List<
                                                              DataRow>.generate(
                                                            controller
                                                                    .historyList
                                                                    ?.length ??
                                                                0,
                                                            (index) =>
                                                                DataRow(cells: [
                                                              DataCell(Text(controller
                                                                      .historyList?[
                                                                          index]
                                                                      ?.createdAt
                                                                      .toString() ??
                                                                  '')),
                                                              DataCell(Text(controller
                                                                      .historyList?[
                                                                          index]
                                                                      ?.moduleRefId
                                                                      .toString() ??
                                                                  '')),
                                                              DataCell(Text(controller
                                                                      .historyList?[
                                                                          index]
                                                                      ?.comment
                                                                      .toString() ??
                                                                  '')),
                                                              DataCell(Text(controller
                                                                      .historyList?[
                                                                          index]
                                                                      ?.moduleType
                                                                      .toString() ??
                                                                  '')),
                                                              DataCell(Text(controller
                                                                      .historyList?[
                                                                          index]
                                                                      ?.status_name
                                                                      .toString() ??
                                                                  '')),
                                                            ]),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

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
                                              controller.incidentReportDetailsModel
                                                              .value?.status ==
                                                          182 ||
                                                      controller
                                                              .incidentReportDetailsModel
                                                              .value
                                                              ?.status ==
                                                          181
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appDarkBlueColor,
                                                      onPressed: () {
                                                        // showAlertDialog();
                                                        controller.updateIncidentReport(
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds);
                                                      },
                                                      text: 'Update',
                                                    )
                                                  : Dimens.box0,
                                              controller.irId.value == 0
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appGreenColor,
                                                      onPressed: () {
                                                        // showAlertDialog();
                                                        controller.createIncidentReport(
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds);
                                                      },
                                                      text: 'Submit',
                                                    )
                                                  : Dimens.box0,
                                              SizedBox(
                                                width: 10,
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
                                                        controller.createIncidentReport(
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds);
                                                      },
                                                      text: 'Re-Submit',
                                                    )
                                                  : Container(),
                                              controller.incidentReportDetailsModel
                                                              .value?.status ==
                                                          183 ||
                                                      controller
                                                              .incidentReportDetailsModel
                                                              .value
                                                              ?.status ==
                                                          185
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appDarkBlueColor,
                                                      onPressed: () {
                                                        // showAlertDialog();
                                                        controller.updateIRSecondStep(
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds);
                                                      },
                                                      text: 'Update IR',
                                                    )
                                                  : Dimens.box0,
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ],
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
        ),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
                suffixIcon: Icon(Icons.calendar_month)),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
                suffixIcon: Icon(Icons.calendar_month)),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
                suffixIcon: Icon(Icons.calendar_month)),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
        width: MediaQuery.of(context).size.width / 10,
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          // contentPadding: EdgeInsets.all(5),
          dense: true,
          title: Container(
              color: color,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  severity,
                  style: TextStyle(color: color2, fontSize: 11),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                RegExp('[\'^]'),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  ///Esi Applicability Remark Textfield
  Widget _buildESIApplicabilityRemarkTextField_web(BuildContext context) {
    return Column(//
        children: [
      Dimens.boxHeight5,
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
      Dimens.boxHeight5,
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
                                        ? controller.unsafeActCauseTextCtrlr
                                        : null,
        focusNode: position == 1
            ? controller.typeOfJbFocusNode
            : position == 2
                ? controller.personInvolvedFocusNode
                : position == 3
                    ? controller.personAuthorizedInvolvedFocusNode
                    : position == 4
                        ? controller.instructionsFocusNode
                        : position == 5
                            ? controller.safetyEquipmentsFocusNode
                            : position == 6
                                ? controller.correctSafeFocusNode
                                : position == 7
                                    ? controller.unsafeConditionsFocusNode
                                    : position == 8
                                        ? controller.unsafeActCauseFocusNode
                                        : null,
        scroll: position == 1
            ? controller.typeOfJbScrollController
            : position == 2
                ? controller.personInvolvedScrollController
                : position == 3
                    ? controller.personAuthorizedInvolvedScrollController
                    : position == 4
                        ? controller.instructionsScrollController
                        : position == 5
                            ? controller.safetyEquipmentsScrollController
                            : position == 6
                                ? controller.correctSafeScrollController
                                : position == 7
                                    ? controller
                                        .unsafeConditionsScrollController
                                    : position == 8
                                        ? controller
                                            .unsafeActCauseScrollController
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

  //Exact location Textfield
  Widget _buildExactLocationTextField_web(BuildContext context) {
    return Column(//
        children: [
      Dimens.boxHeight5,
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            controller: controller.exactLocationTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            maxLines: 2,
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
      Dimens.boxHeight5,
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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

  Widget _buildTradeDesignatonTextField_web(BuildContext context) {
    return Column(//
        children: [
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            controller: controller.tradeDesignationTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isTradeDesignationInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isTradeDesignationInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isTradeDesignationInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isTradeDesignationInvalid.value = false;
              } else {
                controller.isTradeDesignationInvalid.value = true;
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
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
}

class AddPrposedAction extends StatelessWidget {
  final AddIncidentReportController controller = Get.find();
  AddPrposedAction({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 20),
        //  height: 300,
        height: ((controller.rowItem.value.length) * 70) + 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 237, 240, 242),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Proposed Action Plan (based on CA & PA)",
                      style: Styles.blue700,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addRowItem();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                  minWidth: 2000,
                  dataRowHeight: 70,
                  columnSpacing: 10,
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 206, 229, 234)),
                  columns: [
                    DataColumn2(
                        fixedWidth: 300,
                        label: Text(
                          "Action as per plan ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    DataColumn2(
                        fixedWidth: 300,
                        label: Text(
                          "Responsibility ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    DataColumn2(
                        fixedWidth: 250,
                        label: Text(
                          "Target Date ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    DataColumn2(
                        // fixedWidth: 250,
                        label: Text(
                      "O & M Remark ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 250,
                        label: Text(
                      "HSE Remark ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 250,
                        label: Text(
                      "Status ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        fixedWidth: 90,
                        label: Text(
                          "Action ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                  rows: controller.rowItem.value.map((record) {
                    return DataRow(
                      // height: 130,
                      cells: record.map((mapData) {
                        return DataCell(
                          (mapData['key'] == "Action as per plan ") ||
                                  (mapData['key'] == "Remark") ||
                                  (mapData['key'] == "HSE Remark")
                              ? Padding(
                                  padding: EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                            keyboardType: TextInputType.text,
                                            // inputFormatters: <
                                            //     TextInputFormatter>[
                                            //   FilteringTextInputFormatter
                                            //       .digitsOnly
                                            // ],
                                            maxLine: 1,
                                            textController:
                                                new TextEditingController(
                                                    text:
                                                        mapData["value"] ?? ''),
                                            onChanged: (txt) {
                                              mapData["value"] = txt;
                                            },
                                          )),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Drop_down")
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                            child: DropdownWebStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              dropdownList:
                                                  controller.eqipmentNameList,
                                              selectedValue: mapData["value"],
                                              onValueChanged:
                                                  (list, selectedValue) {
                                                print({
                                                  selectedValue: selectedValue
                                                });
                                                mapData["value"] =
                                                    selectedValue;
                                                controller.dropdownEquipmentNameMapperData[
                                                        selectedValue] =
                                                    list.firstWhere(
                                                        (element) =>
                                                            element.name ==
                                                            selectedValue,
                                                        orElse: null);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "Status")
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                                child: DropdownWebStock(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  dropdownList:
                                                      controller.statusList,
                                                  selectedValue:
                                                      mapData["value"],
                                                  onValueChanged:
                                                      (list, selectedValue) {
                                                    print({
                                                      selectedValue:
                                                          selectedValue
                                                    });
                                                    mapData["value"] =
                                                        selectedValue;
                                                    controller.statusDropDownMapperData[
                                                            selectedValue] =
                                                        list.firstWhere(
                                                            (element) =>
                                                                element.name ==
                                                                selectedValue,
                                                            orElse: null);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : (mapData['key'] == "Target Date ")
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _buildTargetDateField_web(
                                                    context,
                                                    new TextEditingController(
                                                        text:
                                                            mapData["value"] ??
                                                                ''),
                                                    onChanged: (txt) {
                                                      mapData["value"] = txt;
                                                    },
                                                  )
                                                ],
                                              ),
                                            )
                                          : (mapData['key'] == "Action ")
                                              ? Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TableActionButton(
                                                        color: ColorValues
                                                            .appRedColor,
                                                        icon: Icons.delete,
                                                        label: '',
                                                        message: '',
                                                        onPress: () {
                                                          controller.rowItem
                                                              .remove(record);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Text(mapData['key'] ?? ''),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  ///Target Date

  Widget _buildTargetDateField_web(
      BuildContext context, TextEditingController textDateController,
      {required Function(String) onChanged}) {
    return StatefulBuilder(builder: ((context, setState) {
      return Column(children: [
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
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onTap: () {
                setState(() {
                  pickTargetDateTime_web(
                    context,
                    textDateController,
                  );
                });

                // }

                // : null;
              },
              controller: textDateController,
              onChanged: (value) {
                setState(
                  () {
                    textDateController.text = value;
                    onChanged(value);
                  },
                );
              },

              // :null,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_month),
              ),
            ),
          ),
        ),
      ]);
    }));
  }

  //Start Date and valid Till
  Future pickTargetDateTime_web(
    BuildContext context,
    TextEditingController textcontroller,
    // {required Function(String) onChanged}
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

    textcontroller
      // ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: textcontroller.text.length,
          affinity: TextAffinity.upstream,
        ),
      );

    textcontroller.text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime);

    // controller.testDataTextCtrlr.text = textcontroller.text;
    print('Incident reportDate & Time ${textcontroller.text}');
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
}

///why why Analysis
class WhyWhyAnalysis extends StatelessWidget {
  final AddIncidentReportController controller = Get.find();
  WhyWhyAnalysis({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Obx(
      () => Container(
        margin: Dimens.edgeInsets20,
        //  height: 300,
        height: ((controller.rowWhyWhyAnalysisItem.value.length) * 70) + 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 237, 240, 242),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(children: [
              // Column(
              //     children: []..addAll(controller.rowItem.value.map((e) {
              //         return Text(jsonEncode(e));
              //       }))),
              // Text(jsonEncode(controller.dropdownMapperData)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Why Why Analysis",
                      style: Styles.blue700,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addWhyWhyAnalysisRowItem();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                  // minWidth: 2000,
                  dataRowHeight: 70,
                  columnSpacing: 10,
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 206, 229, 234)),
                  columns: [
                    DataColumn2(
                        // fixedWidth: 550,
                        label: Text(
                      "Why ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 550,
                        label: Text(
                      "Cause ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        fixedWidth: 150,
                        label: Text(
                          "Action ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                  rows: controller.rowWhyWhyAnalysisItem.value
                      .asMap()
                      .entries
                      .map((entry) {
                    int serialNumber = entry.key + 1;

                    List<dynamic> record = entry.value;
                    return DataRow(
                      // height: 130,
                      cells: record.map((mapData) {
                        return DataCell(
                          (mapData['key'] == "Why ")
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Why $serialNumber"),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.28,
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
                                                keyboardType:
                                                    TextInputType.text,
                                                // inputFormatters: <
                                                //     TextInputFormatter>[
                                                //   FilteringTextInputFormatter
                                                //       .digitsOnly
                                                // ],
                                                maxLine: 1,
                                                textController:
                                                    new TextEditingController(
                                                        text:
                                                            mapData["value"] ??
                                                                ''),
                                                onChanged: (txt) {
                                                  mapData["value"] = txt;
                                                },
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Cause ")
                                  ? Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.28,
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
                                                keyboardType:
                                                    TextInputType.text,
                                                // inputFormatters: <
                                                //     TextInputFormatter>[
                                                //   FilteringTextInputFormatter
                                                //       .digitsOnly
                                                // ],
                                                maxLine: 1,
                                                textController:
                                                    new TextEditingController(
                                                        text:
                                                            mapData["value"] ??
                                                                ''),
                                                onChanged: (txt) {
                                                  mapData["value"] = txt;
                                                },
                                              )),
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "Action ")
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TableActionButton(
                                                color: ColorValues.appRedColor,
                                                icon: Icons.delete,
                                                label: '',
                                                message: '',
                                                onPress: () {
                                                  controller
                                                      .rowWhyWhyAnalysisItem
                                                      .remove(record);
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      : Text(mapData['key'] ?? ''),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

////Root cause analysis
class RootCauseAnalysis extends StatelessWidget {
  final AddIncidentReportController controller = Get.find();
  RootCauseAnalysis({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Obx(
      () => Container(
        // margin: Dimens.edgeInsets20,
        //  height: 300,
        height: ((controller.rowRootCauseItem.value.length) * 70) + 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 237, 240, 242),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(children: [
              // Column(
              //     children: []..addAll(controller.rowItem.value.map((e) {
              //         return Text(jsonEncode(e));
              //       }))),
              // Text(jsonEncode(controller.dropdownMapperData)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Root Cause (s)/ Underlying causes",
                      style: Styles.blue700,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addRootCauseRowItem();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                  // minWidth: 2000,
                  dataRowHeight: 70,
                  columnSpacing: 10,
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 206, 229, 234)),
                  columns: [
                    // DataColumn2(
                    //     // fixedWidth: 550,
                    //     label: Text(
                    //   "Why ",
                    //   style:
                    //       TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    // )),
                    DataColumn2(
                        // fixedWidth: 550,
                        label: Text(
                      "Cause ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        fixedWidth: 150,
                        label: Text(
                          "Action ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                  rows: controller.rowRootCauseItem.value.map((record) {
                    return DataRow(
                      // height: 130,
                      cells: record.map((mapData) {
                        return DataCell(
                          (mapData['key'] == "Cause ")
                              ? Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 20),
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
                                            keyboardType: TextInputType.text,
                                            // inputFormatters: <
                                            //     TextInputFormatter>[
                                            //   FilteringTextInputFormatter
                                            //       .digitsOnly
                                            // ],
                                            maxLine: 1,
                                            textController:
                                                new TextEditingController(
                                                    text:
                                                        mapData["value"] ?? ''),
                                            onChanged: (txt) {
                                              mapData["value"] = txt;
                                            },
                                          )),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Action ")
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TableActionButton(
                                            color: ColorValues.appRedColor,
                                            icon: Icons.delete,
                                            label: '',
                                            message: '',
                                            onPress: () {
                                              controller.rowRootCauseItem
                                                  .remove(record);
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  : Text(mapData['key'] ?? ''),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

///Immediate Correction
class ImmediateCorrection extends StatelessWidget {
  final AddIncidentReportController controller = Get.find();
  ImmediateCorrection({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 20),
        //  height: 300,
        height:
            ((controller.rowImmediateCorrectionItem.value.length) * 70) + 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 237, 240, 242),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(children: [
              // Column(
              //     children: []..addAll(controller.rowItem.value.map((e) {
              //         return Text(jsonEncode(e));
              //       }))),
              // Text(jsonEncode(controller.dropdownMapperData)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Immediate Correction ",
                      style: Styles.blue700,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addImmediateCorrectionRowItem();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                  // minWidth: 2000,
                  dataRowHeight: 70,
                  columnSpacing: 10,
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 206, 229, 234)),
                  columns: [
                    // DataColumn2(
                    //     // fixedWidth: 550,
                    //     label: Text(
                    //   "Why ",
                    //   style:
                    //       TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    // )),
                    DataColumn2(
                        // fixedWidth: 550,
                        label: Text(
                      "Correction ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        fixedWidth: 150,
                        label: Text(
                          "Action ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                  rows:
                      controller.rowImmediateCorrectionItem.value.map((record) {
                    return DataRow(
                      // height: 130,
                      cells: record.map((mapData) {
                        return DataCell(
                          (mapData['key'] == "Correction ")
                              ? Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 20),
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
                                            keyboardType: TextInputType.text,
                                            // inputFormatters: <
                                            //     TextInputFormatter>[
                                            //   FilteringTextInputFormatter
                                            //       .digitsOnly
                                            // ],
                                            maxLine: 1,
                                            textController:
                                                new TextEditingController(
                                                    text:
                                                        mapData["value"] ?? ''),
                                            onChanged: (txt) {
                                              mapData["value"] = txt;
                                            },
                                          )),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Action ")
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TableActionButton(
                                            color: ColorValues.appRedColor,
                                            icon: Icons.delete,
                                            label: '',
                                            message: '',
                                            onPress: () {
                                              controller
                                                  .rowImmediateCorrectionItem
                                                  .remove(record);
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  : Text(mapData['key'] ?? ''),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

///Details of Injured person
class DetailsOfInjuredPerson extends StatelessWidget {
  final AddIncidentReportController controller = Get.find();
  DetailsOfInjuredPerson({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Obx(
      () => Container(
        margin: Dimens.edgeInsets0,
        //  height: 300,
        height: ((controller.rowInjuredPersonItem.value.length) * 90) + 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorValues.lightGreyColorWithOpacity35,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 237, 240, 242),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(children: [
              // Column(
              //     children: []..addAll(controller.rowItem.value.map((e) {
              //         return Text(jsonEncode(e));
              //       }))),
              // Text(jsonEncode(controller.dropdownMapperData)),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Details of Injured Person",
                      style: Styles.blue700,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addDetailsOfInjuredPersonRowItem();
                      },
                      child: Container(
                        height: 25,
                        width: 90,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                  minWidth: 2000,
                  dataRowHeight: 105,
                  columnSpacing: 10,
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 206, 229, 234)),
                  columns: [
                    DataColumn2(
                        // fixedWidth: 300,
                        label: Text(
                      "Name of Injured\nPerson ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 300,
                        label: Text(
                      "Other Victim ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 300,
                        label: Text(
                      "Gender ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 220,
                        label: Text(
                      "Trade/Designation ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 220,
                        label: Text(
                      "Address ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 220,
                        label: Text(
                      "Name of Contractor ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 220,
                        label: Text(
                      "Body part injured ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 220,
                        label: Text(
                      "work experience ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 220,
                        label: Text(
                      "Plant & Equipment ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        // fixedWidth: 220,
                        label: Text(
                      "Exact Location ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        fixedWidth: 60,
                        label: Text(
                          "Action ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                  rows: controller.rowInjuredPersonItem.value.map((record) {
                    return DataRow(
                      // height: 130,
                      cells: record.map((mapData) {
                        return DataCell(
                          (mapData['key'] == "Name of Injured Person ")
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                        child: IgnorePointer(
                                          ignoring: controller
                                                      .incidentReportDetailsModel
                                                      .value
                                                      ?.status ==
                                                  183
                                              ? true
                                              : false,
                                          child: DropdownWebStock(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            dropdownList:
                                                controller.victimNameList,
                                            selectedValue: mapData["value"],
                                            onValueChanged:
                                                (list, selectedValue) {
                                              print({
                                                selectedValue: selectedValue
                                              });
                                              if (selectedValue != null) {
                                                controller.updateSelectedOption(
                                                    selectedValue);
                                              }
                                              mapData["value"] = selectedValue;
                                              controller.dropdownVictimNameMapperData[
                                                      selectedValue] =
                                                  list.firstWhere(
                                                      (element) =>
                                                          element.name ==
                                                          selectedValue,
                                                      orElse: null);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : (mapData['key'] == "Other Victim ")
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          controller.selectedOption == "Other"
                                              ? SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 1),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
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
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child:
                                                                IgnorePointer(
                                                              ignoring: controller
                                                                          .incidentReportDetailsModel
                                                                          .value
                                                                          ?.status ==
                                                                      183
                                                                  ? true
                                                                  : false,
                                                              child:
                                                                  LoginCustomTextfield(
                                                                // ishint:
                                                                //     mapData["value"] =
                                                                //         "",
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                // inputFormatters: <
                                                                //     TextInputFormatter>[
                                                                //   FilteringTextInputFormatter
                                                                //       .digitsOnly
                                                                // ],
                                                                maxLine: 1,
                                                                textController:
                                                                    new TextEditingController(
                                                                        text: mapData["value"] ??
                                                                            ''),
                                                                onChanged:
                                                                    (txt) {
                                                                  mapData["value"] =
                                                                      txt;
                                                                },
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ))
                                              : Text('No Victim !!'),
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "Gender ")
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // controller.selectedOption ==
                                              //         "Other"
                                              //     ?
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
                                                child: Obx(
                                                  () => IgnorePointer(
                                                    ignoring: controller
                                                                .incidentReportDetailsModel
                                                                .value
                                                                ?.status ==
                                                            183
                                                        ? true
                                                        : false,
                                                    child: DropdownWebStock(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      dropdownList:
                                                          controller.genderList,
                                                      selectedValue: controller
                                                                  .selectedOption ==
                                                              "Other"
                                                          ? mapData["value"]
                                                          : controller
                                                              .dropdownVictimNameMapperData[
                                                                  record[0]
                                                                      ['value']]
                                                              ?.gender,
                                                      onValueChanged: (list,
                                                          selectedValue) {
                                                        print({
                                                          selectedValue:
                                                              selectedValue
                                                        });
                                                        mapData["value"] =
                                                            selectedValue;
                                                        controller.dropdownGenderMapperData[
                                                                selectedValue] =
                                                            list.firstWhere(
                                                                (element) =>
                                                                    element
                                                                        .name ==
                                                                    selectedValue,
                                                                orElse: null);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              )
                                              // : Text(
                                              //     "${controller.dropdownVictimNameMapperData[record[0]['value']]?.gender ?? ""}")
                                            ],
                                          ),
                                        )
                                      : (mapData['key'] == "Trade/Designation ")
                                          ? Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
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
                                                      child: IgnorePointer(
                                                        ignoring: controller
                                                                    .incidentReportDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                183
                                                            ? true
                                                            : false,
                                                        child:
                                                            LoginCustomTextfield(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          // inputFormatters: <
                                                          //     TextInputFormatter>[
                                                          //   FilteringTextInputFormatter
                                                          //       .digitsOnly
                                                          // ],
                                                          maxLine: 1,
                                                          textController:
                                                              new TextEditingController(
                                                                  text: mapData[
                                                                          "value"] ??
                                                                      ''),
                                                          onChanged: (txt) {
                                                            mapData["value"] =
                                                                txt;
                                                          },
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )
                                          : (mapData['key'] == "Address ")
                                              ? Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
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
                                                                blurRadius: 5.0,
                                                                spreadRadius:
                                                                    1.0,
                                                              ),
                                                            ],
                                                            color: ColorValues
                                                                .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: IgnorePointer(
                                                            ignoring: controller
                                                                        .incidentReportDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    183
                                                                ? true
                                                                : false,
                                                            child:
                                                                LoginCustomTextfield(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              // inputFormatters: <
                                                              //     TextInputFormatter>[
                                                              //   FilteringTextInputFormatter
                                                              //       .digitsOnly
                                                              // ],
                                                              maxLine: 1,
                                                              textController:
                                                                  new TextEditingController(
                                                                      text: mapData[
                                                                              "value"] ??
                                                                          ''),
                                                              onChanged: (txt) {
                                                                mapData["value"] =
                                                                    txt;
                                                              },
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              : (mapData['key'] ==
                                                      "Name of Contractor ")
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
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
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child:
                                                                IgnorePointer(
                                                              ignoring: controller
                                                                          .incidentReportDetailsModel
                                                                          .value
                                                                          ?.status ==
                                                                      183
                                                                  ? true
                                                                  : false,
                                                              child:
                                                                  DropdownWebStock(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4,
                                                                dropdownList:
                                                                    controller
                                                                        .businessList,
                                                                selectedValue:
                                                                    mapData[
                                                                        "value"],
                                                                onValueChanged:
                                                                    (list,
                                                                        selectedValue) {
                                                                  print({
                                                                    selectedValue:
                                                                        selectedValue
                                                                  });
                                                                  mapData["value"] =
                                                                      selectedValue;
                                                                  controller.dropdownBusinessListMapperData[selectedValue] = list.firstWhere(
                                                                      (element) =>
                                                                          element
                                                                              .name ==
                                                                          selectedValue,
                                                                      orElse:
                                                                          null);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : (mapData['key'] ==
                                                          "Body part injured ")
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
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
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    IgnorePointer(
                                                                  ignoring: controller
                                                                              .incidentReportDetailsModel
                                                                              .value
                                                                              ?.status ==
                                                                          183
                                                                      ? true
                                                                      : false,
                                                                  child:
                                                                      DropdownWebStock(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        4,
                                                                    dropdownList:
                                                                        controller
                                                                            .bodyinjuredList,
                                                                    selectedValue:
                                                                        mapData[
                                                                            "value"],
                                                                    onValueChanged:
                                                                        (list,
                                                                            selectedValue) {
                                                                      print({
                                                                        selectedValue:
                                                                            selectedValue
                                                                      });
                                                                      mapData["value"] =
                                                                          selectedValue;
                                                                      controller.dropdownBodyinjuredListMapperData[selectedValue] = list.firstWhere(
                                                                          (element) =>
                                                                              element.name ==
                                                                              selectedValue,
                                                                          orElse:
                                                                              null);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : (mapData['key'] ==
                                                              "work experience ")
                                                          ? Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
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
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          IgnorePointer(
                                                                        ignoring: controller.incidentReportDetailsModel.value?.status ==
                                                                                183
                                                                            ? true
                                                                            : false,
                                                                        child:
                                                                            LoginCustomTextfield(
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          inputFormatters: <TextInputFormatter>[
                                                                            FilteringTextInputFormatter.digitsOnly
                                                                          ],
                                                                          maxLine:
                                                                              1,
                                                                          textController:
                                                                              new TextEditingController(text: mapData["value"] ?? ''),
                                                                          onChanged:
                                                                              (txt) {
                                                                            mapData["value"] =
                                                                                txt;
                                                                          },
                                                                        ),
                                                                      )),
                                                                ],
                                                              ),
                                                            )
                                                          : (mapData['key'] ==
                                                                  "Plant & Equipment ")
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
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
                                                                          color:
                                                                              ColorValues.whiteColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            IgnorePointer(
                                                                          ignoring: controller.incidentReportDetailsModel.value?.status == 183
                                                                              ? true
                                                                              : false,
                                                                          child:
                                                                              DropdownWebStock(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 4,
                                                                            dropdownList:
                                                                                controller.eqipmentNameList,
                                                                            selectedValue:
                                                                                mapData["value"],
                                                                            onValueChanged:
                                                                                (list, selectedValue) {
                                                                              print({
                                                                                selectedValue: selectedValue
                                                                              });
                                                                              mapData["value"] = selectedValue;
                                                                              controller.dropdownEquipmentNameMapperData[selectedValue] = list.firstWhere((element) => element.name == selectedValue, orElse: null);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : (mapData['key'] ==
                                                                      "Exact Location ")
                                                                  ? Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
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
                                                                                borderRadius: BorderRadius.circular(5),
                                                                              ),
                                                                              child: IgnorePointer(
                                                                                ignoring: controller.incidentReportDetailsModel.value?.status == 183 ? true : false,
                                                                                child: LoginCustomTextfield(
                                                                                  keyboardType: TextInputType.text,
                                                                                  // inputFormatters: <
                                                                                  //     TextInputFormatter>[
                                                                                  //   FilteringTextInputFormatter
                                                                                  //       .digitsOnly
                                                                                  // ],
                                                                                  maxLine: 1,
                                                                                  textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                  onChanged: (txt) {
                                                                                    mapData["value"] = txt;
                                                                                  },
                                                                                ),
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : (mapData['key'] ==
                                                                          "Action ")
                                                                      ? Padding(
                                                                          padding:
                                                                              EdgeInsets.only(top: 10),
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              IgnorePointer(
                                                                                ignoring: controller.incidentReportDetailsModel.value?.status == 183 ? true : false,
                                                                                child: TableActionButton(
                                                                                  color: ColorValues.appRedColor,
                                                                                  icon: Icons.delete,
                                                                                  label: '',
                                                                                  message: '',
                                                                                  onPress: () {
                                                                                    controller.rowInjuredPersonItem.remove(record);
                                                                                  },
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : Text(mapData[
                                                                              'key'] ??
                                                                          ''),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherVictimNameTextField_web(BuildContext context) {
    return Column(//
        children: [
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
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            controller: controller.otherVictimNameTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isOtherVictimNameInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isOtherVictimNameInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isOtherVictimNameInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isOtherVictimNameInvalid.value = false;
              } else {
                controller.isOtherVictimNameInvalid.value = true;
              }
            },
          ),
        ),
      ),
    ]);
  }
}
