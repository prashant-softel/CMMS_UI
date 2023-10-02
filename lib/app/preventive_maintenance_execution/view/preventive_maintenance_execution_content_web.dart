import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/observation_pm_execution_process_dialog.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../navigators/app_pages.dart';
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
  var controller = Get.find<PreventiveMaintenanceExecutionController>();
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
                    Get.back();
                  },
                  child: Text(" / Preventive Maintenance".toUpperCase(),
                      style: Styles.greyMediumLight12),
                ),
                Text(" / PM EXECUTION", style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Expanded(
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
                                  margin: Dimens.edgeInsets40_0_40_0,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "PM Task ID : ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "PM Plan Title  :  ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Equipment Category :  ",
                                            style: Styles.black17,
                                          ),
                                          Text(
                                            "Frequency : ",
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
                                            "Assigned To :  ",
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
                                            "Due Date : ",
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
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height: ((controller.scheduleCheckPoints
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
                                                // fixedWidth: 200,
                                                label: Text(
                                              "Checklist Observation",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.scheduleCheckPoints
                                                    ?.length ??
                                                0,
                                            (index) => DataRow(cells: [
                                              DataCell(Text(controller
                                                      .scheduleCheckPoints?[
                                                          index]
                                                      ?.name
                                                      .toString() ??
                                                  '')),
                                              DataCell(Text(controller
                                                      .scheduleCheckPoints?[
                                                          index]
                                                      ?.checklist_name ??
                                                  '')),
                                              DataCell(Row(
                                                children: [
                                                  Container(
                                                    height: 25,
                                                    width: 90,
                                                    child: CustomElevatedButton(
                                                      size: 12,
                                                      backgroundColor:
                                                          ColorValues
                                                              .appDarkBlueColor,
                                                      text: "Clone Of",
                                                      onPressed: () {
                                                        print({
                                                          "selxrr",
                                                          controller
                                                              .selectedasset
                                                              .value
                                                        });
                                                        controller
                                                                .selectedItem =
                                                            null;
                                                        controller.selectedItem = controller
                                                            .scheduleCheckPoints!
                                                            .firstWhere((element) =>
                                                                "${element?.schedule_id}" ==
                                                                controller
                                                                    .scheduleCheckPoints?[
                                                                        index]
                                                                    ?.schedule_id
                                                                    .toString());
                                                        if (controller
                                                                .selectedItem !=
                                                            null) {
                                                          controller.cloneDialog(
                                                              controller
                                                                  .selectedasset
                                                                  .value);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  Dimens.boxWidth10,
                                                  DropdownWebWidget(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                .2) -
                                                            100,
                                                    controller: controller,
                                                    dropdownList: controller
                                                        .scheduleCheckPoints,
                                                    isValueSelected: controller
                                                        .isAssetsSelected.value,
                                                    selectedValue: controller
                                                        .selectedasset.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                  // DropdownWebStock(
                                                  //   width:
                                                  //       (MediaQuery.of(context)
                                                  //                   .size
                                                  //                   .width *
                                                  //               .2) -
                                                  //           100,
                                                  //   dropdownList: controller
                                                  //       .scheduleCheckPoints,
                                                  //   selectedValue: controller
                                                  //       .selectedasset.value,
                                                  //   onValueChanged:
                                                  //       (list, selectedValue) {
                                                  //     controller.dropdownMapperData[
                                                  //             selectedValue] =
                                                  //         list.firstWhere(
                                                  //             (element) =>
                                                  //                 element
                                                  //                     .name ==
                                                  //                 selectedValue,
                                                  //             orElse: null);
                                                  //   },
                                                  // ),
                                                  Spacer(),
                                                  // Dimens.boxWidth10,
                                                  TableActionButton(
                                                      color:
                                                          ColorValues.editColor,
                                                      icon: Icons.edit,
                                                      message: "Edit",
                                                      onPress: () {
                                                        controller
                                                                .selectedItem =
                                                            null;
                                                        controller.selectedItem = controller
                                                            .scheduleCheckPoints!
                                                            .firstWhere((element) =>
                                                                "${element?.schedule_id}" ==
                                                                controller
                                                                    .scheduleCheckPoints?[
                                                                        index]
                                                                    ?.schedule_id
                                                                    .toString());
                                                        if (controller
                                                                .selectedItem !=
                                                            null) {
                                                          Get.dialog(
                                                              ObservationPmExecutionViewDialog());
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
                                        child:
                                            CustomRichText(title: "Comment:")),
                                    Dimens.boxWidth10,
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
                                    Dimens.boxWidth10,
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        //  icon: Icons.close,
                                        backgroundColor: ColorValues.closeColor,
                                        text: "Close",
                                        onPressed: () {
                                          Get.dialog(CustonApproveRejectDialog(
                                            text: "Execution Close",
                                            controller: controller,
                                            buttonText: "Close",
                                            style:
                                                Styles.redElevatedButtonStyle,
                                            onPressed: () {
                                              controller.closePmTaskExecution();
                                              Get.back();
                                            },
                                          ));
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
