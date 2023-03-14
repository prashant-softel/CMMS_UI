import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../theme/colors_value.dart';
import '../../../theme/dimens.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/body_custom_app_bar.dart';
import '../../../widgets/table_action_button.dart';
import '../../job_list_controller.dart';

class JobListContentWeb extends GetView<JobListController> {
  JobListContentWeb({super.key});
  //var controller;

  @override
  Widget build(BuildContext context) {
    int? _jobId = 0;
    return //
        Obx(
      () => //
          Container(
        color: ColorsValue.lightBlueishColor,
        child: Column(
            //
            children: [
              ///
              CustomAppBar(
                title: 'Job List',
                action: Row(children: [
                  ActionButton(
                    icon: Icons.download,
                    lable: 'BM Report',
                    onPress: () {},
                    color: Color.fromARGB(255, 220, 176, 45),
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.upload,
                    lable: 'Pending Jobs',
                    onPress: () {},
                    color: Color.fromARGB(255, 130, 183, 146),
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.add,
                    lable: 'Created By Me'.tr,
                    onPress: () {},
                    color: Color.fromARGB(255, 73, 142, 143),
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.close,
                    lable: 'Assigned To Me'.tr,
                    onPress: () async {},
                    color: Colors.green,
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.upload,
                    lable: 'Add New Job',
                    onPress: () {
                      controller.addJob();
                    },
                    color: Colors.blue,
                  ),
                  Dimens.boxWidth10,
                ]),
              ),

              ///
              Expanded(
                child: Container(
                  height: Get.height,
                  child: Column(//
                      children: [
                    Expanded(
                      child: //
                          ScrollableTableView(
                        paginationController: controller.paginationController,
                        columns: [
                          'id',
                          'facilityName',
                          'jobDate',
                          'equipmentCat',
                          'workingArea',
                          'description',
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
                            minWidth: Get.width * 0.15,
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
                                                        : column ==
                                                                "raisedByName"
                                                            ? "Raised By"
                                                            : column ==
                                                                    "breakdownTime"
                                                                ? "Breakdown Time"
                                                                : column ==
                                                                        "breakdownType"
                                                                    ? "Breakdown Type"
                                                                    : column ==
                                                                            "permitId"
                                                                        ? "Permit ID"
                                                                        : column ==
                                                                                "assignedToName"
                                                                            ? "Assigned To"
                                                                            : column == "status"
                                                                                ? "Status"
                                                                                : column == "Actions"
                                                                                    ? "Actions"
                                                                                    : "",
                          );
                        }).toList(),
                        rows: //
                            [
                          ...List.generate(
                            controller.jobList?.length ?? 0,
                            (index) {
                              var jobDetails = controller.jobList?[index];
                              //_jobId = jobDetails?.id;
                              controller.jobId.value = jobDetails?.id ?? 0;
                              return [
                                '${jobDetails?.id}',
                                '${jobDetails?.facilityName ?? ''}',
                                '${jobDetails?.jobDate}',
                                '${jobDetails?.equipmentCat}',
                                '${jobDetails?.workingArea}',
                                '${jobDetails?.description}',
                                '${jobDetails?.jobDetails}',
                                '${jobDetails?.workType}',
                                '${jobDetails?.raisedByName}',
                                '${jobDetails?.breakdownTime ?? ''}',
                                '${jobDetails?.breakdownType}',
                                '${jobDetails?.permitId}',
                                '${jobDetails?.assignedToName}',
                                '${jobDetails?.status}',
                                'Actions'
                              ];
                            },
                          ),
                        ].map((_jobList) {
                          return TableViewRow(
                              onTap: () => {print('ZERO = ${_jobList[0]}')},
                              height: 60,
                              cells: _jobList.map((value) {
                                return TableViewCell(
                                  //key: ,
                                  child: (value == 'Actions')
                                      ? Wrap(
                                          children: [
                                            TableActionButton(
                                              color: Colors.green,
                                              icon: Icons.visibility,
                                              label: 'View',
                                              onPress: () {
                                                controller.showJobDetails(
                                                    controller.jobId.value);
                                              },
                                            ),
                                            TableActionButton(
                                              color: ColorsValue.purpleColor,
                                              icon: Icons.add,
                                              label: 'Job Card',
                                              onPress: () {
                                                controller.goToJobCardScreen(
                                                  int.tryParse(_jobList[0]),
                                                );
                                              },
                                            ),
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

                    /// PAGINATION
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ValueListenableBuilder(
                          valueListenable: controller.paginationController,
                          builder: (context, value, child) {
                            return Row(children: [
                              Text(
                                  "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                              Row(children: [
                                IconButton(
                                  onPressed: controller.paginationController
                                              .currentPage <=
                                          1
                                      ? null
                                      : () {
                                          controller.paginationController
                                              .previous();
                                        },
                                  iconSize: 20,
                                  splashRadius: 20,
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: controller.paginationController
                                                .currentPage <=
                                            1
                                        ? Colors.black26
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.paginationController
                                              .currentPage >=
                                          controller
                                              .paginationController.pageCount
                                      ? null
                                      : () {
                                          controller.paginationController
                                              .next();
                                        },
                                  iconSize: 20,
                                  splashRadius: 20,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: controller.paginationController
                                                .currentPage >=
                                            controller
                                                .paginationController.pageCount
                                        ? Colors.black26
                                        : Theme.of(context).primaryColor,
                                  ),
                                ),
                              ]),
                            ]);
                          }),
                    ),
                  ]),
                ),
                //),
              ),
            ]),
      ),
    );
  }
}
