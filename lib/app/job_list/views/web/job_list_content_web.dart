import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/job_model.dart';
import '../../../navigators/app_pages.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/body_custom_app_bar.dart';
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
        Column(children: [
      CustomAppBar(
        title: 'Job List',
        action: Row(children: [
          ActionButton(
            icon: Icons.download,
            label: 'BM Report',
            onPressed: () {
              controller.exportToExcel();
            },
            color: ColorValues.appYellowColor,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.upload,
            label: 'Pending Jobs',
            onPressed: () {},
            color: ColorValues.appDarkBlueColor.withOpacity(0.3),
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.add,
            label: 'Created By Me'.tr,
            onPressed: () {},
            color: ColorValues.appLightBlueColor,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.close,
            label: 'Assigned To Me'.tr,
            onPressed: () async {},
            color: ColorValues.appGreenColor,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.upload,
            label: 'Add New Job',
            onPressed: () {
              controller.addJob();
            },
            color: ColorValues.appDarkBlueColor,
          ),
          Dimens.boxWidth10,
        ]),
      ),
      Expanded(
        child: Obx(() {
          final dataSource = JobDataSource(controller);

          return (controller.jobList.isEmpty == true)
              ? Center(child: Text('No data'))
              : Expanded(
                  child: PaginatedDataTable2(
                    dataRowHeight: Get.height * 0.1,

                    source: dataSource, // Custom DataSource class
                    headingRowHeight: Get.height * 0.12,
                    minWidth: Get.width * 2,
                    showCheckboxColumn: false,
                    rowsPerPage: 10, // Number of rows per page
                    availableRowsPerPage: [10, 20, 30, 50],
                    columns: [
                      buildDataColumn(
                        'id',
                        'ID',
                        ColumnSize.S,
                        controller.idFilterText,
                      ),
                      buildDataColumn(
                        'facilityName',
                        'Facility',
                        ColumnSize.L,
                        controller.facilityNameFilterText,
                      ),
                      buildDataColumn(
                        'jobDate',
                        'Job Date',
                        ColumnSize.L,
                        controller.jobDateFilterText,
                      ),
                      buildDataColumn(
                        'equipmentCat',
                        'Equipment Category',
                        ColumnSize.L,
                        controller.equipmentCategoryFilterText,
                      ),
                      buildDataColumn(
                        'workingArea',
                        'Work Area /\n Equipment',
                        ColumnSize.L,
                        controller.workAreaFilterText,
                      ),
                      buildDataColumn(
                        'description',
                        'Description',
                        ColumnSize.L,
                        controller.descriptionFilterText,
                      ),
                      buildDataColumn(
                        'jobDetails',
                        'Job Details',
                        ColumnSize.L,
                        controller.jobDetailsFilterText,
                      ),
                      buildDataColumn(
                        'workType',
                        'Work Type',
                        ColumnSize.L,
                        controller.workTypeFilterText,
                      ),
                      buildDataColumn(
                        'raisedByName',
                        'Raised By',
                        ColumnSize.M,
                        controller.raisedByNameFilterText,
                      ),
                      buildDataColumn(
                        'breakdownTime',
                        'Breakdown \n Time',
                        ColumnSize.M,
                        controller.breakdownTimeFilterText,
                      ),
                      buildDataColumn(
                        'breakdownType',
                        'Breakdown Type',
                        ColumnSize.L,
                        controller.breakdownTypeFilterText,
                      ),
                      buildDataColumn(
                        'permitId',
                        'Permit ID',
                        ColumnSize.S,
                        controller.permitIdFilterText,
                      ),
                      buildDataColumn(
                        'assignedToName',
                        'Assigned To',
                        ColumnSize.L,
                        controller.assignedToNameFilterText,
                      ),
                      buildDataColumn(
                        'action'.tr,
                        'Actions',
                        ColumnSize.L,
                        controller.jobDateFilterText,
                      ),
                    ],
                  ),
                );
        }),
      ),
    ]);
  }

  DataColumn2 buildDataColumn(
    String columnName,
    String header,
    ColumnSize columnSize,
    RxString? filterText,
  ) {
    return //
        DataColumn2(
      size: columnSize,
      label: //
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: Get.height * 0.05,
          child: TextField(
            onChanged: (value) {
              filterText?.value = value;
            },
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.0), // Adjust the height by modifying this value
            decoration: InputDecoration(
              hintText: 'Filter',
              contentPadding:
                  EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        Text(
          header,
          style: Styles.black15W600,
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
      return (job?.id ?? '').toString().toLowerCase().contains(controller.idFilterText.value.toLowerCase()) &&
          (job?.facilityName ?? '').toLowerCase().contains(
              controller.facilityNameFilterText.value.toLowerCase()) &&
          (job?.jobDate ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.jobDateFilterText.value.toLowerCase()) &&
          (job?.equipmentCat ?? '').toLowerCase().contains(
              controller.equipmentCategoryFilterText.value.toLowerCase()) &&
          (job?.workingArea ?? '')
              .toLowerCase()
              .contains(controller.workAreaFilterText.value.toLowerCase()) &&
          (job?.description ?? '')
              .toLowerCase()
              .contains(controller.descriptionFilterText.value.toLowerCase()) &&
          (job?.jobDetails ?? '')
              .toLowerCase()
              .contains(controller.jobDetailsFilterText.value.toLowerCase()) &&
          (job?.workType ?? '').contains(controller.workTypeFilterText.value) &&
          (job?.raisedByName ?? '').toLowerCase().contains(
              controller.raisedByNameFilterText.value.toLowerCase()) &&
          controller.formatDate(job?.breakdownTime.toString() ?? '').toLowerCase().contains(
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
    var _statusString =
        '${JobStatusData.statusValues.entries.firstWhere((x) => x.value == jobDetails?.status, orElse: () => MapEntry("CREATED", JobStatus.JOB_CREATED)).key}';

    ///
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${jobDetails?.id ?? ''}'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: JobStatusData.getStatusColor(_statusString),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  _statusString,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        ...[
          // '${jobDetails?.id ?? ''}',
          '${jobDetails?.facilityName ?? ''}',
          '${controller.formatDate(jobDetails?.jobDate?.toString() ?? '')}',
          '${jobDetails?.equipmentCat ?? ''}',
          '${jobDetails?.workingArea ?? ''}',
          '${jobDetails?.description ?? ''}',
          '${jobDetails?.jobDetails ?? ''}',
          '${jobDetails?.workType ?? ''}',
          '${jobDetails?.raisedByName ?? ''}',
          '${controller.formatDate(jobDetails?.breakdownTime.toString() ?? '')}',
          '${jobDetails?.breakdownType ?? ''}',
          '${jobDetails?.permitId ?? ''}',
          '${jobDetails?.assignedToName ?? ''}',
          // '${statusValues.reverse[jobDetails?.status] ?? ''}',
          'Actions',
        ].map((value) {
          return DataCell(
            Padding(
              padding: EdgeInsets.zero,
              child: (value == 'Actions')
                  ? Wrap(//
                      children: [
                      Row(children: [
                        TableActionButton(
                          color: ColorValues.appGreenColor,
                          icon: Icons.visibility,
                          label: 'View',
                          onPress: () {
                            controller
                                .goToJobDetailsScreen(controller.jobId.value);
                          },
                        ),
                        TableActionButton(
                          color: ColorValues.appPurpleColor,
                          icon: Icons.add,
                          label: 'Job Card',
                          onPress: () {
                            controller.goToJobCardScreen(
                              int.tryParse('${jobDetails?.id}'),
                            );
                          },
                        ),
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center, //
                          children: [
                            Expanded(
                              child: TableActionButton(
                                color: ColorValues.appGreenColor,
                                icon: Icons.link,
                                label: 'Link to Permit',
                                onPress: () {
                                  controller.goToJobDetailsScreen(
                                      controller.jobId.value);
                                },
                              ),
                            ),
                            if (jobDetails?.assignedToName == null ||
                                jobDetails?.assignedToName == '')
                              Expanded(
                                child: TableActionButton(
                                  color: ColorValues.appYellowColor,
                                  icon: Icons.add,
                                  label: 'Assign',
                                  onPress: () {
                                    Get.offAndToNamed(Routes.editJob,
                                        arguments: {"jobId": jobDetails?.id});
                                  },
                                ),
                              ),
                          ]),
                    ])
                  : Text(value.toString()),
            ),
          );
        }).toList(),
      ],
      onSelectChanged: (_) {
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
