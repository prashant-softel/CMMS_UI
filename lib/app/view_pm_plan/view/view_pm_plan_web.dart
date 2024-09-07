import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_pm_plan/view_pm_plan_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/pm_plan_approve_dialog.dart';
import 'package:cmms/app/widgets/reject_pm_plan_dialog.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ViewPmPlanWeb extends StatefulWidget {
  ViewPmPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewPmPlanWeb> createState() => _ViewPmPlanWebState();
}

class _ViewPmPlanWebState extends State<ViewPmPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: GetBuilder<ViewPmPlanController>(
        id: 'stock_Mangement',
        builder: (controller) {
          return Scaffold(
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
                            Get.offNamed(Routes.preventive);
                          },
                          child: Text(" / PREVENTIVE MAINTENANCE",
                              style: Styles.greyMediumLight12),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.pmPlanList);
                          },
                          child: Text(" / PM PLAN LIST",
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / VIEW PM PLAN", style: Styles.greyMediumLight12)
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
                                          " View PM Plan",
                                          style: Styles.blackBold14,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // height: 30,
                                        // width: MediaQuery.of(context)
                                        //         .size
                                        //         .width /
                                        //     5,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: controller.pmPlanDetailsModel
                                                        .value!.status_id ==
                                                    405
                                                ? ColorValues.approveColor
                                                : controller.pmPlanDetailsModel
                                                            .value!.status_id ==
                                                        406
                                                    ? ColorValues.appRedColor
                                                    : ColorValues
                                                        .appLightBlueColor,
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: controller
                                                          .pmPlanDetailsModel
                                                          .value!
                                                          .status_id ==
                                                      405
                                                  ? ColorValues.approveColor
                                                  : controller
                                                              .pmPlanDetailsModel
                                                              .value!
                                                              .status_id ==
                                                          406
                                                      ? ColorValues.appRedColor
                                                      : ColorValues
                                                          .appLightBlueColor,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                            child: Text(
                                          '${controller.pmPlanDetailsModel.value?.status_short}',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      )
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
                                            ' Plan Title : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Equipment Category : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Start Date : ',
                                            style: Styles.black17,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${controller.pmPlanDetailsModel.value?.plan_name ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.pmPlanDetailsModel.value?.category_name ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.pmPlanDetailsModel.value?.plan_date ?? ""}',
                                              style: Styles.blue17),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Plan Id :',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Frequency : ',
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            'Assigned To : ',
                                            style: Styles.black17,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'PMP${controller.pmPlanDetailsModel.value?.plan_id ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.pmPlanDetailsModel.value?.plan_freq_name ?? ''}',
                                              style: Styles.blue17),
                                          Text(
                                              '${controller.pmPlanDetailsModel.value?.assign_to_name ?? ''}',
                                              style: Styles.blue17),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight15,
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height: ((controller.pmPlanDetailsModel.value
                                                  ?.mapAssetChecklist?.length ??
                                              0) *
                                          40) +
                                      150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Equipment List ",
                                              style: Styles.blue700,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: DataTable2(
                                          border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234)),
                                          columns: [
                                            DataColumn2(
                                                fixedWidth: 100,
                                                label: Text(
                                                  "Sr. No.",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                // fixedWidth: 150,
                                                label: Text(
                                              "Asset Name",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                fixedWidth: 120,
                                                label: Text(
                                                  "Asset ID",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                              "Parent Asset",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                fixedWidth: 200,
                                                label: Text(
                                                  "Module Quantity",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                              "Checklist",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller
                                                    .pmPlanDetailsModel
                                                    .value
                                                    ?.mapAssetChecklist
                                                    ?.length ??
                                                0,
                                            (index) => DataRow(cells: [
                                              DataCell(Text('${index + 1}')),
                                              DataCell(Text(controller
                                                      .pmPlanDetailsModel
                                                      .value
                                                      ?.mapAssetChecklist?[
                                                          index]
                                                      .name
                                                      .toString() ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .pmPlanDetailsModel
                                                      .value
                                                      ?.mapAssetChecklist?[
                                                          index]
                                                      .id
                                                      .toString() ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .pmPlanDetailsModel
                                                      .value
                                                      ?.mapAssetChecklist?[
                                                          index]
                                                      .parentName ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .pmPlanDetailsModel
                                                      .value
                                                      ?.mapAssetChecklist?[
                                                          index]
                                                      .module_qty
                                                      .toString() ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .pmPlanDetailsModel
                                                      .value
                                                      ?.mapAssetChecklist?[
                                                          index]
                                                      .checklist_name ??
                                                  '')),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight35,
                                (controller.historyList != null &&
                                        controller.historyList!.isNotEmpty)
                                    ? Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text('History',
                                                  style: Styles.blackBold16),
                                            ),
                                            Container(
                                              margin: Dimens.edgeInsets20,
                                              height: ((controller.historyList
                                                              ?.length ??
                                                          0) *
                                                      40) +
                                                  120,
                                              child: HistoryTableWidgetWeb(
                                                historyList:
                                                    controller.historyList,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Dimens.box0,
                                Dimens.boxHeight15,
                                Row(
                                  children: [
                                    Spacer(),
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
                                              icon: Icons.check,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
