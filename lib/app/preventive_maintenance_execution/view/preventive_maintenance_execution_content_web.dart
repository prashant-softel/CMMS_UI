import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Equipments: ",
                                  style: Styles.black17,
                                ),
                                Text("Demo_block_1_Inv_3",
                                    style: Styles.blue700),
                                Spacer(),
                                Text(
                                  "Maint. Order: ",
                                  style: Styles.black17,
                                ),
                                Text("PMSH02343", style: Styles.blue700),
                                Spacer(),
                                Text(
                                  "Check List: ",
                                  style: Styles.black17,
                                ),
                                Text("Check_list_001", style: Styles.blue700),
                                Spacer(),
                                Text(
                                  "Frequency: ",
                                  style: Styles.black17,
                                ),
                                Text("Monthly", style: Styles.blue700),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 300,
                              margin: Dimens.edgeInsets20,
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
                              child: ScrollableTableView(
                                columns: [
                                  "Check Point",
                                  "Requirement",
                                  "Upload Image",
                                  "Observation",
                                  "Create Job",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.18,
                                  );
                                }).toList(),
                                rows: [
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Observation",
                                    "Create_job"
                                  ],
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Observation",
                                    "Create_job"
                                  ],
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Observation",
                                    "Create_job"
                                  ],
                                  [
                                    "Check each string connect",
                                    "Should be clean",
                                    "Upload_image",
                                    "Observation",
                                    "Create_job"
                                  ]
                                ].map((record) {
                                  return TableViewRow(
                                    height: 90,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: (value == "Create_job")
                                            ? CustomSwitchTroggle(
                                                onChanged: (value) {},
                                              )
                                            : (value == "Observation")
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        width: (Get.width * .4),
                                                        // padding: EdgeInsets.all(value),
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              offset:
                                                                  const Offset(
                                                                5.0,
                                                                5.0,
                                                              ),
                                                              blurRadius: 5.0,
                                                              spreadRadius: 1.0,
                                                            ),
                                                          ],
                                                          color: ColorValues
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child:
                                                            LoginCustomTextfield(
                                                          maxLine: 5,
                                                        )),
                                                  )
                                                : (value == "Upload_image")
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: ColorValues
                                                                  .appDarkBlueColor,
                                                              border:
                                                                  Border.all(
                                                                color: ColorValues
                                                                    .appDarkBlueColor,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                                Icons.upload,
                                                                size: 30,
                                                                color: ColorValues
                                                                    .whiteColor),
                                                          ),
                                                          Dimens.boxWidth15,
                                                          Container(
                                                            width: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2),
                                                              color: ColorValues
                                                                  .appDarkBlueColor,
                                                              border:
                                                                  Border.all(
                                                                color: ColorValues
                                                                    .appDarkBlueColor,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Text(
                                                              "0 Files",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: Styles
                                                                  .white12
                                                                  .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displaySmall!
                                                                    .color,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("My Material", style: Styles.blue700),
                                    Container(
                                        width: Get.width / 4,
                                        child: LoginCustomTextfield())
                                  ],
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Return Items", style: Styles.blue700),
                                    Container(
                                        width: Get.width / 4,
                                        child: LoginCustomTextfield())
                                  ],
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Material Used",
                                        style: Styles.blue700),
                                    Container(
                                        width: Get.width / 4,
                                        child: LoginCustomTextfield())
                                  ],
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Return Items", style: Styles.blue700),
                                    Container(
                                        width: Get.width / 4,
                                        child: LoginCustomTextfield())
                                  ],
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Request From Store",
                                        style: Styles.blue700),
                                    Container(
                                        width: Get.width / 4,
                                        child: LoginCustomTextfield())
                                  ],
                                ),
                                Dimens.boxHeight15,
                                Container(
                                  height: 300,
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
                                              "PM History ",
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
                                            "Time Stamp",
                                            "Posted By",
                                            "Comment",
                                            "Location",
                                            "Status",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.15,
                                            );
                                          }).toList(),
                                          rows: [
                                            [
                                              "2022-04-05 16:40",
                                              "Sujit Kumar",
                                              "Execution Started",
                                              "--",
                                              "PM Execution Started",
                                            ],
                                            [
                                              "2022-04-05 16:40",
                                              "Sujit Kumar",
                                              "Execution Started",
                                              "--",
                                              "PM Execution Started",
                                            ],
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
                                Dimens.boxHeight20,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomRichText(title: "Comment:"),
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
                                          maxLine: 5,
                                        )),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 30, top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: (Get.width * .1) - 50,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appRedColor,
                                          text: "Concel",
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        height: 35,
                                        width: (Get.width * .1) - 60,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.greenColor,
                                          text: 'Close',
                                          onPressed: () {
                                            //  controller.savePmMapping();
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        height: 35,
                                        width: (Get.width * .2) - 170,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appDarkBlueColor,
                                          text: "Update",
                                          onPressed: () {
                                            _updatedailog();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
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
    );
  }

  void _updatedailog() {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      insetPadding: Dimens.edgeInsets10_0_10_0,
      contentPadding: EdgeInsets.zero,
      title: Column(
        children: [
          Text(
            'PM Execution Submitted',
            textAlign: TextAlign.center,
            style: Styles.green700,
          ),
          Divider(
            color: ColorValues.greyColor,
          )
        ],
      ),
      content: Builder(builder: (context) {
        var height = Get.height;

        return Container(
          // margin: Dimens.edgeInsets15,
          // padding: Dimens.edgeInsets25,
          height: height / 8,
          width: double.infinity,

          child: Column(
            children: [
              RichText(
                text: TextSpan(
                    text: 'PM Execution Submitted with',
                    style: Styles.blue700,
                    children: <TextSpan>[
                      TextSpan(text: ' \n     Code', style: Styles.blue700),
                      TextSpan(
                        text: '  PMSC87456',
                        style: Styles.redBold15,
                      ),
                    ]),
              ),
              Dimens.boxHeight12,
              //  Text("PM Execution Submitted with code PMSC87456"),
              Container(
                height: 40,
                width: (Get.width * .2) - 60,
                child: CustomElevatedButton(
                  text: "PM Execution View",
                  onPressed: () {
                    Get.toNamed(
                      Routes.pmExecutionView,
                    );
                  },
                  backgroundColor: ColorValues.appDarkBlueColor,
                  textColor: ColorValues.whiteColor,
                ),
              ),
            ],
          ),
        );
      }),
      actions: [],
    ));
  }
}
