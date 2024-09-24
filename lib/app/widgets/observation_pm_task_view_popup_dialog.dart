import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import 'package:cmms/app/utils/url_path.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class ObservationPMTaskViewDialog extends GetView {
  ObservationPMTaskViewDialog();

  final PreventiveMaintenanceTaskViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        // insetPadding: Dimens.edgeInsets10_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Center(
          child: Text(
            "Observation of  ${controller.selectedItem?.assetsID ?? ""}",
            style: Styles.blue700,
          ),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorValues.lightGreyColorWithOpacity35,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.whiteColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            // padding: EdgeInsets.only(right: 30, top: 10),
            // height: height / 2.3,
            // width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Container(
                    // height: MediaQuery.of(context).size.height / 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ////Assets
                          Container(
                            margin: Dimens.edgeInsets20,
                            height: ((controller.selectedItem
                                            ?.checklist_observation?.length ??
                                        0) *
                                    40) +
                                180,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorValues.lightGreyColorWithOpacity35,
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
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "  ${controller.selectedItem?.checklist_name ?? ""}",
                                        style: Styles.blue700,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: DataTable2(
                                    minWidth: 2000,
                                    border: TableBorder.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234)),
                                    columns: [
                                      // DataColumn2(
                                      //     fixedWidth: 100,
                                      //     label: Text(
                                      //       "Sr.No.",
                                      //       style: TextStyle(
                                      //           fontSize: 15,
                                      //           fontWeight: FontWeight.bold),
                                      //     )),
                                      DataColumn2(
                                          fixedWidth: 150,
                                          label: Text(
                                            "Check Point No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 300,
                                          label: Text(
                                            "Check Point Name",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 300,
                                          label: Text(
                                            "Requirement",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 150,
                                          label: Text(
                                            "Weightage",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 150,
                                          label: Text(
                                            "CP OK?",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 300,
                                          label: Text(
                                            "Observation",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Uploaded Image",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      DataColumn2(
                                          fixedWidth: 180,
                                          label: Text(
                                            "Input Type",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
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
                                          fixedWidth: 100,
                                          label: Text(
                                            "Job ID",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                    rows: List<DataRow>.generate(
                                      controller.selectedItem
                                              ?.checklist_observation?.length ??
                                          0,
                                      (index) => DataRow(
                                        cells: [
                                          // DataCell(Text('${index + 1}')),
                                          DataCell(Text(controller
                                                  .selectedItem
                                                  ?.checklist_observation?[
                                                      index]
                                                  .check_point_id
                                                  .toString() ??
                                              '')),
                                          DataCell(Text(controller
                                                  .selectedItem
                                                  ?.checklist_observation?[
                                                      index]
                                                  .check_point_name ??
                                              '')),
                                          DataCell(Text(controller
                                                  .selectedItem
                                                  ?.checklist_observation?[
                                                      index]
                                                  .requirement ??
                                              '')),
                                          DataCell(Text(controller
                                                  .selectedItem
                                                  ?.checklist_observation?[
                                                      index]
                                                  .failure_waightage
                                                  .toString() ??
                                              '')),
                                          DataCell(Text(
                                            controller
                                                        .selectedItem
                                                        ?.checklist_observation?[
                                                            index]
                                                        .cp_ok ==
                                                    1
                                                ? "OK"
                                                : "Not OK",
                                            style: controller
                                                        .selectedItem
                                                        ?.checklist_observation?[
                                                            index]
                                                        .cp_ok ==
                                                    1
                                                ? Styles.greencolor16
                                                : Styles.redcolor16,
                                          )),
                                          DataCell(Text(controller
                                                  .selectedItem
                                                  ?.checklist_observation?[
                                                      index]
                                                  .observation ??
                                              '')),
                                          DataCell(
                                            Center(
                                              child: TableActionButton(
                                                color: ColorValues.viewColor,
                                                icon: Icons.remove_red_eye,
                                                message: "View",
                                                onPress: () async {
                                                  String baseUrl =
                                                      //     'http://65.0.20.19/CMMS_API/';
                                                      UrlPath.deployUrl;
                                                  String imageUrl =
                                                      "${controller.selectedItem?.checklist_observation![index].files?[index].file_path}";
                                                  String fullUrl =
                                                      baseUrl + imageUrl;
                                                  if (await canLaunch(
                                                      fullUrl)) {
                                                    await launch(fullUrl);
                                                  }
                                                  print(
                                                      "${controller.selectedItem?.checklist_observation![index].files?[index].file_path}");
                                                  // String imagePath = html.window
                                                  //         .location.origin +
                                                  //     '/' +
                                                  //     imageUrl;
                                                  // html.window.open(
                                                  //     imagePath, '_blank');
                                                },
                                              ),
                                            ),
                                          ),
                                          controller
                                                      .selectedItem
                                                      ?.checklist_observation?[
                                                          index]
                                                      .check_point_type ==
                                                  1
                                              ? DataCell(Text(
                                                  "${controller.selectedItem?.checklist_observation?[index].type_text}"))
                                              : controller
                                                          .selectedItem
                                                          ?.checklist_observation?[
                                                              index]
                                                          .check_point_type ==
                                                      2
                                                  ? DataCell(Column(
                                                      children: [
                                                        Text(
                                                            "${controller.selectedItem?.checklist_observation?[index].type_text}"),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "min:${controller.selectedItem?.checklist_observation?[index].min_range}"),
                                                            Dimens.boxWidth12,
                                                            Text(
                                                                "Max:${controller.selectedItem?.checklist_observation?[index].max_range}")
                                                          ],
                                                        )
                                                      ],
                                                    ))
                                                  : DataCell(
                                                      Text(controller
                                                                      .selectedItem
                                                                      ?.checklist_observation?[
                                                                          index]
                                                                      .type_text ==
                                                                  null ||
                                                              controller
                                                                      .selectedItem
                                                                      ?.checklist_observation?[
                                                                          index]
                                                                      .type_text ==
                                                                  "null"
                                                          ? ""
                                                          : "${controller.selectedItem?.checklist_observation?[index].type_text}"),
                                                    ),
                                          controller
                                                      .selectedItem
                                                      ?.checklist_observation?[
                                                          index]
                                                      .linked_job_id ==
                                                  0
                                              ? DataCell(Text(''))
                                              : DataCell(Text(
                                                  "JOB${controller.selectedItem?.checklist_observation?[index].linked_job_id.toString() ?? ''}",
                                                  style: Styles
                                                      .primary15Underlined,
                                                )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ////Associated Job cards
                          controller.selectedItem!.schedule_link_job!.isNotEmpty
                              ? Container(
                                  margin: Dimens.edgeInsets20,
                                  height: ((controller.selectedItem
                                                  ?.schedule_link_job?.length ??
                                              0) *
                                          40) +
                                      120,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                                              "Associated JobCard(s) ",
                                              style: Styles.blue700,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
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
                                                fixedWidth: 300,
                                                label: Text(
                                                  "Job ID",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                fixedWidth: 300,
                                                label: Text(
                                                  "For Check point No.",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                fixedWidth: 400,
                                                label: Text(
                                                  "Job Title",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                fixedWidth: 300,
                                                label: Text(
                                                  "Job Date",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                fixedWidth: 300,
                                                label: Text(
                                                  "Job Status",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller
                                                    .selectedItem
                                                    ?.schedule_link_job
                                                    ?.length ??
                                                0,
                                            (index) => DataRow(cells: [
                                              DataCell(Text('${index + 1}')),
                                              DataCell(InkWell(
                                                onTap: () {
                                                  controller
                                                      .clearStoreDataJobId();
                                                  String? jobId = controller
                                                          .selectedItem
                                                          ?.schedule_link_job?[
                                                              index]
                                                          .job_id
                                                          .toString() ??
                                                      "";
                                                  Get.offNamed(
                                                      '${Routes.jobDetails}/$jobId');
                                                },
                                                child: Text(
                                                  "JOB${controller.selectedItem?.schedule_link_job?[index].job_id.toString() ?? ''}",
                                                  style: Styles
                                                      .primary15Underlined,
                                                ),
                                              )),
                                              DataCell(Text('--')),
                                              DataCell(Text(controller
                                                      .selectedItem
                                                      ?.schedule_link_job?[
                                                          index]
                                                      .job_title ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .selectedItem
                                                      ?.schedule_link_job?[
                                                          index]
                                                      .job_date ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .selectedItem
                                                      ?.schedule_link_job?[
                                                          index]
                                                      .job_status ??
                                                  '')),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Dimens.box0,
                          controller.listMrsByTaskId!.length > 0
                              ? Container(
                                  margin: Dimens.edgeInsets20,
                                  height:
                                      ((controller.listMrsByTaskId?.length ??
                                                  0) *
                                              40) +
                                          150,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                                              "Material Issue / Used",
                                              style: Styles.blue700,
                                            ),
                                            Spacer(),
                                            // Container(
                                            //   height: 30,
                                            //   child: CustomElevatedButton(
                                            //     backgroundColor:
                                            //         ColorValues.addNewColor,
                                            //     onPressed: () async {
                                            //       Get.offAllNamed(
                                            //           Routes.createMrs,
                                            //           arguments: {
                                            //             "whereUsedId":
                                            //                 controller
                                            //                     .pmtaskViewModel
                                            //                     .value
                                            //                     ?.id,
                                            //             "activity": controller
                                            //                 .pmtaskViewModel
                                            //                 .value
                                            //                 ?.plan_title,
                                            //             "whereUsed": 27,
                                            //             "fromActorTypeId": 2,
                                            //             "to_actor_type_id": 3
                                            //           });
                                            //     },
                                            //     text: "Add New MRS",
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      // Divider(
                                      //   color:
                                      //       ColorValues.greyLightColour,
                                      // ),
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
                                                fixedWidth: 130,
                                                label: Text(
                                                  "MRS ID",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                // fixedWidth: 200,
                                                label: Text(
                                              "MRS Items List ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                //  fixedWidth: 300,
                                                label: Text(
                                              "Status",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                fixedWidth: 300,
                                                label: Text(
                                                  'Action',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller
                                                    .listMrsByTaskId?.length ??
                                                0,
                                            (index) => DataRow(cells: [
                                              DataCell(Text('${index + 1}')),
                                              DataCell(Text(controller
                                                          .listMrsByTaskId?[
                                                              index]
                                                          ?.is_mrs_return ==
                                                      0
                                                  ? "MRS${controller.listMrsByTaskId?[index]?.mrsId.toString() ?? ''}"
                                                  : "RMRS${controller.listMrsByTaskId?[index]?.mrs_return_ID.toString() ?? ''}")),
                                              DataCell(Text(controller
                                                      .listMrsByTaskId?[index]
                                                      ?.mrsItems ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .listMrsByTaskId?[index]
                                                      ?.status_short ??
                                                  '')),
                                              DataCell(Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TableActionButton(
                                                      color:
                                                          ColorValues.viewColor,
                                                      icon:
                                                          Icons.remove_red_eye,
                                                      message: "View",
                                                      onPress: () {
                                                        controller
                                                            .clearMrsStoreData();
                                                        String? rmrsId =
                                                            controller
                                                                .listMrsByTaskId?[
                                                                    index]
                                                                ?.mrs_return_ID
                                                                .toString();
                                                        String mrsId = controller
                                                                .listMrsByTaskId?[
                                                                    index]
                                                                ?.mrsId
                                                                .toString() ??
                                                            "";
                                                        String type =
                                                            2.toString();

                                                        print({"mrsId": mrsId});
                                                        print({
                                                          "retmrsId": rmrsId
                                                        });
                                                        controller
                                                                    .listMrsByTaskId?[
                                                                        index]
                                                                    ?.is_mrs_return ==
                                                                0
                                                            ? Get.offNamed(
                                                                '${Routes.mrsApprovalScreen}/$mrsId/$type')
                                                            : Get.offNamed(
                                                                '${Routes.approverReturnMrs}/$rmrsId/$type');
                                                      }),
                                                  // controller.pmtaskViewModel
                                                  //             .value?.status ==
                                                  //         169
                                                  //     ? Dimens.box0
                                                  //     : TableActionButton(
                                                  //         color: ColorValues
                                                  //             .editColor,
                                                  //         icon: Icons.edit,
                                                  //         message: "Edit MRS",
                                                  //         onPress: () {
                                                  //           controller
                                                  //               .clearMrsStoreData();
                                                  //           String mrsId = controller
                                                  //                   .listMrsByTaskId?[
                                                  //                       index]
                                                  //                   ?.mrsId
                                                  //                   .toString() ??
                                                  //               "";
                                                  //           print({
                                                  //             "mrsId": mrsId
                                                  //           });
                                                  //           Get.toNamed(
                                                  //               Routes.editMrs,
                                                  //               arguments: {
                                                  //                 'mrsId': int
                                                  //                     .tryParse(
                                                  //                         "$mrsId")
                                                  //               });
                                                  //         })
                                                ],
                                              )),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Dimens.box0,
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 15,
                  ),
                  // Container(
                  //   height: 35,
                  //   child: CustomElevatedButton(
                  //     icon: Icons.print,
                  //     backgroundColor: ColorValues.linktopermitColor,
                  //     text: "Print",
                  //     onPressed: () {
                  //       //controller.printScreen();
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      // icon: Icons.link,
                      backgroundColor: ColorValues.appRedColor,
                      text: "Close",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  )
                ]),
                Spacer(),
              ],
            ),
          );
        }),
      );
    }));
  }
}
