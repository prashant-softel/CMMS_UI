import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/widgets/abandon_veg_execution.dart';
import 'package:cmms/app/widgets/abandon_veg_schedule_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/vegetation_cleaning_execution_dialog.dart';
import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegExecutionWeb extends StatefulWidget {
  VegExecutionWeb({Key? key}) : super(key: key);
  @override
  State<VegExecutionWeb> createState() => _VegExecutionWebState();
}

class _VegExecutionWebState extends State<VegExecutionWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VegExecutionController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Obx(
          () => SelectionArea(
            child: Scaffold(
              backgroundColor: ColorValues.whiteColor,
              body: Column(
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: Get.height * .85,
                      width: Get.width * .95,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: ColorValues.cardColor,
                        elevation: 10,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Vegetation Plan Execution',
                                      style: Styles.blue17,
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: controller
                                                      .vegExecutionDetailsModel
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
                                                        .vegExecutionDetailsModel
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
                                          '${controller.vegExecutionDetailsModel.value?.status_short}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(color: ColorValues.lightGreyColor),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              TitleAndInfo(
                                                "Plan ID: ",
                                                "${controller.vegid.value == 0 ? "" : controller.vegid.value}",
                                              ),
                                              Dimens.boxHeight10,
                                              TitleAndInfo(
                                                "Execution ID: ",
                                                "${controller.vegExecutionDetailsModel.value?.executionId == null ? "" : controller.vegExecutionDetailsModel.value?.executionId}",
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              TitleAndInfo(
                                                "Plan Title: ",
                                                "${controller.vegExecutionDetailsModel.value?.title == null ? "" : controller.vegExecutionDetailsModel.value?.title}",
                                              ),
                                              Dimens.boxHeight10,
                                              TitleAndInfo(
                                                "Frequency: ",
                                                "${controller.vegExecutionDetailsModel.value?.frequency == null ? "" : controller.vegExecutionDetailsModel.value?.frequency}",
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              TitleAndInfo(
                                                "Planned By: ",
                                                "${controller.vegExecutionDetailsModel.value?.plannedBy == null ? "" : controller.vegExecutionDetailsModel.value?.plannedBy}",
                                              ),
                                              Dimens.boxHeight10,
                                              TitleAndInfo(
                                                "Start Date Time: ",
                                                "${controller.vegExecutionDetailsModel.value?.frequency == null ? "" : controller.vegExecutionDetailsModel.value?.frequency}",
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              TitleAndInfo(
                                                "Planning Date Time: ",
                                                "${controller.vegExecutionDetailsModel.value?.plannedAt == null ? "" : controller.vegExecutionDetailsModel.value?.plannedAt}",
                                              ),
                                              Dimens.boxHeight10,
                                              TitleAndInfo(
                                                "Execution started by: ",
                                                "${controller.vegExecutionDetailsModel.value?.startedBy == null ? "" : controller.vegExecutionDetailsModel.value?.startedBy}",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight15,
                                    Container(
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
                                      child: Column(
                                        children: [
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
                                                  fixedWidth: 70,
                                                  label: Text(
                                                    "Type",
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
                                                    "Water Used",
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
                                              rows:
                                                  controller.rowItem.value.map(
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
                                                                            mapData["value"] ??
                                                                                "",
                                                                            // "${element?.scheduleId}",
                                                                            style:
                                                                                TextStyle(
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
                                                                                  : (mapData['key'] == "Type")
                                                                                      ? Center(
                                                                                          child: Text(
                                                                                            mapData["value"] ?? "",
                                                                                            style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                          ),
                                                                                        )
                                                                                      : (mapData['key'] == "Water Used")
                                                                                          ? Center(
                                                                                              child: Text(
                                                                                                mapData["value"] ?? "",
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
                                                                                              : (mapData['key'] == "Status")
                                                                                                  ? Text(
                                                                                                      mapData["value"] ?? "",
                                                                                                      // "${element?.scheduleId}",
                                                                                                      style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                                    )
                                                                                                  : (mapData['key'] == "Actions")
                                                                                                      ? Wrap(
                                                                                                          children: [
                                                                                                            controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 360
                                                                                                                ? TableActionButton(
                                                                                                                    onPress: () {
                                                                                                                      var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                      print('filteredData:${filterdData!.scheduleId}');
                                                                                                                      controller.startVegExecutionScheduleButton(scheduleID: filterdData.scheduleId);
                                                                                                                    },
                                                                                                                    color: Colors.green,
                                                                                                                    icon: Icons.add,
                                                                                                                    message: 'Start',
                                                                                                                  )
                                                                                                                : Dimens.box0,
                                                                                                            controller.listSchedules!.firstWhere((e) => "${e?.scheduleId}" == record[0]['value'], orElse: () => Schedules(status: -1))?.status == 381
                                                                                                                ? TableActionButton(
                                                                                                                    onPress: () {
                                                                                                                      var filterdData = controller.listSchedules?.firstWhere((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                      print('filteredData:${filterdData!.scheduleId}');
                                                                                                                      controller.endVegScheduleExecutionButton(scheduleID: filterdData.scheduleId);
                                                                                                                    },
                                                                                                                    color: Color.fromARGB(255, 70, 95, 57),
                                                                                                                    icon: Icons.add,
                                                                                                                    message: 'End',
                                                                                                                  )
                                                                                                                : Dimens.box0,
                                                                                                            TableActionButton(
                                                                                                              onPress: () {
                                                                                                                var filterdData = controller.listSchedules?.firstWhereOrNull((e) => "${e?.scheduleId}" == record[0]['value']);
                                                                                                                controller.scheduledId.value = filterdData?.scheduleId ?? 0;
                                                                                                                print('Executiondata: ${filterdData?.scheduleId}');
                                                                                                                Get.dialog(
                                                                                                                  AbandoneVegScheduleDialog(
                                                                                                                    id: filterdData?.scheduleId,
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                              color: Colors.red,
                                                                                                              icon: Icons.close,
                                                                                                              message: 'Abandon',
                                                                                                            ),
                                                                                                            TableActionButton(
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
                                                                                                            ),
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: Row(
                children: [
                  Spacer(),
                  Container(
                    height: 30,
                    child: CustomElevatedButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        Get.offNamed(Routes.vegExecutionListScreen);
                      },
                      text: 'Cancel',
                    ),
                  ),
                  Dimens.boxWidth10,
                  controller.vegExecutionDetailsModel.value?.status == 360 &&
                          varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kModuleCleaningexeFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .length >
                              0
                      ? Container(
                          height: 30,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.addNewColor,
                            text: "Start",
                            onPressed: () {
                              controller.startVegExecutionButton();
                            },
                          ),
                        )
                      : controller.vegExecutionDetailsModel.value?.status ==
                                  381 &&
                              varUserAccessModel.value.access_list!
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
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.cancelColor,
                                text: "End",
                                onPressed: () {
                                  controller.endVegExecutionButton();
                                },
                              ),
                            )
                          : Dimens.box0,
                  Dimens.boxWidth10,
                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kModuleCleaningexeFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .length >
                              0 ||
                          varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kModuleCleaningexeFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0
                      ? Container(
                          height: 30,
                          child: CustomElevatedButton(
                            backgroundColor: Color.fromARGB(255, 244, 116, 248),
                            text: "Abandoned All",
                            onPressed: () {
                              Get.dialog(
                                AbandonVegExecutionDialog(
                                  id: controller.vegexe.value,
                                ),
                              );
                            },
                          ),
                        )
                      : Dimens.box0,
                  Dimens.boxWidth10,
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TitleAndInfo extends StatelessWidget {
  final String title;
  final String info;

  TitleAndInfo(this.title, this.info);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: Styles.black17,
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: Styles.blue17,
          ),
        ),
      ],
    );
  }
}