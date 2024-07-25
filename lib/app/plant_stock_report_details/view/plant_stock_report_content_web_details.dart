import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_controller_details.dart';
import 'package:cmms/domain/models/plant_stock_month.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/date_picker.dart';

class PlantStockReportDetailsWeb extends StatefulWidget {
  PlantStockReportDetailsWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<PlantStockReportDetailsWeb> createState() => _PlantStockReportDetailsWebState();
}

class _PlantStockReportDetailsWebState extends State<PlantStockReportDetailsWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantStockReportDetailsController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  Column(
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
                            // InkWell(
                            //   onTap: () {
                                
                            //     Get.offNamed(Routes.PlantStockReportDetailsScreen);
                            //   },
                            //   child: Text(" / Plant Stock Report",
                            //       style: Styles.greyLight14),
                            // ),
                            Text(
                              " / Plant Stock Report Details",
                              style: Styles.greyLight14,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Card(
                            color: Color.fromARGB(255, 245, 248, 250),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Plant Stock Report Data For  Month",
                                          style: Styles.blackBold16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight20,
                                  Container(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    height: Get.height * .7,
                                    width: Get.width * .92,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.plantStockReportByMonthList
                                          .length,
                                      itemBuilder: (context, index) {
                                        final item = controller.plantStockReportByMonthList
                                           [index];
                                        return Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 224, 224),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 236, 234, 234)
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              ),  
                                            ],
                                          ),
                                          height:500,
                                              // (((item?.plantdetails?.length ?? 0) +
                                              //             2) *
                                              //         50 +
                                              //     155),
                                          margin: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                  "${"details"}",
                                                  style: Styles.blue17,
                                                ),
                                              ),
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColour,
                                              ),
                                              Expanded(
                                                child: DataTable2(
                                                  columns: [
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "From Actor Type",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.L,
                                                      label: Text(
                                                        "From Actor Name",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.L,
                                                      label: Text(
                                                        "To Actor Type",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "To Actor Name",
                                                        style: Styles.green17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "Asset Item Name",
                                                        style: Styles.red17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "Last Updated",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                      DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "Created At",
                                                        style: Styles.blue17,
                                                      ),
                                                      ),
                                                   
                                                  ],
                                                  rows: _buildTableRows(
                                                    item ,
                                                    item?.details,
                                                  ),
                                                ),
                                              ),
                                              Dimens.boxHeight20,
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (controller.openPurchaseDatePicker)
                    Positioned(
                      right: 65,
                      top: 130,
                      child: DatePickerWidget(
                        minDate: DateTime(DateTime.now().year),
                        maxDate: DateTime(DateTime.now().year, 13,
                            0), // last date of this year
                        controller: DateRangePickerController(),
                        selectionChanges: (p0) {
                          print('po valu ${p0.value.toString()}');
                          controller.purchaseDateTc.text =
                              DateFormat('yyyy-MM-dd').format(p0.value);
                          controller.openPurchaseDatePicker =
                              !controller.openPurchaseDatePicker;
                          controller.update(['stock_Mangement']);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
        // );
      },
    );
  }

  List<DataRow> _buildTableRows(PlantStockMonth? item, List<PlantDetail>? plantdetails) {
    double opening = item?.opening ?? 0;
    // double total = opening;
    // double newTotal = 0;
    // double totalProcurement = 0;
    // double totalConsumption = 0;

    List<DataRow> rows = [];

    rows.add(
      DataRow(
        cells: [
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('Opening Balance', style: Styles.green700)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.green700)),
          DataCell(Text('', style: Styles.Red700)),
          DataCell(Text('${opening}', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
        ],
      ),
    );
    if (plantdetails != null) {
      for (int i = 0; i < plantdetails.length; i++) {
       
        rows.add(
          DataRow(
            cells: [
              DataCell(
                Text(plantdetails[i].fromActorType ?? '', style: Styles.black14),
              ),
              DataCell(
                Text(plantdetails[i].fromActorName ?? '', style: Styles.black14),
              ),
              DataCell(
                Text(plantdetails[i].toActorType ?? '', style: Styles.black14),
              ),
               DataCell(
                Text(plantdetails[i].toActorName ?? '', style: Styles.black14),
              ),
               DataCell(
                Text(plantdetails[i].assetItemName ?? '', style: Styles.black14),
              ),
               DataCell(
                Text( '', style: Styles.black14),
              ),
               DataCell(
                Text( '', style: Styles.black14),
              ),

            ],
          ),
        );
       
      }
      
    }

    // rows.add(
    //   DataRow(
    //     cells: [
    //       DataCell(
    //         Text('', style: Styles.black14),
    //       ),
    //       DataCell(
    //         Text('Closing Balance', style: Styles.Red700),
    //       ),
    //       DataCell(
    //         Text('', style: Styles.black14),
    //       ),
    //       DataCell(
    //         Text('Total: $totalProcurement', style: Styles.green700),
    //       ),
    //       DataCell(
    //         Text('Total: $totalConsumption', style: Styles.Red700),
    //       ),
    //       DataCell(
    //         Text("$total"),
    //       ),
    //       DataCell(
    //         Text('', style: Styles.black14),
    //       ),
    //     ],
    //   ),
    // );
    return rows;
  }
}
