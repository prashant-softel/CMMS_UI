import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/confirmation_dialog.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/reassign_veg_dialog.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/tbt_veg_dialog.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/veg_schedule_approve_dialog.dart';
import 'package:cmms/app/widgets/abandon_veg_execution.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/veg_excution_mobile_dialog.dart';
import 'package:cmms/app/widgets/vegetation_cleaning_execution_dialog.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/add_module_cleaning_execution/custom_confirmation_dialog.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/app/add_module_cleaning_execution/reassign_dailog.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/abandon_all_dialog.dart';

class VegExecutionMobile extends StatefulWidget {
  const VegExecutionMobile({Key? key}) : super(key: key);

  @override
  _VegExecutionMobileState createState() => _VegExecutionMobileState();
}

class _VegExecutionMobileState extends State<VegExecutionMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VegExecutionController>(
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
                                    value: (controller.vegExecutionDetailsModel
                                                .value?.planId !=
                                            null)
                                        ? "VC${controller.vegid}"
                                        : '',
                                  ),
                                  JobDetailField(
                                    title: 'Plan Title',
                                    value: controller.vegExecutionDetailsModel
                                            .value?.title ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: "Planned By",
                                    value: controller.vegExecutionDetailsModel
                                            .value?.plannedBy ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Planning Date Time',
                                    value: controller.vegExecutionDetailsModel
                                            .value?.plannedAt ??
                                        '',
                                  ),
                                ],
                              ),
                            ),

                            /// RIGHT COLUMN
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  JobDetailField(
                                    title: 'Task ID',
                                    value: 'VE${controller.vegexe}',
                                  ),
                                  JobDetailField(
                                    title: 'Frequency',
                                    value: controller.vegExecutionDetailsModel
                                            .value?.frequency ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Start Date Time',
                                    value: controller.vegExecutionDetailsModel
                                            .value?.scheduledDate ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Execution started by',
                                    value: controller.vegExecutionDetailsModel
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
                                                                        orElse: () => VegSchedules(
                                                                            status:
                                                                                -1))
                                                                    ?.permit_id ==
                                                                0 &&
                                                            controller
                                                                    .vegExecutionDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                722
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
                                                                        VegSchedules(
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
                                                                          .value!
                                                                          .id ??
                                                                      0);
                                                            })
                                                        : Dimens.box0,
                                                    //  record[9]['value'] == "Scheduled"
                                                    // controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 360
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => VegSchedules(
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
                                                                            VegSchedules(status: -1))
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
                                                              filterdData.ptw_tbt_done ==
                                                                      1
                                                                  ? Get.dialog<void>(CustomVegetationDialog(
                                                                      id: filterdData
                                                                              .scheduleId ??
                                                                          0,
                                                                      title: filterdData
                                                                          .scheduleId
                                                                          .toString(),
                                                                      starttype:
                                                                          1))
                                                                  : Get.dialog<void>(TbtDoneVegDialog(
                                                                      ptw_id:
                                                                          filterdData.permit_id ??
                                                                              0,
                                                                      id: controller
                                                                              .vegExecutionDetailsModel
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
                                                                    .firstWhere((e) => "${e?.scheduleId}" == record[0]['value'],
                                                                        orElse: () => VegSchedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                722 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => VegSchedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                384 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0]['value'],
                                                                        orElse: () => VegSchedules(status: -1))
                                                                    ?.status ==
                                                                732
                                                        ? TableActionButton(
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              Get.dialog(
                                                                VegetationExecutionDialog(
                                                                  scheduleId:
                                                                      filterdData!
                                                                          .scheduleId,
                                                                  cleaningDay:
                                                                      filterdData
                                                                          .cleaningDay,
                                                                ),
                                                              );
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
                                                                    .firstWhere((e) => "${e?.scheduleId}" == record[0]['value'],
                                                                        orElse: () => VegSchedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                722 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => VegSchedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                384 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0]['value'],
                                                                        orElse: () => VegSchedules(status: -1))
                                                                    ?.status ==
                                                                732
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
                                                              Get.dialog<void>(CustomVegetationDialog(
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
                                                            },
                                                            color: ColorValues
                                                                .closeColor, //Color.fromARGB(255, 70, 95, 57),
                                                            icon: Icons.close,
                                                            message: 'Close',
                                                          )
                                                        : Dimens.box0,
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => VegSchedules(
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
                                                                            VegSchedules(status: -1))
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
                                                    controller.listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () => VegSchedules(
                                                                            status:
                                                                                -1))
                                                                    ?.status ==
                                                                724 ||
                                                            controller
                                                                    .listSchedules!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            "${e?.scheduleId}" ==
                                                                            record[0][
                                                                                'value'],
                                                                        orElse: () =>
                                                                            VegSchedules(status: -1))
                                                                    ?.status ==
                                                                731
                                                        ? TableActionButton(
                                                            onPress: () {
                                                              var filterdData = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      record[0][
                                                                          'value']);
                                                              Get.dialog(VegetationExecutionDialog(
                                                                  scheduleId:
                                                                      filterdData!
                                                                          .scheduleId,
                                                                  cleaningDay:
                                                                      filterdData
                                                                          .cleaningDay,
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
                                                                        VegSchedules(
                                                                            status:
                                                                                -1))
                                                                ?.status ==
                                                            724
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
                                                                  CustomScheduleApproveRejectDialog(
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
                                                                        VegSchedules(
                                                                            status:
                                                                                -1))
                                                                ?.status ==
                                                            724
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
                                                                  CustomScheduleApproveRejectDialog(
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
                          children: [
                            Spacer(),
                            controller.vegExecutionDetailsModel.value?.status ==
                                        387 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kVegetationControlFeatureId &&
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
                                        Get.dialog<void>(
                                          AssignToVegDialog(
                                            id: controller
                                                    .vegExecutionDetailsModel
                                                    .value
                                                    ?.executionId ??
                                                0,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            controller.vegExecutionDetailsModel.value?.status ==
                                        721 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kVegetationControlFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 30,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.addNewColor,
                                      text: "Start",
                                      onPressed: () {
                                        Get.dialog<void>(
                                          CustomVegetationDialog(
                                            id: controller
                                                    .vegExecutionDetailsModel
                                                    .value
                                                    ?.executionId ??
                                                0,
                                            title: controller
                                                    .vegExecutionDetailsModel
                                                    .value
                                                    ?.title ??
                                                "",
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            Dimens.boxWidth10,
                            controller.vegExecutionDetailsModel.value
                                                ?.status ==
                                            722 &&
                                        varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kVegetationControlFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length >
                                            0 ||
                                    controller.vegExecutionDetailsModel.value?.status == 382 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id == UserAccessConstants.kVegetationControlFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0 ||
                                    controller.vegExecutionDetailsModel.value?.status == 368 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants.kVegetationControlFeatureId &&
                                                    e.edit == UserAccessConstants.kHaveEditAccess)
                                                .length >
                                            0
                                ? Container(
                                    height: 30,
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
                                                    'Please complete all the schedules',
                                                textConfirm: 'OK',
                                                onConfirm: () {
                                                  Get.back(); // Close the dialog
                                                },
                                                buttonColor:
                                                    ColorValues.appGreenColor,
                                                confirmTextColor: Colors.white,
                                              )
                                            : Get.dialog<void>(
                                                CustomVegetationDialog(
                                                  id: controller
                                                          .vegExecutionDetailsModel
                                                          .value
                                                          ?.executionId ??
                                                      0,
                                                  title: controller
                                                          .vegExecutionDetailsModel
                                                          .value
                                                          ?.title ??
                                                      "",
                                                  starttype: 3,
                                                ),
                                              );
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            Dimens.boxWidth10,
                            controller.vegExecutionDetailsModel.value?.status ==
                                            722 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kVegetationControlFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0 &&
                                        controller.allScheduleTrue.value ==
                                            false ||
                                    controller.vegExecutionDetailsModel.value
                                                ?.status ==
                                            368 &&
                                        varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kVegetationControlFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0 &&
                                        controller.allScheduleTrue.value ==
                                            false
                                ? Container(
                                    height: 30,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 244, 116, 248),
                                      text: "Abandoned All",
                                      onPressed: () {
                                        Get.dialog(
                                          AbandonVegExecutionDialog(
                                            id: controller.vegexe.value,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            Dimens.boxWidth5,
                            Container(
                              height: 28,
                              child: CustomElevatedButton(
                                icon: Icons.print,
                                backgroundColor: ColorValues.linktopermitColor,
                                text: "Print",
                                onPressed: () {
                                  controller.generateInvoice();
                                },
                              ),
                            ),
                            Dimens.boxWidth5,
                            controller.vegExecutionDetailsModel.value?.status ==
                                        724 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kVegetationControlFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 30,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.approveColor,
                                      text: "Approve",
                                      onPressed: () {
                                        Get.dialog(
                                          CustomScheduleApproveRejectDialog(
                                            text: "Execution Approve",
                                            controller: controller,
                                            buttonText: "Approve",
                                            style:
                                                Styles.greenElevatedButtonStyle,
                                            onPressed: () {
                                              controller.endApproveExecution(
                                                controller
                                                        .vegExecutionDetailsModel
                                                        .value
                                                        ?.executionId ??
                                                    0,
                                              );
                                              Get.back();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            Dimens.boxWidth10,
                            controller.vegExecutionDetailsModel.value?.status ==
                                        724 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kVegetationControlFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 30,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.cancelColor,
                                      text: "Reject",
                                      onPressed: () {
                                        Get.dialog(
                                          CustomScheduleApproveRejectDialog(
                                            text: "Execution Reject",
                                            controller: controller,
                                            buttonText: "Reject",
                                            style: Styles
                                                .darkRedElevatedButtonStyle,
                                            onPressed: () {
                                              controller.endRejectExecution(
                                                controller
                                                        .vegExecutionDetailsModel
                                                        .value
                                                        ?.executionId ??
                                                    0,
                                              );
                                              Get.back();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Dimens.box0,
                            controller.vegExecutionDetailsModel.value?.status ==
                                        725 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kVegetationControlFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 30,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.approveColor,
                                      text: "Approve",
                                      onPressed: () {
                                        Get.dialog(
                                            CustomScheduleApproveRejectDialog(
                                          text: "Abandoned Approve",
                                          controller: controller,
                                          buttonText: "Approve",
                                          style:
                                              Styles.greenElevatedButtonStyle,
                                          onPressed: () {
                                            controller.abandonedApproveExecution(
                                                controller
                                                        .vegExecutionDetailsModel
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
                            controller.vegExecutionDetailsModel.value?.status ==
                                        725 &&
                                    varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kVegetationControlFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0
                                ? Container(
                                    height: 30,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.cancelColor,
                                      text: "Reject",
                                      onPressed: () {
                                        Get.dialog(
                                            CustomScheduleApproveRejectDialog(
                                          text: "Abandoned Reject",
                                          controller: controller,
                                          buttonText: "Reject",
                                          style:
                                              Styles.darkRedElevatedButtonStyle,
                                          onPressed: () {
                                            controller.abandoneRejectExecution(
                                                controller
                                                        .vegExecutionDetailsModel
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
                            Spacer(),
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
