import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../domain/models/job_model.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../utils/app_constants.dart';
import '../../widgets/custom_elevated_button.dart';
import '../job_details_controller.dart';

class JobDetailsWebView extends GetView<JobDetailsController> {
  JobDetailsWebView({super.key});

  ///
  var controller = Get.find<JobDetailsController>();
  @override
  Widget build(BuildContext context) {
    return buildDocument(context: context);
  }

  Widget buildDocument({required BuildContext context}) {
    return Obx(
      () => Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 227, 224, 224),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                  "DASHBOARD",
                  style: Styles.greyLight14,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(" / BREAKDOWN MAINTAINANCE".toUpperCase(),
                      style: Styles.greyMediumLight12),
                ),
                Text(" / JOB DETAILS VIEW", style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Expanded(
            child: RepaintBoundary(
              // key: controller.printKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                height: Get.height / 1.2,
                child: Card(
                  color: Color.fromARGB(255, 245, 248, 250),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        // child: Row(
                        //   children: [
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "JOB DETAIL SCREEN ",
                              style: Styles.blue700,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                color: JobStatusData.getStatusColor(
                                    "${JobStatusData.getStatusStringFromInt(controller.jobDetailsModel.value?.status)}"),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "${JobStatusData.getStatusStringFromInt(controller.jobDetailsModel.value?.status)}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        //     Spacer(),
                        //     Container(
                        //       height: 30,
                        //       child: CustomElevatedButton(
                        //         backgroundColor: ColorValues.appLightBlueColor,
                        //         onPressed: () async {},
                        //         text:
                        //         "${controller.pmtaskViewModel.value?.status_name ?? ""}",
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Expanded(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: Dimens.edgeInsets40_0_40_0,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Plant Name: ",
                                            style: Styles.black14,
                                          ),
                                          Text(
                                            "Block Name: ",
                                            style: Styles.black14,
                                          ),
                                          Text(
                                            "Equipment Categories ",
                                            style: Styles.black14,
                                          ),
                                          Text(
                                            "Equipment Name ",
                                            style: Styles.black14,
                                          ),
                                          Text(
                                            "Work Type ",
                                            style: Styles.black14,
                                          ),
                                          Text(
                                            "Tools Required ",
                                            style: Styles.black14,
                                          ),
                                        ],
                                      ),
                                      Dimens.boxWidth10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${controller.jobDetailsModel.value?.facilityName ?? ""}",
                                              style: Styles.blue14),
                                          Text(
                                              " ${controller.jobDetailsModel.value?.blockName ?? ""}",
                                              style: Styles.blue14),
                                          // Text(
                                          //     "${controller.jobDetailsModel
                                          //         .value?.workingAreaList !=
                                          //         null
                                          //         ? controller.jobDetailsModel.value
                                          //         ?.workingAreaList
                                          //         ?.map<String>((item) => item
                                          //         .workingAreaName
                                          //         .toString())
                                          //         .toList()
                                          //         : []}",
                                          //     style: Styles.blue14),

                                          Text(
                                              "${controller.jobDetailsModel.value?.equipmentCatList != null ? controller.jobDetailsModel.value?.equipmentCatList?.map<String>((item) => item.equipmentCatName.toString()).toList() : []}",
                                              style: Styles.blue14),

                                          Text(
                                              "${"${controller.jobDetailsModel.value?.workingAreaList != null ? controller.jobDetailsModel.value?.workingAreaList?.map<String>((item) => item.workingAreaName.toString()).toList() : []}"}"),
                                          Text(
                                              "${"${controller.jobDetailsModel.value?.workTypeList != null ? controller.jobDetailsModel.value?.workTypeList?.map<String>((item) => item.workTypeName.toString()).toList() : []}"}"),
                                          Text(
                                              " ${controller.jobDetailsModel.value?.lstToolsRequired ?? ""}",
                                              style: Styles.blue14),
                                          // Text("${
                                          //     "${controller.jobDetailsModel
                                          //         .value?.lstToolsRequired !=
                                          //         null
                                          //         ? controller.jobDetailsModel.value
                                          //         ?.lstToolsRequired
                                          //         ?.map<String>((item) => item
                                          //         .toolsName.toString())
                                          //         .toList()
                                          //         : []}"
                                          // }"
                                          // ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Raised By ",
                                            style: Styles.black14,
                                          ),
                                          Text(
                                            "Assigned To ",
                                            style: Styles.black14,
                                          ),
                                          // Text(
                                          //   "Status",
                                          //   style: Styles.black14,
                                          // ),
                                          Text(
                                            "BreakDown Time ",
                                            style: Styles.black14,
                                          ),
                                        ],
                                      ),
                                      Dimens.boxWidth10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${controller.jobDetailsModel.value?.createdByName ?? ""}",
                                              style: Styles.blue14),
                                          Text(
                                              "${controller.jobDetailsModel.value?.assignedName ?? ""}",
                                              style: Styles.blue14),
                                          // Text(
                                          //     " ${controller.jobDetailsModel
                                          //         .value?.currentPtwId !=
                                          //         null
                                          //     ? controller.jobDetailsModel.value
                                          //     ?.currentPtwId
                                          //     .toString() ??
                                          //     ''
                                          //     : ''}",
                                          //     style: Styles.blue14),
                                          // Text(
                                          //   "${
                                          //       JobStatusData
                                          //           .getStatusStringFromInt(controller
                                          //           .jobDetailsModel
                                          //           .value
                                          //           ?.status)
                                          //   }"
                                          // ),
                                          Text(
                                              " ${controller.jobDetailsModel.value?.breakdownTime ?? ""}",
                                              style: Styles.blue14),
                                          // Text(
                                          //     "${controller.jobDetailsModel
                                          //         .value
                                          //         ?.equipmentCatList !=
                                          //         null ? controller.jobDetailsModel.value
                                          //     ?.equipmentCatList
                                          //     ?.map<String>((item) => item
                                          //     .equipmentCatName
                                          //     .toString())
                                          //     .toList()
                                          //     : []
                                          // }",
                                          //     style: Styles.blue14),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // (controller.scheduleCheckPoint != null &&
                                //     controller
                                //         .scheduleCheckPoint!.isNotEmpty)
                                //     ?
                                // Container(
                                //   margin: Dimens.edgeInsets20,
                                //   height: 400,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       color: ColorValues
                                //           .lightGreyColorWithOpacity35,
                                //       width: 1,
                                //     ),
                                //     boxShadow: [
                                //       BoxShadow(
                                //         color: ColorValues
                                //             .appBlueBackgroundColor,
                                //         spreadRadius: 2,
                                //         blurRadius: 5,
                                //         offset: Offset(0, 2),
                                //       ),
                                //     ],
                                //   ),
                                //   child: Column(
                                //     children: [
                                //       // Padding(
                                //       //   padding:
                                //       //   const EdgeInsets.all(10.0),
                                //       //   child: Row(
                                //       //     children: [
                                //       //       Text(
                                //       //         "${controller.pmtaskViewModel.value?.checklist_name ?? ""}",
                                //       //         style: Styles.blue700,
                                //       //       ),
                                //       //     ],
                                //       //   ),
                                //       // ),
                                //       Divider(
                                //         color:
                                //         ColorValues.greyLightColour,
                                //       ),
                                //       Expanded(
                                //         child: ScrollableTableView(
                                //           paginationController: controller
                                //               .schedulePaginationController,
                                //           columns: [
                                //             "Job ID",
                                //             "Job Title",
                                //             // "Job Description",
                                //             "BreakDown Time",
                                //             "Current Status",
                                //             "Equipments"
                                //           ].map((column) {
                                //             return TableViewColumn(
                                //               minWidth: Get.width * 0.15,
                                //               label: column,
                                //             );
                                //           }).toList(),
                                //           rows: //
                                //           [
                                //             // ...List.generate(
                                //             //   controller
                                //             //       .scheduleCheckPoint?.length ?? 0,
                                //             //       (index) {
                                //                 // var scheduleCheckPointDetails = controller.scheduleCheckPoint?[index];
                                //                 // return
                                //               [
                                //                   '${controller.jobDetailsModel.value?.id}',
                                //                   '${controller.jobDetailsModel.value?.jobTitle}',
                                //                   // '${controller.jobDetailsModel.value?.jobDescription}',
                                //
                                //                     "${controller.jobDetailsModel
                                //                         .value?.workingAreaList !=
                                //                         null
                                //                         ? controller.jobDetailsModel.value
                                //                         ?.workingAreaList
                                //                         ?.map<String>((item) => item
                                //                         .workingAreaName
                                //                         .toString())
                                //                         .toList()
                                //                         : []}",
                                //                   '${controller.jobDetailsModel.value?.breakdownTime}',
                                //                   '${controller.jobDetailsModel.value?.status}',
                                //                 ],
                                //             //   },
                                //             // ),
                                //           ].map((record) {
                                //             return TableViewRow(
                                //               height: 90,
                                //               cells: record.map((value) {
                                //                 return TableViewCell(
                                //                   child: Text(value),
                                //                 );
                                //               }).toList(),
                                //             );
                                //           }).toList(),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // : Dimens.box0,
                                Dimens.boxHeight10,
                                // Text(
                                //     "${controller.jobAssociatedModelsList?.length}"),
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height: Get.height / 3.8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Associated JobCard(s) ",
                                              style: Styles.blue700,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      controller.jobAssociatedModelsList!
                                                  .length >
                                              0
                                          ? Expanded(
                                              child: ScrollableTableView(
                                                columns: [
                                                  "Job ID",
                                                  "Permit ID",
                                                  "Job Title",
                                                  "Job Description",
                                                  // "BreakDown Time",
                                                  "Job Card Date",
                                                  "Status",
                                                  'Action',
                                                ].map((column) {
                                                  return TableViewColumn(
                                                    label: column,
                                                    minWidth: Get.width * 0.13,
                                                  );
                                                }).toList(),
                                                rows: [
                                                  [
                                                    '${controller.jobAssociatedModelsList![0]?.jobid}',
                                                    '${controller.jobAssociatedModelsList![0]?.permit_id != null ? controller.jobAssociatedModelsList![0]?.permit_id.toString() ?? '' : ''}',
                                                    '${controller.jobAssociatedModelsList![0]?.description}',
                                                    '${controller.jobAssociatedModelsList![0]?.description}',
                                                    '${controller.jobAssociatedModelsList![0]?.job_card_date}',
                                                    // '${controller.jobAssociatedModelsList![0]?.status}',
                                                    "${JobStatusData.getStatusStringFromInt(controller.jobAssociatedModelsList![0]?.current_status)}",
                                                    'Action',
                                                  ],
                                                ].map((record) {
                                                  return TableViewRow(
                                                    height: 90,
                                                    cells: record.map((value) {
                                                      return TableViewCell(
                                                        child: value == "Action"
                                                            ? Wrap(children: [
                                                                if (JobStatusData.getStatusStringFromInt(controller
                                                                        .jobDetailsModel
                                                                        .value
                                                                        ?.status) ==
                                                                    AppConstants
                                                                        .kJobStatusLinkedToPermit)
                                                                  TableActionButton(
                                                                    color: ColorValues
                                                                        .appPurpleColor,
                                                                    icon: Icons
                                                                        .add,
                                                                    message:
                                                                        "Job Card",
                                                                    onPress: () =>
                                                                        controller
                                                                            .goToJobCardScreen(),
                                                                  ),
                                                              ])
                                                            : Text(value),
                                                      );
                                                    }).toList(),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),

                                Dimens.boxHeight10,
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height: Get.height / 3.8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Material Used / Issued",
                                              style: Styles.blue700,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      controller.jobAssociatedModelsList!
                                                  .length >
                                              0
                                          ? Expanded(
                                              child: ScrollableTableView(
                                                columns: [
                                                  "Job Card ID",
                                                  "Mrs ID",
                                                  "Mrs Items List ",
                                                  'Action',
                                                ].map((column) {
                                                  return TableViewColumn(
                                                    label: column,
                                                    minWidth: Get.width * 0.21,
                                                  );
                                                }).toList(),
                                                rows: [
                                                  [
                                                    // '${controller.jobAssociatedModelsList![0]?.jobid}',
                                                    // '${controller.jobAssociatedModelsList![0]?.permit_id != null ? controller.jobAssociatedModelsList![0]?.permit_id.toString() ?? '' : ''}',
                                                    // "${JobStatusData.getStatusStringFromInt(controller.jobAssociatedModelsList![0]?.current_status)}",
                                                    // 'Action',
                                                  ],
                                                ].map((record) {
                                                  return TableViewRow(
                                                    height: 90,
                                                    cells: record.map((value) {
                                                      return TableViewCell(
                                                        child: value == "Action"
                                                            ? Wrap(children: [
                                                                if (JobStatusData.getStatusStringFromInt(controller
                                                                        .jobDetailsModel
                                                                        .value
                                                                        ?.status) ==
                                                                    AppConstants
                                                                        .kJobStatusLinkedToPermit)
                                                                  TableActionButton(
                                                                    color: ColorValues
                                                                        .appPurpleColor,
                                                                    icon: Icons
                                                                        .add,
                                                                    message:
                                                                        "Job Card",
                                                                    onPress: () =>
                                                                        controller
                                                                            .goToJobCardScreen(),
                                                                  ),
                                                              ])
                                                            : Text(value),
                                                      );
                                                    }).toList(),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),

                                Dimens.boxHeight30,
                                // (controller.historyLog != null &&
                                //     controller.historyLog!.isNotEmpty)
                                //     ?
                                // Container(
                                //       margin: Dimens.edgeInsets20,
                                //       height: 300,
                                //       decoration: BoxDecoration(
                                //         border: Border.all(
                                //           color: ColorValues
                                //               .lightGreyColorWithOpacity35,
                                //           width: 1,
                                //         ),
                                //         boxShadow: [
                                //           BoxShadow(
                                //             color: ColorValues
                                //                 .appBlueBackgroundColor,
                                //             spreadRadius: 2,
                                //             blurRadius: 5,
                                //             offset: Offset(0, 2),
                                //           ),
                                //         ],
                                //       ),
                                //       child: Column(
                                //         children: [
                                //           Padding(
                                //             padding:
                                //             const EdgeInsets.all(10.0),
                                //             child: Row(
                                //               children: [
                                //                 Text(
                                //                   "PM History ",
                                //                   style: Styles.blue700,
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Divider(
                                //             color:
                                //             ColorValues.greyLightColour,
                                //           ),
                                //           Expanded(
                                //             child: ScrollableTableView(
                                //               columns: [
                                //                 "Time Stamp",
                                //                 "Posted By",
                                //                 "Comment",
                                //                 "Location",
                                //                 "Status",
                                //               ].map((column) {
                                //                 return TableViewColumn(
                                //                   label: column,
                                //                   minWidth: Get.width * 0.15,
                                //                 );
                                //               }).toList(),
                                //               rows: [
                                //                 ...List.generate(
                                //                   controller.historyLog
                                //                       ?.length ??
                                //                       0,
                                //                       (index) {
                                //                     var getHistoryListDetails =
                                //                     controller
                                //                         .historyLog?[
                                //                     index];
                                //                     return [
                                //                       '${getHistoryListDetails?.created_at}',
                                //                       '${getHistoryListDetails?.created_by_name ?? ''}',
                                //                       '${getHistoryListDetails?.comment ?? ''}',
                                //                       '--',
                                //                       '${getHistoryListDetails?.status ?? ''}',
                                //                     ];
                                //                   },
                                //                 ),
                                //                 // [
                                //               ].map((record) {
                                //                 return TableViewRow(
                                //                   height: 90,
                                //                   cells: record.map((value) {
                                //                     return TableViewCell(
                                //                       child: Text(value),
                                //                     );
                                //                   }).toList(),
                                //                 );
                                //               }).toList(),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     )
                                //         : Dimens.box0,
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center, //
                                    children: [
                                      if (controller.jobDetailsModel.value
                                                  ?.status !=
                                              null &&
                                          JobStatusData.getStatusStringFromInt(
                                                  controller.jobDetailsModel
                                                      .value?.status) ==
                                              AppConstants.kJobStatusCreated)
                                        CustomElevatedButton(
                                          onPressed: () => controller
                                              .goToEditJobScreen(controller
                                                  .jobDetailsModel.value?.id),
                                          text: 'Assign',
                                        ),

                                      if ((controller.jobDetailsModel.value
                                                  ?.assignedId ??
                                              0) >
                                          0) ...[
                                        //check if status is "ASSIGNED"
                                        if (controller.jobDetailsModel.value
                                                    ?.status !=
                                                null &&
                                            JobStatusData
                                                    .getStatusStringFromInt(
                                                        controller
                                                            .jobDetailsModel
                                                            .value
                                                            ?.status) ==
                                                AppConstants.kJobStatusAssigned)
                                          CustomElevatedButton(
                                            onPressed: () => controller
                                                .goToEditJobScreen(controller
                                                    .jobDetailsModel.value?.id),
                                            text: 'Re-Assign',
                                            icon: Icons.edit,
                                          ),
                                      ],
                                      Dimens.boxWidth10,
                                      //check if status is "ASSIGNED"
                                      if (controller.jobDetailsModel.value
                                                  ?.status !=
                                              null &&
                                          JobStatusData.getStatusStringFromInt(
                                                  controller.jobDetailsModel
                                                      .value?.status) ==
                                              AppConstants.kJobStatusAssigned)
                                        CustomElevatedButton(
                                          text: "Link to Existing Permit",
                                          icon: Icons.link,
                                          onPressed: () =>
                                              controller.showPermitsDialog(),
                                          backgroundColor:
                                              ColorValues.appYellowColor,
                                        ),
                                      Dimens.boxWidth10,
                                      //check if status is "ASSIGNED"
                                      if (JobStatusData.getStatusStringFromInt(
                                              controller.jobDetailsModel.value
                                                  ?.status) ==
                                          AppConstants.kJobStatusAssigned)
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kJobFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveAddAccess)
                                                    .length >
                                                0
                                            ? CustomElevatedButton(
                                                text: "Create New Permit",
                                                icon: Icons.add,
                                                onPressed: () => controller
                                                    .createNewPermit(),
                                                backgroundColor: ColorValues
                                                    .appLightBlueColor,
                                              )
                                            : Container(), //check if status is "LINKED TO PERMIT"
                                      if (JobStatusData.getStatusStringFromInt(
                                              controller.jobDetailsModel.value
                                                  ?.status) ==
                                          AppConstants.kJobStatusLinkedToPermit)
                                        CustomElevatedButton(
                                          text: "Job Card",
                                          icon: Icons.add,
                                          onPressed: () =>
                                              controller.goToJobCardScreen(),
                                          backgroundColor:
                                              ColorValues.appPurpleColor,
                                        ),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Dimens.boxHeight20,
        ],
      ),
    );
  }
}
