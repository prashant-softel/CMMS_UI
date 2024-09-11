// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';

import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/add_module_cleaning_execution/custom_confirmation_dialog.dart';
import 'package:cmms/app/add_module_cleaning_execution/reassign_dailog.dart';
import 'package:cmms/app/add_module_cleaning_execution/tbt_done_mc_dialog.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/abandon_all_dialog.dart';
import 'package:cmms/app/widgets/abandon_schedule_execution_dialog.dart';
import 'package:cmms/app/widgets/add_module_cleaning_execution_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/domain/models/end_mc_execution_detail_model.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddModuleCleaningExecutionContentWeb
    extends GetView<AddModuleCleaningExecutionController> {
  AddModuleCleaningExecutionContentWeb({super.key});

  // final homeController = Get.find<HomeController>();
  final AddModuleCleaningExecutionController controller = Get.find();

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
                              Get.offNamed(Routes.moduleCleaningListExecution);
                            },
                            child: Text(" / MODULE CLEANING EXECUTION LIST",
                                style: Styles.greyLight14),
                          ),
                          Text(" / MODULE CLEANING EXECUTION",
                              style: Styles.greyLight14)
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
                                        Row(
                                          children: [
                                            Text(
                                              'Module Cleaning Execution',
                                              style: Styles.black17,
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
                                                color: controller
                                                            .mcExecutionDetailsModel
                                                            .value
                                                            ?.status ==
                                                        360
                                                    ? ColorValues.addNewColor
                                                    : controller
                                                                .mcExecutionDetailsModel
                                                                .value
                                                                ?.status ==
                                                            361
                                                        ? ColorValues.startColor
                                                        : controller
                                                                    .mcExecutionDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                362
                                                            ? ColorValues
                                                                .closeColor
                                                            : controller
                                                                        .mcExecutionDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    363
                                                                ? ColorValues
                                                                    .completeColor
                                                                : controller
                                                                            .mcExecutionDetailsModel
                                                                            .value
                                                                            ?.status ==
                                                                        364
                                                                    ? ColorValues
                                                                        .lightBlueColor
                                                                    : controller.mcExecutionDetailsModel.value?.status ==
                                                                            365
                                                                        ? ColorValues
                                                                            .approveColor
                                                                        : controller.mcExecutionDetailsModel.value?.status ==
                                                                                366
                                                                            ? ColorValues.rejectColor
                                                                            : controller.mcExecutionDetailsModel.value?.status == 367
                                                                                ? ColorValues.yellowColor
                                                                                : controller.mcExecutionDetailsModel.value?.status == 368
                                                                                    ? ColorValues.linktopermitColor
                                                                                    : controller.mcExecutionDetailsModel.value?.status == 381
                                                                                        ? const Color.fromARGB(255, 83, 105, 72)
                                                                                        : controller.mcExecutionDetailsModel.value?.status == 382
                                                                                            ? const Color.fromARGB(255, 142, 99, 96)
                                                                                            : controller.mcExecutionDetailsModel.value?.status == 383
                                                                                                ? ColorValues.approveColor
                                                                                                : controller.mcExecutionDetailsModel.value?.status == 384
                                                                                                    ? ColorValues.rejectColor
                                                                                                    : ColorValues.addNewColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),

                                              // decoration: BoxDecoration(
                                              //   borderRadius:
                                              //       BorderRadius.circular(10),
                                              //   border: Border.all(
                                              //     color: controller
                                              //                 .mcExecutionDetailsModel
                                              //                 .value
                                              //                 ?.status ==
                                              //             360
                                              //         ? ColorValues.approveColor
                                              //         : ColorValues.appRedColor,
                                              //     width: 1,
                                              //   ),
                                              //   boxShadow: [
                                              //     BoxShadow(
                                              //       color: controller
                                              //                   .mcExecutionDetailsModel
                                              //                   .value
                                              //                   ?.status ==
                                              //               360 //125

                                              //           ? ColorValues
                                              //               .approveColor
                                              //           : ColorValues
                                              //               .appRedColor,
                                              //     ),
                                              //   ],
                                              // ),

                                              child: Center(
                                                  child: Text(
                                                '${controller.mcExecutionDetailsModel.value?.status_short}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            )
                                          ],
                                        ),
                                        Divider(
                                            color: ColorValues.lightGreyColor),
                                        // Dimens.boxHeight20,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Plan ID: ',
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  'Task ID: ',
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  'Frequency: ',
                                                  style: Styles.black17,
                                                ),
                                              ],
                                            ),
                                            Dimens.boxWidth2,

                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'MCP${controller.planId}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  'MCT${controller.mcid}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  '${controller.mcExecutionDetailsModel.value?.frequency}',
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
                                                  'Start Date: ',
                                                  style: Styles.black17,
                                                ),
                                              ],
                                            ),

                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' ${controller.mcExecutionDetailsModel.value?.title}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  controller.mcExecutionDetailsModel
                                                              .value?.status !=
                                                          360
                                                      ? ' ${controller.mcExecutionDetailsModel.value?.startedAt}'
                                                      : '',
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
                                                  ' ${controller.mcExecutionDetailsModel.value?.plannedBy}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  ' ${controller.mcExecutionDetailsModel.value?.startedBy}',
                                                  style: Styles.blue17,
                                                ),

                                                // : Text("")
                                              ],
                                            ),
                                            Spacer(),
                                            // Dimens.boxWidth30,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Planning Date ',
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  'Schedule Date ',
                                                  style: Styles.black17,
                                                ),
                                              ],
                                            ),

                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                          .mcExecutionDetailsModel
                                                          .value
                                                          ?.plannedAt ??
                                                      '',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  controller
                                                          .mcExecutionDetailsModel
                                                          .value
                                                          ?.scheduledDate ??
                                                      '',
                                                  style: Styles.blue17,
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),

                                        Dimens.boxHeight50,

                                        ///Schedule Execution

                                        Container(
                                          margin: Dimens.edgeInsets20,
                                          //  height: 300,
                                          height: ((controller
                                                      .rowItem.value.length) *
                                                  90) +
                                              170,
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
                                          child: Column(children: [
                                            // Column(
                                            //     children: []..addAll(controller.rowItem.value.map((e) {
                                            //         return Text(jsonEncode(e));
                                            //       }))),
                                            // Text(jsonEncode(controller.dropdownMapperData)),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Schedule Execution",
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: DataTable2(
                                                minWidth: 1500,
                                                dataRowHeight: 105,
                                                columnSpacing: 10,
                                                border: TableBorder.all(
                                                    color: Color.fromARGB(
                                                        255, 206, 229, 234)),
                                                columns: [
                                                  DataColumn2(
                                                      fixedWidth: 60,
                                                      label: Text(
                                                        "Sch. Id",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 60,
                                                      label: Text(
                                                        "Days",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 100,
                                                      label: Text(
                                                        "Scheduled ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 90,
                                                      label: Text(
                                                        "Cleaned",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 100,
                                                      label: Text(
                                                        "Abandoned",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 80,
                                                      label: Text(
                                                        "Pending",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 70,
                                                      label: Text(
                                                        "Type",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 100,
                                                      label: Text(
                                                        "Water Used",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      // fixedWidth: 200,
                                                      label: Text(
                                                    "Remark",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataColumn2(
                                                      fixedWidth: 160,
                                                      label: Text(
                                                        "Permit Code",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 160,
                                                      label: Text(
                                                        "Permit Status",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 100,
                                                      label: Text(
                                                        "Status",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 150,
                                                      label: Text(
                                                        "Actions",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                ],
                                                rows: controller.rowItem.value
                                                    .map((record) {
                                                  return DataRow(
                                                    // height: 130,
                                                    cells:
                                                        record.map((mapData) {
                                                      return DataCell(
                                                        (mapData['key'] ==
                                                                "Schedule Id")
                                                            ? Text(
                                                                mapData["value"] ??
                                                                    "",
                                                                // "${element?.scheduleId}",
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            5,
                                                                            92,
                                                                            163)),
                                                              )
                                                            : (mapData['key'] ==
                                                                    "Days")
                                                                ? Center(
                                                                    child: Text(
                                                                      mapData["value"] ??
                                                                          "",
                                                                      // "${element?.scheduleId}",
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              5,
                                                                              92,
                                                                              163)),
                                                                    ),
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Scheduled Module")
                                                                    ? Center(
                                                                        child:
                                                                            Text(
                                                                          mapData["value"] ??
                                                                              "",
                                                                          // "${element?.scheduleId}",
                                                                          style:
                                                                              TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                        ),
                                                                      )
                                                                    : (mapData['key'] ==
                                                                            "Cleaned")
                                                                        ? Center(
                                                                            child:
                                                                                Text(
                                                                              mapData["value"] ?? "",
                                                                              // "${element?.scheduleId}",
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                            ),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "Abandoned")
                                                                            ? Center(
                                                                                child: Text(
                                                                                  mapData["value"] ?? "",
                                                                                  // "${element?.scheduleId}",
                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                ),
                                                                              )
                                                                            : (mapData['key'] == "Pending")
                                                                                ? Center(
                                                                                    child: Text(
                                                                                      mapData["value"] ?? "",
                                                                                      // "${element?.scheduleId}",
                                                                                      style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                    ),
                                                                                  )
                                                                                : (mapData['key'] == "Type")
                                                                                    ? Center(
                                                                                        child: Text(
                                                                                          mapData["value"] ?? "",
                                                                                          // "${element?.scheduleId}",
                                                                                          style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                        ),
                                                                                      )
                                                                                    : (mapData['key'] == "Permit Status")
                                                                                        ? Center(
                                                                                            child: Text(
                                                                                              mapData["value"] ?? "",
                                                                                              // "${element?.scheduleId}",
                                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                            ),
                                                                                          )
                                                                                        : (mapData['key'] == "Permit Code")
                                                                                            ? Center(
                                                                                                child: Text(
                                                                                                  mapData["value"] ?? "",
                                                                                                  // "${element?.scheduleId}",
                                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                ),
                                                                                              )
                                                                                            : (mapData['key'] == "Water Used")
                                                                                                // ? Column(
                                                                                                //     mainAxisAlignment: MainAxisAlignment.center,
                                                                                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                //     children: [
                                                                                                //       Container(
                                                                                                //           decoration: BoxDecoration(
                                                                                                //             boxShadow: [
                                                                                                //               BoxShadow(
                                                                                                //                 color: Colors.black26,
                                                                                                //                 offset: const Offset(
                                                                                                //                   5.0,
                                                                                                //                   5.0,
                                                                                                //                 ),
                                                                                                //                 blurRadius: 5.0,
                                                                                                //                 spreadRadius: 1.0,
                                                                                                //               ),
                                                                                                //             ],
                                                                                                //             color: ColorValues.whiteColor,
                                                                                                //             borderRadius: BorderRadius.circular(5),
                                                                                                //           ),
                                                                                                //           child: IgnorePointer(
                                                                                                //             child: LoginCustomTextfield(
                                                                                                //               width: MediaQuery.of(context).size.width / 2,
                                                                                                //               maxLine: 1,
                                                                                                //               textController: new TextEditingController(
                                                                                                //                   text: mapData["value"] ?? ''),
                                                                                                //               onChanged: (txt) {
                                                                                                //                 mapData["value"] = txt;
                                                                                                //               },
                                                                                                //             ),
                                                                                                //           )),
                                                                                                //     ],
                                                                                                //   )
                                                                                                ? Center(
                                                                                                    child: Text(
                                                                                                      mapData["value"] ?? "",
                                                                                                      // "${element?.scheduleId}",
                                                                                                      style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                    ),
                                                                                                  )
                                                                                                : (mapData['key'] == "Remark")
                                                                                                    ?
                                                                                                    // Column(
                                                                                                    //     mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    //     crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    //     children: [
                                                                                                    //       Container(
                                                                                                    //           decoration: BoxDecoration(
                                                                                                    //             boxShadow: [
                                                                                                    //               BoxShadow(
                                                                                                    //                 color: Colors.black26,
                                                                                                    //                 offset: const Offset(
                                                                                                    //                   5.0,
                                                                                                    //                   5.0,
                                                                                                    //                 ),
                                                                                                    //                 blurRadius: 5.0,
                                                                                                    //                 spreadRadius: 1.0,
                                                                                                    //               ),
                                                                                                    //             ],
                                                                                                    //             color: ColorValues.whiteColor,
                                                                                                    //             borderRadius: BorderRadius.circular(5),
                                                                                                    //           ),
                                                                                                    //           child: IgnorePointer(
                                                                                                    //             child: LoginCustomTextfield(
                                                                                                    //               width: MediaQuery.of(context).size.width / 2,
                                                                                                    //               maxLine: 1,
                                                                                                    //               textController: new TextEditingController(
                                                                                                    //                   text: mapData["value"] ?? ''),
                                                                                                    //               onChanged: (txt) {
                                                                                                    //                 mapData["value"] = txt;
                                                                                                    //               },
                                                                                                    //             ),
                                                                                                    //           )),
                                                                                                    //     ],
                                                                                                    //   )
                                                                                                    Center(
                                                                                                        child: Text(
                                                                                                          mapData["value"] ?? "",
                                                                                                          // "${element?.scheduleId}",
                                                                                                          style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                        ),
                                                                                                      )
                                                                                                    : (mapData['key'] == "Status")
                                                                                                        ? Text(
                                                                                                            mapData["value"] ?? "",
                                                                                                            // "${element?.scheduleId}",
                                                                                                            style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                          )
                                                                                                        : (mapData['key'] == "Actions")
                                                                                                            ? Wrap(
                                                                                                                children: [
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.permit_id == 0 && controller.mcExecutionDetailsModel.value?.status == 361
                                                                                                                      ? TableActionButton(
                                                                                                                          // label: 'Equipments',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                            controller.createNewPermit(scheduleID: filterdData?.scheduleId);
                                                                                                                          },
                                                                                                                          color: ColorValues.appDarkBlueColor,
                                                                                                                          icon: Icons.add,
                                                                                                                          message: 'Create New Permit',
                                                                                                                        )
                                                                                                                      : Dimens.box0,
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.permit_id != 0
                                                                                                                      ? TableActionButton(
                                                                                                                          color: ColorValues.appLightBlueColor,
                                                                                                                          icon: Icons.remove_red_eye,
                                                                                                                          message: "View Permit",
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                            controller.clearTypeStoreData();
                                                                                                                            controller.clearPermitStoreData();
                                                                                                                            controller.viewNewPermitList(permitId: filterdData?.permit_id, jobId: controller.jobDetailsModel.value!.id ?? 0);
                                                                                                                          })
                                                                                                                      : Dimens.box0,
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.ptw_status == 124 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.ptw_status == 132

                                                                                                                      // controller.pmtaskViewModel.value?.ptw_status == 124 || controller.pmtaskViewModel.value?.ptw_status == 132
                                                                                                                      ? TableActionButton(
                                                                                                                          color: Color.fromARGB(255, 116, 78, 130),
                                                                                                                          icon: Icons.ads_click,
                                                                                                                          message: 'Re-Submit Permit',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                            controller.editNewPermit(permitId: filterdData?.permit_id, isChecked: false
                                                                                                                                // controller
                                                                                                                                //     .isChecked
                                                                                                                                //     .value
                                                                                                                                );
                                                                                                                          },
                                                                                                                        )
                                                                                                                      : Dimens.box0,
                                                                                                                  //  record[9]['value'] == "Scheduled"
                                                                                                                  // controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 360
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 370 && controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.ptw_status == 125
                                                                                                                      ? TableActionButton(
                                                                                                                          // label: 'Start',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                            print('filteredData:${filterdData!.scheduleId}');
                                                                                                                            //  selectedData = filterdData;
                                                                                                                            filterdData.ptw_tbt_done == 1
                                                                                                                                ? Get.dialog<void>(CustomCalibrationDialog(id: filterdData.scheduleId ?? 0, title: filterdData.scheduleId.toString(), starttype: 1))

                                                                                                                                //controller.startMCExecutionScheduleButton(scheduleID: filterdData.scheduleId)
                                                                                                                                : filterdData.ptw_tbt_done == 0 && filterdData.tbt_start == 0
                                                                                                                                    ? Get.defaultDialog(
                                                                                                                                        radius: 5,
                                                                                                                                        title: 'Alert',
                                                                                                                                        middleText: 'Unable to start task due to permit taken for ${filterdData.startDate}',
                                                                                                                                        textConfirm: 'OK',
                                                                                                                                        onConfirm: () {
                                                                                                                                          Get.back(); // Close the dialog
                                                                                                                                          // Get.offAllNamed(Routes.pmTask);
                                                                                                                                        },
                                                                                                                                        buttonColor: ColorValues.appGreenColor,
                                                                                                                                        confirmTextColor: Colors.white,
                                                                                                                                        barrierDismissible: false)
                                                                                                                                    : Get.dialog<void>(TbtDoneMcDialog(ptw_id: filterdData.permit_id ?? 0, id: controller.mcExecutionDetailsModel.value?.executionId ?? 0));
                                                                                                                            // print({
                                                                                                                            //   'scheduledata:':
                                                                                                                            //       filterdData.scheduleId
                                                                                                                            // });
                                                                                                                          },
                                                                                                                          color: ColorValues.startColor,
                                                                                                                          icon: Icons.start,
                                                                                                                          message: 'Start',
                                                                                                                        )
                                                                                                                      : Dimens.box0,

                                                                                                                  // controller.listSchedules!
                                                                                                                  //             .firstWhere(
                                                                                                                  //               (e) => "${e?.status_short}" == e?.status_short,
                                                                                                                  //               orElse: () => Schedules(status_short: ""),
                                                                                                                  //             )
                                                                                                                  //             ?.status_short ==
                                                                                                                  //         "Completed"
                                                                                                                  //     ?
                                                                                                                  // TableActionButton(
                                                                                                                  //   onPress: () {
                                                                                                                  //     // Get.dialog(AddModuleCleaningExecutionDialog());
                                                                                                                  //     var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                  //     controller.updateMCScheduleExecution(scheduleId: filterdData?.scheduleId, cleaningDay: filterdData?.cleaningDay, waterUsed: filterdData?.waterUsed);
                                                                                                                  //     // print({"filteredData:${filterdData?.scheduleId}"});
                                                                                                                  //     // print({"filteredData:${filterdData!.cleaningDay}"});
                                                                                                                  //     // print({"filteredData:${filterdData.waterUsed}"});
                                                                                                                  //   },
                                                                                                                  //   color: ColorValues.appLightBlueColor,
                                                                                                                  //   icon: Icons.add,
                                                                                                                  //   message: 'Update',
                                                                                                                  // ),
                                                                                                                  // : Dimens.box0,

                                                                                                                  ///Abandon
                                                                                                                  // controller.listSchedules!
                                                                                                                  //             .firstWhere(
                                                                                                                  //               (e) => "${e?.status_short}" == e?.status_short,
                                                                                                                  //               orElse: () => Schedules(status_short: ""),
                                                                                                                  //             )
                                                                                                                  //             ?.status_short ==
                                                                                                                  //         "In Progress"
                                                                                                                  //     ?
                                                                                                                  // controller.mcExecutionDetailsModel.value?.status == 361
                                                                                                                  //     ? TableActionButton(
                                                                                                                  //         // label: 'Abandon',
                                                                                                                  //         onPress: () {
                                                                                                                  //           var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                  //           controller.scheduledId = filterdData?.scheduleId;
                                                                                                                  //           print({'Executiondata:': filterdData?.executionId});
                                                                                                                  //           Get.dialog(AbandoneScheduleExecutionDialog(
                                                                                                                  //             id: filterdData?.executionId,
                                                                                                                  //           ));
                                                                                                                  //         },
                                                                                                                  //         color: Colors.red,
                                                                                                                  //         icon: Icons.close,
                                                                                                                  //         message: 'Abandon',
                                                                                                                  //       )
                                                                                                                  //     : Dimens.box0,

                                                                                                                  // controller.listSchedules!
                                                                                                                  //             .firstWhere(
                                                                                                                  //               (e) => "${e?.status_short}" == e?.status_short,
                                                                                                                  //               orElse: () => Schedules(status_short: ""),
                                                                                                                  //             )
                                                                                                                  //             ?.status_short ==
                                                                                                                  //         "In Progress"
                                                                                                                  //     ?
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 361 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 384
                                                                                                                      ? TableActionButton(
                                                                                                                          // label: 'Equipments',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                            Get.dialog(AddModuleCleaningExecutionDialog(
                                                                                                                              scheduleId: filterdData!.scheduleId,
                                                                                                                              cleaningDay: filterdData.cleaningDay,
                                                                                                                              waterUsed: filterdData.waterUsed,
                                                                                                                            ));
                                                                                                                          },
                                                                                                                          color: ColorValues.appDarkBlueColor,
                                                                                                                          icon: Icons.category,
                                                                                                                          message: 'Equipments',
                                                                                                                        )
                                                                                                                      : Dimens.box0,
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 361 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 384
                                                                                                                      ? TableActionButton(
                                                                                                                          // label: 'Start',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                            print('filteredData:${filterdData!.scheduleId}');
                                                                                                                            //  selectedData = filterdData;
                                                                                                                            Get.dialog<void>(CustomCalibrationDialog(id: filterdData.scheduleId ?? 0, ptw_id: filterdData.permit_id, title: filterdData.scheduleId.toString(), starttype: 2));
                                                                                                                            // print({
                                                                                                                            //   'scheduledata:':
                                                                                                                            //       filterdData.scheduleId
                                                                                                                            // });
                                                                                                                          },
                                                                                                                          color: ColorValues.closeColor, //Color.fromARGB(255, 70, 95, 57),
                                                                                                                          icon: Icons.close,
                                                                                                                          message: 'Close',
                                                                                                                        )
                                                                                                                      : Dimens.box0,
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 383 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 363 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.ptw_status == 125 && controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 364
                                                                                                                      ? TableActionButton(
                                                                                                                          // label: 'Equipments',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                            Get.dialog(AddModuleCleaningExecutionDialog(scheduleId: filterdData!.scheduleId, cleaningDay: filterdData.cleaningDay, waterUsed: filterdData.waterUsed, is_view: 1));
                                                                                                                          },
                                                                                                                          color: ColorValues.appDarkBlueColor,
                                                                                                                          icon: Icons.remove_red_eye,
                                                                                                                          message: 'View',
                                                                                                                        )
                                                                                                                      : Dimens.box0,
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 363
                                                                                                                      ? TableActionButton(
                                                                                                                          // label: 'Equipments',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                            Get.dialog(CustonApproveRejectDialog(
                                                                                                                              text: "Schedule Approve",
                                                                                                                              controller: controller,
                                                                                                                              buttonText: "Approve",
                                                                                                                              style: Styles.greenElevatedButtonStyle,
                                                                                                                              onPressed: () {
                                                                                                                                controller.approveShecduleExecution(filterdData?.scheduleId ?? 0);
                                                                                                                                Get.back();
                                                                                                                              },
                                                                                                                            ));
                                                                                                                          },
                                                                                                                          color: ColorValues.approveColor,
                                                                                                                          icon: Icons.check,
                                                                                                                          message: 'Approve',
                                                                                                                        )
                                                                                                                      : Dimens.box0,
                                                                                                                  controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 363
                                                                                                                      ? TableActionButton(
                                                                                                                          // label: 'Equipments',
                                                                                                                          onPress: () {
                                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                            Get.dialog(CustonApproveRejectDialog(
                                                                                                                              text: "Schedule Reject",
                                                                                                                              controller: controller,
                                                                                                                              buttonText: "Reject",
                                                                                                                              style: Styles.darkRedElevatedButtonStyle,
                                                                                                                              onPressed: () {
                                                                                                                                controller.rejectShecduleExecution(filterdData?.scheduleId ?? 0);
                                                                                                                                Get.back();
                                                                                                                              },
                                                                                                                            ));
                                                                                                                          },
                                                                                                                          color: ColorValues.rejectColor,
                                                                                                                          icon: Icons.close,
                                                                                                                          message: 'Reject',
                                                                                                                        )
                                                                                                                      : Dimens.box0,
                                                                                                                ],
                                                                                                              )
                                                                                                            : Text(mapData['key'] ?? ''),
                                                      );
                                                    }).toList(),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ]),
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 150,
                                            ),

                                            // SizedBox(
                                            //   width: 20,
                                            // ),
                                            // Container(
                                            //   height: 28,
                                            //   child: CustomElevatedButton(
                                            //     backgroundColor:
                                            //         ColorValues.appLightBlueColor,
                                            //     text: "Update",
                                            //     onPressed: () {},
                                            //   ),
                                            // ),
                                            controller.mcExecutionDetailsModel
                                                            .value?.status ==
                                                        387 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kModuleCleaningexeFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveAddAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues.blueColor,
                                                      text: "Re-assign",
                                                      onPressed: () {
                                                        Get.dialog<void>(
                                                            AssignToMcDialog(
                                                          id: controller
                                                                  .mcExecutionDetailsModel
                                                                  .value
                                                                  ?.executionId ??
                                                              0,
                                                        ));

                                                        // controller
                                                        //     .startMCExecutionButton();
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            Dimens.boxWidth10,
                                            controller.mcExecutionDetailsModel
                                                            .value?.status ==
                                                        360 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kModuleCleaningexeFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .addNewColor,
                                                      text: "Start",
                                                      onPressed: () {
                                                        Get.dialog<void>(
                                                            CustomCalibrationDialog(
                                                          id: controller
                                                                  .mcExecutionDetailsModel
                                                                  .value
                                                                  ?.executionId ??
                                                              0,
                                                          title: controller
                                                                  .mcExecutionDetailsModel
                                                                  .value
                                                                  ?.title ??
                                                              "",
                                                        ));

                                                        // controller
                                                        //     .startMCExecutionButton();
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            // : Container(),

                                            Dimens.boxWidth10,

                                            controller.mcExecutionDetailsModel
                                                                .value?.status ==
                                                            361 &&
                                                        varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length >
                                                            0 ||
                                                    controller.mcExecutionDetailsModel.value?.status == 382 &&
                                                        varUserAccessModel.value.access_list!
                                                                .where((e) =>
                                                                    e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId &&
                                                                    e.edit ==
                                                                        UserAccessConstants
                                                                            .kHaveEditAccess)
                                                                .length >
                                                            0 ||
                                                    controller.mcExecutionDetailsModel.value?.status == 368 &&
                                                        varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) => e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId && e.edit == UserAccessConstants.kHaveEditAccess)
                                                                .length >
                                                            0
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .cancelColor,
                                                      text: "Close",
                                                      onPressed: () {
                                                        controller.allScheduleTrue
                                                                    .value ==
                                                                false
                                                            ? Get.defaultDialog(
                                                                radius: 5,
                                                                title: 'Alert',
                                                                middleText:
                                                                    'Please complete the all schedules',
                                                                textConfirm:
                                                                    'OK',
                                                                onConfirm: () {
                                                                  Get.back(); // Close the dialog
                                                                },
                                                                buttonColor:
                                                                    ColorValues
                                                                        .appGreenColor,
                                                                confirmTextColor:
                                                                    Colors
                                                                        .white,
                                                              )
                                                            : Get.dialog<void>(CustomCalibrationDialog(
                                                                id: controller
                                                                        .mcExecutionDetailsModel
                                                                        .value
                                                                        ?.executionId ??
                                                                    0,
                                                                title: controller
                                                                        .mcExecutionDetailsModel
                                                                        .value
                                                                        ?.title ??
                                                                    "",
                                                                starttype: 3));

                                                        // Get.dialog(EndMCExecutionDialog());
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,

                                            Dimens.boxWidth5,
                                            Container(
                                              height: 28,
                                              child: CustomElevatedButton(
                                                icon: Icons.print,
                                                backgroundColor: ColorValues
                                                    .linktopermitColor,
                                                text: "Print",
                                                onPressed: () {
                                                  controller.generateInvoice();
                                                },
                                              ),
                                            ),

                                            Dimens.boxWidth5,
                                            controller.mcExecutionDetailsModel.value?.status == 361 &&
                                                        varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId &&
                                                                    e.edit ==
                                                                        UserAccessConstants
                                                                            .kHaveEditAccess)
                                                                .length >
                                                            0 &&
                                                        controller
                                                                .allScheduleTrue
                                                                .value ==
                                                            false ||
                                                    controller.mcExecutionDetailsModel
                                                                .value?.status ==
                                                            368 &&
                                                        varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) => e.feature_id == UserAccessConstants.kModuleCleaningexeFeatureId && e.edit == UserAccessConstants.kHaveEditAccess)
                                                                .length >
                                                            0 &&
                                                        controller.allScheduleTrue.value == false
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              244, 116, 248),
                                                      text: "Abandoned All",
                                                      onPressed: () {
                                                        Get.dialog(AbandonAllDialog(
                                                            id: controller
                                                                .mcExecutionDetailsModel
                                                                .value
                                                                ?.executionId));

                                                        // controller
                                                        //     .createEscalationMatrix();
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,

                                            controller.mcExecutionDetailsModel
                                                            .value?.status ==
                                                        363 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kModuleCleaningexeFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .approveColor,
                                                      text: "Approve",
                                                      onPressed: () {
                                                        Get.dialog(
                                                            CustonApproveRejectDialog(
                                                          text:
                                                              "Execution Approve",
                                                          controller:
                                                              controller,
                                                          buttonText: "Approve",
                                                          style: Styles
                                                              .greenElevatedButtonStyle,
                                                          onPressed: () {
                                                            controller.endApproveExecution(
                                                                controller
                                                                        .mcExecutionDetailsModel
                                                                        .value
                                                                        ?.executionId ??
                                                                    0);
                                                            Get.back();
                                                          },
                                                        ));

                                                        // Get.dialog(EndMCExecutionDialog());
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            Dimens.boxWidth10,
                                            controller.mcExecutionDetailsModel
                                                            .value?.status ==
                                                        363 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kModuleCleaningexeFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .cancelColor,
                                                      text: "Reject",
                                                      onPressed: () {
                                                        Get.dialog(
                                                            CustonApproveRejectDialog(
                                                          text:
                                                              "Execution Reject",
                                                          controller:
                                                              controller,
                                                          buttonText: "Reject",
                                                          style: Styles
                                                              .darkRedElevatedButtonStyle,
                                                          onPressed: () {
                                                            controller.endRejectExecution(
                                                                controller
                                                                        .mcExecutionDetailsModel
                                                                        .value
                                                                        ?.executionId ??
                                                                    0);
                                                            Get.back();
                                                          },
                                                        ));

                                                        // Get.dialog(EndMCExecutionDialog());
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            controller.mcExecutionDetailsModel
                                                            .value?.status ==
                                                        364 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kModuleCleaningexeFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .approveColor,
                                                      text: "Approve",
                                                      onPressed: () {
                                                        Get.dialog(
                                                            CustonApproveRejectDialog(
                                                          text:
                                                              "Abandoned Approve",
                                                          controller:
                                                              controller,
                                                          buttonText: "Approve",
                                                          style: Styles
                                                              .greenElevatedButtonStyle,
                                                          onPressed: () {
                                                            controller.abandonedApproveExecution(
                                                                controller
                                                                        .mcExecutionDetailsModel
                                                                        .value
                                                                        ?.executionId ??
                                                                    0);
                                                            Get.back();
                                                          },
                                                        ));

                                                        // Get.dialog(EndMCExecutionDialog());
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            Dimens.boxWidth10,
                                            controller.mcExecutionDetailsModel
                                                            .value?.status ==
                                                        364 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kModuleCleaningexeFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 28,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .cancelColor,
                                                      text: "Reject",
                                                      onPressed: () {
                                                        Get.dialog(
                                                            CustonApproveRejectDialog(
                                                          text:
                                                              "Abandoned Reject",
                                                          controller:
                                                              controller,
                                                          buttonText: "Reject",
                                                          style: Styles
                                                              .darkRedElevatedButtonStyle,
                                                          onPressed: () {
                                                            controller.abandoneRejectExecution(
                                                                controller
                                                                        .mcExecutionDetailsModel
                                                                        .value
                                                                        ?.executionId ??
                                                                    0);
                                                            Get.back();
                                                          },
                                                        ));

                                                        // Get.dialog(EndMCExecutionDialog());
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,

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
      ),
    );
  }
}
