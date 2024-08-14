import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/training_report/training_summary_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class TrainingSummaryWeb extends StatefulWidget {
  TrainingSummaryWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<TrainingSummaryWeb> createState() => _NewTrainingSummaryWebState();
}

class _NewTrainingSummaryWebState extends State<TrainingSummaryWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingSummaryController>(
        id: 'training_summary_list',
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
                              " / Training Summary".toUpperCase(),
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
                                            "Training Summary Report",
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
                                                    'training_summary_list'
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
                                    controller.trainingSummaryList.isEmpty ==
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
                                                            "Man Hours",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 130,
                                                          label: Text(
                                                            "Special Mock Drill",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 100,
                                                          label: Text(
                                                            'HFE Mock Drill',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            '     Induction',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            '   HFE Training',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          label: Text(
                                                        '     Special Training',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Number of People Inducted',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Total man hours \nexcluding mock \nand induction',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Total training hours \nexcluding mock \nand induction',
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
                                                          .trainingSummaryList
                                                          .length,
                                                      (index) => DataRow(
                                                        cells: [
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.month_name
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.manHours
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.special_mockDrill
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.hfe_mockDrill
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.induction
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.hfe_training
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.special_training
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.number_of_people_inducted
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.total_man_hours_excluding_mock_and_induction
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .trainingSummaryList[
                                                                      index]
                                                                  ?.total_training_hours_excluding_mock_and_induction
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

                          controller.getTrainingSummaryByDate();
                          controller.openFromDateToStartDatePicker = false;

                          controller.update(['training_summary_list']);

                          // Get.toNamed(
                          //   Routes.stockManagementGoodsOrdersScreen,
                          // );
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['training_summary_list']);
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
