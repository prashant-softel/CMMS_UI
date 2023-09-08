import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../pm_plan_list_controller.dart';

class PmPlanListContentWeb extends StatefulWidget {
  PmPlanListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PmPlanListContentWeb> createState() => _PmPlanListContentWebState();
}

class _PmPlanListContentWebState extends State<PmPlanListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PmPlanListController>(
        id: 'PmPlanList',
        builder: (controller) {
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
                        color:
                            Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                      Text(" / PM PLANS", style: Styles.greyMediumLight12)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
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
                                children: [
                                  Text(
                                    "PM Plans ",
                                    style: Styles.blackBold16,
                                  ),
                                  Spacer(),
                                  ActionButton(
                                    icon: Icons.add,
                                    label: "Add New",
                                    onPressed: () {
                                      Get.toNamed(Routes.createPmPlan);
                                    },
                                    color: ColorValues.greenlightColor,
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
                                  height: 35,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'Copy'),
                                ),
                                Container(
                                  height: 35,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'Excel'),
                                ),
                                Container(
                                  height: 35,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appLightBlueColor,
                                      onPressed: () {},
                                      text: 'PDF'),
                                ),
                                Container(
                                  height: 35,
                                  margin: EdgeInsets.only(left: 10),
                                  child: CustomElevatedButton(
                                    backgroundColor:
                                        ColorValues.appLightBlueColor,
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
                                    onChanged: (value) =>
                                        controller.search(value),
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
                                child: controller.pmTaskList.isEmpty
                                    ? ScrollableTableView(
                                        columns: [
                                          "Pm PlanID",
                                          "Pm Plan Title",
                                          "Last Done Date",
                                          "Next Schedule Date",
                                          "Frequency ",
                                          "Created By",
                                          "Action",
                                        ].map((column) {
                                          return TableViewColumn(
                                            label: column,
                                            minWidth: Get.width * 0.16,
                                          );
                                        }).toList(),
                                        rows: [
                                          ...List.generate(
                                            controller.pmTaskList.length,
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
                                              ];
                                            },
                                          ),
                                        ].map((record) {
                                          return TableViewRow(
                                            height: 60,
                                            cells: record.map((value) {
                                              return TableViewCell(
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          );
                                        }).toList(),
                                      )
                                    : ScrollableTableView(
                                        // paginationController:
                                        //     controller.paginationController,
                                        columns: [
                                          "Pm PlanID",
                                          "Pm Plan Title",
                                          "Last Done Date",
                                          "Next Schedule Date",
                                          "Frequency ",
                                          "Created By",
                                          "Action",
                                        ].map((column) {
                                          return TableViewColumn(
                                            minWidth: Get.width * 0.15,
                                            label: column,
                                          );
                                        }).toList(),
                                        rows: //
                                            controller.pmTaskList
                                                .map((pmTaskDetails) =>
                                                    TableViewRow(
                                                        onTap: () {
                                                          int scheduleId =
                                                              pmTaskDetails
                                                                      ?.plan_id ??
                                                                  0;
                                                          final _flutterSecureStorage =
                                                              const FlutterSecureStorage();

                                                          _flutterSecureStorage
                                                              .delete(
                                                                  key:
                                                                      "scheduleId");
                                                          if (scheduleId !=
                                                              null) {
                                                            Get.toNamed(
                                                                Routes
                                                                    .pmTaskView,
                                                                arguments: {
                                                                  'scheduleId':
                                                                      scheduleId
                                                                });
                                                          }
                                                        },
                                                        height: 60,
                                                        cells: [
                                                          TableViewCell(
                                                              child: Column(
                                                            children: [
                                                              Text(
                                                                '${pmTaskDetails?.plan_name}',
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child:
                                                                    Container(
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
                                                                    '${pmTaskDetails?.status_name}',
                                                                    style: Styles
                                                                        .white10
                                                                        .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                          //
                                                          TableViewCell(
                                                              child: Text(
                                                                  "${pmTaskDetails?.created_at ?? ""}")),
                                                          TableViewCell(
                                                              child: Text("--"
                                                                  //   '${pmTaskDetails?.completed_date}'
                                                                  )),
                                                          TableViewCell(
                                                              child: Text(
                                                            "fffghg",
                                                          )), //'${pmTaskDetails?.equipment_name}')),
                                                          TableViewCell(
                                                              child: Text(
                                                            '${pmTaskDetails?.plan_freq_name}',
                                                          )),
                                                          TableViewCell(
                                                              child: Text(
                                                                  '--' // '${pmTaskDetails?.permit_code}',
                                                                  )),
                                                          TableViewCell(
                                                              child: Wrap(
                                                                  children: [
                                                                TableActionButton(
                                                                  color: ColorValues
                                                                      .viewColor,
                                                                  icon: Icons
                                                                      .remove_red_eye_outlined,
                                                                  message:
                                                                      'View',
                                                                  onPress: () {
                                                                    int scheduleId =
                                                                        pmTaskDetails?.plan_id ??
                                                                            0;
                                                                    final _flutterSecureStorage =
                                                                        const FlutterSecureStorage();

                                                                    _flutterSecureStorage
                                                                        .delete(
                                                                            key:
                                                                                "scheduleId");
                                                                    if (scheduleId !=
                                                                        null) {
                                                                      Get.toNamed(
                                                                          Routes
                                                                              .pmTaskView,
                                                                          arguments: {
                                                                            'scheduleId':
                                                                                scheduleId
                                                                          });
                                                                    }
                                                                    // controller.pmTaskView();
                                                                  },
                                                                ),
                                                                TableActionButton(
                                                                  color: ColorValues
                                                                      .editColor,
                                                                  icon: Icons
                                                                      .edit,
                                                                  message:
                                                                      'Edit',
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                                TableActionButton(
                                                                  color: ColorValues
                                                                      .deleteColor,
                                                                  icon: Icons
                                                                      .delete,
                                                                  message:
                                                                      'Delete',
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                              ]))
                                                        ]))
                                                .toList()),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      controller.paginationController,
                                  builder: (context, value, child) {
                                    return Row(children: [
                                      Text(
                                          "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                      Row(children: [
                                        IconButton(
                                          onPressed: controller
                                                      .paginationController
                                                      .currentPage <=
                                                  1
                                              ? null
                                              : () {
                                                  controller
                                                      .paginationController
                                                      .previous();
                                                },
                                          iconSize: 20,
                                          splashRadius: 20,
                                          icon: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: controller
                                                        .paginationController
                                                        .currentPage <=
                                                    1
                                                ? Colors.black26
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: controller
                                                      .paginationController
                                                      .currentPage >=
                                                  controller
                                                      .paginationController
                                                      .pageCount
                                              ? null
                                              : () {
                                                  controller
                                                      .paginationController
                                                      .next();
                                                },
                                          iconSize: 20,
                                          splashRadius: 20,
                                          icon: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: controller
                                                        .paginationController
                                                        .currentPage >=
                                                    controller
                                                        .paginationController
                                                        .pageCount
                                                ? Colors.black26
                                                : Theme.of(context)
                                                    .primaryColor,
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
                ),
              ],
            ),
          );
        });
  }
}
