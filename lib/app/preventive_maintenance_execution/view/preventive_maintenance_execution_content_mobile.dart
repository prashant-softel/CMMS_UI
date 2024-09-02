import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import 'package:cmms/app/preventive_maintenance_execution/view/observation_update_dailog.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/app/widgets/mobile_observation_pm_execution_process_dialog.dart';
import 'package:cmms/app/widgets/observation_pm_execution_process_dialog.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_textfield.dart';

class PreventiveMaintenanceExecutionContentMobile
    extends GetView<PreventiveMaintenanceExecutionController> {
  PreventiveMaintenanceExecutionContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.edgeInsets10,
      child: (controller.pmtaskViewModel.value != null)
          ? Obx(
              () => SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// LEFT COLUMN
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    JobDetailField(
                                      title: 'PM Task Id',
                                      value: (controller
                                                  .pmtaskViewModel.value?.id !=
                                              null)
                                          ? "PMT${controller.pmtaskViewModel.value?.id.toString() ?? ''}"
                                          : '',
                                    ),
                                    JobDetailField(
                                      title: 'Task Title',
                                      value: controller.pmtaskViewModel.value
                                              ?.plan_title ??
                                          '',
                                    ),
                                    JobDetailField(
                                      title: "Equipment Category",
                                      value: controller.pmtaskViewModel.value
                                              ?.category_name ??
                                          "",
                                    ),
                                    JobDetailField(
                                      title: 'Due Date',
                                      value: controller.pmtaskViewModel.value
                                              ?.due_date ??
                                          '',
                                    ),
                                  ]),
                            ),
                            Dimens.boxWidth10,

                            /// RIGHT COLUMN
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    JobDetailField(
                                      title: 'Frequency',
                                      value: controller.pmtaskViewModel.value
                                              ?.frequency_name ??
                                          '',
                                    ),
                                    JobDetailField(
                                      title: 'Assigned To',
                                      value: controller.pmtaskViewModel.value
                                              ?.assigned_to_name ??
                                          "",
                                    ),
                                    JobDetailField(
                                      title: 'Last Done Date',
                                      value: controller.pmtaskViewModel.value
                                              ?.last_done_date ??
                                          'null',
                                    ),
                                    JobDetailField(
                                      title: 'Done Date',
                                      value: controller
                                              .pmtaskViewModel.value?.done_date
                                              .toString() ??
                                          '',
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Text(
                          "Asset(s) ",
                          style: Styles.blue700,
                        ),
                        Container(
                          width: Get.width,
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorValues.appBlueBackgroundColor,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children:
                                    controller.rowItemclone.value.map((record) {
                                  return Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: record.map((mapData) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Column(
                                            children: [
                                              if (mapData['key'] == "Asset" ||
                                                  mapData['key'] == "Checklist")
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${mapData['key']!}: ',
                                                          style: Styles
                                                              .appDarkGrey12,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              '${mapData['value']!}',
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              else if (mapData['key'] ==
                                                  "executionDone")
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Executed by: ',
                                                      style:
                                                          Styles.appDarkGrey12,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          '${mapData['completed']!}',
                                                          style: Styles
                                                              .appDarkBlue12),
                                                    ),
                                                  ],
                                                )
                                              else if (mapData['key'] ==
                                                  "dropdown")
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TableActionButton(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        icon:
                                                            Icons.cyclone_sharp,
                                                        message: "Clone",
                                                        onPress: () {
                                                          controller.selectedItem = controller
                                                              .scheduleCheckPoints
                                                              .firstWhere(
                                                                  (element) =>
                                                                      "${element.name}" ==
                                                                      record[0][
                                                                              'value']
                                                                          .toString(),
                                                                  orElse: null);

                                                          var select = controller
                                                              .scheduleCheckPoints
                                                              .firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          .name ==
                                                                      controller
                                                                          .selectedasset
                                                                          .value,
                                                                  orElse: null);
                                                          select.schedule_link_job!
                                                                  .isNotEmpty
                                                              ? controller
                                                                  .cloneAlertDialog()
                                                              : controller
                                                                  .cloneDialog(
                                                                      controller
                                                                          .selectedasset
                                                                          .value);
                                                        }),
                                                    DropdownWebWidget(
                                                      width: 300,
                                                      controller: controller,
                                                      dropdownList: controller
                                                          .scheduleCheckPointsdrop,
                                                      selectedValue:
                                                          mapData["value"],
                                                      onValueChanged: (list,
                                                          selectedValue) {
                                                        controller.selectedasset
                                                            .value;
                                                        mapData["value"] =
                                                            selectedValue;

                                                        controller.selectedasset
                                                                .value =
                                                            selectedValue;

                                                        controller.checkdropdownMapperData[
                                                                selectedValue] =
                                                            list.firstWhere(
                                                          (element) =>
                                                              element.name ==
                                                              selectedValue,
                                                          orElse: null,
                                                        );
                                                      },
                                                    ),
                                                    TableActionButton(
                                                        color: ColorValues
                                                            .editColor,
                                                        icon: Icons.edit,
                                                        message: "Edit",
                                                        onPress: () {
                                                          controller
                                                                  .selectedItem =
                                                              null;
                                                          controller.rowItemobs
                                                              .value = [];
                                                          controller.selectedItem = controller
                                                              .scheduleCheckPoints
                                                              .firstWhere((element) =>
                                                                  "${element.name}" ==
                                                                  record[0][
                                                                          'value']
                                                                      .toString());
                                                          if (controller
                                                                  .selectedItem !=
                                                              null) {
                                                            controller
                                                                .selectedItem!
                                                                .checklist_observation
                                                                ?.forEach(
                                                                    (element) {
                                                              controller
                                                                  .rowItemobs
                                                                  .value
                                                                  .add([
                                                                {
                                                                  "key":
                                                                      "checkpoint",
                                                                  "id":
                                                                      '${element.execution_id}',
                                                                  "value":
                                                                      '${element.check_point_name}',
                                                                },
                                                                {
                                                                  "key":
                                                                      "requirement",
                                                                  "value":
                                                                      '${element.requirement}'
                                                                },
                                                                {
                                                                  'key':
                                                                      "weightage",
                                                                  "value":
                                                                      '${element.failure_waightage}'
                                                                },
                                                                {
                                                                  'key': "cpok",
                                                                  "value":
                                                                      '${element.cp_ok.value}'
                                                                },
                                                                {
                                                                  'key':
                                                                      "observation",
                                                                  "value":
                                                                      '${element.observation}'
                                                                },
                                                                {
                                                                  'key':
                                                                      "uploadimg",
                                                                  "value": '',
                                                                  "uploaded": ""
                                                                },
                                                                {
                                                                  'key': "type",
                                                                  'inpute_type':
                                                                      '${element.check_point_type}',
                                                                  "value":
                                                                      '${element.type_text}',
                                                                  "min":
                                                                      '${element.min_range}',
                                                                  "max":
                                                                      '${element.max_range}'
                                                                },
                                                                {
                                                                  'key':
                                                                      "job_created",
                                                                  "value":
                                                                      '${element.linked_job_id.value}',
                                                                  "cp_ok_value":
                                                                      '${element.cp_ok.value}',
                                                                },
                                                              ]);
                                                            });
                                                            controller.getMrsListByModuleTask(
                                                                taskId: controller
                                                                    .scheduleId
                                                                    .value);

                                                            // Show bottom sheet
                                                            showObservationPmExecutionViewBottomSheet(
                                                                context);
                                                          }
                                                        }),
                                                  ],
                                                )
                                              else
                                                Flexible(
                                                  child: Text(
                                                    mapData['value'] ?? '',
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                }).toList(),
                              ),
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
                                      controller.clearStoreTaskData();
                                      controller.clearStoreTaskActivityData();
                                      controller.clearStoreTasktoActorData();
                                      controller.clearStoreTaskWhereUsedData();
                                      controller.clearStoreTaskfromActorData();
                                      controller.clearTypeValue();
                                      Get.offAllNamed(Routes.createMrs,
                                          arguments: {
                                            "whereUsedId": controller
                                                .pmtaskViewModel.value?.id,
                                            "activity": controller
                                                .pmtaskViewModel
                                                .value
                                                ?.plan_title,
                                            "whereUsed": 27,
                                            "type": 2,
                                            "fromActorTypeId": 2,
                                            "to_actor_type_id": 3
                                          });
                                    },
                                    child: Container(
                                      padding: Dimens.edgeInsets8_2_8_2,
                                      decoration: BoxDecoration(
                                        color: ColorValues.addNewColor,
                                        borderRadius: BorderRadius.circular(4),
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
                                height: (controller.listMrsByTaskId?.length ??
                                        0) *
                                    100.0, // Assuming each item has a height of 100.0

                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.listMrsByTaskId != null
                                            ? controller.listMrsByTaskId!.length
                                            : 0,
                                    itemBuilder: (context, index) {
                                      final pmTaskMrsModel =
                                          (controller.listMrsByTaskId != null)
                                              ? controller
                                                  .listMrsByTaskId![index]
                                              : MRSListByJobIdModel();
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
                                                  Row(children: [
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
                                                  Row(children: [
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
                                                                        e.feature_id ==
                                                                            UserAccessConstants
                                                                                .kMrsFeatureId &&
                                                                        e.edit ==
                                                                            UserAccessConstants.kHaveEditAccess)
                                                                    .length >
                                                                0
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  controller
                                                                      .clearMrsStoreData();
                                                                  int mrsId =
                                                                      pmTaskMrsModel
                                                                              ?.mrsId ??
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
                                                                  padding: Dimens
                                                                      .edgeInsets8_2_8_2,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorValues
                                                                        .editColor,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                  ),
                                                                  child: Text(
                                                                    'Edit',
                                                                    style: Styles
                                                                        .white10
                                                                        .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Dimens.box0,
                                                    Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .clearMrsStoreData();

                                                        int mrsId =
                                                            pmTaskMrsModel
                                                                    ?.mrsId ??
                                                                0;
                                                        int? rmrsId = controller
                                                            .listMrsByTaskId?[
                                                                index]
                                                            ?.mrs_return_ID;
                                                        controller
                                                                    .listMrsByTaskId?[
                                                                        index]
                                                                    ?.is_mrs_return ==
                                                                0
                                                            ? Get.toNamed(
                                                                Routes
                                                                    .mrsApprovalScreen,
                                                                arguments: {
                                                                    'mrsId':
                                                                        mrsId,
                                                                    'type': 2
                                                                  })
                                                            : Get.toNamed(
                                                                Routes
                                                                    .approverReturnMrs,
                                                                arguments: {
                                                                    'mrsId':
                                                                        rmrsId,
                                                                    'type': 2
                                                                  });
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
                                                                  .circular(4),
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
                                                  ]),
                                                ]),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                        Dimens.boxHeight10,
                        controller.pmtaskViewModel.value?.permit_id == 0
                            ? Dimens.box0
                            : Text(
                                "PM History ",
                                style: Styles.blue700,
                              ),
                        controller.historyList!.isEmpty
                            ? Dimens.box0
                            : ListView.builder(
                                shrinkWrap: true,
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
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Text('Time Stamp: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    '${pmTaskHistoryModel?.createdAt?.result}'
                                                    '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              ),
                                            ]),
                                            Row(//
                                                children: [
                                              Text('Posted By: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    pmTaskHistoryModel
                                                            ?.createdByName ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Comments: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    "${pmTaskHistoryModel?.comment ?? ''}",
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Status: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    "${pmTaskHistoryModel?.status_name ?? ''}",
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                          ]),
                                    ),
                                  );
                                }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: CustomRichTextMobile(
                                    title: "Comment:", includeAsterisk: false)),
                            Dimens.boxHeight5,
                            Container(
                                width: Get.width,
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
                                child: LoginCustomTextfield(
                                  maxLine: 2,
                                  textController: controller.updatecommentCtrlr,
                                )),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.updateColor,
                                text: "Update",
                                onPressed: () {
                                  controller.UpdatePMTaskExecution();
                                },
                              ),
                            ),
                            Dimens.boxWidth10,
                            Container(
                              height: 35,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.closeColor,
                                text: "Close",
                                onPressed: () {
                                  controller.listMrsByTaskId!.value
                                                  .firstWhereOrNull(
                                                    (element) =>
                                                        element?.jobCardId !=
                                                            0 ||
                                                        element?.pmId != 0,
                                                  )
                                                  ?.mrs_return_ID ==
                                              0 &&
                                          controller.allTrue.value == false
                                      ? Get.defaultDialog(
                                          radius: 5,
                                          title: 'Alert',
                                          middleText:
                                              'Please return all items!',
                                          textConfirm: 'OK',
                                          onConfirm: () {
                                            Get.back();
                                          },
                                          buttonColor:
                                              ColorValues.appGreenColor,
                                          confirmTextColor: Colors.white,
                                        )
                                      : controller.listMrsByTaskId!.value
                                                      .firstWhereOrNull(
                                                        (element) =>
                                                            element?.jobCardId !=
                                                                0 ||
                                                            element?.pmId != 0,
                                                      )
                                                      ?.status !=
                                                  323 &&
                                              controller.listMrsByTaskId!
                                                  .isNotEmpty &&
                                              controller.allTrue.value == false
                                          ? Get.defaultDialog(
                                              radius: 5,
                                              title: 'Alert',
                                              middleText:
                                                  'Please get Return MRS approved!',
                                              textConfirm: 'OK',
                                              onConfirm: () {
                                                Get.back();
                                              },
                                              buttonColor:
                                                  ColorValues.appGreenColor,
                                              confirmTextColor: Colors.white,
                                            )
                                          : controller.closePmTaskExecution();
                                },
                              ),
                            ),
                            Dimens.boxWidth10,
                            controller.listMrsByTaskId!.value
                                            .firstWhereOrNull(
                                              (element) =>
                                                  element?.jobCardId != 0 ||
                                                  element?.pmId != 0,
                                            )
                                            ?.mrs_return_ID ==
                                        0 &&
                                    controller.allTrue.value == false
                                ? Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      icon: Icons.keyboard_return_outlined,
                                      backgroundColor:
                                          ColorValues.linktopermitColor,
                                      text: "Return Mrs",
                                      onPressed: () {
                                        controller.getMrsListByModuleTask(
                                            taskId:
                                                controller.scheduleId.value);

                                        Get.toNamed(Routes.mrsReturnScreen,
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
                                                              element?.mrsId !=
                                                              0,
                                                          orElse: null)!
                                                      .mrsId ??
                                                  0
                                            });
                                      },
                                    ),
                                  )
                                : Dimens.box0
                          ],
                        ),
                        Dimens.boxHeight20
                      ]),
                ),
              ),
            )
          : Dimens.box0,
    );
  }

  void showObservationPmExecutionViewBottomSheet(BuildContext context) {
    MobileObservationPmExecutionViewDialog()
        .showObservationPmExecutionViewBottomSheet(context);
  }
}
