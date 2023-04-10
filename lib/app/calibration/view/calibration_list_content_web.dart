import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../calibration_list_controller.dart';

class CalibrationListContentWeb extends GetView<CalibrationListController> {
  CalibrationListContentWeb({super.key});

  ///
  var controller = Get.find<CalibrationListController>();
  List<String> filterdata = ["SetUp", "Close", "cpmplete", "pending"];
  @override
  Widget build(BuildContext context) {
    return Column(
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
            ],
          ),
        ),
        Flexible(
          child: Container(
            width: Get.width * 7,
            margin: EdgeInsets.only(left: 10, top: 30),
            height: Get.height,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Calibration List",
                          style: Styles.blackBold16,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.filter_alt_rounded,
                            color: ColorValues.lightGreyTextColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorValues.greyLightColour,
                  ),
                  Row(
                    children: [
                      Container(
                        width: (Get.width * .1) - 60,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Copy'),
                      ),
                      Container(
                        width: (Get.width * .1) - 60,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Excel'),
                      ),
                      Container(
                        width: (Get.width * .1) - 70,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'PDF'),
                      ),
                      Container(
                        width: (Get.width * .2) - 100,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.appLightBlueColor,
                          onPressed: () {},
                          text: 'columnVisibility'.tr,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 200,
                        height: 40,
                        margin: Dimens.edgeInsets0_0_16_0,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            contentPadding: Dimens.edgeInsets10_0_0_0,
                            hintText: 'search'.tr,
                            hintStyle: Styles.grey12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      margin: Dimens.edgeInsets15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorValues.lightGreyColorWithOpacity35,
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
                      child: ScrollableTableView(
                        columns: [
                          "Equipment Category",
                          "Equipment Name",
                          "Description",
                          "Serial No.",
                          "Calibration Certificates",
                          "Installation date",
                          "Last Calibration date",
                          "Next Due Date",
                          "Calibration Frequency",
                          "Status",
                          "Action",
                        ].map((column) {
                          return TableViewColumn(
                            label: column,
                            minWidth: Get.width * 0.15,
                          );
                        }).toList(),
                        rows: [
                          [
                            "SCADA",
                            "Pynarometer",
                            "DEmo_Block_001_transfer0012",
                            "PR1000",
                            "calibration_certificate",
                            "2023-03-26",
                            "2023-03-26",
                            "2023-03-26",
                            "Day",
                            "Status",
                            "Action"
                          ],
                          [
                            "SCADA",
                            "Pynarometer",
                            "DEmo_Block_001_transfer0012",
                            "PR1000",
                            "calibration_certificate",
                            "2023-03-26",
                            "2023-03-26",
                            "2023-03-26",
                            "Day",
                            "Status",
                            "Action"
                          ],
                          [
                            "SCADA",
                            "Pynarometer",
                            "DEmo_Block_001_transfer0012",
                            "PR1000",
                            "calibration_certificate",
                            "2023-03-26",
                            "2023-03-26",
                            "2023-03-26",
                            "Day",
                            "Status",
                            "Action"
                          ],
                          [
                            "SCADA",
                            "Pynarometer",
                            "DEmo_Block_001_transfer0012",
                            "PR1000",
                            "calibration_certificate",
                            "2023-03-26",
                            "2023-03-26",
                            "2023-03-26",
                            "Day",
                            "Status",
                            "Action"
                          ],
                          [
                            "SCADA",
                            "Pynarometer",
                            "DEmo_Block_001_transfer0012",
                            "PR1000",
                            "calibration_certificate",
                            "2023-03-26",
                            "2023-03-26",
                            "2023-03-26",
                            "Day",
                            "Status",
                            "Action"
                          ],
                          [
                            "SCADA",
                            "Pynarometer",
                            "DEmo_Block_001_transfer0012",
                            "PR1000",
                            "calibration_certificate",
                            "2023-03-26",
                            "2023-03-26",
                            "2023-03-26",
                            "Day",
                            "Status",
                            "Action"
                          ],
                          [
                            "SCADA",
                            "Pynarometer",
                            "DEmo_Block_001_transfer0012",
                            "PR1000",
                            "calibration_certificate",
                            "2023-03-26",
                            "2023-03-26",
                            "2023-03-26",
                            "Day",
                            "Status",
                            "Action"
                          ],
                        ].map((record) {
                          return TableViewRow(
                            height: 90,
                            cells: record.map((value) {
                              return TableViewCell(
                                child: (value == "Action")
                                    ? Wrap(children: [
                                        TableActionButton(
                                          color: ColorValues.lightGreenColor,
                                          label: 'Start Calibration',
                                          onPress: () {
                                            startCalibration();
                                          },
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appDarkBlueColor,
                                          icon: Icons.remove_red_eye_outlined,
                                          label: 'View',
                                          onPress: () {},
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appRedColor,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                          onPress: () {},
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appLightBlueColor,
                                          icon:
                                              Icons.access_time_filled_outlined,
                                          label: 'History',
                                          onPress: () {
                                            controller.calibrationHistory();
                                          },
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appRedColor,
                                          icon: Icons.close,
                                          label: 'Reject',
                                          onPress: () {},
                                        ),
                                        // TableActionButton(
                                        //   color: ColorValues.appRedColor,
                                        //   icon: Icons.close,
                                        //   label: 'Completed',
                                        //   onPress: () {},
                                        // ),
                                        TableActionButton(
                                          color: ColorValues.lightGreenColor,
                                          icon: Icons.check,
                                          label: 'Approve',
                                          onPress: () {},
                                        ),
                                      ])
                                    : (value == "Status")
                                        ? Container(
                                            padding: Dimens.edgeInsets8_2_8_2,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 213, 46, 40),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              "Overdue",
                                              style: Styles.white13.copyWith(
                                                color: Colors.white,
                                              ),
                                            ))
                                        : (value == "calibration_certificate")
                                            ? TableActionButton(
                                                color: ColorValues
                                                    .appDarkBlueColor,
                                                icon: Icons
                                                    .remove_red_eye_outlined,
                                                label: 'View',
                                                onPress: () {},
                                              )
                                            : Text(value),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void startCalibration() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Row(
            children: [
              Text(
                'Asset Calibration',
                textAlign: TextAlign.center,
                style: Styles.blackBold20,
              ),
              Text(
                ': DEMO_BLOCK_WVM',
                textAlign: TextAlign.center,
                style: Styles.black18,
              ),
            ],
          ),
        ],
      ),
      content: Builder(builder: (context) {
        var height = Get.height;

        return Container(
          margin: Dimens.edgeInsets15,
          padding: Dimens.edgeInsets25,
          height: height / 2.4,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorValues.appBlueBackgroundColor,
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Previous Calibration"),
                    Text("                         Date:"),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(
                            2.0,
                            3.0,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      color: ColorValues.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: Get.width / 5,
                    child: LoginCustomTextfield(
                      textController: controller.previousDateController,
                      ontap: () {
                        _selectDate(context, 1);
                      },
                      widget: Icon(
                        Icons.calendar_month,
                        color: ColorValues.greyLightColor,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Due Date For Next"),
                    Text("             Calibration:"),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(
                            2.0,
                            3.0,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      color: ColorValues.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: Get.width / 5,
                    child: LoginCustomTextfield(
                      textController: controller.nextDueDateController,
                      ontap: () {
                        _selectDate(context, 2);
                      },
                      widget: Icon(
                        Icons.calendar_month,
                        color: ColorValues.greyLightColor,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vender Name :"),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(
                            2.0,
                            3.0,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      color: ColorValues.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: Get.width / 5,
                    child: LoginCustomTextfield(
                      textController: controller.nextDueDateController,
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CustomElevatedButton(
                text: "Cancel",
                onPressed: () {},
                backgroundColor: ColorValues.appRedColor,
                textColor: ColorValues.whiteColor,
              ),
              Dimens.boxWidth10,
              CustomElevatedButton(
                text: "Start",
                onPressed: () {},
                backgroundColor: ColorValues.appGreenColor,
                textColor: ColorValues.whiteColor,
              ),
              Dimens.boxWidth10,
            ]),
          ]),
        );
      }),
      actions: [],
    ));
  }

  Future<void> _selectDate(BuildContext context, int type) async {
    DateTime today = DateTime.now();
    var date = await showDatePicker(
      context: context,
      cancelText: "Clear",
      confirmText: "Ok",
      initialDate: DateTime(today.year - 18, today.month, today.day),
      firstDate: DateTime(1900),
      lastDate: DateTime(today.year - 18, today.month, today.day),
    );

    controller.previousDateController.text = date.toString().substring(0, 10);
  }
}
