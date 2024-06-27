import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class IncidentReportListMobile extends GetView<IncidentReportListController> {
  IncidentReportListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IncidentReportListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          //return Obx(() {
          return Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Dimens.boxHeight10,
                        HeaderWidgetMobile(
                          onPressed: () {
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['stock_Mangement_Date']);
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              itemCount: controller.incidentReportList != null
                                  ? controller.incidentReportList.length
                                  : 0,
                              itemBuilder: (context, index) {
                                final incidentReportListModel =
                                    (controller.incidentReportList != null)
                                        ? controller.incidentReportList[index]
                                        : IncidentReportListModel();
                                return GestureDetector(
                                  onTap: () {
                                    controller.clearStoreData();

                                    int irId = incidentReportListModel?.id ?? 0;
                                    if (irId != 0) {
                                      Get.toNamed(
                                          Routes.viewIncidentReportScreen,
                                          arguments: {'irId': irId});
                                    }
                                    // // var _jobId = jobModel?.id ?? 0;
                                    // controller.viewIncidentReport(
                                    //     id: incidentReportListModel?.id);
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
                                                  'Id: ',
                                                  style: TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  'IR${incidentReportListModel?.id ?? 0}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
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
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    '${incidentReportListModel?.status_short}',
                                                    style: Styles.white10
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            buildInfoRow(
                                                'Title: ',
                                                incidentReportListModel
                                                        ?.title ??
                                                    ''),
                                            buildInfoRow(
                                                'Block Name: ',
                                                incidentReportListModel
                                                        ?.block_name ??
                                                    ''),
                                            buildInfoRow(
                                                'Equipment Name: ',
                                                incidentReportListModel
                                                        ?.equipment_name ??
                                                    ''),
                                            Row(
                                              children: [
                                                buildColumnInfo(
                                                    'Approved By:',
                                                    incidentReportListModel
                                                            ?.approved_by ??
                                                        ''),
                                                Spacer(),
                                                buildColumnInfo(
                                                    'Approved At:',
                                                    incidentReportListModel
                                                            ?.approved_at ??
                                                        ''),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                buildColumnInfo(
                                                    'Reported By:',
                                                    incidentReportListModel
                                                            ?.reported_by_name ??
                                                        ''),
                                                Spacer(),
                                                buildColumnInfo(
                                                    'Reported At:',
                                                    incidentReportListModel
                                                            ?.reported_at ??
                                                        ''),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Padding(
                                      //   padding: const EdgeInsets.all(10.0),
                                      //   child: Column(children: [
                                      //     Row(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         ///start date: 2023-07-01, End date: 2023-12-31
                                      //         Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Text(
                                      //               'Id : ',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //             Text(
                                      //               'Title :',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //             Text(
                                      //               'Block Name :',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //             Text(
                                      //               'Equipment Name :',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //             Text(
                                      //               'Approved By :',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //             Text(
                                      //               'Approved At :',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //             Text(
                                      //               'Reported At: ',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //             Text(
                                      //               'Reported By:',
                                      //               style: const TextStyle(
                                      //                   color: ColorValues
                                      //                       .blackColor,
                                      //                   fontWeight:
                                      //                       FontWeight.w400),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         Dimens.boxWidth20,
                                      //         Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.start,
                                      //           children: [
                                      //             Text(
                                      //               "IR${incidentReportListModel?.id}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               "${incidentReportListModel?.title}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               "${incidentReportListModel?.title}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               "${incidentReportListModel?.equipment_name}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               "${incidentReportListModel?.approved_by}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               "${incidentReportListModel?.approved_at}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               "${incidentReportListModel?.reported_at}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //             Text(
                                      //               "${incidentReportListModel?.reported_by_name}",
                                      //               style: const TextStyle(
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: ColorValues
                                      //                     .navyBlueColor,
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         Spacer(),
                                      //         Container(
                                      //           padding: EdgeInsets.symmetric(
                                      //               horizontal: 8.0,
                                      //               vertical: 2.0),
                                      //           decoration: BoxDecoration(
                                      //             color: Colors
                                      //                 .blue, // Use your desired color here
                                      //             borderRadius:
                                      //                 BorderRadius.circular(4),
                                      //           ),
                                      //           child: Text(
                                      //             '${incidentReportListModel?.status_short ?? ''}', // Ensure the text is non-null
                                      //             overflow:
                                      //                 TextOverflow.ellipsis,
                                      //             style: TextStyle(
                                      //               fontSize:
                                      //                   10, // Adjust font size as per your Styles.white10
                                      //               color: Colors
                                      //                   .white, // Ensure the color is white
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ]),
                                      // ),
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
                            var pickUpDate = value.startDate ?? DateTime.now();
                            var dropDate = value.endDate ?? pickUpDate;
                            controller.fromDate.value = pickUpDate;
                            controller.toDate.value = dropDate;
                            controller.getIncidentReportListByDate();
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['stock_Mangement_Date']);
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorValues.navyBlueColor,
              child: Icon(
                Icons.add,
                color: ColorValues.whiteColor,
              ),
            ),
          );
        });
    //  },
    //   );
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
