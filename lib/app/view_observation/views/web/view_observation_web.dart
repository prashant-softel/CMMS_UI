import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_course/view/view_course_web.dart';
import 'package:cmms/app/view_observation/view_observation_controller.dart';
import 'package:cmms/app/widgets/compliance_approve_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class ViewObservationWeb extends StatefulWidget {
  ViewObservationWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewObservationWeb> createState() => _ViewObservationWebState();
}

class _ViewObservationWebState extends State<ViewObservationWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewObservationController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(() => SelectionArea(
              child: Scaffold(
                body: Container(
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
                                Get.offNamed(Routes.statutory);
                              },
                              child: Text(" / MIS", style: Styles.greyLight14),
                            ),
                            Text(
                              " / VIEW OBSERVATION",
                              style: Styles.greyLight14,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                            child: Card(
                              margin: Dimens.edgeInsets12,
                              color: ColorValues.cardColor,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "View Observation",
                                          style: Styles.blackBold18,
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: ColorValues.approveColor,
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      ColorValues.approveColor),
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
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 60,
                                      vertical: 30,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ScrollConfiguration(
                                            behavior:
                                                ScrollConfiguration.of(context)
                                                    .copyWith(
                                                        scrollbars: false),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin: Dimens
                                                        .edgeInsets40_0_40_0,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Obs ID:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Contractor Name:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Risk Type:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Corrective/Preventive Action:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Responsible Person:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Target Date:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxWidth10,
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "${controller.getObsById.value?.id ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.contractor_name ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.risk_type_name ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.preventive_action ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.responsible_person ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.target_date ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              "Contact Number:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Cost Type:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Date of Observation:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Type of Observation:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Location of Observation:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                            Text(
                                                              "Source of Observation:",
                                                              style: Styles
                                                                  .black17,
                                                            ),
                                                          ],
                                                        ),
                                                        Dimens.boxWidth10,
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "${controller.getObsById.value?.contact_number ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                " ${controller.getObsById.value?.cost_type ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.date_of_observation ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.type_of_observation_name ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.location_of_observation ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                            Text(
                                                                "${controller.getObsById.value?.source_of_observation_name ?? ""}",
                                                                style: Styles
                                                                    .blue17),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       child: Column(
                                        //         children: [
                                        //           TitleAndInfo(
                                        //             "ID:",
                                        //             "${controller.getObsById.value!.id == null ? "" : controller.getObsById.value!.id}",
                                        //           ),
                                        //           Dimens.boxHeight10,
                                        //           TitleAndInfo(
                                        //             "Contractor Name:",
                                        //             "${controller.getObsById.value!.contractor_name == null ? "" : controller.getObsById.value!.contractor_name}",
                                        //           ),
                                        //           Dimens.boxHeight10,
                                        //           TitleAndInfo(
                                        //             "Risk Type:",
                                        //             "${controller.getObsById.value!.risk_type_name == null ? "" : controller.getObsById.value!.risk_type_name}",
                                        //           ),
                                        //           Dimens.boxHeight10,
                                        //           TitleAndInfo(
                                        //             "Corrective/Preventive Action:",
                                        //             "${controller.getObsById.value!.preventive_action == null ? "" : controller.getObsById.value!.preventive_action}",
                                        //           ),
                                        //           TitleAndInfo(
                                        //             "Responsible Person:",
                                        //             "${controller.getObsById.value!.responsible_person == null ? "" : controller.getObsById.value!.responsible_person}",
                                        //           ),
                                        //           TitleAndInfo(
                                        //             "Target Date:",
                                        //             "${controller.getObsById.value!.target_date == null ? "" : controller.getObsById.value!.target_date}",
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     Spacer(),
                                        //     Expanded(
                                        //       child: Column(
                                        //         children: [
                                        //           TitleAndInfo(
                                        //             "Contact Number:",
                                        //             "${controller.getObsById.value!.contact_number == null ? "" : controller.getObsById.value!.contact_number}",
                                        //           ),
                                        //           Dimens.boxHeight10,
                                        //           TitleAndInfo(
                                        //             "Cost Type:",
                                        //             "${controller.getObsById.value!.cost_type == null ? "" : controller.getObsById.value!.cost_type}",
                                        //           ),
                                        //           Dimens.boxHeight10,
                                        //           TitleAndInfo(
                                        //             "Date of Observation:",
                                        //             "${controller.getObsById.value!.date_of_observation == null ? "" : controller.getObsById.value!.date_of_observation}",
                                        //           ),
                                        //           Dimens.boxHeight10,
                                        //           TitleAndInfo(
                                        //             "Type of Observation:",
                                        //             "${controller.getObsById.value!.type_of_observation == null ? "" : controller.getObsById.value!.type_of_observation}",
                                        //           ),
                                        //           TitleAndInfo(
                                        //             "Location of Observation:",
                                        //             "${controller.getObsById.value!.location_of_observation == null ? "" : controller.getObsById.value!.location_of_observation}",
                                        //           ),
                                        //           TitleAndInfo(
                                        //             "Source of Observation:",
                                        //             "${controller.getObsById.value!.source_of_observation_name == null ? "" : controller.getObsById.value!.source_of_observation_name}",
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     Spacer(),
                                        //   ],
                                        // ),

                                        Dimens.boxHeight20,
                                        (controller.historyList != null &&
                                                controller
                                                    .historyList!.isNotEmpty)
                                            ? Container(
                                                margin: Dimens.edgeInsets20,
                                                height: ((controller.historyList
                                                                ?.length ??
                                                            0) *
                                                        40) +
                                                    120,
                                                decoration: BoxDecoration(
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Statutory Compliance History ",
                                                            style:
                                                                Styles.blue700,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          HistoryTableWidgetWeb(
                                                        historyList: controller
                                                            .historyList,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Dimens.box0,
                                      ],
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
                ),
                // floatingActionButton: Obx(() => varUserAccessModel
                //             .value.access_list!
                //             .where((e) =>
                //                 e.feature_id ==
                //                     UserAccessConstants.kGoodsFeatureId &&
                //                 e.add == UserAccessConstants.kHaveAddAccess)
                //             .length >
                //         0
                //     ? Row(
                //         children: [
                //           Spacer(),
                //           Container(
                //             height: 45,
                //             child: CustomElevatedButton(
                //               backgroundColor: ColorValues.appGreenColor,
                //               text: "Approve",
                //               icon: Icons.check,
                //               onPressed: () {
                //                 Get.dialog(ComplianceApprovedDialog(
                //                   // id: controller.srId.value,
                //                   position: 1,
                //                 ));
                //               },
                //             ),
                //           ),
                //           Dimens.boxWidth10,
                //           Container(
                //             height: 45,
                //             child: CustomElevatedButton(
                //               backgroundColor: ColorValues.rejectColor,
                //               text: "Reject",
                //               icon: Icons.close,
                //               onPressed: () {
                //                 Get.dialog(ComplianceApprovedDialog(
                //                   // id: controller.srId.value,
                //                   position: 2,
                //                 ));
                //               },
                //             ),
                //           ),
                //           Spacer(),
                //         ],
                //       )
                //     : Dimens.box0),
              ),
            ));
      },
    );
  }
}