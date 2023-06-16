import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';

class PreventiveMaintenanceTaskViewContentWeb
    extends GetView<PreventiveMaintenanceTaskViewController> {
  PreventiveMaintenanceTaskViewContentWeb({super.key});

  ///
  var controller = Get.find<PreventiveMaintenanceTaskViewController>();
  @override
  Widget build(BuildContext context) {
    return buildDocument(context: context);
  }

  Widget buildDocument({required BuildContext context}) {
    return Obx(
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
                  color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                  child: Text(" / Preventive Maintenance".toUpperCase(),
                      style: Styles.greyMediumLight12),
                ),
                Text(" / PM TASK VIEW", style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Expanded(
            child: RepaintBoundary(
              key: controller.printKey,
              child: Container(
                width: MediaQuery.of(context).size.width,

                margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                // height: Get.height,
                child: Card(
                  color: Color.fromARGB(255, 245, 248, 250),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              "PM Task View ",
                              style: Styles.blue700,
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () async {},
                                text:
                                    "${controller.pmtaskViewModel.value?.status_name ?? ""}",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Expanded(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: Dimens.edgeInsets40_0_40_0,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Maintenance Order Number: ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Responsible Person: ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Due Date: ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Check List: ",
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
                                              "${controller.pmtaskViewModel.value?.maintenance_order_number ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.assigned_to_name ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.schedule_date ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.checklist_name ?? ""}",
                                              style: Styles.blue17),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Equipment Name: ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Last Done Date: ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Done Date: ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "frequency_name: ",
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
                                              "${controller.pmtaskViewModel.value?.equipment_name ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              " ${controller.pmtaskViewModel.value?.completed_date ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.completed_date ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.frequency_name ?? ""}",
                                              style: Styles.blue17),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                (controller.scheduleCheckPoint != null &&
                                        controller
                                            .scheduleCheckPoint!.isNotEmpty)
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height: 400,
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
                                                    "${controller.pmtaskViewModel.value?.checklist_name ?? ""}",
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
                                              child: ScrollableTableView(
                                                paginationController: controller
                                                    .schedulePaginationController,
                                                columns: [
                                                  "Check Point No.",
                                                  "Check Point",
                                                  "Requirement",
                                                  "Upload Images",
                                                  "Observation",
                                                  "Job ID",
                                                ].map((column) {
                                                  return TableViewColumn(
                                                    minWidth: Get.width * 0.15,
                                                    label: column,
                                                  );
                                                }).toList(),
                                                rows: //
                                                    [
                                                  ...List.generate(
                                                    controller
                                                            .scheduleCheckPoint
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      var scheduleCheckPointDetails =
                                                          controller
                                                                  .scheduleCheckPoint?[
                                                              index];
                                                      return [
                                                        '${scheduleCheckPointDetails?.check_point_id}',
                                                        '${scheduleCheckPointDetails?.check_point_name}',
                                                        '${scheduleCheckPointDetails?.requirement}',
                                                        "IMG2234",
                                                        '${scheduleCheckPointDetails?.observation}',
                                                        "JOB2344"
                                                      ];
                                                    },
                                                  ),
                                                ].map((record) {
                                                  return TableViewRow(
                                                    height: 90,
                                                    cells: record.map((value) {
                                                      return TableViewCell(
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Dimens.box0,
                                Dimens.boxHeight30,
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height: 200,
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
                                              "Associated Job(s) ",
                                              style: Styles.blue700,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Expanded(
                                        child: ScrollableTableView(
                                          columns: [
                                            "Job ID",
                                            "Check Point No.",
                                            "Job Title",
                                            "Job Date",
                                            "Job Status",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.15,
                                            );
                                          }).toList(),
                                          rows: [
                                            [
                                              "JQ325890",
                                              "2234",
                                              "Check and clean charging module",
                                              "2022-04-05",
                                              "In Progress",
                                            ],
                                          ].map((record) {
                                            return TableViewRow(
                                              height: 90,
                                              cells: record.map((value) {
                                                return TableViewCell(
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight30,
                                (controller.historyLog != null &&
                                        controller.historyLog!.isNotEmpty)
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height: 300,
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
                                                    "PM History ",
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
                                              child: ScrollableTableView(
                                                columns: [
                                                  "Time Stamp",
                                                  "Posted By",
                                                  "Comment",
                                                  "Location",
                                                  "Status",
                                                ].map((column) {
                                                  return TableViewColumn(
                                                    label: column,
                                                    minWidth: Get.width * 0.15,
                                                  );
                                                }).toList(),
                                                rows: [
                                                  ...List.generate(
                                                    controller.historyLog
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      var getHistoryListDetails =
                                                          controller
                                                                  .historyLog?[
                                                              index];
                                                      return [
                                                        '${getHistoryListDetails?.created_at}',
                                                        '${getHistoryListDetails?.created_by_name ?? ''}',
                                                        '${getHistoryListDetails?.comment ?? ''}',
                                                        '--',
                                                        '${getHistoryListDetails?.status ?? ''}',
                                                      ];
                                                    },
                                                  ),
                                                  // [
                                                ].map((record) {
                                                  return TableViewRow(
                                                    height: 90,
                                                    cells: record.map((value) {
                                                      return TableViewCell(
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                  );
                                                }).toList(),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Dimens.boxHeight20,
          Container(
            margin: EdgeInsets.only(bottom: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    icon: Icons.print_outlined,
                    backgroundColor: ColorValues.appDarkBlueColor,
                    text: "Print",
                    onPressed: () {
                      controller.printScreen();
                    },
                  ),
                ),
                Dimens.boxWidth50,
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    icon: Icons.close,
                    backgroundColor: ColorValues.appRedColor,
                    text: "Close",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
