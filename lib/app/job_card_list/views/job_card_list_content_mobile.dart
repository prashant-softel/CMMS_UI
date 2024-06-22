import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/job_card_list/job_card_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/job_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobCardContentMobile extends GetView<JobCardListController> {
  JobCardContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return GetBuilder<JobCardListController>(
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
                        // onPressed: () {
                        //   controller.openFromDateToStartDatePicker =
                        //       !controller.openFromDateToStartDatePicker;
                        //   controller.update(['PreventiveMaintenanceTask']);
                        //   DatePickerWidget(
                        //     selectionMode: DateRangePickerSelectionMode.range,
                        //     monthCellStyle: DateRangePickerMonthCellStyle(
                        //       todayCellDecoration: BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: ColorValues.appDarkBlueColor),
                        //     ), // last date of this year
                        //     // controller: DateRangePickerController(),
                        //     initialSelectedRange: PickerDateRange(
                        //       controller.fromDate.value,
                        //       controller.toDate.value,
                        //     ),

                        //     onSubmit: (value) {
                        //       print('po valu ${value.toString()}');
                        //       PickerDateRange? data = value as PickerDateRange;

                        //       var pickUpDate =
                        //           DateTime.parse(data.startDate.toString());
                        //       controller.fromDate.value = pickUpDate;
                        //       var dropDate =
                        //           DateTime.parse(data.endDate.toString());
                        //       dropDate != null
                        //           ? controller.toDate.value = dropDate
                        //           : controller.toDate.value = pickUpDate;

                        //       //  controller.getPmTaskListByDate();
                        //       controller.openFromDateToStartDatePicker =
                        //           !controller.openFromDateToStartDatePicker;
                        //       controller.update(['PreventiveMaintenanceTask']);

                        //       // Get.toNamed(
                        //       //   Routes.stockManagementGoodsOrdersScreen,
                        //       // );
                        //     },
                        //   );
                        // },
                        ),
                    Dimens.boxHeight10,
                    Expanded(
                      child: ListView.builder(
                          //physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.jobList != null
                              ? controller.jobList.length
                              : 0,
                          itemBuilder: (context, index) {
                            final jobcardModel = (controller.jobList != null)
                                ? controller.jobList[index]
                                : JobCardModel();
                            return GestureDetector(
                              onTap: () {
                                controller.clearStoreData();
                                int jobCardId = jobcardModel.jobCardId ?? 0;
                                if (jobCardId != 0) {
                                  Get.toNamed(Routes.jobCard,
                                      arguments: {'JcId': jobCardId});
                                }
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
                                                'Job Card Id: ',
                                                style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                'JC${jobcardModel?.jobCardId ?? 0}',
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
                                                  color: jobcardModel!
                                                              .currentStatus ==
                                                          151
                                                      ? ColorValues.createsColor
                                                      : jobcardModel
                                                                  .currentStatus ==
                                                              152
                                                          ? ColorValues
                                                              .startColor
                                                          : jobcardModel
                                                                      .currentStatus ==
                                                                  153
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  181,
                                                                  129,
                                                                  179)
                                                              : jobcardModel
                                                                          .currentStatus ==
                                                                      155
                                                                  ? ColorValues
                                                                      .waitingForApproveStatusColor
                                                                  : ColorValues
                                                                      .lightBlueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  '${jobcardModel?.statusShort}',
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
                                              'Job Id: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Job${jobcardModel?.jobId}'
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
                                              'Permit No.: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${jobcardModel?.permit_no ?? ''}",
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
                                              'Assigned To: ',
                                              style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${jobcardModel?.job_assinged_to ?? ''}",
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
                                                  'Description:',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                    // softWrap: false,
                                                    "${jobcardModel?.description ?? ''}",
                                                    style: const TextStyle(
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis)
                                              ],
                                            ),
                                            //  Spacer(),
                                          ]),
                                          Row(children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Start Time:',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "${jobcardModel?.start_time ?? ''}",
                                                  style: const TextStyle(
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                          Row(children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'End Time:',
                                                  style: const TextStyle(
                                                      color: ColorValues
                                                          .blackColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "${jobcardModel?.end_time ?? ''}",
                                                  style: const TextStyle(
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
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
