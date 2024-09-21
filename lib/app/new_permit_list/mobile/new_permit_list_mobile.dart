import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/new_permit_list/permit_status_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../constant/constant.dart';

class NewPermitListMobile extends GetView<NewPermitListController> {
  NewPermitListMobile({Key? key, this.newPermitListModel}) : super(key: key);

  final NewPermitModel? newPermitListModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPermitListController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        return Scaffold(
          body: Obx(() => Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Dimens.boxHeight10,
                        HeaderWidgetMobile(
                          onPressed: () {
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['stock_Mangement_Date']);
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.newPermitList != null
                                ? controller.newPermitList.length
                                : 0,
                            itemBuilder: (context, index) {
                              final newPermitListModel =
                                  controller.newPermitList != null
                                      ? controller.newPermitList[index]
                                      : NewPermitModel();
                              var status = newPermitListModel
                                      ?.current_status_short
                                      .toString() ??
                                  '';
                              print('Current Status: $status');
                              return GestureDetector(
                                onTap: () {
                                  var _newPermitListId =
                                      newPermitListModel?.permitId ?? 0;
                                  controller.viewNewPermitList(
                                      permitId: _newPermitListId.toString());
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                    color: Colors.lightBlue.shade50,
                                    elevation: 10,
                                    shadowColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Permit Id: ${newPermitListModel?.permitId ?? 0}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: _getStatusColor(
                                                        status.toLowerCase()),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  child: Center(
                                                    child: Text(
                                                      status,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Permit Type Name: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${newPermitListModel?.permitTypeName ?? 'Unassigned'}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Working Area Name: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${newPermitListModel?.workingAreaName ?? ''}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Description: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  newPermitListModel
                                                          ?.description ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Equipment: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  newPermitListModel
                                                          ?.equipment_categories ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Work Area Name: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  newPermitListModel
                                                          ?.workingAreaName ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Approved Time: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  (newPermitListModel
                                                              ?.approvedDatetime !=
                                                          null)
                                                      ? DateFormat(
                                                              'dd-MMM-yyyy hh:mm')
                                                          .format(newPermitListModel!
                                                              .approvedDatetime!)
                                                      : '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            spacing: 2,
                                            children: [
                                              controller.newPermitList
                                                          .firstWhere(
                                                            (e) =>
                                                                "${e?.permitId}" ==
                                                                "${newPermitListModel?.permitId}",
                                                            orElse: () =>
                                                                NewPermitModel(
                                                                    permitId:
                                                                        000),
                                                          )
                                                          ?.ptwStatus ==
                                                      PermitStatusConstants
                                                          .PTW_EXTEND_REQUESTED //133

                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          const Color.fromRGBO(
                                                              134, 196, 102, 1),
                                                      icon: Icons.check,
                                                      text: "",
                                                      onPressed: () {
                                                        controller.viewNewPermitList(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId
                                                                    .toString());
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              varUserAccessModel.value
                                                              .access_list!
                                                              .where((e) =>
                                                                  e.feature_id ==
                                                                      UserAccessConstants
                                                                          .kPermitFeatureId &&
                                                                  e.approve ==
                                                                      UserAccessConstants
                                                                          .kHaveApproveAccess)
                                                              .length >
                                                          0 &&
                                                      controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_CREATED
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          const Color.fromRGBO(
                                                              134, 196, 102, 1),
                                                      icon: Icons.check,
                                                      text: '',
                                                      onPressed: () {
                                                        controller.viewNewPermitList(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId
                                                                    .toString());
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              ///Permit Edit button
                                              varUserAccessModel.value
                                                              .access_list!
                                                              .where((e) =>
                                                                  e.feature_id ==
                                                                      UserAccessConstants
                                                                          .kPermitFeatureId &&
                                                                  e.edit ==
                                                                      UserAccessConstants
                                                                          .kHaveEditAccess)
                                                              .length >
                                                          0 &&
                                                      controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_CREATED //121
                                                  // ||
                                                  // controller.newPermitList
                                                  //         .firstWhere(
                                                  //           (e) =>
                                                  //               "${e?.permitId}" ==
                                                  //               "${newPermitListModel?.permitId}",
                                                  //           orElse: () =>
                                                  //               NewPermitModel(
                                                  //                   permitId: 000),
                                                  //         )
                                                  //         ?.ptwStatus ==
                                                  //     124
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appYellowColor,
                                                      icon: Icons.edit,
                                                      text: '',
                                                      onPressed: () {
                                                        // controller.viewNewPermitList(
                                                        //     permitId:
                                                        //         newPermitListModel?.permitId);
                                                        controller.editNewPermit(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId,
                                                            isChecked:
                                                                controller
                                                                    .isChecked
                                                                    .value);
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_APPROVE //125

                                                      &&
                                                      varUserAccessModel.value
                                                              .access_list!
                                                              .where((e) =>
                                                                  e.feature_id ==
                                                                      UserAccessConstants
                                                                          .kPermitFeatureId &&
                                                                  e.add ==
                                                                      UserAccessConstants
                                                                          .kHaveAddAccess)
                                                              .length >
                                                          0 &&
                                                      controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.tbT_Done_Check ==
                                                          0 &&
                                                      controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.requestById ==
                                                          varUserAccessModel
                                                              .value.user_id
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          Color.fromARGB(136,
                                                              107, 152, 211),
                                                      icon: Icons.golf_course,
                                                      text: '',
                                                      onPressed: () {
                                                        // controller.viewNewPermitList(
                                                        //     permitId:
                                                        //         newPermitListModel?.permitId);
                                                        controller.editNewPermit(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId,
                                                            isChecked:
                                                                controller
                                                                    .isChecked
                                                                    .value);
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_REJECTED_BY_APPROVER //124
                                                      ||
                                                      controller.newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.ptwStatus ==
                                                              PermitStatusConstants
                                                                  .PTW_CANCEL_REQUEST_APPROVED &&
                                                          varUserAccessModel
                                                                  .value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kPermitFeatureId &&
                                                                      e.add ==
                                                                          UserAccessConstants
                                                                              .kHaveAddAccess)
                                                                  .length >
                                                              0
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              116, 78, 130),
                                                      icon: Icons.ads_click,
                                                      text: '',
                                                      onPressed: () {
                                                        controller.editNewPermit(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId,
                                                            isChecked:
                                                                controller
                                                                    .isChecked
                                                                    .value);
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              ///Extend Button
                                              varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kPermitFeatureId &&
                                                                      e.edit ==
                                                                          UserAccessConstants
                                                                              .kHaveEditAccess)
                                                                  .length >
                                                              0 &&
                                                          controller
                                                                  .newPermitList
                                                                  .firstWhereOrNull(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                  )
                                                                  ?.jc_status !=
                                                              158 &&
                                                          controller
                                                                  .newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.isExpired ==
                                                              1 ||
                                                      controller.newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.requestById ==
                                                              varUserAccessModel
                                                                  .value
                                                                  .user_id &&
                                                          (controller
                                                                      .newPermitList
                                                                      .firstWhere(
                                                                        (e) =>
                                                                            "${e?.permitId}" ==
                                                                            "${newPermitListModel?.permitId}",
                                                                        orElse: () =>
                                                                            NewPermitModel(permitId: 000),
                                                                      )
                                                                      ?.ptwStatus ==
                                                                  PermitStatusConstants
                                                                      .PTW_APPROVE //125
                                                              &&
                                                              controller
                                                                      .newPermitList
                                                                      .firstWhere(
                                                                        (e) =>
                                                                            "${e?.permitId}" ==
                                                                            "${newPermitListModel?.permitId}",
                                                                        orElse: () =>
                                                                            NewPermitModel(permitId: 000),
                                                                      )
                                                                      ?.tbT_Done_Check ==
                                                                  1 &&
                                                              controller.isOneHour(controller
                                                                          .newPermitList
                                                                          .firstWhere(
                                                                            (e) =>
                                                                                "${e?.permitId}" ==
                                                                                "${newPermitListModel?.permitId}",
                                                                          )
                                                                          ?.endDate ??
                                                                      "") ==
                                                                  true
                                                          //||
                                                          // controller.newPermitList
                                                          //         .firstWhere(
                                                          //           (e) =>
                                                          //               "${e?.permitId}" ==
                                                          //               "${newPermitListModel?.permitId}",
                                                          //           orElse: () =>
                                                          //               NewPermitModel(
                                                          //                   permitId:
                                                          //                       000),
                                                          //         )
                                                          //         ?.ptwStatus ==
                                                          //     135
                                                          )
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appDarkBlueColor,
                                                      icon:
                                                          Icons.expand_outlined,
                                                      text: '',
                                                      onPressed: () {
                                                        // Get.dialog(PermitExtendDialog(
                                                        //     permitId: newPermitListModel?.permitId
                                                        //         .toString()));
                                                        controller.extendPermitList(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId);
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              ////Approve button

                                              ///Close Permit
                                              varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kPermitFeatureId &&
                                                                      e.add ==
                                                                          UserAccessConstants
                                                                              .kHaveAddAccess)
                                                                  .length >
                                                              0 &&
                                                          controller
                                                                  .newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.ptwStatus ==
                                                              PermitStatusConstants
                                                                  .PTW_CANCEL_REQUEST_REJECTED //121
                                                      ||
                                                      controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_EXTEND_REQUEST_REJECTED
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appcloseRedColor,
                                                      icon: Icons.close,
                                                      text: '',
                                                      onPressed: () {
                                                        // Get.dialog(PermitCloseDialog(
                                                        //     permitId: newPermitListModel?.permitId
                                                        //         .toString()));
                                                        controller.closePermitRequestList(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId);
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              ////Permit Cancel By Approver / Cancel Permit Request
                                              (controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus !=
                                                          PermitStatusConstants
                                                              .PTW_CANCEL_REQUEST_APPROVED) &&
                                                      controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus !=
                                                          PermitStatusConstants
                                                              .PTW_CLOSED &&
                                                      (varUserAccessModel.value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kPermitFeatureId &&
                                                                      e.approve ==
                                                                          UserAccessConstants
                                                                              .kHaveApproveAccess)
                                                                  .length >
                                                              0
                                                          //126
                                                          ||
                                                          varUserAccessModel
                                                                  .value
                                                                  .access_list!
                                                                  .where((e) =>
                                                                      e.feature_id ==
                                                                          UserAccessConstants
                                                                              .kPermitFeatureId &&
                                                                      e.edit ==
                                                                          UserAccessConstants
                                                                              .kHaveEditAccess)
                                                                  .length >
                                                              0 ||
                                                          controller
                                                                  .newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.ptwStatus ==
                                                              PermitStatusConstants
                                                                  .PTW_APPROVE //125
                                                          ||
                                                          controller
                                                                  .newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.ptwStatus ==
                                                              PermitStatusConstants
                                                                  .PTW_CREATED //121
                                                          ||
                                                          controller
                                                                  .newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.ptwStatus ==
                                                              PermitStatusConstants
                                                                  .PTW_EXTEND_REQUEST_REJECTED ||
                                                          controller
                                                                  .newPermitList
                                                                  .firstWhere(
                                                                    (e) =>
                                                                        "${e?.permitId}" ==
                                                                        "${newPermitListModel?.permitId}",
                                                                    orElse: () =>
                                                                        NewPermitModel(
                                                                            permitId:
                                                                                000),
                                                                  )
                                                                  ?.ptwStatus ==
                                                              PermitStatusConstants
                                                                  .PTW_CANCEL_REQUEST_REJECTED)
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .appRedColor,
                                                      icon: Icons.close,
                                                      text: '',
                                                      onPressed: () {
                                                        controller.cancelPermitList(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId);
                                                        // Get.dialog(PermitCancelReQuestDialog(
                                                        //     permitId: newPermitListModel?.permitId
                                                        //         .toString()));
                                                      },
                                                    )
                                                  : Dimens.box0,

                                              varUserAccessModel.value
                                                              .access_list!
                                                              .where((e) =>
                                                                  e.feature_id ==
                                                                      UserAccessConstants
                                                                          .kPermitFeatureId &&
                                                                  e.approve ==
                                                                      UserAccessConstants
                                                                          .kHaveApproveAccess)
                                                              .length >
                                                          0 &&
                                                      controller.newPermitList
                                                              .firstWhere(
                                                                (e) =>
                                                                    "${e?.permitId}" ==
                                                                    "${newPermitListModel?.permitId}",
                                                                orElse: () =>
                                                                    NewPermitModel(
                                                                        permitId:
                                                                            000),
                                                              )
                                                              ?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_CANCEL_REQUESTED //130
                                                  ? CustomElevatedButton(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              113, 15, 149),
                                                      icon: Icons
                                                          .approval_rounded,
                                                      text: '',
                                                      onPressed: () {
                                                        controller.viewNewPermitList(
                                                            permitId:
                                                                newPermitListModel
                                                                    ?.permitId
                                                                    .toString());
                                                      },
                                                    )
                                                  : Dimens.box0,
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      top: 50,
                      left: 10,
                      right: 10,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorValues.appDarkBlueColor,
                          ),
                        ),
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
                          var dropDate =
                              DateTime.parse(data.endDate.toString());
                          dropDate != null
                              ? controller.toDate.value = dropDate
                              : controller.toDate.value = pickUpDate;

                          controller.getNewPermitListByDate();
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);

                          // Get.toNamed(
                          //   Routes.stockManagementGoodsOrdersScreen,
                          // );
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);
                        },
                      ),
                    ),
                  Dimens.boxHeight10,
                ],
              )),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "created":
        return Color(0xff58c3ca);
      case "assigned":
        return Color(0xff58c352);
      case "linked":
        return Color(0xff787099);
      case "in progress":
        return Color(0xffbf8c4b);
      case "closed":
        return Color(0xff3438cd);
      case "cancelled":
        return Color(0xFFBF4844);
      default:
        return Color.fromARGB(255, 227, 223, 108);
    }
  }
}
