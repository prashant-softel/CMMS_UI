import 'package:cmms/app/dsm_charges/dsm_charges_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';

class DsmChargesListContentWeb extends StatefulWidget {
  DsmChargesListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<DsmChargesListContentWeb> createState() =>
      _DsmChargesListContentWebState();
}

final List<Map<String, dynamic>> statutoryData = [
  {
    "Year": "2023",
    'Month': 'May',
    'Site Name': 'Alote',
    'Actual Gen': '15.00 ',
    'Forecosting Gen': '15.00',
    'Devaition': '15%',
    'DSM Penalty': '15.00',
  },
  {
    "Year": "2023",
    'Month': 'May',
    'Site Name': 'Alote',
    'Actual Gen': '15.00 ',
    'Forecosting Gen': '15.00',
    'Devaition': '15%',
    'DSM Penalty': '15.00',
  },
  {
    "Year": "2023",
    'Month': 'May',
    'Site Name': 'Alote',
    'Actual Gen': '15.00 ',
    'Forecosting Gen': '15.00',
    'Devaition': '15%',
    'DSM Penalty': '15.00',
  },
  {
    "Year": "2023",
    'Month': 'May',
    'Site Name': 'Alote',
    'Actual Gen': '15.00 ',
    'Forecosting Gen': '15.00',
    'Devaition': '15%',
    'DSM Penalty': '15.00',
  },
  {
    "Year": "2023",
    'Month': 'May',
    'Site Name': 'Alote',
    'Actual Gen': '15.00 ',
    'Forecosting Gen': '15.00',
    'Devaition': '15%',
    'DSM Penalty': '15.00',
  },
  {
    "Year": "2023",
    'Month': 'May',
    'Site Name': 'Alote',
    'Actual Gen': '15.00 ',
    'Forecosting Gen': '15.00',
    'Devaition': '15%',
    'DSM Penalty': '15.00',
  },
  {
    "Year": "2023",
    'Month': 'May',
    'Site Name': 'Alote',
    'Actual Gen': '15.00 ',
    'Forecosting Gen': '15.00',
    'Devaition': '15%',
    'DSM Penalty': '15.00',
  },
];

class _DsmChargesListContentWebState extends State<DsmChargesListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DsmChargesListController>(
        id: 'user_list',
        builder: (controller) {
          // return Obx(() {

          return SelectionArea(
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
                          Get.offNamed(Routes.masterDashboard);
                        },
                        child: Text(" / MASTER", style: Styles.greyLight14),
                      ),
                      Text(" / DSM CHARGES LIST", style: Styles.greyLight14),
                    ],
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Container(
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
                                    children: [
                                      Text(
                                        "F&S DSM CHARGES",
                                        style: Styles.blackBold16,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Site name :",
                                              style: Styles.black15,
                                            ),
                                            Dimens.boxWidth5,
                                            DropdownWebStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              dropdownList: controller.siteName,
                                              // selectedValue: ,
                                              onValueChanged:
                                                  (wasteData, selectedValue) {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Year :",
                                              style: Styles.black15,
                                            ),
                                            Dimens.boxWidth5,
                                            DropdownWebStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              dropdownList: controller.year,
                                              onValueChanged:
                                                  (wasteData, selectedValue) {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Month :",
                                              style: Styles.black15,
                                            ),
                                            Dimens.boxWidth5,
                                            DropdownWebStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              dropdownList: controller.month,
                                              // selectedValue: ,
                                              onValueChanged:
                                                  (wasteData, selectedValue) {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 30,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appDarkBlueColor,
                                          onPressed: () {},
                                          text: 'Search',
                                        ),
                                      ),
                                      Dimens.boxWidth10
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () {},
                                        text: 'Column Visibility',
                                      ),
                                    ),
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
                                    Spacer(),
                                    Container(
                                      width: 300,
                                      height: 40,
                                      margin: Dimens.edgeInsets0_0_16_0,
                                      child: TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        onChanged: (value) {},
                                        // =>
                                        // controller.search(value),
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 0.0,
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width: 0.0,
                                            ),
                                          ),
                                          contentPadding:
                                              Dimens.edgeInsets05_10,
                                          hintText: 'search'.tr,
                                          hintStyle: Styles.grey16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    width: Get.width,
                                    height: Get.height,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: DataTable2(
                                        headingRowHeight: 50,
                                        columnSpacing: 12,
                                        horizontalMargin: 12,
                                        minWidth: 2000,
                                        columns: [
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'Year',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'Month',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'Site Name',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'Actual Gen',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'Forecosting Gen',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'Devaition',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'DSM Penalty',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                        ],
                                        rows: statutoryData.map(
                                          (data) {
                                            return DataRow(
                                              cells: [
                                                DataCell(Text(data['Year'])),
                                                DataCell(Text(data['Month'])),
                                                DataCell(
                                                    Text(data['Site Name'])),
                                                DataCell(
                                                    Text(data['Actual Gen'])),
                                                DataCell(Text(
                                                    data['Forecosting Gen'])),
                                                DataCell(
                                                    Text(data['Devaition'])),
                                                DataCell(
                                                    Text(data['DSM Penalty'])),
                                              ],
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
  //);
}
