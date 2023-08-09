import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/body_custom_app_bar.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/permit_close_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../domain/models/new_permit_list_model.dart';

class NewPermitListWeb extends GetView<NewPermitListController> {
  NewPermitListWeb({super.key});
  //var controller;
  var controller = Get.find<NewPermitListController>();

  @override
  Widget build(BuildContext context) {
    // int? _permitId = 0;s
    return GetBuilder<NewPermitListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Row(
                  children: [
                    (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
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
                                        color:
                                            Color.fromARGB(255, 236, 234, 234)
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
                                    Row(
                                      children: [
                                        CustomRichText(title: 'Date Range'),
                                        Dimens.boxWidth10,
                                        CustomTextFieldForStock(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          numberTextField: true,
                                          onTap: () {
                                            controller
                                                    .openFromDateToStartDatePicker =
                                                !controller
                                                    .openFromDateToStartDatePicker;
                                            controller.update(
                                                ['stock_Mangement_Date']);
                                          },
                                          hintText:
                                              '${controller.formattedTodate.toString()} To ${controller.formattedFromdate.toString()}',
                                        ),
                                      ],
                                    ),
                                    Dimens.boxWidth10,
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'columnVisibility'.tr,
                                      ),
                                    ),
                                    Dimens.boxWidth10,

                                    varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id == UserAccessConstants.kPermitFeatureId &&
                                                    e.add == UserAccessConstants.kHaveAddAccess)
                                                .length >
                                            0
                                        ? ActionButton(
                                            icon: Icons.upload,
                                            label: 'Add New Permit',
                                            onPressed: () {
                                              controller.addNewPermitList();
                                            },
                                            color: ColorValues.appGreenColor,
                                          )
                                        : Container(),

                                    ////Search field
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        width: 200,
                                        height: 35,
                                        margin: Dimens.edgeInsets0_0_16_0,
                                        child: TextField(
                                          onChanged: (value) =>
                                              controller.search(value),
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            contentPadding:
                                                Dimens.edgeInsets10_0_0_0,
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
                                              minWidth: Get.width * 0.18,
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
                                                // paginationController: controller
                                                //     .newPermitPaginationController,
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
                                                      minWidth:
                                                          Get.width * 0.18,
                                                      label: column ==
                                                              "permitId"
                                                          ? "Permit Id"
                                                          : column ==
                                                                  "description"
                                                              ? "Title"
                                                              : column ==
                                                                      "permitType"
                                                                  ? "Permit Type"
                                                                  : column ==
                                                                          "equipment_category"
                                                                      ? "Equipment Category"
                                                                      : column ==
                                                                              "workingAreaName"
                                                                          ? "Working Area"
                                                                          : column == "request_by_name"
                                                                              ? "Permit Requested By"
                                                                              // : column ==
                                                                              //         "request_datetime"
                                                                              //     ? "Requested Date & Time"
                                                                              : column == "approved_by_name"
                                                                                  ? "Approved By"
                                                                                  // : column == "approved_datetime"
                                                                                  //     ? "Approved Date & Time"
                                                                                  : column == "current_status"
                                                                                      ? "Status"
                                                                                      : ""
                                                                                          "Actions");
                                                }).toList(),
                                                rows: [
                                                  ...List.generate(
                                                    controller.newPermitList
                                                            ?.length ??
                                                        0,
                                                    (index) {
                                                      var newPermitDetails =
                                                          controller
                                                                  .newPermitList?[
                                                              index];

                                                      //_jobId = jobDetails?.id;
                                                      controller
                                                              .permitId.value =
                                                          newPermitDetails
                                                                  ?.permitId ??
                                                              0;
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
                                                                'NewPermitList${_newPermitList[7]}'),
                                                            controller.viewNewPermitList(
                                                                permitId: int
                                                                    .tryParse(
                                                                        _newPermitList[
                                                                            0]))
                                                          },
                                                      height: 60,
                                                      cells: _newPermitList
                                                          .map((value) {
                                                        var index;

                                                        return TableViewCell(
                                                          //key: ,
                                                          child: (value ==
                                                                  _newPermitList[
                                                                      1])
                                                              ? Column(
                                                                  children: [
                                                                    Text(
                                                                      '${_newPermitList[1]}',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),

                                                                    ///For Bubble
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomCenter,
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            Dimens.edgeInsets8_2_8_2,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: controller.newPermitList!
                                                                                          .firstWhere(
                                                                                            (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                            orElse: () => NewPermitModel(permitId: 000),
                                                                                          )
                                                                                          ?.ptwStatus ==
                                                                                      121 ||
                                                                                  controller.newPermitList!
                                                                                          .firstWhere(
                                                                                            (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                            orElse: () => NewPermitModel(permitId: 000),
                                                                                          )
                                                                                          ?.ptwStatus ==
                                                                                      125
                                                                              ? ColorValues.appGreenColor
                                                                              : ColorValues.appRedColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          '${_newPermitList[7]}',
                                                                          style: Styles
                                                                              .white10
                                                                              .copyWith(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Text('${_newPermitList[7]}')
                                                                  ],
                                                                )
                                                              : (value ==
                                                                      'Actions')
                                                                  ? Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Wrap(
                                                                              children: [
                                                                                ////////////
                                                                                varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kPermitFeatureId && e.view == UserAccessConstants.kHaveViewAccess).length > 0
                                                                                    ? TableActionButton(
                                                                                        color: ColorValues.appDarkBlueColor,
                                                                                        icon: Icons.visibility,
                                                                                        message: 'View',
                                                                                        onPress: () {
                                                                                          controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                                                                        },
                                                                                      )
                                                                                    : Container(),

                                                                                ///Permit Edit button
                                                                                varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kPermitFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length > 0 &&
                                                                                        controller.newPermitList!
                                                                                                .firstWhere(
                                                                                                  (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                                  orElse: () => NewPermitModel(permitId: 000),
                                                                                                )
                                                                                                ?.ptwStatus ==
                                                                                            124
                                                                                    ? TableActionButton(
                                                                                        color: ColorValues.appYellowColor,
                                                                                        icon: Icons.edit,
                                                                                        message: 'Edit',
                                                                                        onPress: () {
                                                                                          controller.editNewPermit(permitId: int.tryParse(_newPermitList[0]), isChecked: controller.isChecked.value);
                                                                                          print('PermitTest:${controller.newPermitListModel?.permitId}');
                                                                                        },
                                                                                      )
                                                                                    : Container(),

                                                                                ////Permit Extend
                                                                                // varUserAccessModel
                                                                                //                 .value
                                                                                //                 .access_list!
                                                                                //                 .where((e) =>
                                                                                //                     e.feature_id == UserAccessConstants.kPermitFeatureId &&
                                                                                //                     e.add ==
                                                                                //                         UserAccessConstants.kHaveAddAccess)
                                                                                //                 .length >
                                                                                //             0 ||
                                                                                controller.newPermitList!
                                                                                                .firstWhere(
                                                                                                  (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                                  orElse: () => NewPermitModel(permitId: 000),
                                                                                                )
                                                                                                ?.requestById ==
                                                                                            varUserAccessModel.value.user_id &&
                                                                                        (controller.newPermitList!
                                                                                                    .firstWhere(
                                                                                                      (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                                      orElse: () => NewPermitModel(permitId: 000),
                                                                                                    )
                                                                                                    ?.ptwStatus ==
                                                                                                125 ||
                                                                                            controller.newPermitList!
                                                                                                    .firstWhere(
                                                                                                      (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                                      orElse: () => NewPermitModel(permitId: 000),
                                                                                                    )
                                                                                                    ?.ptwStatus ==
                                                                                                135)
                                                                                    ? TableActionButton(
                                                                                        color: ColorValues.appDarkBlueColor,
                                                                                        icon: Icons.expand_outlined,
                                                                                        message: 'Extend',
                                                                                        onPress: () {
                                                                                          Get.dialog(PermitExtendDialog(permitId: _newPermitList[0]));
                                                                                        },
                                                                                      )
                                                                                    : Container(),

                                                                                ///Permit Extend Approve
                                                                                // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 3 && e.approve == 0).length > 0 &&
                                                                                //         controller.newPermitList!
                                                                                //                 .firstWhere(
                                                                                //                   (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                //                   orElse: () => NewPermitModel(permitId: 000),
                                                                                //                 )
                                                                                //                 ?.ptwStatus ==
                                                                                //             133
                                                                                //     ? TableActionButton(
                                                                                //         color: ColorValues.appGreenColor,
                                                                                //         icon: Icons.expand_outlined,
                                                                                //         message: 'Extend Approve',
                                                                                //         onPress: () {
                                                                                //           controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                                                                //           // Get.dialog(PermitExtendDialog(
                                                                                //           //     permitId:
                                                                                //           //         _newPermitList[0]));
                                                                                //         },
                                                                                //       )
                                                                                //     : Container(),

                                                                                ////Approve button
                                                                                varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kPermitFeatureId && e.approve == UserAccessConstants.kHaveApproveAccess).length > 0 &&
                                                                                        controller.newPermitList!
                                                                                                .firstWhere(
                                                                                                  (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                                  orElse: () => NewPermitModel(permitId: 000),
                                                                                                )
                                                                                                ?.ptwStatus ==
                                                                                            121
                                                                                    ? TableActionButton(
                                                                                        color: ColorValues.appGreenColor,
                                                                                        icon: Icons.add,
                                                                                        message: 'Approve/Reject',
                                                                                        onPress: () {
                                                                                          // Get.dialog(PermitApprovedDialog(
                                                                                          //     permitId:
                                                                                          //         _newPermitList[0]));
                                                                                          controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
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

                                                                                ///Close Permit
                                                                                varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kPermitFeatureId && e.add == UserAccessConstants.kHaveAddAccess).length > 0
                                                                                    ? TableActionButton(
                                                                                        color: ColorValues.appcloseRedColor,
                                                                                        icon: Icons.close,
                                                                                        message: 'Close Permit',
                                                                                        onPress: () {
                                                                                          Get.dialog(PermitCloseDialog(permitId: _newPermitList[0]));
                                                                                        },
                                                                                      )
                                                                                    : Container(),

                                                                                ///Permit Extend Cancel
                                                                                // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 3 && e.approve == 1).length > 0 &&
                                                                                //         controller.newPermitList!
                                                                                //                 .firstWhere(
                                                                                //                   (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                //                   orElse: () => NewPermitModel(permitId: 000),
                                                                                //                 )
                                                                                //                 ?.ptwStatus ==
                                                                                //             133
                                                                                //     ? TableActionButton(
                                                                                //         color: ColorValues.appRedColor,
                                                                                //         icon: Icons.expand_outlined,
                                                                                //         message: 'Close',
                                                                                //         onPress: () {
                                                                                //           controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                                                                //           // Get.dialog(PermitExtendDialog(
                                                                                //           //     permitId:
                                                                                //           //         _newPermitList[0]));
                                                                                //         },
                                                                                //       )
                                                                                //     : Container(),

                                                                                ////Permit Cancel By Issuer
                                                                                // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 3 && e.delete == 1).length > 0 &&
                                                                                //         controller.newPermitList!
                                                                                //                 .firstWhere(
                                                                                //                   (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                //                   orElse: () => NewPermitModel(permitId: 000),
                                                                                //                 )
                                                                                //                 ?.ptwStatus ==
                                                                                //             121
                                                                                //     ? TableActionButton(
                                                                                //         color: ColorValues.appRedColor,
                                                                                //         icon: Icons.close,
                                                                                //         message: 'Cancel',
                                                                                //         onPress: () {
                                                                                //           controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));

                                                                                //           // Get.dialog(PermitCancelByIssuerDialog(
                                                                                //           //     permitId:
                                                                                //           //         _newPermitList[0]));
                                                                                //         },
                                                                                //       )
                                                                                //     : Container(),

                                                                                ////Permit Cancel By Approver / Cancel Permit Request
                                                                                varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kPermitFeatureId && e.approve == UserAccessConstants.kHaveApproveAccess).length > 0 &&
                                                                                        controller.newPermitList!
                                                                                                .firstWhere(
                                                                                                  (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                                  orElse: () => NewPermitModel(permitId: 000),
                                                                                                )
                                                                                                ?.ptwStatus ==
                                                                                            123
                                                                                    ? TableActionButton(
                                                                                        color: ColorValues.appRedColor,
                                                                                        icon: Icons.close,
                                                                                        message: 'Cancel By Approver',
                                                                                        onPress: () {
                                                                                          controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                                                                          // Get.dialog(PermitCancelByApproverDialog(
                                                                                          //     permitId:
                                                                                          //         _newPermitList[0]));
                                                                                        },
                                                                                      )
                                                                                    : TableActionButton(
                                                                                        color: ColorValues.appRedColor,
                                                                                        icon: Icons.close,
                                                                                        message: 'Cancel Permit Request',
                                                                                        onPress: () {
                                                                                          /// permitCancelRequest() this method will use here
                                                                                          //  controller.viewNewPermitList(
                                                                                          //     permitId:
                                                                                          //         int.tryParse(_newPermitList[0]));

                                                                                          Get.dialog(PermitCancelReQuestDialog(permitId: _newPermitList[0]));
                                                                                        },
                                                                                      ),

                                                                                ////Close Button
                                                                                // varUserAccessModel.value.access_list!.where((e) => e.feature_id == 3 && e.add == 1).length > 0 &&
                                                                                //             controller.newPermitList!
                                                                                //                     .firstWhere(
                                                                                //                       (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                //                       orElse: () => NewPermitModel(permitId: 000),
                                                                                //                     )
                                                                                //                     ?.ptwStatus ==
                                                                                //                 121 ||
                                                                                //         varUserAccessModel.value.access_list!.where((e) => e.feature_id == 3 && e.approve == 1).length > 0 &&
                                                                                //             controller.newPermitList!
                                                                                //                     .firstWhere(
                                                                                //                       (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                //                       orElse: () => NewPermitModel(permitId: 000),
                                                                                //                     )
                                                                                //                     ?.ptwStatus ==
                                                                                //                 123
                                                                                //     ? TableActionButton(
                                                                                //         color: ColorValues.appRedColor,
                                                                                //         icon: Icons.close,
                                                                                //         message: 'close',
                                                                                //         onPress: () {
                                                                                //           // Get.dialog(PermitRejectDialog(
                                                                                //           //     permitId:
                                                                                //           //         _newPermitList[
                                                                                //           //             0]));
                                                                                //           controller.viewNewPermitList(permitId: int.tryParse(_newPermitList[0]));
                                                                                //         },
                                                                                //       )
                                                                                //     : Container(),

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
                                                                            ),
                                                                          ],
                                                                        ),

                                                                        ///Checkbox
                                                                        controller.newPermitList!
                                                                                    .firstWhere(
                                                                                      (e) => "${e?.permitId}" == _newPermitList[0],
                                                                                      orElse: () => NewPermitModel(permitId: 000),
                                                                                    )
                                                                                    ?.ptwStatus ==
                                                                                124
                                                                            ? Row(
                                                                                children: [
                                                                                  Checkbox(
                                                                                    value: controller.isChecked.value,
                                                                                    onChanged: (value) {
                                                                                      // When the checkbox is changed, update the state using the controller
                                                                                      controller.isChecked.value = value!;
                                                                                      print('Checkbox Value:${controller.isChecked.value}');
                                                                                    },
                                                                                  ),
                                                                                  Text('Re-Submit for approval'),
                                                                                ],
                                                                              )
                                                                            : Container(),
                                                                      ],
                                                                    )
                                                                  : Text(value
                                                                      .toString()),
                                                        );
                                                      }).toList());
                                                }).toList(),
                                              ),
                                            ),

                                            /// PAGINATION
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .newPermitPaginationController,
                                                  builder:
                                                      (context, value, child) {
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
                                                                : Theme.of(
                                                                        context)
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
                                                                : Theme.of(
                                                                        context)
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
                if (controller.openFromDateToStartDatePicker)
                  Positioned(
                    right: 230,
                    top: 90,
                    child: DatePickerWidget(
                      selectionMode: DateRangePickerSelectionMode.range,
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        todayCellDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorValues.appDarkBlueColor),
                      ), // last date of this year
                      // controller: DateRangePickerController(),
                      initialSelectedRange: PickerDateRange(
                        controller.fromDate.value,
                        controller.toDate.value,
                      ),

                      onSubmit: (value) {
                        print('po valu ${value.toString()}');
                        PickerDateRange? data = value as PickerDateRange;

                        var pickUpDate =
                            DateTime.parse(data.startDate.toString());
                        controller.fromDate.value = pickUpDate;
                        var dropDate = DateTime.parse(data.endDate.toString());
                        dropDate != null
                            ? controller.toDate.value = dropDate
                            : controller.toDate.value = pickUpDate;

                        controller.getNewPermitListByDate();
                        controller.openFromDateToStartDatePicker =
                            !controller.openFromDateToStartDatePicker;
                        controller.update(['stock_Mangement_Date']);

                        // Get.toNamed(
                        //   Routes.stockManagementGoodsOrdersScreen,
                        // );
                      },
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
