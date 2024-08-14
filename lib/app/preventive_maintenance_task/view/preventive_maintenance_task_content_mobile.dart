import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_controller.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/date_picker.dart';

class PreventiveTaskContentMobile
    extends GetView<PreventiveMaintenanceTaskController> {
  PreventiveTaskContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreventiveMaintenanceTaskController>(
        id: 'PreventiveMaintenanceTask',
        builder: (controller) {
          return Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Dimens.boxHeight10,
                        HeaderWidgetMobile(
                          onPressed: () {
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['PreventiveMaintenanceTask']);
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                              //physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.pmTaskList != null
                                  ? controller.pmTaskList.length
                                  : 0,
                              itemBuilder: (context, index) {
                                final pmTaskModel =
                                    (controller.pmTaskList != null)
                                        ? controller.pmTaskList[index]
                                        : PmTaskListModel();
                                return GestureDetector(
                                  onTap: () {
                                    controller.clearStoreData();
                                    controller.clearStoreDatatype();
                                    var _taskId =
                                        controller.pmTaskList[index]!.id ?? 0;
                                    Get.toNamed(Routes.pmTaskView,
                                        arguments: {'pmTaskId': _taskId});
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Card(
                                      color: Colors.lightBlue.shade50,
                                      elevation: 10,
                                      shadowColor: Colors.black87,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Task Id: ',
                                                    style: const TextStyle(
                                                        color: ColorValues
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'PMT${pmTaskModel?.id ?? 0}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    padding: Dimens
                                                        .edgeInsets8_2_8_2,
                                                    decoration: BoxDecoration(
                                                      color: controller
                                                                  .pmTaskList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        e?.id ==
                                                                        pmTaskModel
                                                                            ?.id,
                                                                    orElse: () =>
                                                                        PmTaskListModel(
                                                                            id: 00),
                                                                  )
                                                                  ?.status ==
                                                              164
                                                          ? ColorValues
                                                              .linktopermitColor
                                                          : controller
                                                                      .pmTaskList
                                                                      .firstWhere(
                                                                        (e) =>
                                                                            e?.id ==
                                                                            pmTaskModel?.id,
                                                                        orElse: () =>
                                                                            PmTaskListModel(id: 00),
                                                                      )
                                                                      ?.status ==
                                                                  162
                                                              ? ColorValues
                                                                  .appLightBlueColor
                                                              : controller
                                                                          .pmTaskList
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                e?.id ==
                                                                                pmTaskModel?.id,
                                                                            orElse: () =>
                                                                                PmTaskListModel(id: 00),
                                                                          )
                                                                          ?.status ==
                                                                      163
                                                                  ? ColorValues
                                                                      .appYellowColor
                                                                  : controller
                                                                              .pmTaskList
                                                                              .firstWhere(
                                                                                (e) => e?.id == pmTaskModel?.id,
                                                                                orElse: () => PmTaskListModel(id: 00),
                                                                              )
                                                                              ?.status ==
                                                                          167
                                                                      ? ColorValues
                                                                          .approveStatusColor
                                                                      : controller.pmTaskList
                                                                                  .firstWhere(
                                                                                    (e) => e?.id == pmTaskModel?.id,
                                                                                    orElse: () => PmTaskListModel(id: 00),
                                                                                  )
                                                                                  ?.status ==
                                                                              165
                                                                          ? ColorValues.closeColor
                                                                          : controller.pmTaskList
                                                                                      .firstWhere(
                                                                                        (e) => e?.id == pmTaskModel?.id,
                                                                                        orElse: () => PmTaskListModel(id: 00),
                                                                                      )
                                                                                      ?.status ==
                                                                                  169
                                                                              ? ColorValues.approveStatusColor
                                                                              : controller.pmTaskList
                                                                                          .firstWhere(
                                                                                            (e) => e?.id == pmTaskModel?.id,
                                                                                            orElse: () => PmTaskListModel(id: 00),
                                                                                          )
                                                                                          ?.status ==
                                                                                      168
                                                                                  ? ColorValues.rejectedStatusColor
                                                                                  : ColorValues.addNewColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Text(
                                                      '${pmTaskModel?.status_short}',
                                                      style: Styles.white10
                                                          .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(children: [
                                                Text(
                                                  'Task Title: ',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${pmTaskModel?.name}'
                                                    '',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              Row(//
                                                  children: [
                                                Text(
                                                  'Category: ',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    pmTaskModel
                                                            ?.category_name ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ]),
                                              Row(children: [
                                                Text(
                                                  'Frequency: ',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "${pmTaskModel?.frequency_name ?? ''}",
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ]),
                                              Row(children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Last Done Date',
                                                      style: const TextStyle(
                                                          color: ColorValues
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "${pmTaskModel?.last_done_date ?? ''}",
                                                      style: const TextStyle(
                                                        color: ColorValues
                                                            .navyBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Spacer(),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Next Due Date',
                                                        style: const TextStyle(
                                                            color: ColorValues
                                                                .blackColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "${pmTaskModel?.due_date ?? ''}",
                                                        style: const TextStyle(
                                                          color: ColorValues
                                                              .navyBlueColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                              Row(children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Assigned To',
                                                      style: const TextStyle(
                                                          color: ColorValues
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "${pmTaskModel?.assigned_to_name ?? ''}",
                                                      style: const TextStyle(
                                                        color: ColorValues
                                                            .navyBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Spacer(),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'PTW Linked',
                                                        style: const TextStyle(
                                                            color: ColorValues
                                                                .blackColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        "${pmTaskModel?.permit_code ?? ''}",
                                                        style: const TextStyle(
                                                          color: ColorValues
                                                              .navyBlueColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ]),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      top: 50,
                      left: 10,
                      right: 10,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorValues.appDarkBlueColor,
                          ),
                        ),
                        initialSelectedRange: PickerDateRange(
                          controller.fromDate.value,
                          controller.toDate.value,
                        ),
                        onSubmit: (value) {
                          print('Selected date range: ${value.toString()}');
                          if (value is PickerDateRange) {
                            controller.fromDate.value = value.startDate!;
                            controller.toDate.value =
                                (value.endDate ?? value.startDate)!;
                            controller.getPmTaskListByDate();
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['PreventiveMaintenanceTask']);
                          }
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['PreventiveMaintenanceTask']);
                        },
                      ),
                    ),
                  Dimens.boxHeight10,
                ],
              ),
            ),
            //
          );
        });
  }

  ///
}
