import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/widgets/add_module_cleaning_execution_mobile_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/add_module_cleaning_execution/custom_confirmation_dialog.dart';
import 'package:cmms/app/add_module_cleaning_execution/tbt_done_mc_dialog.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/app/add_module_cleaning_execution/reassign_dailog.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/abandon_all_dialog.dart';

class McExecutionMobile extends StatefulWidget {
  const McExecutionMobile({Key? key}) : super(key: key);

  @override
  _McExecutionMobileState createState() => _McExecutionMobileState();
}

class _McExecutionMobileState extends State<McExecutionMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddModuleCleaningExecutionController>(
      id: "module-cleaning-mobile",
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Column(
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
                                    title: 'Plan Id',
                                    value: (controller.mcExecutionDetailsModel
                                                .value?.id !=
                                            null)
                                        ? "MCP${controller.planId}"
                                        : '',
                                  ),
                                  JobDetailField(
                                    title: 'Plan Title',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.title ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: "Planned By",
                                    value: controller.mcExecutionDetailsModel
                                            .value?.plannedBy ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Planning Date Time',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.plannedAt ??
                                        '',
                                  ),
                                ],
                              ),
                            ),
                            Dimens.boxWidth10,

                            /// RIGHT COLUMN
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  JobDetailField(
                                    title: 'Task ID',
                                    value: 'MCT${controller.mcid}',
                                  ),
                                  JobDetailField(
                                    title: 'Frequency',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.frequency ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Start Date Time',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.startDate ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Execution started by',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.startedBy
                                            .toString() ??
                                        '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Schedule Execution",
                          style: Styles.blue700,
                        ),
                        Container(
                          width: Get.width,
                          child: Obx(
                            () => Container(
                              margin: Dimens.edgeInsets10,
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
                                    controller.rowItem.value.map((record) {
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                mapData['key'] ?? '',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              if (mapData['key'] == "Actions")
                                                Wrap(
                                                  children: [
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => Schedules(
                                                                            status:
                                                                                -1))
                                                                    ?.permit_id ==
                                                                0 &&
                                                            controller
                                                                    .mcExecutionDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                361
                                                        ? TableActionButton(
                                                            // label: 'Equipments',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);

                                                              controller.createNewPermit(
                                                                  scheduleID:
                                                                      filterdData
                                                                          ?.scheduleId);
                                                            },
                                                            color: ColorValues
                                                                .appDarkBlueColor,
                                                            icon: Icons.add,
                                                            message:
                                                                'Create New Permit',
                                                          )
                                                        : Dimens.box0,
                                                    controller
                                                                .listSchedules!
                                                                .firstWhere(
                                                                    (e) =>
                                                                        "${e?.scheduleId}" ==
                                                                        record[0]
                                                                            [
                                                                            'value'],
                                                                    orElse: () =>
                                                                        Schedules(
                                                                            status:
                                                                                -1))
                                                                ?.permit_id !=
                                                            0
                                                        ? TableActionButton(
                                                            color: ColorValues
                                                                .appLightBlueColor,
                                                            icon: Icons
                                                                .remove_red_eye,
                                                            message:
                                                                "View Permit",
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              controller
                                                                  .clearTypeStoreData();
                                                              controller
                                                                  .clearPermitStoreData();
                                                              controller.viewNewPermitList(
                                                                  permitId:
                                                                      filterdData
                                                                          ?.permit_id,
                                                                  jobId: controller
                                                                          .jobDetailsModel
                                                                          .value!
                                                                          .id ??
                                                                      0);
                                                            })
                                                        : Dimens.box0,
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => Schedules(
                                                                            status:
                                                                                -1))
                                                                    ?.ptw_status ==
                                                                124 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () =>
                                                                            Schedules(status: -1))
                                                                    ?.ptw_status ==
                                                                132

                                                        // controller.pmtaskViewModel.value?.ptw_status == 124 || controller.pmtaskViewModel.value?.ptw_status == 132
                                                        ? TableActionButton(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    116,
                                                                    78,
                                                                    130),
                                                            icon:
                                                                Icons.ads_click,
                                                            message:
                                                                'Re-Submit Permit',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);

                                                              controller.editNewPermit(
                                                                  permitId:
                                                                      filterdData
                                                                          ?.permit_id,
                                                                  isChecked:
                                                                      false
                                                                  // controller
                                                                  //     .isChecked
                                                                  //     .value
                                                                  );
                                                            },
                                                          )
                                                        : Dimens.box0,
                                                    //  record[9]['value'] == "Scheduled"
                                                    // controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 360
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => Schedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                370 &&
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () =>
                                                                            Schedules(status: -1))
                                                                    ?.ptw_status ==
                                                                125
                                                        ? TableActionButton(
                                                            // label: 'Start',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);

                                                              print(
                                                                  'filteredData:${filterdData!.scheduleId}');
                                                              //  selectedData = filterdData;
                                                              filterdData.ptw_tbt_done ==
                                                                      1
                                                                  ? Get.dialog<void>(CustomCalibrationDialog(
                                                                      id: filterdData
                                                                              .scheduleId ??
                                                                          0,
                                                                      title: filterdData
                                                                          .scheduleId
                                                                          .toString(),
                                                                      starttype:
                                                                          1))
                                                                  //controller.startMCExecutionScheduleButton(scheduleID: filterdData.scheduleId)
                                                                  : Get.dialog<void>(TbtDoneMcDialog(
                                                                      ptw_id:
                                                                          filterdData.permit_id ??
                                                                              0,
                                                                      id: controller
                                                                              .mcExecutionDetailsModel
                                                                              .value
                                                                              ?.executionId ??
                                                                          0));
                                                              // print({
                                                              //   'scheduledata:':
                                                              //       filterdData.scheduleId
                                                              // });
                                                            },
                                                            color: ColorValues
                                                                .startColor,
                                                            icon: Icons.start,
                                                            message: 'Start',
                                                          )
                                                        : Dimens.box0,

                                                    // controller.listSchedules!
                                                    //             .firstWhere(
                                                    //               (e) => "${e?.status_short}" == e?.status_short,
                                                    //               orElse: () => Schedules(status_short: ""),
                                                    //             )
                                                    //             ?.status_short ==
                                                    //         "Completed"
                                                    //     ?
                                                    // TableActionButton(
                                                    //   onPress: () {
                                                    //     // Get.dialog(AddModuleCleaningExecutionMobileDialog());
                                                    //     var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                    //     controller.updateMCScheduleExecution(scheduleId: filterdData?.scheduleId, cleaningDay: filterdData?.cleaningDay, waterUsed: filterdData?.waterUsed);
                                                    //     // print({"filteredData:${filterdData?.scheduleId}"});
                                                    //     // print({"filteredData:${filterdData!.cleaningDay}"});
                                                    //     // print({"filteredData:${filterdData.waterUsed}"});
                                                    //   },
                                                    //   color: ColorValues.appLightBlueColor,
                                                    //   icon: Icons.add,
                                                    //   message: 'Update',
                                                    // ),
                                                    // : Dimens.box0,

                                                    ///Abandon
                                                    // controller.listSchedules!
                                                    //             .firstWhere(
                                                    //               (e) => "${e?.status_short}" == e?.status_short,
                                                    //               orElse: () => Schedules(status_short: ""),
                                                    //             )
                                                    //             ?.status_short ==
                                                    //         "In Progress"
                                                    //     ?
                                                    // controller.mcExecutionDetailsModel.value?.status == 361
                                                    //     ? TableActionButton(
                                                    //         // label: 'Abandon',
                                                    //         onPress: () {
                                                    //           var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                    //           controller.scheduledId = filterdData?.scheduleId;
                                                    //           print({'Executiondata:': filterdData?.executionId});
                                                    //           Get.dialog(AbandoneScheduleExecutionDialog(
                                                    //             id: filterdData?.executionId,
                                                    //           ));
                                                    //         },
                                                    //         color: Colors.red,
                                                    //         icon: Icons.close,
                                                    //         message: 'Abandon',
                                                    //       )
                                                    //     : Dimens.box0,

                                                    // controller.listSchedules!
                                                    //             .firstWhere(
                                                    //               (e) => "${e?.status_short}" == e?.status_short,
                                                    //               orElse: () => Schedules(status_short: ""),
                                                    //             )
                                                    //             ?.status_short ==
                                                    //         "In Progress"
                                                    //     ?
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => Schedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                361 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () =>
                                                                            Schedules(status: -1))
                                                                    ?.status ==
                                                                384
                                                        ? TableActionButton(
                                                            // label: 'Equipments',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);

                                                              Get.dialog(
                                                                  AddModuleCleaningExecutionMobileDialog(
                                                                scheduleId:
                                                                    filterdData!
                                                                        .scheduleId,
                                                                cleaningDay:
                                                                    filterdData
                                                                        .cleaningDay,
                                                                waterUsed:
                                                                    filterdData
                                                                        .waterUsed,
                                                              ));
                                                            },
                                                            color: ColorValues
                                                                .appDarkBlueColor,
                                                            icon:
                                                                Icons.category,
                                                            message:
                                                                'Equipments',
                                                          )
                                                        : Dimens.box0,
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => Schedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                361 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () =>
                                                                            Schedules(status: -1))
                                                                    ?.status ==
                                                                384
                                                        ? TableActionButton(
                                                            // label: 'Start',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);

                                                              print(
                                                                  'filteredData:${filterdData!.scheduleId}');
                                                              //  selectedData = filterdData;
                                                              Get.dialog<void>(CustomCalibrationDialog(
                                                                  id: filterdData
                                                                          .scheduleId ??
                                                                      0,
                                                                  ptw_id: filterdData
                                                                      .permit_id,
                                                                  title: filterdData
                                                                      .scheduleId
                                                                      .toString(),
                                                                  starttype:
                                                                      2));
                                                              // print({
                                                              //   'scheduledata:':
                                                              //       filterdData.scheduleId
                                                              // });
                                                            },
                                                            color: ColorValues
                                                                .closeColor, //Color.fromARGB(255, 70, 95, 57),
                                                            icon: Icons.close,
                                                            message: 'Close',
                                                          )
                                                        : Dimens.box0,
                                                    controller.listSchedules!
                                                                    .firstWhere((e) => "${e?.scheduleId}" == record[0]['value'],
                                                                        orElse: () => Schedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                383 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere((e) => "${e?.scheduleId}" == record[0]['value'],
                                                                        orElse: () => Schedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                363 ||
                                                            controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.ptw_status ==
                                                                    125 &&
                                                                controller
                                                                        .listSchedules!
                                                                        .firstWhere(
                                                                            (e) => "${e?.scheduleId}" == record[0]['value'],
                                                                            orElse: () => Schedules(status: -1))
                                                                        ?.status ==
                                                                    364
                                                        ? TableActionButton(
                                                            // label: 'Equipments',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);

                                                              Get.dialog(AddModuleCleaningExecutionMobileDialog(
                                                                  scheduleId:
                                                                      filterdData!
                                                                          .scheduleId,
                                                                  cleaningDay:
                                                                      filterdData
                                                                          .cleaningDay,
                                                                  waterUsed:
                                                                      filterdData
                                                                          .waterUsed,
                                                                  is_view: 1));
                                                            },
                                                            color: ColorValues
                                                                .appDarkBlueColor,
                                                            icon: Icons
                                                                .remove_red_eye,
                                                            message: 'View',
                                                          )
                                                        : Dimens.box0,
                                                    controller.listSchedules!
                                                                .firstWhere(
                                                                    (e) =>
                                                                        "${e?.scheduleId}" ==
                                                                        record[0]
                                                                            [
                                                                            'value'],
                                                                    orElse: () =>
                                                                        Schedules(
                                                                            status:
                                                                                -1))
                                                                ?.status ==
                                                            363
                                                        ? TableActionButton(
                                                            // label: 'Equipments',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              Get.dialog(
                                                                  CustonApproveRejectDialog(
                                                                text:
                                                                    "Schedule Approve",
                                                                controller:
                                                                    controller,
                                                                buttonText:
                                                                    "Approve",
                                                                style: Styles
                                                                    .greenElevatedButtonStyle,
                                                                onPressed: () {
                                                                  controller.approveShecduleExecution(
                                                                      filterdData
                                                                              ?.scheduleId ??
                                                                          0);
                                                                  Get.back();
                                                                },
                                                              ));
                                                            },
                                                            color: ColorValues
                                                                .approveColor,
                                                            icon: Icons.check,
                                                            message: 'Approve',
                                                          )
                                                        : Dimens.box0,
                                                    controller.listSchedules!
                                                                .firstWhere(
                                                                    (e) =>
                                                                        "${e?.scheduleId}" ==
                                                                        record[0]
                                                                            [
                                                                            'value'],
                                                                    orElse: () =>
                                                                        Schedules(
                                                                            status:
                                                                                -1))
                                                                ?.status ==
                                                            363
                                                        ? TableActionButton(
                                                            // label: 'Equipments',
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              Get.dialog(
                                                                  CustonApproveRejectDialog(
                                                                text:
                                                                    "Schedule Reject",
                                                                controller:
                                                                    controller,
                                                                buttonText:
                                                                    "Reject",
                                                                style: Styles
                                                                    .darkRedElevatedButtonStyle,
                                                                onPressed: () {
                                                                  controller.rejectShecduleExecution(
                                                                      filterdData
                                                                              ?.scheduleId ??
                                                                          0);
                                                                  Get.back();
                                                                },
                                                              ));
                                                            },
                                                            color: ColorValues
                                                                .rejectColor,
                                                            icon: Icons.close,
                                                            message: 'Reject',
                                                          )
                                                        : Dimens.box0,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.mcExecutionDetailsModel.value?.status ==
                                        387 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kModuleCleaningexeFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveAddAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.blueColor,
                                      text: "Re-assign",
                                      onPressed: () {
                                        Get.dialog<void>(AssignToMcDialog(
                                          id: controller.mcExecutionDetailsModel
                                                  .value?.executionId ??
                                              0,
                                        ));

                                        // controller
                                        //     .startMCExecutionButton();
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            Dimens.boxWidth10,
                            controller.mcExecutionDetailsModel.value?.status ==
                                        360 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kModuleCleaningexeFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.addNewColor,
                                      text: "Start",
                                      onPressed: () {
                                        Get.dialog<void>(
                                            CustomCalibrationDialog(
                                          id: controller.mcExecutionDetailsModel
                                                  .value?.executionId ??
                                              0,
                                          title: controller
                                                  .mcExecutionDetailsModel
                                                  .value
                                                  ?.title ??
                                              "",
                                        ));

                                        // controller
                                        //     .startMCExecutionButton();
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            // : Container(),

                            Dimens.boxWidth10,

                            controller.mcExecutionDetailsModel.value?.status ==
                                            361 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0 ||
                                    controller.mcExecutionDetailsModel.value?.status == 382 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0 ||
                                    controller.mcExecutionDetailsModel.value?.status == 368 &&
                                        varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length > 0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.cancelColor,
                                      text: "Close",
                                      onPressed: () {
                                        controller.allScheduleTrue.value ==
                                                false
                                            ? Get.defaultDialog(
                                                radius: 5,
                                                title: 'Alert',
                                                middleText:
                                                    'Please complete the all schedules',
                                                textConfirm: 'OK',
                                                onConfirm: () {
                                                  Get.back(); // Close the dialog
                                                },
                                                buttonColor:
                                                    ColorValues.appGreenColor,
                                                confirmTextColor: Colors.white,
                                              )
                                            : Get.dialog<void>(CustomCalibrationDialog(
                                                id: controller
                                                        .mcExecutionDetailsModel
                                                        .value
                                                        ?.executionId ??
                                                    0,
                                                title: controller
                                                        .mcExecutionDetailsModel
                                                        .value
                                                        ?.title ??
                                                    "",
                                                starttype: 3));

                                        // Get.dialog(EndMCExecutionDialog());
                                      },
                                    ),
                                  )
                                : Dimens.box0,

                            // SizedBox(
                            //   width: 10,
                            // ),
                            Dimens.boxWidth10,

                            controller.mcExecutionDetailsModel.value?.status ==
                                            361 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kModuleCleaningexeFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0 ||
                                    controller.mcExecutionDetailsModel.value
                                                ?.status ==
                                            368 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kModuleCleaningexeFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 244, 116, 248),
                                      text: "Abandoned All",
                                      onPressed: () {
                                        Get.dialog(AbandonAllDialog(
                                            id: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.executionId));

                                        // controller
                                        //     .createEscalationMatrix();
                                      },
                                    ),
                                  )
                                : Dimens.box0,

                            controller.mcExecutionDetailsModel.value?.status ==
                                        363 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kModuleCleaningexeFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.approveColor,
                                      text: "Approve",
                                      onPressed: () {
                                        Get.dialog(CustonApproveRejectDialog(
                                          text: "Execution Approve",
                                          controller: controller,
                                          buttonText: "Approve",
                                          style:
                                              Styles.greenElevatedButtonStyle,
                                          onPressed: () {
                                            controller.endApproveExecution(
                                                controller
                                                        .mcExecutionDetailsModel
                                                        .value
                                                        ?.executionId ??
                                                    0);
                                            Get.back();
                                          },
                                        ));

                                        // Get.dialog(EndMCExecutionDialog());
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            Dimens.boxWidth10,
                            controller.mcExecutionDetailsModel.value?.status ==
                                        363 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kModuleCleaningexeFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.cancelColor,
                                      text: "Reject",
                                      onPressed: () {
                                        Get.dialog(CustonApproveRejectDialog(
                                          text: "Execution Reject",
                                          controller: controller,
                                          buttonText: "Reject",
                                          style:
                                              Styles.darkRedElevatedButtonStyle,
                                          onPressed: () {
                                            controller.endRejectExecution(
                                                controller
                                                        .mcExecutionDetailsModel
                                                        .value
                                                        ?.executionId ??
                                                    0);
                                            Get.back();
                                          },
                                        ));

                                        // Get.dialog(EndMCExecutionDialog());
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            controller.mcExecutionDetailsModel.value?.status ==
                                        364 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kModuleCleaningexeFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.approveColor,
                                      text: "Approve",
                                      onPressed: () {
                                        Get.dialog(CustonApproveRejectDialog(
                                          text: "Abandoned Approve",
                                          controller: controller,
                                          buttonText: "Approve",
                                          style:
                                              Styles.greenElevatedButtonStyle,
                                          onPressed: () {
                                            controller.abandonedApproveExecution(
                                                controller
                                                        .mcExecutionDetailsModel
                                                        .value
                                                        ?.executionId ??
                                                    0);
                                            Get.back();
                                          },
                                        ));

                                        // Get.dialog(EndMCExecutionDialog());
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            Dimens.boxWidth10,
                            controller.mcExecutionDetailsModel.value?.status ==
                                        364 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kModuleCleaningexeFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 28,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.cancelColor,
                                      text: "Reject",
                                      onPressed: () {
                                        Get.dialog(CustonApproveRejectDialog(
                                          text: "Abandoned Reject",
                                          controller: controller,
                                          buttonText: "Reject",
                                          style:
                                              Styles.darkRedElevatedButtonStyle,
                                          onPressed: () {
                                            controller.abandoneRejectExecution(
                                                controller
                                                        .mcExecutionDetailsModel
                                                        .value
                                                        ?.executionId ??
                                                    0);
                                            Get.back();
                                          },
                                        ));

                                        // Get.dialog(EndMCExecutionDialog());
                                      },
                                    ),
                                  )
                                : Dimens.box0,

                            //           varUserAccessModel.value.access_list!
                            // .where((e) => e.feature_id == 3 && e.edit == 1)
                            // .length > 0
                            // &&
                            // controller.incidentReportDetailsModel
                            //             .value?.id !=
                            //         null
                            //     ? CustomElevatedButton(
                            //         icon: Icons.edit,
                            //         backgroundColor: Colors.green,
                            //         onPressed: () {
                            //           // controller.saveAsDraft();
                            //           controller.editIncidentReport(
                            //               id: controller
                            //                   .incidentReportDetailsModel
                            //                   .value
                            //                   ?.id);
                            //         },
                            //         text: 'Edit',
                            //       )
                            //     : Container()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
