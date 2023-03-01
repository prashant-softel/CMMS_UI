import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../theme/colors_value.dart';
import '../../../widgets/table_action_button.dart';
import '../../job_list_controller.dart';

class JobListScreenWeb extends GetView<JobListController> {
  const JobListScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    var jobId = 0;
    return //
        Obx(
      () => //
          Container(
        color: ColorsValue.lightBlueishColor,
        height: 600,
        child: ScrollableTableView(
          //paginationController: controller.paginationController,
          columns: [
            'facilityName'.tr,
            'jobDate'.tr,
            'equipmentCat'.tr,
            'workingArea'.tr,
            'description'.tr,
            'jobDetails',
            'workType',
            'raisedByName',
            'breakdownTime',
            'breakdownType',
            'permitId',
            'assignedToName',
            'status',
            'action'.tr,
          ].map((column) {
            return TableViewColumn(
              minWidth: 1100 / 6,
              label: column == "facilityName"
                  ? "Facility"
                  : column == "jobDate"
                      ? "Job Date"
                      : column == "equipmentCat"
                          ? "Equipment Category"
                          : column == "workingArea"
                              ? "Work Area / Equipment" //
                              : column == "description"
                                  ? "Description"
                                  : column == "jobDetails"
                                      ? "Job Details"
                                      : column == "workType"
                                          ? "Work Type"
                                          : column == "raisedByName"
                                              ? "Raised By"
                                              : column == "breakdownTime"
                                                  ? "Breakdown Time"
                                                  : column == "breakdownType"
                                                      ? "Breakdown Type"
                                                      : column == "permitId"
                                                          ? "Permit ID"
                                                          : column ==
                                                                  "assignedToName"
                                                              ? "Assigned To"
                                                              : column ==
                                                                      "status"
                                                                  ? "Status"
                                                                  : column ==
                                                                          "Actions"
                                                                      ? "Actions"
                                                                      : "",
            );
          }).toList(),
          rows: //
              [
            ...List.generate(
              controller.jobList?.length ?? 0,
              (index) {
                jobId = controller.jobList?[index]?.id ?? 0;
                return [
                  '${controller.jobList?[index]?.facilityName ?? ''}',
                  //index + 1,
                  '${controller.jobList?[index]?.jobDate}',
                  '${controller.jobList?[index]?.equipmentCat}',
                  '${controller.jobList?[index]?.workingArea}',
                  '${controller.jobList?[index]?.description}',
                  '${controller.jobList?[index]?.jobDetails}',
                  '${controller.jobList?[index]?.workType}',
                  '${controller.jobList?[index]?.raisedByName}',
                  '${controller.jobList?[index]?.breakdownTime}',
                  '${controller.jobList?[index]?.breakdownType}',
                  '${controller.jobList?[index]?.permitId}',
                  '${controller.jobList?[index]?.assignedToName}',
                  '${controller.jobList?[index]?.status}',
                  'Actions'
                ];
              },
            ),
          ].map((_jobList) {
            return TableViewRow(
                height: 60,
                cells: _jobList.map((value) {
                  return TableViewCell(
                    child: (value == 'Actions')
                        ? Wrap(
                            children: [
                              TableActionButton(
                                color: Colors.green,
                                icon: Icons.visibility,
                                label: 'View',
                                onPress: () =>
                                    {controller.showJobDetails(jobId)},
                              ),
                              // TableActionButton(
                              //   color: Colors.blue,
                              //   icon: Icons.edit,
                              //   label: 'Edit',
                              //   onPress: () {},
                              // ),
                              // TableActionButton(
                              //   color: Colors.red,
                              //   icon: Icons.delete,
                              //   label: 'Delete',
                              //   onPress: () {},
                              // ),
                              // TableActionButton(
                              //   color: Colors.green,
                              //   icon: Icons.visibility,
                              //   label: 'Approve Request',
                              //   onPress: () {},
                              // ),
                              // TableActionButton(
                              //   color: Colors.red,
                              //   icon: Icons.visibility,
                              //   label: 'Reject Request',
                              //   onPress: () {},
                              // ),
                            ],
                          )
                        : Text(value.toString()),
                  );
                }).toList());
          }).toList(),
        ),
      ),
    );
  }
}
