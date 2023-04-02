import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/body_custom_app_bar.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

// import '../../../theme/color_values.dart';
// import '../../../theme/dimens.dart';
// import '../../../widgets/action_button.dart';
// import '../../../widgets/body_custom_app_bar.dart';
// import '../../../widgets/table_action_button.dart';
// import '../../job_list_controller.dart';

class NewPermitListWeb extends GetView<NewPermitListController> {
  NewPermitListWeb({super.key});
  //var controller;

  @override
  Widget build(BuildContext context) {
    int? _permitId = 0;
    return //
        Obx(
      () => //
          Container(
        color: ColorValues.lightBlueishColor,
        child: Column(
            //
            children: [
              ///
              CustomAppBar(
                title: 'New Permit List',
                action: Row(children: [
                  ActionButton(
                    icon: Icons.download,
                    label: 'BM Report',
                    onPressed: () {},
                    color: Color.fromARGB(255, 220, 176, 45),
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.upload,
                    label: 'Pending Permits',
                    onPressed: () {},
                    color: Color.fromARGB(255, 130, 183, 146),
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.add,
                    label: 'Created By Me'.tr,
                    onPressed: () {},
                    color: Color.fromARGB(255, 73, 142, 143),
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.close,
                    label: 'Assigned To Me'.tr,
                    onPressed: () async {},
                    color: Colors.green,
                  ),
                  Dimens.boxWidth10,
                  ActionButton(
                    icon: Icons.upload,
                    label: 'Add New Permit',
                    onPressed: () {
                      controller.addNewPermitList();
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
                          'permitId',
                          'workingAreaName',
                          'approved_datetime',
                          'equipment',
                          'workingAreaId',
                          'description',
                          'permitTypeName',
                          // 'raisedByName',
                          // 'breakdownTime',
                          // 'breakdownType',
                          // 'permitId',
                          // 'assignedToName',
                          // 'status',
                           'action'.tr,
                        ].map((column) {
                          return TableViewColumn(
                            minWidth: Get.width * 0.25,
                            label: column == "permitId"
                                ? "Permit Id"
                                : column == "workingAreaName"
                                    ? "Facility / Work Area"
                                    : column == "approved_datetime"
                                        ? "Approved Time"
                                        : column == "equipment"
                                            ? "Equipment" //
                                            : column == "workingAreaId"
                                                ? "Working Area Id"
                                                : column == "description"
                                                    ? "Description"
                                                    : column == "permitTypeName"
                                                        ? "Work Type"
                                                //         : column ==
                                                //                 "raisedByName"
                                                //             ? "Raised By"
                                                //             : column ==
                                                //                     "breakdownTime"
                                                //                 ? "Breakdown Time"
                                                //                 : column ==
                                                //                         "breakdownType"
                                                //                     ? "Breakdown Type"
                                                //                     : column ==
                                                //                             "permitId"
                                                //                         ? "Permit ID"
                                                //                         : column ==
                                                //                                 "assignedToName"
                                                //                             ? "Assigned To"
                                                //                             : column == "status"
                                                //                                 ? "Status"
                                                //                                 : column == "Actions"
                                                //                                     ? "Actions"
                                                                                    : "",
                          );
                        }).toList(),
                        rows: //
                            [
                          ...List.generate(
                            controller.newPermitList?.length ?? 0,
                            (index) {
                              var newPermitDetails = controller.newPermitList?[index];
                              //_jobId = jobDetails?.id;
                              controller.permitId.value = newPermitDetails?.permitId ?? 0;
                              return [
                                '${newPermitDetails?.permitId}',
                                '${newPermitDetails?.workingAreaName ?? ''}',
                                '${newPermitDetails?.approved_datetime}',
                                '${newPermitDetails?.equipment}',
                                '${newPermitDetails?.workingAreaId}',
                                '${newPermitDetails?.description}',
                                '${newPermitDetails?.permitTypeName}',
                                // '${jobDetails?.workType}',
                                // '${jobDetails?.raisedByName}',
                                // '${jobDetails?.breakdownTime ?? ''}',
                                // '${jobDetails?.breakdownType}',
                                // '${jobDetails?.permitId}',
                                // '${jobDetails?.assignedToName}',
                                // '${jobDetails?.status}',
                                'Actions'
                              ];
                            },
                          ),
                        ].map((_newPermitList) {
                          return TableViewRow(
                              onTap: () => {print('ZERO = ${_newPermitList[0]}')},
                              height: 45,
                              cells: _newPermitList.map((value) {
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
                                                controller.showNewPermitListDetails(
                                                    controller.permitId.value);
                                              },
                                            ),
                                            TableActionButton(
                                              color: ColorValues.purpleColor,
                                              icon: Icons.add,
                                              label: 'Job Card',
                                              onPress: () {
                                                controller.goToJobCardScreen(
                                                  int.tryParse(_newPermitList[0]),
                                                );
                                              },
                                            ),
                                            TableActionButton(
                                              color: Colors.blue,
                                              icon: Icons.edit,
                                              label: 'Edit PTW',
                                              onPress: () {},
                                            ),
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
