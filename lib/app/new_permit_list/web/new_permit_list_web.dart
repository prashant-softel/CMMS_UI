import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/permit_close_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_dialog.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../utils/user_access_constants.dart';
import '../../widgets/action_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../new_permit_list_controller.dart';

class NewPermitListWeb extends StatefulWidget {
  NewPermitListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPermitListWeb> createState() => _NewPermitListWebState();
}

class _NewPermitListWebState extends State<NewPermitListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPermitListController>(
        id: 'job_list',
        builder: (controller) {
          return Obx(() {
            final dataSource = PermitListDataSource(controller);

            return Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 227, 224, 224),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        child: Text(" / BREAKDOWN MAINTAINANCE",
                            style: Styles.greyMediumLight12),
                      ),
                      Text(" / NEW PERMIT LIST",
                          style: Styles.greyMediumLight12),
                    ],
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Container(
                        width: Get.width * 7,
                        height: Get.height,
                        child: Card(
                          color: Color.fromARGB(255, 245, 248, 250),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "New Permit List ",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      ActionButton(
                                        icon: Icons.add,
                                        label: "Add New",
                                        onPressed: () {
                                          Get.toNamed(Routes.newPermit);
                                        },
                                        color: ColorValues.greenlightColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Row(
                                  children: [
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
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Copy'),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'Excel'),
                                    ),
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appLightBlueColor,
                                          onPressed: () {},
                                          text: 'PDF'),
                                    ),
                                    Spacer(),
                                    Container(
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
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          contentPadding:
                                              Dimens.edgeInsets10_0_0_0,
                                          hintText: 'search'.tr,
                                          hintStyle: Styles.grey12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                controller.newPermitList.isEmpty == true
                                    ? Center(child: Text('No data'))
                                    : Expanded(
                                        child: PaginatedDataTable2(
                                          columnSpacing: 10,
                                          dataRowHeight: Get.height * 0.12,

                                          source:
                                              dataSource, // Custom DataSource class
                                          headingRowHeight: Get.height * 0.12,
                                          minWidth: 20000, //Get.width * 1.2,
                                          showCheckboxColumn: false,
                                          rowsPerPage:
                                              10, // Number of rows per page
                                          availableRowsPerPage: [
                                            10,
                                            20,
                                            30,
                                            50
                                          ],
                                          columns: [
                                            buildDataColumn(
                                              'PermitId',
                                              'Permit Id',
                                              //  ColumnSize.S,
                                              controller.PermitIdFilterText,
                                              130,
                                            ),
                                            buildDataColumn(
                                              'PermitTypeName',
                                              'Title',
                                              //  ColumnSize.S,
                                              controller
                                                  .PermitTypeNameFilterText,
                                              200,
                                            ),
                                            buildDataColumn(
                                                "Description",
                                                "Description",
                                                // ColumnSize.M,
                                                controller
                                                    .DescriptionFilterText,
                                                200),
                                            buildDataColumn(
                                              'EquipmentCategories',
                                              'Equipment',
                                              //  ColumnSize.S,
                                              controller
                                                  .EquipmentCategoriesFilterText,
                                              130,
                                            ),
                                            buildDataColumn(
                                                "WorkingAreaName",
                                                "Working Area Name", // ColumnSize.L,
                                                controller
                                                    .WorkingAreaNameFilterText,
                                                200),
                                            buildDataColumn(
                                                "RequestByName",
                                                "Requested By",
                                                // ColumnSize.L,
                                                controller
                                                    .RequestByNameFilterText,
                                                200),
                                            buildDataColumn(
                                                "ApprovedByName",
                                                "Approved By",
                                                // ColumnSize.L,
                                                controller
                                                    .ApprovedByNameFilterText,
                                                200),
                                            buildDataColumn(
                                                "CurrentStatusShort",
                                                "Status",
                                                // ColumnSize.L,
                                                controller
                                                    .CurrentStatusShortFilterText,
                                                200),
                                            buildDataColumn(
                                                'Action'.tr,
                                                'Actions',
                                                // ColumnSize.L,
                                                controller.ActionFilterText,
                                                200),
                                          ],
                                        ),
                                      )
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  DataColumn2 buildDataColumn(
    String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            SizedBox(
              height: Get.height * 0.05,
              child: TextField(
                onChanged: (value) {
                  filterText.value = value;
                },
                textAlign: TextAlign.left,
                style: TextStyle(height: 1.0),
                decoration: InputDecoration(
                  hintText: 'Filter',
                  contentPadding: EdgeInsets.fromLTRB(
                      5, 0, 5, 0), // Reduced vertical padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: Styles.black16W500,
              ),
            ),
          ]),
      // ),
    );
  }
}

class PermitListDataSource extends DataTableSource {
  final NewPermitListController controller;

  late List<NewPermitModel?> filteredNewPermitList;

  PermitListDataSource(this.controller) {
    filterUsers();
  }

  ///
  void filterUsers() {
    filteredNewPermitList = <NewPermitModel?>[];
    filteredNewPermitList = controller.newPermitList.where((NewPermit) {
      return (NewPermit?.permitId ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.PermitIdFilterText.value.toLowerCase()) &&
          (NewPermit?.description ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.DescriptionFilterText.value.toLowerCase()) &&
          (NewPermit?.permitType ?? '').toString().toLowerCase().contains(
              controller.PermitTypeNameFilterText.value.toLowerCase()) &&
          (NewPermit?.equipment_categories ?? '').toLowerCase().contains(
              controller.EquipmentCategoriesFilterText.value.toLowerCase()) &&
          (NewPermit?.description ?? '')
              .toLowerCase()
              .contains(controller.DescriptionFilterText.value.toLowerCase()) &&
          (NewPermit?.workingAreaName ?? '').toString().toLowerCase().contains(
              controller.WorkingAreaNameFilterText.value.toLowerCase()) &&
          (NewPermit?.requestByName ?? '').toString().toLowerCase().contains(
              controller.RequestByNameFilterText.value.toLowerCase()) &&
          (NewPermit?.approvedByName ?? '').toString().toLowerCase().contains(
              controller.ApprovedByNameFilterText.value.toLowerCase()) &&
          (NewPermit?.current_status_short ?? '').toString().toLowerCase().contains(
              controller.CurrentStatusShortFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final PermitDetails = filteredNewPermitList[index];

    controller.permitId.value = PermitDetails?.permitId ?? 0;

    return DataRow.byIndex(index: index, cells: [
      DataCell(
        Text(
          '${PermitDetails?.permitId ?? ''}',
        ),
      ),
      DataCell(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${PermitDetails?.permitTypeName ?? ''}',
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: controller.newPermitList
                                .firstWhere(
                                  (e) =>
                                      "${e?.permitId}" ==
                                      PermitDetails?.permitId,
                                  orElse: () => NewPermitModel(permitId: 000),
                                )
                                ?.ptwStatus ==
                            121 ||
                        controller.newPermitList
                                .firstWhere(
                                  (e) =>
                                      "${e?.permitId}" ==
                                      PermitDetails?.permitId,
                                  orElse: () => NewPermitModel(permitId: 000),
                                )
                                ?.ptwStatus ==
                            125
                    ? ColorValues.appGreenColor
                    : ColorValues.appRedColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                  //'${jobDetails?.status ?? ''}
                  ' ${PermitDetails?.current_status_short ?? ''}'),
            ),
          ],
        ),
      ),

      // '${PermitDetails?.id ?? ''}',
      ...[
        '${PermitDetails?.description ?? ''}',
        '${PermitDetails?.equipment_categories ?? ''}',
        '${PermitDetails?.workingAreaName ?? ''}',
        '${PermitDetails?.requestByName ?? ''}',
        '${PermitDetails?.requestDatetime ?? ''}',
        '${PermitDetails?.current_status_short ?? ''}',
        'Actions',
      ].map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'Actions')
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kPermitFeatureId &&
                                          e.view ==
                                              UserAccessConstants
                                                  .kHaveViewAccess)
                                      .length >
                                  0
                              ? TableActionButton(
                                  color: ColorValues.appDarkBlueColor,
                                  icon: Icons.visibility,
                                  message: 'View',
                                  onPress: () {
                                    controller.viewNewPermitList(
                                        permitId: PermitDetails?.permitId);
                                  },
                                )
                              : Container(),

                          varUserAccessModel.value.access_list!
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
                                                PermitDetails?.permitId,
                                            orElse: () =>
                                                NewPermitModel(permitId: 000),
                                          )
                                          ?.ptwStatus ==
                                      121
                              ? TableActionButton(
                                  color: ColorValues.appGreenColor,
                                  icon: Icons.add,
                                  message: 'Approve/Reject',
                                  onPress: () {
                                    controller.viewNewPermitList(
                                        permitId: PermitDetails?.permitId);
                                  },
                                )
                              : Container(),

                          ///Permit Edit button
                          varUserAccessModel.value.access_list!
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
                                                PermitDetails?.permitId,
                                            orElse: () =>
                                                NewPermitModel(permitId: 000),
                                          )
                                          ?.ptwStatus ==
                                      124
                              ? TableActionButton(
                                  color: ColorValues.appYellowColor,
                                  icon: Icons.edit,
                                  message: 'Edit',
                                  onPress: () {
                                    controller.editNewPermit(
                                        permitId: PermitDetails?.permitId,
                                        isChecked: controller.isChecked.value);
                                    print(
                                        'PermitTest:${controller.newPermitListModel?.permitId}');
                                  },
                                )
                              : Container(),

                          controller.newPermitList
                                          .firstWhere(
                                            (e) =>
                                                "${e?.permitId}" ==
                                                PermitDetails?.permitId,
                                            orElse: () =>
                                                NewPermitModel(permitId: 000),
                                          )
                                          ?.isExpired ==
                                      1 ||
                                  controller.newPermitList
                                              .firstWhere(
                                                (e) =>
                                                    "${e?.permitId}" ==
                                                    PermitDetails?.permitId,
                                                orElse: () => NewPermitModel(
                                                    permitId: 000),
                                              )
                                              ?.requestById ==
                                          varUserAccessModel.value.user_id &&
                                      (controller.newPermitList
                                                  .firstWhere(
                                                    (e) =>
                                                        "${e?.permitId}" ==
                                                        PermitDetails?.permitId,
                                                    orElse: () =>
                                                        NewPermitModel(
                                                            permitId: 000),
                                                  )
                                                  ?.ptwStatus ==
                                              125 ||
                                          controller.newPermitList
                                                  .firstWhere(
                                                    (e) =>
                                                        "${e?.permitId}" ==
                                                        PermitDetails?.permitId,
                                                    orElse: () =>
                                                        NewPermitModel(
                                                            permitId: 000),
                                                  )
                                                  ?.ptwStatus ==
                                              135)
                              ? TableActionButton(
                                  color: ColorValues.appDarkBlueColor,
                                  icon: Icons.expand_outlined,
                                  message: 'Extend',
                                  onPress: () {
                                    Get.dialog(PermitExtendDialog(
                                        permitId: PermitDetails?.permitId
                                            .toString()));
                                  },
                                )
                              : Container(),

                          ////Approve button

                          ///Close Permit
                          varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kPermitFeatureId &&
                                          e.add ==
                                              UserAccessConstants
                                                  .kHaveAddAccess)
                                      .length >
                                  0
                              ? TableActionButton(
                                  color: ColorValues.appcloseRedColor,
                                  icon: Icons.close,
                                  message: 'Close Permit',
                                  onPress: () {
                                    Get.dialog(PermitCloseDialog(
                                        permitId: PermitDetails?.permitId
                                            .toString()));
                                  },
                                )
                              : Container(),

                          ////Permit Cancel By Approver / Cancel Permit Request
                          varUserAccessModel.value.access_list!
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
                                                PermitDetails?.permitId,
                                            orElse: () =>
                                                NewPermitModel(permitId: 000),
                                          )
                                          ?.ptwStatus ==
                                      123
                              ? TableActionButton(
                                  color: ColorValues.appRedColor,
                                  icon: Icons.close,
                                  message: 'Cancel By Approver',
                                  onPress: () {
                                    controller.viewNewPermitList(
                                        permitId: PermitDetails?.permitId);
                                  },
                                )
                              : TableActionButton(
                                  color: ColorValues.appRedColor,
                                  icon: Icons.close,
                                  message: 'Cancel Permit Request',
                                  onPress: () {
                                    Get.dialog(PermitCancelReQuestDialog(
                                        permitId: PermitDetails?.permitId
                                            .toString()));
                                  },
                                ),
                        ],
                      ),

                      ///Checkbox
                      controller.newPermitList
                                  .firstWhere(
                                    (e) =>
                                        "${e?.permitId}" ==
                                        PermitDetails?.permitId,
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
                                    print(
                                        'Checkbox Value:${controller.isChecked.value}');
                                  },
                                ),
                                Text('Re-Submit for approval'),
                              ],
                            )
                          : Container(),
                    ],
                  )
                : Text(value.toString()),
          ),
        );
      }).toList(),
    ]);
  }

  @override
  int get rowCount => filteredNewPermitList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
