import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/multipule_dropdown_web.dart';
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
                                    //     Container(
                                    //   height: 45,
                                    //   decoration: BoxDecoration(
                                    //     boxShadow: [
                                    //       BoxShadow(
                                    //         color: Colors.black26,
                                    //         offset: const Offset(
                                    //           5.0,
                                    //           5.0,
                                    //         ),
                                    //         blurRadius: 5.0,
                                    //         spreadRadius: 1.0,
                                    //       ),
                                    //     ],
                                    //     color: ColorValues.whiteColor,
                                    //     borderRadius: BorderRadius.circular(5),
                                    //   ),
                                    //   child: DropdownWebWidget(
                                    //     width:
                                    //         (MediaQuery.of(context).size.width *
                                    //             .21),
                                    //     //  height: 35,
                                    //     dropdownList: controller.assetList,
                                        
                                    //     // selectedItems:
                                    //     //     controller.selectedAssetsNameList,
                                    //      isValueSelected:
                                    //                           controller
                                    //                               .ismaterialSelected
                                    //                               .value,
                                    //                       selectedValue: controller
                                    //                           .selectedmaterial
                                    //                           .value,
                                    //     onValueChanged:
                                    //         controller.onValueChanged,
                                    //   ),
                                    // ),
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
                                  controller.plantDetailList.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text("Data Loading......"))
                                          : Container(
                                              color: Color.fromARGB(
                                                  255, 245, 248, 250),
                                              height: Get.height * .7,
                                              width: Get.width * .92,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .plantStockReportByMonthList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  final item = controller
                                                          .plantStockReportByMonthList[
                                                      index];

                                                  return Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 227, 224, 224),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                                  255,
                                                                  236,
                                                                  234,
                                                                  234)
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          child: Text(
                                                            "Material Name : ${controller.assetItemName} (${controller.assetType})",
                                                            style:
                                                                Styles.blue17,
                                                          ),
                                                        ),
                                                        Divider(
                                                          color: ColorValues
                                                              .greyLightColour,
                                                        ),
                                                        Expanded(
                                                          child: DataTable2(
                                                            headingRowHeight:
                                                                70,
                                                            minWidth: 1500,
                                                            columnSpacing: 5,
                                                            columns: [
                                                              DataColumn2(
                                                                // size: ColumnSize.M,
                                                                fixedWidth: 200,
                                                                label: Text(
                                                                  "From Actor",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.M,
                                                                fixedWidth: 200,
                                                                label: Text(
                                                                  "To Actor",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 80,
                                                                label: Text(
                                                                  "MRSID",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 90,
                                                                label: Text(
                                                                  "Inward",
                                                                  style: Styles
                                                                      .green17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 100,
                                                                label: Text(
                                                                  "Outward",
                                                                  style: Styles
                                                                      .red17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 110,
                                                                label: Text(
                                                                  "Closing \n Balance",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 85,
                                                                label: Text(
                                                                  "Issued",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 110,
                                                                label: Text(
                                                                  "Issued \n Balance",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 100,
                                                                label: Text(
                                                                  "Faulty",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.S,
                                                                fixedWidth: 70,
                                                                label: Text(
                                                                  "Avail\nQty",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                // size: ColumnSize.M,
                                                                fixedWidth: 150,
                                                                label: Text(
                                                                  "Last Update By",
                                                                  style: Styles
                                                                      .blue17,
                                                                ),
                                                              ),
                                                            ],
                                                            rows:
                                                                _buildTableRows(
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
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);
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
    double internaltotoal = 0;
    double avialableqty = 0;

    double total = opening;
    List<String> isinward = List<String>.filled(plantdetails?.length ?? 0, '');
    List<String> isoutward = List<String>.filled(plantdetails?.length ?? 0, '');
    List<String> isinternal =
        List<String>.filled(plantdetails?.length ?? 0, '');
    List<String> isfaulty = List<String>.filled(plantdetails?.length ?? 0, '');

    List<DataRow> rows = [];
    // if (plantdetails != null) {
    //   for (int i = 0; i < plantdetails.length; i++) {
    //     isinternal[i] = plantdetails[i].qty;
    //     isinward[i] = plantdetails[i].qty;
    //     isoutward[i] = plantdetails[i].qty;
    //   }
    // }
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
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('', style: Styles.black14)),
        ],
      ),
    );

    if (plantdetails != null) {
      for (int i = 0; i < plantdetails.length; i++) {
        if (plantdetails[i].fromActorType1 == 'Vendor' &&
            plantdetails[i].toActorType1 == 'Store') {
          isinward[i] = plantdetails[i].qty.toString();
          total = total + plantdetails[i].qty;
        } else if (plantdetails[i].fromActorType1 == 'Store' &&
                plantdetails[i].toActorType1 == 'Task' ||
            plantdetails[i].toActorType1 == 'JobCard') {
          isinternal[i] = plantdetails[i].qty.toString();
          internaltotoal = internaltotoal + plantdetails[i].qty;
        } else if (plantdetails[i].fromActorType1 == 'Task' ||
            plantdetails[i].fromActorType1 == 'JobCard' &&
                plantdetails[i].toActorType1 == 'Store') {
          isinternal[i] = '-${plantdetails[i].qty}';
          internaltotoal = internaltotoal - plantdetails[i].qty;
        } else if (plantdetails[i].fromActorType1 == 'Inventory' &&
            plantdetails[i].toActorType1 == 'NonOperational') {
          isfaulty[i] = plantdetails[i].qty.toString();
        } else {
          isoutward[i] = plantdetails[i].qty.toString();
          total = total - plantdetails[i].qty;
          isinternal[i] = '-${plantdetails[i].qty}';
          internaltotoal = internaltotoal - plantdetails[i].qty;
        }
        if (total != '' && internaltotoal != '') {
          avialableqty = total - internaltotoal;
        }
        rows.add(
          DataRow(
            cells: [
              DataCell(
                InkWell(
                  child: Text(
                    // plantdetails[i].fromActorType == "JobCard"? "JC" : plantdetails[i].fromActorType?? '',
                    plantdetails[i].fromActorType ?? '',
                    style: Styles.black14,
                  ),
                  onTap: () {
                    if (plantdetails[i].fromActorType1 == "JobCard") {
                      int jobCardId = plantdetails[i].fromActorID;
                      Get.toNamed('${Routes.jobCard}/$jobCardId');
                    }
                  },
                ),
              ),
              DataCell(
                InkWell(
                  child: Text(
                    plantdetails[i].toActorType ?? '',
                    // plantdetails[i].fromActorType == "JobCard"? "JC" : plantdetails[i].fromActorType?? '',
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
                Text(plantdetails[i].mrsID.toString() ?? '',
                    style: Styles.black14),
              ),
              DataCell(
                Text(isinward[i], style: Styles.green700),
              ),
              DataCell(
                Text(isoutward[i], style: Styles.Red700),
              ),
              DataCell(
                Text('$total', style: Styles.black14),
              ),
              DataCell(
                Text(isinternal[i], style: Styles.black14),
              ),
              DataCell(
                Text('$internaltotoal', style: Styles.black14),
              ),
              DataCell(
                Text(isfaulty[i], style: Styles.black14),
              ),
              DataCell(
                Text('$avialableqty', style: Styles.black14),

                // avialableqty==0?'':
              ),
              DataCell(
                Text(plantdetails[i].lastUpdated ?? '', style: Styles.black14),
              ),
            ],
          ),
        );
      }
    }
    double Inwardsum = isinward
        .map((e) => e.isEmpty ? 0.0 : double.parse(e))
        .reduce((a, b) => a + b);

    double Outwardsum = isoutward
        .map((e) => e.isEmpty ? 0.0 : double.parse(e))
        .reduce((a, b) => a + b);

    double internalsum = isinternal
        .map((e) => e.isEmpty ? 0.0 : double.parse(e))
        .reduce((a, b) => a + b);

    double Faultysum = isfaulty
        .map((e) => e.isEmpty ? 0.0 : double.parse(e))
        .reduce((a, b) => a + b);

    rows.add(
      DataRow(
        cells: [
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('Total Quantity', style: Styles.green700)),
          DataCell(Text('', style: Styles.black14)),
          DataCell(Text('${Inwardsum}', style: Styles.green700)),
          DataCell(Text('${Outwardsum}', style: Styles.Red700)),
          DataCell(Text(' ${total}', style: Styles.black14)),
          // DataCell(Text('${isinternal.fold(0, (prev, element) => prev + element)}',
          // style: Styles.black14)),
          DataCell(Text('$internalsum', style: Styles.black14)),
          DataCell(Text('$internaltotoal', style: Styles.black14)),
          DataCell(Text('$Faultysum', style: Styles.black14)),
          DataCell(Text('$avialableqty', style: Styles.black14)),
          DataCell(Text('', style: Styles.Red700)),
        ],
      ),
    );

    return rows;
  }
}
