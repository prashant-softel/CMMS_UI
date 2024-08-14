import 'package:cmms/app/faulty_material_report/faulty_material_report_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_faulty_material_report_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class FaultyMaterialReportContentWeb extends StatefulWidget {
  FaultyMaterialReportContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<FaultyMaterialReportContentWeb> createState() =>
      _FaultyMaterialReportContentWebState();
}

class _FaultyMaterialReportContentWebState
    extends State<FaultyMaterialReportContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaultyMaterialReportController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(() {
              final dataSource = FaultyStockReportListDataSource(controller);
              return Column(children: [
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
                      Text(" / FAULTY MATERIAL REPORT",
                          style: Styles.greyLight14),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(children: [
                      Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.all(10),
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
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Faulty Material Report",
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
                                  Spacer(),
                                  Container(
                                    width: 300,
                                    height: 40,
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
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 0.0),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 0.0),
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
                              controller.faultyMaterialReportList.isEmpty ==
                                          true &&
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
                                                    FaultyStockReportListDataSource(
                                                        controller);

                                                return PaginatedDataTable2(
                                                  // fixedLeftColumns: 1,
                                                  dataRowHeight:
                                                      70, //Get.height * 0.10,
                                                  columnSpacing: 10,
                                                  source:
                                                      dataSource, // Custom DataSource class
                                                  // headingRowHeight: Get.height * 0.12,
                                                  minWidth:
                                                      2000, //Get.width * 1.2,
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

                              controller.getPlantStockListByDate();
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
                ),
              ]);
            }),
          );
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
            // SizedBox(
            //   height: Get.height * 0.05,
            //   child: TextField(
            //     style: GoogleFonts.lato(
            //       textStyle: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.black),
            //     ),
            //     onChanged: (value) {
            //       filterText.value = value;
            //       //   onSearchCallBack(value);
            //     },
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //       hintText: 'Filter',
            //       contentPadding: EdgeInsets.fromLTRB(
            //           5, 0, 5, 0), // Reduced vertical padding
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
}

class FaultyStockReportListDataSource extends DataTableSource {
  final FaultyMaterialReportController controller;

  late List<FaultyMaterialReportModel?> filteredFaultyStockList;

  FaultyStockReportListDataSource(this.controller) {
    filterMrss();
  }

  ///
  void filterMrss() {
    filteredFaultyStockList = <FaultyMaterialReportModel?>[];
    filteredFaultyStockList =
        controller.faultyMaterialReportList.where((faulty) {
      return (faulty?.asset_name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.assetNameFilterText.value.toLowerCase()) &&
          (faulty?.serial_number ?? '')
              .toLowerCase()
              .contains(controller.serialNoFilterText.value.toLowerCase()) &&
          (faulty?.replaceSerialNo ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.replaceFilterText.value.toLowerCase()) &&
          (faulty?.lastInsetedDateTime ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.insetedFilterText.value.toLowerCase()) &&
          // (faulty?.qty ?? '')
          //     .toString()
          //     .toLowerCase()
          //     .contains(controller.quantityFilterText.value.toLowerCase()) &&
          (faulty?.remarks ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.remarkFilterText.value.toLowerCase()) &&
          (faulty?.createdByName ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.createdByNameFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredFaultyStockList": filteredFaultyStockList});
  }

  @override
  DataRow? getRow(int index) {
    final faultyDetails = filteredFaultyStockList[index];

    var cellsBuffer = [
      '${faultyDetails?.asset_name ?? ''}',
      '${faultyDetails?.serial_number ?? ''}',
      '${faultyDetails?.lastInsetedDateTime ?? ''}',
      '${faultyDetails?.remarks ?? ''}',
      '${faultyDetails?.createdByName ?? ''}',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        // Check if the column is "Serial Number"
        if (entry.key == "Serial Number") {
          // Align the value for the "Serial Number" column with padding
          cells.add(
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30.0), // Adjust padding as needed
                child: Text(cellsBuffer[i]),
              ),
            ),
          );
        } else if (entry.key == "Inserted DateTime") {
          cells.add(
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30.0), // Adjust padding as needed
                child: Text(cellsBuffer[i]),
              ),
            ),
          );
        } else {
          // Add the value as it is for other columns
          cells.add(Text(cellsBuffer[i]));
        }
      }
      i++;
    }

    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: value,
          ),
        );
      }).toList(),
      onSelectChanged: (_) {
        // Handle row selection if needed
      },
    );
  }

  @override
  int get rowCount => filteredFaultyStockList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
