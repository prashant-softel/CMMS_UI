import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class WarrantyClaimListWeb extends StatefulWidget {
  WarrantyClaimListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WarrantyClaimListWeb> createState() => _WarrantyClaimListWebState();
}

class _WarrantyClaimListWebState extends State<WarrantyClaimListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarrantyClaimController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () {
                final dataSource = WarrantyClaimListDataSource(controller);
                return SingleChildScrollView(
                  child: Column(
                    children: [
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
                                Get.offNamed(Routes.masterDashboard);
                              },
                              child:
                                  Text(" / MASTERS", style: Styles.greyLight14),
                            ),
                            Text(" / WARRANTY CLAIM LIST",
                                style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 15, right: 10),
                            height: Get.height * .84,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Warranty Claim List",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(
                                              title: 'Date Range',
                                              includeAsterisk: false,
                                            ),
                                            Dimens.boxWidth2,
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
                                                  '${controller.formattedFromdate} - ${controller.formattedTodate}',
                                            ),
                                          ],
                                        ),
                                        // Dimens.boxWidth10,
                                        SizedBox(width: 10),
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kWarrantyClaimFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveAddAccess)
                                                    .length >
                                                0
                                            ? ActionButton(
                                                icon: Icons.add,
                                                label: "Add Warranty Claim",
                                                onPressed: () {
                                                  controller.clearStoreData();
                                                  Get.toNamed(Routes
                                                      .createWarrantyClaimList);
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
                                      PopupMenuButton<String>(
                                        tooltip: "",
                                        elevation: 25.0,
                                        child: Container(
                                          height: 35,
                                          margin: EdgeInsets.only(left: 10),
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              bottom: 4,
                                              right: 8,
                                              left: 8),
                                          decoration: BoxDecoration(
                                            color:
                                                ColorValues.appLightBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            'Column Visibility',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[]..addAll(
                                                  controller.columnVisibility
                                                      .value.entries
                                                      .map((e) {
                                                return PopupMenuItem<String>(
                                                    child:
                                                        ValueListenableBuilder(
                                                            valueListenable:
                                                                controller
                                                                    .columnVisibility,
                                                            builder: (context,
                                                                value, child) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value: value[
                                                                        e.key],
                                                                    onChanged:
                                                                        (newValue) {
                                                                      controller.setColumnVisibility(
                                                                          e.key,
                                                                          newValue!);
                                                                    },
                                                                  ),
                                                                  Text(e.key),
                                                                ],
                                                              );
                                                            }));
                                              })),
                                        onSelected: (String value) {
                                          // Handle column selection
                                        },
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        // margin: Dimens.edgeInsets0_0_16_0,
                                        margin: EdgeInsets.only(right: 5),
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  controller.warrantyClaimList.isEmpty ==
                                              true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text("Data Loading......"))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        WarrantyClaimListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 75,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      // headingRowHeight:
                                                      //     Get.height * 0.12,
                                                      minWidth: 2500,
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
                                                              controller
                                                                      .filterText[
                                                                  entry.key]!,
                                                              controller
                                                                      .columnwidth[
                                                                  entry.key],
                                                            ),
                                                        buildDataColumn(
                                                          'Actions',
                                                          controller
                                                              .actionFilterText,
                                                          150,
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ),
                                ],
                              ),
                            ),
                          ),
                          if (controller.openFromDateToStartDatePicker)
                            Positioned(
                              right: 150,
                              top: 85,
                              child: DatePickerWidget(
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
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
                                  PickerDateRange? data =
                                      value as PickerDateRange;

                                  var pickUpDate =
                                      DateTime.parse(data.startDate.toString());
                                  controller.fromDate.value = pickUpDate;
                                  var dropDate =
                                      DateTime.parse(data.endDate.toString());
                                  dropDate != null
                                      ? controller.toDate.value = dropDate
                                      : controller.toDate.value = pickUpDate;

                                  controller.getWarrantyClaimtListByDate();
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['stock_Mangement_Date']);

                                  // Get.toNamed(
                                  //   Routes.stockManagementGoodsOrdersScreen,
                                  // );
                                },
                                onCancel: () {
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['stock_Mangement_Date']);
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
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

class WarrantyClaimListDataSource extends DataTableSource {
  final WarrantyClaimController controller;

  late List<WarrantyClaimModel?> filteredWarrantyClaimList;

  WarrantyClaimListDataSource(this.controller) {
    filtersWarramtyClaim();
  }

  ///
  void filtersWarramtyClaim() {
    filteredWarrantyClaimList = <WarrantyClaimModel?>[];
    filteredWarrantyClaimList =
        controller.warrantyClaimList.where((WarrantyClaimList) {
      return (WarrantyClaimList?.wc_id ?? '').toString().contains(
              controller.warrantyClaimIdFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.date_of_claim ?? '')
              .toString()
              .contains(controller.dateOfClaimFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.warranty_claim_title ?? '')
              .toString()
              .contains(controller.wcTitleFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_sr_no ?? '').toString().contains(
              controller.equipmentSrNoFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_category ?? '').toString().contains(
              controller.equipmentCategoryFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_name ?? '').toString().contains(
              controller.equipmentNameFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.estimated_cost ?? '').toString().contains(
              controller.estimatedCostFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_name ?? '').toString().contains(
              controller.equipmentNameFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredGoodsOrderList": filteredGoodsOrderList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final WarrantyClaimListDetails = filteredWarrantyClaimList[index];

    controller.wc_id.value = WarrantyClaimListDetails?.wc_id ?? 0;
    String formattedDateOfClaim = '';
    if (WarrantyClaimListDetails?.date_of_claim != null &&
        WarrantyClaimListDetails!.date_of_claim!.length > 9) {
      formattedDateOfClaim = WarrantyClaimListDetails.date_of_claim!
          .substring(0, WarrantyClaimListDetails.date_of_claim!.length - 9);
    }
    var cellsBuffer = [
      "wc_id",
      '${WarrantyClaimListDetails?.warranty_claim_title ?? ''}',
      formattedDateOfClaim,
      // '${WarrantyClaimListDetails?.date_of_claim ?? ''}',
      '${WarrantyClaimListDetails?.equipment_sr_no ?? ''}',
      '${WarrantyClaimListDetails?.equipment_category ?? ''}',
      '${WarrantyClaimListDetails?.equipment_name ?? ''}',
      '${WarrantyClaimListDetails?.estimated_cost ?? ''}',
      '${WarrantyClaimListDetails?.status_code ?? ''}',
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
            child: (value == 'wc_id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WC${WarrantyClaimListDetails?.wc_id}',
                      ),
                      Dimens.boxHeight8,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: controller.warrantyClaimList
                                              .firstWhere(
                                                (e) =>
                                                    e?.wc_id ==
                                                    WarrantyClaimListDetails!
                                                        .wc_id,
                                                orElse: () =>
                                                    WarrantyClaimModel(
                                                        wc_id: 00),
                                              )
                                              ?.status_code ==
                                          192 ||
                                      controller.warrantyClaimList
                                              .firstWhere(
                                                (e) =>
                                                    e?.wc_id ==
                                                    WarrantyClaimListDetails!
                                                        .wc_id,
                                                orElse: () =>
                                                    WarrantyClaimModel(
                                                        wc_id: 00),
                                              )
                                              ?.status_code ==
                                          199
                                  ? ColorValues.yellowColor
                                  : controller.warrantyClaimList
                                                  .firstWhere(
                                                    (e) =>
                                                        e?.wc_id ==
                                                        WarrantyClaimListDetails!
                                                            .wc_id,
                                                    orElse: () =>
                                                        WarrantyClaimModel(
                                                            wc_id: 00),
                                                  )
                                                  ?.status_code ==
                                              194 ||
                                          controller.warrantyClaimList
                                                  .firstWhere(
                                                    (e) =>
                                                        e?.wc_id ==
                                                        WarrantyClaimListDetails!
                                                            .wc_id,
                                                    orElse: () =>
                                                        WarrantyClaimModel(
                                                            wc_id: 00),
                                                  )
                                                  ?.status_code ==
                                              200
                                      ? ColorValues.appGreenColor
                                      : controller.warrantyClaimList
                                                  .firstWhere(
                                                    (e) =>
                                                        e?.wc_id ==
                                                        WarrantyClaimListDetails!
                                                            .wc_id,
                                                    orElse: () =>
                                                        WarrantyClaimModel(
                                                            wc_id: 00),
                                                  )
                                                  ?.status_code ==
                                              191
                                          ? ColorValues.draftColor
                                          : ColorValues.appRedColor),
                          child: Text(
                            '${WarrantyClaimListDetails?.status}',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kWarrantyClaimFeatureId &&
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
                                      controller.viewWarrantyClaim(
                                          wc_id:
                                              WarrantyClaimListDetails?.wc_id);
                                      // print('record:${int.tryParse('${record[0]}')}');
                                    },
                                  )
                                : Dimens.box0,
                            //),
                            varUserAccessModel.value.access_list!
                                                .where((e) =>
                                                    e.feature_id ==
                                                        UserAccessConstants
                                                            .kWarrantyClaimFeatureId &&
                                                    e.edit ==
                                                        UserAccessConstants
                                                            .kHaveEditAccess)
                                                .length >
                                            0 &&
                                        controller.warrantyClaimList
                                                .firstWhereOrNull((element) =>
                                                    element?.wc_id ==
                                                    WarrantyClaimListDetails
                                                        ?.wc_id)
                                                ?.status_code ==
                                            192 ||
                                    controller.warrantyClaimList
                                            .firstWhereOrNull((element) =>
                                                element?.wc_id ==
                                                WarrantyClaimListDetails?.wc_id)
                                            ?.status_code ==
                                        191
                                ? TableActionButton(
                                    color: ColorValues.appYellowColor,
                                    icon: Icons.edit,
                                    message: 'Edit',
                                    onPress: () {
                                      controller.editWarrantyClaim(
                                          wc_id:
                                              WarrantyClaimListDetails?.wc_id);
                                      // print('edit record:${int.tryParse('${record[0]}')}');
                                    },
                                  )
                                : Dimens.box0,
                            varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kWarrantyClaimFeatureId &&
                                                e.edit ==
                                                    UserAccessConstants
                                                        .kHaveEditAccess)
                                            .length >
                                        0 &&
                                    controller.warrantyClaimList
                                            .firstWhereOrNull((element) =>
                                                element?.wc_id ==
                                                WarrantyClaimListDetails?.wc_id)
                                            ?.status_code ==
                                        193
                                ? TableActionButton(
                                    color: Color.fromARGB(255, 116, 78, 130),
                                    icon: Icons.ads_click,
                                    message: 'Resubmit',
                                    onPress: () {
                                      controller.editWarrantyClaim(
                                          wc_id:
                                              WarrantyClaimListDetails?.wc_id);
                                      // print('edit record:${int.tryParse('${record[0]}')}');
                                    },
                                  )
                                : Dimens.box0,

                            varUserAccessModel.value.access_list!
                                            .where((e) =>
                                                e.feature_id ==
                                                    UserAccessConstants
                                                        .kWarrantyClaimFeatureId &&
                                                e.approve ==
                                                    UserAccessConstants
                                                        .kHaveApproveAccess)
                                            .length >
                                        0 &&
                                    controller.warrantyClaimList
                                            .firstWhereOrNull((element) =>
                                                element?.wc_id ==
                                                WarrantyClaimListDetails?.wc_id)
                                            ?.status_code ==
                                        192
                                ? TableActionButton(
                                    color: ColorValues.appGreenColor,
                                    icon: Icons.check,
                                    message: 'Approve/Reject',
                                    onPress: () {
                                      controller.viewWarrantyClaim(
                                          wc_id:
                                              WarrantyClaimListDetails?.wc_id);
                                      // print('record:${int.tryParse('${record[0]}')}');
                                    },
                                  )
                                : Dimens.box0,
                          ],
                        )
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        // controller.clearStoreData();
        controller.viewWarrantyClaim(wc_id: WarrantyClaimListDetails?.wc_id);
      },
    );
  }

  @override
  int get rowCount => filteredWarrantyClaimList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
