import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/observation_summary/observation_summary_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/observation_summary_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class ObservationSummaryWeb extends StatefulWidget {
  ObservationSummaryWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ObservationSummaryWeb> createState() =>
      _NewObservationSummaryWebState();
}

class _NewObservationSummaryWebState extends State<ObservationSummaryWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ObservationSummaryController>(
        id: 'observation_summary_list',
        builder: (controller) {
          return Obx(() {
            return SelectionArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      HeaderWidget(),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 227, 224, 224),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 236, 234, 234)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: ColorValues.greyLightColor,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offNamed(Routes.home);
                              },
                              child: Text(
                                "DASHBOARD",
                                style: Styles.greyLight14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Get.back();
                                Get.offAllNamed(Routes.misDashboard);
                              },
                              child: Text(" / MIS ", style: Styles.greyLight14),
                            ),
                            Text(
                              " / Observation Summary".toUpperCase(),
                              style: Styles.greyLight14,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width * 7,
                              margin:
                                  EdgeInsets.only(right: 10, left: 10, top: 20),
                              height: Get.height,
                              child: Card(
                                color: Color.fromARGB(255, 251, 252, 253),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Observation Summary",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Date Range'),
                                              Dimens.boxWidth10,
                                              CustomTextFieldForStock(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                numberTextField: true,
                                                onTap: () {
                                                  controller
                                                          .openFromDateToStartDatePicker =
                                                      !controller
                                                          .openFromDateToStartDatePicker;
                                                  controller.update([
                                                    'observation_summary_list'
                                                  ]);
                                                },
                                                hintText:
                                                    '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    controller.observationSummaryList.isEmpty ==
                                                true &&
                                            controller.isLoading == false
                                        ? Center(child: Text("No Data"))
                                        : controller.isLoading.value == true
                                            ? Center(
                                                child:
                                                    Text("Data Loading......"))
                                            : Expanded(
                                                child: Obx(
                                                  () => DataTable2(
                                                    key: UniqueKey(),
                                                    headingRowHeight: 70,
                                                    minWidth: 2500,
                                                    dataRowHeight: 40,
                                                    border: TableBorder.all(
                                                        color: Color.fromARGB(
                                                            255,
                                                            206,
                                                            229,
                                                            234)),
                                                    columns: [
                                                      DataColumn2(
                                                          fixedWidth: 100,
                                                          label: Text(
                                                            "Month",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 130,
                                                          label: Text(
                                                            "Raised",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 130,
                                                          label: Text(
                                                            "Open",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 100,
                                                          label: Text(
                                                            'Closed',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            '     Major \nRisk Open',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            '   Critical \nRisk Open',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          label: Text(
                                                        '     Critical \nRisk Closed',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Significant \nRisk Raised',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Significant \nRisk Open',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Significant \nRisk Closed',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Moderate \nRisk Raised',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Moderate \nRisk Open',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Moderate \nRisk Closed',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Out of \nTarget',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'No of Unsafe \nCondition',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'No of Unsafe \nActs',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Statuory Non \nComplicance',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                    ],
                                                    rows:
                                                        List<DataRow>.generate(
                                                      controller
                                                          .observationSummaryList
                                                          .length,
                                                      (index) => DataRow(
                                                        cells: [
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.month_name
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.created
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.open
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.closed
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.createdCountCritical
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.openCountCritical
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.closeCountCritical
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.createdCountSignificant
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.openCountSignificant
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.closeCountSignificant
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.createdCountModerate
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.openCountModerate
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.closeCountModerate
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.target_count
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.unsafecondition
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.unsafeact
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .observationSummaryList[
                                                                      index]
                                                                  ?.statutorynoncompliance
                                                                  .toString() ??
                                                              '')),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      right: 230,
                      top: 90,
                      child: DatePickerWidget(
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

                          controller.getObservationSummaryByDate();
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['observation_summary_list']);

                          // Get.toNamed(
                          //   Routes.stockManagementGoodsOrdersScreen,
                          // );
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['observation_summary_list']);
                        },
                      ),
                    ),
                ],
              ),
            );
          });
        });
  }
}
