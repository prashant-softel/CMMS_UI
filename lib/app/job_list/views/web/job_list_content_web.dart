import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../widgets/table_action_button.dart';
import '../../job_list_controller.dart';

class JobListContentWeb extends StatelessWidget {
  ///
  var controller = Get.find<JobListController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Expanded(
      child: //
          Obx(
        () => (controller.jobList?.isEmpty == true ||
                controller.jobList == null)
            ? Center(child: Text('No data'))
            : Column(
                children: [
                  CustomAppBar(
                    title: 'Job List',
                    action: Row(children: [
                      ActionButton(
                        icon: Icons.download,
                        label: 'BM Report',
                        onPressed: () {},
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
                    child: PaginatedDataTable2(
                      dataRowHeight: Get.height * 0.1,
                      headingRowColor: MaterialStateProperty.all<Color>(
                          ColorValues.appLightBlueColor),
                      source:
                          _JobDataSource(controller), // Custom DataSource class
                      // horizontalMargin: 20,
                      minWidth: Get.width * 2,
                      // header: //

                      rowsPerPage: 10, // Number of rows per page
                      availableRowsPerPage: [10, 20, 30, 50],
                      columns: [
                        buildDataColumn('id', 'Id', ColumnSize.S),
                        buildDataColumn(
                            'facilityName', 'Facility', ColumnSize.L),
                        buildDataColumn('jobDate', 'Job Date', ColumnSize.L),
                        buildDataColumn(
                            'equipmentCat', 'Equipment Category', ColumnSize.L),
                        buildDataColumn('workingArea', 'Work Area / Equipment',
                            ColumnSize.L),
                        buildDataColumn(
                            'description', 'Description', ColumnSize.L),
                        buildDataColumn(
                            'jobDetails', 'Job Details', ColumnSize.L),
                        buildDataColumn('workType', 'Work Type', ColumnSize.L),
                        buildDataColumn(
                            'raisedByName', 'Raised By', ColumnSize.M),
                        buildDataColumn(
                            'breakdownTime', 'Breakdown Time', ColumnSize.M),
                        buildDataColumn(
                            'breakdownType', 'Breakdown Type', ColumnSize.L),
                        buildDataColumn('permitId', 'Permit ID', ColumnSize.L),
                        buildDataColumn(
                            'assignedToName', 'Assigned To', ColumnSize.L),
                        buildDataColumn('status', 'Status', ColumnSize.L),
                        buildDataColumn('action'.tr, 'Actions', ColumnSize.L),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  DataColumn2 buildDataColumn(
      String columnName, String header, ColumnSize columnSize) {
    print(columnName);
    return DataColumn2(
      size: columnSize,
      label: Text(header),
    );
  }
}

class _JobDataSource extends DataTableSource {
  final controller; // Pass your controller instance here

  _JobDataSource(this.controller);

  @override
  DataRow? getRow(int index) {
    final jobDetails = controller.jobList?[index];
    controller.jobId.value = jobDetails?.id ?? 0;

    return DataRow.byIndex(
      index: index,
      cells: [
        ...[
          '${jobDetails?.id ?? ''}',
          '${jobDetails?.facilityName ?? ''}',
          '${controller.formatDate(jobDetails?.jobDate?.toString() ?? '')}',
          '${jobDetails?.equipmentCat ?? ''}',
          '${jobDetails?.workingArea ?? ''}',
          '${jobDetails?.description ?? ''}',
          '${jobDetails?.jobDetails ?? ''}',
          '${jobDetails?.workType ?? ''}',
          '${jobDetails?.raisedByName ?? ''}',
          '${controller.formatDate(jobDetails?.breakdownTime ?? '')}',
          '${jobDetails?.breakdownType ?? ''}',
          '${jobDetails?.permitId ?? ''}',
          '${jobDetails?.assignedToName ?? ''}',
          '${jobDetails?.status ?? ''}',
          'Actions',
        ].map((value) {
          return DataCell(
            (value == 'Actions')
                ? Wrap(
                    children: [
                      TableActionButton(
                        color: ColorValues.appGreenColor,
                        icon: Icons.visibility,
                        label: 'View',
                        onPress: () {
                          controller.showJobDetails(controller.jobId.value);
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
                    ],
                  )
                : Text(value.toString()),
          );
        }).toList(),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.jobList?.length ?? 0;

  @override
  int get selectedRowCount => 0;
        Expanded(
      child: //
          Obx(
        () => (controller.jobList?.isEmpty == true ||
                controller.jobList == null)
            ? Center(child: Text('No data'))
            : Expanded(
                child: PaginatedDataTable2(
                  dataRowHeight: Get.height * 0.1,
                  headingRowColor: MaterialStateProperty.all<Color>(
                      ColorValues.appLightBlueColor),
                  source: _JobDataSource(controller), // Custom DataSource class
                  horizontalMargin: 20,
                  minWidth: Get.width * 2,
                  header: Text('Your Header Text'),
                  rowsPerPage: 10, // Number of rows per page
                  availableRowsPerPage: [10, 20, 30, 50],
                  columns: [
                    buildDataColumn('id', 'Id', ColumnSize.S),
                    buildDataColumn('facilityName', 'Facility', ColumnSize.L),
                    buildDataColumn('jobDate', 'Job Date', ColumnSize.L),
                    buildDataColumn(
                        'equipmentCat', 'Equipment Category', ColumnSize.L),
                    buildDataColumn(
                        'workingArea', 'Work Area / Equipment', ColumnSize.L),
                    buildDataColumn('description', 'Description', ColumnSize.L),
                    buildDataColumn('jobDetails', 'Job Details', ColumnSize.L),
                    buildDataColumn('workType', 'Work Type', ColumnSize.L),
                    buildDataColumn('raisedByName', 'Raised By', ColumnSize.M),
                    buildDataColumn(
                        'breakdownTime', 'Breakdown Time', ColumnSize.M),
                    buildDataColumn(
                        'breakdownType', 'Breakdown Type', ColumnSize.L),
                    buildDataColumn('permitId', 'Permit ID', ColumnSize.L),
                    buildDataColumn(
                        'assignedToName', 'Assigned To', ColumnSize.L),
                    buildDataColumn('status', 'Status', ColumnSize.L),
                    buildDataColumn('action'.tr, 'Actions', ColumnSize.L),
                  ],
                ),
              ),
      ),
    );
  }

  DataColumn2 buildDataColumn(
      String columnName, String header, ColumnSize columnSize) {
    print(columnName);
    return DataColumn2(
      size: columnSize,
      label: Text(header),
    );
  }
}

class _JobDataSource extends DataTableSource {
  final controller; // Pass your controller instance here

  _JobDataSource(this.controller);

  @override
  DataRow? getRow(int index) {
    final jobDetails = controller.jobList?[index];
    controller.jobId.value = jobDetails?.id ?? 0;

    return DataRow.byIndex(
      index: index,
      cells: [
        ...[
          '${jobDetails?.id ?? ''}',
          '${jobDetails?.facilityName ?? ''}',
          '${controller.formatDate(jobDetails?.jobDate?.toString() ?? '')}',
          '${jobDetails?.equipmentCat ?? ''}',
          '${jobDetails?.workingArea ?? ''}',
          '${jobDetails?.description ?? ''}',
          '${jobDetails?.jobDetails ?? ''}',
          '${jobDetails?.workType ?? ''}',
          '${jobDetails?.raisedByName ?? ''}',
          '${controller.formatDate(jobDetails?.breakdownTime ?? '')}',
          '${jobDetails?.breakdownType ?? ''}',
          '${jobDetails?.permitId ?? ''}',
          '${jobDetails?.assignedToName ?? ''}',
          '${jobDetails?.status ?? ''}',
          'Actions',
        ].map((value) {
          return DataCell(
            (value == 'Actions')
                ? Wrap(
                    children: [
                      TableActionButton(
                        color: ColorValues.appGreenColor,
                        icon: Icons.visibility,
                        label: 'View',
                        onPress: () {
                          controller.showJobDetails(controller.jobId.value);
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
                    ],
                  )
                : Text(value.toString()),
          );
        }).toList(),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.jobList?.length ?? 0;

  @override
  int get selectedRowCount => 0;
        Expanded(
      child: //
          Obx(
        () => (controller.jobList?.isEmpty == true ||
                controller.jobList == null)
            ? Center(child: Text('No data'))
            : Expanded(
                child: PaginatedDataTable2(
                  dataRowHeight: Get.height * 0.1,
                  headingRowColor: MaterialStateProperty.all<Color>(
                      ColorValues.appLightBlueColor),
                  source: _JobDataSource(controller), // Custom DataSource class
                  horizontalMargin: 20,
                  minWidth: Get.width * 2,
                  header: Text('Your Header Text'),
                  rowsPerPage: 10, // Number of rows per page
                  availableRowsPerPage: [10, 20, 30, 50],
                  columns: [
                    buildDataColumn('id', 'Id', ColumnSize.M),
                    buildDataColumn('facilityName', 'Facility', ColumnSize.L),
                    buildDataColumn('jobDate', 'Job Date', ColumnSize.L),
                    buildDataColumn(
                        'equipmentCat', 'Equipment Category', ColumnSize.L),
                    buildDataColumn(
                        'workingArea', 'Work Area / Equipment', ColumnSize.L),
                    buildDataColumn('description', 'Description', ColumnSize.L),
                    buildDataColumn('jobDetails', 'Job Details', ColumnSize.L),
                    buildDataColumn('workType', 'Work Type', ColumnSize.L),
                    buildDataColumn('raisedByName', 'Raised By', ColumnSize.L),
                    buildDataColumn(
                        'breakdownTime', 'Breakdown Time', ColumnSize.L),
                    buildDataColumn(
                        'breakdownType', 'Breakdown Type', ColumnSize.L),
                    buildDataColumn('permitId', 'Permit ID', ColumnSize.L),
                    buildDataColumn(
                        'assignedToName', 'Assigned To', ColumnSize.L),
                    buildDataColumn('status', 'Status', ColumnSize.L),
                    buildDataColumn('action'.tr, 'Actions', ColumnSize.L),
                  ],
                ),
              ),
      ),
    );
  }

  DataColumn2 buildDataColumn(
      String columnName, String header, ColumnSize columnSize) {
    print(columnName);
    return DataColumn2(
      size: columnSize,
      label: Text(header),
    );
  }
}

class _JobDataSource extends DataTableSource {
  final controller; // Pass your controller instance here

  _JobDataSource(this.controller);

  @override
  DataRow? getRow(int index) {
    final jobDetails = controller.jobList?[index];
    controller.jobId.value = jobDetails?.id ?? 0;

    return DataRow.byIndex(
      index: index,
      cells: [
        ...[
          '${jobDetails?.id ?? ''}',
          '${jobDetails?.facilityName ?? ''}',
          '${jobDetails?.jobDate ?? ''}',
          '${jobDetails?.equipmentCat ?? ''}',
          '${jobDetails?.workingArea ?? ''}',
          '${jobDetails?.description ?? ''}',
          '${jobDetails?.jobDetails ?? ''}',
          '${jobDetails?.workType ?? ''}',
          '${jobDetails?.raisedByName ?? ''}',
          '${jobDetails?.breakdownTime ?? ''}',
          '${jobDetails?.breakdownType ?? ''}',
          '${jobDetails?.permitId ?? ''}',
          '${jobDetails?.assignedToName ?? ''}',
          '${jobDetails?.status ?? ''}',
          'Actions',
        ].map((value) {
          return DataCell(
            (value == 'Actions')
                ? Wrap(
                    children: [
                      TableActionButton(
                        color: ColorValues.appGreenColor,
                        icon: Icons.visibility,
                        label: 'View',
                        onPress: () {
                          controller.showJobDetails(controller.jobId.value);
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
                    ],
                  )
                : Text(value.toString()),
          );
        }).toList(),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.jobList?.length ?? 0;

  @override
  int get selectedRowCount => 0;
}
