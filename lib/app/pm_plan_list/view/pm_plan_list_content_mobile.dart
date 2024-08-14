import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_controller.dart';
import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../widgets/date_picker.dart';

class PmPlanContentMobile extends GetView<PmPlanListController> {
  PmPlanContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PmPlanListController>(
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
                          shrinkWrap: true,
                          itemCount: controller.pmPlanList?.length ?? 0,
                          itemBuilder: (context, index) {
                            final pmTaskModel = controller.pmPlanList[index] ??
                                PmPlanListModel();
                            return GestureDetector(
                              onTap: () {
                                // controller.clearStoreData();
                                // controller.clearStoreDatatype();
                                // var _taskId = pmTaskModel.id ?? 0;
                                // Get.toNamed(Routes.pmTaskView, arguments: {'pmTaskId': _taskId});
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                              style: TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              'PMP${pmTaskModel.plan_id ?? 0}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorValues.navyBlueColor,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              padding: Dimens.edgeInsets8_2_8_2,
                                              decoration: BoxDecoration(
                                                color: controller.pmPlanList
                                                            .firstWhere(
                                                              (e) =>
                                                                  e?.plan_id ==
                                                                  pmTaskModel
                                                                      ?.plan_id,
                                                              orElse: () =>
                                                                  PmPlanListModel(
                                                                      plan_id:
                                                                          00),
                                                            )
                                                            ?.status_id ==
                                                        406
                                                    ? ColorValues
                                                        .rejectedStatusColor
                                                    : controller.pmPlanList
                                                                .firstWhere(
                                                                  (e) =>
                                                                      e?.plan_id ==
                                                                      pmTaskModel
                                                                          ?.plan_id,
                                                                  orElse: () =>
                                                                      PmPlanListModel(
                                                                          plan_id:
                                                                              00),
                                                                )
                                                                ?.status_id ==
                                                            401
                                                        ? ColorValues
                                                            .appLightBlueColor
                                                        : controller.pmPlanList
                                                                    .firstWhere(
                                                                      (e) =>
                                                                          e?.plan_id ==
                                                                          pmTaskModel
                                                                              ?.plan_id,
                                                                      orElse: () =>
                                                                          PmPlanListModel(
                                                                              plan_id: 00),
                                                                    )
                                                                    ?.status_id ==
                                                                405
                                                            ? ColorValues
                                                                .approveStatusColor
                                                            : ColorValues
                                                                .addNewColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '${pmTaskModel.status_name}',
                                                style: Styles.white10.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        buildInfoRow('Plan Title: ',
                                            pmTaskModel.plan_name ?? ''),
                                        buildInfoRow('Start Date: ',
                                            pmTaskModel.plan_date ?? ''),
                                        buildInfoRow(
                                            'Next Schedule Date: ',
                                            pmTaskModel.next_schedule_date ??
                                                ''),
                                        Row(
                                          children: [
                                            buildColumnInfo(
                                                'Frequency',
                                                pmTaskModel.plan_freq_name ??
                                                    ''),
                                            Spacer(),
                                            buildColumnInfo(
                                                'Created By',
                                                pmTaskModel.created_by_name ??
                                                    ''),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            buildColumnInfo(
                                                'Assigned To',
                                                pmTaskModel.assign_to_name ??
                                                    ''),
                                            Spacer(),
                                            buildColumnInfo(
                                                'Category',
                                                pmTaskModel.category_name ??
                                                    ''),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
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
                          controller.getPmPlanListByDate();
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
        );
      },
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorValues.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: ColorValues.navyBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildColumnInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorValues.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: ColorValues.navyBlueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
