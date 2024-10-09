import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_veg_execution/view_veg_execution_controller.dart';
import 'package:cmms/app/widgets/approve_veg_execution_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/reject_veg_execution_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewVegExecutionContentWeb extends GetView<ViewVegExecutionController> {
  ViewVegExecutionContentWeb({super.key});

  // final homeController = Get.find<HomeController>();
  final ViewVegExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Row(
        children: [
          Expanded(
            child: Container(
              // margin: Dimens.edgeInsets16,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(.3)),
              ),
              constraints: BoxConstraints(
                maxWidth: 1100,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderWidget(),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
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
                              Get.offNamed(Routes.vegExecutionListScreen);
                            },
                            child: Text(
                              " / VEGETATION EXECUTION LIST",
                              style: Styles.greyLight14,
                            ),
                          ),
                          Text(
                            " / VIEW VEGETATION PLAN EXECUTION",
                            style: Styles.greyLight14,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width / 1,
                      // height: MediaQuery.of(context).size.height / 0.8,
                      child: Card(
                        // color: Colors.lightBlue.shade50,
                        child: Wrap(
                          children: [
                            GetBuilder<ViewVegExecutionController>(
                                id: 'vew-vegetation-plan-execution',
                                builder: (controller) {
                                  return Obx(
                                    () => Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'View Vegetation Plan Execution',
                                              style: Styles.black17,
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 30,
                                              child: CustomElevatedButton(
                                                backgroundColor: controller
                                                            .vegExecutionDetailsModel
                                                            .value
                                                            ?.status ==
                                                        702
                                                    ? ColorValues.startColor
                                                    : controller
                                                                .vegExecutionDetailsModel
                                                                .value
                                                                ?.status ==
                                                            704
                                                        ? ColorValues
                                                            .approveStatusColor
                                                        : ColorValues
                                                            .rejectedStatusColor,
                                                onPressed: () async {},
                                                text:
                                                    "${controller.vegExecutionDetailsModel.value?.status_short ?? ""}",

                                                // ${controller.auditTasknDetailModel.value.status ?? ""}
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                            color: ColorValues.lightGreyColor),
                                        Dimens.boxHeight24,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Plan Id: ',
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  'Execution Id: ',
                                                  style: Styles.black17,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' ${controller.vegplanId}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  ' ${controller.vegid.value}',
                                                  style: Styles.blue17,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Plan Title: ',
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  'Frequency: ',
                                                  style: Styles.black17,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' ${controller.vegExecutionDetailsModel.value?.title}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  ' ${controller.vegExecutionDetailsModel.value?.frequency}',
                                                  style: Styles.blue17,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Planned By: ',
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  'Start Date Time: ',
                                                  style: Styles.black17,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' ${controller.vegExecutionDetailsModel.value?.plannedBy}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  ' ${controller.startedAtDateTimeCtrlrWeb.text}',
                                                  style: Styles.blue17,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Planning Date Time: ',
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  'Execution started by: ',
                                                  style: Styles.black17,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' ${controller.plannedAtDateTimeCtrlrWeb.text}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  ' ${controller.vegExecutionDetailsModel.value?.startedBy}',
                                                  style: Styles.blue17,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),

                                        Dimens.boxHeight50,

                                        ///Schedule Execution
                                        Container(
                                          margin: Dimens.edgeInsets20,
                                          height: ((controller.listSchedules
                                                          ?.length ??
                                                      0) *
                                                  50) +
                                              125,
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
                                                      "Schedule Execution",
                                                      style: Styles.blue700,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColour,
                                              ),
                                              Expanded(
                                                child: DataTable2(
                                                  columnSpacing: 10,
                                                  border: TableBorder.all(
                                                      color: Color.fromARGB(
                                                          255, 206, 229, 234)),
                                                  columns: [
                                                    DataColumn(
                                                        label: Text(
                                                      "Schedule\nId",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Execution\nId",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Days",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Scheduled\nModule",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Cleaned",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Abandoned",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Pending",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Type",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Water\nUsed",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Start\nDate",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "End\nDate",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Remark",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Execution",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  ],
                                                  rows: List<DataRow>.generate(
                                                    controller.listSchedules
                                                            ?.length ??
                                                        5,
                                                    (index) => DataRow(cells: [
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.scheduleId
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.executionId
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.cleaningDay
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.scheduled
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.cleaned
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.abandoned
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.pending
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.cleaningTypeName
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.waterUsed
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.start_date
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.end_date
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.remark
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .listSchedules?[
                                                                  index]
                                                              ?.status_short
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Column(
                                                        children: [
                                                          TableActionButton(
                                                            color: ColorValues
                                                                .appDarkBlueColor,
                                                            icon: Icons
                                                                .remove_red_eye_outlined,
                                                            message: 'View',
                                                            onPress: () {
                                                              var selectedSchedule = controller
                                                                  .listSchedules
                                                                  ?.firstWhere((e) =>
                                                                      "${e?.scheduleId}" ==
                                                                      controller
                                                                          .listSchedules?[
                                                                              index]
                                                                          ?.scheduleId
                                                                          .toString());

                                                              var mappedData =
                                                                  {};

                                                              selectedSchedule!
                                                                  .equipments
                                                                  ?.forEach(
                                                                      (e) {
                                                                mappedData[
                                                                    e.id] = {
                                                                  'isCleanedSmbCheck':
                                                                      e.status ==
                                                                              408
                                                                          ? true
                                                                          : false,
                                                                  'isAbandonSmbCheck':
                                                                      e.status ==
                                                                              409
                                                                          ? true
                                                                          : false,
                                                                  "cleaningDay":
                                                                      e.cleaningDay
                                                                };
                                                              });

                                                              print(
                                                                  'filteredData:${selectedSchedule}');
                                                            },
                                                          ),
                                                        ],
                                                      )),
                                                    ]),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        ///MC Execution History
                                        // Container(
                                        //   margin: Dimens.edgeInsets20,
                                        //   height: ((controller.historyList
                                        //                   ?.length ??
                                        //               0) *
                                        //           50) +
                                        //       125,
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //       color: ColorValues
                                        //           .lightGreyColorWithOpacity35,
                                        //       width: 1,
                                        //     ),
                                        //     boxShadow: [
                                        //       BoxShadow(
                                        //         color: ColorValues
                                        //             .appBlueBackgroundColor,
                                        //         spreadRadius: 2,
                                        //         blurRadius: 5,
                                        //         offset: Offset(0, 2),
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   child: Column(
                                        //     children: [
                                        //       Padding(
                                        //         padding:
                                        //             const EdgeInsets.all(10.0),
                                        //         child: Row(
                                        //           children: [
                                        //             Text(
                                        //               "MC Execution History ",
                                        //               style: Styles.blue700,
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //       Divider(
                                        //         color:
                                        //             ColorValues.greyLightColour,
                                        //       ),
                                        //       // Column(
                                        //       //   children: [
                                        //       //     Row(
                                        //       //       children: [
                                        //       //         Text(
                                        //       //             "Time Stamp"),
                                        //       //         Text(
                                        //       //             "Posted By"),
                                        //       //         Text("Comment"),
                                        //       //         Text(
                                        //       //             "Location"),
                                        //       //         Text("Status"),
                                        //       //       ],
                                        //       //     )
                                        //       //   ]..addAll([
                                        //       //       ...(controller
                                        //       //               .historyList?.value ??
                                        //       //           [])
                                        //       //     ].map((e) {
                                        //       //       return Row(
                                        //       //         children: [
                                        //       //           Text(
                                        //       //               "${e?.createdAt??''}"),
                                        //       //           Text(
                                        //       //               "${e?.createdByName}"),
                                        //       //           Text(
                                        //       //               "${e?.comment}"),
                                        //       //           Text(
                                        //       //               "--"),
                                        //       //           Text(
                                        //       //               "${e?.status_name ??''}"),
                                        //       //         ],
                                        //       //       );
                                        //       //     })),
                                        //       // ),

                                        //       Expanded(
                                        //         child: DataTable2(
                                        //           border: TableBorder.all(
                                        //               color: Color.fromARGB(
                                        //                   255, 206, 229, 234)),
                                        //           columns: [
                                        //             DataColumn(
                                        //                 label: Text(
                                        //               "Time Stamp",
                                        //               style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             )),
                                        //             DataColumn(
                                        //                 label: Text(
                                        //               "Posted By",
                                        //               style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             )),
                                        //             DataColumn(
                                        //                 label: Text(
                                        //               "Comment",
                                        //               style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             )),
                                        //             DataColumn(
                                        //                 label: Text(
                                        //               "Location",
                                        //               style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             )),
                                        //             DataColumn(
                                        //                 label: Text(
                                        //               "Status",
                                        //               style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             )),
                                        //           ],
                                        //           rows: List<DataRow>.generate(
                                        //             controller.historyList
                                        //                     ?.length ??
                                        //                 0,
                                        //             (index) => DataRow(cells: [
                                        //               DataCell(Text(controller
                                        //                       .historyList?[
                                        //                           index]
                                        //                       ?.createdAt
                                        //                       .toString() ??
                                        //                   '')),
                                        //               DataCell(Text(controller
                                        //                       .historyList?[
                                        //                           index]
                                        //                       ?.createdByName
                                        //                       .toString() ??
                                        //                   '')),
                                        //               DataCell(Text(controller
                                        //                       .historyList?[
                                        //                           index]
                                        //                       ?.comment
                                        //                       .toString() ??
                                        //                   '')),
                                        //               DataCell(Text('--')),
                                        //               DataCell(Text(controller
                                        //                       .historyList?[
                                        //                           index]
                                        //                       ?.status_name
                                        //                       .toString() ??
                                        //                   '')),
                                        //             ]),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Dimens.boxHeight50,
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Container(
                                                height: 28,
                                                child: CustomElevatedButton(
                                                  icon: Icons.print_outlined,
                                                  backgroundColor: ColorValues
                                                      .appDarkBlueColor,
                                                  text: "Print",
                                                  onPressed: () {
                                                    // controller.printScreen();
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Container(
                                                height: 28,
                                                child: CustomElevatedButton(
                                                  icon: Icons.close,
                                                  backgroundColor:
                                                      ColorValues.rejectColor,
                                                  text: "Cancel",
                                                  onPressed: () {
                                                    // controller.printScreen();
                                                  },
                                                ),
                                              ),
                                            ),
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kVegetationControlFeatureId &&
                                                            e.approve ==
                                                                UserAccessConstants
                                                                    .kHaveApproveAccess)
                                                        .length >
                                                    0
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Container(
                                                      height: 28,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues
                                                                .rejectColor,
                                                        text: "Reject",
                                                        icon: Icons.close,
                                                        onPressed: () {
                                                          Get.dialog(
                                                              RejectVegExecutionDialog(
                                                            id: controller
                                                                .vegid.value,
                                                          ));
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            varUserAccessModel
                                                        .value.access_list!
                                                        .where((e) =>
                                                            e.feature_id ==
                                                                UserAccessConstants
                                                                    .kVegetationControlFeatureId &&
                                                            e.approve ==
                                                                UserAccessConstants
                                                                    .kHaveApproveAccess)
                                                        .length >
                                                    0
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Container(
                                                      height: 28,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues
                                                                .appGreenColor,
                                                        text: "Approve",
                                                        icon: Icons.check,
                                                        onPressed: () {
                                                          Get.dialog(
                                                              ApproveVegExecutionDialog(
                                                            id: controller
                                                                .vegid.value,
                                                          ));
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : Dimens.box0,
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
