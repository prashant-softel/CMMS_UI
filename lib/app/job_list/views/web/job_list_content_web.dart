import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../domain/models/job_model.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/table_action_button.dart';
import '../../job_list_controller.dart';

class JobListContentWeb extends StatelessWidget {
  JobListContentWeb({Key? key});

  ///
  @override
  Widget build(BuildContext context) {
    ///
    final controller = Get.find<JobListController>();
    return //
        Obx(() {
      final dataSource = JobDataSource(controller);

      return SelectionArea(
        child: Column(children: [
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
                  color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                    Get.offAllNamed(Routes.breakdown);
                  },
                  child: Text(" / BREAKDOWN MAINTANACE",
                      style: Styles.greyLight14),
                ),
                Text(" / JOB LIST", style: Styles.greyLight14),
              ],
            ),
          ),

          // CustomAppBar(
          //   title: 'Job List',
          //   action: Row(children: [
          //     // ActionButton(
          //     //   icon: Icons.download,
          //     //   label: 'BM Report',
          //     //   onPressed: () {
          //     //     if (kIsWeb) {
          //     //       controller.exportToExcelWeb();
          //     //     }
          //     //   },
          //     //   color: ColorValues.appYellowColor,
          //     // ),
          //     // Dimens.boxWidth10,
          //     // ActionButton(
          //     //   icon: Icons.upload,
          //     //   label: 'Pending Jobs',
          //     //   onPressed: () {},
          //     //   color: ColorValues.appDarkBlueColor.withOpacity(0.3),
          //     // ),
          //     // Dimens.boxWidth10,
          //     // ActionButton(
          //     //   icon: Icons.add,
          //     //   label: 'Created By Me'.tr,
          //     //   onPressed: () {},
          //     //   color: ColorValues.appLightBlueColor,
          //     // ),
          //     // Dimens.boxWidth10,
          //     // ActionButton(
          //     //   icon: Icons.close,
          //     //   label: 'Assigned To Me'.tr,
          //     //   onPressed: () async {},
          //     //   color: ColorValues.appGreenColor,
          //     // ),
          //     Dimens.boxWidth10,
          //     varUserAccessModel.value.access_list!
          //                 .where((e) => e.feature_id == 2 && e.add == 1)
          //                 .length >
          //             0
          //         ? ActionButton(
          //             icon: Icons.upload,
          //             label: 'Add New Job',
          //             onPressed: () {
          //               controller.goToAddJobScreen();
          //             },
          //             color: ColorValues.appDarkBlueColor,
          //           )
          //         : Container(),
          //     Dimens.boxWidth10,
          //   ]),
          // ),

          //  Obx(() {
          Expanded(
            child: Container(
              // width: Get.width * 7,
              margin: EdgeInsets.all(10),
              height: Get.height,
              child: Card(
                  color: Color.fromARGB(255, 245, 248, 250),
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
                                "Job List ",
                                style: Styles.blackBold16,
                              ),
                              Spacer(),
                              varUserAccessModel.value.access_list!
                                          .where((e) =>
                                              e.feature_id ==
                                                  UserAccessConstants
                                                      .kJobFeatureId &&
                                              e.add ==
                                                  UserAccessConstants
                                                      .kHaveAddAccess)
                                          .length >
                                      0
                                  ? ActionButton(
                                      icon: Icons.add,
                                      label: "Add New",
                                      onPressed: () {
                                        controller.clearStoreData();

                                        controller.goToAddJobScreen();
                                      },
                                      color: ColorValues.addNewColor,
                                    )
                                  : Dimens.box0
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'columnVisibility'.tr,
                              ),
                            ),
                            // Container(
                            //   height: 35,
                            //   margin: EdgeInsets.only(left: 10),
                            //   child: CustomElevatedButton(
                            //       backgroundColor: ColorValues.appLightBlueColor,
                            //       onPressed: () {},
                            //       text: 'Copy'),
                            // ),
                            // Container(
                            //   height: 35,
                            //   margin: EdgeInsets.only(left: 10),
                            //   child: CustomElevatedButton(
                            //       backgroundColor: ColorValues.appLightBlueColor,
                            //       onPressed: () {},
                            //       text: 'Excel'),
                            // ),
                            // Container(
                            //   height: 35,
                            //   margin: EdgeInsets.only(left: 10),
                            //   child: CustomElevatedButton(
                            //       backgroundColor: ColorValues.appLightBlueColor,
                            //       onPressed: () {},
                            //       text: 'PDF'),
                            // ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(left: 10),
                              child: CustomElevatedButton(
                                  backgroundColor:
                                      ColorValues.appLightBlueColor,
                                  onPressed: () {
                                    controller.export();
                                  },
                                  text: 'Excel'),
                            ),

                            Spacer(),
                            Container(
                              width: 300,
                              height: 40,
                              margin: EdgeInsets.only(right: 7.w),
                              child: TextField(
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 16.0,
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (value) => controller.search(value),
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 0.0,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 0.0,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 3),
                                  hintText: 'search'.tr,
                                  hintStyle: Styles.grey16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        controller.jobList.isEmpty == true
                            ? Center(child: Text('No data'))
                            : Expanded(
                                child: PaginatedDataTable2(
                                  //fixedLeftColumns: 1,
                                  dataRowHeight: 105, // Get.height * 0.12,
                                  columnSpacing: 10,
                                  source: dataSource, // Custom DataSource class
                                  // headingRowHeight: Get.height * 0.12,
                                  minWidth: 20000, //Get.width * 1.2,
                                  showCheckboxColumn: false,
                                  //  rowsPerPage: 10, // Number of rows per page
                                  //    availableRowsPerPage: [10, 20, 30, 50],
                                  columns: [
                                    buildDataColumn(
                                      'id',
                                      'ID',
                                      //  ColumnSize.S,
                                      controller.idFilterText,
                                      100,
                                    ),
                                    buildDataColumn(
                                        'jobDetails',
                                        'Job Title',
                                        // ColumnSize.M,
                                        controller.jobDetailsFilterText,
                                        250),
                                    buildDataColumn(
                                        'breakdownTime',
                                        'BreakdownTime',
                                        // ColumnSize.L,
                                        controller.breakdownTimeFilterText,
                                        150),
                                    buildDataColumn(
                                        'equipmentCat',
                                        'Equipment Category',
                                        // ColumnSize.L,
                                        controller.equipmentCategoryFilterText,
                                        200),
                                    buildDataColumn(
                                        'workingArea',
                                        'Equipment',
                                        // ColumnSize.L,
                                        controller.workAreaFilterText,
                                        170),
                                    buildDataColumn(
                                        'workType',
                                        'Fault',
                                        // ColumnSize.L,
                                        controller.workTypeFilterText,
                                        150),
                                    buildDataColumn(
                                        'raisedByName',
                                        'Raised By',
                                        // ColumnSize.S,
                                        controller.raisedByNameFilterText,
                                        100),

                                    // buildDataColumn(
                                    //   'breakdownType',
                                    //   'Breakdown Type',
                                    //   ColumnSize.L,
                                    //   controller.breakdownTypeFilterText,
                                    // ),
                                    buildDataColumn(
                                        'permitId',
                                        'Permit ID',
                                        // ColumnSize.S,
                                        controller.permitIdFilterText,
                                        100),
                                    buildDataColumn(
                                        'assignedToName',
                                        'Assigned To',
                                        // ColumnSize.S,
                                        controller.assignedToNameFilterText,
                                        150),
                                    buildDataColumn(
                                        'action'.tr,
                                        'Actions',
                                        // ColumnSize.L,
                                        controller.jobDateFilterText,
                                        150),
                                  ],
                                ),
                              )
                        //}),
                      ])),
            ),
          ),
        ]),
      );
    });
  }

  DataColumn2 buildDataColumn(
    String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            // SizedBox(
            //   height: Get.height * 0.05,
            //   child: TextField(
            //     style: GoogleFonts.lato(
            //       textStyle: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.black),
            //     ),
            //     onChanged: (value) {
            //       filterText.value = value;
            //     },
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //       hintText: 'Filter',
            //       contentPadding: EdgeInsets.fromLTRB(
            //           5, 0, 5, 0), // Reduced vertical padding
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: Styles.black15W400,
              ),
            ),
          ]),
      // ),
    );
  }
}

class JobDataSource extends DataTableSource {
  final JobListController controller;

  late List<JobModel?> filteredJobList;

  JobDataSource(this.controller) {
    filterJobs();
  }

  ///
  void filterJobs() {
    filteredJobList = <JobModel?>[];
    filteredJobList = controller.jobList.where((job) {
      return (job?.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (job?.name ?? '')
              .toLowerCase()
              .contains(controller.jobDetailsFilterText.value.toLowerCase()) &&
          (job?.jobDate ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.jobDateFilterText.value.toLowerCase()) &&
          (job?.equipmentCat ?? '').toLowerCase().contains(
              controller.equipmentCategoryFilterText.value.toLowerCase()) &&
          (job?.workingArea ?? '')
              .toLowerCase()
              .contains(controller.workAreaFilterText.value.toLowerCase()) &&
          (job?.workingArea ?? '')
              .toLowerCase()
              .contains(controller.workAreaFilterText.value.toLowerCase()) &&
          (job?.raisedByName ?? '').toLowerCase().contains(
              controller.raisedByNameFilterText.value.toLowerCase()) &&
          controller
              .formatDate(job?.breakdownTime.toString() ?? '')
              .toLowerCase()
              .contains(
                  controller.breakdownTimeFilterText.value.toLowerCase()) &&
          (job?.breakdownType ?? '').toLowerCase().contains(
              controller.breakdownTypeFilterText.value.toLowerCase()) &&
          (job?.permitId ?? '')
              .toLowerCase()
              .toString()
              .contains(controller.permitIdFilterText.value.toLowerCase()) &&
          (job?.assignedToName ?? '')
              .toLowerCase()
              .contains(controller.assignedToNameFilterText.value.toLowerCase()) &&
          (job?.status ?? '').toString().toLowerCase().contains(controller.statusFilterText.value.toLowerCase());
      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final jobDetails = filteredJobList[index];

    controller.jobId.value = jobDetails?.id ?? 0;
    // var _statusString =
    //     JobStatusData.getStatusStringFromStatusEnumValue(jobDetails?.status);

    ///
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(
            'JOB${jobDetails?.id ?? ''}',
          ),
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${jobDetails?.name ?? ''}',
                  overflow: TextOverflow.ellipsis),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: jobDetails?.status == 101
                      ? ColorValues.createdColor
                      : jobDetails?.status == 102
                          ? ColorValues.assignStatusColor
                          : jobDetails?.latestJCStatus == 151
                              ? ColorValues.createsColor
                              : jobDetails?.latestJCStatus == 152
                                  ? ColorValues.startColor
                                  : jobDetails?.latestJCStatus == 153
                                      ? Color.fromARGB(255, 181, 129, 179)
                                      : jobDetails?.latestJCStatus == 155
                                          ? ColorValues
                                              .waitingForApproveStatusColor
                                          : ColorValues.lightBlueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: jobDetails?.status == 101
                    ? Text(" Job Created")
                    : jobDetails?.status == 102
                        ? Text("Job Assigned")
                        :
                        //         : jobDetails?.status == 103
                        //             ? Text('${jobDetails?.latestJCStatusShort ?? ''}')
                        //    :
                        Text(
                            //'${jobDetails?.status ?? ''}
                            ' ${jobDetails?.latestJCStatusShort ?? ''}'),
              ),
              Text(
                '${controller.formatDate(jobDetails?.jobDate?.toString() ?? '')}',
              ),
            ],
          ),
        ),
        ...[
          '${controller.formatDate(jobDetails?.breakdownTime?.toString() ?? '')}',
          '${jobDetails?.equipmentCat ?? ''}',
          '${jobDetails?.workingArea ?? ''}',
          '${jobDetails?.workType ?? ''}',
          '${jobDetails?.raisedByName ?? ''}',
          '${jobDetails?.permitId ?? ''}',
          '${jobDetails?.assignedToName ?? ''}',
          'Actions',
        ].map((value) {
          return DataCell(
            Padding(
              padding: EdgeInsets.zero,
              child: (value == 'Actions')
                  ? Wrap(children: [
                      TableActionButton(
                        color: ColorValues.viewColor,
                        icon: Icons.visibility,
                        message: 'View',
                        onPress: () {
                          controller.clearStoreData();

                          controller.goToJobDetailsScreen(
                            int.tryParse('${jobDetails?.id}'),
                          );
                        },
                      ),
                      // jobDetails?.status == 101
                      //     ?
                      TableActionButton(
                        color: ColorValues.editColor,
                        icon: Icons.edit,
                        message: 'Edit Job',
                        onPress: () {
                          controller.clearStoreData();

                          controller.goToEditJobScreen(
                              int.tryParse('${jobDetails?.id}'));
                        },
                      )
                      // : Dimens.box0,
                      // if (jobDetails?.status == 102 &&
                      //     varUserAccessModel.value.access_list!
                      //             .where((e) =>
                      //                 e.feature_id ==
                      //                     UserAccessConstants.kJobFeatureId &&
                      //                 e.approve ==
                      //                     UserAccessConstants
                      //                         .kHaveApproveAccess)
                      //             .length >
                      //         0)
                      //   TableActionButton(
                      //     color: ColorValues.appYellowColor,
                      //     icon: Icons.assignment_ind,
                      //     message: 'Re-Assign',
                      //     onPress: () {
                      //       controller.clearStoreData();

                      //       controller.goToEditJobScreen(
                      //           int.tryParse('${jobDetails?.id}'));
                      //     },
                      //   ),
                      // if (jobDetails?.status == 101)
                      //   TableActionButton(
                      //     color: ColorValues.appYellowColor,
                      //     icon: Icons.assignment,
                      //     message: 'Assign',
                      //     onPress: () {
                      //       controller.goToEditJobScreen(
                      //           int.tryParse('${jobDetails?.id}'));
                      //     },
                      //   ),

                      /// if job is linked, only then show Job Card button
                      //   if (jobDetails?.status == JobStatus.JOB_LINKED)
                      // Flexible(
                      //   child: TableActionButton(
                      //     color: ColorValues.addNewColor,
                      //     icon: Icons.add,
                      //     message: 'Job Card',
                      //     onPress: () {
                      //       controller.goToJobCardScreen(
                      //         int.tryParse('${jobDetails?.id}'),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ])
                  : Text(value.toString()),
            ),
          );
        }).toList(),
      ],
      onSelectChanged: (_) {
        controller.clearStoreData();

        controller.goToJobDetailsScreen(int.tryParse('${jobDetails?.id}'));
      },
    );
  }

  @override
  int get rowCount => filteredJobList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
