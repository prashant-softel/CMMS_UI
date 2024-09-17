import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/observation_pm_execution_process_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../preventive_maintenance_execution_controller.dart';

class PreventiveMaintenanceExecutionContentWeb
    extends GetView<PreventiveMaintenanceExecutionController> {
  PreventiveMaintenanceExecutionContentWeb({super.key});

  ///
  // var controller = Get.find<PreventiveMaintenanceExecutionController>();
  @override
  Widget build(BuildContext context) {
    Widget _rowItem(int? defaultValue, {required Function(bool) onCheck}) {
      return IgnorePointer(
          ignoring: !controller.isTouchable.value,
          child: CustomSwitchTroggle(
              value: defaultValue == 1 ? true : false,
              onChanged: (value) {
                print("object");
                controller.isToggleOn.value = value!;
                onCheck(value);

                //  controller.toggle();
              }));
    }

    return Obx(
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
                    var taskId;
                    Get.offNamed(Routes.pmTaskView,
                        arguments: {'pmTaskId': taskId});
                  },
                  child: Text(" / PM TASK VIEW", style: Styles.greyLight14),
                ),
                Text(" / PM EXECUTION", style: Styles.greyLight14)
              ],
            ),
          ),
          Expanded(
            child: Container(
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
                            "PM Execution Process ",
                            style: Styles.blue700,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    Expanded(
                      child: Container(
                        margin: Dimens.edgeInsets20,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 8.h),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "PM Task ID: ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "PM Plan Title:  ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Equipment Category:  ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Frequency: ",
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
                                              "PMT${controller.pmtaskViewModel.value?.id ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.plan_title ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.category_name ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.frequency_name ?? ""}",
                                              style: Styles.blue17),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Assigned To:  ",
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
                                            "Due Date: ",
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
                                              "${controller.pmtaskViewModel.value?.assigned_to_name ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              " ${controller.pmtaskViewModel.value?.last_done_date ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.done_date ?? ""}",
                                              style: Styles.blue17),
                                          Text(
                                              "${controller.pmtaskViewModel.value?.due_date ?? ""}",
                                              style: Styles.blue17),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height:
                                      ((controller.rowItemclone.value.length ??
                                                  0) *
                                              45) +
                                          140,
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
                                              "Asset(s) ",
                                              style: Styles.blue700,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: DataTable2(
                                          border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234)),
                                          columns: [
                                            DataColumn2(
                                                label: Text(
                                              "Asset",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                              "Checklist",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn2(
                                                fixedWidth: 200,
                                                label: Text(
                                                  "Executed By",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            DataColumn2(
                                                fixedWidth: 400,
                                                label: Text(
                                                  "Checklist Observation",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                          rows: controller.rowItemclone.value
                                              .map((record) {
                                            return DataRow(
                                              // height: 130,
                                              cells: record.map((mapData) {
                                                return DataCell(
                                                  (mapData['key'] == "dropdown")
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              height: 25,
                                                              width: 70,
                                                              child: varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == UserAccessConstants.kPmExecutionFeatureId &&
                                                                              e.edit == UserAccessConstants.kHaveEditAccess)
                                                                          .length >
                                                                      0
                                                                  ? CustomElevatedButton(
                                                                      size: 12,
                                                                      backgroundColor:
                                                                          ColorValues
                                                                              .appDarkBlueColor,
                                                                      text:
                                                                          "Clone",
                                                                      onPressed:
                                                                          () {
                                                                        controller.selectedItem = controller.scheduleCheckPoints.firstWhere(
                                                                            (element) =>
                                                                                "${element.name}" ==
                                                                                record[0]['value'].toString(),
                                                                            orElse: null);

                                                                        var select = controller.scheduleCheckPoints.firstWhere(
                                                                            (element) =>
                                                                                element.name ==
                                                                                controller.selectedasset.value,
                                                                            orElse: null);
                                                                        select.schedule_link_job!.isNotEmpty
                                                                            ? controller.cloneAlertDialog()
                                                                            : controller.cloneDialog(controller.selectedasset.value);
                                                                      },
                                                                    )
                                                                  : Dimens.box0,
                                                            ),
                                                            // mapData['executionDone'] ==
                                                            //         "0"
                                                            //     ? Dimens.box0
                                                            //     : Text(
                                                            //         "Execution Done"),
                                                            Dimens.boxWidth2,
                                                            DropdownWebWidget(
                                                              width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .15),
                                                              height: 33,
                                                              controller:
                                                                  controller,
                                                              dropdownList:
                                                                  controller
                                                                      .scheduleCheckPointsdrop,
                                                              selectedValue:
                                                                  mapData[
                                                                      "value"],
                                                              onValueChanged: (list,
                                                                  selectedValue) {
                                                                controller
                                                                    .selectedasset
                                                                    .value;
                                                                mapData["value"] =
                                                                    selectedValue;

                                                                controller
                                                                        .selectedasset
                                                                        .value =
                                                                    selectedValue;

                                                                controller.checkdropdownMapperData[
                                                                        selectedValue] =
                                                                    list.firstWhere(
                                                                        (element) =>
                                                                            element.name ==
                                                                            selectedValue,
                                                                        orElse:
                                                                            null);
                                                              },
                                                            ),
                                                            Dimens.boxWidth2,
                                                            // Spacer(),
                                                            varUserAccessModel
                                                                        .value
                                                                        .access_list!
                                                                        .where((e) =>
                                                                            e.feature_id == UserAccessConstants.kPmExecutionFeatureId &&
                                                                            e.edit ==
                                                                                UserAccessConstants
                                                                                    .kHaveEditAccess)
                                                                        .length >
                                                                    0
                                                                ? TableActionButton(
                                                                    color: ColorValues
                                                                        .editColor,
                                                                    icon: Icons
                                                                        .edit,
                                                                    message:
                                                                        "Edit",
                                                                    onPress:
                                                                        () {
                                                                      controller
                                                                              .selectedItem =
                                                                          null;
                                                                      controller
                                                                          .rowItemobs
                                                                          .value = [];
                                                                      controller.selectedItem = controller
                                                                          .scheduleCheckPoints
                                                                          .firstWhere((element) =>
                                                                              "${element.name}" ==
                                                                              record[0]['value'].toString());
                                                                      if (controller
                                                                              .selectedItem !=
                                                                          null) {
                                                                        controller
                                                                            .selectedItem!
                                                                            .checklist_observation
                                                                            ?.forEach((element) {
                                                                          controller
                                                                              .rowItemobs
                                                                              .value
                                                                              .add([
                                                                            {
                                                                              "key": "checkpoint",
                                                                              "id": '${element.execution_id}',
                                                                              "value": '${element.check_point_name}',
                                                                            },
                                                                            {
                                                                              "key": "requirement",
                                                                              "value": '${element.requirement}'
                                                                            },
                                                                            {
                                                                              'key': "weightage",
                                                                              "value": '${element.failure_waightage}'
                                                                            },
                                                                            {
                                                                              'key': "cpok",
                                                                              "value": '${element.cp_ok.value}'
                                                                            },
                                                                            {
                                                                              'key': "observation",
                                                                              "value": '${element.observation}'
                                                                            },
                                                                            {
                                                                              'key': "uploadimg",
                                                                              "value": '',
                                                                              "uploaded": ""
                                                                            },
                                                                            {
                                                                              'key': "type",
                                                                              'inpute_type': '${element.check_point_type}',
                                                                              "value": '${element.type_text}',
                                                                              "min": '${element.min_range}',
                                                                              "max": '${element.max_range}'
                                                                            },
                                                                            {
                                                                              'key': "job_created",
                                                                              "value": '${element.linked_job_id.value}',
                                                                              "cp_ok_value": '${element.cp_ok.value}',
                                                                            },
                                                                          ]);
                                                                        });
                                                                        controller.getMrsListByModuleTask(
                                                                            taskId:
                                                                                controller.scheduleId.value);
                                                                        Get.dialog(
                                                                            ObservationPmExecutionViewDialog());
                                                                      }
                                                                    })
                                                                : Dimens.box0
                                                          ],
                                                        )
                                                      : (mapData['key'] ==
                                                              "executionDone")
                                                          ? Text(mapData[
                                                                      'value'] ==
                                                                  "0"
                                                              ? ""
                                                              : "${mapData['completed']}")
                                                          : Text(mapData[
                                                                  'value'] ??
                                                              ''),
                                                );
                                              }).toList(),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                controller.pmtaskViewModel.value?.status ==
                                                169 &&
                                            controller
                                                .listMrsByTaskId!.isEmpty ||
                                        controller.pmtaskViewModel.value
                                                ?.status ==
                                            162 ||
                                        controller.pmtaskViewModel.value
                                                ?.status ==
                                            161
                                    ? Dimens.box0
                                    : Container(
                                        margin: Dimens.edgeInsets20,
                                        height:
                                            controller.listMrsByTaskId!.length >
                                                    0
                                                ? ((controller.listMrsByTaskId
                                                                ?.length ??
                                                            0) *
                                                        40) +
                                                    150
                                                : 55,
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
                                                    "Material Issue / Used",
                                                    style: Styles.blue700,
                                                  ),
                                                  Spacer(),
                                                  controller.listMrsByTaskId!
                                                          .isEmpty
                                                      ? Container(
                                                          height: 30,
                                                          child:
                                                              CustomElevatedButton(
                                                            backgroundColor:
                                                                ColorValues
                                                                    .addNewColor,
                                                            onPressed:
                                                                () async {
                                                              controller
                                                                  .clearStoreTaskData();
                                                              controller
                                                                  .clearStoreTaskActivityData();
                                                              controller
                                                                  .clearStoreTasktoActorData();
                                                              controller
                                                                  .clearStoreTaskWhereUsedData();
                                                              controller
                                                                  .clearStoreTaskfromActorData();
                                                              controller
                                                                  .clearTypeValue();
                                                              Get.offAllNamed(
                                                                  Routes
                                                                      .createMrs,
                                                                  arguments: {
                                                                    "whereUsedId":
                                                                        controller
                                                                            .pmtaskViewModel
                                                                            .value
                                                                            ?.id,
                                                                    "activity": controller
                                                                        .pmtaskViewModel
                                                                        .value
                                                                        ?.plan_title,
                                                                    "whereUsed":
                                                                        27,
                                                                    "fromActorTypeId":
                                                                        2,
                                                                    "type": 2,
                                                                    "to_actor_type_id":
                                                                        3
                                                                  });
                                                            },
                                                            text: "Add New MRS",
                                                          ),
                                                        )
                                                      : Dimens.box0,
                                                ],
                                              ),
                                            ),
                                            // Divider(
                                            //   color:
                                            //       ColorValues.greyLightColour,
                                            // ),
                                            controller.listMrsByTaskId!.length >
                                                    0
                                                ? Expanded(
                                                    child: DataTable2(
                                                      border: TableBorder.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              206,
                                                              229,
                                                              234)),
                                                      columns: [
                                                        DataColumn2(
                                                            fixedWidth: 100,
                                                            label: Text(
                                                              "Sr. No.",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        DataColumn2(
                                                            fixedWidth: 130,
                                                            label: Text(
                                                              "MRS ID",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                        DataColumn2(
                                                            // fixedWidth: 200,
                                                            label: Text(
                                                          "MRS Items List ",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        DataColumn2(
                                                            //  fixedWidth: 300,
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
                                                      rows: List<
                                                          DataRow>.generate(
                                                        controller
                                                                .listMrsByTaskId
                                                                ?.length ??
                                                            0,
                                                        (index) => DataRow(
                                                            cells: [
                                                              DataCell(Text(
                                                                  '${index + 1}')),
                                                              DataCell(Text(controller
                                                                          .listMrsByTaskId?[
                                                                              index]
                                                                          ?.is_mrs_return ==
                                                                      0
                                                                  ? "MRS${controller.listMrsByTaskId?[index]?.mrsId.toString() ?? ''}"
                                                                  : "RMRS${controller.listMrsByTaskId?[index]?.mrs_return_ID.toString() ?? ''}")),
                                                              DataCell(Text(controller
                                                                      .listMrsByTaskId?[
                                                                          index]
                                                                      ?.mrsItems ??
                                                                  '')),
                                                              DataCell(Text(controller
                                                                      .listMrsByTaskId?[
                                                                          index]
                                                                      ?.status_short ??
                                                                  '')),
                                                              DataCell(Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  TableActionButton(
                                                                      color: ColorValues
                                                                          .viewColor,
                                                                      icon: Icons
                                                                          .remove_red_eye,
                                                                      message:
                                                                          "View",
                                                                      onPress:
                                                                          () {
                                                                        controller
                                                                            .clearMrsStoreData();
                                                                        int? rmrsId = controller
                                                                            .listMrsByTaskId?[index]
                                                                            ?.mrs_return_ID;
                                                                        String
                                                                            mrsId =
                                                                            controller.listMrsByTaskId?[index]?.mrsId.toString() ??
                                                                                "";
                                                                        controller.listMrsByTaskId?[index]?.is_mrs_return ==
                                                                                0
                                                                            ? Get.toNamed(Routes.mrsApprovalScreen, arguments: {
                                                                                'mrsId': int.tryParse("$mrsId"),
                                                                                'type': 2
                                                                              })
                                                                            : Get.toNamed(Routes.approverReturnMrs, arguments: {
                                                                                'mrsId': rmrsId,
                                                                                'type': 2
                                                                              });
                                                                      }),
                                                                  // controller.pmtaskViewModel.value?.status != 169 &&
                                                                  controller.listMrsByTaskId?[index]?.status == 323 ||
                                                                          controller.listMrsByTaskId?[index]?.status ==
                                                                              321 ||
                                                                          controller.listMrsByTaskId?[index]?.status ==
                                                                              324
                                                                      ? Dimens
                                                                          .box0
                                                                      : varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kMrsFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length >
                                                                              0
                                                                          ? TableActionButton(
                                                                              color: ColorValues.editColor,
                                                                              icon: Icons.edit,
                                                                              message: "Edit MRS",
                                                                              onPress: () {
                                                                                controller.clearMrsStoreData();

                                                                                String mrsId = controller.listMrsByTaskId?[index]?.mrsId.toString() ?? "";
                                                                                String rmrsId = controller.listMrsByTaskId?[index]?.mrs_return_ID.toString() ?? "";

                                                                                print({
                                                                                  "mrsId": mrsId
                                                                                });
                                                                                rmrsId == "0"
                                                                                    ? Get.toNamed(Routes.editMrs, arguments: {
                                                                                        'mrsId': int.tryParse("$mrsId"),
                                                                                        'type': 2
                                                                                      })
                                                                                    : Get.toNamed(Routes.editReturnMrs, arguments: int.tryParse(rmrsId));
                                                                                ;
                                                                              })
                                                                          : Dimens.box0
                                                                ],
                                                              )),
                                                            ]),
                                                      ),
                                                    ),
                                                  )
                                                : Dimens.box0,
                                          ],
                                        ),
                                      ),
                                (controller.historyList != null &&
                                        controller.historyList!.isNotEmpty)
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
                                        height:
                                            ((controller.historyList?.length ??
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: CustomRichText(
                                            title: "Comment:",
                                            includeAsterisk: false)),
                                    Dimens.boxWidth2,
                                    Container(
                                        width: (Get.width * .6),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                          color: ColorValues.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: LoginCustomTextfield(
                                          maxLine: 4,
                                          textController:
                                              controller.updatecommentCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        //icon: Icons.up,
                                        backgroundColor:
                                            ColorValues.updateColor,
                                        text: "Update",
                                        onPressed: () {
                                          controller.UpdatePMTaskExecution();
                                          // Get.dialog(
                                          //     CustonApproveRejectDialog(
                                          //   text: "Execution Update",
                                          //   controller: controller,
                                          //   buttonText: "Update",
                                          //   style: Styles
                                          //       .greenElevatedButtonStyle,
                                          //   onPressed: () {
                                          //     // controller
                                          //     //     .closePmTaskExecution();
                                          //     // Get.back();
                                          //   },
                                          // ));
                                        },
                                      ),
                                    ),
                                    Dimens.boxWidth3,
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                          //  icon: Icons.close,
                                          backgroundColor:
                                              ColorValues.closeColor,
                                          text: "Close",
                                          onPressed: () {
                                            controller.listMrsByTaskId!.value
                                                            .firstWhereOrNull(
                                                              (element) =>
                                                                  element?.jobCardId !=
                                                                      0 ||
                                                                  element?.pmId !=
                                                                      0,
                                                            )
                                                            ?.mrs_return_ID ==
                                                        0 &&
                                                    controller.allTrue.value ==
                                                        false
                                                ? Get.defaultDialog(
                                                    radius: 5,
                                                    title: 'Alert',
                                                    middleText:
                                                        'Please return all items!',
                                                    textConfirm: 'OK',
                                                    onConfirm: () {
                                                      Get.back(); // Close the dialog
                                                    },
                                                    buttonColor: ColorValues
                                                        .appGreenColor,
                                                    confirmTextColor:
                                                        Colors.white,
                                                    barrierDismissible: false)
                                                : controller.listMrsByTaskId!
                                                                .value
                                                                .firstWhereOrNull(
                                                                  (element) =>
                                                                      element?.jobCardId !=
                                                                          0 ||
                                                                      element?.pmId !=
                                                                          0,
                                                                )
                                                                ?.status !=
                                                            323 &&
                                                        controller
                                                            .listMrsByTaskId!
                                                            .isNotEmpty &&
                                                        controller.allTrue
                                                                .value ==
                                                            false
                                                    ? Get.defaultDialog(
                                                        radius: 5,
                                                        title: 'Alert',
                                                        middleText:
                                                            'Please get Return MRS approved!',
                                                        textConfirm: 'OK',
                                                        onConfirm: () {
                                                          Get.back(); // Close the dialog
                                                        },
                                                        buttonColor: ColorValues
                                                            .appGreenColor,
                                                        confirmTextColor:
                                                            Colors.white,
                                                        barrierDismissible:
                                                            false)
                                                    : controller
                                                        .closePmTaskExecution();
                                          }),
                                    ),
                                    Dimens.boxWidth3,
                                    controller.listMrsByTaskId!.value
                                                    .firstWhereOrNull(
                                                      (element) =>
                                                          element?.jobCardId !=
                                                              0 ||
                                                          element?.pmId != 0,
                                                    )
                                                    ?.mrs_return_ID ==
                                                0 &&
                                            controller.allTrue.value == false
                                        ? Container(
                                            height: 35,
                                            child: CustomElevatedButton(
                                              icon: Icons
                                                  .keyboard_return_outlined,
                                              backgroundColor:
                                                  ColorValues.linktopermitColor,
                                              text: "Return Mrs",
                                              onPressed: () {
                                                controller
                                                    .clearMrsIdStoreData();
                                                controller
                                                    .clearJobIdStoreData();

                                                controller.clearTypeValue();
                                                controller.clearStoreTaskData();
                                                controller
                                                    .clearStoreTaskActivityData();
                                                controller
                                                    .clearStoreTasktoActorData();
                                                controller
                                                    .clearStoreTaskWhereUsedData();
                                                controller
                                                    .clearStoreTaskfromActorData();

                                                controller
                                                    .getMrsListByModuleTask(
                                                        taskId: controller
                                                            .scheduleId.value);
                                                // controller.clearStoreTaskData();
                                                // controller
                                                //     .clearStoreTaskActivityData();
                                                // controller
                                                //     .clearStoreTasktoActorData();
                                                // controller
                                                //     .clearStoreTaskWhereUsedData();
                                                // controller
                                                //     .clearStoreTaskfromActorData();

                                                Get.toNamed(
                                                    Routes.mrsReturnScreen,
                                                    arguments: {
                                                      'type': 2,
                                                      "whereUsed": 27,
                                                      "fromActorTypeId": 3,
                                                      "to_actor_type_id": 2,
                                                      "pmTaskId": controller
                                                              .pmtaskViewModel
                                                              .value
                                                              ?.id ??
                                                          0,
                                                      "activity": controller
                                                          .pmtaskViewModel
                                                          .value
                                                          ?.plan_title,
                                                      "mrsId": controller
                                                              .listMrsByTaskId!
                                                              .firstWhere(
                                                                  (element) =>
                                                                      element
                                                                          ?.mrsId !=
                                                                      0,
                                                                  orElse: null)!
                                                              .mrsId ??
                                                          0
                                                    });
                                              },
                                            ),
                                          )
                                        : Dimens.box0,
                                    Dimens.boxWidth3,
                                    controller.pmtaskViewModel.value?.status ==
                                            168
                                        ? Dimens.box0
                                        : Container(
                                            height: 35,
                                            child: CustomElevatedButton(
                                              //  icon: Icons.close,
                                              backgroundColor:
                                                  ColorValues.redColor,
                                              text: "Cancel Task",
                                              onPressed: () {
                                                var firstTask = controller
                                                    .listMrsByTaskId?.value
                                                    .firstWhereOrNull(
                                                  (element) =>
                                                      element?.jobCardId != 0 ||
                                                      element?.pmId != 0,
                                                );

                                                if (firstTask?.mrs_return_ID ==
                                                        0 &&
                                                    controller.allTrue.value ==
                                                        false) {
                                                  Get.defaultDialog(
                                                    radius: 5,
                                                    title: 'Alert',
                                                    middleText:
                                                        'Please return all items!',
                                                    textConfirm: 'OK',
                                                    onConfirm: () {
                                                      Get.back(); // Close the dialog
                                                    },
                                                    buttonColor: ColorValues
                                                        .appGreenColor,
                                                    confirmTextColor:
                                                        Colors.white,
                                                  );
                                                } else if (firstTask
                                                            ?.status !=
                                                        323 &&
                                                    controller.listMrsByTaskId!
                                                        .isNotEmpty &&
                                                    controller.allTrue.value ==
                                                        false) {
                                                  Get.defaultDialog(
                                                    radius: 5,
                                                    title: 'Alert',
                                                    middleText:
                                                        'Please get Return MRS approved!',
                                                    textConfirm: 'OK',
                                                    onConfirm: () {
                                                      Get.back(); // Close the dialog
                                                    },
                                                    buttonColor: ColorValues
                                                        .appGreenColor,
                                                    confirmTextColor:
                                                        Colors.white,
                                                  );
                                                } else {
                                                  Get.dialog(
                                                      CustonApproveRejectDialog(
                                                    text: "Cancel Task",
                                                    controller: controller,
                                                    buttonText: "Cancel Task",
                                                    style: Styles
                                                        .redElevatedButtonStyle,
                                                    onPressed: () {
                                                      controller.CancelPMTask();
                                                      Get.back();
                                                    },
                                                  ));
                                                  // Show confirmation dialog before canceling the task
                                                  // Get.dialog(
                                                  //   AlertDialog(
                                                  //     content: Column(
                                                  //         mainAxisSize:
                                                  //             MainAxisSize.min,
                                                  //         children: [
                                                  //           Icon(Icons.cancel,
                                                  //               size: 35,
                                                  //               color: ColorValues
                                                  //                   .redColor),
                                                  //           SizedBox(
                                                  //             height: 10,
                                                  //           ),
                                                  //           Text(
                                                  //             'Are you sure you want to cancel the task?',
                                                  //             style: Styles
                                                  //                 .blackBold14w500,
                                                  //           ),
                                                  //         ]),
                                                  //     actions: [
                                                  //       Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment
                                                  //                 .spaceEvenly,
                                                  //         children: [
                                                  //           TextButton(
                                                  //             onPressed: () {
                                                  //               Get.back();
                                                  //             },
                                                  //             child: Text('NO'),
                                                  //           ),
                                                  //           TextButton(
                                                  //             onPressed: () {
                                                  //               Get.back();
                                                  //               controller
                                                  //                   .CancelPMTask();
                                                  //             },
                                                  //             child: Text('YES'),
                                                  //           ),
                                                  //         ],
                                                  //       )
                                                  //     ],
                                                  //   ),
                                                  // );
                                                }
                                              },
                                            ),
                                          ),
                                  ],
                                ),
                                Dimens.boxHeight20
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
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
