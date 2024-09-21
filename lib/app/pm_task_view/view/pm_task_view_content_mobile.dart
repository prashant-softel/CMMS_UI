import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/pm_task_view/view/observation_view_dialog.dart';
import 'package:cmms/app/widgets/assign_to_pm_task_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/pm_task_view/view/tbt_dialog.dart';

import '../../../domain/models/history_model.dart';
import '../../utils/user_access_constants.dart';

class PreventiveTaskViewContentMobile
    extends GetView<PreventiveMaintenanceTaskViewController> {
  PreventiveTaskViewContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return
        //   Scaffold(
        // body: //
        //   Obx(
        // () =>
        (controller.pmtaskViewModel.value != null)
            ? //
            Obx(
                () => //
                    SingleChildScrollView(
                  child: Container(
                    height: Get.height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                            title: 'PM Task Id',
                                            value: (controller.pmtaskViewModel
                                                        .value?.id !=
                                                    null)
                                                ? "PMT${controller.pmtaskViewModel.value?.id.toString() ?? ''}"
                                                : '',
                                          ),
                                          JobDetailField(
                                            title: 'Task Title',
                                            value: controller.pmtaskViewModel
                                                    .value?.plan_title ??
                                                '',
                                          ),
                                          JobDetailField(
                                            title: "Equipment Category",
                                            value: controller.pmtaskViewModel
                                                    .value?.category_name ??
                                                "",
                                          ),
                                          JobDetailField(
                                            title: 'Due Date',
                                            value: controller.pmtaskViewModel
                                                    .value?.due_date ??
                                                '',
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
                                            title: 'Frequency',
                                            value: controller.pmtaskViewModel
                                                    .value?.category_name ??
                                                '',
                                          ),
                                          JobDetailField(
                                            title: 'Assigned To',
                                            value: controller.pmtaskViewModel
                                                    .value?.assigned_to_name ??
                                                "",
                                          ),
                                          JobDetailField(
                                            title: 'Last Done Date',
                                            value: controller.pmtaskViewModel
                                                    .value?.last_done_date ??
                                                'null',
                                          ),
                                          JobDetailField(
                                            title: 'Done Date',
                                            value: controller.pmtaskViewModel
                                                    .value?.done_date
                                                    .toString() ??
                                                '',
                                          ),
                                        ]),
                                  ),
                                ]),
                            Text(
                              "Asset(s) ",
                              style: Styles.blue700,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  //physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      //  controller.scheduleCheckPoint! !=
                                      //         null
                                      //     ?
                                      controller.scheduleCheckPoint!.length,
                                  // : 0,
                                  itemBuilder: (context, index) {
                                    final pmTaskModel =
                                        (controller.scheduleCheckPoint! != null)
                                            ? controller
                                                .scheduleCheckPoint![index]
                                            : ScheduleCheckPoint();
                                    return GestureDetector(
                                      onTap: () {
                                        // var _taskId =
                                        //     controller.scheduleCheckPoint[index]!.id ?? 0;
                                        // Get.toNamed(Routes.pmTaskView,
                                        //     arguments: {'pmTaskId': _taskId});
                                        controller.selectedItem = controller
                                            .scheduleCheckPoint!
                                            .firstWhere((element) =>
                                                "${element?.schedule_id}" ==
                                                controller
                                                    .scheduleCheckPoint?[index]
                                                    ?.schedule_id
                                                    .toString());
                                        if (controller.selectedItem != null) {
                                          showModalBottomSheet<void>(
                                              // context and builder are
                                              // required properties in this widget
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ObservationViewDialog();
                                              });
                                        }
                                      },
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
                                                Row(children: [
                                                  Text('Asset: ',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        '${pmTaskModel?.name}'
                                                        '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  ),
                                                ]),
                                                Row(//
                                                    children: [
                                                  Text('Checklist: ',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        pmTaskModel
                                                                ?.checklist_name ??
                                                            '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text('Failure Score: ',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        "", // "${pmTaskModel?.f ?? ''}",
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  )
                                                ]),
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
                                                            162 // assigned
                                                    ? Dimens.box0
                                                    : Row(//
                                                        children: [
                                                        Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.selectedItem = controller
                                                                .scheduleCheckPoint!
                                                                .firstWhere((element) =>
                                                                    "${element?.schedule_id}" ==
                                                                    controller
                                                                        .scheduleCheckPoint?[
                                                                            index]
                                                                        ?.schedule_id
                                                                        .toString());
                                                            if (controller
                                                                    .selectedItem !=
                                                                null) {
                                                              showModalBottomSheet<
                                                                      void>(
                                                                  // context and builder are
                                                                  // required properties in this widget
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return ObservationViewDialog();
                                                                  });
                                                            }
                                                          },
                                                          child: Container(
                                                            padding: Dimens
                                                                .edgeInsets8_2_8_2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Text(
                                                              'View',
                                                              style: Styles
                                                                  .white10
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                              ]),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            controller.pmtaskViewModel.value?.permit_id == 0
                                ? Dimens.box0
                                : Text(
                                    "Permit Details  ",
                                    style: Styles.blue700,
                                  ),
                            controller.pmtaskViewModel.value?.permit_id == 0
                                ? Dimens.box0
                                : GestureDetector(
                                    onTap: () {
                                      // var _taskId =
                                      //     controller.scheduleCheckPoint[index]!.id ?? 0;
                                      // Get.toNamed(Routes.pmTaskView,
                                      //     arguments: {'pmTaskId': _taskId});
                                    },
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
                                              Row(children: [
                                                Text("Permit ID:",
                                                    style:
                                                        Styles.appDarkGrey12),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      "PTW${controller.pmtaskViewModel.value?.permit_id ?? ""}",
                                                      style:
                                                          Styles.appDarkBlue12),
                                                ),
                                              ]),
                                              Row(//
                                                  children: [
                                                Text("Permit Code:",
                                                    style:
                                                        Styles.appDarkGrey12),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      "${controller.pmtaskViewModel.value?.permit_code ?? ""}",
                                                      style:
                                                          Styles.appDarkBlue12),
                                                )
                                              ]),
                                              Row(children: [
                                                Text("Permit Type:",
                                                    style:
                                                        Styles.appDarkGrey12),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      "${controller.pmtaskViewModel.value?.permit_type ?? ""}",
                                                      style:
                                                          Styles.appDarkBlue12),
                                                )
                                              ]),
                                              Row(children: [
                                                Text("Status:",
                                                    style:
                                                        Styles.appDarkGrey12),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      "${controller.pmtaskViewModel.value?.status_short_ptw ?? ""}",
                                                      style:
                                                          Styles.appDarkBlue12),
                                                )
                                              ]),
                                              Row(//
                                                  children: [
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .clearPermitStoreData();
                                                    controller.viewNewPermitList(
                                                        permitId: controller
                                                            .pmtaskViewModel
                                                            .value
                                                            ?.permit_id,
                                                        jobId: controller
                                                                .jobDetailsModel
                                                                .value!
                                                                .id ??
                                                            0);
                                                  },
                                                  child: Container(
                                                    padding: Dimens
                                                        .edgeInsets8_2_8_2,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorValues.viewColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Text(
                                                      'View',
                                                      style: Styles.white10
                                                          .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Dimens.boxWidth10,
                                                controller.pmtaskViewModel.value
                                                                ?.ptw_status ==
                                                            124 ||
                                                        controller
                                                                .pmtaskViewModel
                                                                .value
                                                                ?.ptw_status ==
                                                            132
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          controller.editNewPermit(
                                                              permitId: controller
                                                                  .pmtaskViewModel
                                                                  .value
                                                                  ?.permit_id,
                                                              isChecked: false
                                                              // controller
                                                              //     .isChecked
                                                              //     .value
                                                              );
                                                        },
                                                        child: Container(
                                                          padding: Dimens
                                                              .edgeInsets8_2_8_2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    116,
                                                                    78,
                                                                    130),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          child: Text(
                                                            'Re-Submit Permit',
                                                            style: Styles
                                                                .white10
                                                                .copyWith(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                              ]),
                                            ]),
                                      ),
                                    ),
                                  ),
                            Dimens.boxHeight10,
                            Row(
                              children: [
                                Text(
                                  "Material Issue / Used",
                                  style: Styles.blue700,
                                ),
                                Spacer(),
                                controller.listMrsByTaskId!.isNotEmpty
                                    ? Dimens.box0
                                    : GestureDetector(
                                        onTap: () async {
                                          controller.clearStoreData();
                                          controller.clearStoreTaskData();
                                          controller
                                              .clearStoreTaskActivityData();
                                          controller
                                              .clearStoreTasktoActorData();
                                          controller
                                              .clearStoreTaskWhereUsedData();
                                          controller
                                              .clearStoreTaskfromActorData();
                                          controller.clearTypeStoreData();
                                          Get.offAllNamed(Routes.createMrs,
                                              arguments: {
                                                "whereUsedId": controller
                                                    .pmtaskViewModel.value?.id,
                                                "activity": controller
                                                    .pmtaskViewModel
                                                    .value
                                                    ?.plan_title,
                                                "type": 2,
                                                "whereUsed": 27,
                                                "fromActorTypeId": 2,
                                                "to_actor_type_id": 3
                                              });
                                        },
                                        child: Container(
                                          padding: Dimens.edgeInsets8_2_8_2,
                                          decoration: BoxDecoration(
                                            color: ColorValues.addNewColor,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            'Add MRS',
                                            style: Styles.white10.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                            controller.listMrsByTaskId!.isEmpty
                                ? Dimens.box0
                                : Container(
                                    height: (controller
                                                .listMrsByTaskId?.length ??
                                            0) *
                                        100.0, // Assuming each item has a height of 100.0

                                    child: ListView.builder(
                                        //physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller.listMrsByTaskId !=
                                                null
                                            ? controller.listMrsByTaskId!.length
                                            : 0,
                                        itemBuilder: (context, index) {
                                          final pmTaskMrsModel =
                                              (controller.listMrsByTaskId !=
                                                      null)
                                                  ? controller
                                                      .listMrsByTaskId![index]
                                                  : MRSListByJobIdModel();
                                          return GestureDetector(
                                            onTap: () {
                                              // var _taskId =
                                              //     controller.scheduleCheckPoint[index]!.id ?? 0;
                                              // Get.toNamed(Routes.pmTaskView,
                                              //     arguments: {'pmTaskId': _taskId});
                                            },
                                            child: Card(
                                              color: Colors.lightBlue.shade50,
                                              elevation: 10,
                                              shadowColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(children: [
                                                        Text(
                                                            controller
                                                                        .listMrsByTaskId?[
                                                                            index]
                                                                        ?.is_mrs_return ==
                                                                    0
                                                                ? 'MRS ID: '
                                                                : 'RMRS ID: ',
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              controller
                                                                          .listMrsByTaskId?[
                                                                              index]
                                                                          ?.is_mrs_return ==
                                                                      0
                                                                  ? 'MRS${pmTaskMrsModel?.mrsId}'
                                                                  : 'RMRS${pmTaskMrsModel?.mrs_return_ID}',
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        ),
                                                      ]),
                                                      Row(//
                                                          children: [
                                                        Text("MRS Items List: ",
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              pmTaskMrsModel
                                                                      ?.mrsItems ??
                                                                  '',
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
                                                              pmTaskMrsModel
                                                                      ?.status_short ??
                                                                  '',
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        )
                                                      ]),
                                                      Row(//
                                                          children: [
                                                        controller
                                                                        .listMrsByTaskId?[
                                                                            index]
                                                                        ?.status ==
                                                                    323 ||
                                                                controller
                                                                        .listMrsByTaskId?[
                                                                            index]
                                                                        ?.status ==
                                                                    321 ||
                                                                controller
                                                                        .listMrsByTaskId?[
                                                                            index]
                                                                        ?.status ==
                                                                    324
                                                            ? Dimens.box0
                                                            : varUserAccessModel
                                                                        .value
                                                                        .access_list!
                                                                        .where((e) =>
                                                                            e.feature_id == UserAccessConstants.kMrsFeatureId &&
                                                                            e.edit ==
                                                                                UserAccessConstants.kHaveEditAccess)
                                                                        .length >
                                                                    0
                                                                ? GestureDetector(
                                                                    onTap: () {
                                                                      controller
                                                                          .clearStoreData();
                                                                      int mrsId =
                                                                          pmTaskMrsModel?.mrsId ??
                                                                              0;
                                                                      Get.toNamed(
                                                                          Routes
                                                                              .editMrs,
                                                                          arguments: {
                                                                            'mrsId':
                                                                                mrsId
                                                                          });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          Dimens
                                                                              .edgeInsets8_2_8_2,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: ColorValues
                                                                            .editColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(4),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Edit',
                                                                        style: Styles
                                                                            .white10
                                                                            .copyWith(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Dimens.box0,
                                                        Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .clearStoreData();

                                                            String mrsId =
                                                                pmTaskMrsModel
                                                                        ?.mrsId
                                                                        .toString() ??
                                                                    "";
                                                            String type =
                                                                2.toString();

                                                            String? rmrsId = controller
                                                                .listMrsByTaskId?[
                                                                    index]
                                                                ?.mrs_return_ID
                                                                .toString();
                                                            controller
                                                                        .listMrsByTaskId?[
                                                                            index]
                                                                        ?.is_mrs_return ==
                                                                    0
                                                                ? Get.offNamed(
                                                                    '${Routes.mrsApprovalScreen}/$mrsId/$type')
                                                                : Get.offNamed(
                                                                    '${Routes.approverReturnMrs}/$rmrsId/$type');
                                                          },
                                                          child: Container(
                                                            padding: Dimens
                                                                .edgeInsets8_2_8_2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Text(
                                                              'View',
                                                              style: Styles
                                                                  .white10
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ]),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                            controller.pmtaskViewModel.value?.permit_id == 0
                                ? Dimens.box0
                                : Text(
                                    "PM History ",
                                    style: Styles.blue700,
                                  ),
                            controller.historyList!.isEmpty
                                ? Dimens.box0
                                : Flexible(
                                    child: ListView.builder(
                                        //physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.historyList! != null
                                                ? controller.historyList!.length
                                                : 0,
                                        itemBuilder: (context, index) {
                                          final pmTaskHistoryModel =
                                              (controller.historyList! != null)
                                                  ? controller
                                                      .historyList![index]
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
                                              padding:
                                                  const EdgeInsets.all(10.0),
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
                                  ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Container(
                                  //   height: 35,
                                  //   child: CustomElevatedButton(
                                  //     icon: Icons.print,
                                  //     backgroundColor: ColorValues.linktopermitColor,
                                  //     text: "print",
                                  //     onPressed: () {
                                  //       // controller.generateInvoice();
                                  //     },
                                  //   ),
                                  // ),
                                  // Dimens.boxWidth10,
                                  controller.pmtaskViewModel.value?.status ==
                                          161
                                      ? Container(
                                          height: 35,
                                          child: CustomElevatedButton(
                                            // icon: Icons.link,
                                            backgroundColor:
                                                ColorValues.blueColor,
                                            text: "Assign",
                                            onPressed: () {
                                              Get.dialog<void>(
                                                  AssignToPMTaskDialog(
                                                      id: controller
                                                              .pmtaskViewModel
                                                              .value
                                                              ?.id ??
                                                          0));
                                              //controller.printScreen();
                                            },
                                          ),
                                        )
                                      : Dimens.box0,
                                  Dimens.boxWidth10,
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
                                  controller.pmtaskViewModel.value?.status ==
                                              167 &&
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
                                            icon: Icons.start,
                                            backgroundColor:
                                                ColorValues.linktopermitColor,
                                            text: "Start",
                                            onPressed: () {
                                              controller.pmtaskViewModel.value
                                                          ?.ptw_tbt_done ==
                                                      1
                                                  ? controller.setPmTask()
                                                  : Get.dialog<void>(
                                                      TbtDonePMTaskDialog(
                                                          ptw_id: controller
                                                                  .pmtaskViewModel
                                                                  .value
                                                                  ?.permit_id ??
                                                              0,
                                                          id: controller
                                                                  .pmtaskViewModel
                                                                  .value
                                                                  ?.id ??
                                                              0));
                                            },
                                          ),
                                        )
                                      : Dimens.box0,

                                  controller.pmtaskViewModel.value?.status ==
                                                  164 &&
                                              varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id == UserAccessConstants.kPmTaskFeatureId &&
                                                          e.add ==
                                                              UserAccessConstants
                                                                  .kHaveAddAccess)
                                                      .length >
                                                  0 ||
                                          controller.pmtaskViewModel.value?.status == 166 &&
                                              varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id == UserAccessConstants.kPmTaskFeatureId &&
                                                          e.add ==
                                                              UserAccessConstants
                                                                  .kHaveAddAccess)
                                                      .length >
                                                  0 ||
                                          controller.pmtaskViewModel.value?.status == 168 &&
                                              varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kPmTaskFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0
                                      ? Container(
                                          height: 35,
                                          child: CustomElevatedButton(
                                            icon: Icons.remove_red_eye_outlined,
                                            backgroundColor:
                                                ColorValues.linktopermitColor,
                                            text: "Execute",
                                            onPressed: () {
                                              controller.gotoexecution();
                                            },
                                          ),
                                        )
                                      : Dimens.box0,
                                  Dimens.boxWidth10,
                                  controller.pmtaskViewModel.value?.status == 162 &&
                                              varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.add ==
                                                              UserAccessConstants
                                                                  .kHaveAddAccess)
                                                      .length >
                                                  0 ||
                                          controller.pmtaskViewModel.value
                                                      ?.status ==
                                                  161 &&
                                              varUserAccessModel
                                                      .value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kPermitFeatureId &&
                                                          e.add ==
                                                              UserAccessConstants
                                                                  .kHaveAddAccess)
                                                      .length >
                                                  0
                                      ? Container(
                                          height: 35,
                                          child: CustomElevatedButton(
                                            icon: Icons.link,
                                            backgroundColor:
                                                ColorValues.appGreenColor,
                                            text: "Create New Permit",
                                            onPressed: () {
                                              controller.createNewPermit();
                                            },
                                          ),
                                        )
                                      : Dimens.box0,
                                  Dimens.boxWidth10,

                                  controller.pmtaskViewModel.value?.status ==
                                              165 &&
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
                                            backgroundColor:
                                                ColorValues.approveColor,
                                            text: "Approve",
                                            onPressed: () {
                                              Get.dialog(
                                                  CustonApproveRejectDialog(
                                                text: "Execution Approve",
                                                controller: controller,
                                                buttonText: "Approve",
                                                style: Styles
                                                    .greenElevatedButtonStyle,
                                                onPressed: () {
                                                  controller
                                                      .approvePmTaskExecution();
                                                  Get.back();
                                                },
                                              ));
                                            },
                                          ),
                                        )
                                      : Dimens.box0,
                                  Dimens.boxWidth10,
                                  controller.pmtaskViewModel.value?.status ==
                                              165 &&
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
                                            backgroundColor:
                                                ColorValues.rejectColor,
                                            text: "Reject",
                                            onPressed: () {
                                              Get.dialog(
                                                  CustonApproveRejectDialog(
                                                text: "Execution Reject",
                                                controller: controller,
                                                buttonText: "Reject",
                                                style: Styles
                                                    .redElevatedButtonStyle,
                                                onPressed: () {
                                                  controller
                                                      .rejectPmTaskExecution();
                                                  Get.back();
                                                },
                                              ));
                                            },
                                          ),
                                        )
                                      : Dimens.box0,
                                  Dimens.boxWidth10,
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              )
            : Dimens.box0;
  }

  ///////////
}
