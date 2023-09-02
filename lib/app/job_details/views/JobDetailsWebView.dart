import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
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
                              "JOB DETAIL ",
                              style: Styles.blue700,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                color: ColorValues
                                    .addNewColor, //JobStatusData.getStatusColor(_statusString),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: controller.jobDetailsModel.value?.status ==
                                      101
                                  ? Text(" Job Created")
                                  : controller.jobDetailsModel.value?.status ==
                                          102
                                      ? Text("Job Assigned")
                                      :
                                      //         : jobDetails?.status == 103
                                      //             ? Text('${jobDetails?.latestJCStatusShort ?? ''}')
                                      //    :
                                      Text(
                                          '${controller.jobDetailsModel.value?.status ?? ''}'),
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
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Job Id",
                                                style: Styles.black14,
                                              ),
                                              Text(
                                                "Job Title",
                                                style: Styles.black14,
                                              ),

                                              Text(
                                                "Plant Name: ",
                                                style: Styles.black14,
                                              ),
                                              Text(
                                                "Equipment Categories ",
                                                style: Styles.black14,
                                              ),
                                              Text(
                                                "Work Type ",
                                                style: Styles.black14,
                                              ),
                                              // Text(
                                              //   "Tools Required ",
                                              //   style: Styles.black14,
                                              // ),
                                            ],
                                          ),
                                          Dimens.boxWidth10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${controller.jobDetailsModel.value?.id ?? ""}",
                                                  style: Styles.blue14),
                                              Text(
                                                  "${controller.jobDetailsModel.value?.jobTitle ?? ""}",
                                                  style: Styles.blue14),

                                              Text(
                                                  "${controller.jobDetailsModel.value?.facilityName ?? ""}",
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
                                                  "${"${controller.jobDetailsModel.value?.workTypeList != null ? controller.jobDetailsModel.value?.workTypeList?.map<String>((item) => item.workTypeName.toString()).toList() : []}"}"),
                                              // Text(
                                              //     " ${controller.jobDetailsModel.value?.lstToolsRequired ?? ""}",
                                              //     style: Styles.blue14),

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
                                                "Block Name: ",
                                                style: Styles.black14,
                                              ),
                                              Text(
                                                "Equipment Name ",
                                                style: Styles.black14,
                                              ),
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
                                                  " ${controller.jobDetailsModel.value?.blockName ?? ""}",
                                                  style: Styles.blue14),
                                              Text(
                                                  "${"${controller.jobDetailsModel.value?.workingAreaList != null ? controller.jobDetailsModel.value?.workingAreaList?.map<String>((item) => item.workingAreaName.toString()).toList() : []}"}"),
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, right: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Job Description: ",
                                              style: Styles.black14,
                                            ),
                                            Dimens.boxWidth10,
                                            Expanded(
                                              child: Text(
                                                  "${controller.jobDetailsModel.value?.jobDescription ?? ""}",
                                                  style: Styles.blue14),
                                            ),
                                          ],
                                        ),
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
                                controller.jobAssociatedModelsList!.length > 0
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height: Get.height / 3,
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
                                                  const EdgeInsets.all(10.0),
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
                                              color:
                                                  ColorValues.greyLightColour,
                                            ),
                                            Expanded(
                                              child: ScrollableTableView(
                                                columns: [
                                                  "Job Card Id",
                                                  "Permit ID",

                                                  // "BreakDown Time",
                                                  "Job Card Date",
                                                  "Status",
                                                  'Action',
                                                ].map((column) {
                                                  return TableViewColumn(
                                                    label: column,
                                                    minWidth: Get.width * 0.18,
                                                  );
                                                }).toList(),
                                                rows: [
                                                  ...List.generate(
                                                    controller
                                                            .jobAssociatedModelsList
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      var getjobAssociatedModelsList =
                                                          controller
                                                                  .jobAssociatedModelsList?[
                                                              index];
                                                      return [
                                                        '${getjobAssociatedModelsList?.jobCardId}',
                                                        '${getjobAssociatedModelsList?.permitId}',
                                                        '${getjobAssociatedModelsList?.jobCardDate ?? ''}',
                                                        '${getjobAssociatedModelsList?.status_short}',
                                                        'Action',
                                                      ];
                                                    },
                                                  ),
                                                ].map((record) {
                                                  return TableViewRow(
                                                    height: 40,
                                                    cells: record.map((value) {
                                                      return TableViewCell(
                                                          child:
                                                              value == 'Action'
                                                                  ? Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        TableActionButton(
                                                                            color: ColorValues
                                                                                .viewColor,
                                                                            icon: Icons
                                                                                .remove_red_eye,
                                                                            message:
                                                                                "View Job Card",
                                                                            onPress:
                                                                                () {
                                                                              final _flutterSecureStorage = const FlutterSecureStorage();

                                                                              _flutterSecureStorage.delete(key: "JcId");
                                                                              String jobCardId = record[0];
                                                                              if (jobCardId != null) {
                                                                                print({
                                                                                  "JcId": jobCardId
                                                                                });

                                                                                Get.toNamed(Routes.jobCard, arguments: {
                                                                                  'JcId': int.tryParse("$jobCardId")
                                                                                });
                                                                              }
                                                                            }),
                                                                        TableActionButton(
                                                                            color: ColorValues
                                                                                .appLightBlueColor,
                                                                            icon: Icons
                                                                                .remove_red_eye,
                                                                            message:
                                                                                "View Permit",
                                                                            onPress: () =>
                                                                                controller.viewNewPermitList(permitId: int.tryParse(record[1]))),
                                                                        TableActionButton(
                                                                            color:
                                                                                ColorValues.appYellowColor,
                                                                            icon: Icons.copy,
                                                                            message: "Clone Permit"
                                                                            // onPress:
                                                                            //     () =>
                                                                            //         controller.goToJobCardScreen(),
                                                                            ),
                                                                      ],
                                                                    )
                                                                  : Text(
                                                                      value));
                                                    }).toList(),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        margin: Dimens.edgeInsets20,
                                        height: Get.height / 9,
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
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Associated JobCard(s) ",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                ////
                                controller.listMrsByJobId!.length > 0
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height: Get.height / 3,
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
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Material Issue / Used",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color:
                                                  ColorValues.greyLightColour,
                                            ),
                                            Expanded(
                                              child: ScrollableTableView(
                                                columns: [
                                                  "Job Card ID",
                                                  "Mrs ID",
                                                  "Mrs Items List ",
                                                  "Action",
                                                ].map((column) {
                                                  return TableViewColumn(
                                                    label: column,
                                                    minWidth: Get.width * 0.23,
                                                  );
                                                }).toList(),
                                                rows: [
                                                  ...List.generate(
                                                    controller.listMrsByJobId
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      var getJobsLinkedMrsList =
                                                          controller
                                                                  .listMrsByJobId?[
                                                              index];
                                                      return [
                                                        '${getJobsLinkedMrsList?.jobCardId}',
                                                        '${getJobsLinkedMrsList?.mrsId}',
                                                        '${getJobsLinkedMrsList?.mrsItems ?? ''}',
                                                        'Action',
                                                      ];
                                                    },
                                                  ),
                                                ].map((record) {
                                                  return TableViewRow(
                                                    height: 40,
                                                    cells: record.map((value) {
                                                      return TableViewCell(
                                                          child: value ==
                                                                  'Action'
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .viewColor,
                                                                  icon: Icons
                                                                      .remove_red_eye,
                                                                  message:
                                                                      "View MRS",
                                                                  onPress: () {
                                                                    String
                                                                        mrsId =
                                                                        record[
                                                                            1];
                                                                    if (mrsId !=
                                                                        null) {
                                                                      print({
                                                                        "mrsId":
                                                                            mrsId
                                                                      });
                                                                      Get.toNamed(
                                                                          Routes
                                                                              .mrsViewScreen,
                                                                          arguments: {
                                                                            'mrsId':
                                                                                int.tryParse("$mrsId")
                                                                          });
                                                                    }
                                                                  })
                                                              : Text(value));
                                                    }).toList(),
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        margin: Dimens.edgeInsets20,
                                        height: Get.height / 7,
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
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Material Issue / Used",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "Not added the any permit and matarial , please add first"),
                                                TableActionButton(
                                                  color: ColorValues
                                                      .appPurpleColor,
                                                  icon: Icons.add,
                                                  message: "Add Material",
                                                  onPress: () => controller
                                                      .goToAddMrsScreen(),
                                                ),
                                              ],
                                            )
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
                                      if (controller
                                              .jobDetailsModel.value?.status ==
                                          101)
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
                                        // if (controller.jobDetailsModel.value
                                        //             ?.status !=
                                        //         null &&
                                        //     JobStatusData
                                        //             .getStatusStringFromInt(
                                        //                 controller
                                        //                     .jobDetailsModel
                                        //                     .value
                                        //                     ?.status) ==
                                        //         AppConstants.kJobStatusAssigned)
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
                                      // if (controller.jobDetailsModel.value
                                      //             ?.status !=
                                      //         null &&
                                      //     JobStatusData.getStatusStringFromInt(
                                      //             controller.jobDetailsModel
                                      //                 .value?.status) ==
                                      //         AppConstants.kJobStatusAssigned)
                                      // CustomElevatedButton(
                                      //   text: "Link to Existing Permit",
                                      //   icon: Icons.link,
                                      //   onPressed: () =>
                                      //       controller.showPermitsDialog(),
                                      //   backgroundColor:
                                      //       ColorValues.appYellowColor,
                                      // ),
                                      // Dimens.boxWidth10,
                                      //check if status is "ASSIGNED"
                                      // JobStatusData.getStatusStringFromInt(
                                      //                 controller.jobDetailsModel
                                      //                     .value?.status) ==
                                      //             AppConstants
                                      //                 .kJobStatusAssigned ||
                                      //         controller.jobDetailsModel.value
                                      //                 ?.latestJCStatus ==
                                      //             153
                                      //   ?
                                      if (controller.jobDetailsModel.value
                                                  ?.status ==
                                              103 ||
                                          controller.jobDetailsModel.value
                                                  ?.latestJCStatus ==
                                              153 ||
                                          controller.jobDetailsModel.value
                                                  ?.status ==
                                              102)
                                        CustomElevatedButton(
                                          text: "Create New Permit",
                                          icon: Icons.add,
                                          onPressed: () =>
                                              controller.createNewPermit(),
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                        ),
                                      //:
                                      // if (controller
                                      //     .jobAssociatedModelsList!.isEmpty)
                                      //   CustomElevatedButton(
                                      //     text: "Job Card",
                                      //     icon: Icons.add,
                                      //     onPressed: () =>
                                      //         controller.goToJobCardScreen(),
                                      //     backgroundColor:
                                      //         ColorValues.appPurpleColor,
                                      //   ), //check if status is "LINKED TO PERMIT"
                                      //  ]),
                                      // CustomElevatedButton(
                                      //   text: "Job Card",
                                      //   icon: Icons.add,
                                      //   onPressed: () =>
                                      //       controller.goToJobCardScreen(),
                                      //   backgroundColor: ColorValues.appPurpleColor,
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
