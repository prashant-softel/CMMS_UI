import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/preventive_maintenance_execution/preventive_maintenance_execution_controller.dart';
import 'package:cmms/app/preventive_maintenance_execution/view/observation_update_dailog.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
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
    ///
    return
        //   Scaffold(
        // body: //
        //   Obx(
        // () =>
        Padding(
      padding: Dimens.edgeInsets10,
      child: (controller.pmtaskViewModel.value != null)
          ? //
          Obx(
              () => //
                  SingleChildScrollView(
                child: Container(
                  height: Get.height,
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
                                        value: (controller.pmtaskViewModel.value
                                                    ?.id !=
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
                                        value: controller.pmtaskViewModel.value
                                                ?.done_date
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
                            shrinkWrap: true,
                            itemCount: controller.rowItemclone.value.length,
                            itemBuilder: (context, index) {
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
                                    children: controller
                                        .rowItemclone.value[index]
                                        .map<Widget>((map) {
                                      return Column(
                                        children: [
                                          map['key'] == "Asset" ||
                                                  map['key'] == "Checklist"
                                              ? Column(
                                                  children: [
                                                    Row(children: [
                                                      Text('${map['key']!}: ',
                                                          style: Styles
                                                              .appDarkGrey12),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                            '${map['value']!}'
                                                            '',
                                                            style: Styles
                                                                .appDarkBlue12),
                                                      ),
                                                    ]),
                                                  ],
                                                )
                                              : (map['key'] == "executionDone")
                                                  ? Row(
                                                      children: [
                                                        Text('Executed by: ',
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              '${map['completed']!}'
                                                              '',
                                                              style: Styles
                                                                  .appDarkBlue12),
                                                        ),
                                                      ],
                                                    )
                                                  : Dimens.box0,
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TableActionButton(
                                                    color: ColorValues
                                                        .appDarkBlueColor,
                                                    icon: Icons.cyclone_sharp,
                                                    message: "Clone",
                                                    onPress: () {
                                                      controller.selectedItem =
                                                          null;
                                                      // controller.selectedItem =
                                                      //     controller
                                                      //         .scheduleCheckPoints
                                                      //         .firstWhere((element) =>
                                                      //             "${element.name}" ==
                                                      //             record[0]['value']
                                                      //                 .toString());
                                                      if (controller
                                                              .selectedItem !=
                                                          null) {
                                                        // controller.selectedItem!
                                                        //     .checklist_observation
                                                        //     ?.forEach((element) {
                                                        //   controller.rowItemobs.value
                                                        //       .add([
                                                        //     {
                                                        //       "key": "checkpoint",
                                                        //       "id":
                                                        //           '${element.execution_id}',
                                                        //       "value":
                                                        //           '${element.check_point_name}',
                                                        //     },
                                                        //     {
                                                        //       "key": "requirement",
                                                        //       "value":
                                                        //           '${element.requirement}'
                                                        //     },
                                                        //     {
                                                        //       'key': "weightage",
                                                        //       "value":
                                                        //           '${element.failure_waightage}'
                                                        //     },
                                                        //     {
                                                        //       'key': "cpok",
                                                        //       "value":
                                                        //           '${element.cp_ok.value}'
                                                        //     },
                                                        //     {
                                                        //       'key': "observation",
                                                        //       "value":
                                                        //           '${element.observation}'
                                                        //     },
                                                        //     {
                                                        //       'key': "uploadimg",
                                                        //       "value": ''
                                                        //     },
                                                        //     {
                                                        //       'key': "type",
                                                        //       'inpute_type':
                                                        //           '${element.check_point_type}',
                                                        //       "value":
                                                        //           '${element.type_text}',
                                                        //       "min":
                                                        //           '${element.min_range}',
                                                        //       "max":
                                                        //           '${element.max_range}'
                                                        //     },
                                                        //     {
                                                        //       'key': "job_created",
                                                        //       "value":
                                                        //           '${element.linked_job_id.value}',
                                                        //     },
                                                        //   ]);
                                                        // });
                                                        // Get.dialog(
                                                        //     ObservationPmExecutionViewDialog());
                                                      }
                                                    }),
                                                Dimens.boxWidth20,
                                                TableActionButton(
                                                    color:
                                                        ColorValues.editColor,
                                                    icon: Icons.edit,
                                                    message: "Edit",
                                                    onPress: () {
                                                      controller.selectedItem =
                                                          null;
                                                      controller.rowItemobs
                                                          .value = [];
                                                      controller.selectedItem = controller
                                                          .scheduleCheckPoints
                                                          .firstWhere((element) =>
                                                              "${element.name}" ==
                                                              map['value']
                                                                  .toString());
                                                      if (controller
                                                              .selectedItem !=
                                                          null) {
                                                        controller.selectedItem!
                                                            .checklist_observation
                                                            ?.forEach(
                                                                (element) {
                                                          controller
                                                              .rowItemobs.value
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
                                                              "value": ''
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
                                                            },
                                                          ]);
                                                        });
                                                        showModalBottomSheet<
                                                                void>(
                                                            // context and builder are
                                                            // required properties in this widget
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return ObservationUpdateDialog();
                                                            });
                                                      }
                                                    })
                                              ]),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
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
                                      Get.offAllNamed(Routes.createMrs,
                                          arguments: {
                                            "whereUsedId": controller
                                                .pmtaskViewModel.value?.id,
                                            "activity": controller
                                                .pmtaskViewModel
                                                .value
                                                ?.plan_title,
                                            "whereUsed": 27,
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
                                //physics: const NeverScrollableScrollPhysics(),
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
                                // margin: EdgeInsets.only(left: 20),
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
                                //icon: Icons.up,
                                backgroundColor: ColorValues.updateColor,
                                text: "Update",
                                onPressed: () {
                                  controller.UpdatePMTaskExecution();
                                  // Get.dialog(
                                  //     CustonApproveRejectDialog(
                                  //   text: "Execution Update",
                                  //   controller: controller,
                                  //   buttonText: "Update",
                                  //   style: Styles
                                  //       .greenElevatedButtonStyle,
                                  //   onPressed: () {
                                  //     // controller
                                  //     //     .closePmTaskExecution();
                                  //     // Get.back();
                                  //   },
                                  // ));
                                },
                              ),
                            ),
                            Dimens.boxWidth10,
                            Container(
                              height: 35,
                              child: CustomElevatedButton(
                                  //  icon: Icons.close,
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
                                              Get.back(); // Close the dialog
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
                                                              element?.pmId !=
                                                                  0,
                                                        )
                                                        ?.status !=
                                                    323 &&
                                                controller.listMrsByTaskId!
                                                    .isNotEmpty &&
                                                controller.allTrue.value ==
                                                    false
                                            ? Get.defaultDialog(
                                                radius: 5,
                                                title: 'Alert',
                                                middleText:
                                                    'Please get Return MRS approved!',
                                                textConfirm: 'OK',
                                                onConfirm: () {
                                                  Get.back(); // Close the dialog
                                                },
                                                buttonColor:
                                                    ColorValues.appGreenColor,
                                                confirmTextColor: Colors.white,
                                              )
                                            : controller.closePmTaskExecution();
                                  }),
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
                                        // controller.clearStoreTaskData();
                                        // controller
                                        //     .clearStoreTaskActivityData();
                                        // controller
                                        //     .clearStoreTasktoActorData();
                                        // controller
                                        //     .clearStoreTaskWhereUsedData();
                                        // controller
                                        //     .clearStoreTaskfromActorData();

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

  ///////////
}
