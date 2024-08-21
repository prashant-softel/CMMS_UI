import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../job_list_controller.dart';

class JobListContentMobile extends GetView<JobListController> {
  JobListContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobListController>(
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
                            itemCount: controller.jobList != null
                                ? controller.jobList.length
                                : 0,
                            itemBuilder: (context, index) {
                              final jobModel = controller.jobList != null
                                  ? controller.jobList[index]
                                  : JobModel();
                              return GestureDetector(
                                onTap: () {
                                  var _jobId = jobModel?.id ?? 0;
                                  controller.goToJobDetailsScreen(_jobId);
                                },
                                child: SizedBox(
                                  width: double.infinity,
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
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'JOB${jobModel?.id ?? 0}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: jobModel?.status ==
                                                            101
                                                        ? ColorValues
                                                            .createdColor
                                                        : jobModel?.status ==
                                                                102
                                                            ? ColorValues
                                                                .assignStatusColor
                                                            : jobModel?.latestJCStatus ==
                                                                    151
                                                                ? ColorValues
                                                                    .createsColor
                                                                : jobModel?.latestJCStatus ==
                                                                        152
                                                                    ? ColorValues
                                                                        .startColor
                                                                    : jobModel?.latestJCStatus ==
                                                                            153
                                                                        ? Color.fromARGB(
                                                                            255,
                                                                            181,
                                                                            129,
                                                                            179)
                                                                        : jobModel?.latestJCStatus ==
                                                                                155
                                                                            ? ColorValues.waitingForApproveStatusColor
                                                                            : ColorValues.lightBlueColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    // color: JobStatusData.getStatusColor(_statusString),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 5,
                                                  ),
                                                  child: Center(
                                                    child: jobModel?.status ==
                                                            101
                                                        ? Text(
                                                            "Job Created",
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        : jobModel?.status ==
                                                                102
                                                            ? Text(
                                                                "Job Assigned",
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              )
                                                            : Text(
                                                                ' ${jobModel?.latestJCStatusShort ?? ''}',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Assigned To: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${jobModel?.assignedToName ?? 'Unassigned'}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                  'Job Title: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  jobModel?.name ?? '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                  'Work Description: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  jobModel?.description ?? '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                  'Work Area: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  jobModel?.workingArea ?? '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Plant name: ',
                                                  style: TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  jobModel?.facilityName ?? '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                  'Breakdown Time: ',
                                                  style: TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  (jobModel?.breakdownTime !=
                                                          null)
                                                      ? DateFormat(
                                                              'dd-MMM-yyyy hh:mm')
                                                          .format(jobModel!
                                                              .breakdownTime!)
                                                      : '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                            controller.getjobListByDate();
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
              onPressed: () => controller.goToAddJobScreen(),
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
