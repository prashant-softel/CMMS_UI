import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../preventive_maintenance_task_controller.dart';

class PreventiveMaintenanceTaskContentWeb
    extends GetView<PreventiveMaintenanceTaskController> {
  PreventiveMaintenanceTaskContentWeb({super.key});

  ///
  var controller = Get.find<PreventiveMaintenanceTaskController>();
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
                  child: Text(" / Preventive Maintenance".toUpperCase(),
                      style: Styles.greyMediumLight12),
                ),
                Text(" / PM TASKS", style: Styles.greyMediumLight12)
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
                        children: [
                          Text(
                            "PM Tasks ",
                            style: Styles.blackBold16,
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () async {
                                await Get.dialog(
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 350,
                                        right: 350,
                                        top: 200,
                                        bottom: 200),
                                    child: Container(
                                      color: ColorValues.whiteColor,
                                      child: SfDateRangePicker(
                                        cancelText: "CANCEL",
                                        confirmText: "Ok",
                                        showActionButtons: true,
                                        initialSelectedRange: PickerDateRange(
                                          controller.fromDate.value,
                                          controller.toDate.value,
                                        ),
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        monthCellStyle:
                                            DateRangePickerMonthCellStyle(
                                          todayCellDecoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  ColorValues.appDarkBlueColor),
                                        ),
                                        onSubmit: (value) {
                                          PickerDateRange? data =
                                              value as PickerDateRange;

                                          var pickUpDate = DateTime.parse(
                                              data.startDate.toString());
                                          controller.fromDate.value =
                                              pickUpDate;
                                          var dropDate = DateTime.parse(
                                              data.endDate.toString());
                                          dropDate != null
                                              ? controller.toDate.value =
                                                  dropDate
                                              : controller.toDate.value =
                                                  pickUpDate;
                                          Get.back();
                                          controller.getPmTaskListByDate();
                                        },
                                        onCancel: () => Get.back(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              text:
                                  'To Date: ${controller.formattedTodate.toString()}  From Date: ${controller.formattedFromdate.toString()}',
                            ),
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
                            onChanged: (value) => controller.search(value),
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
                                  "Status",
                                  "Action",
                                ].map((column) {
                                  return TableViewColumn(
                                    minWidth: Get.width * 0.15,
                                    label: column,
                                  );
                                }).toList(),
                                rows: //
                                    [
                                  ...List.generate(
                                    controller.pmTaskList.length,
                                    (index) {
                                      var pmtaskListDetails =
                                          controller.pmTaskList[index];
                                      return [
                                        '${pmtaskListDetails?.maintenance_order_number}',
                                        '${pmtaskListDetails?.schedule_date}',
                                        '${pmtaskListDetails?.completed_date}',
                                        '${pmtaskListDetails?.equipment_name}',
                                        '${pmtaskListDetails?.frequency_name}',
                                        '${pmtaskListDetails?.permit_code}',
                                        '${pmtaskListDetails?.status_name}',
                                        "Action",
                                      ];
                                    },
                                  ),
                                ].map((record) {
                                  return TableViewRow(
                                    height: 90,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: (value == "Action")
                                            ? Wrap(children: [
                                                TableActionButton(
                                                  color:
                                                      ColorValues.appGreenColor,
                                                  icon: Icons
                                                      .remove_red_eye_outlined,
                                                  label: 'View',
                                                  onPress: () {
                                                    controller.selectedItem = controller
                                                        .pmTaskList
                                                        .firstWhere((element) =>
                                                            "${element?.maintenance_order_number}" ==
                                                            record[0]);
                                                    int scheduleId = controller
                                                            .selectedItem?.id ??
                                                        0;
                                                    if (scheduleId != null) {
                                                      Get.toNamed(
                                                          Routes.pmTaskView,
                                                          arguments:
                                                              scheduleId);
                                                    }
                                                    // controller.pmTaskView();
                                                  },
                                                ),
                                                TableActionButton(
                                                  color:
                                                      ColorValues.appRedColor,
                                                  icon: Icons.delete,
                                                  label: 'Delete',
                                                  onPress: () {},
                                                ),
                                                // TableActionButton(
                                                //   color: ColorValues
                                                //       .appLightBlueColor,
                                                //   icon: Icons
                                                //       .access_time_filled_outlined,
                                                //   label: 'History',
                                                //   onPress: () {},
                                                // ),
                                                TableActionButton(
                                                  color:
                                                      ColorValues.appGreenColor,
                                                  icon: Icons
                                                      .remove_red_eye_outlined,
                                                  label: 'Execute',
                                                  onPress: () {
                                                    controller.selectedItem = controller
                                                        .pmTaskList
                                                        .firstWhere((element) =>
                                                            "${element?.maintenance_order_number}" ==
                                                            record[0]);
                                                    int scheduleId = controller
                                                            .selectedItem?.id ??
                                                        0;
                                                    if (scheduleId != null) {
                                                      Get.toNamed(
                                                          Routes.pmExecution,
                                                          arguments:
                                                              scheduleId);
                                                    }
                                                  },
                                                ),
                                                TableActionButton(
                                                  color: ColorValues
                                                      .appDarkBlueColor,
                                                  icon: Icons.link_sharp,
                                                  label: 'Link To Permit',
                                                  onPress: () {},
                                                ),
                                                TableActionButton(
                                                  color: ColorValues
                                                      .appYellowColor,
                                                  icon: Icons.numbers_outlined,
                                                  label: 'PM Pending Jobs',
                                                  onPress: () {},
                                                ),
                                              ])
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
