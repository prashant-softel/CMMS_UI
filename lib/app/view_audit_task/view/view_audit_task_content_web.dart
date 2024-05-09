import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/widgets/audit_execution_process_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/mis_execution_process_dialog.dart';
import 'package:cmms/app/widgets/pm_plan_approve_dialog.dart';
import 'package:cmms/app/widgets/reject_pm_plan_dialog.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../widgets/audit_task_approve_reject.dart';
import '../../widgets/history_table_widget_web.dart';

class ViewAuditTaskWeb extends StatefulWidget {
  ViewAuditTaskWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAuditTaskWeb> createState() => _ViewAuditTaskWebState();
}

class _ViewAuditTaskWebState extends State<ViewAuditTaskWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAuditTaskController>(
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
                              Get.offNamed(Routes.misDashboard);
                            },
                            child: Text(" / AUDIT TASK",
                                style: Styles.greyLight14)),
                        Text(" / VIEW AUDIT TASK", style: Styles.greyLight14)
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
                            margin:
                                EdgeInsets.only(left: 20, top: 10, right: 20),
                            // height: Get.height,
                            child: Card(
                              color: ColorValues.cardColor,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: SingleChildScrollView(
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
                                              " View Audit Task",
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
                                                  "${controller.auditTasknDetailModel.value?.status ?? ""}",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Audit ID :',
                                                style: Styles.black17,
                                              ),
                                              // Text(
                                              //   ' Plan Title :',
                                              //   style: Styles.black17,
                                              // ),
                                              Text(
                                                'Title :',
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
                                              // Text(
                                              //   'SOP Number :',
                                              //   style: Styles.black17,
                                              // ),
                                            ],
                                          ),
                                          Dimens.boxWidth10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'AUD${controller.auditTasknDetailModel.value?.id ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                  style: Styles.blue17),
                                              // Text(
                                              //     "Mis plan", //  '${controller.auditPlanDetailModel.value?.plan_number ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              //     style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value?.plan_title ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  "hard cod", // '${controller.auditTasknDetailModel.value?.created_by_name ?? ''}',
                                                  style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value?.approved_by_name ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value?.schedules![0].checklist_name ?? ""}',
                                                  style: Styles.blue17),
                                              // Text(
                                              //     "S1234590 hard coded", //   '${controller.auditPlanDetailModel.value?.frequencyApplicable ?? ""}',
                                              //     style: Styles.blue17),
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
                                                ' Frequency Name :',
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
                                                  "hard", //  '${controller.auditTasknDetailModel.value?.created_at ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value?.approved_at ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  "hard", //'${controller.auditTasknDetailModel.value?.pl ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value?.frequency_name ?? ""}',
                                                  style: Styles.blue17),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 400,
                                      child: DataTable2(
                                        minWidth: 2000,
                                        border: TableBorder.all(
                                            color: Color.fromARGB(
                                                255, 206, 229, 234)),
                                        columns: [
                                          DataColumn2(
                                              fixedWidth: 100,
                                              label: Text(
                                                "Sr.No.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 150,
                                              label: Text(
                                                "Check Point No.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 300,
                                              label: Text(
                                                "Check Point",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 300,
                                              label: Text(
                                                "Requirement",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),

                                          DataColumn2(
                                              fixedWidth: 200,
                                              label: Text(
                                                "Uploaded Image",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          DataColumn2(
                                              fixedWidth: 180,
                                              label: Text(
                                                "Type",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          // DataColumn2(
                                          //     fixedWidth: 200,
                                          //     label: Text(
                                          //       "Upload Images",
                                          //       style: TextStyle(
                                          //           fontSize: 15,
                                          //           fontWeight: FontWeight.bold),
                                          //     )),
                                          DataColumn2(
                                              fixedWidth: 300,
                                              label: Text(
                                                "Observation",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller
                                                  .auditTasknDetailModel
                                                  .value
                                                  ?.schedules![0]
                                                  .checklist_observation
                                                  ?.length ??
                                              0,
                                          (index) => DataRow(
                                            cells: [
                                              DataCell(Text('${index + 1}')),
                                              DataCell(Text(controller
                                                      .auditTasknDetailModel
                                                      .value
                                                      ?.schedules![0]
                                                      .checklist_observation?[
                                                          index]
                                                      .check_point_id
                                                      .toString() ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .auditTasknDetailModel
                                                      .value
                                                      ?.schedules![0]
                                                      .checklist_observation?[
                                                          index]
                                                      .check_point_name ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .auditTasknDetailModel
                                                      .value
                                                      ?.schedules![0]
                                                      .checklist_observation?[
                                                          index]
                                                      .requirement ??
                                                  '')),
                                              DataCell(
                                                Center(
                                                  child: TableActionButton(
                                                    color:
                                                        ColorValues.viewColor,
                                                    icon: Icons.remove_red_eye,
                                                    message: "View",
                                                    // onPress: () async {
                                                    //   String baseUrl =
                                                    //       'http://65.0.20.19/CMMS_API/';
                                                    //   // 'http://172.20.43.18:82/';
                                                    //   String imageUrl =
                                                    //       "${controller.selectedItem?.checklist_observation![index].files?[index].file_path}";
                                                    //   String fullUrl =
                                                    //       baseUrl + imageUrl;
                                                    //   if (await canLaunch(
                                                    //       fullUrl)) {
                                                    //     await launch(fullUrl);
                                                    //   }
                                                    //   print(
                                                    //       "${controller.selectedItem?.checklist_observation![index].files?[index].file_path}");
                                                    // String imagePath = html.window
                                                    //         .location.origin +
                                                    //     '/' +
                                                    //     imageUrl;
                                                    // html.window.open(
                                                    //     imagePath, '_blank');
                                                    // },
                                                  ),
                                                ),
                                              ),
                                              DataCell(Text('Text')),
                                              DataCell(Text(controller
                                                      .auditTasknDetailModel
                                                      .value
                                                      ?.schedules![0]
                                                      .checklist_observation?[
                                                          index]
                                                      .observation ??
                                                  '')),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Dimens.boxHeight15,
                                    (controller.historyList != null &&
                                            controller.historyList!.isNotEmpty)
                                        ? Container(
                                            margin: Dimens.edgeInsets20,
                                            height: ((controller.historyList
                                                            ?.length ??
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
                                            icon: Icons.check,
                                            onPressed: () {
                                              Get.dialog(
                                                  AuditTaskApprovedRejectDialog(
                                                type: 1,
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
                                            backgroundColor:
                                                ColorValues.rejectColor,
                                            text: "Reject",
                                            icon: Icons.close,
                                            onPressed: () {
                                              Get.dialog(
                                                  AuditTaskApprovedRejectDialog(
                                                type: 2,
                                              ));
                                            },
                                          ),
                                        ),
                                        //: Dimens.box0,
                                        Dimens.boxWidth20,
                                        Container(
                                          height: 45,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.addNewColor,
                                            text: "Skip",
                                            icon: Icons.skip_next_sharp,
                                            onPressed: () {
                                              Get.dialog(
                                                  AuditTaskApprovedRejectDialog(
                                                type: 3,
                                              ));
                                            },
                                          ),
                                        ),
                                        Dimens.boxWidth20,

                                        Container(
                                          height: 45,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.closeColor,
                                            text: "Close",
                                            icon: Icons.close,
                                            onPressed: () {
                                              Get.dialog(
                                                  AuditTaskApprovedRejectDialog(
                                                type: 4,
                                              ));
                                            },
                                          ),
                                        ),
                                        Dimens.boxWidth20,
                                        Container(
                                          height: 45,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.startColor,
                                            text: "Start",
                                            icon: Icons.start,
                                            onPressed: () {
                                              controller.startAuditTask();
                                            },
                                          ),
                                        ),
                                        Dimens.boxWidth20,

                                        Container(
                                          height: 45,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.executeColor,
                                            text: "Execute",
                                            icon: Icons.start,
                                            onPressed: () {
                                              controller
                                                  .auditTasknDetailModel
                                                  .value
                                                  ?.schedules![0]
                                                  .checklist_observation
                                                  ?.forEach((element) {
                                                controller.rowItemAuditobs.value
                                                    .add([
                                                  {
                                                    "key": "checkpoint",
                                                    "id":
                                                        '${element.execution_id}',
                                                    "value":
                                                        '${element.check_point_name}',
                                                  },
                                                  {
                                                    "key": "requirement",
                                                    "value":
                                                        '${element.requirement}'
                                                  },
                                                  {
                                                    'key': "accept",
                                                    "value":
                                                        '${element.cp_ok.value}'
                                                  },
                                                  {
                                                    'key': "observation",
                                                    "value":
                                                        '${element.observation}'
                                                  },
                                                  {
                                                    'key': "uploadimg",
                                                    "value": '',
                                                    "uploaded": ""
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
                                                ]);
                                              });
                                              Get.dialog(
                                                  AuditExecutionProcessDialog());
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
