import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cmms/app/grievance_summary/grievance_summary_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class GrievanceSummaryWeb extends StatefulWidget {
  GrievanceSummaryWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<GrievanceSummaryWeb> createState() => _NewGrievanceSummaryWebState();
}

class _NewGrievanceSummaryWebState extends State<GrievanceSummaryWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GrievanceSummaryController>(
        id: 'grievance_summary_list',
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
                              " / Grievance Summary".toUpperCase(),
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
                                            "Grievance Summary",
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
                                                    'grievance_summary_list'
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
                                    controller.grievanceSummaryList.isEmpty ==
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
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            "No. of \nWork force \nGrievances",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 210,
                                                          label: Text(
                                                            "No. of \nLocal Communities \nGrievances",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            "Workforce \ncases \nResolved",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            'Workforce \ncases \nPending',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          fixedWidth: 150,
                                                          label: Text(
                                                            'Workforce \nInspection \nOngoing',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Local cases \nResolved',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Local cases \nPending',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Local cases \nInspection \nOngoing',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Total No. of \nGrievances \nRaised',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Total No. of \nGrievances \nResolved',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Total No. of \nGrievances \nPending ',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Resolved at L1',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Resolved at L2',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      DataColumn2(
                                                          label: Text(
                                                        'Resolved at L3',
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
                                                          .grievanceSummaryList
                                                          .length,
                                                      (index) => DataRow(
                                                        cells: [
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.monthName
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.numberOfWorkForceGrievances
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.numberOfLocalCommunityGrievances
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.workforceCaseResolved
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.workforceCasePending
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.workforceInspectionOngoing
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.localCasesResolved
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.localCasesPending
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.localCasesInspectionOngoing
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.totalNumberOfGrievancesRaised
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.totalNumberOfGrievancesResolved
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.totalNumberOfGrievancesPending
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.resolvedAtL1
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.resolvedAtL2
                                                                  .toString() ??
                                                              '')),
                                                          DataCell(Text(controller
                                                                  .grievanceSummaryList[
                                                                      index]
                                                                  ?.resolvedAtL3
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
                ],
              ),
            );
          });
        });
  }
}
