import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_audit_plan/view_audit_plan_controller.dart';
import 'package:cmms/app/view_mis_plan/view_mis_plan_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/mis_execution_process_dialog.dart';
import 'package:cmms/app/widgets/pm_plan_approve_dialog.dart';
import 'package:cmms/app/widgets/reject_pm_plan_dialog.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ViewMisPlanWeb extends StatefulWidget {
  ViewMisPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewMisPlanWeb> createState() => _ViewMisPlanWebState();
}

class _ViewMisPlanWebState extends State<ViewMisPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewMisPlanController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorValues.cardColor,
          body:
              //  Obx(
              //   () =>
              Column(
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
                        child: Text(" / MIS", style: Styles.greyMediumLight12)),
                    Text(" / VIEW CHECKLIST PLAN",
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
                                        " View Checklist Plan",
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
                                              "Schedule" // "${controller.auditPlanDetailModel.value?.short_status ?? ""}",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'MIS ID :',
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
                                          'SOP Number :',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Dimens.boxWidth10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "MIS001", //  'AUD${controller.auditPlanDetailModel.value?.id ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                            style: Styles.blue17),
                                        Text(
                                            "Mis plan", //  '${controller.auditPlanDetailModel.value?.plan_number ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                            style: Styles.blue17),
                                        Text(
                                            "In description write some word", //  '${controller.auditPlanDetailModel.value?.description ?? ""}',
                                            style: Styles.blue17),
                                        Text(
                                            "Prashant", // '${controller.auditPlanDetailModel.value?.auditee_Emp_Name ?? ''}',
                                            style: Styles.blue17),
                                        Text(
                                            "Sujit Kumar", //  '${controller.auditPlanDetailModel.value?.auditor_Emp_Name ?? ""}',
                                            style: Styles.blue17),
                                        Text('Checklist001',
                                            style: Styles.blue17),
                                        Text(
                                            "S1234590", //   '${controller.auditPlanDetailModel.value?.frequencyApplicable ?? ""}',
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
                                    Dimens.boxWidth10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            "2023-03-26", // '${controller.auditPlanDetailModel.value?.schedule_Date ?? ''}',
                                            style: Styles.blue17),
                                        Text(
                                            "2023-03-26", //  '${controller.auditPlanDetailModel.value?.schedule_Date ?? ''}',
                                            style: Styles.blue17),
                                        Text(
                                            "2023-03-26", // '${controller.auditPlanDetailModel.value?.schedule_Date ?? ''}',
                                            style: Styles.blue17),
                                        Text(
                                            "Weekly", // '${controller.auditPlanDetailModel.value?.frequency ?? ''}',
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
                                height: 210,
                                // ((controller.historyList?.length ?? 0) *
                                //         40) +
                                //     120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
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
                                      child: Container(
                                        margin: Dimens.edgeInsets15,
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
                                        child: ScrollableTableView(
                                          columns: [
                                            "Time Stamp",
                                            "Posted By",
                                            "Comment",
                                            "Status"
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.22,
                                            );
                                          }).toList(),
                                          rows: [
                                            [
                                              "2023-03-26 12:30",
                                              "Prashant",
                                              "Request Approve",
                                              "Approved",
                                            ],
                                            [
                                              "2023-03-26 12:30",
                                              "Prashant",
                                              "Request Approve",
                                              "Approved",
                                            ],
                                          ].map((record) {
                                            return TableViewRow(
                                              height: 40,
                                              cells: record.map((value) {
                                                return TableViewCell(
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )

                                    // Expanded(
                                    //   child: HistoryTableWidgetWeb(
                                    //     historyList: controller.historyList,
                                    //   ),
                                    // ),
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
                                  // controller.auditPlanDetailModel.value
                                  //                 ?.status ==
                                  //             401 &&
                                  //         varUserAccessModel
                                  //                 .value.access_list!
                                  //                 .where((e) =>
                                  //                     e.feature_id ==
                                  //                         UserAccessConstants
                                  //                             .kPmPlanFeatureId &&
                                  //                     e.approve ==
                                  //                         UserAccessConstants
                                  //                             .kHaveApproveAccess)
                                  //                 .length >
                                  //             0
                                  //     ?
                                  Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appGreenColor,
                                      text: "Approve",
                                      icon: Icons.add,
                                      onPressed: () {
                                        Get.dialog(PmPlanApprovedDialog(
                                            // id: controller.pmPlanId.value,
                                            ));
                                      },
                                    ),
                                  ),
                                  //  : Dimens.box0,
                                  Dimens.boxWidth20,
                                  // controller.auditPlanDetailModel.value
                                  //                 ?.status ==
                                  //             401 &&
                                  //         varUserAccessModel
                                  //                 .value.access_list!
                                  //                 .where((e) =>
                                  //                     e.feature_id ==
                                  //                         UserAccessConstants
                                  //                             .kPmPlanFeatureId &&
                                  //                     e.approve ==
                                  //                         UserAccessConstants
                                  //                             .kHaveApproveAccess)
                                  //                 .length >
                                  //             0
                                  //     ?
                                  Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.rejectColor,
                                      text: "Reject",
                                      icon: Icons.close,
                                      onPressed: () {
                                        Get.dialog(PmPlanRejectDialog());
                                      },
                                    ),
                                  ),
                                  //: Dimens.box0,
                                  Dimens.boxWidth20,
                                  Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.startColor,
                                      text: "Start",
                                      icon: Icons.start,
                                      onPressed: () {
                                        Get.dialog(PmPlanRejectDialog());
                                      },
                                    ),
                                  ),
                                  Dimens.boxWidth20,

                                  Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.executeColor,
                                      text: "Execute",
                                      icon: Icons.start,
                                      onPressed: () {
                                        Get.dialog(MisExecutionProcessDialog());
                                      },
                                    ),
                                  ),
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
          // ),
        );
      },
    );
  }
}
