import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_audit_plan/view_audit_plan_controller.dart';
import 'package:cmms/app/widgets/audit_reject_plan_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:data_table_2/data_table_2.dart';

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
        return SelectionArea(
          child: Scaffold(
            backgroundColor: ColorValues.cardColor,
            body: Obx(
              () => Column(
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
                          color: Color.fromARGB(255, 236, 234, 234)
                              .withOpacity(0.5),
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
                            Get.offAllNamed(
                                '${Routes.auditListScreen}/${controller.type.value}');
                          },
                          child: controller.type.value == AppConstants.kMis
                              ? Text(" / MIS", style: Styles.greyLight14)
                              : controller.type.value ==
                                      AppConstants.kEvaluation
                                  ? Text(" / EVALUATION LIST",
                                      style: Styles.greyLight14)
                                  : Text(" / AUDIT LIST",
                                      style: Styles.greyLight14),
                        ),
                        controller.type.value == AppConstants.kMis
                            ? Text(" / VIEW OBSERVATION PLAN",
                                style: Styles.greyLight14)
                            : controller.type.value == AppConstants.kEvaluation
                                ? Text(" / VIEW EVALUATION PLAN",
                                    style: Styles.greyLight14)
                                : Text(" / VIEW AUDIT PLAN",
                                    style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Card(
                            margin:
                                EdgeInsets.only(left: 20, top: 10, right: 20),
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
                                          controller.type.value ==
                                                  AppConstants.kMis
                                              ? "View MIS Plan"
                                              : controller.type.value ==
                                                      AppConstants.kEvaluation
                                                  ? "View Evaluation Plan"
                                                  : " View Audit Plan",
                                          style: Styles.blackBold14,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 30,
                                        child: CustomElevatedButton(
                                          backgroundColor: controller
                                                      .auditPlanDetailModel
                                                      .value
                                                      ?.status ==
                                                  421
                                              ? ColorValues.appDarkBlueColor
                                              : controller.auditPlanDetailModel
                                                          .value?.status ==
                                                      424
                                                  ? ColorValues
                                                      .rejectedStatusColor
                                                  : controller.auditPlanDetailModel
                                                              .value?.status ==
                                                          422
                                                      ? ColorValues.startColor
                                                      : controller
                                                                  .auditPlanDetailModel
                                                                  .value
                                                                  ?.status ==
                                                              425
                                                          ? ColorValues
                                                              .approveStatusColor
                                                          : controller
                                                                      .auditPlanDetailModel
                                                                      .value
                                                                      ?.status ==
                                                                  429
                                                              ? ColorValues
                                                                  .closeColor
                                                              : controller
                                                                          .auditPlanDetailModel
                                                                          .value
                                                                          ?.status ==
                                                                      430
                                                                  ? ColorValues
                                                                      .rejectedStatusColor
                                                                  : controller
                                                                              .auditPlanDetailModel
                                                                              .value
                                                                              ?.status ==
                                                                          431
                                                                      ? ColorValues
                                                                          .appLightBlueColor
                                                                      : controller.auditPlanDetailModel.value?.status == 426
                                                                          ? ColorValues.skyBlueColor
                                                                          : controller.auditPlanDetailModel.value?.status == 427
                                                                              ? ColorValues.rejectedStatusColor
                                                                              : ColorValues.addNewColor,
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
                                            controller.type.value ==
                                                    AppConstants.kMis
                                                ? "MIS ID :"
                                                : controller.type.value ==
                                                        AppConstants.kEvaluation
                                                    ? "Evaluation ID :"
                                                    : 'Audit ID :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Plan Title :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Description :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            ' Frequency :',
                                            style: Styles.black17,
                                          ),
                                          controller.type.value ==
                                                  AppConstants.kEvaluation
                                              ? Text(
                                                  'Max Score :',
                                                  style: Styles.black17,
                                                )
                                              : Dimens.box0,
                                          controller.type ==
                                                  AppConstants.kEvaluation
                                              ? Dimens.box0
                                              : Text(
                                                  'Checklist :',
                                                  style: Styles.black17,
                                                ),
                                          controller.type == AppConstants.kMis
                                              ? Dimens.box0
                                              : Text(
                                                  'Assigned To :',
                                                  style: Styles.black17,
                                                ),
                                          controller.type ==
                                                      AppConstants.kMis ||
                                                  controller.type ==
                                                      AppConstants.kEvaluation
                                              ? Dimens.box0
                                              : Text(
                                                  'Employees :',
                                                  style: Styles.black17,
                                                ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller.type.value ==
                                                      AppConstants.kMis
                                                  ? 'MIS${controller.auditPlanDetailModel.value?.id ?? ''}'
                                                  : controller.type.value ==
                                                          AppConstants
                                                              .kEvaluation
                                                      ? 'EVAL${controller.auditPlanDetailModel.value?.id ?? ''}'
                                                      : 'AUD${controller.auditPlanDetailModel.value?.id ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.plan_number ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.description ?? ""}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.frequency_name ?? ''}',
                                              style: Styles.blue17),
                                          controller.type.value ==
                                                  AppConstants.kEvaluation
                                              ? Text(
                                                  '${controller.auditPlanDetailModel.value?.max_score ?? ""}',
                                                  style: Styles.blue17)
                                              : Dimens.box0,
                                          controller.type ==
                                                  AppConstants.kEvaluation
                                              ? Dimens.box0
                                              : Text(
                                                  '${controller.auditPlanDetailModel.value?.checklist_name ?? ""}',
                                                  style: Styles.blue17),
                                          controller.type == AppConstants.kMis
                                              ? Dimens.box0
                                              : Text(
                                                  '${controller.auditPlanDetailModel.value?.assignedTo ?? ''}',
                                                  style: Styles.blue17),
                                          controller.type ==
                                                      AppConstants.kMis ||
                                                  controller.type ==
                                                      AppConstants.kEvaluation
                                              ? Dimens.box0
                                              : Text(
                                                  '${controller.auditPlanDetailModel.value?.employees ?? ""}',
                                                  style: Styles.blue17),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Schedule Date :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Created By :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Created At :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Approved By :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Approved At :',
                                            style: Styles.black17,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.schedule_Date ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.created_by ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.created_at ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.auditPlanDetailModel.value?.approved_by ?? ""}',
                                              style: Styles.blue17),
                                          Text(
                                              controller
                                                          .auditPlanDetailModel
                                                          .value
                                                          ?.approved_Date ==
                                                      "0001-01-01"
                                                  ? ""
                                                  : '${controller.auditPlanDetailModel.value?.approved_Date ?? ''}',
                                              style: Styles.blue17),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight10,
                                controller.auditPlanDetailModel.value
                                                ?.map_checklist !=
                                            null &&
                                        controller.auditPlanDetailModel.value!
                                            .map_checklist!.isNotEmpty
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height: controller.auditPlanDetailModel
                                                        .value?.map_checklist !=
                                                    null &&
                                                controller
                                                    .auditPlanDetailModel
                                                    .value!
                                                    .map_checklist!
                                                    .isNotEmpty
                                            ? ((controller
                                                            .auditPlanDetailModel
                                                            .value!
                                                            .map_checklist!
                                                            .length ??
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
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Maped Checklist",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Divider(
                                            //   color:
                                            //       ColorValues.greyLightColour,
                                            // ),
                                            controller.auditPlanDetailModel.value
                                                            ?.map_checklist !=
                                                        null &&
                                                    controller
                                                        .auditPlanDetailModel
                                                        .value!
                                                        .map_checklist!
                                                        .isNotEmpty
                                                ? Expanded(
                                                    child: DataTable2(
                                                      border: TableBorder.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              206,
                                                              229,
                                                              234)),
                                                      columns: [
                                                        DataColumn2(
                                                            fixedWidth: 70,
                                                            label: Text(
                                                              "Sr. No.",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        DataColumn2(
                                                            fixedWidth: 130,
                                                            label: Text(
                                                              "Checklist ID",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        DataColumn2(
                                                            // fixedWidth: 200,
                                                            label: Text(
                                                          "Checklist Name ",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        // DataColumn2(
                                                        //     // fixedWidth: 200,
                                                        //     label: Text(
                                                        //   "Title ",
                                                        //   style: TextStyle(
                                                        //       fontSize: 15,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .bold),
                                                        // )),
                                                        DataColumn2(
                                                            fixedWidth: 150,
                                                            label: Text(
                                                              "Weightage",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        DataColumn2(
                                                            fixedWidth: 170,
                                                            label: Text(
                                                              "PTW Required",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        DataColumn2(
                                                            //  fixedWidth: 300,
                                                            label: Text(
                                                          "Remark",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ],
                                                      rows: List<
                                                          DataRow>.generate(
                                                        controller
                                                            .auditPlanDetailModel
                                                            .value!
                                                            .map_checklist!
                                                            .length,
                                                        (index) =>
                                                            DataRow(cells: [
                                                          DataCell(Text(
                                                              '${index + 1}')),
                                                          DataCell(Text(
                                                              "CL${controller.auditPlanDetailModel.value!.map_checklist![index]?.id.toString() ?? ''}")),
                                                          DataCell(Text(controller
                                                                  .auditPlanDetailModel
                                                                  .value!
                                                                  .map_checklist![
                                                                      index]
                                                                  ?.name
                                                                  .toString() ??
                                                              '')),
                                                          // DataCell(Text(controller
                                                          //         .auditPlanDetailModel
                                                          //         .value!
                                                          //         .map_checklist![
                                                          //             index]
                                                          //         ?.title
                                                          //         .toString() ??
                                                          //     '')),
                                                          DataCell(Text(
                                                              "${controller.auditPlanDetailModel.value!.map_checklist![index]?.weightage.toString() ?? ''}%")),
                                                          DataCell(Wrap(
                                                            children: [
                                                              Text("No"),
                                                              CustomSwitchTroggle(
                                                                value: controller
                                                                            .auditPlanDetailModel
                                                                            .value!
                                                                            .map_checklist![index]
                                                                            ?.ptw_required ==
                                                                        1
                                                                    ? true
                                                                    : false,
                                                                onChanged:
                                                                    (value) {},
                                                              ),
                                                              Text("Yes"),
                                                            ],
                                                          )),
                                                          DataCell(Text(controller
                                                                  .auditPlanDetailModel
                                                                  .value!
                                                                  .map_checklist![
                                                                      index]
                                                                  ?.comments
                                                                  .toString() ??
                                                              '')),
                                                        ]),
                                                      ),
                                                    ),
                                                  )
                                                : Dimens.box0,
                                          ],
                                        ),
                                      )
                                    : Dimens.box0,
                                Dimens.boxHeight15,
                                (controller.historyList != null &&
                                        controller.historyList!.isNotEmpty)
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height:
                                            ((controller.historyList?.length ??
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
                                    controller.auditPlanDetailModel.value?.status == 421 &&
                                                varUserAccessModel.value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditPlanFeatureId &&
                                                            e.approve ==
                                                                UserAccessConstants
                                                                    .kHaveApproveAccess)
                                                        .length >
                                                    0 ||
                                            controller.auditPlanDetailModel.value?.status == 800 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditPlanFeatureId &&
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
                                              icon: Icons.check,
                                              onPressed: () {
                                                Get.dialog(AuditApprovedDialog(
                                                    // id: controller.pmPlanId.value,
                                                    ));
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    Dimens.boxWidth10,
                                    controller.auditPlanDetailModel.value?.status == 421 &&
                                                varUserAccessModel.value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditPlanFeatureId &&
                                                            e.approve ==
                                                                UserAccessConstants
                                                                    .kHaveApproveAccess)
                                                        .length >
                                                    0 ||
                                            controller.auditPlanDetailModel.value?.status == 800 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditPlanFeatureId &&
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
                        ],
                      ),
                    ),
                  ),
                  // Dimens.boxHeight40,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
