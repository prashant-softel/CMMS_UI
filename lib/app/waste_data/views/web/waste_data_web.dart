import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/waste_data/waste_data_controller.dart';
import 'package:cmms/app/widgets/add_dialog.dart';
import 'package:cmms/app/widgets/add_waste_generated_dialog.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/minus_dialog.dart';
import 'package:cmms/app/widgets/waste_disposed_dialog%20copy.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WasteDataWeb extends StatefulWidget {
  WasteDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WasteDataWeb> createState() => _WasteDataWebState();
}

final List<Map<String, dynamic>> statutoryData = [
  {
    "Month": "April",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "May",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "June",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "July",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "August",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "September",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "October",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "November",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "December",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "January",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "February",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
  {
    "Month": "March",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)":
        "Data",
    "Opening Balance Of Waste": "Data",
    "Closing Balance Of Waste": "Data",
    "E- waste in kgs ": "Data",
    "Battery Waste in number ": "Data",
    "Solar Module waste in number": "Data",
    "Haz waste Oil (E.g. used transformer oil) in litres ": "Data",
    "Haz Waste grease in kgs": "Data",
    "Haz solid waste (e.g. used oil cotton) in Kgs": "Data",
    "Haz waste oil barrel generated in No": "Data",
    "Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs":
        "Data",
    "E- waste Disposed in kgs": "Data",
    "Battery Waste disposed in number": "Data",
    "Solar module waste in number ": "Data",
    "Haz waste oil disposed in litres": "Data",
    "Haz waste Grease in Kgs": "Data",
    "Haz Solid waste disposed in Kgs ": "Data",
    "Haz waste oil barrel Disposed in No": "Data",
  },
];

class _WasteDataWebState extends State<WasteDataWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WasteDataController>(
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
                    Text(
                      " / WASTE DATA",
                      style: Styles.greyLight14,
                    ),
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
                                                "Waste Data List",
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
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 20,
                                                right: 5,
                                              ),
                                              child: ActionButton(
                                                icon: Icons.minimize_sharp,
                                                label: "Waste Generated",
                                                onPressed: () {
                                                  Get.dialog(
                                                      WasteGeneratedAddDialog());
                                                },
                                                color: ColorValues.appRedColor,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 20,
                                                right: 20,
                                              ),
                                              child: ActionButton(
                                                icon: Icons.add,
                                                label: "Waste  Disposed",
                                                onPressed: () {
                                                  Get.dialog(
                                                      WasteDisposedAddDialog());
                                                },
                                                color: ColorValues.addNewColor,
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
                                              minWidth: 2350,
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
                                                  fixedWidth: 160,
                                                  label: Text(
                                                    'Solid waste( Paper\nwaste, Food waste,\nPlastic waste,\nmetal, Glass etc)',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 110,
                                                  label: Text(
                                                    'Opening\nBalance Of\nWaste',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 90,
                                                  label: Text(
                                                    'E- waste\nin kgs ',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 110,
                                                  label: Text(
                                                    'Closing\nBalance Of\nWaste',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Battery\nWaste in\nnumber ',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 120,
                                                  label: Text(
                                                    'Solar Module\nwaste in\nnumber',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 130,
                                                  label: Text(
                                                    'Haz waste Oil\n(E.g. used\ntransformer oil)\nin litres ',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Haz Waste\ngrease\nin kgs',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 120,
                                                  label: Text(
                                                    'Haz solid\nwaste\n(e.g. used oil\ncotton)\nin Kgs',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 120,
                                                  label: Text(
                                                    'Haz waste\noil barrel\ngenerated\nin No',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 160,
                                                  label: Text(
                                                    'Solid waste(Paper\nwaste, Food waste,\nPlastic waste,\nmetal, Glass\netc)in kgs',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 90,
                                                  label: Text(
                                                    'E- waste\nDisposed\nin kgs',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 135,
                                                  label: Text(
                                                    'Battery Waste\ndisposed\nin number',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 130,
                                                  label: Text(
                                                    'Solar module\nwaste\nin number ',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 110,
                                                  label: Text(
                                                    'Haz waste oil\ndisposed\nin litres',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 100,
                                                  label: Text(
                                                    'Haz waste\nGrease\nin Kgs',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 120,
                                                  label: Text(
                                                    'Haz Solid\nwaste\ndisposed\nin Kgs ',
                                                    style: Styles.blackBold14,
                                                  ),
                                                  // size: ColumnSize.L,
                                                ),
                                                DataColumn2(
                                                  fixedWidth: 130,
                                                  label: Text(
                                                    'Haz waste oil\nbarrel\nDisposed in No',
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
                                                          'Opening Balance Of Waste'])),
                                                      DataCell(Text(data[
                                                          'Closing Balance Of Waste'])),
                                                      DataCell(Text(data[
                                                          'Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)'])),
                                                      DataCell(Text(data[
                                                          'E- waste in kgs '])),
                                                      DataCell(Text(data[
                                                          'Battery Waste in number '])),
                                                      DataCell(Text(data[
                                                          'Solar Module waste in number'])),
                                                      DataCell(Text(data[
                                                          'Haz waste Oil (E.g. used transformer oil) in litres '])),
                                                      DataCell(Text(data[
                                                          'Haz Waste grease in kgs'])),
                                                      DataCell(Text(data[
                                                          'Haz solid waste (e.g. used oil cotton) in Kgs'])),
                                                      DataCell(Text(data[
                                                          'Haz waste oil barrel generated in No'])),
                                                      DataCell(Text(data[
                                                          'Solid waste( Paper waste, Food waste, Plastic waste, metal, Glass etc)in kgs'])),
                                                      DataCell(Text(data[
                                                          'E- waste Disposed in kgs'])),
                                                      DataCell(Text(data[
                                                          'Battery Waste disposed in number'])),
                                                      DataCell(Text(data[
                                                          'Solar module waste in number '])),
                                                      DataCell(Text(data[
                                                          'Haz waste oil disposed in litres'])),
                                                      DataCell(Text(data[
                                                          'Haz waste Grease in Kgs'])),
                                                      DataCell(Text(data[
                                                          'Haz Solid waste disposed in Kgs '])),
                                                      DataCell(Text(data[
                                                          'Haz waste oil barrel Disposed in No'])),
                                                      DataCell(
                                                        Row(
                                                          children: [
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .viewColor,
                                                              icon: Icons
                                                                  .remove_red_eye_outlined,
                                                              message: 'View',
                                                              onPress: () {
                                                                Get.toNamed(Routes
                                                                    .viewHazWasteData);
                                                              },
                                                            ),
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .editColor,
                                                              icon: Icons.edit,
                                                              message: 'Edit',
                                                              onPress: () {
                                                                Get.toNamed(Routes
                                                                    .addWasteDataScreen);
                                                              },
                                                            ),
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
    // ),
  );
}

_showYearPicker(BuildContext context, WasteDataController controller) {
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
