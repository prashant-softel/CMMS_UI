import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../preventive_maintenance_task_controller.dart';

class PreventiveMaintenanceTaskContentWeb extends StatefulWidget {
  PreventiveMaintenanceTaskContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PreventiveMaintenanceTaskContentWeb> createState() =>
      _PreventiveMaintenanceTaskContentWebState();
}

class _PreventiveMaintenanceTaskContentWebState
    extends State<PreventiveMaintenanceTaskContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreventiveMaintenanceTaskController>(
        id: 'PreventiveMaintenanceTask',
        builder: (controller) {
          return Obx(
            () => SingleChildScrollView(
              child: Column(
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
                        Text(" / PM TASKS", style: Styles.greyMediumLight12)
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
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
                                      "PM Tasks ",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        CustomRichText(title: 'Date Range'),
                                        Dimens.boxWidth10,
                                        CustomTextFieldForStock(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          numberTextField: true,
                                          onTap: () {
                                            controller
                                                    .openFromDateToStartDatePicker =
                                                !controller
                                                    .openFromDateToStartDatePicker;
                                            controller.update(
                                                ['PreventiveMaintenanceTask']);
                                          },
                                          hintText:
                                              '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                        ),
                                      ],
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
                                        contentPadding:
                                            Dimens.edgeInsets10_0_0_0,
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
                                  child: controller.pmTaskList.isEmpty
                                      ? ScrollableTableView(
                                          columns: [
                                            "Order Number",
                                            "Due Date",
                                            "Done Date",
                                            "Equipment Name",
                                            "Order Frequency",
                                            "PTW",
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
                                            "Order Number",
                                            "Due Date",
                                            "Done Date",
                                            "Equipment Name",
                                            "Order Frequency",
                                            "PTW",
                                            "Action",
                                          ].map((column) {
                                            return TableViewColumn(
                                              minWidth: Get.width * 0.15,
                                              label: column,
                                            );
                                          }).toList(),
                                          rows: //
                                              controller.pmTaskList
                                                  .map(
                                                      (pmTaskDetails) =>
                                                          TableViewRow(
                                                              onTap: () {
                                                                int scheduleId =
                                                                    pmTaskDetails
                                                                            ?.id ??
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
                                                                    child:
                                                                        Column(
                                                                  children: [
                                                                    Text(
                                                                      '${pmTaskDetails?.maintenance_order_number}',
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight10,
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            Dimens.edgeInsets8_2_8_2,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              ColorValues.addNewColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          '${pmTaskDetails?.status_name}',
                                                                          style: Styles
                                                                              .white10
                                                                              .copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                                //
                                                                TableViewCell(
                                                                    child: Text(
                                                                        "${pmTaskDetails?.schedule_date ?? ""}")),
                                                                TableViewCell(
                                                                    child: Text(
                                                                        '${pmTaskDetails?.completed_date}')),
                                                                TableViewCell(
                                                                    child: Text(
                                                                        '${pmTaskDetails?.equipment_name}')),
                                                                TableViewCell(
                                                                    child: Text(
                                                                  '${pmTaskDetails?.frequency_name}',
                                                                )),
                                                                TableViewCell(
                                                                    child: Text(
                                                                  '${pmTaskDetails?.permit_code}',
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
                                                                        onPress:
                                                                            () {
                                                                          int scheduleId =
                                                                              pmTaskDetails?.id ?? 0;
                                                                          final _flutterSecureStorage =
                                                                              const FlutterSecureStorage();

                                                                          _flutterSecureStorage.delete(
                                                                              key: "scheduleId");
                                                                          if (scheduleId !=
                                                                              null) {
                                                                            Get.toNamed(Routes.pmTaskView, arguments: {
                                                                              'scheduleId': scheduleId
                                                                            });
                                                                          }
                                                                          // controller.pmTaskView();
                                                                        },
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
                                                                      // TableActionButton(
                                                                      //   color: ColorValues
                                                                      //       .appLightBlueColor,
                                                                      //   icon: Icons
                                                                      //       .access_time_filled_outlined,
                                                                      //   message: 'History',
                                                                      //   onPress: () {},
                                                                      // ),
                                                                      controller.pmTaskList
                                                                                  .firstWhere(
                                                                                    (e) => e?.id == pmTaskDetails!.id,
                                                                                    orElse: () => PmTaskListModel(id: 00),
                                                                                  )
                                                                                  ?.status ==
                                                                              161
                                                                          ? TableActionButton(
                                                                              color: ColorValues.executeColor,
                                                                              icon: Icons.remove_red_eye_outlined,
                                                                              message: 'Execute',
                                                                              onPress: () {
                                                                                final _flutterSecureStorage = const FlutterSecureStorage();

                                                                                _flutterSecureStorage.delete(key: "scheduleId");

                                                                                int scheduleId = pmTaskDetails?.id ?? 0;
                                                                                if (scheduleId != null) {
                                                                                  Get.toNamed(Routes.pmExecution, arguments: {
                                                                                    'scheduleId': scheduleId
                                                                                  });
                                                                                }
                                                                              },
                                                                            )
                                                                          : Dimens.box0,
                                                                      // controller.pmTaskList
                                                                      //             .firstWhere(
                                                                      //               (e) => e?.id == pmTaskDetails!.id,
                                                                      //               orElse: () => PmTaskListModel(id: 00),
                                                                      //             )
                                                                      //             ?.status ==
                                                                      //         163
                                                                      //     ? TableActionButton(
                                                                      //         color: ColorValues.linktopermitColor,
                                                                      //         icon: Icons.link_sharp,
                                                                      //         message: 'Link To Permit',
                                                                      //         onPress: () {
                                                                      //           controller.permitscheduleId = pmTaskDetails?.id ?? 0;

                                                                      //           controller.showPermitsDialog();
                                                                      //         },
                                                                      //       )
                                                                      // //     : Dimens.box0,
                                                                      // TableActionButton(
                                                                      //   color: ColorValues
                                                                      //       .pendingColor,
                                                                      //   icon: Icons
                                                                      //       .numbers_outlined,
                                                                      //   message:
                                                                      //       'PM Pending Jobs',
                                                                      //   onPress:
                                                                      //       () {},
                                                                      // ),
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
                      if (controller.openFromDateToStartDatePicker)
                        Positioned(
                          right: 150,
                          top: 85,
                          child: DatePickerWidget(
                            selectionMode: DateRangePickerSelectionMode.range,
                            monthCellStyle: DateRangePickerMonthCellStyle(
                              todayCellDecoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorValues.appDarkBlueColor),
                            ), // last date of this year
                            // controller: DateRangePickerController(),
                            initialSelectedRange: PickerDateRange(
                              controller.fromDate.value,
                              controller.toDate.value,
                            ),

                            onSubmit: (value) {
                              print('po valu ${value.toString()}');
                              PickerDateRange? data = value as PickerDateRange;

                              var pickUpDate =
                                  DateTime.parse(data.startDate.toString());
                              controller.fromDate.value = pickUpDate;
                              var dropDate =
                                  DateTime.parse(data.endDate.toString());
                              dropDate != null
                                  ? controller.toDate.value = dropDate
                                  : controller.toDate.value = pickUpDate;

                              controller.getPmTaskListByDate();
                              controller.openFromDateToStartDatePicker =
                                  !controller.openFromDateToStartDatePicker;
                              controller.update(['PreventiveMaintenanceTask']);

                              // Get.toNamed(
                              //   Routes.stockManagementGoodsOrdersScreen,
                              // );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
