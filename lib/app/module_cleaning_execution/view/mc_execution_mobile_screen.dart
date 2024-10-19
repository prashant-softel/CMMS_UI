import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_controller.dart';
import 'package:cmms/domain/models/mc_task_list_model.dart';
import 'package:cmms/domain/models/pm_plan_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../widgets/date_picker.dart';

class ModuleCleaningListExecutionMobile
    extends GetView<ModuleCleaningListExecutionController> {
  ModuleCleaningListExecutionMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleCleaningListExecutionController>(
      id: 'McExecution',
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
                          controller.update(['McExecution']);
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.mcTaskList?.length ?? 0,
                          itemBuilder: (context, index) {
                            final mcTaskModel = controller.mcTaskList[index] ??
                                MCTaskListModel();
                            return GestureDetector(
                              onTap: () {
                                int id = mcTaskModel?.executionId ?? 0;
                                int planId = mcTaskModel?.planId ?? 0;
                                if (id != 0) {
                                  controller.clearStoreDataMcid();
                                  controller.clearStoreDataPlanid();
                                  Get.offAllNamed(
                                      '${Routes.addModuleCleaningExecutionContentWeb}/$id/$planId');

                                  // Get.toNamed(
                                  //     Routes
                                  //         .addModuleCleaningExecutionContentWeb,
                                  //     arguments: {
                                  //       "mcid": id,
                                  //       "planId": planId
                                  //     });
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
                                              'MC${mcTaskModel.planId ?? 0}',
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
                                                color: controller.mcTaskList
                                                            .firstWhere(
                                                              (e) =>
                                                                  e?.executionId ==
                                                                  mcTaskModel
                                                                      .executionId,
                                                              orElse: () =>
                                                                  MCTaskListModel(
                                                                      executionId:
                                                                          00),
                                                            )
                                                            ?.status ==
                                                        360
                                                    ? ColorValues.addNewColor
                                                    : controller.mcTaskList
                                                                .firstWhere(
                                                                  (e) =>
                                                                      e?.executionId ==
                                                                      mcTaskModel
                                                                          .executionId,
                                                                  orElse: () =>
                                                                      MCTaskListModel(
                                                                          executionId:
                                                                              00),
                                                                )
                                                                ?.status ==
                                                            361
                                                        ? ColorValues.startColor
                                                        : controller.mcTaskList
                                                                    .firstWhere(
                                                                      (e) =>
                                                                          e?.executionId ==
                                                                          mcTaskModel
                                                                              .executionId,
                                                                      orElse: () =>
                                                                          MCTaskListModel(
                                                                              executionId: 00),
                                                                    )
                                                                    ?.status ==
                                                                362
                                                            ? ColorValues
                                                                .closeColor
                                                            : controller
                                                                        .mcTaskList
                                                                        .firstWhere(
                                                                          (e) =>
                                                                              e?.executionId ==
                                                                              mcTaskModel.executionId,
                                                                          orElse: () =>
                                                                              MCTaskListModel(executionId: 00),
                                                                        )
                                                                        ?.status ==
                                                                    363
                                                                ? ColorValues
                                                                    .completeColor
                                                                : controller
                                                                            .mcTaskList
                                                                            .firstWhere(
                                                                              (e) => e?.executionId == mcTaskModel.executionId,
                                                                              orElse: () => MCTaskListModel(executionId: 00),
                                                                            )
                                                                            ?.status ==
                                                                        364
                                                                    ? ColorValues
                                                                        .lightBlueColor
                                                                    : controller
                                                                                .mcTaskList
                                                                                .firstWhere(
                                                                                  (e) => e?.executionId == mcTaskModel.executionId,
                                                                                  orElse: () => MCTaskListModel(executionId: 00),
                                                                                )
                                                                                ?.status ==
                                                                            365
                                                                        ? ColorValues
                                                                            .approveColor
                                                                        : controller.mcTaskList
                                                                                    .firstWhere(
                                                                                      (e) => e?.executionId == mcTaskModel.executionId,
                                                                                      orElse: () => MCTaskListModel(executionId: 00),
                                                                                    )
                                                                                    ?.status ==
                                                                                366
                                                                            ? ColorValues.rejectColor
                                                                            : controller.mcTaskList
                                                                                        .firstWhere(
                                                                                          (e) => e?.executionId == mcTaskModel.executionId,
                                                                                          orElse: () => MCTaskListModel(executionId: 00),
                                                                                        )
                                                                                        ?.status ==
                                                                                    367
                                                                                ? ColorValues.yellowColor
                                                                                : controller.mcTaskList
                                                                                            .firstWhere(
                                                                                              (e) => e?.executionId == mcTaskModel.executionId,
                                                                                              orElse: () => MCTaskListModel(executionId: 00),
                                                                                            )
                                                                                            ?.status ==
                                                                                        368
                                                                                    ? ColorValues.linktopermitColor
                                                                                    : controller.mcTaskList
                                                                                                .firstWhere(
                                                                                                  (e) => e?.executionId == mcTaskModel.executionId,
                                                                                                  orElse: () => MCTaskListModel(executionId: 00),
                                                                                                )
                                                                                                ?.status ==
                                                                                            381
                                                                                        ? const Color.fromARGB(255, 83, 105, 72)
                                                                                        : controller.mcTaskList
                                                                                                    .firstWhere(
                                                                                                      (e) => e?.executionId == mcTaskModel.executionId,
                                                                                                      orElse: () => MCTaskListModel(executionId: 00),
                                                                                                    )
                                                                                                    ?.status ==
                                                                                                382
                                                                                            ? const Color.fromARGB(255, 142, 99, 96)
                                                                                            : controller.mcTaskList
                                                                                                        .firstWhere(
                                                                                                          (e) => e?.executionId == mcTaskModel.executionId,
                                                                                                          orElse: () => MCTaskListModel(executionId: 00),
                                                                                                        )
                                                                                                        ?.status ==
                                                                                                    383
                                                                                                ? ColorValues.approveColor
                                                                                                : controller.mcTaskList
                                                                                                            .firstWhere(
                                                                                                              (e) => e?.executionId == mcTaskModel.executionId,
                                                                                                              orElse: () => MCTaskListModel(executionId: 00),
                                                                                                            )
                                                                                                            ?.status ==
                                                                                                        384
                                                                                                    ? ColorValues.rejectColor
                                                                                                    : ColorValues.addNewColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '${mcTaskModel.status_short}',
                                                style: Styles.white10.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        buildInfoRow(
                                            'Title: ', mcTaskModel.title ?? ''),
                                        buildInfoRow(
                                            'Plan ID: ',
                                            mcTaskModel.planId.toString() ??
                                                ''),
                                        buildInfoRow('Frequency: ',
                                            mcTaskModel.frequency ?? ''),
                                        buildInfoRow(
                                            'No Of Days: ',
                                            mcTaskModel.noOfDays.toString() ??
                                                ''),
                                        buildInfoRow(
                                            'Start Date: ',
                                            mcTaskModel.scheduledDate ==
                                                    "0001-01-01"
                                                ? '-'
                                                : mcTaskModel.scheduledDate ??
                                                    ""),
                                        buildInfoRow(
                                            'Done Date: ',
                                            mcTaskModel.doneDate == "0001-01-01"
                                                ? '-'
                                                : mcTaskModel.doneDate ?? ""),
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
                          controller.getMcExcustionListByDate();
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['McExecution']);
                        }
                      },
                      onCancel: () {
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['McExecution']);
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
