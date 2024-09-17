import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';

import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_observation_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/mis_list_of_observation/observation_list_controller.dart';

class ObservationListMobile extends GetView<ObservationListController> {
  ObservationListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ObservationListController>(
        id: 'PreventiveMaintenanceTask',
        builder: (context) {
          return Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        HeaderWidgetMobile(
                          onPressed: () {
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['PreventiveMaintenanceTask']);
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            // ignore: unnecessary_null_comparison
                            itemCount: controller.getObservationList != null
                                ? controller.getObservationList.length
                                : 0,
                            itemBuilder: (context, index) {
                              final obsListModel =
                                  // ignore: unnecessary_null_comparison
                                  controller.getObservationList != null
                                      ? controller.getObservationList[index]
                                      : GetObservationList();
                              return GestureDetector(
                                  onTap: () {
                                    int obsId = obsListModel.id ?? 0;
                                    if (obsId != 0) {
                                      Get.toNamed(Routes.createObservation,
                                          arguments: {'obsId': obsId});
                                    }
                                  },
                                  child: SizedBox(
                                    width: double.infinity,
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
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'OBS Id : ${obsListModel.id ?? 0}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      Dimens.edgeInsets8_2_8_2,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorValues.addNewColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    '${obsListModel.short_status}',
                                                    style: Styles.white10
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Month Of Observation: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${obsListModel.month_of_observation ?? ""}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Date Of Observation: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel
                                                            .date_of_observation ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Contractor Name: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel
                                                            .contractor_name ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Location Of Observation: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel
                                                            .location_of_observation ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Type Of Observation: ',
                                                    style: TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel
                                                        .type_of_observation
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Source Of Observation: ',
                                                    style: TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    (obsListModel
                                                        .source_of_observation
                                                        .toString()),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Risk Type: ',
                                                    style: TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel.risk_type
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Corrective Action: ',
                                                    style: TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel
                                                        .corrective_action
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Responsible Person: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel
                                                            .responsible_person
                                                            .toString() ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Target Date: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel.target_date ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Action Taken: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel.action_taken ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Closer Date: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel.closer_date ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Cost Type: ',
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    obsListModel.cost_type
                                                            ?.toString() ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          ),
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
                            var pickUpDate = value.startDate ?? DateTime.now();
                            var dropDate = value.endDate ?? pickUpDate;
                            controller.fromDate.value = pickUpDate;
                            controller.toDate.value = dropDate;
                            // controller.getgetObservationListByDate();
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
                  SizedBox(height: 10),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Get.offNamed(Routes.createObservation),
              backgroundColor: ColorValues.navyBlueColor,
              child: Icon(
                Icons.add,
                color: ColorValues.whiteColor,
              ),
            ),
          );
        });
  }
}
