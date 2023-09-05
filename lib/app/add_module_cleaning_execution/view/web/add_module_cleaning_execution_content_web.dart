// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';

import 'dart:convert';

import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/widgets/abandon_all_dialog.dart';
import 'package:cmms/app/widgets/abandon_schedule_execution_dialog.dart';
import 'package:cmms/app/widgets/add_module_cleaning_execution_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/end_mc_execution_dialog.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class AddModuleCleaningExecutionContentWeb
    extends GetView<AddModuleCleaningExecutionController> {
  AddModuleCleaningExecutionContentWeb({super.key});

  // final homeController = Get.find<HomeController>();
  final AddModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  Container(
                    height: 55,
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
                        Text(
                          "Dashboard",
                          style: Styles.greyLight14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(" / Module Cleaning Execution List",
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / Create Module Cleaning Execution",
                            style: Styles.greyMediumLight12)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    // height: MediaQuery.of(context).size.height / 1,
                    child: Card(
                      // color: Colors.lightBlue.shade50,
                      child: Wrap(
                        children: [
                          GetBuilder<AddModuleCleaningExecutionController>(
                              id: 'module-cleaning-execution',
                              builder: (controller) {
                                return Obx(
                                  () => Column(
                                    children: [
                                      CustomAppBar(
                                        title:
                                            'Create Module Cleaning Execution'
                                                .tr,
                                      ),
                                      Dimens.boxHeight20,
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
                                              CustomRichText(
                                                  title: 'Plan Title: '),
                                              Dimens.boxHeight20,
                                              CustomRichText(
                                                  title: 'Frequency: '),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.title}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                              Dimens.boxHeight15,
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.frequency}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth30,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomRichText(
                                                  title: 'Planned By: '),
                                              Dimens.boxHeight20,
                                              CustomRichText(
                                                  title: 'Start Date: '),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.plannedBy}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                              Dimens.boxHeight15,
                                              Text(
                                                ' ${controller.startedAtDateTimeCtrlrWeb.text}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxWidth30,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Planning Date & Time: '),
                                              Dimens.boxHeight20,
                                              CustomRichText(
                                                  title:
                                                      'Execution started by: '),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${controller.plannedAtDateTimeCtrlrWeb.text}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                              Dimens.boxHeight15,
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.startedBy}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                      Dimens.boxHeight50,

                                      ///Schedule Execution

                                      Wrap(
                                        children: [
                                          Container(
                                            height: 300,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          "Schedule Execution"),
                                                      Spacer(),
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .addRowItem();
                                                          },
                                                          child: Icon(Icons
                                                              .exposure_plus_1)),
                                                    ],
                                                  ),
                                                ),
                                                // Column(
                                                //     children: []
                                                //       ..addAll(
                                                //           controller
                                                //               .rowItem
                                                //               .value
                                                //               .map(
                                                //                   (e) {
                                                //         return Text(
                                                //             jsonEncode(
                                                //                 e));
                                                //       }))),
                                                // Text(jsonEncode(controller
                                                //     .dropdownMapperData)),
                                                Container(
                                                  height: 250,
                                                  child: ScrollableTableView(
                                                    columns: [
                                                      "Schedule Id",
                                                      "Days",
                                                      "Scheduled Module",
                                                      "Cleaned",
                                                      "Abandoned",
                                                      "Pending",
                                                      "Type",
                                                      "Water Used",
                                                      "Remark",
                                                      "Status",
                                                      "Actions",
                                                    ].map((column) {
                                                      return TableViewColumn(
                                                        label: column,
                                                        minWidth:
                                                            Get.width * 0.12,
                                                        height: Get.height / 2,
                                                      );
                                                    }).toList(),
                                                    rows: controller
                                                        .rowItem.value
                                                        .map((record) {
                                                      return TableViewRow(
                                                        height: 70,
                                                        cells: record
                                                            .map((mapData) {
                                                          return TableViewCell(
                                                            child: (mapData[
                                                                        'key'] ==
                                                                    "Schedule Id")
                                                                ? Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      // Text(
                                                                      //     '1')
                                                                    ]..addAll(controller
                                                                        .listSchedules!
                                                                        .map((element) =>
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  "${element?.scheduleId}",
                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                ),
                                                                              ],
                                                                            ))),
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Days")
                                                                    ? Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          // Text(
                                                                          //     '1')
                                                                        ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  "${element?.cleaningDay}",
                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                ),
                                                                              ],
                                                                            ))),
                                                                      )
                                                                    : (mapData['key'] ==
                                                                            "Scheduled Module")
                                                                        ? Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              // Text('2000')
                                                                            ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      "${element?.scheduledModules}",
                                                                                      style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                    ),
                                                                                  ],
                                                                                ))),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "Cleaned")
                                                                            ? Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  // Text('-')
                                                                                ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "${element?.cleanedModules}",
                                                                                          style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                        ),
                                                                                      ],
                                                                                    ))),
                                                                              )
                                                                            : (mapData['key'] == "Abandoned")
                                                                                ? Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      // Text('-')
                                                                                    ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              "${element?.abandonedModules}",
                                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                            ),
                                                                                          ],
                                                                                        ))),
                                                                                  )
                                                                                : (mapData['key'] == "Pending")
                                                                                    ? Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          // Text('-')
                                                                                        ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  "${element?.pendingModules}",
                                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                ),
                                                                                              ],
                                                                                            ))),
                                                                                      )
                                                                                    : (mapData['key'] == "Type")
                                                                                        ? Column(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              // Text('Wet')
                                                                                            ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      "${element?.cleaningTypeName}",
                                                                                                      style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                    ),
                                                                                                  ],
                                                                                                ))),
                                                                                          )
                                                                                        : (mapData['key'] == "Water Used")
                                                                                            ? Column(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  // Text('-')
                                                                                                ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          "${element?.waterUsed}",
                                                                                                          style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ))),
                                                                                              )
                                                                                            : (mapData['key'] == "Remark")
                                                                                                ? Column(
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: []..addAll(controller.listSchedules!.map((element) => Row(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsets.only(bottom: 5),
                                                                                                              child: SizedBox(
                                                                                                                width: MediaQuery.of(context).size.width / 9,
                                                                                                                height: 30,
                                                                                                                child: 
                                                                                                                LoginCustomTextfield(
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                                                    // FilteringTextInputFormatter.digitsOnly
                                                                                                                  ],
                                                                                                                  maxLine: 1,
                                                                                                                  textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                                                  onChanged: (txt) {
                                                                                                                    mapData["value"] = txt;
                                                                                                                    print('RemarkData${mapData["value"]}');
                                                                                                                  },
                                                                                                                )
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ))),
                                                                                                  )
                                                                                                : (mapData['key'] == "Status")
                                                                                                    ? Column(
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          // Text('-')
                                                                                                        ]..addAll(controller.listSchedules!.map((element) => Row(
                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  "${element?.status_short}",
                                                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ))),
                                                                                                      )
                                                                                                    : (mapData['key'] == "Actions")
                                                                                                        ? Padding(
                                                                                                            padding: const EdgeInsets.only(left: 20),
                                                                                                            child: Column(
                                                                                                              children: []..addAll(controller.listSchedules!.map((element) => Row(
                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      controller.listSchedules!
                                                                                                                                  .firstWhere(
                                                                                                                                    (e) => "${e?.status_short}" == e?.status_short,
                                                                                                                                    orElse: () => Schedules(status_short: ""),
                                                                                                                                  )
                                                                                                                                  ?.status_short ==
                                                                                                                              "Scheduled"
                                                                                                                          ? TableActionButton(
                                                                                                                              // label: 'Start',
                                                                                                                              onPress: () {
                                                                                                                                var filterdData = controller.listSchedules?.firstWhere((e) => e?.scheduleId == element?.scheduleId);
                                                                                                                                //  selectedData = filterdData;
                                                                                                                                controller.startMCExecutionScheduleButton(scheduleID: filterdData?.scheduleId);
                                                                                                                                print({'scheduledata:': filterdData?.scheduleId});
                                                                                                                              },
                                                                                                                              color: Colors.green,
                                                                                                                              icon: Icons.add,
                                                                                                                              message: 'Start',
                                                                                                                            )
                                                                                                                          : Container(),

                                                                                                                      controller.listSchedules!
                                                                                                                                  .firstWhere(
                                                                                                                                    (e) => "${e?.status_short}" == e?.status_short,
                                                                                                                                    orElse: () => Schedules(status_short: ""),
                                                                                                                                  )
                                                                                                                                  ?.status_short ==
                                                                                                                              "In Progress"
                                                                                                                          ?
                                                                                                                      TableActionButton(
                                                                                                                        // label: 'Abandon',
                                                                                                                        onPress: () {
                                                                                                                          // Get.dialog(AddModuleCleaningExecutionDialog());
                                                                                                                          var filterdData = controller.listSchedules?.firstWhere((e) => e?.scheduleId == element?.scheduleId);

                                                                                                                          controller.updateMCScheduleExecution(scheduleId: filterdData?.scheduleId, cleaningDay: filterdData?.cleaningDay, waterUsed: filterdData?.waterUsed);
                                                                                                                        },
                                                                                                                        color: ColorValues.appLightBlueColor,
                                                                                                                        icon: Icons.add,
                                                                                                                        message: 'Update',
                                                                                                                      )
                                                                                                                       : Container(),

                                                                                                                      ///Abandon
                                                                                                                      TableActionButton(
                                                                                                                        // label: 'Abandon',
                                                                                                                        onPress: () {
                                                                                                                          var filterdData = controller.listSchedules?.firstWhere((e) => e?.executionId == element?.executionId);
                                                                                                                          print({'Executiondata:': filterdData?.executionId});
                                                                                                                          Get.dialog(AbandoneScheduleExecutionDialog(
                                                                                                                            id: filterdData?.executionId,
                                                                                                                          ));
                                                                                                                        },
                                                                                                                        color: Colors.red,
                                                                                                                        icon: Icons.close,
                                                                                                                        message: 'Abandon',
                                                                                                                      ),

                                                                                                                      TableActionButton(
                                                                                                                        // label: 'Equipments',
                                                                                                                        onPress: () {
                                                                                                                          Get.dialog(AddModuleCleaningExecutionDialog());
                                                                                                                        },
                                                                                                                        color: ColorValues.appDarkBlueColor,
                                                                                                                        icon: Icons.category,
                                                                                                                        message: 'Equipments',
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ))),
                                                                                                            ),
                                                                                                          )
                                                                                                        : Text(mapData['key'] ?? ''),
                                                          );
                                                        }).toList(),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Container(
                                      //   height: 28,
                                      //   child: CustomElevatedButton(
                                      //     backgroundColor:
                                      //         ColorValues.appGreenColor,
                                      //     text: "Add Data",
                                      //     onPressed: () {
                                      //       controller
                                      //           .addStatusEscalationData(
                                      //               controller
                                      //                   .selectedTypePermitId);
                                      //       controller.addEscalationData(
                                      //           int.tryParse(
                                      //               '${controller.durationDaysTextCtrlr.text}'),
                                      //           controller
                                      //               .selectedRoleListId);
                                      //       print(
                                      //           'Controller:${controller.durationDaysTextCtrlr.text}');
                                      //       print(
                                      //           'Controller:${controller.selectedTypePermitId}');
                                      //       controller
                                      //           .durationDaysTextCtrlr
                                      //           .clear();
                                      //       controller.selectedRole
                                      //           .value = "";
                                      //     },
                                      //   ),
                                      // ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 150,
                                          ),

                                          SizedBox(
                                            width: 15,
                                          ),
                                          CustomElevatedButton(
                                            backgroundColor: Colors.red,
                                            onPressed: () {
                                              Get.offAndToNamed(Routes
                                                  .moduleCleaningListExecution);
                                            },
                                            text: 'Cancel',
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 28,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appLightBlueColor,
                                              text: "Update",
                                              onPressed: () {},
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          controller.data['status'] ==
                                                  "Scheduled"
                                              ? Container(
                                                  height: 28,
                                                  child: CustomElevatedButton(
                                                    backgroundColor: ColorValues
                                                        .appGreenColor,
                                                    text: "Start",
                                                    onPressed: () {
                                                      controller
                                                          .startMCExecutionButton();
                                                    },
                                                  ),
                                                )
                                              : Container(),

                                          SizedBox(
                                            width: 20,
                                          ),

                                          controller.data['status'] ==
                                                  "Abandoned"
                                              ? Container(
                                                  height: 28,
                                                  child: CustomElevatedButton(
                                                    backgroundColor: ColorValues
                                                        .appGreenColor,
                                                    text: "End",
                                                    onPressed: () {
                                                      Get.dialog(
                                                          EndMCExecutionDialog());
                                                    },
                                                  ),
                                                )
                                              : Container(),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 28,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appRedColor,
                                              text: "Abandoned All",
                                              onPressed: () {
                                                Get.dialog(AbandonAllDialog(
                                                    id: controller.data['id']));
                                                // controller
                                                //     .createEscalationMatrix();
                                              },
                                            ),
                                          ),

                                          //           varUserAccessModel.value.access_list!
                                          // .where((e) => e.feature_id == 3 && e.edit == 1)
                                          // .length > 0
                                          // &&
                                          // controller.incidentReportDetailsModel
                                          //             .value?.id !=
                                          //         null
                                          //     ? CustomElevatedButton(
                                          //         icon: Icons.edit,
                                          //         backgroundColor: Colors.green,
                                          //         onPressed: () {
                                          //           // controller.saveAsDraft();
                                          //           controller.editIncidentReport(
                                          //               id: controller
                                          //                   .incidentReportDetailsModel
                                          //                   .value
                                          //                   ?.id);
                                          //         },
                                          //         text: 'Edit',
                                          //       )
                                          //     : Container()
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
    );
  }
}
