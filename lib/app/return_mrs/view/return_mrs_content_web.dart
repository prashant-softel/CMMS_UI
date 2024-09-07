import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/return_mrs/return_mrs_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/get_return_mrs_list.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class ReturnMrsListContentWeb extends StatefulWidget {
  ReturnMrsListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ReturnMrsListContentWeb> createState() =>
      _ReturnMrsListContentWebState();
}

class _ReturnMrsListContentWebState extends State<ReturnMrsListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReturnMrsListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(() {
            final dataSource = ReturnMrsListDataSource(controller);
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
                      Text(" / RETURN MRS LIST", style: Styles.greyLight14),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(children: [
                      Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.only(left: 10, top: 15),
                        height: Get.height * .85 - 5,
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
                                      "Return Material Requsition Slip",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    // Row(
                                    //   children: [
                                    //     CustomRichText(title: 'Date Range'),
                                    //     Dimens.boxWidth10,
                                    //     CustomTextFieldForStock(
                                    //       width:
                                    //           MediaQuery.of(context).size.width / 5,
                                    //       numberTextField: true,
                                    //       onTap: () {
                                    //         controller
                                    //                 .openFromDateToStartDatePicker =
                                    //             !controller
                                    //                 .openFromDateToStartDatePicker;
                                    //         controller
                                    //             .update(['stock_Mangement_Date']);
                                    //       },
                                    //       hintText:
                                    //           '${controller.formattedTodate.toString()} To ${controller.formattedFromdate.toString()}',
                                    //     ),
                                    //   ],
                                    // ),
                                    // Dimens.boxWidth15,
                                    // ActionButton(
                                    //   icon: Icons.add,
                                    //   label: "Add New",
                                    //   onPressed: () {
                                    //     controller.clearStoreData();

                                    //     Get.toNamed(Routes.mrsReturnScreen);
                                    //   },
                                    //   color: ColorValues.addNewColor,
                                    // ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Row(
                                children: [
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {},
                                  //       text: 'Copy'),
                                  // ),
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {},
                                  //       text: 'Excel'),
                                  // ),
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //       backgroundColor:
                                  //           ColorValues.appLightBlueColor,
                                  //       onPressed: () {},
                                  //       text: 'PDF'),
                                  // ),
                                  // Container(
                                  //   height: 35,
                                  //   margin: EdgeInsets.only(left: 10),
                                  //   child: CustomElevatedButton(
                                  //     backgroundColor:
                                  //         ColorValues.appLightBlueColor,
                                  //     onPressed: () {},
                                  //     text: 'columnVisibility'.tr,
                                  //   ),
                                  // ),
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
                                    margin: EdgeInsets.only(right: 7),
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
                                              color: Colors.grey, width: 0.0),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 0.0),
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(left: 3),
                                        hintText: 'search'.tr,
                                        hintStyle: Styles.grey12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              controller.mrsList.isEmpty == true &&
                                      controller.isLoading == false
                                  ? Center(child: Text('No data'))
                                  : controller.isLoading.value == true
                                      ? Center(
                                          child: Text("Data Loading......"))
                                      : Expanded(
                                          child: ValueListenableBuilder(
                                              valueListenable:
                                                  controller.columnVisibility,
                                              builder: (context, value, child) {
                                                final dataSource =
                                                    ReturnMrsListDataSource(
                                                        controller);

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
                                                          controller
                                                                  .columnwidth[
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
                    ]),
                  ),
                ),
              ]),
            );
          });
        });
  }

  DataColumn2 buildDataColumn(
    // String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
    //  {required Function(String) onSearchCallBack}
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
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

class ReturnMrsListDataSource extends DataTableSource {
  final ReturnMrsListController controller;

  late List<ReturnMrsListModel?> filteredMrsList;

  ReturnMrsListDataSource(this.controller) {
    filterMrss();
  }

  ///
  void filterMrss() {
    filteredMrsList = <ReturnMrsListModel?>[];
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
      "Requested by: ${MrsDetails?.requested_by_name ?? ""}\nApproved by: ${MrsDetails?.approver_name ?? ""}",
      '${MrsDetails?.returnDate ?? ''}',
      '${MrsDetails?.activity ?? ''}',
      '${MrsDetails?.whereUsedType.toString().toUpperCase() ?? ''}${MrsDetails?.whereUsedTypeId ?? ''}',
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
                        'RMRS${MrsDetails?.id}',
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
                                          orElse: () =>
                                              ReturnMrsListModel(id: 00),
                                        )
                                        ?.status ==
                                    322
                                ? ColorValues.rejectedStatusColor
                                : controller.mrsList
                                            .firstWhere(
                                              (e) => e?.id == MrsDetails!.id,
                                              orElse: () =>
                                                  ReturnMrsListModel(id: 00),
                                            )
                                            ?.status ==
                                        321
                                    ? ColorValues.submitColor
                                    : controller.mrsList
                                                .firstWhere(
                                                  (e) =>
                                                      e?.id == MrsDetails!.id,
                                                  orElse: () =>
                                                      ReturnMrsListModel(
                                                          id: 00),
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
                                                          ReturnMrsListModel(
                                                              id: 00),
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
                                                              ReturnMrsListModel(
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
                                                                  ReturnMrsListModel(
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
                            int mrsId = MrsDetails?.id ?? 0;
                            Get.toNamed(Routes.approverReturnMrs,
                                arguments: {'mrsId': mrsId, 'type': 0});
                          },
                        ),
                        varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kreturnMrsFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0 &&
                                    controller.mrsList
                                            .firstWhere(
                                              (e) => e?.id == MrsDetails!.id,
                                              orElse: () =>
                                                  ReturnMrsListModel(id: 00),
                                            )
                                            ?.status ==
                                        321 ||
                                varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kreturnMrsFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0 &&
                                    controller.mrsList
                                            .firstWhere(
                                              (e) => e?.id == MrsDetails!.id,
                                              orElse: () =>
                                                  ReturnMrsListModel(id: 00),
                                            )
                                            ?.status ==
                                        322
                            ? TableActionButton(
                                color: ColorValues.editColor,
                                icon: Icons.edit,
                                message: 'edit',
                                onPress: () {
                                  controller.clearStoreData();
                                  int mrsId = MrsDetails?.id ?? 0;
                                  Get.toNamed(Routes.editReturnMrs, arguments: {
                                    'mrsId': mrsId,
                                  });
                                },
                              )
                            : Dimens.box0,
                        controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () =>
                                              ReturnMrsListModel(id: 00),
                                        )
                                        ?.status ==
                                    321 &&
                                controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () =>
                                              ReturnMrsListModel(id: 00),
                                        )
                                        ?.approval_status ==
                                    0 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kreturnMrsFeatureId &&
                                            e.approve ==
                                                UserAccessConstants
                                                    .kHaveApproveAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.approveColor,
                                icon: Icons.check,
                                message: 'Approve',
                                onPress: () {
                                  controller.clearStoreData();
                                  int mrsId = MrsDetails?.id ?? 0;
                                  Get.toNamed(Routes.approverReturnMrs,
                                      arguments: {'mrsId': mrsId, 'type': 0});
                                },
                              )
                            : Dimens.box0,
                        // controller.mrsList!
                        //             .firstWhere(
                        //               (e) => e?.id == mrsListDetails!.id,
                        //               orElse: () => MrsListModel(id: 00),
                        //             )
                        //             ?.status ==
                        //         323
                        //     ?
                        // TableActionButton(
                        //   color: ColorValues
                        //       .issueColor,
                        //   icon: Icons.report,
                        //message: 'issue',
                        //   onPress: () {
                        //     int mrsId =
                        //         mrsListDetails
                        //                 ?.id ??
                        //             0;
                        //     if (mrsId != null) {
                        //       Get.toNamed(
                        //           Routes
                        //               .mrsIssueScreen,
                        //           arguments:
                        //               mrsId);
                        //     }
                        //   },
                        // ),
                        //     : Dimens.box0,
                        controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () =>
                                              ReturnMrsListModel(id: 00),
                                        )
                                        ?.status ==
                                    321 &&
                                controller.mrsList
                                        .firstWhere(
                                          (e) => e?.id == MrsDetails!.id,
                                          orElse: () =>
                                              ReturnMrsListModel(id: 00),
                                        )
                                        ?.approval_status ==
                                    0 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kreturnMrsFeatureId &&
                                            e.approve ==
                                                UserAccessConstants
                                                    .kHaveApproveAccess)
                                        .length >
                                    0
                            ? TableActionButton(
                                color: ColorValues.rejectColor,
                                icon: Icons.close,
                                message: 'Reject',
                                onPress: () {
                                  controller.clearStoreData();

                                  int mrsId = MrsDetails?.id ?? 0;
                                  Get.toNamed(Routes.approverReturnMrs,
                                      arguments: {'mrsId': mrsId, 'type': 0});
                                },
                              )
                            : Dimens.box0
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();
        int mrsId = MrsDetails?.id ?? 0;

        Get.toNamed(Routes.approverReturnMrs,
            arguments: {'mrsId': mrsId, 'type': 0});
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
