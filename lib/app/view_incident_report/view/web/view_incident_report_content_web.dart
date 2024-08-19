import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/incident_report_approve_dialog.dart';
import 'package:cmms/app/widgets/incident_report_reject_dialog.dart';
import 'package:cmms/app/widgets/ir_reject_part2_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewIncidentReportContentWeb
    extends GetView<ViewIncidentReportController> {
  ViewIncidentReportContentWeb({super.key});
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
                child: RepaintBoundary(
                  key: controller.printKey,
                  child: Container(
                    // margin: Dimens.edgeInsets16,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 1100,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          HeaderWidget(),
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
                                    Get.offNamed(Routes.incidentReportListWeb);
                                  },
                                  child: Text(" / INCIDENT REPORT LIST",
                                      style: Styles.greyLight14),
                                ),
                                Text(" / VIEW INCIDENT REPORT",
                                    style: Styles.greyLight14)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1,
                            // height: MediaQuery.of(context).size.height / 1,
                            child: Card(
                              color: Colors.lightBlue.shade50,
                              child: Wrap(
                                children: [
                                  GetBuilder<ViewIncidentReportController>(
                                      id: 'incident-report',
                                      builder: (controller) {
                                        return Obx(
                                          () => Column(
                                            children: [
                                              CustomAppBar(
                                                title:
                                                    'View Incident Report'.tr,
                                                action: Row(
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2,
                                                                horizontal: 5),
                                                        margin: EdgeInsets.only(
                                                            top: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: controller
                                                                      .incidentReportDetailsModel
                                                                      .value
                                                                      ?.status_short ==
                                                                  118
                                                              ? ColorValues
                                                                  .appPurpleColor
                                                              : ColorValues
                                                                  .lightBlueColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Obx(
                                                          () => Text(
                                                            "Status :${controller.incidentReportDetailsModel.value?.status ?? ""} ",
                                                          ),
                                                        )),
                                                    Container(
                                                      height: 30,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.blue,
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.green),
                                                        ],
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        '${controller.incidentReportDetailsModel.value?.status_short}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Dimens.boxHeight10,
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 10,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        children: [
                                                          TitleAndInfo(
                                                            "Id: ",
                                                            "${controller.incidentReportDetailsModel.value?.id}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Plant: ",
                                                            "${controller.incidentReportDetailsModel.value?.facility_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Block: ",
                                                            "${controller.incidentReportDetailsModel.value?.block_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Incident Date & Time: ",
                                                            "${controller.incidentDateTimeCtrlrWeb.text}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Incident Description: ",
                                                            "${controller.incidentReportDetailsModel.value?.description}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Victim Name: ",
                                                            "${controller.incidentReportDetailsModel.value?.victim_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Incident Investigation Done By: ",
                                                            "${controller.incidentReportDetailsModel.value?.inverstigated_by_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Risk Type: ",
                                                            "${controller.incidentReportDetailsModel.value?.risk_type_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Legal Applicability: ",
                                                            "${controller.incidentReportDetailsModel.value?.legal_applicability_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Damaged Assets Cost Approx: ",
                                                            "${controller.incidentReportDetailsModel.value?.damaged_cost} INR",
                                                          ),
                                                          TitleAndInfo(
                                                            "Asset Restoration Action Taken By: ",
                                                            "${controller.incidentReportDetailsModel.value?.action_taken_by_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Insurance Available: ",
                                                            "${controller.incidentReportDetailsModel.value?.is_insurance_applicable_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Insurance Status: ",
                                                            "${controller.incidentReportDetailsModel.value?.insurance_status_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Insurance Remarks: ",
                                                            "${controller.incidentReportDetailsModel.value?.insurance_remark}",
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Spacer(),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Column(
                                                        children: [
                                                          TitleAndInfo(
                                                            "Title: ",
                                                            "${controller.incidentReportDetailsModel.value?.title}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Equipment Categories: ",
                                                            "${controller.incidentReportDetailsModel.value?.equipment_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Reporting Date & Time: ",
                                                            "${controller.reportingDateTimeCtrlrWeb.text}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Incident Severity: ",
                                                            "${controller.incidentReportDetailsModel.value?.severity}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Action Taken Date & Time: ",
                                                            "${controller.actionTakenDateTimeCtrlrWeb.text}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Incident Investigation Verification Done By: ",
                                                            "${controller.incidentReportDetailsModel.value?.verified_by_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "ESI Applicability: ",
                                                            "${controller.incidentReportDetailsModel.value?.esi_applicability_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "RCA Upload Required: ",
                                                            "${controller.incidentReportDetailsModel.value?.rca_required_name}",
                                                          ),
                                                          TitleAndInfo(
                                                            "Gen Loss Due To Asset Damage: ",
                                                            "${controller.incidentReportDetailsModel.value?.generation_loss} INR",
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // Row(
                                              //   crossAxisAlignment:
                                              //       CrossAxisAlignment.start,
                                              //   children: [
                                              //     Padding(
                                              //       padding:
                                              //           const EdgeInsets.only(
                                              //               left: 10),
                                              //       child: Column(
                                              //         crossAxisAlignment:
                                              //             CrossAxisAlignment
                                              //                 .end,
                                              //         children: [
                                              //           CustomRichText(
                                              //               title: 'Id: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title: 'Plant: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title: 'Block: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Incident Date & Time: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Incident Description: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Victim Name: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Incident Investigation Done By: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Risk Type: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Legal Applicability: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Damaged Assets cost approx.: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Asset Restoration action taken by: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Insurance Available: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Insurance Status: '),
                                              //           Dimens.boxHeight5,
                                              //           CustomRichText(
                                              //               title:
                                              //                   'Insurance Remarks: '),
                                              //           Dimens.boxHeight5,
                                              //         ],
                                              //       ),
                                              //     ),
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Column(
                                              //       crossAxisAlignment:
                                              //           CrossAxisAlignment
                                              //               .start,
                                              //       children: [
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.id}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.facility_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.block_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentDateTimeCtrlrWeb.text}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight4,
                                              //         SizedBox(
                                              //           width: 150,
                                              //           child: Text(
                                              //             '${controller.incidentReportDetailsModel.value?.description}',
                                              //             overflow: TextOverflow
                                              //                 .ellipsis,
                                              //             style: TextStyle(
                                              //                 color: Color
                                              //                     .fromARGB(
                                              //                         255,
                                              //                         5,
                                              //                         92,
                                              //                         163)),
                                              //           ),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.victim_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.inverstigated_by_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.risk_type_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.legal_applicability_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.damaged_cost} INR',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight4,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.action_taken_by_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.is_insurance_applicable_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight4,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.insurance_status_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight4,
                                              //         SizedBox(
                                              //           width: 300,
                                              //           child: Text(
                                              //             '${controller.incidentReportDetailsModel.value?.insurance_remark}',
                                              //             style: TextStyle(
                                              //                 color: Color
                                              //                     .fromARGB(
                                              //                         255,
                                              //                         5,
                                              //                         92,
                                              //                         163)),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     ),

                                              //     /////
                                              //     Spacer(),
                                              //     Column(
                                              //       crossAxisAlignment:
                                              //           CrossAxisAlignment.end,
                                              //       children: [
                                              //         CustomRichText(
                                              //             title: 'Title: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'Equipment Categories: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'Reporting Date & Time: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'Incident Severity: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'Action Taken Date & Time: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'Incident Investigation Verification done by: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'ESI Applicability: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'RCA Upload Required: '),
                                              //         Dimens.boxHeight5,
                                              //         CustomRichText(
                                              //             title:
                                              //                 'Gen loss due to asset damage: '),
                                              //         Dimens.boxHeight5,
                                              //       ],
                                              //     ),
                                              //     SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Column(
                                              //       crossAxisAlignment:
                                              //           CrossAxisAlignment
                                              //               .start,
                                              //       children: [
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.title}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight4,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.equipment_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.reportingDateTimeCtrlrWeb.text}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.severity}',
                                              //           style: TextStyle(
                                              //               color: Colors.red),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.actionTakenDateTimeCtrlrWeb.text}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight4,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.verified_by_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.esi_applicability_name}',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //         // Dimens.boxHeight4,
                                              //         Row(
                                              //           children: [
                                              //             Text(
                                              //               '${controller.incidentReportDetailsModel.value?.rca_required_name}',
                                              //               style: TextStyle(
                                              //                   color: Color
                                              //                       .fromARGB(
                                              //                           255,
                                              //                           5,
                                              //                           92,
                                              //                           163)),
                                              //             ),
                                              //             // SizedBox(
                                              //             //   width: 10,
                                              //             // ),
                                              //             // TableActionButton(
                                              //             //   color: ColorValues
                                              //             //       .appDarkBlueColor,
                                              //             //   icon: Icons
                                              //             //       .visibility,
                                              //             //   message: 'RCA',
                                              //             //   onPress: () {
                                              //             //     // controller.viewIncidentReport(
                                              //             //     //     id: int.tryParse(
                                              //             //     //         '${record[0]}'));
                                              //             //     // print('record:${int.tryParse('${record[0]}')}');
                                              //             //   },
                                              //             // ),
                                              //           ],
                                              //         ),
                                              //         Dimens.boxHeight5,
                                              //         Text(
                                              //           '${controller.incidentReportDetailsModel.value?.generation_loss} INR',
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Color.fromARGB(
                                              //                       255,
                                              //                       5,
                                              //                       92,
                                              //                       163)),
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ],
                                              // ),
                                              ///Details Of Injured Person
                                              controller
                                                      .detailsOfInjuredPersonList!
                                                      .isEmpty
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .detailsOfInjuredPersonList
                                                                      ?.length ??
                                                                  0) *
                                                              50) +
                                                          125,
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width /
                                                      //         1.2,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  "Details Of Injured Person",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Divider(
                                                          //   color: ColorValues.greyLightColour,
                                                          // ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Name Of Injured\nPerson",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Gender",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Trade/\nDesignation",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Address",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Name Of\nContractor",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Body Part\nInjured",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Work Experience",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Plant &\nEquipment",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Exact Location",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .detailsOfInjuredPersonList
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .detailsOfInjuredPersonList?[index]
                                                                              ?.name
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(
                                                                          '${controller.detailsOfInjuredPersonList?[index]?.sex}')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfInjuredPersonList?[index]
                                                                              ?.designation
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(
                                                                        Text(
                                                                          controller.detailsOfInjuredPersonList?[index]?.address.toString() ??
                                                                              '',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                      DataCell(Text(controller
                                                                              .detailsOfInjuredPersonList?[index]
                                                                              ?.name_contractor
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfInjuredPersonList?[index]
                                                                              ?.body_part_and_nature_of_injury
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfInjuredPersonList?[index]
                                                                              ?.work_experience_years
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfInjuredPersonList?[index]
                                                                              ?.plant_equipment_involved
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfInjuredPersonList?[index]
                                                                              ?.location_of_incident
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                              ///Details Of OtherInjured Person
                                              controller
                                                      .detailsOfOtherInjuredPersonList!
                                                      .isEmpty
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .detailsOfOtherInjuredPersonList
                                                                      ?.length ??
                                                                  0) *
                                                              50) +
                                                          125,
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width /
                                                      //         1.2,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  "Details Of Other Injured Person",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Divider(
                                                          //   color: ColorValues.greyLightColour,
                                                          // ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Name Of Injured\nPerson",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Gender",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Trade/\nDesignation",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Address",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Name Of\nContractor",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Body Part\nInjured",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Work Experience",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Plant &\nEquipment",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Exact Location",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .detailsOfOtherInjuredPersonList
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .detailsOfOtherInjuredPersonList?[index]
                                                                              ?.name
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(
                                                                          '${controller.detailsOfOtherInjuredPersonList?[index]?.sex}')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfOtherInjuredPersonList?[index]
                                                                              ?.designation
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(
                                                                        Text(
                                                                          controller.detailsOfOtherInjuredPersonList?[index]?.address.toString() ??
                                                                              '',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                      DataCell(Text(controller
                                                                              .detailsOfOtherInjuredPersonList?[index]
                                                                              ?.name_contractor
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfOtherInjuredPersonList?[index]
                                                                              ?.body_part_and_nature_of_injury
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfOtherInjuredPersonList?[index]
                                                                              ?.work_experience_years
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfOtherInjuredPersonList?[index]
                                                                              ?.plant_equipment_involved
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .detailsOfOtherInjuredPersonList?[index]
                                                                              ?.location_of_incident
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                              controller.incidentReportDetailsModel
                                                          .value?.fileList ==
                                                      null
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .file_list
                                                                      ?.length ??
                                                                  0) *
                                                              40) +
                                                          130,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  'All Files Uploaded',
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border:
                                                                  TableBorder
                                                                      .all(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        206,
                                                                        229,
                                                                        234),
                                                              ),
                                                              columns: [
                                                                DataColumn(
                                                                  label: Text(
                                                                    "File Description",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn(
                                                                  label: Text(
                                                                    "View Image",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .file_list
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                  cells: [
                                                                    DataCell(
                                                                        Text(
                                                                      controller
                                                                              .file_list![index]
                                                                              ?.description
                                                                              .toString() ??
                                                                          '',
                                                                    )),
                                                                    DataCell(
                                                                      // Text("View Image"),
                                                                      Wrap(
                                                                        children: [
                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appDarkBlueColor,
                                                                            icon:
                                                                                Icons.visibility,
                                                                            message:
                                                                                'View Permit',
                                                                            onPress:
                                                                                () async {
                                                                              // String baseUrl = "http://65.0.20.19/CMMS_API/";
                                                                              String baseUrl = 'http://172.20.43.9:83/';
                                                                              String fileName = controller.file_list![index]?.fileName ?? "";
                                                                              String fullUrl = baseUrl + fileName;
                                                                              if (await canLaunch(fullUrl)) {
                                                                                await launch(fullUrl);
                                                                              } else {
                                                                                throw 'Could not launch $fullUrl';
                                                                              }
                                                                              // String baseUrl = 'http://172.20.43.9:83/';
                                                                            },
                                                                          )
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
                                                    ),

                                              ///Investigation Block
                                              controller.incidentReportDetailsModel
                                                          .value?.status_short ==
                                                      null
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          EdgeInsets.all(20),
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
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.type_of_job}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.is_person_involved}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.is_person_authorized}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.instructions_given}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.safety_equipments}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.safe_procedure_observed}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.unsafe_condition_contributed}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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
                                                                          Text(
                                                                            '${controller.incidentReportDetailsModel.value?.unsafe_act_cause}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
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

                                              ///Why Why Analysis
                                              controller.whyWhyAnalysisList!
                                                      .isEmpty
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .whyWhyAnalysisList
                                                                      ?.length ??
                                                                  0) *
                                                              50) +
                                                          125,
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width /
                                                      //         1.2,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  "Why Why Analysis",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Divider(
                                                          //   color: ColorValues.greyLightColour,
                                                          // ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Why",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Cause",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .whyWhyAnalysisList
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .whyWhyAnalysisList?[index]
                                                                              ?.why
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .whyWhyAnalysisList?[index]
                                                                              ?.cause
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                              ///Root Cause Analysis
                                              controller.rootCauseList!.isEmpty
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .rootCauseList
                                                                      ?.length ??
                                                                  0) *
                                                              50) +
                                                          125,
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width /
                                                      //         1.2,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  "Root Cause Analysis",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Divider(
                                                          //   color: ColorValues.greyLightColour,
                                                          // ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Cause",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .rootCauseList
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .rootCauseList?[index]
                                                                              ?.cause
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                              ///Immediate Correction
                                              controller
                                                      .immediateCorrectionList!
                                                      .isEmpty
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .immediateCorrectionList
                                                                      ?.length ??
                                                                  0) *
                                                              50) +
                                                          125,
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width /
                                                      //         1.2,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  "Immediate Correction",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Divider(
                                                          //   color: ColorValues.greyLightColour,
                                                          // ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Correction",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .immediateCorrectionList
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .immediateCorrectionList?[index]
                                                                              ?.details
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                              ///Proposed Action Plan
                                              controller.proposedActionPlanList!
                                                      .isEmpty
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .proposedActionPlanList
                                                                      ?.length ??
                                                                  0) *
                                                              50) +
                                                          125,
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width /
                                                      //         1.2,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  "Proposed Action Plan",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Divider(
                                                          //   color: ColorValues.greyLightColour,
                                                          // ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Action as per plan",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Responsibility",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Target date",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Remark",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .proposedActionPlanList
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .proposedActionPlanList?[index]
                                                                              ?.actions_as_per_plan
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .proposedActionPlanList?[index]
                                                                              ?.responsibility
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .proposedActionPlanList?[index]
                                                                              ?.target_date
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .proposedActionPlanList?[index]
                                                                              ?.remarks
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                              ///Investigation team
                                              controller.investiagtionTeamList!
                                                      .isEmpty
                                                  ? Dimens.box0
                                                  : Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                      .investiagtionTeamList
                                                                      ?.length ??
                                                                  0) *
                                                              50) +
                                                          125,
                                                      // width:
                                                      //     MediaQuery.of(context)
                                                      //             .size
                                                      //             .width /
                                                      //         1.2,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                                  "Investigation Team",
                                                                  style: Styles
                                                                      .blue700,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Divider(
                                                          //   color: ColorValues.greyLightColour,
                                                          // ),
                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                              columns: [
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Name",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Designation",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ],
                                                              rows: List<
                                                                  DataRow>.generate(
                                                                controller
                                                                        .investiagtionTeamList
                                                                        ?.length ??
                                                                    0,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .investiagtionTeamList?[index]
                                                                              ?.name
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .investiagtionTeamList?[index]
                                                                              ?.designation
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                              controller.incidentReportDetailsModel
                                                              .value?.id !=
                                                          null &&
                                                      varUserAccessModel.value
                                                              .access_list!
                                                              .where((e) =>
                                                                  e.feature_id ==
                                                                      UserAccessConstants
                                                                          .kIncidentReportFeatureId &&
                                                                  e.approve ==
                                                                      UserAccessConstants
                                                                          .kHaveApproveAccess)
                                                              .length >
                                                          0
                                                  ? Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Column(
                                                        children: [
                                                          IgnorePointer(
                                                            ignoring: controller
                                                                        .incidentReportDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    181
                                                                ? false
                                                                : true,
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
                                                          IgnorePointer(
                                                            ignoring: controller
                                                                        .incidentReportDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    181
                                                                ? false
                                                                : true,
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
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Dimens.box0,

                                              ///Incident Report History
                                              controller.irId.value != null
                                                  ? Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
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
                                                            offset:
                                                                Offset(0, 2),
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
                                                          // Column(
                                                          //   children: [
                                                          //     Row(
                                                          //       children: [
                                                          //         Text(
                                                          //             "Time Stamp"),
                                                          //         Text(
                                                          //             "Posted By"),
                                                          //         Text("Comment"),
                                                          //         Text(
                                                          //             "Location"),
                                                          //         Text("Status"),
                                                          //       ],
                                                          //     )
                                                          //   ]..addAll([
                                                          //       ...(controller
                                                          //               .historyList?.value ??
                                                          //           [])
                                                          //     ].map((e) {
                                                          //       return Row(
                                                          //         children: [
                                                          //           Text(
                                                          //               "${e?.createdAt??''}"),
                                                          //           Text(
                                                          //               "${e?.createdByName}"),
                                                          //           Text(
                                                          //               "${e?.comment}"),
                                                          //           Text(
                                                          //               "--"),
                                                          //           Text(
                                                          //               "${e?.status_name ??''}"),
                                                          //         ],
                                                          //       );
                                                          //     })),
                                                          // ),

                                                          Expanded(
                                                            child: DataTable2(
                                                              border: TableBorder.all(
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
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Posted By",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Comment",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                                // DataColumn(
                                                                //     label: Text(
                                                                //   "Module Type",
                                                                //   style: TextStyle(
                                                                //       fontSize:
                                                                //           15,
                                                                //       fontWeight:
                                                                //           FontWeight
                                                                //               .bold),
                                                                // )),
                                                                DataColumn(
                                                                    label: Text(
                                                                  "Status",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
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
                                                                    DataRow(
                                                                        cells: [
                                                                      DataCell(Text(controller
                                                                              .historyList?[index]
                                                                              ?.createdAt
                                                                              ?.result
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .historyList?[index]
                                                                              ?.createdByName
                                                                              .toString() ??
                                                                          '')),
                                                                      DataCell(Text(controller
                                                                              .historyList?[index]
                                                                              ?.comment
                                                                              .toString() ??
                                                                          '')),
                                                                      // DataCell(Text(controller
                                                                      //         .historyList?[index]
                                                                      //         ?.moduleType
                                                                      //         .toString() ??
                                                                      //     '')),
                                                                      DataCell(Text(controller
                                                                              .historyList?[index]
                                                                              ?.status_name
                                                                              .toString() ??
                                                                          '')),
                                                                    ]),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Dimens.box0,
                                            ],
                                          ),
                                        );
                                      }),
                                  Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 45,
                                          child: CustomElevatedButton(
                                            icon: Icons.print_outlined,
                                            backgroundColor:
                                                ColorValues.appDarkBlueColor,
                                            text: "Print",
                                            onPressed: () {
                                              controller.generateInvoice();
                                            },
                                          ),
                                        ),
                                        Dimens.boxWidth10,
                                        controller.incidentReportDetailsModel
                                                        .value?.id !=
                                                    null &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kIncidentReportFeatureId &&
                                                            e.edit ==
                                                                UserAccessConstants
                                                                    .kHaveEditAccess)
                                                        .length >
                                                    0
                                            ? Dimens.box0
                                            : Dimens.box0,
                                        controller.incidentReportDetailsModel
                                                        .value?.id !=
                                                    null &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kIncidentReportFeatureId &&
                                                            e.approve ==
                                                                UserAccessConstants
                                                                    .kHaveApproveAccess)
                                                        .length >
                                                    0
                                            ? Row(
                                                children: [
                                                  controller.incidentReportDetailsModel
                                                                  .value?.status ==
                                                              181 ||
                                                          controller
                                                                  .incidentReportDetailsModel
                                                                  .value
                                                                  ?.status ==
                                                              182
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              height: 45,
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    ColorValues
                                                                        .appGreenColor,
                                                                text: "Approve",
                                                                icon:
                                                                    Icons.check,
                                                                onPressed: () {
                                                                  Get.dialog(
                                                                      ApproveIncidentReportDialog(
                                                                    id: controller
                                                                        .irId
                                                                        .value,
                                                                  ));
                                                                },
                                                              ),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            Container(
                                                              height: 45,
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    ColorValues
                                                                        .rejectColor,
                                                                text: "Reject",
                                                                icon:
                                                                    Icons.close,
                                                                onPressed: () {
                                                                  Get.dialog(IncidentReportRejectDialog(
                                                                      id: controller
                                                                          .irId
                                                                          .value));
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            //   controller.incidentReportDetailsModel.value
                                                            //                   ?.status ==
                                                            //               185 ||
                                                            controller
                                                                        .incidentReportDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    184
                                                                ? Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            45,
                                                                        child:
                                                                            CustomElevatedButton(
                                                                          backgroundColor:
                                                                              ColorValues.appGreenColor,
                                                                          text:
                                                                              "Approve IR",
                                                                          icon:
                                                                              Icons.check,
                                                                          onPressed:
                                                                              () {
                                                                            Get.dialog(ApproveIncidentReportDialog(
                                                                              id: controller.irId.value,
                                                                            ));
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Dimens
                                                                          .boxWidth10,
                                                                      Container(
                                                                        height:
                                                                            45,
                                                                        child:
                                                                            CustomElevatedButton(
                                                                          backgroundColor:
                                                                              ColorValues.rejectColor,
                                                                          text:
                                                                              "Reject IR",
                                                                          icon:
                                                                              Icons.close,
                                                                          onPressed:
                                                                              () {
                                                                            Get.dialog(IncidentReportSecondRejectDialog(id: controller.irId.value));
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Dimens.box0
                                                          ],
                                                        ),
                                                ],
                                              )
                                            : Dimens.box0,
                                      ],
                                    ),
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
        ),
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
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
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
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
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
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
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
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
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
}

class TitleAndInfo extends StatelessWidget {
  final String title;
  final String info;

  TitleAndInfo(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomRichText(
            title: title,
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: TextStyle(
              color: Color.fromARGB(255, 5, 92, 163),
            ),
          ),
        ),
      ],
    );
  }
}
