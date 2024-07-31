import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_controller_details.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/domain/models/plant_stock_month.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/app.dart';

class PlantStockReportDetailsWeb extends StatefulWidget {
  PlantStockReportDetailsWeb({Key? key}) : super(key: key);

  @override
  State<PlantStockReportDetailsWeb> createState() =>
      _PlantStockReportDetailsWebState();
}

class _PlantStockReportDetailsWebState
    extends State<PlantStockReportDetailsWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantStockReportDetailsController>(
      id: 'stock_Mangement_Date',
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
                                Get.offNamed(Routes.plantStockReport);
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
                                          "Material Transaction Report",
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
                                                  '${controller.startDate.toString()} To ${controller.endDate.toString()}',
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 5),
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
                                                  "Asset Name : ${controller.assetItemName} (${controller.assetType})",
                                                  style: Styles.blue17,
                                                ),
                                              ),
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColour,
                                              ),
                                              Expanded(
                                                child: DataTable2(
                                                  minWidth: 2000,
                                                  columns: [
                                                    DataColumn2(
                                                      // size: ColumnSize.M,
                                                      fixedWidth: 200,
                                                      label: Text(
                                                        "From Actor",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.M,
                                                      fixedWidth: 200,
                                                      label: Text(
                                                        "To Actor",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.S,
                                                      fixedWidth: 200,
                                                      label: Text(
                                                        "Inward",
                                                        style: Styles.green17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.S,
                                                      fixedWidth: 200,
                                                      label: Text(
                                                        "Outward",
                                                        style: Styles.red17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.S,
                                                      fixedWidth: 200,
                                                      label: Text(
                                                        "Closing Balance",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.S,
                                                      fixedWidth: 130,
                                                      label: Text(
                                                        "Internal",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.S,
                                                      fixedWidth: 220,
                                                      label: Text(
                                                        "Internal Balance",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.S,
                                                      fixedWidth: 250,
                                                      label: Text(
                                                        "Available Qty For MRS",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      // size: ColumnSize.M,
                                                      fixedWidth: 200,
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
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      right: 50,
                      top: 180,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorValues.appDarkBlueColor,
                          ),
                        ),
                        initialSelectedRange: PickerDateRange(
                          controller.fromDate.value,
                          controller.toDate.value,
                        ),
                        onSubmit: (value) {
                          if (value is PickerDateRange) {
                            controller.fromDate.value =
                                value.startDate ?? DateTime.now();
                            controller.toDate.value =
                                value.endDate ?? DateTime.now();
                            controller.startDate.value =
                                DateFormat('dd/MM/yyyy')
                                    .format(controller.fromDate.value);
                            controller.endDate.value = DateFormat('dd/MM/yyyy')
                                .format(controller.toDate.value);
                            controller.getPlantStockListByDate();
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['stock_Mangement_Date']);
                          }
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
    double internaltotoal = 0;
    double avialableqty=0;
  
    double total = opening;
    List<int> isinward = List<int>.filled(plantdetails?.length ?? 0, 0);
    List<int> isoutward = List<int>.filled(plantdetails?.length ?? 0, 0);
    List<int> isinternal = List<int>.filled(plantdetails?.length ?? 0, 0);

    List<DataRow> rows = [];

    rows.add(
      DataRow(
        cells: [
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('Opening Balance', style: Styles.green700)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('${opening}', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
        ],
      ),
    );

    if (plantdetails != null) {
      for (int i = 0; i < plantdetails.length; i++) {
        double qty = double.tryParse(plantdetails[i].qty ?? '') ?? 0.0;

        totalQuantity += qty;

        if (plantdetails[i].fromActorID == 325) {
          isinward[i] = 1;
          total++;
        } else if (plantdetails[i].fromActorID == 1) {
          isinternal[i] = 1;
          internaltotoal++;

        } else if (plantdetails[i].fromActorID == 14) {
          isinternal[i] = -1;
          internaltotoal--;
        } else {
          isoutward[i] = 1;
          isinternal[i]=-1;
          internaltotoal--;
          total--;
        }
        if(total!=0 && internaltotoal!=0){
          
          avialableqty=total-internaltotoal;
        }
        rows.add(
          DataRow(
            cells: [
              DataCell(
                InkWell(
                  child: Text(
                    plantdetails[i].fromActorType ?? '',
                    style: Styles.black14,
                  ),
                  onTap: () {
                    if (plantdetails[i].fromActorType1 == "JobCard") {
                      Get.toNamed(Routes.jobCard,
                          arguments: {'JcId': plantdetails[i].fromActorID});
                    }
                  },
                ),
              ),
              DataCell(
                InkWell(
                  child: Text(
                    plantdetails[i].toActorType ?? '',
                    style: Styles.black14,
                  ),
                  onTap: () {
                    // if(plantdetails[i].toActorType1=="Task"){

                    //   Get.toNamed(Routres.)
                    // }
                  },
                ),
              ),
              DataCell(
                Text(isinward[i] != 0 ? isinward[i].toString() : '',
                    style: Styles.green700),
              ),
              DataCell(
                Text(isoutward[i] != 0 ? isoutward[i].toString() : '',
                    style: Styles.Red700),
              ),
              DataCell(
                Text('$total', style: Styles.black14),
              ),
              DataCell(
                Text(isinternal[i] == 0 ? ' ' : isinternal[i].toString(),
                    style: Styles.black14),
              ),
              DataCell(
                Text(internaltotoal==0? '' :'$internaltotoal', style: Styles.black14),
              ),
              DataCell(
                Text(avialableqty==0?'':'$avialableqty', style: Styles.black14),
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
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('Total Quantity', style: Styles.green700)),
          DataCell(Text('${isinward.where((int value) => value==1).length}',
              style: Styles.green700)),
          DataCell(Text('${isoutward.where((int value) => value==1).length}',
              style: Styles.Red700)),
          DataCell(Text(' ${total}', style: Styles.black14)),
          DataCell(Text('${isinternal.fold(0, (prev, element) => prev + element)}',
              style: Styles.black14)),
          DataCell(Text('$internaltotoal', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.Red700)),
        ],
      ),
    );

    return rows;
  }
}
