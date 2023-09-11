import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/observation_pm_task_view_popup_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
                    final _flutterSecureStorage = const FlutterSecureStorage();

                    _flutterSecureStorage.delete(key: "scheduleId");

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
                                (controller.scheduleCheckPoint != [] &&
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
                                                    height: 50,
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

                                ///Assets

                                Container(
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
                                              "Assets",
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
                                            "SR.No.",
                                            "Asset",
                                            "Checklist",
                                            "Failure Score",
                                            "Action",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.18,
                                            );
                                          }).toList(),
                                          rows: [
                                            [
                                              "1",
                                              "Demo_Block_1_Inv_1",
                                              "demo_checklist_1",
                                              "0%",
                                              "Action",
                                            ],
                                            [
                                              "2",
                                              "Demo_Block_2_Inv_2",
                                              "demo_checklist_2",
                                              "20%",
                                              "Action",
                                            ],
                                            [
                                              "3",
                                              "Demo_Block_3_Inv_3",
                                              "demo_checklist_3",
                                              "0%",
                                              "Action",
                                            ],
                                            [
                                              "4",
                                              "Demo_Block_4_Inv_4",
                                              "demo_checklist_4",
                                              "0%",
                                              "Action",
                                            ],
                                            [
                                              "5",
                                              "Demo_Block_5_Inv_5",
                                              "demo_checklist_5",
                                              "80%",
                                              "Action",
                                            ],
                                          ].map((record) {
                                            return TableViewRow(
                                              height: 40,
                                              cells: record.map((value) {
                                                return TableViewCell(
                                                    child: (value == "0%")
                                                        ? Text(
                                                            '0%',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green),
                                                          )
                                                        : value == "20%"
                                                            ? Text(
                                                                '20%',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .yellow),
                                                              )
                                                            : value == "80%"
                                                                ? Text(
                                                                    '80%',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                  )
                                                                : (value ==
                                                                        "Action")
                                                                    ? Wrap(
                                                                        children: [
                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.viewColor,
                                                                            icon:
                                                                                Icons.remove_red_eye_outlined,
                                                                            message:
                                                                                'View',
                                                                            onPress:
                                                                                () {},
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : Text(value
                                                                        .toString()));
                                              }).toList(),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ////Material Used/Issued
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height: 250,
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
                                              "Material Used/Issued",
                                              style: Styles.blue700,
                                            ),
                                            Spacer(),
                                            TableActionButton( 
                                              color: ColorValues.appGreenColor,
                                              icon:
                                                  Icons.add,
                                              message: '',
                                              label: "Add New MRS",
                                              onPress: () {
                                               
                                              },
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
                                            "Sr.No.",
                                            "MRS ID",
                                            "MRS Item list",
                                            "Status",
                                            "Action",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.15,
                                            );
                                          }).toList(),
                                          rows: [
                                            [
                                              "1",
                                              "MRS45692",
                                              "String connector 60MM Male,String connector...",
                                              "Waiting For Approval",
                                              "Action",
                                            ],
                                            [
                                              "2",
                                              "MRS45693",
                                              "String connector 60MM Male,String connector...",
                                              "Approved",
                                              "Action",
                                            ],
                                          ].map((record) {
                                            return TableViewRow(
                                              height: 40,
                                              cells: record.map((value) {
                                                return TableViewCell(
                                                    child: (value == "Action")
                                                        ? Wrap(children: [
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              icon: Icons
                                                                  .remove_red_eye_outlined,
                                                              message: 'View',
                                                              onPress: () {
                                                                Get.dialog(
                                                                    ObservationPMTaskViewDialog());
                                                              },
                                                            ),
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .appGreenColor,
                                                              icon: Icons.add,
                                                              message: 'Add',
                                                              onPress: () {},
                                                            ),
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .appRedColor,
                                                              icon:
                                                                  Icons.remove,
                                                              message: 'Delete',
                                                              onPress: () {},
                                                            ),
                                                          ])
                                                        : Text(value));
                                              }).toList(),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Dimens.boxHeight30,
                                (controller.historyLog != [] &&
                                        controller.historyLog!.isNotEmpty)
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height:
                                            ((controller.historyLog?.length ??
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
                                                    height: 50,
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
                controller.pmtaskViewModel.value?.status == 161
                    ? Container(
                        height: 35,
                        child: CustomElevatedButton(
                          icon: Icons.link,
                          backgroundColor: ColorValues.linktopermitColor,
                          text: "Link to Permit",
                          onPressed: () {
                            controller.showPermitsDialog();

                            //controller.printScreen();
                          },
                        ),
                      )
                    : controller.pmtaskViewModel.value?.status == 172
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.start,
                              backgroundColor: ColorValues.linktopermitColor,
                              text: "Start",
                              onPressed: () {
                                controller.setPmTask();

                                //controller.printScreen();
                              },
                            ),
                          )
                        : Dimens.box0,
                Dimens.boxWidth50,
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    icon: Icons.close,
                    backgroundColor: ColorValues.cancelColor,
                    text: "Close",
                    onPressed: () {
                      Get.back();
                    },
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
