import 'package:cmms/app/app.dart';
import 'package:cmms/app/employee_stock_report/employee_stock_report_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/dropdown_web.dart';

class EmployeeStockReportContentWeb
    extends GetView<EmployeeStockReportController> {
  EmployeeStockReportContentWeb({Key? key}) : super(key: key);
  final EmployeeStockReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeStockReportController>(
        id: 'employeeReport',
        builder: (controller) {
          return Obx(() {
            final dataSource = PlantListDataSource(controller);

            return SelectionArea(
              child: Container(
                color: Color.fromARGB(255, 234, 236, 238),
                width: Get.width,
                height: Get.height,
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
                          Text(" / EMPLOYEE STOCK REPORT ",
                              style: Styles.greyLight14)
                        ],
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width,
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              height: Get.height * .85 - 10,
                              //height: Get.height - 300,

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
                                            "Employee Stock Report ",
                                            style: Styles.blackBold16,
                                          ),
                                          Spacer(),
                                          Text(
                                            'User Login ID: ',
                                            style: Styles.blackBold14,
                                          ),
                                          Dimens.boxWidth20,
                                          Container(
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2),
                                            child: DropdownWebWidget(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: const Offset(
                                                    5.0,
                                                    5.0,
                                                  ),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                ),
                                                BoxShadow(
                                                  color: ColorValues.whiteColor,
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 0.0,
                                                  spreadRadius: 0.0,
                                                ),
                                              ],
                                              controller: controller,
                                              dropdownList: controller.userList,
                                              isValueSelected: controller
                                                  .isSelectedUser.value,
                                              selectedValue:
                                                  controller.selectedUser.value,
                                              onValueChanged:
                                                  controller.onValueChanged,
                                            ),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: 'Date Range'),
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
                                                      ['employeeReport']);
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
                                              <PopupMenuEntry<String>>[]
                                                ..addAll(controller
                                                    .columnVisibility
                                                    .value
                                                    .entries
                                                    .map((e) {
                                                  return PopupMenuItem<String>(
                                                      child:
                                                          ValueListenableBuilder(
                                                              valueListenable:
                                                                  controller
                                                                      .columnVisibility,
                                                              builder: (context,
                                                                  value,
                                                                  child) {
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
                                          margin: Dimens.edgeInsets0_0_16_0,
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
                                    Dimens.boxHeight5,
                                    controller.StockDetailsList.isEmpty == true
                                        ? Center(child: Text('No data'))
                                        : Expanded(
                                            child: ValueListenableBuilder(
                                                valueListenable:
                                                    controller.columnVisibility,
                                                builder:
                                                    (context, value, child) {
                                                  final dataSource =
                                                      PlantListDataSource(
                                                          controller);

                                                  return PaginatedDataTable2(
                                                    // fixedLeftColumns: 1,
                                                    dataRowHeight:
                                                        70, //Get.height * 0.10,
                                                    columnSpacing: 10,
                                                    source:
                                                        dataSource, // Custom DataSource class
                                                    // headingRowHeight:
                                                    //     Get.height * 0.12,
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

                                    var pickUpDate = DateTime.parse(
                                        data.startDate.toString());
                                    controller.fromDate.value = pickUpDate;
                                    var dropDate =
                                        DateTime.parse(data.endDate.toString());
                                    dropDate != null
                                        ? controller.toDate.value = dropDate
                                        : controller.toDate.value = pickUpDate;

                                    controller
                                        .getEmployeeReportListListByDate();
                                    controller.openFromDateToStartDatePicker =
                                        !controller
                                            .openFromDateToStartDatePicker;
                                    controller.update(['employeeReport']);

                                    // Get.toNamed(
                                    //   Routes.stockManagementGoodsOrdersScreen,
                                    // );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

class PlantListDataSource extends DataTableSource {
  final EmployeeStockReportController controller;

  late List<StockDetails?> filteredPlantList;

  PlantListDataSource(this.controller) {
    filterMrss();
  }

  ///
  void filterMrss() {
    filteredPlantList = <StockDetails?>[];
    filteredPlantList = controller.StockDetailsList.where((Plant) {
      return (Plant?.asset_name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.assetNameFilterText.value.toLowerCase()) &&
          (Plant?.asset_code ?? '')
              .toLowerCase()
              .contains(controller.assetsCodeFilterText.value.toLowerCase()) &&
          (Plant?.opening ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.openingFilterText.value.toLowerCase()) &&
          (Plant?.inward ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.inwardFilterText.value.toLowerCase()) &&
          (Plant?.outward ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.outwardFilterText.value.toLowerCase()) &&
          (Plant?.balance ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.balanceFilterText.value.toLowerCase()) &&
          (Plant?.asset_type ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.assetTypeFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredPlantList": filteredPlantList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final PlantDetails = filteredPlantList[index];

    // controller.PlantId.value = PlantDetails?.asset_name ?? 0;
    var cellsBuffer = [
      '${PlantDetails?.asset_name ?? ''}',
      '${PlantDetails?.asset_code ?? ''}',
      '${PlantDetails?.asset_type ?? ''}',
      '${PlantDetails?.opening ?? ''}',
      '${PlantDetails?.inward ?? ''}',
      '${PlantDetails?.outward ?? ''}',
      '${PlantDetails?.balance ?? ''}',
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
  int get rowCount => filteredPlantList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
