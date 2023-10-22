import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/transaction_report/transaction_report_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/get_transction_report_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';

class TransactionStockReportContentWeb extends StatefulWidget {
  TransactionStockReportContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionStockReportContentWeb> createState() =>
      _TransactionStockReportContentWebState();
}

class _TransactionStockReportContentWebState
    extends State<TransactionStockReportContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionStockReportController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(() {
            final dataSource = PlantListDataSource(controller);

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
                      child: Text(" / STOCK MANAGEMENT",
                          style: Styles.greyMediumLight12),
                    ),
                    Text(" / TRANSACTION STOCK REPORT",
                        style: Styles.greyMediumLight12),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(children: [
                    Container(
                      width: Get.width * 7,
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
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transaction Stock Report",
                                    style: Styles.blackBold16,
                                  ),
                                  //  Spacer(),
                                  // MultipDropdownWebWidget(
                                  //   width: (MediaQuery.of(context).size.width *
                                  //       .2),
                                  //   //  height: 35,
                                  //   dropdownList: controller.assetList,
                                  //   selectedItems:
                                  //       controller.selectedAssetsNameList,
                                  //   onValueChanged: controller.onValueChanged,
                                  // ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      CustomRichText(title: 'Date Range'),
                                      Dimens.boxWidth10,
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
                                  // Dimens.boxWidth15,
                                  // ActionButton(
                                  //   icon: Icons.add,
                                  //   label: "Add New",
                                  //   onPressed: () {
                                  //     final _flutterSecureStorage =
                                  //         const FlutterSecureStorage();

                                  //     _flutterSecureStorage.delete(key: "mrsId");
                                  //     Get.toNamed(Routes.createMrs);
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
                                Spacer(),
                                Container(
                                  width: 200,
                                  height: 35,
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
                              ],
                            ),
                            controller.transactionStockList?.isEmpty == true
                                ? Center(child: Text('No data'))
                                : Expanded(
                                    child: ValueListenableBuilder(
                                        valueListenable:
                                            controller.columnVisibility,
                                        builder: (context, value, child) {
                                          final dataSource =
                                              PlantListDataSource(controller);

                                          return PaginatedDataTable2(
                                            // fixedLeftColumns: 1,
                                            dataRowHeight:
                                                70, //Get.height * 0.10,
                                            columnSpacing: 10,
                                            source:
                                                dataSource, // Custom DataSource class
                                            headingRowHeight: Get.height * 0.12,
                                            minWidth: 2000, //Get.width * 1.2,
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
                                              for (var entry in value.entries)
                                                if (entry.value)
                                                  buildDataColumn(
                                                    entry.key,
                                                    controller
                                                        .filterText[entry.key]!,
                                                    controller
                                                        .columnwidth[entry.key],
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

                            controller.gettransactionStockListByDate();
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['stock_Mangement_Date']);

                            // Get.toNamed(
                            //   Routes.stockManagementGoodsOrdersScreen,
                            // );
                          },
                        ),
                      ),
                  ]),
                ),
              ),
            ]);
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
            SizedBox(
              height: Get.height * 0.05,
              child: TextField(
                onChanged: (value) {
                  filterText.value = value;
                  //   onSearchCallBack(value);
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

class PlantListDataSource extends DataTableSource {
  final TransactionStockReportController controller;

  late List<TransactionStockReportListModel?> filteredTransactionList;

  PlantListDataSource(this.controller) {
    filterMrss();
  }

  ///
  void filterMrss() {
    filteredTransactionList = <TransactionStockReportListModel?>[];
    filteredTransactionList = controller.transactionStockList!.where((Report) {
      return (Report?.assetItemID ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.assetsIdFilterText.value.toLowerCase()) &&
          (Report?.assetItemName ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.assetNameFilterText.value.toLowerCase()) &&
          (Report?.fromActorType ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.fromActorFilterText.value.toLowerCase()) &&
          (Report?.toActorType ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.toActorFilterText.value.toLowerCase()) &&
          (Report?.qty ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.quntityFilterText.value.toLowerCase()); // &&

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredReportList": filteredTransactionList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final PlantDetails = filteredTransactionList[index];

    // controller.PlantId.value = PlantDetails?.asset_name ?? 0;
    var cellsBuffer = [
      '${PlantDetails?.assetItemID ?? ''}',
      '${PlantDetails?.assetItemName ?? ''}',
      '${PlantDetails?.fromActorType ?? ''}',
      '${PlantDetails?.toActorType ?? ''}',
      '${PlantDetails?.qty ?? ''}',
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
            child: Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        // final _flutterSecureStorage = const FlutterSecureStorage();

        // _flutterSecureStorage.delete(key: "mrsId");
        // Get.toNamed(Routes.mrsViewScreen, arguments: {'mrsId': MrsDetails?.id});
      },
    );
  }

  @override
  int get rowCount => filteredTransactionList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
