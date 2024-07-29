import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_controller_details.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/domain/models/plant_stock_month.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  State<PlantStockReportDetailsWeb> createState() =>
      _PlantStockReportDetailsWebState();
}

class _PlantStockReportDetailsWebState
    extends State<PlantStockReportDetailsWeb> {
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
                            InkWell(
                              onTap: () {
                                Get.offNamed(
                                    Routes.plantStockReport);
                              },
                              child: Text(" / PLANT STOCK REPORT",
                                  style: Styles.greyLight14),
                            ),
                            Text(
                              " / PLANT STOCK REPORT DETAILS",
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
                                        Spacer(),
                                        IgnorePointer(
                                          child: Row(
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
                                      itemCount: controller
                                          .plantStockReportByMonthList.length,
                                      itemBuilder: (context, index) {
                                        final item = controller
                                            .plantStockReportByMonthList[index];
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
                                          height: 500,
                                          margin: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                  "Asset Name:${controller.assetItemName} (${controller.assetType})",
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
                                                        "From Actor",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "To Actor",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.S,
                                                      label: Text(
                                                        "Inward",
                                                        style: Styles.green17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.S,
                                                      label: Text(
                                                        "Internal",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.S,
                                                      label: Text(
                                                        "Outward",
                                                        style: Styles.red17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.S,
                                                      label: Text(
                                                        "Balance",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "Last Update By",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                  ],
                                                  rows: _buildTableRows(
                                                    item,
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
      },
    );
  }

  List<DataRow> _buildTableRows(
      PlantStockMonth? item, List<PlantDetail>? plantdetails) {
    double opening = item?.opening ?? 0;
    double totalQuantity = 0;
    double total=opening;
    List<bool> isinward = List<bool>.filled(plantdetails?.length??0, false);
    List<bool> isoutward = List<bool>.filled(plantdetails?.length??0, false);
    List<bool> isinternal = List<bool>.filled(plantdetails?.length??0, false);

    List<DataRow> rows = [];

    rows.add(
      DataRow(
        cells: [
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('Opening Balance', style: Styles.green700)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('${opening}', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
        ],
      ),
    );

    if (plantdetails != null) {
      for (int i = 0; i < plantdetails.length; i++) {
        double qty = double.tryParse(plantdetails[i].qty ?? '') ?? 0.0;

        totalQuantity += qty; // Update totalQuantity
        totalQuantity += totalQuantity;

        if (plantdetails[i].fromActorID == 325) {
          isinward[i] = true;
          total++;
        } else if (plantdetails[i].fromActorID == 1) {
          isinternal[i] = true;
          
        } else {
          isoutward[i] = true;
          total--;
        }
        rows.add(
          DataRow(
            cells: [
              DataCell(
                Text(plantdetails[i].fromActorType ?? '',
                    style: Styles.black14),
              ),
              DataCell(
                Text(plantdetails[i].toActorType ?? '', style: Styles.black14),
              ),
              DataCell(
                Text(isinward[i] == true ? '1' : '', style: Styles.green700),
              ),
              DataCell(
                Text(isinternal[i] == true ? '1' : '', style: Styles.black14),
              ),
              DataCell(
                Text(isoutward[i] == true ? '1' : '', style: Styles.Red700),
              ),
              DataCell(
                Text('$total', style: Styles.black14),
              ),
              DataCell(
                Text(plantdetails[i].lastUpdated ?? '', style: Styles.black14),
              ),
            ],
          ),
        );
      }
    }
    rows.add(
      DataRow(
        cells: [
          DataCell(
            Text('', style: Styles.black14),
          ),
          DataCell(
            Text('TotalQuantity', style: Styles.green700),
          ),
          DataCell(
            Text('${isinward.where((bool value) => value).length}', style: Styles.green700),
          ),
          DataCell(
            Text('${isinternal.where((bool value) => value).length}', style: Styles.black14),
          ),
          DataCell(
            Text('${isoutward.where((bool value) => value).length}', style: Styles.Red700),
          ),
          
          DataCell(
            Text(' ${total}', style: Styles.black14),
          ),
          DataCell(
            Text("Closing Balance: ${total}", style: Styles.Red700),
          ),
        ],
      ),
    );

    return rows;
  }
}
