import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/add_module_cleaning_execution/custom_confirmation_dialog.dart';
import 'package:cmms/app/add_module_cleaning_execution/tbt_done_mc_dialog.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/add_module_cleaning_execution_dialog.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';

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
                                            .value?.plannedBy ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Planning Date Time',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.abandonedBy
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
                                                                  .clearPermitStoreData();
                                                              controller.viewNewPermitList(
                                                                  permitId:
                                                                      filterdData
                                                                          ?.permit_id,
                                                                  jobId: controller
                                                                          .jobDetailsModel
                                                                          .value
                                                                          ?.id ??
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
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              filterdData!.ptw_tbt_done ==
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
                                                                  : Get.dialog<void>(TbtDoneMcDialog(
                                                                      ptw_id:
                                                                          filterdData.permit_id ??
                                                                              0,
                                                                      id: controller
                                                                              .mcExecutionDetailsModel
                                                                              .value
                                                                              ?.executionId ??
                                                                          0));
                                                            },
                                                            color: ColorValues
                                                                .startColor,
                                                            icon: Icons.start,
                                                            message: 'Start',
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
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              Get.dialog(AddModuleCleaningExecutionDialog(
                                                                  scheduleId:
                                                                      filterdData!
                                                                          .scheduleId,
                                                                  cleaningDay:
                                                                      filterdData
                                                                          .cleaningDay,
                                                                  waterUsed:
                                                                      filterdData
                                                                          .waterUsed));
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
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              Get.dialog<void>(CustomCalibrationDialog(
                                                                  id: filterdData!
                                                                          .scheduleId ??
                                                                      0,
                                                                  ptw_id: filterdData
                                                                      .permit_id,
                                                                  title: filterdData
                                                                      .scheduleId
                                                                      .toString(),
                                                                  starttype:
                                                                      2));
                                                            },
                                                            color: ColorValues
                                                                .closeColor,
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
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              Get.dialog(AddModuleCleaningExecutionDialog(
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
