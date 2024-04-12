import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/mrs_view/mrs_view_controller.dart';
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

import '../../../domain/models/get_asset_items_model.dart';
import '../../utils/user_access_constants.dart';

class MrsViewContentMobile extends GetView<MrsViewController> {
  MrsViewContentMobile({Key? key}) : super(key: key);

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
      child: (controller.mrsDetailsModel.value != null)
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
                                        value: (controller.mrsDetailsModel.value
                                                    ?.id !=
                                                null)
                                            ? "PMT${controller.mrsDetailsModel.value?.id.toString() ?? ''}"
                                            : '',
                                      ),
                                      JobDetailField(
                                        title: 'Task Title',
                                        value: controller.mrsDetailsModel.value
                                                ?.activity ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: "Equipment Category",
                                        value: controller.mrsDetailsModel.value
                                                ?.activity ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: 'Done Date',
                                        value: controller
                                                .mrsDetailsModel.value?.activity
                                                .toString() ??
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
                                        value: controller.mrsDetailsModel.value
                                                ?.activity ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Assigned To',
                                        value: controller.mrsDetailsModel.value
                                                ?.activity ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: 'Last Done Date',
                                        value: controller.mrsDetailsModel.value
                                                ?.activity ??
                                            'null',
                                      ),
                                      JobDetailField(
                                        title: 'Due Date',
                                        value: controller.mrsDetailsModel.value
                                                ?.activity ??
                                            '',
                                      ),
                                    ]),
                              ),
                            ]),
                        ListView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                controller.mrsDetailsModel.value!.cmmrsItems !=
                                        null
                                    ? controller.mrsDetailsModel.value!
                                        .cmmrsItems!.length
                                    : 0,
                            itemBuilder: (context, index) {
                              final mrsViewModel = (controller
                                          .mrsDetailsModel.value!.cmmrsItems !=
                                      null)
                                  ? controller
                                      .mrsDetailsModel.value!.cmmrsItems![index]
                                  : GetAssetItemsModel();
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
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Text('MRS ID: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  '${mrsViewModel?.asset_name}'
                                                  '',
                                                  style: Styles.appDarkBlue12),
                                            ),
                                          ]),
                                          Row(//
                                              children: [
                                            Text("MRS Items List: ",
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  mrsViewModel?.asset_name ??
                                                      '',
                                                  style: Styles.appDarkBlue12),
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
                                                  mrsViewModel?.asset_name ??
                                                      '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(//
                                              children: [
                                            Container(
                                              padding: Dimens.edgeInsets8_2_8_2,
                                              decoration: BoxDecoration(
                                                color: ColorValues.editColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                'Edit',
                                                style: Styles.white10.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              padding: Dimens.edgeInsets8_2_8_2,
                                              decoration: BoxDecoration(
                                                color: ColorValues.viewColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                'View',
                                                style: Styles.white10.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ]),
                                  ),
                                ),
                              );
                            }),
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
                              controller.mrsDetailsModel.value?.status == 161
                                  ? Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        // icon: Icons.link,
                                        backgroundColor: ColorValues.blueColor,
                                        text: "Assign",
                                        onPressed: () {
                                          Get.dialog<void>(AssignToPMTaskDialog(
                                              id: controller.mrsDetailsModel
                                                      .value?.id ??
                                                  0));
                                          //controller.printScreen();
                                        },
                                      ),
                                    )
                                  : Dimens.box0,
                              Dimens.boxWidth10,
                              // controller.mrsDetailsModel.value?.status == 161
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
                              controller.mrsDetailsModel.value?.status == 167 &&
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
                                          // controller.setPmTask();
                                        },
                                      ),
                                    )
                                  : Dimens.box0,

                              controller.mrsDetailsModel.value?.status ==
                                              164 &&
                                          varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kPmTaskFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length >
                                              0 ||
                                      controller.mrsDetailsModel.value?.status == 166 &&
                                          varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id == UserAccessConstants.kPmTaskFeatureId &&
                                                      e.add ==
                                                          UserAccessConstants
                                                              .kHaveAddAccess)
                                                  .length >
                                              0 ||
                                      controller.mrsDetailsModel.value?.status == 168 &&
                                          varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id ==
                                                          UserAccessConstants.kPmTaskFeatureId &&
                                                      e.add == UserAccessConstants.kHaveAddAccess)
                                                  .length >
                                              0
                                  ? Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        icon: Icons.remove_red_eye_outlined,
                                        backgroundColor:
                                            ColorValues.linktopermitColor,
                                        text: "Execute",
                                        onPressed: () {
                                          //  controller.gotoexecution();
                                        },
                                      ),
                                    )
                                  : Dimens.box0,
                              Dimens.boxWidth10,
                              controller.mrsDetailsModel.value?.status == 162 &&
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
                                      controller.mrsDetailsModel.value
                                                  ?.status ==
                                              161 &&
                                          varUserAccessModel.value.access_list!
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
                                          // controller.createNewPermit();
                                        },
                                      ),
                                    )
                                  : Dimens.box0,
                              Dimens.boxWidth10,

                              controller.mrsDetailsModel.value?.status == 165 &&
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
                                          Get.dialog(CustonApproveRejectDialog(
                                            text: "Execution Approve",
                                            controller: controller,
                                            buttonText: "Approve",
                                            style:
                                                Styles.greenElevatedButtonStyle,
                                            onPressed: () {
                                              // controller
                                              //     .approvePmTaskExecution();
                                              Get.back();
                                            },
                                          ));
                                        },
                                      ),
                                    )
                                  : Dimens.box0,
                              Dimens.boxWidth10,
                              controller.mrsDetailsModel.value?.status == 165 &&
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
                                          Get.dialog(CustonApproveRejectDialog(
                                            text: "Execution Reject",
                                            controller: controller,
                                            buttonText: "Reject",
                                            style:
                                                Styles.redElevatedButtonStyle,
                                            onPressed: () {
                                              // controller
                                              //     .rejectPmTaskExecution();
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
                      ]),
                ),
              ),
            )
          : Dimens.box0,
    );
  }

  ///////////
}
