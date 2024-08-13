import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                                              CrossAxisAlignment.center,
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                varUserAccessModel.value
                                                                    .access_list!
                                                                    .where((e) =>
                                                                        e.feature_id ==
                                                                            UserAccessConstants
                                                                                .kIncidentReportFeatureId &&
                                                                        e.approve ==
                                                                            UserAccessConstants
                                                                                .kHaveApproveAccess)
                                                                    .length >
                                                                0 &&
                                                            incidentReportListModel!
                                                                    .status ==
                                                                181 ||
                                                        // incidentReportListModel!.status == 182 ||
                                                        varUserAccessModel.value
                                                                    .access_list!
                                                                    .where((e) =>
                                                                        e.feature_id ==
                                                                            UserAccessConstants
                                                                                .kIncidentReportFeatureId &&
                                                                        e.approve ==
                                                                            UserAccessConstants
                                                                                .kHaveApproveAccess)
                                                                    .length >
                                                                0 &&
                                                            incidentReportListModel!
                                                                    .status ==
                                                                184
                                                    ? TableActionButton(
                                                        color: ColorValues
                                                            .approveColor,
                                                        icon: Icons.check,
                                                        message: 'Approve IR',

                                                        onPress: () {
                                                          controller
                                                              .clearStoreData();

                                                          int irId =
                                                              incidentReportListModel
                                                                      .id ??
                                                                  0;
                                                          if (irId != 0) {
                                                            Get.toNamed(
                                                                Routes
                                                                    .viewIncidentReportScreen,
                                                                arguments: {
                                                                  'irId':
                                                                      incidentReportListModel
                                                                          .id,
                                                                });
                                                          }
                                                        },
                                                        // onPress: () {
                                                        //   controller.viewIncidentReport(
                                                        //       id: incidentReportListModel?.id);
                                                        //   // print('record:${int.tryParse('${record[0]}')}');
                                                        // },
                                                      )
                                                    : Dimens.box0,

                                                ///Edit button
                                                varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        UserAccessConstants
                                                                            .kIncidentReportFeatureId &&
                                                                    e.edit ==
                                                                        UserAccessConstants
                                                                            .kHaveEditAccess)
                                                                .length >
                                                            0 &&
                                                        incidentReportListModel!
                                                                .status ==
                                                            181
                                                    ? TableActionButton(
                                                        color: ColorValues
                                                            .appYellowColor,
                                                        icon: Icons.edit,
                                                        message: 'Edit',
                                                        onPress: () {
                                                          controller
                                                              .clearStoreData();

                                                          int irId =
                                                              incidentReportListModel
                                                                      .id ??
                                                                  0;
                                                          if (irId != 0) {
                                                            Get.toNamed(
                                                                Routes
                                                                    .addIncidentReportContentWeb,
                                                                arguments: {
                                                                  'irId':
                                                                      incidentReportListModel
                                                                          .id,
                                                                });
                                                          }
                                                        },
                                                      )
                                                    : Dimens.box0,
                                                varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                            UserAccessConstants
                                                                                .kIncidentReportFeatureId &&
                                                                        e.add ==
                                                                            UserAccessConstants
                                                                                .kHaveAddAccess ||
                                                                    e.edit ==
                                                                        UserAccessConstants
                                                                            .kHaveEditAccess)
                                                                .length >
                                                            0 &&
                                                        incidentReportListModel!
                                                                .status ==
                                                            182
                                                    ? TableActionButton(
                                                        color: Color.fromARGB(
                                                            255, 116, 78, 130),
                                                        icon: Icons.ads_click,
                                                        message: 'Re - Submit',
                                                        onPress: () {
                                                          controller
                                                              .clearStoreData();

                                                          int irId =
                                                              incidentReportListModel
                                                                      .id ??
                                                                  0;
                                                          if (irId != 0) {
                                                            Get.toNamed(
                                                                Routes
                                                                    .addIncidentReportContentWeb,
                                                                arguments: {
                                                                  'irId':
                                                                      incidentReportListModel
                                                                          .id,
                                                                });
                                                          }
                                                        },
                                                      )
                                                    : Dimens.box0,

//IR 2nd step button
                                                varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        UserAccessConstants
                                                                            .kIncidentReportFeatureId &&
                                                                    e.add ==
                                                                        UserAccessConstants
                                                                            .kHaveAddAccess)
                                                                .length >
                                                            0 &&
                                                        incidentReportListModel!
                                                                .status ==
                                                            183
                                                    ? TableActionButton(
                                                        color: Color.fromARGB(
                                                            136, 107, 152, 211),
                                                        icon: Icons
                                                            .start_outlined,
                                                        message: 'IR 2nd Step',
                                                        onPress: () {
                                                          controller
                                                              .clearStoreData();

                                                          int irId =
                                                              incidentReportListModel
                                                                      .id ??
                                                                  0;
                                                          if (irId != 0) {
                                                            Get.toNamed(
                                                                Routes
                                                                    .addIncidentReportContentWeb,
                                                                arguments: {
                                                                  'irId':
                                                                      incidentReportListModel
                                                                          .id,
                                                                });
                                                          }
                                                        },
                                                      )
                                                    : Dimens.box0,

                                                varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        UserAccessConstants
                                                                            .kIncidentReportFeatureId &&
                                                                    e.add ==
                                                                        UserAccessConstants
                                                                            .kHaveAddAccess)
                                                                .length >
                                                            0 &&
                                                        incidentReportListModel!
                                                                .status ==
                                                            185
                                                    ? TableActionButton(
                                                        color: Color.fromARGB(
                                                            255, 116, 78, 130),
                                                        icon: Icons.ads_click,
                                                        message: 'Re - Submit',
                                                        onPress: () {
                                                          controller
                                                              .clearStoreData();

                                                          int irId =
                                                              incidentReportListModel
                                                                      .id ??
                                                                  0;
                                                          if (irId != 0) {
                                                            Get.toNamed(
                                                                Routes
                                                                    .addIncidentReportContentWeb,
                                                                arguments: {
                                                                  'irId':
                                                                      incidentReportListModel
                                                                          .id,
                                                                });
                                                          }
                                                        },
                                                      )
                                                    : Dimens.box0,

                                                // Approve/Reject
                                                varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        UserAccessConstants
                                                                            .kIncidentReportFeatureId &&
                                                                    e.approve ==
                                                                        UserAccessConstants
                                                                            .kHaveApproveAccess)
                                                                .length >
                                                            0 &&
                                                        controller
                                                                .incidentReportList
                                                                .firstWhere(
                                                                  (e) =>
                                                                      e?.id ==
                                                                      incidentReportListModel!
                                                                          .id,
                                                                  orElse: () =>
                                                                      IncidentReportListModel(
                                                                          id: 00),
                                                                )
                                                                ?.status ==
                                                            "Submitted"
                                                    ? TableActionButton(
                                                        color: ColorValues
                                                            .appGreenColor,
                                                        icon: Icons.check,
                                                        message:
                                                            'Approve/Reject',
                                                        onPress: () {
                                                          // Get.dialog(PermitApprovedDialog(
                                                          //     permitId:
                                                          //         _newPermitList[0]));
                                                          // controller.incidentReportApproveButton(incidentId: record[0]);
                                                          controller
                                                              .viewIncidentReport(
                                                                  id: incidentReportListModel
                                                                      ?.id);
                                                        },
                                                      )
                                                    : Dimens.box0,
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
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
