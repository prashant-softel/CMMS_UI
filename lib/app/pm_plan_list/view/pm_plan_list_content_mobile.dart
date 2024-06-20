import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_controller.dart';
import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_controller.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../domain/models/pm_plan_list_model.dart';
import '../../widgets/date_picker.dart';

class PmPlanContentMobile extends GetView<PmPlanListController> {
  PmPlanContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<PmPlanListController>(
        id: 'PreventiveMaintenanceTask',
        builder: (controller) {
          return //
              Scaffold(
            body: //
                Obx(
              () => Container(
                child: //
                    Column(
                  children: [
                    Dimens.boxHeight10,
                    HeaderWidgetMobile(
                      onPressed: () {
                        controller.openFromDateToStartDatePicker =
                            !controller.openFromDateToStartDatePicker;
                        controller.update(['PreventiveMaintenanceTask']);
                        DatePickerWidget(
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

                            //  controller.getPmTaskListByDate();
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['PreventiveMaintenanceTask']);

                            // Get.toNamed(
                            //   Routes.stockManagementGoodsOrdersScreen,
                            // );
                          },
                        );
                      },
                    ),
                    Dimens.boxHeight10,
                    Expanded(
                      child: ListView.builder(
                          //physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.pmPlanList != null
                              ? controller.pmPlanList.length
                              : 0,
                          itemBuilder: (context, index) {
                            final pmTaskModel = (controller.pmPlanList != null)
                                ? controller.pmPlanList[index]
                                : PmPlanListModel();
                            return GestureDetector(
                              onTap: () {
                                // controller.clearStoreData();
                                // //  controller.clearStoreDatatype();
                                // var _taskId =
                                //     controller.pmPlanList[index]!. ?? 0;
                                // Get.toNamed(Routes.pmTaskView,
                                //     arguments: {'pmTaskId': _taskId});
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  color: Colors.lightBlue.shade50,
                                  elevation: 10,
                                  shadowColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
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
                                                'Plan Id: ',
                                                style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                'PMP${pmTaskModel?.plan_id ?? 0}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                padding:
                                                    Dimens.edgeInsets8_2_8_2,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorValues.addNewColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  '${pmTaskModel?.status_name}',
                                                  style:
                                                      Styles.white10.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            Text(
                                              'Plan Title: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${pmTaskModel?.plan_name}'
                                                '',
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Row(//
                                              children: [
                                            Text(
                                              'Start Date: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                pmTaskModel?.plan_date ?? '',
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ]),
                                          Row(children: [
                                            Text(
                                              'Next Schedule Date: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${pmTaskModel?.next_schedule_date ?? ''}",
                                                style: const TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
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
                                                  'Frequency',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "${pmTaskModel?.plan_freq_name ?? ''}",
                                                  style: const TextStyle(
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Created By',
                                                    style: const TextStyle(
                                                        color: ColorValues
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "${pmTaskModel?.created_by_name ?? ''}",
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
                                                  "${pmTaskModel?.assign_to_name ?? ''}",
                                                  style: const TextStyle(
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Category',
                                                    style: const TextStyle(
                                                        color: ColorValues
                                                            .blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "${pmTaskModel?.category_name ?? ''}",
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
            ),
            //
          );
        });
  }

  ///
}
