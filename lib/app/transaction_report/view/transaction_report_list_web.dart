import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/app_constants.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/domain/models/transaction_report_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../transaction_report_list_controller.dart';

class TransactionReportListWeb extends StatefulWidget {
  TransactionReportListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionReportListWeb> createState() =>
      _TransactionReportListWebState();
}

class _TransactionReportListWebState extends State<TransactionReportListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionReportListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () {
                final dataSource = TransactionReportListDataSource(controller);
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
                                Get.offNamed(
                                    Routes.stockManagementDashboardScreen);
                              },
                              child: Text(" / STOCK MANAGEMENT",
                                  style: Styles.greyLight14),
                            ),
                            Text(" / TRANSACTION REPORT LIST ",
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
                            height: Get.height * .85 - 10,
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
                                          "Transaction Report List",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: 'Date Range',
                                                includeAsterisk: false),
                                            // Dimens.boxWidth10,
                                            SizedBox(width: 10),
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
                                        width: 200,
                                        height: 35,
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
                                                EdgeInsets.only(left: 8),
                                            hintText: 'search'.tr,
                                            hintStyle: Styles.grey12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Actor Type: ',
                                          style: Styles.blackBold14,
                                        ),
                                        // Dimens.boxWidth20,
                                        SizedBox(width: 5),
                                        Container(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2),
                                          child: DropdownWebWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                2,
                                            dropdownList: controller.actorType,
                                            isValueSelected: controller
                                                .isSelectedactorType.value,
                                            selectedValue: controller
                                                .selectedActorType.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Actor Name: ',
                                          style: Styles.blackBold14,
                                        ),
                                        // Dimens.boxWidth20,
                                        // SizedBox(width:20),
                                        SizedBox(width: 5),
                                        controller.selectedactorTypeId ==
                                                AppConstants.kTask
                                            ? Container(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2),
                                                child: DropdownWebWidget(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      2,
                                                  dropdownList:
                                                      controller.pmTaskList,
                                                  isValueSelected: controller
                                                      .isSelectedpmtask.value,
                                                  selectedValue: controller
                                                      .selectedpmtask.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              )
                                            : controller.selectedactorTypeId ==
                                                    AppConstants.kEngineer
                                                ? Container(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2),
                                                    child: DropdownWebWidget(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              2,
                                                      dropdownList:
                                                          controller.userList,
                                                      isValueSelected:
                                                          controller
                                                              .isSelectedUser
                                                              .value,
                                                      selectedValue: controller
                                                          .selectedUser.value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  )
                                                : controller.selectedactorTypeId ==
                                                        AppConstants.kStore
                                                    ? Container(
                                                        width: (MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .2),
                                                        child:
                                                            DropdownWebWidget(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              2,
                                                          dropdownList: controller
                                                              .facilityNameList,
                                                          isValueSelected:
                                                              controller
                                                                  .isSelectedfacility
                                                                  .value,
                                                          selectedValue: controller
                                                              .selectedfacility
                                                              .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      )
                                                    : controller.selectedactorTypeId ==
                                                            AppConstants
                                                                .kInventory
                                                        ? Container(
                                                            width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .2),
                                                            child:
                                                                DropdownWebWidget(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  2,
                                                              dropdownList:
                                                                  controller
                                                                      .inventoryNameList,
                                                              isValueSelected:
                                                                  controller
                                                                      .isSelectedInventory
                                                                      .value,
                                                              selectedValue:
                                                                  controller
                                                                      .selectedInventory
                                                                      .value,
                                                              onValueChanged:
                                                                  controller
                                                                      .onValueChanged,
                                                            ),
                                                          )
                                                        : controller.selectedactorTypeId ==
                                                                AppConstants
                                                                    .kJobCard
                                                            ? Container(
                                                                width: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .2),
                                                                child:
                                                                    DropdownWebWidget(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      2,
                                                                  dropdownList:
                                                                      controller
                                                                          .jobList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isSelectedJob
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedJob
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              )
                                                            : Dimens.box0
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  controller.transactionReportList.isEmpty ==
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
                                                        TransactionReportListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 70,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      // headingRowHeight:
                                                      //     Get.height * 0.12,
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
                                                              controller
                                                                      .filterText[
                                                                  entry.key]!,
                                                              controller
                                                                      .columnwidth[
                                                                  entry.key],
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

                                  controller.getTransactionListByDate();
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
          // SizedBox(
          //   height: Get.height * 0.05,
          //   child: TextField(
          //     style: GoogleFonts.lato(
          //       textStyle:
          //           TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          //     ),
          //     onChanged: (value) {
          //       filterText.value = value;
          //       //   onSearchCallBack(value);
          //     },
          //     textAlign: TextAlign.left,
          //     decoration: InputDecoration(
          //       hintText: 'Filter',
          //       contentPadding:
          //           EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //     ),
          //   ),
          // ),
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

class TransactionReportListDataSource extends DataTableSource {
  final TransactionReportListController controller;

  late List<TransactionReportListModel?> filteredTransactionReportList;

  TransactionReportListDataSource(this.controller) {
    filtersTransactionReport();
  }

  ///
  void filtersTransactionReport() {
    filteredTransactionReportList = <TransactionReportListModel?>[];
    filteredTransactionReportList =
        controller.transactionReportList.where((transactionReportList) {
      return (transactionReportList!.fromActorID ?? '')
              .toString()
              .contains(controller.fromActorIDFilterText.value.toLowerCase()) &&
          (transactionReportList.fromActorType ?? '').toString().contains(
              controller.fromActorTypeFilterText.value.toLowerCase()) &&
          (transactionReportList.fromActorName ?? '').toString().contains(
              controller.fromActorNameFilterText.value.toLowerCase()) &&
          (transactionReportList.toActorType ?? '')
              .toString()
              .contains(controller.toActorTypeFilterText.value.toLowerCase()) &&
          (transactionReportList.toActorName ?? '')
              .toString()
              .contains(controller.toActorNameFilterText.value.toLowerCase()) &&
          (transactionReportList.assetItemName ?? '').contains(
              controller.assetItemNameFilterText.value.toLowerCase()) &&
          (transactionReportList.assettype ?? '')
              .contains(controller.assettypeFilterText.value.toLowerCase()) &&
          (transactionReportList.qty ?? '')
              .toString()
              .contains(controller.qtyFilterText.value.toLowerCase()) &&
          (transactionReportList.lastUpdated ?? '')
              .toString()
              .contains(controller.lastUpdatedFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredTransactionReportList": filteredTransactionReportList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final transactionReportListDetails = filteredTransactionReportList[index];

    controller.fromActorID.value =
        transactionReportListDetails?.fromActorID ?? 0;
    var cellsBuffer = [
      "id",
      '${transactionReportListDetails?.fromActorType ?? ''}',
      '${transactionReportListDetails?.fromActorName ?? ''}',
      '${transactionReportListDetails?.toActorType ?? ''}',
      '${transactionReportListDetails?.toActorName ?? ''}',
      '${transactionReportListDetails?.assetItemName ?? ''}',
      '${transactionReportListDetails?.assettype ?? ''}',
      '${transactionReportListDetails?.qty ?? ''}',
      '${transactionReportListDetails?.lastUpdated ?? ''}',
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

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${transactionReportListDetails?.fromActorID}',
                      ),
                      // Dimens.boxHeight10,
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     padding: Dimens.edgeInsets8_2_8_2,
                      //     decoration: BoxDecoration(
                      //       color: ColorValues.addNewColor,
                      //       borderRadius: BorderRadius.circular(4),
                      //     ),
                      //     child: Text(
                      //       "status_short",
                      //       // '${transactionReportListDetails?.status_short}',
                      //       style: Styles.white10.copyWith(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {},
    );
  }

  @override
  int get rowCount => filteredTransactionReportList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
