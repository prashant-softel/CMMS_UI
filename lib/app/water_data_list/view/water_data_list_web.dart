import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/audit_plan_list_model.dart';
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
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "May",
    'Ground Water in KL units': '300',
    'Water Procured from Third Party for Module cleaning in KL units': '789',
    'validity': '699',
    'Water Procured from Third Party for Drinking in KL units': '700',
    'Water Procured from Third Party for Domestic and others purposes in KL units':
        '789',
    'water used for drinking in KL units': '100',
    'Water used for Module cleaning in KL units': '900',
    'Water used for domestic and other purpose in KL units': '27',
    'Total Water Withdrawal in KL units': '262',
    'Total Water consumed in KL units': '89',
    'Total Water withdrawal yearly limit as per NOC in KL units': '577',
    'Total Groundwater Withdrawal Limit left in KL units': '49',
  },
  {
    "Month": "June",
    'Ground Water in KL units': '305',
    'Water Procured from Third Party for Module cleaning in KL units': '66',
    'validity': '100',
    'Water Procured from Third Party for Drinking in KL units': '22',
    'Water Procured from Third Party for Domestic and others purposes in KL units':
        '30',
    'water used for drinking in KL units': '60',
    'Water used for Module cleaning in KL units': '50',
    'Water used for domestic and other purpose in KL units': '53',
    'Total Water Withdrawal in KL units': '51',
    'Total Water consumed in KL units': '59',
    'Total Water withdrawal yearly limit as per NOC in KL units': '80',
    'Total Groundwater Withdrawal Limit left in KL units': '77',
  },
  {
    "Month": "July",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "Aug",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "Oct",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "Nov",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "Dec",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "Jan",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "Feb",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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
  {
    "Month": "March",
    'Ground Water in KL units': '200',
    'Water Procured from Third Party for Module cleaning in KL units': '1220',
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

  // Add more data as needed
];

class _WaterDataListWebState extends State<WaterDataListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaterDataListController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        // final dataSource = AuditPlanPlanListDataSource(controller);
        return SingleChildScrollView(
          child: Column(
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
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              child: Column(
                                children: [
                                  Card(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
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
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      _showYearPicker(
                                                          context, controller);
                                                    },
                                                    textController:
                                                        controller.waterDateTc,
                                                  ),
                                                ],
                                              ),
                                            ),
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
                                            child: DataTable2(
                                              fixedLeftColumns: 1,
                                              headingRowHeight: 130,
                                              columnSpacing: 12,
                                              horizontalMargin: 12,
                                              headingRowColor:
                                                  MaterialStateColor
                                                      .resolveWith(
                                                (states) {
                                                  return ColorValues
                                                      .lightGreyColor;
                                                },
                                              ),
                                              fixedColumnsColor:
                                                  ColorValues.appYellowColor,
                                              minWidth: 2000,
                                              columns: [
                                                DataColumn2(
                                                  fixedWidth: 70,
                                                  label: Text(
                                                    'Month',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 130,
                                                  label: Text(
                                                    'Ground Water\nin KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 190,
                                                  label: Text(
                                                    'Water Procured from\nThird Party for\nModule cleaning\nin KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 190,
                                                  label: Text(
                                                    'Water Procured from\nThird Party for\nDrinking in KL\nunits',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 150,
                                                  label: Text(
                                                    'Water Procured\nfrom Third Party\nfor Domestic and\nothers purposes\nin KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 150,
                                                  label: Text(
                                                    'water used for\ndrinking in KL\nunits',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 150,
                                                  label: Text(
                                                    'Water used for\nModule cleaning\nin KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 180,
                                                  label: Text(
                                                    'Water used for\ndomestic and other\npurpose in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Total Water\nWithdrawal in KL\nunits',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Total Water\nconsumed in KL\nunits',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Total Water withdrawal\nyearly limit as per\nNOC in KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Total Groundwater\nWithdrawal Limit left\nin KL units',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  label: Text(
                                                    'Action',
                                                    style: Styles.blackBold14,
                                                  ),
                                                ),
                                              ],
                                              rows: statutoryData.map(
                                                (data) {
                                                  return DataRow(
                                                    cells: [
                                                      DataCell(
                                                          Text(data['Month'])),
                                                      DataCell(Text(data[
                                                          'Ground Water in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water Procured from Third Party for Module cleaning in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water Procured from Third Party for Drinking in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water Procured from Third Party for Domestic and others purposes in KL units'])),
                                                      DataCell(Text(data[
                                                          'water used for drinking in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water used for Module cleaning in KL units'])),
                                                      DataCell(Text(data[
                                                          'Water used for domestic and other purpose in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Water Withdrawal in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Water consumed in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Water withdrawal yearly limit as per NOC in KL units'])),
                                                      DataCell(Text(data[
                                                          'Total Groundwater Withdrawal Limit left in KL units'])),
                                                      DataCell(
                                                        Row(
                                                          children: [
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              icon: Icons
                                                                  .remove_red_eye_outlined,
                                                              message: 'View',
                                                            ),
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .editColor,
                                                              icon: Icons.edit,
                                                              message: 'Edit',
                                                              onPress: () {
                                                                Get.toNamed(Routes
                                                                    .waterDataScreen);
                                                              },
                                                            ),
                                                            // TableActionButton(
                                                            //   color: Color
                                                            //       .fromARGB(
                                                            //           255,
                                                            //           156,
                                                            //           210,
                                                            //           156),
                                                            //   icon:
                                                            //       Icons.replay,
                                                            //   message: 'Re-New',
                                                            //   onPress: () {},
                                                            // ),
                                                            // TableActionButton(
                                                            //   color: ColorValues
                                                            //       .deleteColor,
                                                            //   icon:
                                                            //       Icons.delete,
                                                            //   message: 'Delete',
                                                            //   onPress: () {},
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ).toList(),
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
  int selectedYear = DateTime.now().year;

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
              selectedYear = DateTime.now().year - index;
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
              controller.waterDateTc.text = selectedYear.toString();
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
