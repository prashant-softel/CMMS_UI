import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/pm_task_view/view/tbt_dialog.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/assign_to_pm_task_dialog.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/observation_pm_task_view_popup_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';

class PreventiveMaintenanceTaskViewContentWeb
    extends GetView<PreventiveMaintenanceTaskViewController> {
  PreventiveMaintenanceTaskViewContentWeb({super.key});

  ///
  var controller = Get.find<PreventiveMaintenanceTaskViewController>();
  final HomeController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return buildDocument(context: context);
  }

  Widget buildDocument({required BuildContext context}) {
    return SelectionArea(
      child: Obx(
        () => Container(
          // height: Get.height,
          // width: Get.width,
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
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        controller.clearStoreTaskData();
                        controller.clearStoreTaskActivityData();
                        controller.clearStoreTasktoActorData();
                        controller.clearStoreTaskWhereUsedData();
                        controller.clearStoreTaskfromActorData();

                        Get.offNamed(Routes.pmTask);
                      },
                      child: Text(" / PM TASK LIST", style: Styles.greyLight14),
                    ),
                    Text(" / PM TASK VIEW", style: Styles.greyLight14)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,

                  margin: EdgeInsets.all(20),
                  // height: Get.height,
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
                          child: Row(
                            children: [
                              Text(
                                "PM Task View ",
                                style: Styles.blue700,
                              ),
                              Spacer(),
                              Container(
                                height: 30,
                                child: CustomElevatedButton(
                                  backgroundColor: controller
                                              .pmtaskViewModel.value?.status ==
                                          164
                                      ? ColorValues.linktopermitColor
                                      : controller.pmtaskViewModel.value?.status ==
                                              162
                                          ? ColorValues.appLightBlueColor
                                          : controller.pmtaskViewModel.value
                                                      ?.status ==
                                                  163
                                              ? ColorValues.appYellowColor
                                              : controller.pmtaskViewModel.value
                                                          ?.status ==
                                                      167
                                                  ? ColorValues
                                                      .approveStatusColor
                                                  : controller.pmtaskViewModel
                                                              .value?.status ==
                                                          165
                                                      ? ColorValues.closeColor
                                                      : controller
                                                                  .pmtaskViewModel
                                                                  .value
                                                                  ?.status ==
                                                              170
                                                          ? ColorValues
                                                              .approveStatusColor
                                                          : controller
                                                                          .pmtaskViewModel
                                                                          .value
                                                                          ?.status ==
                                                                      170 ||
                                                                  controller
                                                                          .pmtaskViewModel
                                                                          .value
                                                                          ?.status ==
                                                                      169 ||
                                                                  controller
                                                                          .pmtaskViewModel
                                                                          .value
                                                                          ?.status ==
                                                                      166
                                                              ? ColorValues
                                                                  .rejectedStatusColor
                                                              : ColorValues
                                                                  .addNewColor,
                                  onPressed: () async {},
                                  text:
                                      "${controller.pmtaskViewModel.value?.status_short ?? ""}",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),
                        Expanded(
                          child: Container(
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(scrollbars: false),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15.w, vertical: 8.h),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "PM Task ID:",
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "PM Plan Title:",
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "Equipment Category:",
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "Frequency:",
                                                style: Styles.black17,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth2,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "PMT${controller.pmtaskViewModel.value?.id ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.pmtaskViewModel.value?.plan_title ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.pmtaskViewModel.value?.category_name ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.pmtaskViewModel.value?.frequency_name ?? ""}",
                                                  style: Styles.blue17),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Assigned To:",
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "Last Done Date:",
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "Done Date:",
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "Due Date:",
                                                style: Styles.black17,
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth2,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${controller.pmtaskViewModel.value?.assigned_to_name ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  " ${controller.pmtaskViewModel.value?.last_done_date ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.pmtaskViewModel.value?.done_date ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.pmtaskViewModel.value?.due_date ?? ""}",
                                                  style: Styles.blue17),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Dimens.boxHeight30,

                                    ///Assets

                                    Container(
                                      margin: Dimens.edgeInsets20,
                                      height: ((controller.scheduleCheckPoint
                                                      ?.length ??
                                                  0) *
                                              45) +
                                          140,
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
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Asset(s) ",
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
                                                      "SR.No.",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    label: Text(
                                                  "Asset",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn2(
                                                    // fixedWidth: 300,
                                                    label: Text(
                                                  "Checklist",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn2(
                                                    // fixedWidth: 300,
                                                    label: Text(
                                                  "Execution Done By",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn2(
                                                    fixedWidth: 200,
                                                    label: Text(
                                                      "Failure Score",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 150,
                                                    label: Text(
                                                      'Action',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller.scheduleCheckPoint
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(
                                                      Text('${index + 1}')),
                                                  DataCell(Text(controller
                                                          .scheduleCheckPoint?[
                                                              index]
                                                          ?.name
                                                          .toString() ??
                                                      '')),
                                                  DataCell(Text(controller
                                                          .scheduleCheckPoint?[
                                                              index]
                                                          ?.checklist_name ??
                                                      '')),
                                                  DataCell(Text(controller
                                                              .scheduleCheckPoint?[
                                                                  index]
                                                              ?.completedBy_id ==
                                                          0
                                                      ? ""
                                                      : '${controller.scheduleCheckPoint?[index]?.completedBy_name ?? ''}')),
                                                  DataCell(Text(
                                                      // controller
                                                      //       .scheduleCheckPoint?[
                                                      //           index]
                                                      //       ? ??
                                                      '')),
                                                  DataCell(Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      controller.pmtaskViewModel.value
                                                                          ?.status ==
                                                                      167 && //permit approved
                                                                  varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == UserAccessConstants.kPmTaskFeatureId &&
                                                                              e.view ==
                                                                                  UserAccessConstants
                                                                                      .kHaveViewAccess)
                                                                          .length >
                                                                      0 ||
                                                              controller
                                                                      .pmtaskViewModel
                                                                      .value
                                                                      ?.status ==
                                                                  163 || //permit waiting for approval
                                                              controller
                                                                      .pmtaskViewModel
                                                                      .value
                                                                      ?.status ==
                                                                  162 || // assigned
                                                              controller
                                                                      .pmtaskViewModel
                                                                      .value
                                                                      ?.status ==
                                                                  161 // resheduled
                                                          ? Dimens.box0
                                                          : TableActionButton(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              icon: Icons
                                                                  .remove_red_eye,
                                                              message: "View",
                                                              onPress: () {
                                                                controller.selectedItem = controller
                                                                    .scheduleCheckPoint!
                                                                    .firstWhere((element) =>
                                                                        "${element?.schedule_id}" ==
                                                                        controller
                                                                            .scheduleCheckPoint?[index]
                                                                            ?.schedule_id
                                                                            .toString());
                                                                if (controller
                                                                        .selectedItem !=
                                                                    null) {
                                                                  Get.dialog(
                                                                      ObservationPMTaskViewDialog());
                                                                }
                                                              })
                                                    ],
                                                  )),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    controller.pmtaskViewModel.value
                                                ?.permit_id ==
                                            0
                                        ? Dimens.box0
                                        : Container(
                                            margin: Dimens.edgeInsets20,
                                            height: 150,
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
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Permit Details ",
                                                        style: Styles.blue700,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: DataTable2(
                                                      border: TableBorder.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              206,
                                                              229,
                                                              234)),
                                                      columns: [
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
                                                            // fixedWidth: 300,
                                                            label: Text(
                                                          "Permit Code",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        DataColumn2(
                                                            // fixedWidth: 300,
                                                            label: Text(
                                                          "Permit Type",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        DataColumn2(
                                                            // fixedWidth: 300,
                                                            label: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                      rows: [
                                                        DataRow(cells: [
                                                          DataCell(Text(
                                                            "${controller.pmtaskViewModel.value?.permit_id ?? ""}",
                                                          )),
                                                          DataCell(Text(
                                                            "${controller.pmtaskViewModel.value?.permit_code ?? ""}",
                                                          )),
                                                          DataCell(Text(
                                                            "${controller.pmtaskViewModel.value?.permit_type ?? ""}",
                                                          )),
                                                          DataCell(Text(
                                                            "${controller.pmtaskViewModel.value?.status_short_ptw ?? ""}",
                                                          )),
                                                          DataCell(Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              // TableActionButton(
                                                              //     color: ColorValues
                                                              //         .viewColor,
                                                              //     icon: Icons
                                                              //         .remove_red_eye,
                                                              //     message:
                                                              //         "View Job Card",
                                                              //     onPress: () {
                                                              //       controller
                                                              //           .clearStoreData();

                                                              //       String jobCardId = controller
                                                              //               .jobAssociatedModelsList?[
                                                              //                   index]
                                                              //               ?.jobCardId
                                                              //               .toString() ??
                                                              //           "";
                                                              //       print({
                                                              //         "JcId": jobCardId
                                                              //       });

                                                              //       Get.toNamed(
                                                              //           Routes.jobCard,
                                                              //           arguments: {
                                                              //             'JcId': int
                                                              //                 .tryParse(
                                                              //                     "$jobCardId")
                                                              //           });
                                                              //     }),

                                                              varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == UserAccessConstants.kPermitFeatureId &&
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
                                                                      onPress:
                                                                          () {
                                                                        controller
                                                                            .clearPermitStoreData();
                                                                        controller
                                                                            .clearTypeStoreData();
                                                                        controller.viewNewPermitList(
                                                                            permitId:
                                                                                controller.pmtaskViewModel.value?.permit_id,
                                                                            jobId: controller.jobDetailsModel.value!.id ?? 0);
                                                                      })
                                                                  : Container(),
                                                              controller
                                                                              .pmtaskViewModel
                                                                              .value
                                                                              ?.ptw_status ==
                                                                          124 ||
                                                                      controller
                                                                              .pmtaskViewModel
                                                                              .value
                                                                              ?.ptw_status ==
                                                                          132 ||
                                                                      controller.pmtaskViewModel.value?.ptw_status == 126 &&
                                                                          controller.pmtaskViewModel.value?.status ==
                                                                              164 ||
                                                                      controller.pmtaskViewModel.value?.ptw_status == 126 &&
                                                                          controller.pmtaskViewModel.value?.status ==
                                                                              161 ||
                                                                      controller.pmtaskViewModel.value?.ptw_status ==
                                                                              126 &&
                                                                          controller.pmtaskViewModel.value?.status ==
                                                                              162 ||
                                                                      controller.pmtaskViewModel.value?.ptw_status ==
                                                                              126 &&
                                                                          controller.pmtaskViewModel.value?.status ==
                                                                              163
                                                                  ? TableActionButton(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          116,
                                                                          78,
                                                                          130),
                                                                      icon: Icons
                                                                          .ads_click,
                                                                      message:
                                                                          'Re-Submit Permit',
                                                                      onPress:
                                                                          () {
                                                                        controller.editNewPermit(
                                                                            permitId:
                                                                                controller.pmtaskViewModel.value?.permit_id,
                                                                            isChecked: false
                                                                            // controller
                                                                            //     .isChecked
                                                                            //     .value
                                                                            );
                                                                      },
                                                                    )
                                                                  : Dimens.box0
                                                            ],
                                                          )),
                                                        ]),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                    controller.pmtaskViewModel.value?.status ==
                                                    169 &&
                                                controller
                                                    .listMrsByTaskId!.isEmpty ||
                                            controller.pmtaskViewModel.value
                                                    ?.status ==
                                                162 ||
                                            controller.pmtaskViewModel.value
                                                    ?.status ==
                                                161
                                        ? Dimens.box0
                                        : Container(
                                            margin: Dimens.edgeInsets20,
                                            height: controller.listMrsByTaskId!
                                                        .length >
                                                    0
                                                ? ((controller.listMrsByTaskId
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
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Material Issue / Used",
                                                        style: Styles.blue700,
                                                      ),
                                                      Spacer(),
                                                      controller.listMrsByTaskId!
                                                                  .isEmpty &&
                                                              controller
                                                                      .pmtaskViewModel
                                                                      .value
                                                                      ?.status !=
                                                                  170
                                                          ? Container(
                                                              height: 30,
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    ColorValues
                                                                        .addNewColor,
                                                                onPressed:
                                                                    () async {
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
                                                                  controller
                                                                      .clearTypeStoreData();
                                                                  Get.offAllNamed(
                                                                      Routes
                                                                          .createMrs,
                                                                      arguments: {
                                                                        "whereUsedId": controller
                                                                            .pmtaskViewModel
                                                                            .value
                                                                            ?.id,
                                                                        "activity": controller
                                                                            .pmtaskViewModel
                                                                            .value
                                                                            ?.plan_title,
                                                                        "whereUsed":
                                                                            27,
                                                                        "fromActorTypeId":
                                                                            2,
                                                                        "type":
                                                                            2,
                                                                        "to_actor_type_id":
                                                                            3
                                                                      });
                                                                },
                                                                text:
                                                                    "Add New MRS",
                                                              ),
                                                            )
                                                          : Dimens.box0,
                                                    ],
                                                  ),
                                                ),
                                                // Divider(
                                                //   color:
                                                //       ColorValues.greyLightColour,
                                                // ),
                                                controller.listMrsByTaskId!
                                                            .length >
                                                        0
                                                    ? Expanded(
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
                                                            DataColumn2(
                                                                fixedWidth: 100,
                                                                label: Text(
                                                                  "Sr. No.",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                            DataColumn2(
                                                                fixedWidth: 130,
                                                                label: Text(
                                                                  "MRS ID",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                            DataColumn2(
                                                                // fixedWidth: 200,
                                                                label: Text(
                                                              "MRS Items List ",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            DataColumn2(
                                                                //  fixedWidth: 300,
                                                                label: Text(
                                                              "Status",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            DataColumn2(
                                                                fixedWidth: 300,
                                                                label: Text(
                                                                  'Action',
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
                                                                    .listMrsByTaskId
                                                                    ?.length ??
                                                                0,
                                                            (index) => DataRow(
                                                                cells: [
                                                                  DataCell(Text(
                                                                      '${index + 1}')),
                                                                  DataCell(Text(controller
                                                                              .listMrsByTaskId?[index]
                                                                              ?.is_mrs_return ==
                                                                          0
                                                                      ? "MRS${controller.listMrsByTaskId?[index]?.mrsId.toString() ?? ''}"
                                                                      : "RMRS${controller.listMrsByTaskId?[index]?.mrs_return_ID.toString() ?? ''}")),
                                                                  DataCell(Text(
                                                                      controller
                                                                              .listMrsByTaskId?[index]
                                                                              ?.mrsItems ??
                                                                          '')),
                                                                  DataCell(Text(
                                                                      controller
                                                                              .listMrsByTaskId?[index]
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
                                                                              "View",
                                                                          onPress:
                                                                              () {
                                                                            controller.clearMrsStoreData();
                                                                            String?
                                                                                rmrsId =
                                                                                controller.listMrsByTaskId?[index]?.mrs_return_ID.toString();
                                                                            String
                                                                                mrsId =
                                                                                controller.listMrsByTaskId?[index]?.mrsId.toString() ?? "";
                                                                            String
                                                                                type =
                                                                                2.toString();

                                                                            controller.listMrsByTaskId?[index]?.is_mrs_return == 0
                                                                                ? Get.offNamed(
                                                                                    '${Routes.mrsApprovalScreen}/$mrsId/$type')
                                                                                :Get.offNamed(
                                                                                    '${Routes.approverReturnMrs}/$rmrsId/$type');
                                                                                
                                                                          }),
                                                                      // controller.pmtaskViewModel.value?.status != 169 &&
                                                                      controller.listMrsByTaskId?[index]?.status == 323 ||
                                                                              // controller.listMrsByTaskId?[index]?.status == 321 ||
                                                                              controller.listMrsByTaskId?[index]?.status == 324
                                                                          ? Dimens.box0
                                                                          : varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kMrsFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length > 0
                                                                              ? TableActionButton(
                                                                                  color: ColorValues.editColor,
                                                                                  icon: Icons.edit,
                                                                                  message: "Edit MRS",
                                                                                  onPress: () {
                                                                                    controller.clearMrsStoreData();

                                                                                    String mrsId = controller.listMrsByTaskId?[index]?.mrsId.toString() ?? "";
                                                                                    String rmrsId = controller.listMrsByTaskId?[index]?.mrs_return_ID.toString() ?? "";

                                                                                    print({
                                                                                      "mrsId": mrsId
                                                                                    });
                                                                                    rmrsId == "0"
                                                                                        ? Get.toNamed(Routes.editMrs, arguments: {
                                                                                            'mrsId': int.tryParse("$mrsId"),
                                                                                            'type': 2
                                                                                          })
                                                                                        : Get.toNamed(Routes.editReturnMrs, arguments: {
                                                                                            'mrsId': int.tryParse(rmrsId)
                                                                                          });
                                                                                    ;
                                                                                  })
                                                                              : Dimens.box0
                                                                    ],
                                                                  )),
                                                                ]),
                                                          ),
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                              ],
                                            ),
                                          ),
                                    // : Dimens.box0,

                                    (controller.historyList != null &&
                                            controller.historyList!.isNotEmpty)
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
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "PM History ",
                                                        style: Styles.blue700,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: HistoryTableWidgetWeb(
                                                    historyList:
                                                        controller.historyList,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        //  )
                                        : //
                                        Dimens.box0,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //  Dimens.boxHeight20,
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      child: CustomElevatedButton(
                        icon: Icons.print,
                        backgroundColor: ColorValues.linktopermitColor,
                        text: "print",
                        onPressed: () {
                          controller.generateInvoice();
                        },
                      ),
                    ),
                    // Dimens.boxWidth10,
                    Dimens.boxWidth5,
                    controller.pmtaskViewModel.value?.status == 161
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              // icon: Icons.link,
                              backgroundColor: ColorValues.blueColor,
                              text: "Re-assign",
                              onPressed: () {
                                Get.dialog<void>(AssignToPMTaskDialog(
                                    id: controller.pmtaskViewModel.value?.id ??
                                        0));
                                //controller.printScreen();
                              },
                            ),
                          )
                        : Dimens.box0,
                    // Dimens.boxWidth10,
                    // controller.pmtaskViewModel.value?.status == 161
                    //     ? Container(
                    //         height: 35,
                    //         child: CustomElevatedButton(
                    //           icon: Icons.link,
                    //           backgroundColor: ColorValues.linktopermitColor,
                    //           text: "Link to Permit",
                    //           onPressed: () {
                    //             controller.createNewPermit();

                    //             //controller.printScreen();
                    //           },
                    //         ),
                    //       )
                    //     :
                    Dimens.boxWidth5,
                    controller.pmtaskViewModel.value?.status == 163 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0 &&
                            controller.pmtaskViewModel.value?.ptw_status == 125
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.start,
                              backgroundColor: ColorValues.linktopermitColor,
                              text: "Start",
                              onPressed: () {
                                controller.pmtaskViewModel.value?.ptw_tbt_done ==
                                        1
                                    ? controller.setPmTask()
                                    : controller.pmtaskViewModel.value!
                                                    .ptw_tbt_done ==
                                                0 &&
                                            controller.pmtaskViewModel.value!
                                                    .tbt_start ==
                                                0
                                        ? Get.defaultDialog(
                                            radius: 5,
                                            title: 'Alert',
                                            middleText:
                                                'Unable to start task due to permit taken for ${controller.pmtaskViewModel.value!.start_time}',
                                            textConfirm: 'OK',
                                            onConfirm: () {
                                              Get.back(); // Close the dialog
                                              // Get.offAllNamed(Routes.pmTask);
                                            },
                                            buttonColor:
                                                ColorValues.appGreenColor,
                                            confirmTextColor: Colors.white,
                                            barrierDismissible: false)
                                        : Get.dialog<void>(TbtDonePMTaskDialog(
                                            ptw_id: controller.pmtaskViewModel
                                                    .value?.permit_id ??
                                                0,
                                            id: controller.pmtaskViewModel.value
                                                    ?.id ??
                                                0));
                              },
                            ),
                          )
                        : Dimens.box0,

                    controller.pmtaskViewModel.value?.status == 164 &&
                                controller.pmtaskViewModel.value?.ptw_status !=
                                    126 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmTaskFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0 ||
                            controller.pmtaskViewModel.value?.status == 168 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmTaskFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.remove_red_eye_outlined,
                              backgroundColor: ColorValues.linktopermitColor,
                              text: "Execute",
                              onPressed: () {
                                controller.gotoexecution();
                              },
                            ),
                          )
                        : Dimens.box0,

                    Dimens.boxWidth5,
                    controller.pmtaskViewModel.value?.status == 162 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPermitFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.link,
                              backgroundColor: ColorValues.appGreenColor,
                              text: "Create New Permit",
                              onPressed: () {
                                controller.createNewPermit();
                              },
                            ),
                          )
                        : Dimens.box0,
                    Dimens.boxWidth5,
                    (controller.pmtaskViewModel.value?.status == 162 &&
                                    controller.pmtaskViewModel.value
                                            ?.ptw_status !=
                                        126 ||
                                controller.pmtaskViewModel.value?.status ==
                                        161 &&
                                    controller.pmtaskViewModel.value
                                            ?.ptw_status !=
                                        126 ||
                                controller.pmtaskViewModel.value?.status ==
                                        163 &&
                                    controller.pmtaskViewModel.value
                                            ?.ptw_status !=
                                        126) &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              // icon: Icons.link,
                              backgroundColor: ColorValues.redColor,
                              text: "Cancel Task",
                              onPressed: () {
                                var firstTask = controller
                                    .listMrsByTaskId?.value
                                    .firstWhereOrNull(
                                  (element) =>
                                      element?.jobCardId != 0 ||
                                      element?.pmId != 0,
                                );

                                if (firstTask?.mrs_return_ID == 0 &&
                                    controller.allTrue.value == false) {
                                  Get.dialog(AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    insetPadding: Dimens.edgeInsets10_0_10_0,
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      'Alert',
                                      //'Please return all items!',
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Builder(builder: (context) {
                                      return Container(
                                        padding: Dimens.edgeInsets05_0_5_0,
                                        height: 40,
                                        width: 400,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColour,
                                                thickness: 1,
                                              ),
                                              Text(
                                                'Please return all items!',
                                                textAlign: TextAlign.center,
                                              ),
                                            ]),
                                      );
                                    }),
                                    actions: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Dimens.boxWidth10,
                                            ElevatedButton(
                                              style: Styles
                                                  .darkRedElevatedButtonStyle,
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            Dimens.boxWidth20,
                                            ElevatedButton(
                                              style: Styles
                                                  .greenElevatedButtonStyle,
                                              onPressed: () {
                                                controller.clearMrsStoreData();
                                                controller
                                                    .clearStoreDataJobId();

                                                controller.clearTypeStoreData();
                                                controller.clearStoreTaskData();
                                                controller
                                                    .clearStoreTaskActivityData();
                                                controller
                                                    .clearStoreTasktoActorData();
                                                controller
                                                    .clearStoreTaskWhereUsedData();
                                                controller
                                                    .clearStoreTaskfromActorData();

                                                controller
                                                    .getMrsListByModuleTask(
                                                        taskId: controller
                                                            .scheduleId.value);
                                                // controller.clearStoreTaskData();
                                                // controller
                                                //     .clearStoreTaskActivityData();
                                                // controller
                                                //     .clearStoreTasktoActorData();
                                                // controller
                                                //     .clearStoreTaskWhereUsedData();
                                                // controller
                                                //     .clearStoreTaskfromActorData();

                                                Get.toNamed(
                                                    Routes.mrsReturnScreen,
                                                    arguments: {
                                                      'type': 2,
                                                      "whereUsed": 27,
                                                      "fromActorTypeId": 3,
                                                      "to_actor_type_id": 2,
                                                      "pmTaskId": controller
                                                              .pmtaskViewModel
                                                              .value
                                                              ?.id ??
                                                          0,
                                                      "activity": controller
                                                          .pmtaskViewModel
                                                          .value
                                                          ?.plan_title,
                                                      "mrsId": controller
                                                              .listMrsByTaskId!
                                                              .firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          ?.mrsId !=
                                                                      0,
                                                                  orElse: null)!
                                                              .mrsId ??
                                                          0
                                                    });
                                              },
                                              child: Text('Return MRS'),
                                            ),
                                          ]),
                                    ],
                                  ));

                                  // Get.defaultDialog(
                                  //   radius: 5,
                                  //   title: 'Alert',
                                  //   middleText: 'Please return all items!',
                                  //   textConfirm: 'OK',
                                  //   onConfirm: () {
                                  //     Get.back(); // Action on confirm
                                  //   },
                                  //   textCancel: 'Return MRS',
                                  //   onCancel: () {
                                  //     Get.back(); // Action on cancel
                                  //   },
                                  //   buttonColor: ColorValues
                                  //       .appGreenColor, // Button color for confirm
                                  //   cancelTextColor:
                                  //       Colors.red, // Button color for cancel
                                  //   confirmTextColor:
                                  //       Colors.white, // Text color for confirm
                                  // );
                                } else if (firstTask?.status != 323 &&
                                    controller.listMrsByTaskId!.isNotEmpty &&
                                    controller.allTrue.value == false) {
                                  Get.defaultDialog(
                                    radius: 5,
                                    title: 'Alert',
                                    middleText:
                                        'Please get Return MRS approved!',
                                    textConfirm: 'OK',
                                    onConfirm: () {
                                      Get.back(); // Close the dialog
                                    },
                                    buttonColor: ColorValues.appGreenColor,
                                    confirmTextColor: Colors.white,
                                  );
                                } else {
                                  Get.dialog(CustonApproveRejectDialog(
                                    text: "Cancel Task",
                                    controller: controller,
                                    buttonText: "Cancel Task",
                                    style: Styles.redElevatedButtonStyle,
                                    onPressed: () {
                                      controller.CancelPMTask();
                                      Get.back();
                                    },
                                  ));

                                  // controller.CancelPMTask();

                                  // _isDeleteDialog() {
                                  // Get.dialog(
                                  //   AlertDialog(
                                  //     content: Column(
                                  //         mainAxisSize: MainAxisSize.min,
                                  //         children: [
                                  //           Icon(Icons.cancel,
                                  //               size: 35,
                                  //               color: ColorValues.redColor),
                                  //           SizedBox(
                                  //             height: 10,
                                  //           ),
                                  //           Text(
                                  //             'Are you sure you want to cancel the task?',
                                  //             style: Styles.blackBold14w500,
                                  //           ),
                                  //         ]),
                                  //     actions: [
                                  //       Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceEvenly,
                                  //         children: [
                                  //           TextButton(
                                  //             onPressed: () {
                                  //               Get.back();
                                  //             },
                                  //             child: Text('NO'),
                                  //           ),
                                  //           TextButton(
                                  //             onPressed: () {
                                  //               Get.back();
                                  //               controller.CancelPMTask(
                                  //                   controller: controller);
                                  //             },
                                  //             child: Text('YES'),
                                  //           ),
                                  //         ],
                                  //       )
                                  //     ],
                                  //   ),
                                  // );
                                }
                              },
                            ),
                          )
                        : Dimens.box0,
                    // Dimens.boxWidth10,
                    // Container(
                    //   height: 35,
                    //   child: CustomElevatedButton(
                    //     // icon: Icons.start,
                    //     backgroundColor: ColorValues.appGreenColor,
                    //     text: "Clone Permit",
                    //     onPressed: () {
                    //       //controller.printScreen();
                    //     },
                    //   ),
                    // ),
                    // Dimens.boxWidth10,
                    // Container(
                    //   height: 35,
                    //   child: CustomElevatedButton(
                    //     icon: Icons.close,
                    //     backgroundColor: ColorValues.closeColor,
                    //     text: "Close",
                    //     onPressed: () {
                    //       Get.dialog(CustonApproveRejectDialog(
                    //         text: "Execution Close",
                    //         controller: controller,
                    //         buttonText: "Close",
                    //         style: Styles.redElevatedButtonStyle,
                    //         onPressed: () {
                    //           controller.closePmTaskExecution();
                    //           Get.back();
                    //         },
                    //       ));
                    //     },
                    //   ),
                    // ),
                    Dimens.boxWidth3,

                    controller.pmtaskViewModel.value?.status == 165 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.check,
                              backgroundColor: ColorValues.approveColor,
                              text: "Approve",
                              onPressed: () {
                                Get.dialog(CustonApproveRejectDialog(
                                  text: "Execution Approve",
                                  controller: controller,
                                  buttonText: "Approve",
                                  style: Styles.greenElevatedButtonStyle,
                                  onPressed: () {
                                    controller.approvePmTaskExecution();
                                    Get.back();
                                  },
                                ));
                              },
                            ),
                          )
                        : Dimens.box0,
                    Dimens.boxWidth5,
                    controller.pmtaskViewModel.value?.status == 165 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.close,
                              backgroundColor: ColorValues.rejectColor,
                              text: "Reject",
                              onPressed: () {
                                Get.dialog(CustonApproveRejectDialog(
                                  text: "Execution Reject",
                                  controller: controller,
                                  buttonText: "Reject",
                                  style: Styles.redElevatedButtonStyle,
                                  onPressed: () {
                                    controller.rejectPmTaskExecution();
                                    Get.back();
                                  },
                                ));
                              },
                            ),
                          )
                        : Dimens.box0,
                    controller.pmtaskViewModel.value?.status == 170 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.check,
                              backgroundColor: ColorValues.approveColor,
                              text: "Approve",
                              onPressed: () {
                                Get.dialog(CustonApproveRejectDialog(
                                  text: "Cancel Task Approve",
                                  controller: controller,
                                  buttonText: "Approve",
                                  style: Styles.greenElevatedButtonStyle,
                                  onPressed: () {
                                    controller.approveCancelPmTaskExecution();
                                    Get.back();
                                  },
                                ));
                              },
                            ),
                          )
                        : Dimens.box0,
                    Dimens.boxWidth5,
                    controller.pmtaskViewModel.value?.status == 170 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.close,
                              backgroundColor: ColorValues.rejectColor,
                              text: "Reject",
                              onPressed: () {
                                Get.dialog(CustonApproveRejectDialog(
                                  text: "Cancel Task Reject",
                                  controller: controller,
                                  buttonText: "Reject",
                                  style: Styles.redElevatedButtonStyle,
                                  onPressed: () {
                                    controller.rejectCancelPmTaskExecution();
                                    Get.back();
                                  },
                                ));
                              },
                            ),
                          )
                        : Dimens.box0,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
