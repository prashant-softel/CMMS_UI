import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/vegetation_execution_plan_list/veg_execution_list_controller.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/veg_task_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class VegExecutionListMobile extends StatefulWidget {
  const VegExecutionListMobile({Key? key}) : super(key: key);

  @override
  _VegExecutionListMobileState createState() => _VegExecutionListMobileState();
}

class _VegExecutionListMobileState extends State<VegExecutionListMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VegExecutionListController>(
      id: "veg_task_list",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Dimens.boxHeight10,
                      HeaderWidgetMobile(
                        onPressed: () {
                          controller.openFromDateToStartDatePicker =
                              !controller.openFromDateToStartDatePicker;
                          controller.update(['veg_task_list']);
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.vegTaskList.length,
                          itemBuilder: (context, index) {
                            final vegTaskModel = controller.vegTaskList[index];
                            VegTaskListModel();
                            return GestureDetector(
                              onTap: () {
                                int id = vegTaskModel?.id ?? 0;
                                int planId = vegTaskModel?.planId ?? 0;
                                if (id != 0) {
                                  controller.clearStoreData();
                                  // controller.clearStoreDataPlanid();
                                  Get.toNamed(
                                      '${Routes.vegExecutionScreen}/${id}/${planId}');
                                }
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
                                              'Id: ',
                                              style: TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              'VE ${vegTaskModel?.id ?? 0}',
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
                                                color: controller.vegTaskList
                                                            .firstWhere(
                                                              (e) =>
                                                                  e?.id ==
                                                                  vegTaskModel
                                                                      ?.id,
                                                              orElse: () =>
                                                                  VegTaskListModel(
                                                                id: 00,
                                                              ),
                                                            )
                                                            ?.status ==
                                                        360
                                                    ? ColorValues.addNewColor
                                                    : controller.vegTaskList
                                                                .firstWhere(
                                                                  (e) =>
                                                                      e?.id ==
                                                                      vegTaskModel
                                                                          ?.id,
                                                                  orElse: () =>
                                                                      VegTaskListModel(
                                                                    id: 00,
                                                                  ),
                                                                )
                                                                ?.status ==
                                                            361
                                                        ? ColorValues.startColor
                                                        : controller.vegTaskList
                                                                    .firstWhere(
                                                                      (e) =>
                                                                          e?.id ==
                                                                          vegTaskModel
                                                                              ?.id,
                                                                      orElse: () =>
                                                                          VegTaskListModel(
                                                                              id: 00),
                                                                    )
                                                                    ?.status ==
                                                                362
                                                            ? ColorValues
                                                                .closeColor
                                                            : controller
                                                                        .vegTaskList
                                                                        .firstWhere(
                                                                          (e) =>
                                                                              e?.id ==
                                                                              vegTaskModel?.id,
                                                                          orElse: () =>
                                                                              VegTaskListModel(id: 00),
                                                                        )
                                                                        ?.status ==
                                                                    363
                                                                ? ColorValues
                                                                    .completeColor
                                                                : controller
                                                                            .vegTaskList
                                                                            .firstWhere(
                                                                              (e) => e?.id == vegTaskModel?.id,
                                                                              orElse: () => VegTaskListModel(id: 00),
                                                                            )
                                                                            ?.status ==
                                                                        364
                                                                    ? ColorValues
                                                                        .lightBlueColor
                                                                    : controller
                                                                                .vegTaskList
                                                                                .firstWhere(
                                                                                  (e) => e?.id == vegTaskModel?.id,
                                                                                  orElse: () => VegTaskListModel(id: 00),
                                                                                )
                                                                                ?.status ==
                                                                            365
                                                                        ? ColorValues
                                                                            .approveColor
                                                                        : controller.vegTaskList
                                                                                    .firstWhere(
                                                                                      (e) => e?.id == vegTaskModel?.id,
                                                                                      orElse: () => VegTaskListModel(id: 00),
                                                                                    )
                                                                                    ?.status ==
                                                                                366
                                                                            ? ColorValues.rejectColor
                                                                            : controller.vegTaskList
                                                                                        .firstWhere(
                                                                                          (e) => e?.id == vegTaskModel?.id,
                                                                                          orElse: () => VegTaskListModel(id: 00),
                                                                                        )
                                                                                        ?.status ==
                                                                                    367
                                                                                ? ColorValues.yellowColor
                                                                                : controller.vegTaskList
                                                                                            .firstWhere(
                                                                                              (e) => e?.id == vegTaskModel?.id,
                                                                                              orElse: () => VegTaskListModel(id: 00),
                                                                                            )
                                                                                            ?.status ==
                                                                                        368
                                                                                    ? ColorValues.linktopermitColor
                                                                                    : controller.vegTaskList
                                                                                                .firstWhere(
                                                                                                  (e) => e?.id == vegTaskModel?.id,
                                                                                                  orElse: () => VegTaskListModel(id: 00),
                                                                                                )
                                                                                                ?.status ==
                                                                                            381
                                                                                        ? const Color.fromARGB(255, 83, 105, 72)
                                                                                        : controller.vegTaskList
                                                                                                    .firstWhere(
                                                                                                      (e) => e?.id == vegTaskModel?.id,
                                                                                                      orElse: () => VegTaskListModel(id: 00),
                                                                                                    )
                                                                                                    ?.status ==
                                                                                                382
                                                                                            ? const Color.fromARGB(255, 142, 99, 96)
                                                                                            : controller.vegTaskList
                                                                                                        .firstWhere(
                                                                                                          (e) => e?.id == vegTaskModel?.id,
                                                                                                          orElse: () => VegTaskListModel(id: 00),
                                                                                                        )
                                                                                                        ?.status ==
                                                                                                    383
                                                                                                ? ColorValues.approveColor
                                                                                                : controller.vegTaskList
                                                                                                            .firstWhere(
                                                                                                              (e) => e?.id == vegTaskModel?.id,
                                                                                                              orElse: () => VegTaskListModel(id: 00),
                                                                                                            )
                                                                                                            ?.status ==
                                                                                                        384
                                                                                                    ? ColorValues.rejectColor
                                                                                                    : ColorValues.addNewColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '${vegTaskModel?.status_short}',
                                                style: Styles.white10.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        buildInfoRow(
                                          'Title: ',
                                          vegTaskModel?.title ?? '',
                                        ),
                                        buildInfoRow(
                                          'Plan ID: ',
                                          "VC ${vegTaskModel?.planId}",
                                        ),
                                        buildInfoRow(
                                          'Frequency: ',
                                          vegTaskModel?.frequency ?? '',
                                        ),
                                        buildInfoRow(
                                          'No Of Days: ',
                                          vegTaskModel?.noOfDays.toString() ??
                                              '',
                                        ),
                                        buildInfoRow(
                                          'Start Date: ',
                                          vegTaskModel?.scheduledDate ==
                                                  "0001-01-01"
                                              ? '-'
                                              : vegTaskModel?.scheduledDate ??
                                                  "",
                                        ),
                                        buildInfoRow(
                                          'Done Date: ',
                                          vegTaskModel?.doneDate == "0001-01-01"
                                              ? '-'
                                              : vegTaskModel?.doneDate ?? "",
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
                          controller.getVegExcustionListByDate();
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['veg_task_list']);
                        }
                      },
                      onCancel: () {
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['veg_task_list']);
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
