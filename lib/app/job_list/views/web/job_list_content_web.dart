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
    //var jobId = 0;
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
                    onPress: () {
                      //Get.to(() => AddInventory());
                    },
                    color: Color.fromARGB(255, 73, 142, 143),
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.close,
                    lable: 'Assigned To Me'.tr,
                    onPress: () async {
                      // ByteData data = await rootBundle
                      //     .load("assets/files/Fixed Asset Imports.xlsx");
                      // var bytes = data.buffer
                      //     .asUint8List(data.offsetInBytes, data.lengthInBytes);
                      // var excel = Excel.decodeBytes(bytes);

                      // for (var table in excel.tables.keys) {
                      //   print(table); //sheet Name
                      //   print(excel.tables[table]?.maxCols);
                      //   print(excel.tables[table]?.maxRows);
                      //   for (var row in excel.tables[table]!.rows) {
                      //     print("QWERTY $row");
                      //   }
                      // }
                    },
                    color: Colors.green,
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.upload,
                    lable: 'Add New Job',
                    onPress: () {
                      // var file = "assets/files/Fixed Asset Imports.xlsx";
                      // var bytes = File(file).readAsBytesSync();
                      // var excel = Excel.decodeBytes(bytes);

                      // for (var table in excel.tables.keys) {
                      //   print(table); //sheet Name
                      //   print(excel.tables[table]?.maxCols);
                      //   print(excel.tables[table]?.maxRows);
                      //   for (var row in excel.tables[table]!.rows) {
                      //     print("QWERTY $row");
                      //   }
                      // }
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
                              controller.jobId.value =
                                  controller.jobList?[index]?.id ?? 0;
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
                                '${controller.jobList?[index]?.breakdownTime ?? ''}',
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
                                              onPress: () {
                                                //print('value = $value');

                                                controller.showJobDetails(
                                                    controller.jobId.value);
                                              },
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
