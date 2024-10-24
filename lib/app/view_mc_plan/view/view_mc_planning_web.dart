import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/mc_approve_dialog.dart';
import 'package:cmms/app/widgets/mc_reject_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/view_set_eqp_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';

class ViewMcPlaningWeb extends StatefulWidget {
  ViewMcPlaningWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewMcPlaningWeb> createState() => _ViewMcPlaningWebState();
}

class _ViewMcPlaningWebState extends State<ViewMcPlaningWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewMcPlaningController>(
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
                            Get.offNamed(Routes.moduleCleaningListPlan);
                          },
                          child: Text(" / MODULE CLEANING",
                              style: Styles.greyLight14),
                        ),
                        Text(" / VIEW MODULE CLEANING PLANNING ",
                            style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            // height: Get.height,
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
                                          " View Module Cleaning Planning ",
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
                                            " ${controller.mcPlanDetailsModel.value?.status_short ?? ""}",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),

                                  // Dimens.boxHeight15,
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Text(
                                  //       "Current Status:",
                                  //     ),
                                  //     Text(
                                  //       " ${controller.mcPlanDetailsModel.value?.status_long ?? ""}",
                                  //     )
                                  //   ],
                                  // ),
                                  Dimens.boxHeight10,
                                  Container(
                                    margin: Dimens.edgeInsets20,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomRichText(title: 'Plan ID  :'),
                                            Dimens.boxHeight10,
                                            CustomRichText(
                                              title: 'Assign To :',
                                            ),
                                          ],
                                        ),
                                        Dimens.boxWidth2,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'MCP${controller.mcPlanDetailsModel.value?.planId ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                style: Styles.blue17),
                                            Dimens.boxHeight10,
                                            Obx(
                                              () => Text(
                                                  '${controller.mcPlanDetailsModel.value?.assignedTo ?? ""}', //  "Block 2 all Inverter maintenance plan",
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
                                                '${controller.mcPlanDetailsModel.value?.siteName ?? ''}', //  "Block 2 all Inverter maintenance plan",
                                                style: Styles.blue17),
                                            Dimens.boxHeight10,
                                            Obx(
                                              () => Text(
                                                  '${controller.mcPlanDetailsModel.value?.frequency ?? ""}', //  "Block 2 all Inverter maintenance plan",
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
                                                '${controller.mcPlanDetailsModel.value?.title ?? ''}',
                                                style: Styles.blue17),
                                            Dimens.boxHeight10,
                                            Obx(
                                              () => Text(
                                                  '${controller.mcPlanDetailsModel.value?.createdBy ?? ''}', //  "Block 2 all Inverter maintenance plan",
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
                                                title:
                                                    'Planning Date & Time :'),
                                          ],
                                        ),
                                        Dimens.boxWidth2,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${controller.mcPlanDetailsModel.value?.createdAt ?? ''}', //  "Block 2 all Inverter maintenance plan",
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
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Schedule",
                                                style: Styles.blue700,
                                              ),
                                              Spacer(),
                                              // GestureDetector(
                                              //   onTap: () {
                                              //     var selectedEqp = [];
                                              //     controller.mcPlanDetailsModel
                                              //         .value?.schedules
                                              //         .forEach((schedule) {
                                              //       schedule.equipments
                                              //           ?.forEach((element) {
                                              //         var ee = element;
                                              //         ee!.cleaningDay =
                                              //             schedule.cleaningDay;
                                              //         ;
                                              //         selectedEqp.add(element);
                                              //         print(element?.toJson());
                                              //       });
                                              //     });
                                              //     selectedEqp
                                              //         .forEach((element) {
                                              //       try {
                                              //         var selectedParentIndex =
                                              //             controller
                                              //                 .equipmentList
                                              //                 .value
                                              //                 .indexWhere((eqp) =>
                                              //                     eqp?.invId ==
                                              //                     element
                                              //                         .parentId);
                                              //         print({
                                              //           "selectedParentIndex":
                                              //               selectedParentIndex
                                              //         });
                                              //         if (selectedParentIndex >
                                              //             -1) {
                                              //           var selectedChildIndex = controller
                                              //                   .equipmentList
                                              //                   .value[
                                              //                       selectedParentIndex]
                                              //                   ?.smbs
                                              //                   .indexWhere((smb) =>
                                              //                       smb.smbId ==
                                              //                       element
                                              //                           .id) ??
                                              //               -1;

                                              //           if (selectedChildIndex >
                                              //               -1) {
                                              //             var ss = controller
                                              //                     .equipmentList
                                              //                     .value[
                                              //                         selectedParentIndex]
                                              //                     ?.smbs[
                                              //                 selectedChildIndex];
                                              //             ss?.selectedDay =
                                              //                 "${element.cleaningDay}";
                                              //             controller
                                              //                     .equipmentList
                                              //                     .value[
                                              //                         selectedParentIndex]
                                              //                     ?.smbs[
                                              //                 selectedChildIndex] = ss!;
                                              //           }
                                              //           print({
                                              //             "selectedChildIndex":
                                              //                 selectedChildIndex
                                              //           });
                                              //         }
                                              //       } catch (e) {
                                              //         print({"eadfds": e});
                                              //       }
                                              //     });
                                              //     // controller
                                              //     //     .equipmentList
                                              //     //     .value
                                              //     //     .forEach(
                                              //     //         (element) {

                                              //     //         });

                                              //     // print(
                                              //     //     'MC plan Detail:${controller.schedules.toJson()}');
                                              //     Get.dialog(
                                              //         ViewSetEquipmentDialog(
                                              //       estimateDurationDays:
                                              //           int.tryParse(
                                              //               '${controller.durationInDayCtrlr.text}'),

                                              //     ));
                                              //   },
                                              //   // color: ColorValues.appDarkBlueColor,
                                              //   // onTap: () {
                                              //   //   controller.addRowItem();
                                              //   // },
                                              //   child: Container(
                                              //     height: 30,
                                              //     width: 150,
                                              //     decoration: BoxDecoration(
                                              //       color:
                                              //           ColorValues.addNewColor,
                                              //       border: Border.all(
                                              //         color: ColorValues
                                              //             .lightGreyColorWithOpacity35,
                                              //         width: 1,
                                              //       ),
                                              //       borderRadius:
                                              //           BorderRadius.all(
                                              //               Radius.circular(5)),
                                              //     ),
                                              //     child: Center(
                                              //       child: Text(
                                              //         "Set Equipments",
                                              //         style: TextStyle(
                                              //             fontSize: 18,
                                              //             fontWeight:
                                              //                 FontWeight.w100,
                                              //             color: Colors.white),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // )
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
                                                  "Day",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                //fixedWidth: 150,
                                                label: Text(
                                                  'No. of Inverters',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                fixedWidth: 150,
                                                label: Text(
                                                  'No. of SMBs',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                                  'No of modules',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn2(
                                                // fixedWidth: 300,
                                                label: Text(
                                                  'Type',
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
                                                                      controller.cleaningTyperopdownMapperData[selectedValue] = list.firstWhere(
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
                                  controller.historyList!.isEmpty
                                      ? Dimens.box0
                                      : Container(
                                          margin: Dimens.edgeInsets20,
                                          height: ((controller.historyList
                                                          ?.length ??
                                                      0) *
                                                  50) +
                                              125,
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
                                                      "MC Plan History ",
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
                                                child: DataTable2(
                                                  border: TableBorder.all(
                                                      color: Color.fromARGB(
                                                          255, 206, 229, 234)),
                                                  columns: [
                                                    DataColumn(
                                                        label: Text(
                                                      "Time Stamp",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Posted By",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Comment",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Location",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  ],
                                                  rows: List<DataRow>.generate(
                                                    controller.historyList
                                                            ?.length ??
                                                        0,
                                                    (index) => DataRow(cells: [
                                                      DataCell(Text(controller
                                                              .historyList?[
                                                                  index]
                                                              ?.createdAt
                                                              ?.result
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .historyList?[
                                                                  index]
                                                              ?.createdByName
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text(controller
                                                              .historyList?[
                                                                  index]
                                                              ?.comment
                                                              .toString() ??
                                                          '')),
                                                      DataCell(Text('--')),
                                                      DataCell(Text(controller
                                                              .historyList?[
                                                                  index]
                                                              ?.status_name
                                                              .toString() ??
                                                          '')),
                                                    ]),
                                                  ),
                                                ),
                                              ),
                                           
                                            ],
                                          ),
                                        ),

                                  Dimens.boxHeight12,
                                  controller.mcPlanDetailsModel.value?.status ==
                                              351 &&
                                          varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id ==
                                                          UserAccessConstants
                                                              .kModuleCleaningplanFeatureId &&
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
                                                backgroundColor:
                                                    ColorValues.rejectColor,
                                                text: "Reject",
                                                icon: Icons.close,
                                                onPressed: () {
                                                  Get.dialog(RejectMcPlan(
                                                    id: controller.mcid.value,
                                                  ));
                                                },
                                              ),
                                            ),
                                            Dimens.boxWidth2,

                                            Container(
                                              height: 45,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appGreenColor,
                                                text: "Approve",
                                                icon: Icons.check,
                                                onPressed: () {
                                                  Get.dialog(ApproveMcPlan(
                                                    id: controller.mcid.value,
                                                  ));
                                                },
                                              ),
                                            ),

                                            // : Dimens.box0,
                                            Spacer(),
                                          ],
                                        )
                                      : Dimens.box0,
                                  Dimens.boxHeight12,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Dimens.boxHeight40,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
