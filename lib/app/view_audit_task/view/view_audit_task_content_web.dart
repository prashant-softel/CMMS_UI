import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_audit_task/tbt_done_audit_dialog.dart';
import 'package:cmms/app/view_audit_task/view/assigntoauditdailog.dart';
import 'package:cmms/app/view_audit_task/view_audit_task_controller.dart';
import 'package:cmms/app/widgets/audit_execution_process_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/mis_execution_process_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                            Get.offNamed(Routes.auditTask,
                                arguments: {'type': controller.type});
                          },
                          child: controller.type.value == AppConstants.kMis
                              ? Text(" / MIS TASK", style: Styles.greyLight14)
                              : Text(" / AUDIT TASK",
                                  style: Styles.greyLight14),
                        ),
                        controller.type.value == AppConstants.kMis
                            ? Text(" / VIEW MIS TASK",
                                style: Styles.greyLight14)
                            : Text(" / VIEW AUDIT TASK",
                                style: Styles.greyLight14)
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
                                              controller.type.value ==
                                                      AppConstants.kMis
                                                  ? "View MIS Task"
                                                  : "View Audit Task",
                                              style: Styles.blackBold14,
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 30,
                                            child: CustomElevatedButton(
                                              backgroundColor: controller
                                                          .auditTasknDetailModel
                                                          .value
                                                          .status ==
                                                      431
                                                  ? ColorValues.appDarkBlueColor
                                                  : controller.auditTasknDetailModel
                                                              .value.status ==
                                                          430
                                                      ? ColorValues
                                                          .rejectedStatusColor
                                                      : controller
                                                                  .auditTasknDetailModel
                                                                  .value
                                                                  .status ==
                                                              422
                                                          ? ColorValues
                                                              .startColor
                                                          : controller
                                                                      .auditTasknDetailModel
                                                                      .value
                                                                      .status ==
                                                                  425
                                                              ? ColorValues
                                                                  .approveStatusColor
                                                              : controller
                                                                          .auditTasknDetailModel
                                                                          .value
                                                                          .status ==
                                                                      429
                                                                  ? ColorValues
                                                                      .closeColor
                                                                  : controller
                                                                              .auditTasknDetailModel
                                                                              .value
                                                                              .status ==
                                                                          426
                                                                      ? ColorValues
                                                                          .skyBlueColor
                                                                      : controller.auditTasknDetailModel.value.status ==
                                                                              427
                                                                          ? ColorValues
                                                                              .rejectedStatusColor
                                                                          : ColorValues
                                                                              .addNewColor,
                                              onPressed: () async {},
                                              text:
                                                  "${controller.auditTasknDetailModel.value.status_short ?? ""}",

                                              // ${controller.auditTasknDetailModel.value.status ?? ""}
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
                                                controller.type.value ==
                                                        AppConstants.kMis
                                                    ? "MIS ID :"
                                                    : 'Audit ID :',
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
                                              // Text(
                                              //   'Created By :',
                                              //   style: Styles.black17,
                                              // ),
                                              // Text(
                                              //   'Approved By :',
                                              //   style: Styles.black17,
                                              // ),
                                              Text(
                                                'Checklist :',
                                                style: Styles.black17,
                                              ),
                                              // Text(
                                              //   'SOP Number :',
                                              //   style: Styles.black17,
                                              // ),
                                              Text(
                                                "Last Done Date:",
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "Due Date:",
                                                style: Styles.black17,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  controller.type.value ==
                                                          AppConstants.kMis
                                                      ? 'MIS${controller.auditTasknDetailModel.value.id ?? ''}'
                                                      : 'AUD${controller.auditTasknDetailModel.value.id ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                  style: Styles.blue17),
                                              // Text(
                                              //     "Mis plan", //  '${controller.auditPlanDetailModel.value?.plan_number ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                              //     style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value.plan_title ?? ""}',
                                                  style: Styles.blue17),
                                              // Text(
                                              //     "hard cod", // '${controller.auditTasknDetailModel.value?.created_by_name ?? ''}',
                                              //     style: Styles.blue17),
                                              // Text(
                                              //     '${controller.auditTasknDetailModel.value.approved_by ?? ""}',
                                              //     style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value.schedules?[0]?.checklist_name ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  " ${controller.auditTasknDetailModel.value.last_done_date ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.auditTasknDetailModel.value.due_date ?? ""}",
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
                                              // Text(
                                              //   'Created At :',
                                              //   style: Styles.black17,
                                              // ),
                                              // Text(
                                              //   'Approved At :',
                                              //   style: Styles.black17,
                                              // ),
                                              Text(
                                                'Schedule Date :',
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                ' Frequency Name :',
                                                style: Styles.black17,
                                              ),
                                              Text(
                                                "Assigned To:",
                                                style: Styles.black17,
                                              ),

                                              Text(
                                                "Done Date:",
                                                style: Styles.black17,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //     "hard", //  '${controller.auditTasknDetailModel.value?.created_at ?? ""}',
                                              //     style: Styles.blue17),
                                              // Text(
                                              //     controller
                                              //                 .auditTasknDetailModel
                                              //                 .value
                                              //                 .approved_at ==
                                              //             "0001-01-01"
                                              //         ? ""
                                              //         : '${controller.auditTasknDetailModel.value.approved_at ?? ""}',
                                              //     style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value.schedule_Date ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  '${controller.auditTasknDetailModel.value.frequency_name ?? ""}',
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.auditTasknDetailModel.value.assigned_to_name ?? ""}",
                                                  style: Styles.blue17),
                                              Text(
                                                  "${controller.auditTasknDetailModel.value.done_date ?? ""}",
                                                  style: Styles.blue17),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // controller
                                    //             .auditTasknDetailModel
                                    //             .value
                                    //             .schedules![0]
                                    //             .checklist_observation!
                                    //             .length ==
                                    //         0
                                    (controller
                                                    ?.auditTasknDetailModel
                                                    ?.value
                                                    ?.schedules?[0]
                                                    ?.checklist_observation
                                                    ?.length ??
                                                0) ==
                                            0
                                        ? Dimens.box0
                                        : Container(
                                            margin: Dimens.edgeInsets20,
                                            height: ((controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .schedules![0]
                                                            .checklist_observation!
                                                            .length ??
                                                        0) *
                                                    30) +
                                                140,
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
                                                    fixedWidth: 170,
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
                                                    fixedWidth: 150,
                                                    label: Text(
                                                      "Accept",
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
                                                        .schedules![0]
                                                        .checklist_observation
                                                        ?.length ??
                                                    0,
                                                (index) => DataRow(
                                                  cells: [
                                                    DataCell(
                                                        Text('${index + 1}')),
                                                    DataCell(Text(
                                                        'CP${controller.auditTasknDetailModel.value.schedules![0].checklist_observation?[index].check_point_id.toString() ?? ''}')),
                                                    DataCell(Text(controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .schedules![0]
                                                            .checklist_observation?[
                                                                index]
                                                            .check_point_name ??
                                                        '')),
                                                    DataCell(Text(controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .schedules![0]
                                                            .checklist_observation?[
                                                                index]
                                                            .requirement ??
                                                        '')),
                                                    DataCell(Text(
                                                      controller
                                                                  .auditTasknDetailModel
                                                                  .value
                                                                  .schedules![0]
                                                                  .checklist_observation?[
                                                                      index]
                                                                  .cp_ok ==
                                                              1
                                                          ? "YES"
                                                          : "NO",
                                                      style: controller
                                                                  .auditTasknDetailModel
                                                                  .value
                                                                  .schedules![0]
                                                                  .checklist_observation?[
                                                                      index]
                                                                  .cp_ok ==
                                                              1
                                                          ? Styles.greencolor16
                                                          : Styles.redcolor16,
                                                    )),
                                                    DataCell(
                                                      Center(
                                                        child:
                                                            TableActionButton(
                                                          color: ColorValues
                                                              .viewColor,
                                                          icon: Icons
                                                              .remove_red_eye,
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
                                                    controller
                                                                .auditTasknDetailModel
                                                                .value
                                                                .schedules![0]
                                                                .checklist_observation?[
                                                                    index]
                                                                .check_point_type ==
                                                            1
                                                        ? DataCell(Text(
                                                            "${controller.auditTasknDetailModel.value.schedules![0].checklist_observation?[index].type_text}"))
                                                        : controller
                                                                    .auditTasknDetailModel
                                                                    .value
                                                                    .schedules![
                                                                        0]
                                                                    .checklist_observation?[
                                                                        index]
                                                                    .check_point_type ==
                                                                2
                                                            ? DataCell(Column(
                                                                children: [
                                                                  Text(
                                                                      "${controller.auditTasknDetailModel.value.schedules![0].checklist_observation?[index].type_text}"),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          "min:${controller.auditTasknDetailModel.value.schedules![0].checklist_observation?[index].min_range}"),
                                                                      Dimens
                                                                          .boxWidth12,
                                                                      Text(
                                                                          "Max:${controller.auditTasknDetailModel.value.schedules![0].checklist_observation?[index].max_range}")
                                                                    ],
                                                                  )
                                                                ],
                                                              ))
                                                            : DataCell(
                                                                Text('Text')),

                                                    //  DataCell(Text('Text')),
                                                    DataCell(Text(controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .schedules![0]
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
                                    controller.auditTasknDetailModel.value
                                                .permit_id ==
                                            0
                                        ? Dimens.box0
                                        : Container(
                                            margin: Dimens.edgeInsets20,
                                            height: 150,
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
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Permit Details ",
                                                        style: Styles.blue700,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: DataTable2(
                                                      border: TableBorder.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              206,
                                                              229,
                                                              234)),
                                                      columns: [
                                                        DataColumn2(
                                                            fixedWidth: 150,
                                                            label: Text(
                                                              "Permit ID",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        DataColumn2(
                                                            // fixedWidth: 300,
                                                            label: Text(
                                                          "Permit Code",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        DataColumn2(
                                                            // fixedWidth: 300,
                                                            label: Text(
                                                          "Permit Type",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        DataColumn2(
                                                            // fixedWidth: 300,
                                                            label: Text(
                                                          "Status",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        DataColumn2(
                                                            fixedWidth: 300,
                                                            label: Text(
                                                              'Action',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                      ],
                                                      rows: [
                                                        DataRow(cells: [
                                                          DataCell(Text(
                                                            "${controller.auditTasknDetailModel.value.permit_id ?? ""}",
                                                          )),
                                                          DataCell(Text(
                                                            "${controller.auditTasknDetailModel.value.permit_code ?? ""}",
                                                          )),
                                                          DataCell(Text(
                                                            "${controller.auditTasknDetailModel.value.permit_type ?? ""}",
                                                          )),
                                                          DataCell(Text(
                                                            "${controller.auditTasknDetailModel.value.status_short_ptw ?? ""}",
                                                          )),
                                                          DataCell(Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              // TableActionButton(
                                                              //     color: ColorValue
                                                              //         .viewColor,
                                                              //     icon: Icons
                                                              //         .remove_red_eye,
                                                              //     message:
                                                              //         "View Job Card",
                                                              //     onPress: () {
                                                              //       controller
                                                              //           .clearStoreData();

                                                              //       String jobCardId = controller
                                                              //               .jobAssociatedModelsList?[
                                                              //                   index]
                                                              //               ?.jobCardId
                                                              //               .toString() ??
                                                              //           "";
                                                              //       print({
                                                              //         "JcId": jobCardId
                                                              //       });

                                                              //       Get.toNamed(
                                                              //           Routes.jobCard,
                                                              //           arguments: {
                                                              //             'JcId': int
                                                              //                 .tryParse(
                                                              //                     "$jobCardId")
                                                              //           });
                                                              //     }),

                                                              varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == UserAccessConstants.kPermitFeatureId &&
                                                                              e.view ==
                                                                                  UserAccessConstants
                                                                                      .kHaveViewAccess)
                                                                          .length >
                                                                      0
                                                                  ? TableActionButton(
                                                                      color: ColorValues
                                                                          .appLightBlueColor,
                                                                      icon: Icons
                                                                          .remove_red_eye,
                                                                      message:
                                                                          "View Permit",
                                                                      onPress:
                                                                          () {
                                                                        controller
                                                                            .clearPermitStoreData();
                                                                        controller.viewNewPermitList(
                                                                            permitId:
                                                                                controller.auditTasknDetailModel.value.permit_id,
                                                                            jobId: controller.jobDetailsModel.value!.id ?? 0);
                                                                      })
                                                                  : Container(),
                                                              controller.pmtaskViewModel.value
                                                                              ?.ptw_status ==
                                                                          124 ||
                                                                      controller
                                                                              .pmtaskViewModel
                                                                              .value
                                                                              ?.ptw_status ==
                                                                          132
                                                                  ? TableActionButton(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          116,
                                                                          78,
                                                                          130),
                                                                      icon: Icons
                                                                          .ads_click,
                                                                      message:
                                                                          'Re-Submit Permit',
                                                                      onPress:
                                                                          () {
                                                                        controller.editNewPermit(
                                                                            permitId:
                                                                                controller.pmtaskViewModel.value?.permit_id,
                                                                            isChecked: false
                                                                            // controller
                                                                            //     .isChecked
                                                                            //     .value
                                                                            );
                                                                      },
                                                                    )
                                                                  : Dimens.box0
                                                              // TableActionButton(
                                                              //     color: ColorValues
                                                              //         .appYellowColor,
                                                              //     icon: Icons.copy,
                                                              //     message:
                                                              //         "Clone Permit"
                                                              //     // onPress:
                                                              //     //     () =>
                                                              //     //         controller.goToJobCardScreen(),
                                                              //     ),
                                                            ],
                                                          )),
                                                        ]),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                    Dimens.boxHeight10,
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
                                                        "History ",
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
                                        : Dimens.box0,
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
                                        controller.auditTasknDetailModel.value
                                                        .status ==
                                                    426 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditExecutionFeatureId &&
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
                                                    Get.dialog(
                                                        AuditTaskApprovedRejectDialog(
                                                      type: 1,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        //  : Dimens.box0,
                                        Dimens.boxWidth5,
                                        controller.auditTasknDetailModel.value
                                                        .status ==
                                                    426 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditExecutionFeatureId &&
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
                                                        AuditTaskApprovedRejectDialog(
                                                      type: 2,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        //: Dimens.box0,
                                        Dimens.boxWidth5,
                                        controller.auditTasknDetailModel.value
                                                        .status ==
                                                    425 ||
                                                controller.auditTasknDetailModel
                                                            .value.status ==
                                                        427 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kAuditExecutionFeatureId &&
                                                                e.approve ==
                                                                    UserAccessConstants
                                                                        .kHaveAddAccess)
                                                            .length >
                                                        0
                                            ? Container(
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
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth5,

                                        controller.auditTasknDetailModel.value.status == 430 &&
                                                    varUserAccessModel.value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kAuditExecutionFeatureId &&
                                                                e.approve ==
                                                                    UserAccessConstants
                                                                        .kHaveAddAccess)
                                                            .length >
                                                        0 ||
                                                controller.auditTasknDetailModel
                                                            .value.status ==
                                                        422 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants.kAuditExecutionFeatureId &&
                                                                e.approve == UserAccessConstants.kHaveAddAccess)
                                                            .length >
                                                        0
                                            ? Container(
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
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth5,

                                        controller.auditTasknDetailModel.value
                                                        .status ==
                                                    429 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditExecutionFeatureId &&
                                                            e.approve ==
                                                                UserAccessConstants
                                                                    .kHaveApproveAccess)
                                                        .length >
                                                    0
                                            ? Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.approveColor,
                                                  text: "Approve",
                                                  icon: Icons.check,
                                                  onPressed: () {
                                                    Get.dialog(
                                                        AuditTaskApprovedRejectDialog(
                                                      type: 5,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth5,

                                        controller.auditTasknDetailModel.value
                                                        .status ==
                                                    429 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditExecutionFeatureId &&
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
                                                        AuditTaskApprovedRejectDialog(
                                                      type: 6,
                                                    ));
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth20,
                                        controller.auditTasknDetailModel.value
                                                            .status ==
                                                        425 &&
                                                    controller.auditTasknDetailModel.value.is_PTW ==
                                                        "False" &&
                                                    varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kAuditExecutionFeatureId && e.approve == UserAccessConstants.kHaveAddAccess).length >
                                                        0 ||
                                                controller.auditTasknDetailModel.value.status == 427 &&
                                                    controller.auditTasknDetailModel.value.is_PTW ==
                                                        "False" &&
                                                    varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kAuditExecutionFeatureId && e.approve == UserAccessConstants.kHaveAddAccess).length >
                                                        0 ||
                                                controller.auditTasknDetailModel.value.status == 138 &&
                                                    controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .ptw_status ==
                                                        125 &&
                                                    controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .is_PTW ==
                                                        "True" &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) => e.feature_id == UserAccessConstants.kAuditExecutionFeatureId && e.approve == UserAccessConstants.kHaveAddAccess)
                                                            .length >
                                                        0
                                            ? Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.startColor,
                                                  text: "Start",
                                                  icon: Icons.start,
                                                  onPressed: () {
                                                    controller.auditTasknDetailModel.value
                                                                    .ptw_tbt_done ==
                                                                0 &&
                                                            controller
                                                                    .auditTasknDetailModel
                                                                    .value
                                                                    .is_PTW ==
                                                                "True"
                                                        ? Get.dialog<void>(
                                                            TbtDoneAuditTaskDialog(
                                                                ptw_id: controller
                                                                        .auditTasknDetailModel
                                                                        .value
                                                                        .permit_id ??
                                                                    0,
                                                                id: controller
                                                                        .auditTasknDetailModel
                                                                        .value
                                                                        .id ??
                                                                    0))
                                                        : controller
                                                            .startAuditTask();
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth5,
                                        controller.auditTasknDetailModel.value.permit_id == 0 &&
                                                    controller.auditTasknDetailModel
                                                            .value.is_PTW ==
                                                        "True" &&
                                                    controller.auditTasknDetailModel
                                                            .value.status ==
                                                        425 &&
                                                    varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kAuditExecutionFeatureId && e.approve == UserAccessConstants.kHaveAddAccess).length >
                                                        0 ||
                                                controller.auditTasknDetailModel
                                                            .value.permit_id ==
                                                        0 &&
                                                    controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .is_PTW ==
                                                        "True" &&
                                                    controller
                                                            .auditTasknDetailModel
                                                            .value
                                                            .status ==
                                                        427 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) => e.feature_id == UserAccessConstants.kAuditExecutionFeatureId && e.approve == UserAccessConstants.kHaveAddAccess)
                                                            .length >
                                                        0
                                            ? Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.appGreenColor,
                                                  text: "Create New Permit",
                                                  icon: Icons.add,
                                                  onPressed: () {
                                                    controller
                                                        .createNewPermit();
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        Dimens.boxWidth5,
                                        controller.auditTasknDetailModel.value
                                                        .status ==
                                                    421 &&
                                                varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kAuditExecutionFeatureId &&
                                                            e.approve ==
                                                                UserAccessConstants
                                                                    .kHaveAddAccess)
                                                        .length >
                                                    0
                                            ? Container(
                                                height: 35,
                                                child: CustomElevatedButton(
                                                  // icon: Icons.link,
                                                  backgroundColor:
                                                      ColorValues.blueColor,
                                                  text: "Re-assign",
                                                  onPressed: () {
                                                    Get.dialog<void>(
                                                        AssignToAuditTaskDialog(
                                                            id: controller
                                                                    .auditTasknDetailModel
                                                                    .value
                                                                    .id ??
                                                                0));
                                                    //controller.printScreen();
                                                  },
                                                ),
                                              )
                                            : Dimens.box0,
                                        controller.auditTasknDetailModel.value.status == 430 &&
                                                    varUserAccessModel.value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kAuditExecutionFeatureId &&
                                                                e.approve ==
                                                                    UserAccessConstants
                                                                        .kHaveAddAccess)
                                                            .length >
                                                        0 ||
                                                controller.auditTasknDetailModel
                                                            .value.status ==
                                                        422 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants.kAuditExecutionFeatureId &&
                                                                e.approve == UserAccessConstants.kHaveAddAccess)
                                                            .length >
                                                        0
                                            ? Container(
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
                                                        .schedules![0]
                                                        .checklist_observation
                                                        ?.forEach((element) {
                                                      controller
                                                          .rowItemAuditobs.value
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
                                                        // AuditExecutionProcessDialog()
                                                        MisExecutionProcessDialog());
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
