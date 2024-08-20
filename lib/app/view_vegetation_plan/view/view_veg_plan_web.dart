import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/mc_approve_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/veg_approve_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_controller.dart';

class ViewVegPlanWeb extends StatefulWidget {
  ViewVegPlanWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewVegPlanWeb> createState() => _ViewMcPlaningWebState();
}

class _ViewMcPlaningWebState extends State<ViewVegPlanWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewVegPlanController>(
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
                            Get.offNamed(Routes.vegetationPlanListScreen);
                          },
                          child: Text(" / VEGETATION PLAN LIST",
                              style: Styles.greyLight14),
                        ),
                        Text(" / VIEW VEGETATION PLAN",
                            style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: Card(
                              margin: EdgeInsets.all(20),
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
                                          " View Vegetation Plan",
                                          style: Styles.blackBold14,
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 5),
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                            color: ColorValues.addNewColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Status"
                                            " ${controller.vegPlanDetailsModel.value!.statusShort ?? ""}",
                                          ),
                                        ),
                                        Dimens.boxWidth2,
                                        Text(
                                          "Id:${controller.vegPlanDetailsModel.value?.planId} ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),

                                  Dimens.boxHeight15,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Current Status:",
                                      ),
                                      Text(
                                        " ${controller.vegPlanDetailsModel.value?.statusLong ?? ""}",
                                      )
                                    ],
                                  ),
                                  Dimens.boxHeight10,
                                  Container(
                                    margin: Dimens.edgeInsets20,
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomRichText(
                                                title: 'Site Name  :'),
                                            Dimens.boxHeight10,
                                            CustomRichText(
                                              title: 'Frequency :',
                                            ),
                                          ],
                                        ),
                                        Dimens.boxWidth2,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${controller.vegPlanDetailsModel.value?.siteName ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                style: Styles.blue17),
                                            Dimens.boxHeight10,
                                            Obx(
                                              () => Text(
                                                  '${controller.vegPlanDetailsModel.value?.frequency ?? ""}', //  "Block 2 all Inverter maintenance plan",
                                                  style: Styles.blue17),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomRichText(
                                                title: 'Plan Title  :'),
                                            Dimens.boxHeight10,
                                            CustomRichText(
                                                title: 'Planning by :'),
                                          ],
                                        ),
                                        Dimens.boxWidth2,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${controller.vegPlanDetailsModel.value?.title ?? ''}',
                                                style: Styles.blue17),
                                            Obx(
                                              () => Text(
                                                  '${controller.vegPlanDetailsModel.value?.createdBy ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                  style: Styles.blue17),
                                            ),
                                            Dimens.boxHeight10,
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomRichText(
                                                title:
                                                    'Planning Date & Time :'),
                                            Dimens.boxHeight10,
                                            CustomRichText(
                                                title: 'Assigned to :'),
                                          ],
                                        ),
                                        Dimens.boxWidth2,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${controller.vegPlanDetailsModel.value?.createdAt ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                style: Styles.blue17),
                                            Text(
                                                '${controller.vegPlanDetailsModel.value?.assignedTo ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                style: Styles.blue17),

                                            // Dimens.boxHeight10,
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight12,
                                  // controller.filteredInventoryNameList.length > 0
                                  //     ?
                                  Container(
                                    margin: Dimens.edgeInsets20,
                                    height:
                                        ((controller.schedules!.length) * 40) +
                                            200,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Schedule",
                                            style: Styles.blue700,
                                          ),
                                        ),
                                        Expanded(
                                          child: DataTable2(
                                            border: TableBorder.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234)),
                                            columns: [
                                              DataColumn2(
                                                //fixedWidth: 150,
                                                label: Text(
                                                  'Day',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                // fixedWidth: 150,
                                                label: Text(
                                                  'No. of SMB',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                                  'No of Inverters',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                                  'Grass Cutting Area',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                            rows: controller.rowItem.value
                                                .map((record) {
                                              return DataRow(
                                                // height: 130,
                                                cells: record.map((mapData) {
                                                  return DataCell(
                                                    (mapData['key'] ==
                                                            "cleaningType")
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 10,
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                IgnorePointer(
                                                                  child:
                                                                      DropdownWebStock(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    dropdownList:
                                                                        controller
                                                                            .cleaningType,
                                                                    selectedValue:
                                                                        mapData[
                                                                            "value"],
                                                                    onValueChanged:
                                                                        (list,
                                                                            selectedValue) {
                                                                      mapData["value"] =
                                                                          selectedValue;
                                                                      controller.typedropdownMapperData[selectedValue] = list.firstWhere(
                                                                          (element) =>
                                                                              element.name ==
                                                                              selectedValue,
                                                                          orElse:
                                                                              null);
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : (mapData['key'] == "")
                                                            ? Text(mapData[
                                                                    'value'] ??
                                                                "")
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
                                  (controller.historyList != null &&
                                          controller.historyList!.isNotEmpty)
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
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Vegetation History ",
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
                                      : Dimens.box0,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton:
                  controller.vegPlanDetailsModel.value?.status == 702 &&
                          varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kVegetationControlFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0
                      ? Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.rejectColor,
                                text: "Reject",
                                icon: Icons.close,
                                onPressed: () {
                                  controller.vegPlanRejectButton(
                                    id: controller.id.value,
                                  );
                                },
                              ),
                            ),
                            Dimens.boxWidth2,
                            Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                text: "Approve",
                                icon: Icons.check,
                                onPressed: () {
                                  Get.dialog(ApproveVegPlan(
                                    id: controller.id.value,
                                  ));
                                  // controller.vegPlanApprovedButton(
                                  //   id: controller.id.value,
                                  // );
                                },
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      : Dimens.box0,
            ),
          ),
        );
      },
    );
  }
}
