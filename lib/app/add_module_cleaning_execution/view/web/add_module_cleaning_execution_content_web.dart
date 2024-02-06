// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';

import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/abandon_all_dialog.dart';
import 'package:cmms/app/widgets/abandon_schedule_execution_dialog.dart';
import 'package:cmms/app/widgets/add_module_cleaning_execution_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
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
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / CREATE MODULE CLEANING EXECUTION",
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
                                      Row(
                                        children: [
                                          Text(
                                            'Create Module Cleaning Execution',
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: controller
                                                            .mcExecutionDetailsModel
                                                            .value
                                                            ?.status ==
                                                        360
                                                    ? ColorValues.approveColor
                                                    : ColorValues.appRedColor,
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: controller
                                                              .mcExecutionDetailsModel
                                                              .value
                                                              ?.status ==
                                                          360 //125

                                                      ? ColorValues.approveColor
                                                      : ColorValues.appRedColor,
                                                ),
                                              ],
                                            ),
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
                                                ' ${controller.data['planId']}',
                                                style: Styles.blue17,
                                              ),
                                              Text(
                                                ' ${controller.data['id']}',
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
                                                ' ${controller.mcExecutionDetailsModel.value?.title}',
                                                style: Styles.blue17,
                                              ),
                                              Text(
                                                ' ${controller.mcExecutionDetailsModel.value?.frequency}',
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
                                                ' ${controller.mcExecutionDetailsModel.value?.plannedBy}',
                                                style: Styles.blue17,
                                              ),
                                              Text(
                                                ' ${controller.startedAtDateTimeCtrlrWeb.text}',
                                                style: Styles.blue17,
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          // Dimens.boxWidth30,
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
                                                ' ${controller.mcExecutionDetailsModel.value?.startedBy}',
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
                                        //  height: 300,
                                        height:
                                            ((controller.rowItem.value.length) *
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
                                            padding: const EdgeInsets.all(10.0),
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
                                              // minWidth: 2000,
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
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 60,
                                                    label: Text(
                                                      "Days",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Scheduled ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 90,
                                                    label: Text(
                                                      "Cleaned",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Abandoned",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 80,
                                                    label: Text(
                                                      "Pending",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 70,
                                                    label: Text(
                                                      "Type",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Water Used",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                DataColumn2(
                                                    fixedWidth: 150,
                                                    label: Text(
                                                      "Actions",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ],
                                              rows: controller.rowItem.value
                                                  .map((record) {
                                                return DataRow(
                                                  // height: 130,
                                                  cells: record.map((mapData) {
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
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                5,
                                                                                92,
                                                                                163)),
                                                                      ),
                                                                    )
                                                                  : (mapData['key'] ==
                                                                          "Cleaned")
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
                                                                                                        //  record[9]['value'] == "Scheduled"
                                                                                                        controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 360
                                                                                                            ? TableActionButton(
                                                                                                                // label: 'Start',
                                                                                                                onPress: () {
                                                                                                                  var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                  print('filteredData:${filterdData!.scheduleId}');
                                                                                                                  //  selectedData = filterdData;

                                                                                                                  controller.startMCExecutionScheduleButton(scheduleID: filterdData.scheduleId);
                                                                                                                  // print({
                                                                                                                  //   'scheduledata:':
                                                                                                                  //       filterdData.scheduleId
                                                                                                                  // });
                                                                                                                },
                                                                                                                color: Colors.green,
                                                                                                                icon: Icons.add,
                                                                                                                message: 'Start',
                                                                                                              )
                                                                                                            : Dimens.box0,

                                                                                                        //End MC Schedule Execution
                                                                                                        //  record[9]['value'] == "In Progress"
                                                                                                        controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 361
                                                                                                            ? TableActionButton(
                                                                                                                // label: 'Start',
                                                                                                                onPress: () {
                                                                                                                  var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                  print('filteredData:${filterdData!.scheduleId}');
                                                                                                                  //  selectedData = filterdData;

                                                                                                                  controller.endMCScheduleExecutionButton(scheduleID: filterdData.scheduleId);
                                                                                                                  // print({
                                                                                                                  //   'scheduledata:':
                                                                                                                  //       filterdData.scheduleId
                                                                                                                  // });
                                                                                                                },
                                                                                                                color: Color.fromARGB(255, 70, 95, 57),
                                                                                                                icon: Icons.add,
                                                                                                                message: 'End',
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
                                                                                                        TableActionButton(
                                                                                                          // label: 'Abandon',
                                                                                                          onPress: () {
                                                                                                            var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                            controller.scheduledId = filterdData?.scheduleId;
                                                                                                            print({
                                                                                                              'Executiondata:': filterdData?.executionId
                                                                                                            });
                                                                                                            Get.dialog(AbandoneScheduleExecutionDialog(
                                                                                                              id: filterdData?.executionId,
                                                                                                            ));
                                                                                                          },
                                                                                                          color: Colors.red,
                                                                                                          icon: Icons.close,
                                                                                                          message: 'Abandon',
                                                                                                        ),
                                                                                                        // :Dimens.box0,

                                                                                                        // controller.listSchedules!
                                                                                                        //             .firstWhere(
                                                                                                        //               (e) => "${e?.status_short}" == e?.status_short,
                                                                                                        //               orElse: () => Schedules(status_short: ""),
                                                                                                        //             )
                                                                                                        //             ?.status_short ==
                                                                                                        //         "In Progress"
                                                                                                        //     ?
                                                                                                        TableActionButton(
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
                                                                                                        ),
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
                                          SizedBox(
                                            width: 20,
                                          ),
                                          controller.mcExecutionDetailsModel
                                                      .value?.status ==
                                                  360
                                              ? varUserAccessModel
                                                          .value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kModuleCleaningFeatureId &&
                                                              e.edit ==
                                                                  UserAccessConstants
                                                                      .kHaveEditAccess)
                                                          .length >
                                                      0
                                                  ? Container(
                                                      height: 28,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues
                                                                .addNewColor,
                                                        text: "Start",
                                                        onPressed: () {
                                                          controller
                                                              .startMCExecutionButton();
                                                        },
                                                      ),
                                                    )
                                                  : Dimens.box0
                                              : Dimens.box0,
                                          // : Container(),

                                          Dimens.boxWidth10,

                                          controller.mcExecutionDetailsModel
                                                      .value?.status ==
                                                  361
                                              ? varUserAccessModel
                                                          .value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kModuleCleaningFeatureId &&
                                                              e.edit ==
                                                                  UserAccessConstants
                                                                      .kHaveEditAccess)
                                                          .length >
                                                      0
                                                  ? Container(
                                                      height: 28,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues
                                                                .cancelColor,
                                                        text: "End",
                                                        onPressed: () {
                                                          // Get.dialog(EndMCExecutionDialog());
                                                          controller
                                                              .endMcExecutionButton();
                                                        },
                                                      ),
                                                    )
                                                  : Dimens.box0
                                              : Dimens.box0,

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Dimens.boxWidth10,

                                          varUserAccessModel.value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kModuleCleaningFeatureId &&
                                                              e.edit ==
                                                                  UserAccessConstants
                                                                      .kHaveEditAccess)
                                                          .length >
                                                      0 ||
                                                  varUserAccessModel
                                                          .value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kModuleCleaningFeatureId &&
                                                              e.approve ==
                                                                  UserAccessConstants
                                                                      .kHaveApproveAccess)
                                                          .length >
                                                      0
                                              ? Container(
                                                  height: 28,
                                                  child: CustomElevatedButton(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 244, 116, 248),
                                                    text: "Abandoned All",
                                                    onPressed: () {
                                                      Get.dialog(
                                                          AbandonAllDialog(
                                                              id: controller
                                                                  .data['id']));
                                                      // controller
                                                      //     .createEscalationMatrix();
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
    );
  }
}
