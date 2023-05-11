import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/body_custom_app_bar.dart';
import 'package:cmms/app/widgets/permit_approved_dialog.dart';
import 'package:cmms/app/widgets/permit_issue_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/new_permit_list_model.dart';

class NewPermitListWeb extends GetView<NewPermitListController> {
  NewPermitListWeb({super.key});
  //var controller;
  var controller = Get.find<NewPermitListController>();

  @override
  Widget build(BuildContext context) {
    // int? _permitId = 0;s
    return //
        Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Prmit List'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Row(
        children: [
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? Dimens.box0
              : HomeDrawer(),
          Expanded(
            child: Obx(
              () => //
                  Container(
                color: ColorValues.lightBlueishColor,
                child: Column(
                    //
                    children: [
                      ///
                      CustomAppBar(
                        title: 'Permit List',
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
                          varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id == 3 && e.add == 1)
                                      .length >
                                  0
                              ? ActionButton(
                                  icon: Icons.upload,
                                  label: 'Add New Permit',
                                  onPressed: () {
                                    controller.addNewPermitList();
                                  },
                                  color: Colors.blue,
                                )
                              : Container(),
                          Dimens.boxWidth10,
                        ]),
                      ),

                      ///
                       Expanded(
                        child: Container(
                          height: Get.height,
                          child: Column(
                            children: [
                            Expanded(
                              child: ScrollableTableView(
                                paginationController:
                                    controller.newPermitPaginationController,
                                columns: [
                                  'permitId',
                                  'permit_site_no',
                                  'permitTypeName',
                                  'equipment_category',
                                  'workingAreaName',
                                  'description',
                                  'request_by_name',
                                  'request_datetime',
                                  'approved_by_name',
                                  'approved_datetime',
                                  'current_status',
                                  // 'breakdownTime',
                                  // 'breakdownType',
                                  // 'permitId',
                                  // 'assignedToName',
                                  // 'status',
                                  'action'.tr,
                                ].map((column) {
                                  return TableViewColumn(
                                      minWidth: Get.width * 0.15,
                                      label: column == "permitId"
                                          ? "Permit Id"
                                          : column == "permit_site_no"
                                              ? "Site Permit No."
                                              : column == "permitTypeName"
                                                  ? "Permit Type Name"
                                                  : column ==
                                                          "equipment_category"
                                                      ? "Equipment Category"
                                                      : column ==
                                                              "workingAreaName"
                                                          ? "Facility / Working Area"
                                                          : column ==
                                                                  "description"
                                                              ? "Title"
                                                              : column ==
                                                                      "request_by_name"
                                                                  ? "Permit Requested By"
                                                                  : column ==
                                                                          "request_datetime"
                                                                      ? "Requested Date & Time"
                                                                      : column ==
                                                                              "approved_by_name"
                                                                          ? "Approved By"
                                                                          : column == "approved_datetime"
                                                                              ? "Approved Date & Time"
                                                                              : column == "current_status"
                                                                                  ? "Status"
                                                                                  : ""
                            
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
                                                                                      //
                                                                                      // : column == "Actions"
                                                                                      "Actions"
                                      // : "",
                                      );
                                }).toList(),
                                rows: [
                                  ...List.generate(
                                    controller.newPermitList?.length ?? 0,
                                    (index) {
                                      var newPermitDetails =
                                          controller.newPermitList?[index];
                            
                                      //_jobId = jobDetails?.id;
                                      controller.permitId.value =
                                          newPermitDetails?.permitId ?? 0;
                                      return [
                                        '${newPermitDetails?.permitId}',
                                        '${newPermitDetails?.permitSiteNo}',
                                        '${newPermitDetails?.permitTypeName}',
                                        '${newPermitDetails?.equipment_categories}',
                                        '${newPermitDetails?.workingAreaName ?? ''}',
                                        '${newPermitDetails?.description}',
                                        '${newPermitDetails?.requestByName}',
                                        '${newPermitDetails?.requestDatetime}',
                                        '${newPermitDetails?.approvedByName}',
                                        '${newPermitDetails?.approvedDatetime}',
                                        '${newPermitDetails?.currentStatus}',
                                        // '${newPermitDetails?.current_status}' ==
                                        //         "Permit Created"
                                        //  ?
                                        'Actions'
                                        // : '',
                                      ];
                                      
                                    },
                                  ),
                                ].map((_newPermitList) { 
                                     
                                  return TableViewRow(
                                      onTap: () => {
                                            print('ZERO = ${_newPermitList[0]}'),
                                                controller.viewNewPermitList(
                                                                    permitId: int
                                                                        .tryParse(
                                                                            _newPermitList[0]))
                                             
                                          },
                                      height: 110,
                                      cells: _newPermitList.map((value) {
                                        var index;
                                      
                                        return TableViewCell(
                                          //key: ,
                                          child: (value == 'Actions')
                                              ? Wrap(
                                                  children: [
                                                    varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        3 &&
                                                                    e.view == 1)
                                                                .length >
                                                            0
                                                        ? TableActionButton(
                                                            color: Colors.green,
                                                            icon: Icons
                                                                .visibility,
                                                            label: 'View',
                                                            onPress: () {
                                                              controller.viewNewPermitList(
                                                                  permitId: int
                                                                      .tryParse(
                                                                          _newPermitList[
                                                                              0]));
                                                            },
                                                          )
                                                        : Container(),
                                                                        
                                                    varUserAccessModel.value
                                                                    .access_list!
                                                                    .where((e) =>
                                                                        e.feature_id ==
                                                                            3 &&
                                                                        e.issue ==
                                                                            1)
                                                                    .length >
                                                                0 &&
                                                            controller
                                                                    .newPermitList!
                                                                    .firstWhere(
                                                                      (e) =>
                                                                          "${e?.permitId}" ==
                                                                          _newPermitList[
                                                                              0],
                                                                      orElse: () =>
                                                                          NewPermitModel(
                                                                              permitId: 000),
                                                                    )
                                                                    ?.ptwStatus ==
                                                                121
                                                        ? TableActionButton(
                                                            color: Colors.green,
                                                            icon: Icons.check,
                                                            label: 'Issue',
                                                            onPress: () {
                                                              Get.dialog(PermitIssueDialog(
                                                                  permitId:
                                                                      _newPermitList[
                                                                          0]));
                                                            },
                                                          )
                                                        : Container(),
                                                                        
                                                    varUserAccessModel.value
                                                                    .access_list!
                                                                    .where((e) =>
                                                                        e.feature_id ==
                                                                            3 &&
                                                                        e.approve ==
                                                                            1)
                                                                    .length >
                                                                0 &&
                                                            controller
                                                                    .newPermitList!
                                                                    .firstWhere(
                                                                      (e) =>
                                                                          "${e?.permitId}" ==
                                                                          _newPermitList[
                                                                              0],
                                                                      orElse: () =>
                                                                          NewPermitModel(
                                                                              permitId: 000),
                                                                    )
                                                                    ?.ptwStatus ==
                                                                123
                                                        ? TableActionButton(
                                                            color: ColorValues
                                                                .purpleColor,
                                                            icon: Icons.add,
                                                            label: 'Approve',
                                                            onPress: () {
                                                              // controller.goToJobCardScreen(
                                                              //   int.tryParse(_newPermitList[0]),
                                                              // );
                                                              Get.dialog(PermitApprovedDialog(
                                                                  permitId:
                                                                      _newPermitList[
                                                                          0]));
                                                            },
                                                          )
                                                        : Container(),
                                                    varUserAccessModel.value
                                                                    .access_list!
                                                                    .where((e) =>
                                                                        e.feature_id ==
                                                                            3 &&
                                                                        e.delete ==
                                                                            0)
                                                                    .length >
                                                                0 &&
                                                            controller
                                                                    .newPermitList!
                                                                    .where((e) =>
                                                                        e?.ptwStatus ==
                                                                        121)
                                                                    .length >
                                                                0
                                                        ? Container()
                                                        : TableActionButton(
                                                            color: Colors.red,
                                                            icon: Icons.delete,
                                                            label: 'Reject',
                                                            onPress: () {
                                                              // controller.goToJobCardScreen(
                                                              //   int.tryParse(_newPermitList[0]),
                                                              // );
                                                              // Get.dialog(PermitApprovedDialog(
                                                              //     permitId:
                                                              //         _newPermitList[
                                                              //             0]));
                                                            },
                                                          ),
                                                    TableActionButton(
                                                      color: Colors.red,
                                                      icon: Icons.close,
                                                      label: 'Close',
                                                      onPress: () {},
                                                    ),
                                                    TableActionButton(
                                                      color: ColorValues
                                                          .appDarkBlueColor,
                                                      icon:
                                                          Icons.expand_outlined,
                                                      label: 'Extend',
                                                      onPress: () {},
                                                    ),
                                                    TableActionButton(
                                                      color: ColorValues
                                                          .appRedColor,
                                                      icon: Icons.close,
                                                      label: 'Cancel',
                                                      onPress: () {},
                                                    ),
                                                    varUserAccessModel.value
                                                                .access_list!
                                                                .where((e) =>
                                                                    e.feature_id ==
                                                                        3 &&
                                                                    e.edit == 1)
                                                                .length >
                                                            0
                                                        ? TableActionButton(
                                                            color: Colors.blue,
                                                            icon: Icons.edit,
                                                            label: 'Edit PTW',
                                                            onPress: () {
                                                              controller.editNewPermit(
                                                                  permitId: int
                                                                      .tryParse(
                                                                          _newPermitList[
                                                                              0]));
                                                              print(
                                                                  'PermitTest:${controller.newPermitListModel?.permitId}');
                                                            },
                                                          )
                                                        : Container(),
                                                                        
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
                                        
                                      }
                                      ).toList());
                                }).toList(),
                                
                              ),
                            ),

                            /// PAGINATION
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      controller.newPermitPaginationController,
                                  builder: (context, value, child) {
                                    return Row(children: [
                                      Text(
                                          "${controller.newPermitPaginationController.currentPage}  of ${controller.newPermitPaginationController.pageCount}"),
                                      Row(children: [
                                        IconButton(
                                          onPressed: controller
                                                      .newPermitPaginationController
                                                      .currentPage <=
                                                  1
                                              ? null
                                              : () {
                                                  controller
                                                      .newPermitPaginationController
                                                      .previous();
                                                },
                                          iconSize: 20,
                                          splashRadius: 20,
                                          icon: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: controller
                                                        .newPermitPaginationController
                                                        .currentPage <=
                                                    1
                                                ? Colors.black26
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: controller
                                                      .newPermitPaginationController
                                                      .currentPage >=
                                                  controller
                                                      .newPermitPaginationController
                                                      .pageCount
                                              ? null
                                              : () {
                                                  controller
                                                      .newPermitPaginationController
                                                      .next();
                                                },
                                          iconSize: 20,
                                          splashRadius: 20,
                                          icon: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: controller
                                                        .newPermitPaginationController
                                                        .currentPage >=
                                                    controller
                                                        .newPermitPaginationController
                                                        .pageCount
                                                ? Colors.black26
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                      ]),
                                    ]
                                    );
                                  }),
                            ),
                          ]),
                        ),
                        //),
                      ),
                    ]
                    
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
