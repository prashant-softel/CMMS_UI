import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/job_card_list/job_card_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/job_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class JobCardContentMobile extends GetView<JobCardListController> {
  JobCardContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobCardListController>(
      id: 'PreventiveMaintenanceTask',
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: [
                Column(
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
                        itemCount: controller.jobList?.length ?? 0,
                        itemBuilder: (context, index) {
                          final jobcardModel =
                              controller.jobList?[index] ?? JobCardModel();
                          return GestureDetector(
                            onTap: () {
                              controller.clearStoreData();
                              int jobCardId = jobcardModel.jobCardId ?? 0;
                              if (jobCardId != 0) {
                                Get.toNamed(
                                  Routes.jobCard,
                                  arguments: {'JcId': jobCardId},
                                );
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
                                            'Job Card Id: ',
                                            style: TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            'JC${jobcardModel.jobCardId ?? 0}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorValues.navyBlueColor,
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            padding: Dimens.edgeInsets8_2_8_2,
                                            decoration: BoxDecoration(
                                              color: _getStatusColor(
                                                  jobcardModel.currentStatus),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              '${jobcardModel.statusShort}',
                                              style: Styles.white10.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Job Id: ',
                                            style: TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              'Job${jobcardModel.jobId ?? ''}',
                                              style: TextStyle(
                                                color:
                                                    ColorValues.navyBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Permit No.: ',
                                            style: TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              jobcardModel.permit_no ?? '',
                                              style: TextStyle(
                                                color:
                                                    ColorValues.navyBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Assigned To: ',
                                            style: TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              jobcardModel.job_assinged_to ??
                                                  '',
                                              style: TextStyle(
                                                color:
                                                    ColorValues.navyBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Description:',
                                                style: TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                jobcardModel.description ?? '',
                                                style: TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Start Time:',
                                                style: TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                jobcardModel.start_time ?? '',
                                                style: TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'End Time:',
                                                style: TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                jobcardModel.end_time ?? '',
                                                style: TextStyle(
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
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
                          controller.getjobcardListByDate();
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
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(int? status) {
    switch (status) {
      case 151:
        return ColorValues.createsColor;
      case 152:
        return ColorValues.startColor;
      case 153:
        return Color.fromARGB(255, 181, 129, 179);
      case 155:
        return ColorValues.waitingForApproveStatusColor;
      default:
        return ColorValues.lightBlueColor;
    }
  }
}
