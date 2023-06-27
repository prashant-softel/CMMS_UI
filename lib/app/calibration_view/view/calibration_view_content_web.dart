import 'package:cmms/app/calibration_View/calibration_View_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';

class CalibrationViewContentWeb extends GetView<CalibrationViewController> {
  CalibrationViewContentWeb({super.key});

  ///
  var controller = Get.find<CalibrationViewController>();
  @override
  Widget build(BuildContext context) {
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
                  child: Text(" / CALIBRATION LIST",
                      style: Styles.greyMediumLight12),
                ),
                Text(
                  " / CALIBRATION VIEW",
                  style: Styles.greyMediumLight12,
                ),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Card(
                  color: Color.fromARGB(255, 245, 248, 250),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Calibration Views",
                              style: TextStyle(
                                  color: ColorValues.appDarkBlueColor),
                              // style: Styles.blackBold16,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomElevatedButton(
                              text:
                                  "${controller.calibrationDetailModel.value?.statusShort ?? ""}",
                              onPressed: () {},
                              backgroundColor: ColorValues.appYellowColor,
                              textColor: ColorValues.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Dimens.boxWidth30,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Equipment Name: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      'Last Calibration Date: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      'Vender Name: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      'Calibration Done Date: ',
                                      style: Styles.black17,
                                    ),
                                  ],
                                ),
                                Dimens.boxWidth15,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${controller.calibrationDetailModel.value?.assetName ?? ""}",
                                        style: Styles.blue17),
                                    Dimens.boxHeight10,
                                    Text(
                                        "${controller.calibrationDetailModel.value?.lastCalibrationDate ?? ""}",
                                        style: Styles.blue17),
                                    Dimens.boxHeight10,
                                    Text(
                                        "${controller.calibrationDetailModel.value?.vendorName ?? ""}",
                                        style: Styles.blue17),
                                    Dimens.boxHeight10,
                                    Text(
                                        "${controller.calibrationDetailModel.value?.completedAt ?? ""}",
                                        style: Styles.blue17),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Equipment Category: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      'Next Calibration Due Date: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      'Responsible Person: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight10,
                                    Text(
                                      'Recieved date: ',
                                      style: Styles.black17,
                                    ),
                                  ],
                                ),
                                Dimens.boxWidth15,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${controller.calibrationDetailModel.value?.categoryName ?? ""}",
                                        style: Styles.blue17),
                                    Dimens.boxHeight10,
                                    Text(
                                        "${controller.calibrationDetailModel.value?.nextCalibrationDueDate ?? ""}",
                                        style: Styles.blue17),
                                    Dimens.boxHeight10,
                                    Text(
                                        "${controller.calibrationDetailModel.value?.responsiblePerson ?? ""}",
                                        style: Styles.blue17),
                                    Dimens.boxHeight10,
                                    Text(
                                        "${controller.calibrationDetailModel.value?.receivedDate ?? ""}",
                                        style: Styles.blue17),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              margin: Dimens.edgeInsets20,
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorValues.appBlueBackgroundColor,
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
                                          "Calibration Certificates",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: ScrollableTableView(
                                      columns: [
                                        "Sr.",
                                        "View",
                                        "File Name",
                                        "File Category",
                                        "File Size",
                                        "Status",
                                      ].map((column) {
                                        return TableViewColumn(
                                          label: column,
                                          minWidth: Get.width * 0.15,
                                        );
                                      }).toList(),
                                      rows: [].map((record) {
                                        return TableViewRow(
                                          height: 90,
                                          cells: record.map((value) {
                                            return TableViewCell(
                                              child: Text("no data found"),
                                            );
                                          }).toList(),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: Dimens.edgeInsets20,
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorValues.appBlueBackgroundColor,
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
                                          "Equipment Image ",
                                          style: Styles.blue700,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Expanded(
                                    child: ScrollableTableView(
                                      columns: [
                                        "Sr.",
                                        "View",
                                        "File Name",
                                        "File Category",
                                        "File Size",
                                        "Status",
                                      ].map((column) {
                                        return TableViewColumn(
                                          label: column,
                                          minWidth: Get.width * 0.15,
                                        );
                                      }).toList(),
                                      rows: [
                                        // [
                                        //   "1",
                                        //   "Milk",
                                        //   "20.00",
                                        //   "---",
                                        //   "status"
                                        // ],
                                        // [
                                        //   "2",
                                        //   "Soap",
                                        //   "10.00",
                                        //   "---",
                                        //   "status"
                                        // ],
                                        // ...List.generate(
                                        //   controller.historyLog?.length ?? 0,
                                        //   (index) {
                                        //     var getHistoryListDetails =
                                        //         controller.historyLog?[index];
                                        //     return [
                                        //       '${getHistoryListDetails?.created_at}',
                                        //       '${getHistoryListDetails?.created_by_name ?? ''}',
                                        //       '${getHistoryListDetails?.comment ?? ''}',
                                        //       '--',
                                        //       '${getHistoryListDetails?.status ?? ''}',
                                        //     ];
                                        //   },
                                        // ),
                                        // // [
                                      ].map((record) {
                                        return TableViewRow(
                                          height: 90,
                                          cells: record.map((value) {
                                            return TableViewCell(
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            controller.historyList != null &&
                                    controller.historyList!.isNotEmpty
                                ? //
                                Container(
                                    margin: Dimens.edgeInsets20,
                                    constraints: BoxConstraints(
                                      maxHeight: 500,
                                      minHeight: 100,
                                    ),
                                    child: //
                                        HistoryTableWidgetWeb(
                                      historyList: controller.historyList,
                                    ),
                                  )
                                //)
                                : //
                                Dimens.box0,
                            Row(
                              children: [
                                Text(
                                  "Any Damages:",
                                  style: Styles.blackBold15,
                                ),
                                Dimens.boxWidth10,
                                CustomSwitchTroggle(
                                    value: controller.isToggleOn.value,
                                    onChanged: (value) {
                                      controller.toggle();
                                    }),
                              ],
                            ),
                            Dimens.boxHeight60,
                            Row(
                              children: [
                                Text(
                                  "Remarks:",
                                  style: Styles.blackBold15,
                                ),
                                Dimens.boxWidth10,
                                Container(
                                  width: (Get.width * .5),
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      enabled: false,
                                      maxLines: 5,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        fillColor: ColorValues.whiteColor,
                                        filled: true,
                                        contentPadding: Dimens.edgeInsets05_10,
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight60,
                            Container(
                              margin: EdgeInsets.only(bottom: 40, top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 35,
                                    //width: (Get.width * .2) - 90,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appDarkBlueColor,
                                      text: "Print",
                                      onPressed: () {},
                                    ),
                                  ),
                                  Dimens.boxWidth20,
                                  Container(
                                    height: 35,
                                    // width: (Get.width * .2) - 90,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.redColor,
                                      text: "Cancel",
                                      onPressed: () {},
                                    ),
                                  ),
                                  Dimens.boxWidth20,
                                  Container(
                                    height: 35,
                                    //width: (Get.width * .2) - 90,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appGreenColor,
                                      text: "Submit",
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )
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
    );
  }
}
