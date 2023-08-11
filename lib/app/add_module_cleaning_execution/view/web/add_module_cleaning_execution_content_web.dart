// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';

import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/add_module_cleaning_execution_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class AddModuleCleaningExecutionContentWeb
    extends GetView<AddModuleCleaningExecutionController> {
  AddModuleCleaningExecutionContentWeb({super.key});

  // final homeController = Get.find<HomeController>();
  final AddModuleCleaningExecutionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
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
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
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
                          Text(
                            "Dashboard",
                            style: Styles.greyLight14,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(" / Module Cleaning Execution List",
                                style: Styles.greyMediumLight12),
                          ),
                          Text(" / Create Module Cleaning Execution",
                              style: Styles.greyMediumLight12)
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
                            GetBuilder<AddModuleCleaningExecutionController>(
                                id: 'module-cleaning-execution',
                                builder: (controller) {
                                  return Obx(
                                    () => Column(
                                      children: [
                                        CustomAppBar(
                                          title:
                                              'Create Module Cleaning Execution'
                                                  .tr,
                                        ),
                                        Dimens.boxHeight20,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomRichText(
                                                    title: 'Plan Title: '),
                                                Dimens.boxHeight20,
                                                CustomRichText(
                                                    title: 'Frequency: '),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' All Inverter Acid Wash',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                Dimens.boxHeight15,
                                                Text(
                                                  ' Yearly',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxWidth30,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomRichText(
                                                    title: 'Planned By: '),
                                                Dimens.boxHeight20,
                                                CustomRichText(
                                                    title: 'Start Date: '),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' Prashant Shethya',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                Dimens.boxHeight15,
                                                Text(
                                                  ' 05/05/2023',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                              ],
                                            ),
                                            Dimens.boxWidth30,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomRichText(
                                                    title:
                                                        'Planning Date & Time: '),
                                                Dimens.boxHeight20,
                                                CustomRichText(
                                                    title:
                                                        'Execution started by: '),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' 16/04/2023 11:00:00',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                Dimens.boxHeight15,
                                                Text(
                                                  ' Sujit Kumar',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),

                                        Dimens.boxHeight50,

                                        ///Escalation Matrix Roles

                                        Wrap(
                                          children: [
                                            Container(
                                              height: 300,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
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
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            "Schedule Execution"),
                                                        Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .addRowItem();
                                                            },
                                                            child: Icon(Icons
                                                                .exposure_plus_1)),
                                                      ],
                                                    ),
                                                  ),
                                                  // Column(
                                                  //     children: []
                                                  //       ..addAll(
                                                  //           controller
                                                  //               .rowItem
                                                  //               .value
                                                  //               .map(
                                                  //                   (e) {
                                                  //         return Text(
                                                  //             jsonEncode(
                                                  //                 e));
                                                  //       }))),
                                                  // Text(jsonEncode(controller
                                                  //     .dropdownMapperData)),
                                                  Container(
                                                    height: 200,
                                                    child: ScrollableTableView(
                                                      columns: [
                                                        "Days",
                                                        "Scheduled Module",
                                                        "Cleaned",
                                                        "Abandoned",
                                                        "Pending",
                                                        "Type",
                                                        "Water Used",
                                                        "Remark",
                                                        "Actions",
                                                      ].map((column) {
                                                        return TableViewColumn(
                                                          label: column,
                                                          minWidth:
                                                              Get.width * 0.17,
                                                          height:
                                                              Get.height / 2,
                                                        );
                                                      }).toList(),
                                                      rows: controller
                                                          .rowItem.value
                                                          .map((record) {
                                                        return TableViewRow(
                                                          height: 50,
                                                          cells: record
                                                              .map((mapData) {
                                                            return TableViewCell(
                                                              child: (mapData[
                                                                          'key'] ==
                                                                      "Days")
                                                                  ? Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                            '1')
                                                                      ],
                                                                    )
                                                                  : (mapData['key'] ==
                                                                          "Scheduled Module")
                                                                      ? Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text('2000')
                                                                          ],
                                                                        )
                                                                      : (mapData['key'] ==
                                                                              "Cleaned")
                                                                          ? Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text('-')
                                                                              ],
                                                                            )
                                                                          : (mapData['key'] == "Abandoned")
                                                                              ? Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Text('-')
                                                                                  ],
                                                                                )
                                                                              : (mapData['key'] == "Pending")
                                                                                  ? Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Text('-')
                                                                                      ],
                                                                                    )
                                                                                  : (mapData['key'] == "Type")
                                                                                      ? Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Text('Wet')
                                                                                          ],
                                                                                        )
                                                                                      : (mapData['key'] == "Water Used")
                                                                                          ? Column(
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [Text('-')],
                                                                                            )
                                                                                          : (mapData['key'] == "Remark")
                                                                                              ? Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                        width: MediaQuery.of(context).size.width / 5,
                                                                                                        child: LoginCustomTextfield(
                                                                                                          keyboardType: TextInputType.number,
                                                                                                          inputFormatters: <TextInputFormatter>[
                                                                                                            FilteringTextInputFormatter.digitsOnly
                                                                                                          ],
                                                                                                          maxLine: 1,
                                                                                                          textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                                          onChanged: (txt) {
                                                                                                            mapData["value"] = txt;
                                                                                                          },
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      height: 5,
                                                                                                    ),
                                                                                                  ],
                                                                                                )
                                                                                              : (mapData['key'] == "Actions")
                                                                                                  ? Padding(
                                                                                                      padding: const EdgeInsets.only(left: 20),
                                                                                                      child: Row(
                                                                                                        children: [
                                                                                                          TableActionButton(
                                                                                                            label: 'Start',
                                                                                                            onPress: () {
                                                                                                              
                                                                                                            },
                                                                                                            color: Colors.green,
                                                                                                          ),
                                                                                                          TableActionButton(
                                                                                                            label: 'Abandon',
                                                                                                            onPress: () {},
                                                                                                            color: Colors.red,
                                                                                                          ),
                                                                                                          TableActionButton(
                                                                                                            label: 'Equipments',
                                                                                                            onPress: () {
                                                                                                              Get.dialog(AddModuleCleaningExecutionDialog());
                                                                                                            },
                                                                                                            color: ColorValues.appDarkBlueColor,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    )
                                                                                                  : Text(mapData['key'] ?? ''),
                                                            );
                                                          }).toList(),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Container(
                                        //   height: 28,
                                        //   child: CustomElevatedButton(
                                        //     backgroundColor:
                                        //         ColorValues.appGreenColor,
                                        //     text: "Add Data",
                                        //     onPressed: () {
                                        //       controller
                                        //           .addStatusEscalationData(
                                        //               controller
                                        //                   .selectedTypePermitId);
                                        //       controller.addEscalationData(
                                        //           int.tryParse(
                                        //               '${controller.durationDaysTextCtrlr.text}'),
                                        //           controller
                                        //               .selectedRoleListId);
                                        //       print(
                                        //           'Controller:${controller.durationDaysTextCtrlr.text}');
                                        //       print(
                                        //           'Controller:${controller.selectedTypePermitId}');
                                        //       controller
                                        //           .durationDaysTextCtrlr
                                        //           .clear();
                                        //       controller.selectedRole
                                        //           .value = "";
                                        //     },
                                        //   ),
                                        // ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 150,
                                            ),

                                            SizedBox(
                                              width: 15,
                                            ),
                                            CustomElevatedButton(
                                              backgroundColor: Colors.red,
                                              onPressed: () {
                                                // controller.saveAsDraft();
                                              },
                                              text: 'Cancel',
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              height: 28,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appGreenColor,
                                                text: "Submit",
                                                onPressed: () {
                                                  // controller
                                                  //     .createEscalationMatrix();
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              height: 28,
                                              child: CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.appRedColor,
                                                text: "Abandoned All",
                                                onPressed: () {
                                                  Get.dialog(
                                                      AddModuleCleaningExecutionDialog());
                                                  // controller
                                                  //     .createEscalationMatrix();
                                                },
                                              ),
                                            ),

                                            //           varUserAccessModel.value.access_list!
                                            // .where((e) => e.feature_id == 3 && e.edit == 1)
                                            // .length > 0
                                            // &&
                                            // controller.incidentReportDetailsModel
                                            //             .value?.id !=
                                            //         null
                                            //     ? CustomElevatedButton(
                                            //         icon: Icons.edit,
                                            //         backgroundColor: Colors.green,
                                            //         onPressed: () {
                                            //           // controller.saveAsDraft();
                                            //           controller.editIncidentReport(
                                            //               id: controller
                                            //                   .incidentReportDetailsModel
                                            //                   .value
                                            //                   ?.id);
                                            //         },
                                            //         text: 'Edit',
                                            //       )
                                            //     : Container()
                                          ],
                                        ),
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
        ),
      ],
    );
  }
}
