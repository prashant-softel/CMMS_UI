import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/confirmation_dialog.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/reassign_veg_dialog.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/tbt_veg_dialog.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/veg_schedule_approve_dialog.dart';
import 'package:cmms/app/widgets/abandon_veg_execution.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/vegetation_cleaning_execution_dialog.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegExecutionWeb extends GetView<VegExecutionController> {
  VegExecutionWeb({super.key});

  // final homeController = Get.find<HomeController>();
  final VegExecutionController controller = Get.find();

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
                              controller.clearStoreData();
                              Get.offNamed(Routes.vegExecutionListScreen);
                            },
                            child: Text(
                              " / VEGETATION EXECUTION LIST",
                              style: Styles.greyLight14,
                            ),
                          ),
                          Text(
                            " / VEGETATION EXECUTION",
                            style: Styles.greyLight14,
                          )
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
                            GetBuilder<VegExecutionController>(
                                id: 'module-cleaning-execution',
                                builder: (controller) {
                                  return Obx(
                                    () => Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Vegetation Plan Execution',
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
                                                        721
                                                    ? ColorValues.approveColor
                                                    : controller
                                                                .vegExecutionDetailsModel
                                                                .value
                                                                ?.status ==
                                                            722
                                                        ? ColorValues.startColor
                                                        : controller
                                                                    .vegExecutionDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                725
                                                            ? ColorValues
                                                                .appLightBlueColor
                                                            : controller
                                                                        .vegExecutionDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    726
                                                                ? ColorValues
                                                                    .rejectColor
                                                                : controller
                                                                            .vegExecutionDetailsModel
                                                                            .value
                                                                            ?.status ==
                                                                        727
                                                                    ? ColorValues
                                                                        .approveColor
                                                                    : controller.vegExecutionDetailsModel.value?.status ==
                                                                            724
                                                                        ? ColorValues
                                                                            .closeColor
                                                                        : controller.vegExecutionDetailsModel.value?.status ==
                                                                                731
                                                                            ? ColorValues.approveColor
                                                                            : controller.vegExecutionDetailsModel.value?.status == 734
                                                                                ? ColorValues.appLightBlueColor
                                                                                : ColorValues.rejectedStatusColor,
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
                                                  '${"VC${controller.vegid.value == 0 ? "" : controller.vegid.value}"}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  'VE${controller.vegExecutionDetailsModel.value?.executionId == null ? "" : controller.vegExecutionDetailsModel.value?.executionId}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  '${controller.vegExecutionDetailsModel.value?.frequency}',
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
                                                  ' ${controller.vegExecutionDetailsModel.value?.title}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  controller.vegExecutionDetailsModel
                                                              .value?.status !=
                                                          721
                                                      ? ' ${controller.vegExecutionDetailsModel.value?.startedAt}'
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
                                                  'Schedule Date: ',
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
                                                controller.vegExecutionDetailsModel
                                                            .value?.status !=
                                                        360
                                                    ? Text(
                                                        controller
                                                                .vegExecutionDetailsModel
                                                                .value
                                                                ?.scheduledDate ??
                                                            '',
                                                        style: Styles.blue17,
                                                      )
                                                    : Text("")
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
                                                  ' ${controller.vegExecutionDetailsModel.value?.plannedAt == null ? "" : controller.vegExecutionDetailsModel.value?.plannedAt}',
                                                  style: Styles.blue17,
                                                ),
                                                Text(
                                                  ' ${controller.vegExecutionDetailsModel.value?.startedBy == null ? "" : controller.vegExecutionDetailsModel.value?.startedBy}',
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
                                                dataRowHeight: 105,
                                                columnSpacing: 10,
                                                border: TableBorder.all(
                                                  color: Color.fromARGB(
                                                      255, 206, 229, 234),
                                                ),
                                                columns: [
                                                  DataColumn2(
                                                    fixedWidth: 60,
                                                    label: Text(
                                                      "Sch. Id",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 60,
                                                    label: Text(
                                                      "Days",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Scheduled ",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 90,
                                                    label: Text(
                                                      "Cleaned",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Abandoned",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 80,
                                                    label: Text(
                                                      "Pending",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    // fixedWidth: 200,
                                                    label: Text(
                                                      "Remark",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    // fixedWidth: 200,
                                                    label: Text(
                                                      "Permit Code",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    // fixedWidth: 200,
                                                    label: Text(
                                                      "Permit Status",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 100,
                                                    label: Text(
                                                      "Status",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    fixedWidth: 150,
                                                    label: Text(
                                                      "Actions",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                rows: controller.rowItem.value
                                                    .map(
                                                  (record) {
                                                    return DataRow(
                                                      // height: 130,
                                                      cells: record.map(
                                                        (mapData) {
                                                          return DataCell(
                                                            (mapData['key'] ==
                                                                    "Schedule Id")
                                                                ? Text(
                                                                    mapData["value"] ??
                                                                        "",
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            5,
                                                                            92,
                                                                            163)),
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Days")
                                                                    ? Center(
                                                                        child:
                                                                            Text(
                                                                          mapData["value"] ??
                                                                              "",
                                                                          style:
                                                                              TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                5,
                                                                                92,
                                                                                163),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : (mapData['key'] ==
                                                                            "Scheduled Module")
                                                                        ? Center(
                                                                            child:
                                                                                Text(
                                                                              mapData["value"] ?? "",
                                                                              // "${element?.scheduleId}",
                                                                              style: TextStyle(
                                                                                color: Color.fromARGB(255, 5, 92, 163),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "Cleaned")
                                                                            ? Center(
                                                                                child: Text(
                                                                                  mapData["value"] ?? "",
                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                ),
                                                                              )
                                                                            : (mapData['key'] == "Abandoned")
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
                                                                                    : (mapData['key'] == "Remark")
                                                                                        ? Center(
                                                                                            child: Text(
                                                                                              mapData["value"] ?? "",
                                                                                              // "${element?.scheduleId}",
                                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                            ),
                                                                                          )
                                                                                        : (mapData['key'] == "Permit_code")
                                                                                            ? Center(
                                                                                                child: Text(
                                                                                                  mapData["value"] ?? "",
                                                                                                  // "${element?.scheduleId}",
                                                                                                  style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                ),
                                                                                              )
                                                                                            : (mapData['key'] == "Permit_status")
                                                                                                ? Center(
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
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.permit_id == 0 && controller.vegExecutionDetailsModel.value?.status == 722
                                                                                                                  ? TableActionButton(
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                        controller.createNewPermit(scheduleID: filterdData?.scheduleId);
                                                                                                                      },
                                                                                                                      color: ColorValues.appDarkBlueColor,
                                                                                                                      icon: Icons.add,
                                                                                                                      message: 'Create New Permit',
                                                                                                                    )
                                                                                                                  : Dimens.box0,
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.permit_id != 0
                                                                                                                  ? TableActionButton(
                                                                                                                      color: ColorValues.appLightBlueColor,
                                                                                                                      icon: Icons.remove_red_eye,
                                                                                                                      message: "View Permit",
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                        controller.clearPermitStoreData();
                                                                                                                        controller.viewNewPermitList(permitId: filterdData?.permit_id, jobId: controller.jobDetailsModel.value!.id ?? 0);
                                                                                                                      })
                                                                                                                  : Dimens.box0,
                                                                                                              //  record[9]['value'] == "Scheduled"
                                                                                                              // controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 360
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 370 && controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.ptw_status == 125
                                                                                                                  ? TableActionButton(
                                                                                                                      // label: 'Start',
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                        print('filteredData:${filterdData!.scheduleId}');
                                                                                                                        filterdData.ptw_tbt_done == 1
                                                                                                                            ? Get.dialog<void>(CustomVegetationDialog(id: filterdData.scheduleId ?? 0, title: filterdData.scheduleId.toString(), starttype: 1))
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
                                                                                                                                : Get.dialog<void>(TbtDoneVegDialog(ptw_id: filterdData.permit_id ?? 0, id: controller.vegExecutionDetailsModel.value?.executionId ?? 0));
                                                                                                                      },
                                                                                                                      color: ColorValues.startColor,
                                                                                                                      icon: Icons.start,
                                                                                                                      message: 'Start',
                                                                                                                    )
                                                                                                                  : Dimens.box0,

                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 722 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 384 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 732
                                                                                                                  ? TableActionButton(
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                        Get.dialog(
                                                                                                                          VegetationExecutionDialog(
                                                                                                                            scheduleId: filterdData!.scheduleId,
                                                                                                                            cleaningDay: filterdData.cleaningDay,
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                      color: ColorValues.appDarkBlueColor,
                                                                                                                      icon: Icons.category,
                                                                                                                      message: 'Equipments',
                                                                                                                    )
                                                                                                                  : Dimens.box0,
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 722 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 384 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 732
                                                                                                                  ? TableActionButton(
                                                                                                                      // label: 'Start',
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);

                                                                                                                        print('filteredData:${filterdData!.scheduleId}');
                                                                                                                        //  selectedData = filterdData;
                                                                                                                        Get.dialog<void>(CustomVegetationDialog(id: filterdData.scheduleId ?? 0, ptw_id: filterdData.permit_id, title: filterdData.scheduleId.toString(), starttype: 2));
                                                                                                                      },
                                                                                                                      color: ColorValues.closeColor, //Color.fromARGB(255, 70, 95, 57),
                                                                                                                      icon: Icons.close,
                                                                                                                      message: 'Close',
                                                                                                                    )
                                                                                                                  : Dimens.box0,
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.ptw_status == 124 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.ptw_status == 132

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
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 724 || controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 731
                                                                                                                  ? TableActionButton(
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                        Get.dialog(VegetationExecutionDialog(scheduleId: filterdData!.scheduleId, cleaningDay: filterdData.cleaningDay, is_view: 1));
                                                                                                                      },
                                                                                                                      color: ColorValues.appDarkBlueColor,
                                                                                                                      icon: Icons.remove_red_eye,
                                                                                                                      message: 'View',
                                                                                                                    )
                                                                                                                  : Dimens.box0,
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 724
                                                                                                                  ? TableActionButton(
                                                                                                                      // label: 'Equipments',
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                        Get.dialog(CustomScheduleApproveRejectDialog(
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
                                                                                                              controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => VegSchedules(status: -1))?.status == 724
                                                                                                                  ? TableActionButton(
                                                                                                                      // label: 'Equipments',
                                                                                                                      onPress: () {
                                                                                                                        var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                        Get.dialog(CustomScheduleApproveRejectDialog(
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
                                                        },
                                                      ).toList(),
                                                    );
                                                  },
                                                ).toList(),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            controller.vegExecutionDetailsModel
                                                            .value?.status ==
                                                        387 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kVegetationControlFeatureId &&
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
                                                          AssignToVegDialog(
                                                            id: controller
                                                                    .vegExecutionDetailsModel
                                                                    .value
                                                                    ?.executionId ??
                                                                0,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            controller.vegExecutionDetailsModel
                                                            .value?.status ==
                                                        721 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kVegetationControlFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 30,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .startColor,
                                                      text: "Start",
                                                      onPressed: () {
                                                        Get.dialog<void>(
                                                          CustomVegetationDialog(
                                                            id: controller
                                                                    .vegExecutionDetailsModel
                                                                    .value
                                                                    ?.executionId ??
                                                                0,
                                                            title: controller
                                                                    .vegExecutionDetailsModel
                                                                    .value
                                                                    ?.title ??
                                                                "",
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            Dimens.boxWidth10,
                                            controller.vegExecutionDetailsModel.value?.status == 722 && varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kVegetationControlFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length > 0 ||
                                                    controller.vegExecutionDetailsModel
                                                                .value?.status ==
                                                            382 &&
                                                        varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id == UserAccessConstants.kVegetationControlFeatureId &&
                                                                    e.edit ==
                                                                        UserAccessConstants
                                                                            .kHaveEditAccess)
                                                                .length >
                                                            0 ||
                                                    controller.vegExecutionDetailsModel
                                                                .value?.status ==
                                                            368 &&
                                                        varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) => e.feature_id == UserAccessConstants.kVegetationControlFeatureId && e.edit == UserAccessConstants.kHaveEditAccess)
                                                                .length >
                                                            0
                                                ? Container(
                                                    height: 30,
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
                                                                    'Please complete all the schedules',
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
                                                            : Get.dialog<void>(
                                                                CustomVegetationDialog(
                                                                  id: controller
                                                                          .vegExecutionDetailsModel
                                                                          .value
                                                                          ?.executionId ??
                                                                      0,
                                                                  title: controller
                                                                          .vegExecutionDetailsModel
                                                                          .value
                                                                          ?.title ??
                                                                      "",
                                                                  starttype: 3,
                                                                ),
                                                              );
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            Dimens.boxWidth10,
                                            controller.vegExecutionDetailsModel.value?.status == 722 &&
                                                        varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id == UserAccessConstants.kVegetationControlFeatureId &&
                                                                    e.edit ==
                                                                        UserAccessConstants
                                                                            .kHaveEditAccess)
                                                                .length >
                                                            0 &&
                                                        controller
                                                                .allScheduleTrue
                                                                .value ==
                                                            false ||
                                                    controller.vegExecutionDetailsModel
                                                                .value?.status ==
                                                            368 &&
                                                        varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) => e.feature_id == UserAccessConstants.kVegetationControlFeatureId && e.edit == UserAccessConstants.kHaveEditAccess)
                                                                .length >
                                                            0 &&
                                                        controller.allScheduleTrue.value == false
                                                ? Container(
                                                    height: 30,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              244, 116, 248),
                                                      text: "Abandoned All",
                                                      onPressed: () {
                                                        Get.dialog(
                                                          AbandonVegExecutionDialog(
                                                            id: controller
                                                                .vegexe.value,
                                                          ),
                                                        );
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
                                            controller.vegExecutionDetailsModel
                                                            .value?.status ==
                                                        724 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kVegetationControlFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 30,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .approveColor,
                                                      text: "Approve",
                                                      onPressed: () {
                                                        Get.dialog(
                                                          CustomScheduleApproveRejectDialog(
                                                            text:
                                                                "Execution Approve",
                                                            controller:
                                                                controller,
                                                            buttonText:
                                                                "Approve",
                                                            style: Styles
                                                                .greenElevatedButtonStyle,
                                                            onPressed: () {
                                                              controller
                                                                  .endApproveExecution(
                                                                controller
                                                                        .vegExecutionDetailsModel
                                                                        .value
                                                                        ?.executionId ??
                                                                    0,
                                                              );
                                                              Get.back();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            Dimens.boxWidth10,
                                            controller.vegExecutionDetailsModel
                                                            .value?.status ==
                                                        724 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kVegetationControlFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 30,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .cancelColor,
                                                      text: "Reject",
                                                      onPressed: () {
                                                        Get.dialog(
                                                          CustomScheduleApproveRejectDialog(
                                                            text:
                                                                "Execution Reject",
                                                            controller:
                                                                controller,
                                                            buttonText:
                                                                "Reject",
                                                            style: Styles
                                                                .darkRedElevatedButtonStyle,
                                                            onPressed: () {
                                                              controller
                                                                  .endRejectExecution(
                                                                controller
                                                                        .vegExecutionDetailsModel
                                                                        .value
                                                                        ?.executionId ??
                                                                    0,
                                                              );
                                                              Get.back();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Dimens.box0,
                                            controller.vegExecutionDetailsModel
                                                            .value?.status ==
                                                        725 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kVegetationControlFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 30,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .approveColor,
                                                      text: "Approve",
                                                      onPressed: () {
                                                        Get.dialog(
                                                            CustomScheduleApproveRejectDialog(
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
                                                                        .vegExecutionDetailsModel
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
                                            controller.vegExecutionDetailsModel
                                                            .value?.status ==
                                                        725 &&
                                                    varUserAccessModel
                                                            .value.access_list!
                                                            .where((e) =>
                                                                e.feature_id ==
                                                                    UserAccessConstants
                                                                        .kVegetationControlFeatureId &&
                                                                e.edit ==
                                                                    UserAccessConstants
                                                                        .kHaveEditAccess)
                                                            .length >
                                                        0
                                                ? Container(
                                                    height: 30,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .cancelColor,
                                                      text: "Reject",
                                                      onPressed: () {
                                                        Get.dialog(
                                                            CustomScheduleApproveRejectDialog(
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
                                                                        .vegExecutionDetailsModel
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
                                            Spacer(),
                                          ],
                                        ),

                                        Dimens.boxHeight10
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
