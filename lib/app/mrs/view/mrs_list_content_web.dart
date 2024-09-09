import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/mrs/mrs_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../constant/constant.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class MrsListContentWeb extends StatelessWidget {
  MrsListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MrsListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(() {
            // final dataSource = MrsListDataSource(controller);
            return SelectionArea(
              child: Column(children: [
                HeaderWidget(),
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
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.home);
                        },
                        child: Text(
                          "DASHBOARD",
                          style: Styles.greyLight14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.stockManagementDashboardScreen);
                        },
                        child: Text(" / STOCK MANAGEMENT",
                            style: Styles.greyLight14),
                      ),
                      Text(" / MRS LIST", style: Styles.greyLight14),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(children: [
                    Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
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
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Material Requsition Slip",
                                    style: Styles.blackBold16,
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      CustomRichText(
                                          title: 'Date Range',
                                          includeAsterisk: false),
                                      Dimens.boxWidth2,
                                      CustomTextFieldForStock(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        numberTextField: true,
                                        onTap: () {
                                          controller
                                                  .openFromDateToStartDatePicker =
                                              !controller
                                                  .openFromDateToStartDatePicker;
                                          controller
                                              .update(['stock_Mangement_Date']);
                                        },
                                        hintText:
                                            '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                      ),
                                    ],
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
                                      onPressed: () {
                                        controller.export();
                                      },
                                      text: 'Excel'),
                                ),
                                Spacer(),
                                Container(
                                  width: 300,
                                  height: 40,
                                  margin: EdgeInsets.only(right: 10),
                                  child: TextField(
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 16.0,
                                          height: 1.0,
                                          color: Colors.black),
                                    ),
                                    onChanged: (value) =>
                                        controller.search(value),
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      contentPadding: Dimens.edgeInsets05_10,
                                      hintText: 'search'.tr,
                                      hintStyle: Styles.grey16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            controller.mrsList.isEmpty == true &&
                                    controller.isLoading == false
                                ? Center(child: Text('No data'))
                                : controller.isLoading.value == true
                                    ? Center(child: Text("Data Loading......"))
                                    : Expanded(
                                        child: ValueListenableBuilder(
                                            valueListenable:
                                                controller.columnVisibility,
                                            builder: (context, value, child) {
                                              final dataSource =
                                                  MrsListDataSource(controller);

                                              return PaginatedDataTable2(
                                                // fixedLeftColumns: 1,
                                                dataRowHeight:
                                                    70, //Get.height * 0.10,
                                                columnSpacing: 10,
                                                source:
                                                    dataSource, // Custom DataSource class
                                                // headingRowHeight: Get.height * 0.12,
                                                minWidth: Get.width * 1.2,
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
                                                  for (var entry
                                                      in value.entries)
                                                    if (entry.value)
                                                      buildDataColumn(
                                                        entry.key,
                                                        controller.filterText[
                                                            entry.key]!,
                                                        controller.columnwidth[
                                                            entry.key],
                                                      ),
                                                  buildDataColumn(
                                                    'Actions',
                                                    controller.idFilterText,
                                                    200,
                                                  ),
                                                ],
                                              );
                                            }),
                                      )
                          ],
                        ),
                      ),
                    ),
                    if (controller.openFromDateToStartDatePicker)
                      Positioned(
                        right: 150,
                        top: 85,
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
                            var dropDate =
                                DateTime.parse(data.endDate.toString());
                            dropDate != null
                                ? controller.toDate.value = dropDate
                                : controller.toDate.value = pickUpDate;

                            controller.getMrsListByDate();
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
                  ]),
                ),
              ]),
            );
          });
        });
  }

  DataColumn2 buildDataColumn(
    String header,
    RxString filterText,
    double? fixedWidth,
  ) {
    return DataColumn2(
      fixedWidth: fixedWidth,
      onSort: header == "Actions" 
          ? null
          : (int columnIndex, bool ascending) {
              final controller = Get.find<MrsListController>();
              controller.sortData(header);
            },
      label: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                header,
                style: Styles.black16W500,
              ),
              if (header !=
                  "Actions") // Only show sorting icon for sortable columns
                Obx(() {
                  final controller = Get.find<MrsListController>();
                  return AnimatedRotation(
                    turns: controller.currentSortColumn.value == header
                        ? (controller.isAscending.value ? 0.5 : 0.0)
                        : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Icon(
                      Icons.expand_more,
                      size: 20,
                    ),
                  );
                }),
            ],
          ),
        ],
      ),
    );
  }
}

class MrsListDataSource extends DataTableSource {
  final MrsListController controller;

  late List<MrsListModel?> filteredMrsList;

  MrsListDataSource(this.controller) {
    filterMrss();
  }

  ///
  void filterMrss() {
    filteredMrsList = <MrsListModel?>[];
    filteredMrsList = controller.mrsList.where((Mrs) {
      return (Mrs?.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (Mrs?.requested_by_name ?? '')
              .toLowerCase()
              .contains(controller.mrsDetailFilterText.value.toLowerCase()) &&
          (Mrs?.approver_name ?? '')
              .toLowerCase()
              .contains(controller.mrsDetailFilterText.value.toLowerCase()) &&
          (Mrs?.requestd_date ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.orderDateFilterText.value.toLowerCase()) &&
          (Mrs?.whereUsedTypeId ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.whereusedFilterText.value.toLowerCase()) &&
          (Mrs?.activity ?? '')
              .toLowerCase()
              .contains(controller.activityFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredMrsList": filteredMrsList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final MrsDetails = filteredMrsList[index];

    controller.MrsId.value = MrsDetails?.id ?? 0;
    var cellsBuffer = [
      "mrsId", // '${MrsDetails?.id ?? ''}',
      "Requested by:${MrsDetails?.requested_by_name ?? ""}\nIssued by:${MrsDetails?.issued_name ?? ""}",
      '${MrsDetails?.requestd_date ?? ''}',
      '${MrsDetails?.activity ?? ''}',
      "${MrsDetails?.whereUsedType.toString().toUpperCase() == 'PMTASK' ? 'PMT' : MrsDetails?.whereUsedType.toString().toUpperCase() == 'JOBCARD' ? 'JC' : ''}${MrsDetails?.whereUsedTypeId ?? ''}",
      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'mrsId')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MRS${MrsDetails?.id}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                            color: controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () => MrsListModel(id: 00),
                                        )
                                        ?.status ==
                                    322
                                ? ColorValues.rejectedStatusColor
                                : controller.mrsList
                                            .firstWhere(
                                              (e) => e?.id == MrsDetails!.id,
                                              orElse: () =>
                                                  MrsListModel(id: 00),
                                            )
                                            ?.status ==
                                        321
                                    ? ColorValues.submitColor
                                    : controller.mrsList
                                                .firstWhere(
                                                  (e) =>
                                                      e?.id == MrsDetails!.id,
                                                  orElse: () =>
                                                      MrsListModel(id: 00),
                                                )
                                                ?.status ==
                                            323
                                        ? ColorValues.appLightBlueColor
                                        : controller.mrsList
                                                    .firstWhere(
                                                      (e) =>
                                                          e?.id ==
                                                          MrsDetails!.id,
                                                      orElse: () =>
                                                          MrsListModel(id: 00),
                                                    )
                                                    ?.status ==
                                                324
                                            ? ColorValues.issueStatusColor
                                            : controller.mrsList
                                                        .firstWhere(
                                                          (e) =>
                                                              e?.id ==
                                                              MrsDetails!.id,
                                                          orElse: () =>
                                                              MrsListModel(
                                                                  id: 00),
                                                        )
                                                        ?.status ==
                                                    326
                                                ? ColorValues.appYellowColor
                                                : controller.mrsList
                                                            .firstWhere(
                                                              (e) =>
                                                                  e?.id ==
                                                                  MrsDetails!
                                                                      .id,
                                                              orElse: () =>
                                                                  MrsListModel(
                                                                      id: 00),
                                                            )
                                                            ?.status ==
                                                        325
                                                    ? ColorValues
                                                        .rejectedStatusColor
                                                    : ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${MrsDetails?.status_short}',
                            style: Styles.white10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        TableActionButton(
                          color: ColorValues.viewColor,
                          icon: Icons.remove_red_eye_outlined,
                          message: "View",
                          onPress: () {
                            controller.clearStoreData();

                            // final _flutterSecureStorage =
                            //     const FlutterSecureStorage();

                            // _flutterSecureStorage.delete(key: "mrsId");
                            int mrsId = MrsDetails?.id ?? 0;
                            Get.toNamed(Routes.mrsApprovalScreen,
                                arguments: {'mrsId': mrsId, 'type': 0});
                          },
                        ),

                        varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kMrsFeatureId &&
                                            e.edit ==
                                                UserAccessConstants
                                                    .kHaveEditAccess)
                                        .length >
                                    0 &&
                                controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () => MrsListModel(id: 00),
                                        )
                                        ?.status ==
                                    321
                            ? TableActionButton(
                                color: ColorValues.editColor,
                                icon: Icons.edit,
                                message: 'edit',
                                onPress: () {
                                  controller.clearStoreData();

                                  // final _flutterSecureStorage =
                                  //     const FlutterSecureStorage();

                                  // _flutterSecureStorage.delete(key: "mrsId");
                                  int mrsId = MrsDetails?.id ?? 0;
                                  Get.toNamed(Routes.editMrs,
                                      arguments: {'mrsId': mrsId, 'type': 0});
                                })
                            : Dimens.box0,
                        // controller.mrsList
                        //                 .firstWhere(
                        //                   (e) => e?.id == MrsDetails!.id,
                        //                   orElse: () => MrsListModel(id: 00),
                        //                 )
                        //                 ?.status ==
                        //             321 &&
                        //         varUserAccessModel.value.access_list!
                        //                 .where((e) =>
                        //                     e.feature_id ==
                        //                         UserAccessConstants
                        //                             .kMrsFeatureId &&
                        //                     e.approve ==
                        //                         UserAccessConstants
                        //                             .kHaveApproveAccess)
                        //                 .length >
                        //             0
                        //     ? TableActionButton(
                        //         color: ColorValues.approveColor,
                        //         icon: Icons.check,
                        //         message: 'Approve',
                        //         onPress: () {
                        //           controller.clearStoreData();

                        //           // final _flutterSecureStorage =
                        //           //     const FlutterSecureStorage();

                        //           // _flutterSecureStorage.delete(key: "mrsId");
                        //           int mrsId = MrsDetails?.id ?? 0;
                        //           Get.toNamed(Routes.mrsApprovalScreen,
                        //               arguments: {'mrsId': mrsId});
                        //         },
                        //       )
                        //     : Dimens.box0,
                        controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () => MrsListModel(id: 00),
                                        )
                                        ?.status ==
                                    323 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kMrsFeatureId &&
                                            e.issue ==
                                                UserAccessConstants
                                                    .kHaveIssueAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.issueColor,
                                icon: Icons.report,
                                message: 'Issue',
                                onPress: () {
                                  controller.clearStoreData();

                                  // final _flutterSecureStorage =
                                  //     const FlutterSecureStorage();

                                  // _flutterSecureStorage.delete(key: "mrsId");
                                  int mrsId = MrsDetails?.id ?? 0;
                                  Get.toNamed(Routes.mrsIssueScreen,
                                      arguments: {'mrsId': mrsId, 'type': 0});
                                },
                              )
                            : Dimens.box0,
                        // controller.mrsList
                        //                 .firstWhere(
                        //                   (e) => e?.id == MrsDetails!.id,
                        //                   orElse: () => MrsListModel(id: 00),
                        //                 )
                        //                 ?.status ==
                        //             321 &&
                        //         varUserAccessModel.value.access_list!
                        //                 .where((e) =>
                        //                     e.feature_id ==
                        //                         UserAccessConstants
                        //                             .kMrsFeatureId &&
                        //                     e.approve ==
                        //                         UserAccessConstants
                        //                             .kHaveApproveAccess)
                        //                 .length >
                        //             0
                        //     ? TableActionButton(
                        //         color: ColorValues.rejectColor,
                        //         icon: Icons.close,
                        //         message: 'Reject',
                        //         onPress: () {
                        //           controller.clearStoreData();

                        //           // final _flutterSecureStorage =
                        //           //     const FlutterSecureStorage();

                        //           // _flutterSecureStorage.delete(key: "mrsId");
                        //           int mrsId = MrsDetails?.id ?? 0;
                        //           Get.toNamed(Routes.mrsApprovalScreen,
                        //               arguments: {'mrsId': mrsId});
                        //         },
                        //       )
                        //     : Dimens.box0,
                        // controller.mrsList
                        //                 .firstWhere(
                        //                   (e) => e?.id == MrsDetails!.id,
                        //                   orElse: () => MrsListModel(id: 00),
                        //                 )
                        //                 ?.status ==
                        //             324 &&
                        //         varUserAccessModel.value.access_list!
                        //                 .where((e) =>
                        //                     e.feature_id ==
                        //                         UserAccessConstants
                        //                             .kMrsFeatureId &&
                        //                     e.approve ==
                        //                         UserAccessConstants
                        //                             .kHaveApproveAccess)
                        //                 .length >
                        //             0
                        //     ? TableActionButton(
                        //         color: ColorValues.approveColor,
                        //         icon: Icons.check,
                        //         message: 'approval',
                        //         onPress: () {
                        //           controller.clearStoreData();

                        //           // final _flutterSecureStorage =
                        //           //     const FlutterSecureStorage();

                        //           // _flutterSecureStorage.delete(key: "mrsId");
                        //           int mrsId = MrsDetails?.id ?? 0;
                        //           Get.toNamed(Routes.issueMrsApprove,
                        //               arguments: {'mrsId': mrsId});
                        //         },
                        //       )
                        //     : Dimens.box0,
                        // controller.mrsList
                        //                 .firstWhere(
                        //                   (e) => e?.id == MrsDetails!.id,
                        //                   orElse: () => MrsListModel(id: 00),
                        //                 )
                        //                 ?.status ==
                        //             324 &&
                        //         varUserAccessModel.value.access_list!
                        //                 .where((e) =>
                        //                     e.feature_id ==
                        //                         UserAccessConstants
                        //                             .kMrsFeatureId &&
                        //                     e.issue ==
                        //                         UserAccessConstants
                        //                             .kHaveIssueAccess)
                        //                 .length >
                        //             0
                        //     ? TableActionButton(
                        //         color: ColorValues.rejectColor,
                        //         icon: Icons.close_fullscreen,
                        //         message: 'issue',
                        //         onPress: () {
                        //           controller.clearStoreData();

                        //           // final _flutterSecureStorage =
                        //           //     const FlutterSecureStorage();

                        //           // _flutterSecureStorage.delete(key: "mrsId");
                        //           int mrsId = MrsDetails?.id ?? 0;
                        //           Get.toNamed(Routes.issueMrsApprove,
                        //               arguments: {'mrsId': mrsId});
                        //         },
                        //       )
                        //     : Dimens.box0,
                        controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () => MrsListModel(id: 00),
                                        )
                                        ?.status ==
                                    326 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kMrsFeatureId &&
                                            e.issue ==
                                                UserAccessConstants
                                                    .kHaveIssueAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.appLightBlueColor,
                                icon: Icons.keyboard_return_outlined,
                                message: 'Return Mrs',
                                onPress: () {
                                  controller.clearStoreData();
                                  controller.clearTypeValue();
                                  controller.clearJobIdStoreData();
                                  controller.clearStoreTaskData();
                                  controller.clearStoreTaskActivityData();
                                  controller.clearStoreTasktoActorData();
                                  controller.clearStoreTaskWhereUsedData();
                                  controller.clearStoreTaskfromActorData();
                                  Get.toNamed(Routes.mrsReturnScreen,
                                      arguments: {
                                        "whereUsed":
                                            MrsDetails?.whereUsedType ==
                                                    "PMTASK"
                                                ? 27
                                                : 4,
                                        "fromActorTypeId":
                                            MrsDetails?.whereUsedType ==
                                                    "PMTASK"
                                                ? 3
                                                : 4,
                                        "to_actor_type_id": 2,
                                        "pmTaskId":
                                            MrsDetails?.whereUsedTypeId ?? 0,
                                        "activity": MrsDetails?.activity ?? '',
                                        "mrsId": MrsDetails?.id ?? 0,
                                        "type": 0,
                                      });
                                },
                              )
                            : Dimens.box0,
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();

        // final _flutterSecureStorage = const FlutterSecureStorage();

        // _flutterSecureStorage.delete(key: "mrsId");
        Get.toNamed(
          Routes.mrsApprovalScreen,
          arguments: {'mrsId': MrsDetails?.id, 'type': 0},
        );
      },
    );
  }

  @override
  int get rowCount => filteredMrsList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
