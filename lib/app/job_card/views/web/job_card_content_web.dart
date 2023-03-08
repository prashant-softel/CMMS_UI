import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../../theme/colors_value.dart';
import '../../job_card_controller.dart';

class JobCardContentWeb extends GetView<JobCardController> {
  const JobCardContentWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsValue.lightBlueishColor,
      child: Column(
          //
          children: [
            Expanded(
              child: ScrollableTableView(
                //paginationController: controller.paginationController,
                columns: [
                  'plantName',
                  'blockName',
                  'equipmentCat',
                ].map((column) {
                  return TableViewColumn(
                    minWidth: Get.width * 0.15,
                    label: column == "facilityName"
                        ? "Facility"
                        : column == "blockName"
                            ? "Block Name"
                            : column == "equipmentCat"
                                ? "Equipment Category"
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
                        '${controller.jobList?[index]?.facilityName}',
                        '${controller.jobList?[index]?.equipmentCat}',
                        'Actions'
                      ];
                    },
                  ),
                ].map((_jobList) {
                  return TableViewRow(
                      height: 60,
                      cells: _jobList.map((value) {
                        return TableViewCell(
                          child: Text(value.toString()),
                        );
                      }).toList());
                }).toList(),
              ),
            ),
          ]),
    );
  }
}
