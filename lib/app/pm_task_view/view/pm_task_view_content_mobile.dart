import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/preventive_maintenance_task/preventive_maintenance_task_controller.dart';
import 'package:cmms/domain/models/pm_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/date_picker.dart';

class PreventiveTaskViewContentMobile
    extends GetView<PreventiveMaintenanceTaskViewController> {
  PreventiveTaskViewContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<PreventiveMaintenanceTaskController>(
        id: 'PreventiveMaintenanceTask',
        builder: (controller) {
          return //
              Scaffold(
            body: //
                //   Obx(
                // () =>
                Container(
              child: //
                  Column(
                children: [
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

                          controller.getPmTaskListByDate();
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
                ],
              ),
            ),
            // ),
            //
          );
        });
  }

  ///////////
}
