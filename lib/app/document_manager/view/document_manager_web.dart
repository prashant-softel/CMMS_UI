import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DocumentManagerWeb extends StatelessWidget {
  DocumentManagerWeb({Key? key});

  final List<Map<String, dynamic>> statutoryData = [
    {
      'Document ID': '123',
      'Document Type ': 'type 1',
      'Re- New Date ': '10/04/2024',
      'Status': 'inactive',
    },
    {
      'Document ID': '124',
      'Document Type ': 'type2',
      'Re- New Date ': '10/04/2024',
      'Status': 'renew',
    },
    {
      'Document ID': '125',
      'Document Type ': 'type3',
      'Re- New Date ': '10/04/2024',
      'Status': 'active',
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool openFromDateToStartDatePicker = false;
    Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 70)).obs;
    Rx<DateTime> toDate = DateTime.now().obs;
    // String get formattedFromdate =>
    //     DateFormat('yyyy-MM-dd').format(fromDate.value);
    // String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

    return SelectionArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
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
                            Get.offNamed(Routes.masterDashboard);
                          },
                          child: Text(" / MASTERS", style: Styles.greyLight14),
                        ),
                        Text(" / DOCUMENT MANAGER", style: Styles.greyLight14),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 15, right: 10),
                        child: Column(
                          children: [
                            Card(
                              color: Color.fromARGB(255, 245, 248, 250),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, top: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Document List",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(title: 'Date Range'),
                                            Dimens.boxWidth10,
                                            CustomTextFieldForStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              numberTextField: true,
                                              onTap: () {
                                                openFromDateToStartDatePicker =
                                                    openFromDateToStartDatePicker;
                                                // update([
                                                //   'stock_Mangement_Date'
                                                // ]);
                                              },
                                              // hintText:
                                              //     '${formattedFromdate.toString()} - ${formattedTodate.toString()}',
                                            ),
                                          ],
                                        ),
                                        Dimens.boxWidth10,
                                        ActionButton(
                                          icon: Icons.add,
                                          label: "Upload Document",
                                          onPressed: () {
                                            Get.offNamed(
                                                Routes.documentUploadScreen);
                                          },
                                          color: ColorValues.addNewColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Container(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    width: Get.width,
                                    height: Get.height,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: DataTable2(
                                        headingRowHeight: 55,
                                        columnSpacing: 5,
                                        minWidth: 1805,
                                        headingRowColor:
                                            MaterialStateColor.resolveWith(
                                          (states) {
                                            return ColorValues.lightGreyColor;
                                          },
                                        ),
                                        // horizontalMargin: 100,
                                        // minWidth: 600,
                                        columns: [
                                          DataColumn2(
                                            fixedWidth: 200,
                                            label: Text(
                                              'Document ID',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 300,
                                            // fixedWidth: 110,
                                            label: Text(
                                              'Document Type',
                                              style: Styles.blackBold14,
                                            ),
                                            // size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            fixedWidth: 300,
                                            // fixedWidth: 110,
                                            label: Text(
                                              'Re- New Date',
                                              style: Styles.blackBold14,
                                            ),
                                          ),
                                          DataColumn2(
                                            // fixedWidth: 120,
                                            label: Text(
                                              'Status',
                                              style: Styles.blackBold14,
                                            ),
                                            size: ColumnSize.S,
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
                                                    Text(data['Document ID'])),
                                                DataCell(Text(
                                                    data['Document Type '])),
                                                DataCell(Text(
                                                    data['Re- New Date '])),
                                                DataCell(Text(data['Status'])),
                                                DataCell(
                                                  Row(
                                                    children: [
                                                      Wrap(
                                                        children: [
                                                          TableActionButton(
                                                            color: ColorValues
                                                                .viewColor,
                                                            icon: Icons
                                                                .remove_red_eye_outlined,
                                                            message: 'View',
                                                            onPress: () {
                                                              int viewStatutory =
                                                                  1;

                                                              // Get.toNamed(
                                                              //   Routes
                                                              //       .complianceScreen,
                                                              //   arguments: {
                                                              //     'viewStatutory':
                                                              //         viewStatutory
                                                              //   },
                                                              // );
                                                            },
                                                          ),
                                                          TableActionButton(
                                                            color: ColorValues
                                                                .editColor,
                                                            icon: Icons.edit,
                                                            message: 'Edit',
                                                            onPress: () {
                                                              // Get.toNamed(
                                                              //   Routes
                                                              //       .complianceScreen,
                                                              // );
                                                            },
                                                          ),
                                                        ],
                                                      )
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
            if (openFromDateToStartDatePicker)
              Positioned(
                right: 230,
                top: 90,
                child: DatePickerWidget(
                  selectionMode: DateRangePickerSelectionMode.range,
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    todayCellDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorValues.appDarkBlueColor),
                  ), // last date of this year
                  // controller: DateRangePickerController(),
                  initialSelectedRange: PickerDateRange(
                    fromDate.value,
                    toDate.value,
                  ),

                  onSubmit: (value) {
                    print('po valu ${value.toString()}');
                    PickerDateRange? data = value as PickerDateRange;

                    var pickUpDate = DateTime.parse(data.startDate.toString());
                    fromDate.value = pickUpDate;
                    var dropDate = DateTime.parse(data.endDate.toString());
                    dropDate != null
                        ? toDate.value = dropDate
                        : toDate.value = pickUpDate;

                    // controller.getNewPermitListByDate();
                    openFromDateToStartDatePicker =
                        openFromDateToStartDatePicker;
                    // update(['stock_Mangement_Date']);

                    // Get.toNamed(
                    //   Routes.stockManagementGoodsOrdersScreen,
                    // );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
