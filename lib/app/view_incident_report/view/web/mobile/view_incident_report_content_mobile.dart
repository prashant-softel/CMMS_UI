import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/incident_report_approve_dialog.dart';
import 'package:cmms/app/widgets/incident_report_reject_dialog.dart';
import 'package:cmms/app/widgets/ir_reject_part2_dialog.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/incident_report_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewIncidentReportMobile extends GetView<ViewIncidentReportController> {
  ViewIncidentReportMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (controller.incidentReportDetailsModel.value != null)
        ? //
        Obx(
            () => //
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: Get.height,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      //
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //
                            children: [
                              /// LEFT COLUMN
                              Expanded(
                                child: //
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //
                                        children: [
                                      JobDetailField(
                                        title: 'Id',
                                        value: (controller
                                                    .incidentReportDetailsModel
                                                    .value
                                                    ?.id !=
                                                null)
                                            ? "IR${controller.incidentReportDetailsModel.value?.id.toString() ?? ''}"
                                            : '',
                                      ),
                                      JobDetailField(
                                        title: 'Plant',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.facility_name ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: "Block",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.block_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: 'Incident Date & Time',
                                        value: controller
                                                .incidentDateTimeCtrlrWeb
                                                ?.text ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Incident Description',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.description ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: "Victim Name",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.victim_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: "Incident Investigation Done By",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.inverstigated_by_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: "Risk Type",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.risk_type_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: "Legal Applicability",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.legal_applicability_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: "Damaged Assets Cost Approx",
                                        value:
                                            '${controller.incidentReportDetailsModel.value?.damaged_cost ?? ""}INR',
                                      ),
                                      JobDetailField(
                                        title:
                                            "Asset Restoration Action Taken By",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.action_taken_by_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: "Insurance Status",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.insurance_status_name ??
                                            "",
                                      ),
                                    ]),
                              ),
                              // ),
                              Dimens.boxWidth10,

                              /// RIGHT COLUMN
                              Expanded(
                                child: //
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //
                                        children: [
                                      JobDetailField(
                                        title: 'Title',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.title ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Equipment Categories',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.equipment_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: 'Reporting Date & Time',
                                        value: controller
                                                .reportingDateTimeCtrlrWeb
                                                ?.text ??
                                            'null',
                                      ),
                                      JobDetailField(
                                        title: 'Incident Severity',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.severity
                                                .toString() ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Action Taken Date & Time',
                                        value: controller
                                                .actionTakenDateTimeCtrlrWeb
                                                .text
                                                .toString() ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title:
                                            'Incident Investigation Verification Done By',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.verified_by_name ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'ESI Applicability',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.esi_applicability_name ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'RCA Upload Required',
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.rca_required_name ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Gen Loss Due To Asset Damage',
                                        value:
                                            '${controller.incidentReportDetailsModel.value?.generation_loss ?? ''} INR',
                                      ),
                                      JobDetailField(
                                        title: "Insurance Available",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.is_insurance_applicable_name ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: "Insurance Remarks",
                                        value: controller
                                                .incidentReportDetailsModel
                                                .value
                                                ?.insurance_remark ??
                                            "",
                                      ),
                                    ]),
                              ),
                            ]),
                        Text(
                          "Details Of Injured Person ",
                          style: Styles.blue700,
                        ),
                        Dimens.boxHeight5,
                        ListView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                //  controller.scheduleCheckPoint! !=
                                //         null
                                //     ?
                                controller.detailsOfInjuredPersonList!.length,
                            // : 0,
                            itemBuilder: (context, index) {
                              final injuredPersonList =
                                  (controller.detailsOfInjuredPersonList !=
                                          null)
                                      ? controller
                                          .detailsOfInjuredPersonList![index]
                                      : DetailsOfInjuredPersonUpdate();
                              return GestureDetector(
                                onTap: () {},
                                child: Card(
                                  color: Colors.lightBlue.shade50,
                                  elevation: 10,
                                  shadowColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Text('Name Of Injured Person: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  '${injuredPersonList?.name}'
                                                  '',
                                                  style: Styles.appDarkBlue12),
                                            ),
                                          ]),
                                          Row(//
                                              children: [
                                            Text('Gender: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  injuredPersonList?.sex ?? '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Trade/Designation: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "${injuredPersonList?.designation ?? ''}",
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Address: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "${injuredPersonList?.address ?? ''}",
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Name Of Contractor: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "${injuredPersonList?.name_contractor ?? ''}",
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Body Part Injured: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "${injuredPersonList?.body_part_and_nature_of_injury ?? ''}",
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Work Experience: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "${injuredPersonList?.work_experience_years.toString ?? ''}",
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Plant & Equipment: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "${injuredPersonList?.plant_equipment_involved ?? ''}",
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Exact Location: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  "${injuredPersonList?.location_of_incident ?? ''}",
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                        ]),
                                  ),
                                ),
                              );
                            }),
                        Dimens.boxHeight15,
                        controller.detailsOfOtherInjuredPersonList!.isEmpty
                            ? Dimens.box0
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Details Of Other Injured Person ",
                                    style: Styles.blue700,
                                  ),
                                  Dimens.boxHeight5,
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller
                                            .detailsOfOtherInjuredPersonList
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      final injuredPerson = controller
                                              .detailsOfOtherInjuredPersonList?[
                                          index];
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          color: Colors.lightBlue.shade50,
                                          elevation: 10,
                                          shadowColor: Colors.black87,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        'Name Of Injured Person: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson?.name ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Gender: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson?.sex ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Trade/Designation: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson
                                                                  ?.designation ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Address: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson
                                                                  ?.address ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Name Of Contractor: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson
                                                                  ?.name_contractor ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Body Part Injured: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson
                                                                  ?.body_part_and_nature_of_injury ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Work Experience: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          "${injuredPerson?.work_experience_years.toString() ?? ''}",
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Plant & Equipment: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson
                                                                  ?.plant_equipment_involved ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Exact Location: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                          injuredPerson
                                                                  ?.location_of_incident ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                        controller.incidentReportDetailsModel.value
                                    ?.status_short ==
                                null
                            ? Dimens.box0
                            : Text(
                                "Investigation",
                                style: Styles.blue700,
                              ),

                        ///Investigation Block
                        controller.incidentReportDetailsModel.value
                                    ?.status_short ==
                                null
                            ? Dimens.box0
                            : Card(
                                color: Colors.lightBlue.shade50,
                                elevation: 10,
                                shadowColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'What task or type of job was being performed? ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.type_of_job}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        'Was the person involved in these activities trained and if so, when? ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.is_person_involved}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        'Was the person authorized/licensed to carry out that type of work / use machinery? ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.is_person_authorized}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        'What instructions had been given? By Whom? ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.instructions_given}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        'What safety equipment and /protection was used/ available? ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.safety_equipments}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        'Were correct safe procedures being observed? ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.safe_procedure_observed}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        'What unsafe condition contributed to the incident? ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.unsafe_condition_contributed}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        'Did unsafe act/s cause the incident? If yes. Mention the same ',
                                        style: Styles.black15,
                                      ),
                                      Dimens.boxHeight3,
                                      Text(
                                        '${controller.incidentReportDetailsModel.value?.unsafe_act_cause}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 5, 92, 163)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        controller.incidentReportDetailsModel.value?.id !=
                                    null &&
                                varUserAccessModel.value.access_list!
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
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Why Why Analysis Required: ',
                                                style: Styles.blue700,
                                              ),
                                              Dimens.boxWidth10,
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Obx(
                                                  () => Switch(
                                                    activeColor: Colors.green,
                                                    value: controller
                                                        .whyWhyAnalysisValue
                                                        .value,
                                                    onChanged: (value) {
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
                                          controller.whyWhyAnalysisList!.isEmpty
                                              ? Dimens.box0
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          NeverScrollableScrollPhysics(), // Prevents the list from scrolling independently
                                                      itemCount: controller
                                                              .whyWhyAnalysisList
                                                              ?.length ??
                                                          0,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final analysisItem =
                                                            controller
                                                                    .whyWhyAnalysisList?[
                                                                index];
                                                        return Card(
                                                          color: Colors
                                                              .lightBlue
                                                              .shade50,
                                                          elevation: 3,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min, // Ensure the Column takes up only the necessary space
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Why: ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade800,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        analysisItem?.why ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade800,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 8),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Cause: ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade800,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        analysisItem?.cause ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade800,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
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
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Detail Investigation Required: ',
                                                style: Styles.blue700,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Obx(
                                                  () => Switch(
                                                    activeColor: Colors.green,
                                                    value: controller
                                                        .detailInvestigationTeamValue
                                                        .value,
                                                    onChanged: (value) {
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
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: controller
                                                        .investiagtionTeamList
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  final teamMember = controller
                                                          .investiagtionTeamList?[
                                                      index];
                                                  return Card(
                                                    color: Colors
                                                        .lightBlue.shade50,
                                                    elevation: 10,
                                                    shadowColor: Colors.black87,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text('Name: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  teamMember
                                                                          ?.name ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 8),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  'Designation: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  teamMember
                                                                          ?.designation ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    controller.rootCauseList!.isEmpty
                                        ? SizedBox.shrink()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Root Cause Analysis",
                                                  style: Styles.blue700,
                                                ),
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: controller
                                                        .rootCauseList
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  final rootCause = controller
                                                      .rootCauseList?[index];
                                                  return Card(
                                                    color: Colors
                                                        .lightBlue.shade50,
                                                    elevation: 10,
                                                    shadowColor: Colors.black87,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text('Cause: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  rootCause
                                                                          ?.cause ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                    controller.immediateCorrectionList!.isEmpty
                                        ? SizedBox.shrink()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Immediate Correction",
                                                  style: Styles.blue700,
                                                ),
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: controller
                                                        .immediateCorrectionList
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  final correction = controller
                                                          .immediateCorrectionList?[
                                                      index];
                                                  return Card(
                                                    color: Colors
                                                        .lightBlue.shade50,
                                                    elevation: 10,
                                                    shadowColor: Colors.black87,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  'Correction: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  correction
                                                                          ?.details ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                    controller.proposedActionPlanList!.isEmpty
                                        ? SizedBox.shrink()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Proposed Action Plan",
                                                  style: Styles.blue700,
                                                ),
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: controller
                                                        .proposedActionPlanList
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  final actionPlan = controller
                                                          .proposedActionPlanList?[
                                                      index];
                                                  return Card(
                                                    color: Colors
                                                        .lightBlue.shade50,
                                                    elevation: 10,
                                                    shadowColor: Colors.black87,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  'Action as per plan: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  actionPlan
                                                                          ?.actions_as_per_plan ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 8),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  'Responsibility: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  actionPlan
                                                                          ?.responsibility ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 8),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  'Target date: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  actionPlan
                                                                          ?.target_date ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 8),
                                                          Row(
                                                            children: [
                                                              Text('Remark: ',
                                                                  style: Styles
                                                                      .appDarkGrey12),
                                                              SizedBox(
                                                                  width: 5),
                                                              Expanded(
                                                                child: Text(
                                                                  actionPlan
                                                                          ?.remarks ??
                                                                      '',
                                                                  style: Styles
                                                                      .appDarkBlue12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            : Dimens.box0,

                        controller.historyList!.isEmpty
                            ? Dimens.box0
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "IR History",
                                    style: Styles.blue700,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.historyList! != null
                                          ? controller.historyList!.length
                                          : 0,
                                      itemBuilder: (context, index) {
                                        final pmTaskHistoryModel =
                                            (controller.historyList! != null)
                                                ? controller.historyList![index]
                                                : HistoryModel();
                                        return Card(
                                          color: Colors.lightBlue.shade50,
                                          elevation: 10,
                                          shadowColor: Colors.black87,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(children: [
                                                    Text('Time Stamp: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          '${pmTaskHistoryModel?.createdAt?.result}'
                                                          '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ]),
                                                  Row(//
                                                      children: [
                                                    Text('Posted By: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          pmTaskHistoryModel
                                                                  ?.createdByName ??
                                                              '',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    )
                                                  ]),
                                                  Row(children: [
                                                    Text('Comments: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          "${pmTaskHistoryModel?.comment ?? ''}",
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    )
                                                  ]),
                                                  Row(children: [
                                                    Text('Status: ',
                                                        style: Styles
                                                            .appDarkGrey12),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          "${pmTaskHistoryModel?.status_name ?? ''}",
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    )
                                                  ]),
                                                ]),
                                          ),
                                        );
                                      }),
                                ],
                              ),

                        Dimens.boxHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              child: CustomElevatedButton(
                                icon: Icons.print_outlined,
                                backgroundColor: ColorValues.appDarkBlueColor,
                                text: "Print",
                                onPressed: () {
                                  controller.generateInvoice();
                                },
                              ),
                            ),
                            Dimens.boxWidth10,
                            controller.incidentReportDetailsModel.value?.id !=
                                        null &&
                                    varUserAccessModel.value.access_list!
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
                            controller.incidentReportDetailsModel.value?.id !=
                                        null &&
                                    varUserAccessModel.value.access_list!
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
                                                  child: CustomElevatedButton(
                                                    backgroundColor: ColorValues
                                                        .appGreenColor,
                                                    text: "Approve",
                                                    icon: Icons.check,
                                                    onPressed: () {
                                                      Get.dialog(
                                                          ApproveIncidentReportDialog(
                                                        id: controller
                                                            .irId.value,
                                                      ));
                                                    },
                                                  ),
                                                ),
                                                Dimens.boxWidth10,
                                                Container(
                                                  height: 45,
                                                  child: CustomElevatedButton(
                                                    backgroundColor:
                                                        ColorValues.rejectColor,
                                                    text: "Reject",
                                                    icon: Icons.close,
                                                    onPressed: () {
                                                      Get.dialog(
                                                          IncidentReportRejectDialog(
                                                              id: controller
                                                                  .irId.value));
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
                                                controller.incidentReportDetailsModel
                                                            .value?.status ==
                                                        184
                                                    ? Row(
                                                        children: [
                                                          Container(
                                                            height: 45,
                                                            child:
                                                                CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appGreenColor,
                                                              text:
                                                                  "Approve IR",
                                                              icon: Icons.check,
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
                                                              text: "Reject IR",
                                                              icon: Icons.close,
                                                              onPressed: () {
                                                                Get.dialog(IncidentReportSecondRejectDialog(
                                                                    id: controller
                                                                        .irId
                                                                        .value));
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
                        Dimens.boxHeight50
                      ]),
                ),
              ),
            ),
          )
        : Dimens.box0;
  }
}
