import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_audit_detail/view_audit_detail_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/pm_plan_approve_dialog.dart';
import 'package:cmms/app/widgets/reject_pm_plan_dialog.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ViewAuditDetailWeb extends StatefulWidget {
  ViewAuditDetailWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAuditDetailWeb> createState() => _ViewAuditDetailWebState();
}

class _ViewAuditDetailWebState extends State<ViewAuditDetailWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAuditDetailController>(
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
                        child:
                            Text(" / AUDIT", style: Styles.greyMediumLight12),
                      ),
                      Text(" / VIEW AUDIT PLAN",
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
                                          " View Audit Plan",
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
                                                "Waiting for approval" // "${controller.pmPlanDetailsModel.value?.status_short ?? ""}",
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
                                            ' Audit ID : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            ' Plan Title  : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Description  : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Created By   : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Approved By   : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Audit Checklist  : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            ' Frequency Applied  : ',
                                            style: Styles.black17,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "AUD765", //'${controller.pmPlanDetailsModel.value?.plan_name ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              style: Styles.blue17),
                                          Text(
                                              "Demo Title 1", // '${controller.pmPlanDetailsModel.value?.category_name ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              "Audit plan for inspection", //'${controller.pmPlanDetailsModel.value?.plan_date ?? ""}',
                                              style: Styles.blue17),
                                          Text(
                                              "Prashant Shettye", //'${controller.pmPlanDetailsModel.value?.plan_date ?? ""}',
                                              style: Styles.blue17),
                                          Text(
                                              "Sujit Kumar", //'${controller.pmPlanDetailsModel.value?.plan_date ?? ""}',
                                              style: Styles.blue17),
                                          Container(
                                            height: 25,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              text: "CheckList",
                                              icon: Icons.remove_red_eye,
                                              onPressed: () {},
                                            ),
                                          ),
                                          Text(
                                              "Yes", //'${controller.pmPlanDetailsModel.value?.plan_date ?? ""}',
                                              style: Styles.blue17),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Created At : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Approved At : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Audit Schedule Date : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Frequency : ',
                                            style: Styles.black17,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              "04/21/2023", // '${controller.pmPlanDetailsModel.value?.plan_freq_name ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              "04/21/2023", // '${controller.pmPlanDetailsModel.value?.plan_freq_name ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              "04/21/2023", // '${controller.pmPlanDetailsModel.value?.plan_freq_name ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              "Weekly", // '${controller.pmPlanDetailsModel.value?.plan_freq_name ?? ''}',
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
                                              "Audit Plan History ",
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
                                // : //
                                // Dimens.box0,
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
                                    controller.pmPlanDetailsModel.value
                                                    ?.status_id ==
                                                401 &&
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
                                                Get.dialog(PmPlanApprovedDialog(
                                                    // id: controller.pmPlanId.value,
                                                    ));
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    Dimens.boxWidth10,
                                    controller.pmPlanDetailsModel.value
                                                    ?.status_id ==
                                                401 &&
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
                                                    PmPlanRejectDialog());
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
