import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';

class ModuleCleaningListExecution
    extends GetView<ModuleCleaningListExecutionController> {
  ModuleCleaningListExecution({super.key});

  var controller = Get.find<ModuleCleaningListExecutionController>();

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
                  child: Text(" / MODULE EXECUTION",
                      style: Styles.greyMediumLight12),
                ),
                Text(" / MODULE CLEANING EXECUTION",
                    style: Styles.greyMediumLight12)
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
                            "Module Cleaning Execution",
                            style: Styles.blackBold16,
                          ),
                          // Container(
                          //   child: Icon(
                          //     Icons.filter_alt_sharp,
                          //     // color: ColorValues.,
                          //   ),
                          // ),
                          // ActionButton(
                          //   icon: Icons.add,
                          //   label: "Add New",
                          //   onPressed: () {
                          //     //  Get.offNamed(Routes.addUser);
                          //   },
                          //   color: ColorValues.appGreenColor,
                          // ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () {},
                              text: 'Copy'),
                        ),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () {},
                              text: 'Excel'),
                        ),
                        Container(
                          height: 45,
                          margin: EdgeInsets.only(left: 10),
                          child: CustomElevatedButton(
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () {},
                              text: 'PDF'),
                        ),
                        Container(
                          height: 45,
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
                          height: 35,
                          margin: Dimens.edgeInsets0_0_16_0,
                          child: TextField(
                            onChanged: (value) => controller.search(value),
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
                         Dimens.boxWidth10,
                              ActionButton(
                                icon: Icons.add,
                                label: 'Add MC Execution',
                                onPressed: () {
                                  Get.toNamed(
                                      Routes.addModuleCleaningExecutionContentWeb);
                                },
                                color: ColorValues.appGreenColor,
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
                        child: controller.mcTaskList.isEmpty
                            ? ScrollableTableView(
                                columns: [
                                  "ID",
                                  "Plan ID",
                                  "Responsibility",
                                  "Frequency",
                                  "No. Of Days",
                                  "Start Date",
                                  "Done Date",
                                  "Status",
                                  "Action",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.16,
                                  );
                                }).toList(),
                                rows: [
                                  ...List.generate(
                                    controller.mcTaskList.length,
                                    (index) {
                                      return [
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                      ];
                                    },
                                  ),
                                ].map((record) {
                                  return TableViewRow(
                                    height: 40,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              )
                            : ScrollableTableView(
                                paginationController:
                                    controller.paginationController,
                                columns: [
                                  "ID",
                                  "Plan ID",
                                  "Responsibility",
                                  "Frequency",
                                  "No. Of Days",
                                  "Start Date",
                                  "Done Date",
                                  "Status",
                                  "Action",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.08,
                                  );
                                }).toList(),
                                // rows: [],
                                rows: [
                                  ...List.generate(
                                    controller.mcTaskList.length,
                                    (index) => [
                                      '${controller.mcTaskList[index]!.id}',
                                      '${controller.mcTaskList[index]!.planId}',
                                      '${controller.mcTaskList[index]!.responsibility}',
                                      '${controller.mcTaskList[index]!.frequency}',
                                      '${controller.mcTaskList[index]!.noOfDays}',
                                      '${controller.mcTaskList[index]!.startDate}',
                                      '${controller.mcTaskList[index]!.doneDate}',
                                      '${controller.mcTaskList[index]!.status_short}',
                                      'Actions'
                                    ],
                                  ),
                                ].map((record) {
                                  return TableViewRow(
                                    height: 40,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: value == "Actions"
                                            ? Wrap(
                                                children: [
                                                  TableActionButton(
                                                    color: ColorValues
                                                        .appDarkBlueColor,
                                                    icon: Icons
                                                        .remove_red_eye_outlined,
                                                    onPress: () {
                                                      //   Get.toNamed(Routes
                                                      // .calibrationViewScreen);
                                                    },
                                                  ),
                                                  TableActionButton(
                                                    color: ColorValues
                                                        .appYellowColor,
                                                    icon: Icons.edit,
                                                    onPress: () {
                                                      // controller
                                                      //     .editIncidentReport(
                                                      //         id: int.tryParse(
                                                      //             '${record[0]}'));
                                                      // print(
                                                      //     'edit record:${int.tryParse('${record[0]}')}');
                                                    },
                                                  )
                                                ],
                                              )
                                            : Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ValueListenableBuilder(
                          valueListenable: controller.paginationController,
                          builder: (context, value, child) {
                            return Row(children: [
                              Text(
                                  "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                              Row(children: [
                                IconButton(
                                  onPressed: controller.paginationController
                                              .currentPage <=
                                          1
                                      ? null
                                      : () {
                                          controller.paginationController
                                              .previous();
                                        },
                                  iconSize: 20,
                                  splashRadius: 20,
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: controller.paginationController
                                                .currentPage <=
                                            1
                                        ? Colors.black26
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.paginationController
                                              .currentPage >=
                                          controller
                                              .paginationController.pageCount
                                      ? null
                                      : () {
                                          controller.paginationController
                                              .next();
                                        },
                                  iconSize: 20,
                                  splashRadius: 20,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: controller.paginationController
                                                .currentPage >=
                                            controller
                                                .paginationController.pageCount
                                        ? Colors.black26
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                              ]),
                            ]);
                          }),
                    ),
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
