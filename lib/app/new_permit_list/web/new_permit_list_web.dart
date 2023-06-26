import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/body_custom_app_bar.dart';
import 'package:cmms/app/widgets/permit_approved_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_by_approver_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/permit_close_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_dialog.dart';
import 'package:cmms/app/widgets/permit_issue_dialog.dart';
import 'package:cmms/app/widgets/permit_reject_dialog.dart';
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
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
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
                            Text(
                              "DASHBOARD",
                              style: Styles.greyLight14,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(" / Breakdown Maintenance",
                                  style: Styles.greyLight14),
                            ),
                            Text(
                              " / Permit List",
                              style: Styles.greyLight14,
                            ),
                            // Text(" / Create Checklist Number",
                            //     style: Styles.greyMediumLight12)

                            // ActionButton(
                            //   icon: Icons.calendar_month,
                            //   label: 'December 3rd 2022',
                            //   // onPress: () {
                            //   //   // Get.to(() => AddInventory());
                            //   //   // _buildStartDateField_mobile(context);
                            //   // },
                            //   color: Colors.green,
                            //   onPressed: () {},
                            // ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,

                      ///
                      CustomAppBar(
                        title: 'Permit List',
                        action: Row(children: [
                          // ActionButton(
                          //   icon: Icons.download,
                          //   label: 'BM Report',
                          //   onPressed: () {},
                          //   color: Color.fromARGB(255, 220, 176, 45),
                          // ),
                          // Dimens.boxWidth10,
                          // ActionButton(
                          //   icon: Icons.upload,
                          //   label: 'Pending Permits',
                          //   onPressed: () {},
                          //   color: Color.fromARGB(255, 130, 183, 146),
                          // ),
                          // Dimens.boxWidth10,
                          // ActionButton(
                          //   icon: Icons.add,
                          //   label: 'Created By Me'.tr,
                          //   onPressed: () {},
                          //   color: Color.fromARGB(255, 73, 142, 143),
                          // ),
                          // Dimens.boxWidth10,
                          // ActionButton(
                          //   icon: Icons.close,
                          //   label: 'Assigned To Me'.tr,
                          //   onPressed: () async {},
                          //   color: Colors.green,
                          // ),
                          Dimens.boxWidth10,
                          ActionButton(
                            icon: Icons.add,
                            label: 'Column Visibility'.tr,
                            onPressed: () {},
                            color: Colors.blue,
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

                          ////Search field
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: 200,
                              height: 40,
                              margin: Dimens.edgeInsets0_0_16_0,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  contentPadding: Dimens.edgeInsets10_0_0_0,
                                  hintText: 'search'.tr,
                                  hintStyle: Styles.grey12,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),

                      ///
                      controller.newPermitList!.isEmpty
                          ? Expanded(
                              child: ScrollableTableView(
                                columns: [
                                  'permitId',
                                  'description',
                                  'permitTypeName',
                                  'equipment_category',
                                  'workingAreaName',
                                  'request_by_name',
                                  // 'request_datetime',
                                  'approved_by_name',
                                  // 'approved_datetime',
                                  'current_status',
                                  "Action",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.16,
                                  );
                                }).toList(),
                                rows: [
                                  ...List.generate(
                                    controller.newPermitList!.length,
                                    (index) {
                                      return [
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                        '',
                                      ];
                                    },
                                  ),
                                ].map((record) {
                                  return TableViewRow(
                                    height: 60,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                height: Get.height,
                                child: Column(children: [
                                  Expanded(
                                    child: ScrollableTableView(
                                      paginationController: controller
                                          .newPermitPaginationController,
                                      columns: [
                                        'permitId',
                                        'description',
                                        'permitType',
                                        'equipment_category',
                                        'workingAreaName',
                                        'request_by_name',
                                        // 'request_datetime',
                                        'approved_by_name',
                                        // 'approved_datetime',
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
                                                : column == "description"
                                                    ? "Title"
                                                    : column == "permitType"
                                                        ? "Permit Type"
                                                        : column ==
                                                                "equipment_category"
                                                            ? "Equipment Category"
                                                            : column ==
                                                                    "workingAreaName"
                                                                ? "Working Area"
                                                                : column ==
                                                                        "request_by_name"
                                                                    ? "Permit Requested By"
                                                                    // : column ==
                                                                    //         "request_datetime"
                                                                    //     ? "Requested Date & Time"
                                                                    : column ==
                                                                            "approved_by_name"
                                                                        ? "Approved By"
                                                                        // : column == "approved_datetime"
                                                                        //     ? "Approved Date & Time"
                                                                        : column ==
                                                                                "current_status"
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
                                            var newPermitDetails = controller
                                                .newPermitList?[index];

                                            //_jobId = jobDetails?.id;
                                            controller.permitId.value =
                                                newPermitDetails?.permitId ?? 0;
                                            return [
                                              '${newPermitDetails?.permitId}',
                                              '${newPermitDetails?.description}',
                                              // '${newPermitDetails?.permitSiteNo}',
                                              '${newPermitDetails?.permitTypeName}',
                                              '${newPermitDetails?.equipment_categories}',
                                              '${newPermitDetails?.workingAreaName ?? ''}',
                                              '${newPermitDetails?.requestByName}\n${newPermitDetails?.requestDatetime}',
                                              // '${newPermitDetails?.requestDatetime}',
                                              '${newPermitDetails?.approvedByName}\n${newPermitDetails?.approvedDatetime}',
                                              // '${newPermitDetails?.approvedDatetime}',
                                              '${newPermitDetails?.current_status_short}',
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
                                                  print(
                                                      'ZERO = ${_newPermitList[0]}'),
                                                  print(
                                                      'NewPermitList$_newPermitList'),
                                                  controller.viewNewPermitList(
                                                      permitId: int.tryParse(
                                                          _newPermitList[0]))
                                                },
                                            height: 135,
                                            cells: _newPermitList.map((value) {
                                              var index;

                                              return TableViewCell(
                                                //key: ,
                                                child: (value == 'Actions')
                                                    ? Wrap(
                                                        children: [
                                                          // Align(
                                                          //   alignment: Alignment
                                                          //       .centerRight,
                                                          //   child: Container(
                                                          //     padding: Dimens
                                                          //         .edgeInsets8_2_8_2,
                                                          //     decoration:
                                                          //         BoxDecoration(
                                                          //       color: controller
                                                          //                   .newPermitList!
                                                          //                   .firstWhere(
                                                          //                     (e) => "${e?.permitId}" == _newPermitList[0],
                                                          //                     orElse: () => NewPermitModel(permitId: 000),
                                                          //                   )
                                                          //                   ?.ptwStatus ==
                                                          //               121
                                                          //           ?Colors
                                                          //               .green
                                                          //           :ColorValues
                                                          //               .appRedColor,
                                                          //       // : calibrationListListDetails
                                                          //       //             ?.statusID ==
                                                          //       //         211
                                                          //       //     ? ColorValues
                                                          //       //         .appYellowColor
                                                          //       //     : calibrationListListDetails
                                                          //       //                 ?.statusID ==
                                                          //       //             214
                                                          //       //         ? ColorValues
                                                          //       //             .appGreenColor
                                                          //       //         : calibrationListListDetails?.statusID ==
                                                          //       //                 213
                                                          //       //             ? ColorValues
                                                          //       //                 .appYellowColor
                                                          //       //             : calibrationListListDetails?.statusID ==
                                                          //       //                     217
                                                          //       //                 ? ColorValues.appGreenColor
                                                          //       //                 : ColorValues.appDarkBlueColor,
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(
                                                          //                   4),
                                                          //     ),
                                                          //     child: Text(
                                                          //       '${controller.newPermitList?.firstWhere((b) => '${b?.ptwStatus}'== '121' , orElse: null)?.current_status_short
                                                          //          }',
                                                          //       // '',
                                                          //       style: Styles
                                                          //           .white10
                                                          //           .copyWith(
                                                          //         color: Colors
                                                          //             .white,
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),

                                                          ////////////
                                                          varUserAccessModel
                                                                      .value
                                                                      .access_list!
                                                                      .where((e) =>
                                                                          e.feature_id ==
                                                                              3 &&
                                                                          e.view ==
                                                                              0)
                                                                      .length >
                                                                  0
                                                              ? TableActionButton(
                                                                  color: Colors
                                                                      .green,
                                                                  icon: Icons
                                                                      .visibility,
                                                                  label: 'View',
                                                                  onPress: () {
                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == 3 &&
                                                                              e.issue ==
                                                                                  1)
                                                                          .length >
                                                                      0 &&
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      121
                                                                  ||
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      122
                                                                  ||
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      124
                                                              ? TableActionButton(
                                                                  color: Colors
                                                                      .green,
                                                                  icon: Icons
                                                                      .check,
                                                                  label:
                                                                      'Issue',
                                                                  onPress: () {
                                                                    // Get.dialog(PermitIssueDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[0]));
                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == 3 &&
                                                                              e.approve ==
                                                                                  1)
                                                                          .length >
                                                                      0 &&
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      123
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .purpleColor,
                                                                  icon:
                                                                      Icons.add,
                                                                  label:
                                                                      'Approve',
                                                                  onPress: () {
                                                                    // Get.dialog(PermitApprovedDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[0]));
                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          /// Condition for delete
                                                          // varUserAccessModel.value
                                                          //                 .access_list!
                                                          //                 .where((e) =>
                                                          //                     e.feature_id ==
                                                          //                         3 &&
                                                          //                     e.delete ==
                                                          //                         0)
                                                          //                 .length >
                                                          //             0 &&
                                                          //         controller
                                                          //                 .newPermitList!
                                                          //                 .where((e) =>
                                                          //                     e?.ptwStatus ==
                                                          //                     121)
                                                          //                 .length >
                                                          //             0
                                                          //     ? Container()
                                                          //     : TableActionButton(
                                                          //         color: Colors.red,
                                                          //         icon: Icons.delete,
                                                          //         label: 'Delete',
                                                          //         onPress: () {
                                                          //           // controller.goToJobCardScreen(
                                                          //           //   int.tryParse(_newPermitList[0]),
                                                          //           // );
                                                          //           // Get.dialog(PermitRejectDialog(
                                                          //           //     permitId:
                                                          //           //         _newPermitList[
                                                          //           //             0]));
                                                          //         },
                                                          //       ),
                                                          /// Condition For delete ends here

                                                          TableActionButton(
                                                            color: Colors.red,
                                                            icon: Icons.close,
                                                            label: 'Close',
                                                            onPress: () {
                                                              Get.dialog(PermitCloseDialog(
                                                                  permitId:
                                                                      _newPermitList[
                                                                          0]));
                                                            },
                                                          ),

                                                          ////Permit Extend
                                                          controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.requestById ==
                                                                      varUserAccessModel
                                                                          .value
                                                                          .user_id 
                                                                          &&
                                                                      (controller
                                                                              .newPermitList!
                                                                              .firstWhere(
                                                                                (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                orElse: () => NewPermitModel(permitId: 000),
                                                                              )
                                                                              ?.ptwStatus ==
                                                                          125 
                                                                          ||
                                                                      controller
                                                                              .newPermitList!
                                                                              .firstWhere(
                                                                                (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                orElse: () => NewPermitModel(permitId: 000),
                                                                              )
                                                                              ?.ptwStatus ==
                                                                          135)
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appDarkBlueColor,
                                                                  icon: Icons
                                                                      .expand_outlined,
                                                                  label:
                                                                      'Extend',
                                                                  onPress: () {
                                                                    Get.dialog(PermitExtendDialog(
                                                                        permitId:
                                                                            _newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          ///Permit Extend Approve
                                                          varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == 3 &&
                                                                              e.approve ==
                                                                                  1)
                                                                          .length >
                                                                      0 &&
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      133
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appDarkBlueColor,
                                                                  icon: Icons
                                                                      .expand_outlined,
                                                                  label:
                                                                      'Extend Approve',
                                                                  onPress: () {
                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
                                                                    // Get.dialog(PermitExtendDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          ///Permit Extend Cancel
                                                          varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == 3 &&
                                                                              e.approve ==
                                                                                  1)
                                                                          .length >
                                                                      0 &&
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      133
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appDarkBlueColor,
                                                                  icon: Icons
                                                                      .expand_outlined,
                                                                  label:
                                                                      'Extend Cancel',
                                                                  onPress: () {
                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
                                                                    // Get.dialog(PermitExtendDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          ////Permit Cancel By Issuer
                                                          varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == 3 &&
                                                                              e.issue ==
                                                                                  1)
                                                                          .length >
                                                                      0 &&
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      121
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appRedColor,
                                                                  icon: Icons
                                                                      .close,
                                                                  label:
                                                                      'Cancel',
                                                                  onPress: () {
                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));

                                                                    // Get.dialog(PermitCancelByIssuerDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          ////Permit Cancel By Approver
                                                          varUserAccessModel
                                                                          .value
                                                                          .access_list!
                                                                          .where((e) =>
                                                                              e.feature_id == 3 &&
                                                                              e.approve ==
                                                                                  1)
                                                                          .length >
                                                                      0 &&
                                                                  controller
                                                                          .newPermitList!
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                _newPermitList[0],
                                                                            orElse: () =>
                                                                                NewPermitModel(permitId: 000),
                                                                          )
                                                                          ?.ptwStatus ==
                                                                      123
                                                              ? TableActionButton(
                                                                  color: ColorValues
                                                                      .appRedColor,
                                                                  icon: Icons
                                                                      .close,
                                                                  label:
                                                                      'Cancel',
                                                                  onPress: () {
                                                                     controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
                                                                    // Get.dialog(PermitCancelByApproverDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[0]));
                                                                  },
                                                                )
                                                              : TableActionButton(
                                                                  color: ColorValues
                                                                      .appRedColor,
                                                                  icon: Icons
                                                                      .close,
                                                                  label:
                                                                      'Cancel Request',
                                                                  onPress: () {
                                                                    /// permitCancelRequest() this method will use here
                                                                     controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));

                                                                    // Get.dialog(PermitCancelReQuestDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[0]));
                                                                  },
                                                                ),

                                                          varUserAccessModel.value.access_list!.where((e) => e.feature_id == 3 && e.issue == 1).length >
                                                                          0 &&
                                                                      controller
                                                                              .newPermitList!
                                                                              .firstWhere(
                                                                                (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                orElse: () => NewPermitModel(permitId: 000),
                                                                              )
                                                                              ?.ptwStatus ==
                                                                          121 ||
                                                                  varUserAccessModel
                                                                              .value
                                                                              .access_list!
                                                                              .where((e) => e.feature_id == 3 && e.approve == 1)
                                                                              .length >
                                                                          0 &&
                                                                      controller.newPermitList!
                                                                              .firstWhere(
                                                                                (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                orElse: () => NewPermitModel(permitId: 000),
                                                                              )
                                                                              ?.ptwStatus ==
                                                                          123
                                                              ? TableActionButton(
                                                                  color: Colors
                                                                      .red,
                                                                  icon: Icons
                                                                      .close,
                                                                  label:
                                                                      'Reject',
                                                                  onPress: () {
                                                                    // Get.dialog(PermitRejectDialog(
                                                                    //     permitId:
                                                                    //         _newPermitList[
                                                                    //             0]));
                                                                    controller.viewNewPermitList(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
                                                                  },
                                                                )
                                                              : Container(),

                                                          varUserAccessModel
                                                                      .value
                                                                      .access_list!
                                                                      .where((e) =>
                                                                          e.feature_id ==
                                                                              3 &&
                                                                          e.edit ==
                                                                              0)
                                                                      .length >
                                                                  0
                                                              ? TableActionButton(
                                                                  color: Colors
                                                                      .blue,
                                                                  icon: Icons
                                                                      .edit,
                                                                  label:
                                                                      'Edit PTW',
                                                                  onPress: () {
                                                                    controller.editNewPermit(
                                                                        permitId:
                                                                            int.tryParse(_newPermitList[0]));
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
                                            }).toList());
                                      }).toList(),
                                    ),
                                  ),

                                  /// PAGINATION
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .newPermitPaginationController,
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
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
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
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                                          ]);
                                        }),
                                  ),
                                ]),
                              ),
                              //),
                            ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
