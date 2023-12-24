import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_audit_plan/view_audit_plan_controller.dart';
import 'package:cmms/app/widgets/audit_reject_plan_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/pm_plan_approve_dialog.dart';
import 'package:cmms/app/widgets/reject_pm_plan_dialog.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/audit_approve_dialog.dart';

class ViewAuditPlanWeb extends StatefulWidget {
  ViewAuditPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAuditPlanWeb> createState() => _ViewAuditPlanWebState();
}

class _ViewAuditPlanWebState extends State<ViewAuditPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAuditPlanController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorValues.cardColor,
          body: Obx(
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
                      Text(
                        "DASHBOARD",
                        style: Styles.greyLight14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: controller.type.value == 3
                            ? Text(" / MIS", style: Styles.greyMediumLight12)
                            : Text(" / AUDIT", style: Styles.greyMediumLight12),
                      ),
                      controller.type.value == 3
                          ? Text(" / VIEW OBSERVATION PLAN",
                              style: Styles.greyMediumLight12)
                          : Text(" / VIEW aUDIT PLAN",
                              style: Styles.greyMediumLight12)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          width: Get.width * 7,
                          margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                          // height: Get.height,
                          child: Card(
                            color: ColorValues.cardColor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10, left: 10),
                                        child: Text(
                                          " View PM Plan",
                                          style: Styles.blackBold14,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 30,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () async {},
                                          text:
                                              "${controller.auditPlanDetailModel.value?.short_status ?? ""}",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Dimens.boxHeight15,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Audit ID :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            ' Plan Title :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Description :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Created By :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Approved By :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Checklist :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            ' Frequency Applied :',
                                            style: Styles.black17,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'AUD${controller.auditPlanDetailModel.value?.id ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.plan_number ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.description ?? ""}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.auditee_Emp_Name ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.auditor_Emp_Name ?? ""}',
                                              style: Styles.blue17),
                                          Text('', style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.frequencyApplicable ?? ""}',
                                              style: Styles.blue17),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Created At :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Approved At :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Schedule Date :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            ' Frequency Name : ',
                                            style: Styles.black17,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.schedule_Date ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.schedule_Date ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.schedule_Date ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.frequency ?? ''}',
                                              style: Styles.blue17),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight15,
                                // (controller.historyList != null &&
                                //         controller.historyList!.isNotEmpty)
                                //     ?
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height:
                                      ((controller.historyList?.length ?? 0) *
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
                                        padding: const EdgeInsets.all(8.0),
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
                                          historyList: controller.historyList,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                //  )
                                //  : //
                                //   Dimens.box0,
                                ,
                                Dimens.boxHeight35,
                                Row(
                                  children: [
                                    Spacer(),
                                    // Container(
                                    //   height: 45,
                                    //   child: CustomElevatedButton(
                                    //     backgroundColor: ColorValues.printColor,
                                    //     text: "Print",
                                    //     icon: Icons.print,
                                    //     onPressed: () {
                                    //       // Get.dialog(
                                    //       //     GoodsOrderApprovedDialog(
                                    //       //   id: controller.id,
                                    //       // ));
                                    //     },
                                    //   ),
                                    // ),
                                    //  Dimens.boxWidth10,
                                    controller.auditPlanDetailModel.value
                                                    ?.status ==
                                                421 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kPmPlanFeatureId &&
                                                        e.approve ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appGreenColor,
                                              text: "Approve",
                                              icon: Icons.add,
                                              onPressed: () {
                                                Get.dialog(AuditApprovedDialog(
                                                    // id: controller.pmPlanId.value,
                                                    ));
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    Dimens.boxWidth10,
                                    controller.auditPlanDetailModel.value
                                                    ?.status ==
                                                421 &&
                                            varUserAccessModel
                                                    .value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kPmPlanFeatureId &&
                                                        e.approve ==
                                                            UserAccessConstants
                                                                .kHaveApproveAccess)
                                                    .length >
                                                0
                                        ? Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.rejectColor,
                                              text: "Reject",
                                              icon: Icons.close,
                                              onPressed: () {
                                                Get.dialog(
                                                    AuditPlanRejectDialog());
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    Spacer()
                                  ],
                                ),
                                Dimens.boxHeight15,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Dimens.boxHeight40,
              ],
            ),
          ),
        );
      },
    );
  }
}
