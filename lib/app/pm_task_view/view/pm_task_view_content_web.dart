import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/pm_task_view/view/tbt_dialog.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/assign_to_pm_task_dialog.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/observation_pm_task_view_popup_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';

class PreventiveMaintenanceTaskViewContentWeb
    extends GetView<PreventiveMaintenanceTaskViewController> {
  PreventiveMaintenanceTaskViewContentWeb({super.key});

  ///
  var controller = Get.find<PreventiveMaintenanceTaskViewController>();
  final HomeController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return buildDocument(context: context);
  }

  Widget buildDocument({required BuildContext context}) {
    return SelectionArea(
      child: Obx(
        () => Container(
          // height: Get.height,
          // width: Get.width,
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
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        final _flutterSecureStorage =
                            const FlutterSecureStorage();

                        _flutterSecureStorage.delete(key: "scheduleId");

                        Get.offNamed(Routes.preventive);
                      },
                      child: Text(" / Preventive Maintenance".toUpperCase(),
                          style: Styles.greyLight14),
                    ),
                    Text(" / PM TASK VIEW", style: Styles.greyLight14)
                  ],
                ),
              ),
              Expanded(
                child: RepaintBoundary(
                  key: controller.printKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    margin: EdgeInsets.all(20),
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
                                    backgroundColor: controller.pmtaskViewModel
                                                .value?.status ==
                                            164
                                        ? ColorValues.linktopermitColor
                                        : controller.pmtaskViewModel.value
                                                    ?.status ==
                                                162
                                            ? ColorValues.appLightBlueColor
                                            : controller.pmtaskViewModel.value
                                                        ?.status ==
                                                    163
                                                ? ColorValues.appYellowColor
                                                : controller.pmtaskViewModel
                                                            .value?.status ==
                                                        167
                                                    ? ColorValues
                                                        .approveStatusColor
                                                    : controller
                                                                .pmtaskViewModel
                                                                .value
                                                                ?.status ==
                                                            165
                                                        ? ColorValues.closeColor
                                                        : controller
                                                                    .pmtaskViewModel
                                                                    .value
                                                                    ?.status ==
                                                                169
                                                            ? ColorValues
                                                                .approveStatusColor
                                                            : controller
                                                                        .pmtaskViewModel
                                                                        .value
                                                                        ?.status ==
                                                                    168
                                                                ? ColorValues
                                                                    .rejectedStatusColor
                                                                : ColorValues
                                                                    .addNewColor,
                                    onPressed: () async {},
                                    text:
                                        "${controller.pmtaskViewModel.value?.status_short ?? ""}",
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
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
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
                                                  "PM Task ID:",
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  "PM Plan Title:",
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  "Equipment Category:",
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  "Frequency:",
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
                                                    "${controller.pmtaskViewModel.value?.id ?? ""}",
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
                                                  "Assigned To:",
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  "Last Done Date:",
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  "Done Date:",
                                                  style: Styles.black17,
                                                ),
                                                Text(
                                                  "Due Date:",
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
                                      // Dimens.boxHeight30,

                                      ///Assets

                                      Container(
                                        margin: Dimens.edgeInsets20,
                                        height: ((controller.scheduleCheckPoint
                                                        ?.length ??
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
                                                      fixedWidth: 100,
                                                      label: Text(
                                                        "SR.No.",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      label: Text(
                                                    "Asset",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataColumn2(
                                                      // fixedWidth: 300,
                                                      label: Text(
                                                    "Checklist",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataColumn2(
                                                      fixedWidth: 200,
                                                      label: Text(
                                                        "Failure Score",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  DataColumn2(
                                                      fixedWidth: 150,
                                                      label: Text(
                                                        'Action',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                ],
                                                rows: List<DataRow>.generate(
                                                  controller.scheduleCheckPoint
                                                          ?.length ??
                                                      0,
                                                  (index) => DataRow(cells: [
                                                    DataCell(
                                                        Text('${index + 1}')),
                                                    DataCell(Text(controller
                                                            .scheduleCheckPoint?[
                                                                index]
                                                            ?.name
                                                            .toString() ??
                                                        '')),
                                                    DataCell(Text(controller
                                                            .scheduleCheckPoint?[
                                                                index]
                                                            ?.checklist_name ??
                                                        '')),
                                                    DataCell(Text(
                                                        // controller
                                                        //       .scheduleCheckPoint?[
                                                        //           index]
                                                        //       ? ??
                                                        '')),
                                                    DataCell(Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        controller.pmtaskViewModel.value
                                                                            ?.status ==
                                                                        167 &&
                                                                    varUserAccessModel
                                                                            .value.access_list!
                                                                            .where((e) =>
                                                                                e.feature_id == UserAccessConstants.kPmTaskFeatureId &&
                                                                                e.add ==
                                                                                    UserAccessConstants
                                                                                        .kHaveAddAccess)
                                                                            .length >
                                                                        0 ||
                                                                controller
                                                                        .pmtaskViewModel
                                                                        .value
                                                                        ?.status ==
                                                                    161 ||
                                                                controller
                                                                        .pmtaskViewModel
                                                                        .value
                                                                        ?.status ==
                                                                    162
                                                            ? Dimens.box0
                                                            : TableActionButton(
                                                                color: ColorValues
                                                                    .viewColor,
                                                                icon: Icons
                                                                    .remove_red_eye,
                                                                message: "View",
                                                                onPress: () {
                                                                  controller.selectedItem = controller.scheduleCheckPoint!.firstWhere((element) =>
                                                                      "${element?.schedule_id}" ==
                                                                      controller
                                                                          .scheduleCheckPoint?[
                                                                              index]
                                                                          ?.schedule_id
                                                                          .toString());
                                                                  if (controller
                                                                          .selectedItem !=
                                                                      null) {
                                                                    Get.dialog(
                                                                        ObservationPMTaskViewDialog());
                                                                  }
                                                                })
                                                      ],
                                                    )),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      controller.pmtaskViewModel.value
                                                  ?.permit_id ==
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
                                                    padding:
                                                        const EdgeInsets.all(
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
                                                            color:
                                                                Color.fromARGB(
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
                                                                    fontSize:
                                                                        15,
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
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                        ],
                                                        rows: [
                                                          DataRow(cells: [
                                                            DataCell(Text(
                                                              "${controller.pmtaskViewModel.value?.permit_id ?? ""}",
                                                            )),
                                                            DataCell(Text(
                                                              "${controller.pmtaskViewModel.value?.permit_code ?? ""}",
                                                            )),
                                                            DataCell(Text(
                                                              "${controller.pmtaskViewModel.value?.permit_type ?? ""}",
                                                            )),
                                                            DataCell(Text(
                                                              "${controller.pmtaskViewModel.value?.status_short_ptw ?? ""}",
                                                            )),
                                                            DataCell(Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                // TableActionButton(
                                                                //     color: ColorValues
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
                                                                              permitId: controller.pmtaskViewModel.value?.permit_id,
                                                                              jobId: controller.jobDetailsModel.value!.id ?? 0);
                                                                        })
                                                                    : Container(),
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
                                      controller.pmtaskViewModel.value
                                                      ?.status ==
                                                  169 &&
                                              controller
                                                  .listMrsByTaskId!.isEmpty
                                          ? Dimens.box0
                                          : Container(
                                              margin: Dimens.edgeInsets20,
                                              height: controller
                                                          .listMrsByTaskId!
                                                          .length >
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
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Material Issue / Used",
                                                          style: Styles.blue700,
                                                        ),
                                                        Spacer(),
                                                        controller
                                                                .listMrsByTaskId!
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
                                                                    Get.offAllNamed(
                                                                        Routes
                                                                            .createMrs,
                                                                        arguments: {
                                                                          "whereUsedId": controller
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
                                                                          "to_actor_type_id":
                                                                              3
                                                                        });
                                                                  },
                                                                  text:
                                                                      "Add New MRS",
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
                                                  controller.listMrsByTaskId!
                                                              .length >
                                                          0
                                                      ? Expanded(
                                                          child: DataTable2(
                                                            border: TableBorder.all(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        206,
                                                                        229,
                                                                        234)),
                                                            columns: [
                                                              DataColumn2(
                                                                  fixedWidth:
                                                                      100,
                                                                  label: Text(
                                                                    "Sr. No.",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                              DataColumn2(
                                                                  fixedWidth:
                                                                      130,
                                                                  label: Text(
                                                                    "MRS ID",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                              DataColumn2(
                                                                  // fixedWidth: 200,
                                                                  label: Text(
                                                                "MRS Items List ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                              DataColumn2(
                                                                  //  fixedWidth: 300,
                                                                  label: Text(
                                                                "Status",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                              DataColumn2(
                                                                  fixedWidth:
                                                                      300,
                                                                  label: Text(
                                                                    'Action',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                            ],
                                                            rows: List<
                                                                DataRow>.generate(
                                                              controller
                                                                      .listMrsByTaskId
                                                                      ?.length ??
                                                                  0,
                                                              (index) =>
                                                                  DataRow(
                                                                      cells: [
                                                                    DataCell(Text(
                                                                        '${index + 1}')),
                                                                    DataCell(Text(
                                                                        "MRS${controller.listMrsByTaskId?[index]?.mrsId.toString() ?? ''}")),
                                                                    DataCell(Text(controller
                                                                            .listMrsByTaskId?[index]
                                                                            ?.mrsItems ??
                                                                        '')),
                                                                    DataCell(Text(controller
                                                                            .listMrsByTaskId?[index]
                                                                            ?.status_short ??
                                                                        '')),
                                                                    DataCell(
                                                                        Row(
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
                                                                                "View MRS",
                                                                            onPress:
                                                                                () {
                                                                              String mrsId = controller.listMrsByTaskId?[index]?.mrsId.toString() ?? "";

                                                                              Get.toNamed(Routes.mrsViewScreen, arguments: {
                                                                                'mrsId': int.tryParse("$mrsId"),
                                                                                'type': 1
                                                                              });
                                                                            }),
                                                                        TableActionButton(
                                                                            color: ColorValues
                                                                                .editColor,
                                                                            icon: Icons
                                                                                .edit,
                                                                            message:
                                                                                "Edit MRS",
                                                                            onPress:
                                                                                () {
                                                                              String mrsId = controller.listMrsByTaskId?[index]?.mrsId.toString() ?? "";
                                                                              print({
                                                                                "mrsId": mrsId
                                                                              });
                                                                              Get.toNamed(Routes.editMrs, arguments: {
                                                                                'mrsId': int.tryParse("$mrsId")
                                                                              });
                                                                            })
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
                                      // : Dimens.box0,

                                      (controller.historyList != null &&
                                              controller
                                                  .historyList!.isNotEmpty)
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                    child:
                                                        HistoryTableWidgetWeb(
                                                      historyList: controller
                                                          .historyList,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          //  )
                                          : //
                                          Dimens.box0,
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
              ),
              //  Dimens.boxHeight20,
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   height: 35,
                    //   child: CustomElevatedButton(
                    //     icon: Icons.print,
                    //     backgroundColor: ColorValues.linktopermitColor,
                    //     text: "print",
                    //     onPressed: () {
                    //       // controller.generateInvoice();
                    //     },
                    //   ),
                    // ),
                    // Dimens.boxWidth10,
                    controller.pmtaskViewModel.value?.status == 161
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              // icon: Icons.link,
                              backgroundColor: ColorValues.blueColor,
                              text: "Assign",
                              onPressed: () {
                                Get.dialog<void>(AssignToPMTaskDialog(
                                    id: controller.pmtaskViewModel.value?.id ??
                                        0));
                                //controller.printScreen();
                              },
                            ),
                          )
                        : Dimens.box0,
                    Dimens.boxWidth10,
                    // controller.pmtaskViewModel.value?.status == 161
                    //     ? Container(
                    //         height: 35,
                    //         child: CustomElevatedButton(
                    //           icon: Icons.link,
                    //           backgroundColor: ColorValues.linktopermitColor,
                    //           text: "Link to Permit",
                    //           onPressed: () {
                    //             controller.createNewPermit();

                    //             //controller.printScreen();
                    //           },
                    //         ),
                    //       )
                    //     :
                    controller.pmtaskViewModel.value?.status == 167 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.add ==
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.start,
                              backgroundColor: ColorValues.linktopermitColor,
                              text: "Start",
                              onPressed: () {
                                controller.pmtaskViewModel.value
                                            ?.ptw_tbt_done ==
                                        1
                                    ? controller.setPmTask()
                                    : Get.dialog<void>(TbtDonePMTaskDialog(
                                        ptw_id: controller.pmtaskViewModel.value
                                                ?.permit_id ??
                                            0,
                                        id: controller
                                                .pmtaskViewModel.value?.id ??
                                            0));
                              },
                            ),
                          )
                        : Dimens.box0,

                    controller.pmtaskViewModel.value?.status == 164 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmTaskFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0 ||
                            controller.pmtaskViewModel.value?.status == 166 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmTaskFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0 ||
                            controller.pmtaskViewModel.value?.status == 168 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPmTaskFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.remove_red_eye_outlined,
                              backgroundColor: ColorValues.linktopermitColor,
                              text: "Execute",
                              onPressed: () {
                                controller.gotoexecution();
                              },
                            ),
                          )
                        : Dimens.box0,
                    Dimens.boxWidth10,
                    controller.pmtaskViewModel.value?.status == 162 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPermitFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0 ||
                            controller.pmtaskViewModel.value?.status == 161 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kPermitFeatureId &&
                                            e.add ==
                                                UserAccessConstants
                                                    .kHaveAddAccess)
                                        .length >
                                    0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.link,
                              backgroundColor: ColorValues.appGreenColor,
                              text: "Create New Permit",
                              onPressed: () {
                                controller.createNewPermit();
                              },
                            ),
                          )
                        : Dimens.box0,
                    // Dimens.boxWidth10,
                    // Container(
                    //   height: 35,
                    //   child: CustomElevatedButton(
                    //     // icon: Icons.start,
                    //     backgroundColor: ColorValues.appGreenColor,
                    //     text: "Clone Permit",
                    //     onPressed: () {
                    //       //controller.printScreen();
                    //     },
                    //   ),
                    // ),
                    // Dimens.boxWidth10,
                    // Container(
                    //   height: 35,
                    //   child: CustomElevatedButton(
                    //     icon: Icons.close,
                    //     backgroundColor: ColorValues.closeColor,
                    //     text: "Close",
                    //     onPressed: () {
                    //       Get.dialog(CustonApproveRejectDialog(
                    //         text: "Execution Close",
                    //         controller: controller,
                    //         buttonText: "Close",
                    //         style: Styles.redElevatedButtonStyle,
                    //         onPressed: () {
                    //           controller.closePmTaskExecution();
                    //           Get.back();
                    //         },
                    //       ));
                    //     },
                    //   ),
                    // ),
                    Dimens.boxWidth10,

                    controller.pmtaskViewModel.value?.status == 165 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.check,
                              backgroundColor: ColorValues.approveColor,
                              text: "Approve",
                              onPressed: () {
                                Get.dialog(CustonApproveRejectDialog(
                                  text: "Execution Approve",
                                  controller: controller,
                                  buttonText: "Approve",
                                  style: Styles.greenElevatedButtonStyle,
                                  onPressed: () {
                                    controller.approvePmTaskExecution();
                                    Get.back();
                                  },
                                ));
                              },
                            ),
                          )
                        : Dimens.box0,
                    Dimens.boxWidth10,
                    controller.pmtaskViewModel.value?.status == 165 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPmTaskFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.close,
                              backgroundColor: ColorValues.rejectColor,
                              text: "Reject",
                              onPressed: () {
                                Get.dialog(CustonApproveRejectDialog(
                                  text: "Execution Reject",
                                  controller: controller,
                                  buttonText: "Reject",
                                  style: Styles.redElevatedButtonStyle,
                                  onPressed: () {
                                    controller.rejectPmTaskExecution();
                                    Get.back();
                                  },
                                ));
                              },
                            ),
                          )
                        : Dimens.box0,
                    Dimens.boxWidth10,
                    controller.pmtaskViewModel.value?.status == 169 &&
                            varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kPmTaskFeatureId &&
                                    e.add == UserAccessConstants.kHaveAddAccess)
                                .isNotEmpty &&
                            controller.listMrsByTaskId!.isNotEmpty &&
                            (() {
                              try {
                                final firstCmmrsItem =
                                    controller.cmmrsItems.firstWhere(
                                  (element) => element.mrs_return_ID == 0,
                                  orElse: () => CmmrsItems(mrs_return_ID: 1),
                                );
                                return firstCmmrsItem != null;
                              } catch (e) {
                                return false;
                              }
                            }())
                        ? Container(
                            height: 35,
                            child: CustomElevatedButton(
                              icon: Icons.keyboard_return_outlined,
                              backgroundColor: ColorValues.linktopermitColor,
                              text: "Return Mrs",
                              onPressed: () {
                                controller.clearStoreTaskData();
                                controller.clearStoreTaskActivityData();
                                controller.clearStoreTasktoActorData();
                                controller.clearStoreTaskWhereUsedData();
                                controller.clearStoreTaskfromActorData();

                                Get.toNamed(Routes.mrsReturnScreen, arguments: {
                                  "whereUsed": 27,
                                  "fromActorTypeId": 3,
                                  "to_actor_type_id": 2,
                                  "pmTaskId":
                                      controller.pmtaskViewModel.value?.id ?? 0,
                                  "activity": controller
                                      .pmtaskViewModel.value?.plan_title
                                });
                              },
                            ),
                          )
                        : SizedBox(), // Use SizedBox to provide an empty space when the condition is not met
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
