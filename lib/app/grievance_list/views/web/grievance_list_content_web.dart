import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/grievance_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/table_action_button.dart';
import '../../grievance_list_controller.dart';

class GrievanceListContentWeb extends StatelessWidget {
  GrievanceListContentWeb({Key? key});

  ///
  @override
  Widget build(BuildContext context) {
    ///
    final controller = Get.find<GrievanceController>();
    return //
        Obx(() {
      final dataSource = GrievanceDataSource(controller);

      return Column(children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 227, 224, 224),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                child: Text(" / BREAKDOWN MAINTANACE",
                    style: Styles.greyMediumLight12),
              ),
              Text(" / JOB LIST", style: Styles.greyMediumLight12),
            ],
          ),
        ),

        // CustomAppBar(
        //   title: 'Grievance List',
        //   action: Row(children: [
        //     // ActionButton(
        //     //   icon: Icons.download,
        //     //   label: 'BM Report',
        //     //   onPressed: () {
        //     //     if (kIsWeb) {
        //     //       controller.exportToExcelWeb();
        //     //     }
        //     //   },
        //     //   color: ColorValues.appYellowColor,
        //     // ),
        //     // Dimens.boxWidth10,
        //     // ActionButton(
        //     //   icon: Icons.upload,
        //     //   label: 'Pending Grievances',
        //     //   onPressed: () {},
        //     //   color: ColorValues.appDarkBlueColor.withOpacity(0.3),
        //     // ),
        //     // Dimens.boxWidth10,
        //     // ActionButton(
        //     //   icon: Icons.add,
        //     //   label: 'Created By Me'.tr,
        //     //   onPressed: () {},
        //     //   color: ColorValues.appLightBlueColor,
        //     // ),
        //     // Dimens.boxWidth10,
        //     // ActionButton(
        //     //   icon: Icons.close,
        //     //   label: 'Assigned To Me'.tr,
        //     //   onPressed: () async {},
        //     //   color: ColorValues.appGreenColor,
        //     // ),
        //     Dimens.boxWidth10,
        //     varUserAccessModel.value.access_list!
        //                 .where((e) => e.feature_id == 2 && e.add == 1)
        //                 .length >
        //             0
        //         ? ActionButton(
        //             icon: Icons.upload,
        //             label: 'Add New Grievance',
        //             onPressed: () {
        //               controller.goToAddGrievanceScreen();
        //             },
        //             color: ColorValues.appDarkBlueColor,
        //           )
        //         : Container(),
        //     Dimens.boxWidth10,
        //   ]),
        // ),

        //  Obx(() {
        Expanded(
          child: Container(
            // width: Get.width * 7,
            margin: EdgeInsets.all(10),
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
                              "Grievance List ",
                              style: Styles.blackBold16,
                            ),
                            Spacer(),
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id == 2 && e.add == 1)
                                        .length >
                                    0
                                ? ActionButton(
                                    icon: Icons.add,
                                    label: "Add New",
                                    onPressed: () {
                                      controller.clearStoreData();

                                      controller.goToAddGrievanceScreen();
                                    },
                                    color: ColorValues.addNewColor,
                                  )
                                : Dimens.box0
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
                              backgroundColor: ColorValues.appLightBlueColor,
                              onPressed: () {},
                              text: 'columnVisibility'.tr,
                            ),
                          ),
                          Container(
                            height: 35,
                            margin: EdgeInsets.only(left: 10),
                            child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'Copy'),
                          ),
                          Container(
                            height: 35,
                            margin: EdgeInsets.only(left: 10),
                            child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'Excel'),
                          ),
                          Container(
                            height: 35,
                            margin: EdgeInsets.only(left: 10),
                            child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () {},
                                text: 'PDF'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      controller.grievanceList.isEmpty == true
                          ? Center(child: Text('No data'))
                          : Expanded(
                              child: PaginatedDataTable2(
                                //fixedLeftColumns: 1,
                                dataRowHeight: 105, // Get.height * 0.12,
                                columnSpacing: 10,
                                source: dataSource, // Custom DataSource class
                                headingRowHeight: Get.height * 0.12,
                                minWidth: 20000, //Get.width * 1.2,
                                showCheckboxColumn: false,
                                //  rowsPerPage: 10, // Number of rows per page
                                //    availableRowsPerPage: [10, 20, 30, 50],
                                columns: [
                                  buildDataColumn(
                                    'id',
                                    'ID',
                                    //  ColumnSize.S,
                                    controller.idFilterText,
                                    100,
                                  ),
                                  buildDataColumn(
                                      'facilityId',
                                      'Facility Id',
                                      // ColumnSize.M,
                                      controller.facilityIdFilterText,
                                      150),
                                  buildDataColumn(
                                      'Grievance ID',
                                      'Grievance',
                                      // ColumnSize.L,
                                      controller.grievanceTypeIdFilterText,
                                      150),
                                  buildDataColumn(
                                      'Grievance Name',
                                      'Grievance Name',
                                      // ColumnSize.L,
                                      controller.grievanceTypeFilterText,
                                      170),
                                  buildDataColumn(
                                      'description',
                                      'Description',
                                      // ColumnSize.L,
                                      controller.descriptionFilterText,
                                      170),
                                  buildDataColumn(
                                      'concern',
                                      'Concern',
                                      // ColumnSize.L,
                                      controller.concernFilterText,
                                      150),
                                  buildDataColumn(
                                      'resolutionLevel',
                                      'Resolution Level',
                                      // ColumnSize.S,
                                      controller.resolutionFilterText,
                                      100),
                                  buildDataColumn('close date', 'Close Date',
                                      controller.closeDateFilterText, 100),
                                  buildDataColumn(
                                      'status id',
                                      'Status ID',
                                      // ColumnSize.S,
                                      controller.statusIdFilterText,
                                      150),
                                  buildDataColumn(
                                      'status short',
                                      'Status Short',
                                      // ColumnSize.L,
                                      controller.statusShortFilterText,
                                      150),
                                  buildDataColumn(
                                      'status long',
                                      'Status Long',
                                      // ColumnSize.L,
                                      controller.statusLongFilterText,
                                      150),
                                  buildDataColumn(
                                      'created by',
                                      'Created By',
                                      // ColumnSize.S,
                                      controller.createdByFilterText,
                                      150),
                                  buildDataColumn(
                                      'created by name',
                                      'Created By Name',
                                      // ColumnSize.S,
                                      controller.createdByNameFilterText,
                                      150),
                                  buildDataColumn(
                                      'created at',
                                      'Created At',
                                      // ColumnSize.S,
                                      controller.createdAtFilterText,
                                      150),
                                  buildDataColumn(
                                      'updated by',
                                      'Updated By',
                                      // ColumnSize.S,
                                      controller.updatedByFilterText,
                                      150),
                                  buildDataColumn(
                                      'updated by name',
                                      'Updated By Name',
                                      // ColumnSize.S,
                                      controller.updatedByNameFilterText,
                                      150),
                                  buildDataColumn(
                                      'updated at',
                                      'Updated At',
                                      // ColumnSize.S,
                                      controller.updatedAtFilterText,
                                      150),
                                  buildDataColumn(
                                      'status short',
                                      'Status Short',
                                      // ColumnSize.S,
                                      controller.statusShortFilterText,
                                      150),
                                  buildDataColumn(
                                      'deleted at',
                                      'Deleted At',
                                      // ColumnSize.S,
                                      controller.deletedAtFilterText,
                                      150),
                                  buildDataColumn(
                                      'deleted by',
                                      'Deleted By',
                                      // ColumnSize.S,
                                      controller.deletedByFilterText,
                                      150),
                                  buildDataColumn(
                                      'deleted by name',
                                      'deleted By Name',
                                      // ColumnSize.S,
                                      controller.deletedByNameFilterText,
                                      150),
                                  buildDataColumn(
                                      'added by',
                                      'added By',
                                      // ColumnSize.S,
                                      controller.deletedByNameFilterText,
                                      150),
                                  buildDataColumn(
                                      'added at',
                                      'added At',
                                      // ColumnSize.S,
                                      controller.addedAtFilterText,
                                      150),
                                ],
                              ),
                            )
                      //}),
                    ])),
          ),
        ),
      ]);
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
                style: Styles.black15W400,
              ),
            ),
          ]),
      // ),
    );
  }
}

class GrievanceDataSource extends DataTableSource {
  final GrievanceController controller;

  late List<GrievanceModel?> filteredGrievanceList;

  GrievanceDataSource(this.controller) {
    filterGrievances();
  }

  ///
  void filterGrievances() {
    filteredGrievanceList = <GrievanceModel?>[];
    filteredGrievanceList = controller.grievanceList.where((grievance) {
      return (grievance?.id ?? '').toString().toLowerCase().contains(controller.idFilterText.value.toLowerCase()) &&
          (grievance?.facilityId ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.facilityIdFilterText.value.toLowerCase()) &&
          (grievance?.grievanceTypeId ?? '').toString().toLowerCase().contains(
              controller.grievanceTypeIdFilterText.value.toLowerCase()) &&
          (grievance?.grievanceType ?? '').toString().toLowerCase().contains(
              controller.grievanceTypeFilterText.value.toLowerCase()) &&
          (grievance?.description ?? '')
              .toLowerCase()
              .contains(controller.descriptionFilterText.value.toLowerCase()) &&
          (grievance?.concern ?? '')
              .toLowerCase()
              .contains(controller.concernFilterText.value.toLowerCase()) &&
          (grievance?.actionTaken ?? '')
              .toLowerCase()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (grievance?.resolutionLevel ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.resolutionFilterText.value.toLowerCase()) &&
          (grievance?.closeDate ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.closeDateFilterText.value.toLowerCase()) &&
          (grievance?.statusId.toString() ?? '')
              .toLowerCase()
              .contains(controller.statusIdFilterText.value.toLowerCase()) &&
          (grievance?.statusShort ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.statusShortFilterText.value.toLowerCase()) &&
          (grievance?.statusLong ?? '')
              .toString()
              .contains(controller.statusLongFilterText.value.toLowerCase()) &&
          (grievance?.createdBy ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.statusLongFilterText.value.toLowerCase()) &&
          (grievance?.createdByName ?? '').toString().toLowerCase().contains(controller.createdByFilterText.value.toLowerCase()) &&
          (grievance?.createdAt ?? '').toString().toLowerCase().contains(controller.createdAtFilterText.value.toLowerCase()) &&
          (grievance?.updatedBy ?? '').toString().toLowerCase().contains(controller.updatedByFilterText.value.toLowerCase()) &&
          (grievance?.updatedByName ?? '').toString().toLowerCase().contains(controller.updatedByNameFilterText.value.toLowerCase()) &&
          (grievance?.updatedAt ?? '').toString().toLowerCase().contains(controller.updatedAtFilterText.value.toLowerCase()) &&
          (grievance?.status_short ?? '').toString().toLowerCase().contains(controller.status_shortFilterText.value.toLowerCase()) &&
          (grievance?.deletedAt ?? '').toString().toLowerCase().contains(controller.deletedAtFilterText.value.toLowerCase()) &&
          (grievance?.deletedBy ?? '').toString().toLowerCase().contains(controller.deletedByFilterText.value.toLowerCase()) &&
          (grievance?.deletedByName ?? '').toString().toLowerCase().contains(controller.deletedByNameFilterText.value.toLowerCase()) &&
          (grievance?.addedBy ?? '').toString().toLowerCase().contains(controller.deletedByFilterText.value.toLowerCase()) &&
          (grievance?.addedAt ?? '').toString().toLowerCase().contains(controller.addedAtFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final grievanceDetails = filteredGrievanceList[index];

    controller.grievanceId.value = grievanceDetails?.facilityId ?? 0;
    // var _statusString =
    //     GrievanceStatusData.getStatusStringFromStatusEnumValue(grievanceDetails?.status);

    ///
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(
            '${grievanceDetails?.facilityId ?? ''}',
          ),
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${grievanceDetails?.grievanceType ?? ''}'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: grievanceDetails?.status == 101
                      ? ColorValues.createdColor
                      : grievanceDetails?.status == 102
                          ? ColorValues.assignStatusColor
                          : grievanceDetails?.statusId == 151
                              ? ColorValues.createsColor
                              : grievanceDetails?.statusId == 152
                                  ? ColorValues.startColor
                                  : grievanceDetails?.statusId == 153
                                      ? Color.fromARGB(255, 181, 129, 179)
                                      : grievanceDetails?.statusId == 155
                                          ? ColorValues
                                              .waitingForApproveStatusColor
                                          : ColorValues.lightBlueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: grievanceDetails?.status == 101
                    ? Text(" Grievance Created")
                    : grievanceDetails?.status == 102
                        ? Text("Grievance Assigned")
                        :
                        //         : grievanceDetails?.status == 103
                        //             ? Text('${grievanceDetails?.latestJCStatusShort ?? ''}')
                        //    :
                        Text(
                            //'${grievanceDetails?.status ?? ''}
                            ' ${grievanceDetails?.statusId ?? ''}'),
              ),
              Text(
                '${controller.formatDate(grievanceDetails?.grievanceType?.toString() ?? '')}',
              ),
            ],
          ),
        ),
        ...[
          '${controller.formatDate(grievanceDetails?.createdAt?.toString() ?? '')}',
          '${grievanceDetails?.facilityId ?? ''}',
          '${grievanceDetails?.grievanceType ?? ''}',
          '${grievanceDetails?.description ?? ''}',
          '${grievanceDetails?.actionTaken ?? ''}',
          '${grievanceDetails?.concern ?? ''}',
          'Actions',
        ].map((value) {
          return DataCell(
            Padding(
              padding: EdgeInsets.zero,
              child: (value == 'Actions')
                  ? Wrap(children: [
                      TableActionButton(
                        color: ColorValues.viewColor,
                        icon: Icons.visibility,
                        message: 'View',
                        onPress: () {
                          controller.clearStoreData();

                          controller.goToGrievanceDetailsScreen(
                            int.tryParse('${grievanceDetails?.id}'),
                          );
                        },
                      ),
                      if (grievanceDetails?.status == 102)
                        TableActionButton(
                          color: ColorValues.appYellowColor,
                          icon: Icons.assignment_ind,
                          message: 'Re-Assign',
                          onPress: () {
                            controller.clearStoreData();

                            controller.goToEditGrievanceScreen(
                                int.tryParse('${grievanceDetails?.id}'));
                          },
                        ),
                      if (grievanceDetails?.status == 101)
                        TableActionButton(
                          color: ColorValues.appYellowColor,
                          icon: Icons.assignment,
                          message: 'Assign',
                          onPress: () {
                            controller.goToEditGrievanceScreen(
                                int.tryParse('${grievanceDetails?.id}'));
                          },
                        ),

                      /// if grievance is linked, only then show Grievance Card button
                      //   if (grievanceDetails?.status == GrievanceStatus.JOB_LINKED)
                      // Flexible(
                      //   child: TableActionButton(
                      //     color: ColorValues.addNewColor,
                      //     icon: Icons.add,
                      //     message: 'Grievance Card',
                      //     onPress: () {
                      //       controller.goToGrievanceCardScreen(
                      //         int.tryParse('${grievanceDetails?.id}'),
                      //       );
                      //     },
                      //   ),
                      // ),
                    ])
                  : Text(value.toString()),
            ),
          );
        }).toList(),
      ],
      onSelectChanged: (_) {
        controller.clearStoreData();

        controller.goToGrievanceDetailsScreen(
            int.tryParse('${grievanceDetails?.id}'));
      },
    );
  }

  @override
  int get rowCount => filteredGrievanceList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
