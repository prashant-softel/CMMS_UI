import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';
import 'package:cmms/app/widgets/add_dialog.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/minus_dialog.dart';
import 'package:cmms/domain/models/water_data_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WaterDataListWeb extends StatefulWidget {
  WaterDataListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WaterDataListWeb> createState() => _WaterDataListWebState();
}

final List<Map<String, dynamic>> statutoryData = [
  {
    "Month": "April",
    'Ground Water in KL units': '200',
    'opening balance of MC water': '100',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
    'Water Consumption  from Third Party for Module cleaning in KL units':
        '200',
    'closing balance of MC water': '1000',
    'validity': '590',
    'Water Procured from Third Party for Drinking in KL units': '566',
    'Water Procured from Third Party for Domestic and others purposes in KL units':
        '5777',
    'water used for drinking in KL units': '45',
    'Water used for Module cleaning in KL units': '78',
    'Water used for domestic and other purpose in KL units': '768',
    'Total Water Withdrawal in KL units': '6778',
    'Total Water consumed in KL units': '672',
    'Total Water withdrawal yearly limit as per NOC in KL units': '333',
    'Total Groundwater Withdrawal Limit left in KL units': '622',
  },
];

class _WaterDataListWebState extends State<WaterDataListWeb> {
  TableCell headerCell(String text, {bool isHeader = false}) => TableCell(
        child: Container(
          padding: EdgeInsets.all(8),
          // color: Colors.white, // Background color for header cells
          child: Center(
              child: Text(text, style: TextStyle(fontWeight: FontWeight.bold))),
          decoration: isHeader
              ? BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white),
                  ), // Custom border color for header cells
                )
              : BoxDecoration(
                  // border: Border.all(
                  //     color: Colors.blue,
                  //     width: 2), // Custom border color for header cells
                  ),
        ),
      );

  TableCell dataCell(String text) => TableCell(
        child: Center(child: Text(text)),
      );

  _CellData(DetailData data, String type) {
    switch (type) {
      case 'consumedQty':
        return '${data.consumedQty}';
      case 'procuredQty':
        return '${data.procuredQty}';

      case 'opening':
        return '${data.opening}';

      case 'closingQty':
        return '${data.closingQty}';

      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaterDataListController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        // final dataSource = AuditPlanPlanListDataSource(controller);
        return SelectionArea(
          child: SingleChildScrollView(
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
                          Get.offNamed(Routes.misDashboard);
                        },
                        child: Text(" / MIS", style: Styles.greyLight14),
                      ),
                      Text(" / WATER DATA LIST", style: Styles.greyLight14)
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                      height: Get.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 10),
                                child: Column(
                                  children: [
                                    Card(
                                      color: Color.fromARGB(255, 245, 248, 250),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 20,
                                                  top: 20,
                                                ),
                                                child: Text(
                                                  "Water Data List",
                                                  style: Styles.blackBold16,
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                ),
                                                child: Text(
                                                  "All the data in KL units",
                                                  style: Styles.blackBold16,
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  right: 20,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text('Year :'),
                                                    Dimens.boxWidth10,
                                                    CustomTextFieldForStock(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      numberTextField: true,
                                                      onTap: () {
                                                        _showYearPicker(context,
                                                            controller);
                                                      },
                                                      textController: controller
                                                          .waterDateTc,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  right: 20,
                                                ),
                                                child: ActionButton(
                                                  icon: Icons.add,
                                                  label: "Procurements",
                                                  onPressed: () {
                                                    Get.dialog(AddDialog());
                                                  },
                                                  color:
                                                      ColorValues.addNewColor,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 20,
                                                  right: 5,
                                                ),
                                                child: ActionButton(
                                                  icon: Icons.minimize_sharp,
                                                  label: "Consumption",
                                                  onPressed: () {
                                                    Get.dialog(MinusDialog());
                                                  },
                                                  color:
                                                      ColorValues.appRedColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          Container(
                                            color: Color.fromARGB(
                                                255, 245, 248, 250),
                                            width: Get.width,
                                            height: Get.height,
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: SingleChildScrollView(
                                                child: Table(
                                                  border: TableBorder.all(
                                                      color: Colors.grey,
                                                      width:
                                                          1), // Default border color for the table
                                                  columnWidths: const <int,
                                                      TableColumnWidth>{
                                                    0: FlexColumnWidth(),
                                                    1: FlexColumnWidth(),
                                                    2: FlexColumnWidth(),
                                                    3: FlexColumnWidth(),
                                                  },
                                                  children: [
                                                    // Main Headers
                                                    TableRow(
                                                        children: [
                                                      // headerCell('Header1', isHeader: true),
                                                      // TableCell(
                                                      //     child: Container(
                                                      //   decoration: BoxDecoration(
                                                      //     border: Border.all(
                                                      //         color: Colors.transparent,
                                                      //         width: 1), // Custom border color for header cells
                                                      //   ),
                                                      // )), // Empty container to maintain the structure
                                                      // headerCell('Header2', isHeader: true),
                                                      // TableCell(
                                                      //     child: Container(
                                                      //   decoration: BoxDecoration(
                                                      //     border: Border.all(
                                                      //         color: Colors.transparent,
                                                      //         width: 1), // Custom border color for header cells
                                                      //   ),
                                                      // )), // Empty container to maintain the structure
                                                    ]..addAll(controller
                                                              .headerList
                                                              .map((e) {
                                                            return e['isShow'] ==
                                                                    true
                                                                ? headerCell(
                                                                    e['label'])
                                                                : TableCell(
                                                                    child:
                                                                        Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .transparent,
                                                                          width:
                                                                              1), // Custom border color for header cells
                                                                    ),
                                                                  ));
                                                          }))),
                                                    // Sub-Headers
                                                    TableRow(
                                                        children: [
                                                      // headerCell('SubHeader1.1'),
                                                      // headerCell('SubHeader1.2'),
                                                      // headerCell('SubHeader2.1'),
                                                      // headerCell('SubHeader2.2'),
                                                    ]..addAll(controller
                                                              .headerList
                                                              .map((e) {
                                                            return headerCell(
                                                                e['subHeader']);
                                                          }))),
                                                    // Data Rows
                                                    ...List<TableRow>.generate(
                                                        controller.waterDataList
                                                                    .length >
                                                                0
                                                            ? controller
                                                                    .waterDataList[
                                                                        0]
                                                                    .periods
                                                                    ?.length ??
                                                                0
                                                            : 0,
                                                        (index) => TableRow(
                                                                children: [
                                                              // dataCell('1'),
                                                              // dataCell('1'),
                                                              // dataCell('1'),
                                                              // dataCell('1'),
                                                            ]..addAll(controller
                                                                      .headerList
                                                                      .map((e) {
                                                                    if (e['dataKey'] ==
                                                                        'Month') {
                                                                      return dataCell(
                                                                          '${controller.waterDataList[0].periods[index].monthName}');
                                                                    }
                                                                    DetailData? data = controller
                                                                        .waterDataList[
                                                                            0]
                                                                        .periods[
                                                                            index]
                                                                        .details
                                                                        .firstWhereOrNull((element) =>
                                                                            element.waterType ==
                                                                            e['label']);
                                                                    if (data ==
                                                                        null) {
                                                                      return dataCell(
                                                                          '');
                                                                    }
                                                                    return dataCell(
                                                                        _CellData(
                                                                            data,
                                                                            e['dataKey']));
                                                                  })))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (controller.openFromDateToStartDatePicker)
                      Positioned(
                        right: 120,
                        top: 100,
                        child: DatePickerWidget(
                          minDate: DateTime(DateTime.now().year),
                          maxDate: DateTime(DateTime.now().year, 13,
                              0), // last date of this year
                          controller: DateRangePickerController(),
                          selectionChanges: (p0) {
                            print('po valu ${p0.value.toString()}');
                            controller.waterDateTc.text =
                                DateFormat('yyyy-MM-dd').format(p0.value);
                            controller.openFromDateToStartDatePicker =
                                !controller.openFromDateToStartDatePicker;
                            controller.update(['stock_Mangement_Date']);
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
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
          SizedBox(
            height: Get.height * 0.05,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onChanged: (value) {
                filterText.value = value;
                //   onSearchCallBack(value);
              },
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Filter',
                contentPadding:
                    EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
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
    // ),\
  );
}

_showYearPicker(BuildContext context, WaterDataListController controller) {
  controller.selectedYear = DateTime.now().year;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Year"),
        content: Container(
          height: 200,
          child: CupertinoPicker(
            itemExtent: 40,
            onSelectedItemChanged: (int index) {
              controller.selectedYear = DateTime.now().year - index;
            },
            children: List.generate(10, (index) {
              return Center(
                child: Text((DateTime.now().year - index).toString()),
              );
            }),
          ),
        ),
        actions: <Widget>[
          ActionButton(
            label: "Cancel", color: ColorValues.appRedColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            // child: Text("Cancel"),
          ),
          Dimens.boxHeight10,
          ActionButton(
            color: ColorValues.addNewColor,
            onPressed: () {
              controller.waterDateTc.text = controller.selectedYear.toString();
              controller.update(['stock_Mangement_Date']);
              Navigator.of(context).pop();
            },
            label: "Select",
          ),
        ],
      );
    },
  );
}
