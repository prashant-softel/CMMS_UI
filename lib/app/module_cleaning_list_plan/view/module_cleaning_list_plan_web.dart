import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_controller.dart';
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

class ModuleCleaningListPlan extends GetView<ModuleCleaningListPlanController> {
  ModuleCleaningListPlan({super.key});

  var controller = Get.find<ModuleCleaningListPlanController>();

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
                  child: Text(" / MODULE CLEANING",
                      style: Styles.greyMediumLight12),
                ),
                Text(" / MODULE CLEANING PLANNING",
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
                            "Module Cleaning Planning",
                            style: Styles.blackBold16,
                          ),
                          // Container(
                          //   child: Icon(
                          //     Icons.filter_alt_sharp,
                          //     // color: ColorValues.,
                          //   ),
                          // ),
                          ActionButton(
                            icon: Icons.add,
                            label: "Add New",
                            onPressed: () {
                              Get.offNamed(Routes.moduleCleaningPlanning);
                            },
                            color: ColorValues.appGreenColor,
                          ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var entry
                            in controller.columnVisibility.value.entries)
                          Row(
                            children: [
                              ValueListenableBuilder(
                                valueListenable: controller.columnVisibility,
                                builder: (context, value, child) {
                                  return Checkbox(
                                    value: value[entry.key],
                                    onChanged: (newValue) {
                                      controller.setColumnVisibility(
                                          entry.key, newValue!);
                                    },
                                  );
                                },
                              ),
                              Text(entry.key),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    controller.moduleCleaningListPlan.isEmpty
                        ? Dimens.box0
                        : Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: controller.columnVisibility,
                              builder: (context, value, child) {
                                return DataTable(columns: [
                                  for (var entry in value.entries)
                                    if (entry.value)
                                      DataColumn(label: Text(entry.key)),
                                  DataColumn(label: Text('Action')),
                                ], rows: [
                                  for (var index = 0;
                                      index < controller.filteredData.length;
                                      index++)
                                    DataRow(cells: [
                                      for (var entry in value.entries)
                                        if (entry.value)
                                          DataCell(entry.key == "Plan Id"
                                              ? Column(
                                                  children: [
                                                    Text(controller
                                                            .filteredData[index]
                                                            .columnByName(
                                                                entry.key) ??
                                                        ''),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        padding: Dimens
                                                            .edgeInsets8_2_8_2,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorValues
                                                              .addNewColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        child: Text(
                                                          controller
                                                                  .filteredData[
                                                                      index]
                                                                  .status_short ??
                                                              '',
                                                          style: Styles.white10
                                                              .copyWith(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Text(controller
                                                      .filteredData[index]
                                                      .columnByName(
                                                          entry.key) ??
                                                  '')),
                                      DataCell(
                                        Wrap(children: [
                                          TableActionButton(
                                            color: ColorValues.viewColor,
                                            icon: Icons.remove_red_eye_outlined,
                                            message: 'view',
                                            onPress: () {
                                              // controller
                                              //     .viewAddGoodsOrdersDetails(
                                              //         id: int.tryParse(
                                              //             '${record[0]}'));
                                              // Get.toNamed(Routes.viewGoodsOrders);
                                            },
                                          ),
                                          TableActionButton(
                                            onPress: () {
                                              // controller
                                              //     .showAddGoodsOrdersDetails(
                                              //         id: int.tryParse(
                                              //             '${record[0]}'));
                                            },
                                            color: ColorValues.editColor,
                                            icon: Icons.edit,
                                            message: 'Edit',
                                          ),
                                          TableActionButton(
                                            color: ColorValues.deleteColor,
                                            icon: Icons.delete,
                                            message: 'Delete',
                                            onPress: () {
                                              // controller.isDeleteDialog(
                                              //     id: record[0],
                                              //     generatedBy: record[1]);
                                            },
                                          ),
                                        ]),
                                      )
                                    ]),
                                ]);
                              },
                            ),
                          ),

                    // controller.moduleCleaningListPlan!.isEmpty
                    //     ? Expanded(
                    //         child: ScrollableTableView(
                    //           columns: [
                    //             "Plan Id",
                    //             "Plan Title",
                    //             "No of days",
                    //             "Created By",
                    //             "Frequency",
                    //             "Status",
                    //             "Action",
                    //           ].map((column) {
                    //             return TableViewColumn(
                    //               label: column,
                    //               minWidth: Get.width * 0.1,
                    //             );
                    //           }).toList(),
                    //           rows: [
                    //             ...List.generate(
                    //               controller.moduleCleaningListPlan?.length ??
                    //                   0,
                    //               (index) {
                    //                 return ['', '', '', '', '', '', ''];
                    //               },
                    //             ),
                    //           ].map((record) {
                    //             return TableViewRow(
                    //               height: 60,
                    //               cells: record.map((value) {
                    //                 return TableViewCell(
                    //                   child: Text(value),
                    //                 );
                    //               }).toList(),
                    //             );
                    //           }).toList(),
                    //         ),
                    //       )
                    //     : Expanded(
                    //         child: Container(
                    //           margin: Dimens.edgeInsets15,
                    //           decoration: BoxDecoration(
                    //             border: Border.all(
                    //               color:
                    //                   ColorValues.lightGreyColorWithOpacity35,
                    //               width: 1,
                    //             ),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: ColorValues.appBlueBackgroundColor,
                    //                 spreadRadius: 2,
                    //                 blurRadius: 5,
                    //                 offset: Offset(0, 2),
                    //               ),
                    //             ],
                    //           ),
                    //           child: ScrollableTableView(
                    //               paginationController:
                    //                   controller.paginationController,
                    //               columns: [
                    //                 "Plan Id",
                    //                 "Plan Title",
                    //                 "No of days",
                    //                 "Created By",
                    //                 "Frequency",
                    //                 "Action",
                    //               ].map((column) {
                    //                 return TableViewColumn(
                    //                   label: column,
                    //                   minWidth: Get.width * 0.12,
                    //                 );
                    //               }).toList(),
                    //               rows: controller.moduleCleaningListPlan!
                    //                   .map((moduleleaningDetails) =>
                    //                       TableViewRow(height: 60, cells: [
                    //                         TableViewCell(
                    //                             child: Column(
                    //                           children: [
                    //                             Text(
                    //                               '${moduleleaningDetails?.planId}',
                    //                             ),
                    //                             Dimens.boxHeight10,
                    //                             Align(
                    //                               alignment:
                    //                                   Alignment.centerRight,
                    //                               child: Container(
                    //                                 padding: Dimens
                    //                                     .edgeInsets8_2_8_2,
                    //                                 decoration: BoxDecoration(
                    //                                   color: ColorValues
                    //                                       .addNewColor,
                    //                                   borderRadius:
                    //                                       BorderRadius.circular(
                    //                                           4),
                    //                                 ),
                    //                                 child: Text(
                    //                                   '${moduleleaningDetails?.status_short}',
                    //                                   style: Styles.white10
                    //                                       .copyWith(
                    //                                     color: Colors.white,
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         )),
                    //                         TableViewCell(
                    //                             child: Text(
                    //                           '${moduleleaningDetails?.title}',
                    //                         )),
                    //                         TableViewCell(
                    //                             child: Text(
                    //                           '${moduleleaningDetails?.noOfCleaningDays}',
                    //                         )),
                    //                         TableViewCell(
                    //                             child: Text(
                    //                                 '${moduleleaningDetails?.createdBy}')),
                    //                         TableViewCell(
                    //                             child: Text(
                    //                           '${moduleleaningDetails?.frequency}',
                    //                         )),
                    //                         TableViewCell(
                    //                             child: Wrap(children: [
                    //                           TableActionButton(
                    //                             color: ColorValues.viewColor,
                    //                             icon: Icons
                    //                                 .remove_red_eye_outlined,
                    //                             // label: 'view',

                    //                             onPress: () {
                    //                               // controller
                    //                               //     .viewAddGoodsOrdersDetails(
                    //                               //         id: int.tryParse(
                    //                               //             '${record[0]}'));
                    //                               // Get.toNamed(Routes.viewGoodsOrders);
                    //                             },
                    //                           ),
                    //                           TableActionButton(
                    //                             onPress: () {
                    //                               // controller
                    //                               //     .showAddGoodsOrdersDetails(
                    //                               //         id: int.tryParse(
                    //                               //             '${record[0]}'));
                    //                             },
                    //                             color: ColorValues.editColor,
                    //                             icon: Icons.edit,
                    //                           ),
                    //                           TableActionButton(
                    //                             color: ColorValues.deleteColor,
                    //                             icon: Icons.delete,
                    //                             // label: 'Delete',
                    //                             onPress: () {
                    //                               // controller.isDeleteDialog(
                    //                               //     id: record[0],
                    //                               //     generatedBy: record[1]);
                    //                             },
                    //                           ),
                    //                         ]))
                    //                       ]))
                    //                   .toList()),
                    //         ),
                    //       ),

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
