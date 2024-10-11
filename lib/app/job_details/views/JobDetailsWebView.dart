import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
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
      () => SelectionArea(
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
                      Get.offNamed(Routes.breakdown);
                    },
                    child: Text(" / BREAKDOWN MAINTAINANCE".toUpperCase(),
                        style: Styles.greyMediumLight12),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(Routes.jobList);
                    },
                    child: Text(" / JOB LIST".toUpperCase(),
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / JOB DETAILS VIEW", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: RepaintBoundary(
                // key: controller.printKey,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.only(
                      //     left: 20, top: 30, right: 20, bottom: 30),
                      //   height: Get.height / 1.2,
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, top: 10, bottom: 30),
                              // child: Row(
                              //   children: [
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: controller.jobDetailsModel.value?.status ==
                                              101
                                          ? ColorValues.createdColor
                                          : controller.jobDetailsModel.value?.status ==
                                                  102
                                              ? ColorValues.appLightBlueColor
                                              : controller.jobDetailsModel.value
                                                          ?.latestJCStatus ==
                                                      156
                                                  ? ColorValues.closeColor
                                                  : controller
                                                                  .jobDetailsModel
                                                                  .value
                                                                  ?.latestJCStatus ==
                                                              151 &&
                                                          controller
                                                                  .jobDetailsModel
                                                                  .value
                                                                  ?.latestJCPTWStatus ==
                                                              124
                                                      ? ColorValues.rejectColor
                                                      : controller
                                                                  .jobDetailsModel
                                                                  .value
                                                                  ?.latestJCStatus ==
                                                              151
                                                          ? ColorValues
                                                              .appYellowColor
                                                          : controller
                                                                      .jobDetailsModel
                                                                      .value
                                                                      ?.latestJCStatus ==
                                                                  152
                                                              ? ColorValues
                                                                  .linktopermitColor
                                                              : controller.jobDetailsModel.value?.latestJCStatus == 157 ||
                                                                      controller.jobDetailsModel.value?.latestJCStatus == 154
                                                                  ? ColorValues.waitingForApproveStatusColor
                                                                  : controller.jobDetailsModel.value?.latestJCStatus == 158
                                                                      ? ColorValues.approveColor
                                                                      : controller.jobDetailsModel.value?.latestJCStatus == 153
                                                                          ? Color.fromARGB(255, 181, 129, 179)
                                                                          : controller.jobDetailsModel.value?.latestJCStatus == 155
                                                                              ? ColorValues.approveColor
                                                                              : ColorValues.lightBlueColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: controller.jobDetailsModel.value
                                                ?.status ==
                                            101
                                        ? Text(" Job Created",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ))
                                        : controller.jobDetailsModel.value
                                                    ?.status ==
                                                102
                                            ? Text("Job Assigned",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ))
                                            : Text(
                                                '${controller.jobDetailsModel.value?.latestJCStatusShort ?? ''}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                )),
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
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 10.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Job Id:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Text(
                                                        "${controller.jobDetailsModel.value?.id ?? ""}",
                                                        style: Styles.blue14),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Job Title:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Container(
                                                      width: Get.width * 0.3,
                                                      child: Text(
                                                          "${controller.jobDetailsModel.value?.jobTitle ?? ""}",
                                                          style: Styles.blue14,
                                                          maxLines: 2),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Plant Name:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Text(
                                                        "${controller.jobDetailsModel.value?.facilityName ?? ""}",
                                                        style: Styles.blue14),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Equipment Categories:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Container(
                                                      width: Get.width * 0.2,
                                                      child: Text(
                                                          "${controller.jobDetailsModel.value?.equipmentCatList != null ? controller.jobDetailsModel.value?.equipmentCatList?.map<String>((item) => item.name.toString()).toList() : []}",
                                                          style: Styles.blue14,
                                                          maxLines: 2),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Fault:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Container(
                                                      width: Get.width * 0.3,
                                                      child: Text(
                                                        "${"${controller.jobDetailsModel.value?.workTypeList != null ? controller.jobDetailsModel.value?.workTypeList?.map<String>((item) => item.name.toString()).toList() : []}"}",
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Job Description:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Text(
                                                        "${controller.jobDetailsModel.value?.jobDescription ?? ""}",
                                                        style: Styles.blue14),
                                                  ],
                                                ),
                                                // Text(
                                                //   "Tools Required ",
                                                //   style: Styles.black14,
                                                // ),
                                              ],
                                            ),
                                            // Dimens.boxWidth10,
                                            // Column(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            // Text(
                                            //     "${controller.jobDetailsModel.value?.id ?? ""}",
                                            //     style: Styles.blue14),
                                            // Text(
                                            //     "${controller.jobDetailsModel.value?.jobTitle ?? ""}",
                                            //     style: Styles.blue14),

                                            // Text(
                                            //     "${controller.jobDetailsModel.value?.facilityName ?? ""}",
                                            //     style: Styles.blue14),

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

                                            // Text(
                                            //     "${controller.jobDetailsModel.value?.equipmentCatList != null ? controller.jobDetailsModel.value?.equipmentCatList?.map<String>((item) => item.equipmentCatName.toString()).toList() : []}",
                                            //     style: Styles.blue14),

                                            // Text(
                                            //     "${"${controller.jobDetailsModel.value?.workTypeList != null ? controller.jobDetailsModel.value?.workTypeList?.map<String>((item) => item.workTypeName.toString()).toList() : []}"}"),
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
                                            // ],
                                            // ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Block Name:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Text(
                                                        "${controller.jobDetailsModel.value?.blockName ?? ""}",
                                                        style: Styles.blue14),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Equipment Name:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Container(
                                                      width: Get.width * 0.3,
                                                      child: Text(
                                                        "${"${controller.jobDetailsModel.value?.workingAreaList != null ? controller.jobDetailsModel.value?.workingAreaList?.map<String>((item) => item.name.toString()).toList() : []}"}",
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Raised By:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Text(
                                                        "${controller.jobDetailsModel.value?.createdByName ?? ""}",
                                                        style: Styles.blue14),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Assigned To:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Text(
                                                        "${controller.jobDetailsModel.value?.assignedName ?? ""}",
                                                        style: Styles.blue14),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "BreakDown Time:",
                                                      style: Styles.black14,
                                                    ),
                                                    // Dimens.boxWidth2,
                                                    SizedBox(width: 2),
                                                    Text(
                                                        " ${controller.jobDetailsModel.value?.breakdownTime ?? ""}",
                                                        style: Styles.blue14),
                                                  ],
                                                ),

                                                // // Text(
                                                // //   "Status",
                                                // //   style: Styles.black14,
                                                // // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Dimens.boxHeight10,
                                  SizedBox(height: 10),
                                  controller.jobAssociatedModelsList!.length > 0
                                      ? Container(
                                          margin: Dimens.edgeInsets20,
                                          height: ((controller
                                                          .jobAssociatedModelsList
                                                          ?.length ??
                                                      0) *
                                                  40) +
                                              150,
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
                                              Expanded(
                                                child: DataTable2(
                                                  border: TableBorder.all(
                                                      color: Color.fromARGB(
                                                          255, 206, 229, 234)),
                                                  columns: [
                                                    DataColumn2(
                                                        fixedWidth: 100,
                                                        label: Text(
                                                          "Job Card Id",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    DataColumn2(
                                                        fixedWidth: 150,
                                                        label: Text(
                                                          "Permit ID",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    DataColumn2(
                                                        fixedWidth: 150,
                                                        label: Text(
                                                          "Permit Status",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    DataColumn2(
                                                        // fixedWidth: 300,
                                                        label: Text(
                                                      "Job Card Date",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn2(
                                                        // fixedWidth: 300,
                                                        label: Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn2(
                                                        fixedWidth: 300,
                                                        label: Text(
                                                          'Action',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ],
                                                  rows: List<DataRow>.generate(
                                                    controller
                                                            .jobAssociatedModelsList
                                                            ?.length ??
                                                        0,
                                                    (index) => DataRow(cells: [
                                                      DataCell(Text('JC' +
                                                          (controller
                                                                  .jobAssociatedModelsList?[
                                                                      index]
                                                                  ?.jobCardId
                                                                  .toString() ??
                                                              ''))),
                                                      DataCell(Text('PTW' +
                                                          (controller
                                                                  .jobAssociatedModelsList?[
                                                                      index]
                                                                  ?.permitId
                                                                  .toString() ??
                                                              ''))),
                                                      DataCell(Text((controller
                                                                  .jobAssociatedModelsList?[
                                                                      index]
                                                                  ?.isExpired ==
                                                              1
                                                          ? '${controller.jobAssociatedModelsList?[index]?.permit_status_short.toString()}(Expired)'
                                                          : controller
                                                                  .jobAssociatedModelsList?[
                                                                      index]
                                                                  ?.permit_status_short
                                                                  .toString() ??
                                                              ''))),
                                                      DataCell(Text(controller
                                                              .jobAssociatedModelsList?[
                                                                  index]
                                                              ?.jobCardDate ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .jobAssociatedModelsList?[
                                                                  index]
                                                              ?.status_short ??
                                                          '')),
                                                      DataCell(Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          controller.listMrsByJobId!
                                                                      .length >
                                                                  0
                                                              ? Dimens.box0
                                                              : TableActionButton(
                                                                  color: ColorValues
                                                                      .addNewColor,
                                                                  message:
                                                                      "Add MRS",
                                                                  icon: Icons
                                                                      .assignment,
                                                                  onPress:
                                                                      () async {
                                                                    controller
                                                                        .clearTypeStoreData();
                                                                    controller
                                                                        .clearStoreTaskData();
                                                                    controller
                                                                        .clearStoreTaskActivityData();
                                                                    controller
                                                                        .clearStoreTasktoActorData();
                                                                    controller
                                                                        .clearStoreTaskWhereUsedData();
                                                                    controller
                                                                        .clearStoreTaskfromActorData();
                                                                    String whereUsedId = controller
                                                                            .jobAssociatedModelsList?[index]
                                                                            ?.jobCardId
                                                                            ?.toString() ??
                                                                        "";
                                                                    String activity = controller
                                                                            .jobDetailsModel
                                                                            .value
                                                                            ?.jobTitle ??
                                                                        "";
                                                                    String jobId = controller
                                                                            .jobAssociatedModelsList?[index]
                                                                            ?.jobId
                                                                            ?.toString() ??
                                                                        "";
                                                                    int whereUsed =
                                                                        4;
                                                                    int type =
                                                                        1;
                                                                    int fromActorTypeId =
                                                                        2;
                                                                    int toActorTypeId =
                                                                        4;
                                                                    String
                                                                        encodedActivity =
                                                                        Uri.encodeComponent(
                                                                            activity);
                                                                    String
                                                                        encodedWhereUsedId =
                                                                        Uri.encodeComponent(
                                                                            whereUsedId);
                                                                    String
                                                                        encodedWhereUsed =
                                                                        Uri.encodeComponent(
                                                                            whereUsed.toString());
                                                                    String
                                                                        encodedJobId =
                                                                        Uri.encodeComponent(
                                                                            jobId.toString());
                                                                    String
                                                                        encodedType =
                                                                        Uri.encodeComponent(
                                                                            type.toString());
                                                                    String
                                                                        encodedFromActorTypeId =
                                                                        Uri.encodeComponent(
                                                                            fromActorTypeId.toString());
                                                                    String
                                                                        encodedToActorTypeId =
                                                                        Uri.encodeComponent(
                                                                            toActorTypeId.toString());

                                                                    Get.offAllNamed(
                                                                      '${Routes.createMrs}/$encodedWhereUsedId/$encodedWhereUsed/$encodedActivity/$encodedJobId/$encodedType/$encodedFromActorTypeId/$encodedToActorTypeId',
                                                                    );
                                                                  },
                                                                ),
                                                          TableActionButton(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              icon: Icons
                                                                  .remove_red_eye,
                                                              message:
                                                                  "View Job Card",
                                                              onPress: () {
                                                                controller
                                                                    .clearStoreData();
                                                                controller
                                                                    .clearValueJobId();
                                                                String jobCardId = controller
                                                                        .jobAssociatedModelsList?[
                                                                            index]
                                                                        ?.jobCardId
                                                                        .toString() ??
                                                                    "";
                                                                print({
                                                                  "JcId":
                                                                      jobCardId
                                                                });

                                                                Get.offAllNamed(
                                                                    '${Routes.jobCard}/$jobCardId');
                                                              }),
                                                          varUserAccessModel
                                                                      .value
                                                                      .access_list!
                                                                      .where((e) =>
                                                                          e.feature_id == UserAccessConstants.kJobFeatureId &&
                                                                          e.view ==
                                                                              UserAccessConstants
                                                                                  .kHaveViewAccess)
                                                                      .length >
                                                                  0
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appLightBlueColor,
                                                                  icon: Icons
                                                                      .remove_red_eye,
                                                                  message:
                                                                      "View Permit",
                                                                  onPress: () {
                                                                    controller
                                                                        .clearPermitStoreData();
                                                                    controller
                                                                        .clearTypeStoreData();

                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            controller.jobAssociatedModelsList?[index]?.permitId ??
                                                                                0,
                                                                        jobId: controller.jobDetailsModel.value!.id ??
                                                                            0);
                                                                  })
                                                              : Container(),
                                                          controller
                                                                          .jobAssociatedModelsList?[
                                                                              index]
                                                                          ?.permitStatus ==
                                                                      124 ||
                                                                  controller
                                                                          .jobAssociatedModelsList?[
                                                                              index]
                                                                          ?.permitStatus ==
                                                                      132
                                                              ? TableActionButton(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          116,
                                                                          78,
                                                                          130),
                                                                  icon: Icons
                                                                      .ads_click,
                                                                  message:
                                                                      'Re-Submit Permit',
                                                                  onPress: () {
                                                                    controller.editNewPermit(
                                                                        permitId: controller
                                                                            .jobAssociatedModelsList?[
                                                                                index]
                                                                            ?.permitId,
                                                                        isChecked:
                                                                            false
                                                                        // controller
                                                                        //     .isChecked
                                                                        //     .value
                                                                        );
                                                                  },
                                                                )
                                                              : Dimens.box0
                                                          // TableActionButton(
                                                          //     color: ColorValues
                                                          //         .appYellowColor,
                                                          //     icon: Icons.copy,
                                                          //     message:
                                                          //         "Clone Permit"
                                                          //     // onPress:
                                                          //     //     () =>
                                                          //     //         controller.goToJobCardScreen(),
                                                          //     ),
                                                        ],
                                                      )),
                                                    ]),
                                                  ),
                                                ),
                                              ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Associated JobCard(s) ",
                                                  style: Styles.blue700,
                                                ),
                                              ),
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColour,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("No Data Found"),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),

                                  ///
                                  controller.listMrsByJobId!.length > 0
                                      ? Container(
                                          margin: Dimens.edgeInsets20,
                                          height: controller
                                                      .listMrsByJobId!.length >
                                                  0
                                              ? ((controller.listMrsByJobId
                                                              ?.length ??
                                                          0) *
                                                      40) +
                                                  150
                                              : 55,
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
                                              Container(
                                                alignment: Alignment.topLeft,
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  "Material Issue / Used",
                                                  style: Styles.blue700,
                                                ),
                                              ),
                                              Expanded(
                                                child: DataTable2(
                                                  border: TableBorder.all(
                                                      color: Color.fromARGB(
                                                          255, 206, 229, 234)),
                                                  columns: [
                                                    DataColumn2(
                                                        fixedWidth: 100,
                                                        label: Text(
                                                          "Job Card Id",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    DataColumn2(
                                                        fixedWidth: 130,
                                                        label: Text(
                                                          "MRS ID",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    DataColumn2(
                                                        // fixedWidth: 200,
                                                        label: Text(
                                                      "Mrs Items List ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn2(
                                                        fixedWidth: 250,
                                                        label: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    DataColumn2(
                                                        fixedWidth: 200,
                                                        label: Text(
                                                          'Action',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ],
                                                  rows: List<DataRow>.generate(
                                                    controller.listMrsByJobId
                                                            ?.length ??
                                                        0,
                                                    (index) => DataRow(cells: [
                                                      DataCell(Text(controller
                                                              .listMrsByJobId?[
                                                                  index]
                                                              ?.jobCardId
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                                  .listMrsByJobId?[
                                                                      index]
                                                                  ?.is_mrs_return ==
                                                              0
                                                          ? "MRS${controller.listMrsByJobId?[index]?.mrsId.toString() ?? ''}"
                                                          : "RMRS${controller.listMrsByJobId?[index]?.mrs_return_ID.toString() ?? ''}")),
                                                      DataCell(Text(controller
                                                              .listMrsByJobId?[
                                                                  index]
                                                              ?.mrsItems ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listMrsByJobId?[
                                                                  index]
                                                              ?.status_short ??
                                                          '')),
                                                      DataCell(Row(
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
                                                                  "View MRS",
                                                              onPress: () {
                                                                controller
                                                                    .clearMrsIdStoreData();
                                                                String mrsId = controller
                                                                        .listMrsByJobId?[
                                                                            index]
                                                                        ?.mrsId
                                                                        .toString() ??
                                                                    "";
                                                                String rmrsId = controller
                                                                        .listMrsByJobId?[
                                                                            index]
                                                                        ?.mrs_return_ID
                                                                        .toString() ??
                                                                    "";
                                                                String type = 1
                                                                    .toString();

                                                                print({
                                                                  "mrsId": mrsId
                                                                });
                                                                rmrsId == "0"
                                                                    ? Get.offNamed(
                                                                        '${Routes.mrsApprovalScreen}/$mrsId/$type')
                                                                    : Get.offNamed(
                                                                        '${Routes.approverReturnMrs}/$rmrsId/$type');
                                                                ;
                                                                // String mrsId = controller
                                                                //         .listMrsByJobId?[
                                                                //             index]
                                                                //         ?.mrsId
                                                                //         .toString() ??
                                                                //     "";
                                                                // print({
                                                                //   "mrsId": mrsId
                                                                // });
                                                                // Get.toNamed(
                                                                //     Routes
                                                                //         .mrsViewScreen,
                                                                //     arguments: {
                                                                //       'mrsId': int
                                                                //           .tryParse(
                                                                //               "$mrsId"),
                                                                //       'type': 1
                                                                //     });
                                                              }),
                                                          controller
                                                                          .listMrsByJobId?[
                                                                              index]
                                                                          ?.status ==
                                                                      323 ||
                                                                  controller
                                                                          .listMrsByJobId?[
                                                                              index]
                                                                          ?.status ==
                                                                      321 ||
                                                                  controller
                                                                          .listMrsByJobId?[
                                                                              index]
                                                                          ?.status ==
                                                                      324
                                                              ? Dimens.box0
                                                              : TableActionButton(
                                                                  color: ColorValues
                                                                      .editColor,
                                                                  icon: Icons
                                                                      .edit,
                                                                  message:
                                                                      "Edit MRS",
                                                                  onPress: () {
                                                                    controller
                                                                        .clearMrsIdStoreData();
                                                                    String mrsId = controller
                                                                            .listMrsByJobId?[index]
                                                                            ?.mrsId
                                                                            .toString() ??
                                                                        "";
                                                                    String rmrsId = controller
                                                                            .listMrsByJobId?[index]
                                                                            ?.mrs_return_ID
                                                                            .toString() ??
                                                                        "";

                                                                    print({
                                                                      "mrsId":
                                                                          mrsId
                                                                    });
                                                                    rmrsId ==
                                                                            "0"
                                                                        ? Get.toNamed(
                                                                            Routes.editMrs,
                                                                            arguments: {
                                                                                'mrsId': int.tryParse("$mrsId"),
                                                                                'type': 1
                                                                              })
                                                                        : Get.toNamed(
                                                                            Routes.editReturnMrs,
                                                                            arguments: {
                                                                                'mrsId': int.tryParse(rmrsId)
                                                                              });
                                                                    ;
                                                                  })
                                                        ],
                                                      )),
                                                    ]),
                                                  ),
                                                ),
                                              ),

                                              // Expanded(
                                              //   child: ScrollableTableView(
                                              //     columns: [
                                              //       "Job Card ID",
                                              //       "Mrs ID",
                                              //       "Mrs Items List ",
                                              //       "Status",
                                              //       "Action",
                                              //     ].map((column) {
                                              //       return TableViewColumn(
                                              //         label: column,
                                              //         minWidth: Get.width * 0.15,
                                              //       );
                                              //     }).toList(),
                                              //     rows: [
                                              //       ...List.generate(
                                              //         controller.listMrsByJobId
                                              //                 ?.length ??
                                              //             0,
                                              //         (index) {
                                              //           var getJobsLinkedMrsList =
                                              //               controller
                                              //                       .listMrsByJobId?[
                                              //                   index];
                                              //           return [
                                              //             '${getJobsLinkedMrsList?.jobCardId}',
                                              //             '${getJobsLinkedMrsList?.mrsId}',
                                              //             '${getJobsLinkedMrsList?.mrsItems ?? ''}',
                                              //             '${getJobsLinkedMrsList?.status_short ?? ''}',
                                              //             'Action',
                                              //           ];
                                              //         },
                                              //       ),
                                              //     ].map((record) {
                                              //       return TableViewRow(
                                              //         height: 40,
                                              //         cells: record.map((value) {
                                              //           return TableViewCell(
                                              //               child:
                                              //                   value == 'Action'
                                              //                       ? Row(
                                              //                           children: [
                                              //                             TableActionButton(
                                              //                                 color: ColorValues
                                              //                                     .viewColor,
                                              //                                 icon: Icons
                                              //                                     .remove_red_eye,
                                              //                                 message:
                                              //                                     "View MRS",
                                              //                                 onPress:
                                              //                                     () {
                                              //                                   final _flutterSecureStorage = const FlutterSecureStorage();

                                              //                                   _flutterSecureStorage.delete(key: "mrsId");
                                              //                                   String mrsId = record[1];
                                              //                                   if (mrsId != null) {
                                              //                                     print({
                                              //                                       "mrsId": mrsId
                                              //                                     });
                                              //                                     Get.toNamed(Routes.mrsViewScreen, arguments: {
                                              //                                       'mrsId': int.tryParse("$mrsId")
                                              //                                     });
                                              //                                   }
                                              //                                 }),
                                              //                             TableActionButton(
                                              //                                 color: ColorValues
                                              //                                     .editColor,
                                              //                                 icon: Icons
                                              //                                     .edit,
                                              //                                 message:
                                              //                                     "Edit MRS",
                                              //                                 onPress:
                                              //                                     () {
                                              //                                   final _flutterSecureStorage = const FlutterSecureStorage();

                                              //                                   _flutterSecureStorage.delete(key: "mrsId");
                                              //                                   String mrsId = record[1];
                                              //                                   if (mrsId != null) {
                                              //                                     print({
                                              //                                       "mrsId": mrsId
                                              //                                     });
                                              //                                     Get.toNamed(Routes.editMrs, arguments: {
                                              //                                       'mrsId': int.tryParse("$mrsId")
                                              //                                     });
                                              //                                   }
                                              //                                 })
                                              //                           ],
                                              //                         )
                                              //                       : Text(
                                              //                           value));
                                              //         }).toList(),
                                              //       );
                                              //     }).toList(),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        )
                                      : Dimens.box0,
                                  // Container(
                                  //     margin: Dimens.edgeInsets20,
                                  //     height: Get.height / 7,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: ColorValues
                                  //             .lightGreyColorWithOpacity35,
                                  //         width: 1,
                                  //       ),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //           color: ColorValues
                                  //               .appBlueBackgroundColor,
                                  //           spreadRadius: 2,
                                  //           blurRadius: 5,
                                  //           offset: Offset(0, 2),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     child: Column(
                                  //       children: [
                                  //         Padding(
                                  //           padding:
                                  //               const EdgeInsets.all(10.0),
                                  //           child: Row(
                                  //             children: [
                                  //               Text(
                                  //                 "Material Issue / Used",
                                  //                 style: Styles.blue700,
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //         Row(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.center,
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.center,
                                  //           children: [
                                  //             Text(
                                  //                 "Not added the any permit and matarial , please add first"),
                                  //             TableActionButton(
                                  //               color: ColorValues
                                  //                   .appPurpleColor,
                                  //               icon: Icons.add,
                                  //               message: "Add Material",
                                  //               onPress: () => controller
                                  //                   .goToAddMrsScreen(),
                                  //             ),
                                  //           ],
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),

                                  // Dimens.boxHeight30,
                                  SizedBox(height: 30),
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
                                                ?.status ==
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
                                          controller.jobDetailsModel.value
                                                      ?.latestJCStatus ==
                                                  158
                                              ? Dimens.box0
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
                                              : CustomElevatedButton(
                                                  onPressed: () => controller
                                                      .goToEditJobScreen(
                                                          controller
                                                              .jobDetailsModel
                                                              .value
                                                              ?.id),
                                                  text: 'Re-Assign',
                                                  icon: Icons.edit,
                                                ),
                                        ],

                                        // Dimens.boxWidth10,
                                        SizedBox(width: 10),
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
                                        if (
                                            // controller.jobDetailsModel.value
                                            //           ?.status ==
                                            //       103 ||
                                            controller.jobDetailsModel.value
                                                        ?.latestJCStatus ==
                                                    155 ||
                                                controller.jobDetailsModel.value
                                                        ?.status ==
                                                    102)
                                          CustomElevatedButton(
                                            text: "Create New Permit",
                                            icon: Icons.add,
                                            onPressed: () =>
                                                controller.createNewPermit(),
                                            backgroundColor:
                                                ColorValues.appGreenColor,
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

                                        // Center(
                                        //   child: Container(
                                        //     height: 30,
                                        //     child: CustomElevatedButton(
                                        //       icon: Icons.print,
                                        //       backgroundColor:
                                        //           ColorValues.linktopermitColor,
                                        //       text: "print",
                                        //       onPressed: () {
                                        //         controller.generateInvoice();
                                        //       },
                                        //     ),
                                        //   ),
                                        // ),
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Dimens.boxHeight20,
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
