import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_water_data/view_water_data_controller.dart';
import 'package:cmms/app/widgets/add_dialog.dart';
import 'package:cmms/app/widgets/minus_dialog.dart';
import 'package:cmms/domain/models/water_data_month.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/date_picker.dart';

class ViewWaterDataWeb extends StatefulWidget {
  ViewWaterDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewWaterDataWeb> createState() => _WaterDataWebState();
}

class _WaterDataWebState extends State<ViewWaterDataWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewWaterDataController>(
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
                                controller.clearStoreData();
                                Get.offNamed(Routes.waterDataListScreen);
                              },
                              child: Text(" / WATER DATA LIST",
                                  style: Styles.greyLight14),
                            ),
                            Text(
                              " / VIEW WATER DATA",
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
                                          "View Water Data For ${controller.waterDataByMonth.value?.month ?? ""} Month",
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
                                      itemCount: controller.waterDataByMonth
                                          .value?.itemData?.length,
                                      itemBuilder: (context, index) {
                                        final item = controller.waterDataByMonth
                                            .value?.itemData?[index];
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
                                          height:
                                              (((item?.details?.length ?? 0) +
                                                          2) *
                                                      50 +
                                                  155),
                                          margin: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                  "${controller.waterDataByMonth.value?.itemData?[index].waterType ?? ""}",
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
                                                        "Date",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.L,
                                                      label: Text(
                                                        "Description",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.L,
                                                      label: Text(
                                                        "Transaction Type",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "Procurment",
                                                        style: Styles.green17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "Consumption",
                                                        style: Styles.red17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      size: ColumnSize.M,
                                                      label: Text(
                                                        "Total",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      fixedWidth: 90,
                                                      label: Text(
                                                        "Action",
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

                          controller.openPurchaseDatePicker = false;

                          controller.update(['stock_Mangement']);
                        },
                        onCancel: () {
                          controller.openPurchaseDatePicker = false;
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

  List<DataRow> _buildTableRows(ItemData? item, List<Details>? details) {
    double opening = item?.opening ?? 0;
    double total = opening;
    double newTotal = 0;
    double totalProcurement = 0;
    double totalConsumption = 0;

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
        ],
      ),
    );
    if (details != null) {
      for (int i = 0; i < details.length; i++) {
        double procurement = details[i].procuredQty ?? 0.0;
        double consumption = details[i].consumedQty ?? 0.0;
        newTotal = (total + procurement) - consumption;
        rows.add(
          DataRow(
            cells: [
              DataCell(
                Text(details[i].date ?? '', style: Styles.black14),
              ),
              DataCell(
                Text(details[i].description ?? '', style: Styles.black14),
              ),
              DataCell(
                Text(details[i].transactionType ?? '', style: Styles.black14),
              ),
              DataCell(
                Text("${details[i].procuredQty}", style: Styles.green700),
              ),
              DataCell(
                Text("${details[i].consumedQty}", style: Styles.Red700),
              ),
              DataCell(
                Text("$newTotal", style: Styles.black14),
              ),
              DataCell(
                TableActionButton(
                  color: ColorValues.editColor,
                  icon: Icons.edit_outlined,
                  message: "edit",
                  onPress: () {
                    if (details[i].transactionType == "Procurement") {
                      Get.dialog(
                        AddDialog(
                          id: details[i].id,
                          date: details[i].date,
                          description: details[i].description,
                          quantity: details[i].procuredQty.toString(),
                          waterTypeId: item?.waterTypeId,
                          waterTypeName: item?.waterType,
                        ),
                        barrierDismissible: false,
                      );
                    } else {
                      Get.dialog(
                        MinusDialog(
                          id: details[i].id,
                          date: details[i].date,
                          description: details[i].description,
                          quantity: details[i].consumedQty.toString(),
                          waterTypeId: item?.waterTypeId,
                          waterTypeName: item?.waterType,
                        ),
                        barrierDismissible: false,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
        total = newTotal;
        totalProcurement = totalProcurement + procurement;
        totalConsumption = totalConsumption + consumption;
      }
      // rows.addAll(details
      //     .map(
      //       (detail) => DataRow(
      //         cells: [
      //           DataCell(
      //             Text(detail.date ?? '', style: Styles.black14),
      //           ),
      //           DataCell(
      //             Text(detail.description ?? '', style: Styles.black14),
      //           ),
      //           DataCell(
      //             Text(detail.transactionType ?? '', style: Styles.black14),
      //           ),
      //           DataCell(
      //             Text("${detail.procuredQty}", style: Styles.green700),
      //           ),
      //           DataCell(
      //             Text("${detail.consumedQty}", style: Styles.Red700),
      //           ),
      //           DataCell(
      //             Text("", style: Styles.black14),
      //           ),
      //           DataCell(
      //             TableActionButton(
      //               color: ColorValues.editColor,
      //               icon: Icons.edit_outlined,
      //               message: "edit",
      //               onPress: () {
      //                 if (detail.transactionType == "Procurement") {
      //                   Get.dialog(
      //                     AddDialog(
      //                       id: detail.id,
      //                       date: detail.date,
      //                       description: detail.description,
      //                       quantity: detail.procuredQty.toString(),
      //                       waterTypeId: item?.waterTypeId,
      //                       waterTypeName: item?.waterType,
      //                     ),
      //                     barrierDismissible: false,
      //                   );
      //                 } else {
      //                   Get.dialog(
      //                     MinusDialog(
      //                       id: detail.id,
      //                       date: detail.date,
      //                       description: detail.description,
      //                       quantity: detail.consumedQty.toString(),
      //                       waterTypeId: item?.waterTypeId,
      //                       waterTypeName: item?.waterType,
      //                     ),
      //                     barrierDismissible: false,
      //                   );
      //                 }
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //     )
      //     .toList());
    }

    rows.add(
      DataRow(
        cells: [
          DataCell(
            Text('', style: Styles.black14),
          ),
          DataCell(
            Text('Closing Balance', style: Styles.Red700),
          ),
          DataCell(
            Text('', style: Styles.black14),
          ),
          DataCell(
            Text('Total: $totalProcurement', style: Styles.green700),
          ),
          DataCell(
            Text('Total: $totalConsumption', style: Styles.Red700),
          ),
          DataCell(
            Text("$total"),
          ),
          DataCell(
            Text('', style: Styles.black14),
          ),
        ],
      ),
    );
    return rows;
  }
}
