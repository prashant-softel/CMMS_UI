import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';
import 'package:cmms/app/widgets/add_dialog.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/minus_dialog.dart';
import 'package:cmms/domain/models/water_data_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WaterDataListWeb extends GetView<WaterDataListController> {
  WaterDataListWeb({
    Key? key,
  }) : super(key: key);
  final homecontroller = Get.find<HomeController>();

  Widget headerCell(String text, {bool isHeader = false}) => Container(
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
      );

  TableCell _actonData(PeriodData data) => TableCell(
        child: Center(
            child: Wrap(
          children: [
            TableActionButton(
              color: ColorValues.viewColor,
              icon: Icons.remove_red_eye_outlined,
              message: 'view',
              onPress: () {
                Get.toNamed(Routes.viewWaterData,
                    arguments: {"monthId": data.month_id, "year": data.year});
              },
            ),
            TableActionButton(
              color: ColorValues.editColor,
              icon: Icons.edit,
              message: 'Edit',
              onPress: () {
                Get.toNamed(Routes.viewWaterData,
                    arguments: {"monthId": data.month_id, "year": data.year});
              },
            ),
          ],
        )),
      );
  TableCell dataCell(String text) => TableCell(
        child: Center(child: Text(text)),
      );

  String _CellData(DetailData data, String type) {
    switch (type) {
      case '-':
        return '${data.consumedQty}';
      case '+':
        return '${data.procuredQty}';

      case 'opening':
        return '${data.opening}';

      case 'closingQty':
        return '${data.closingQty}';

      default:
        return '';
    }
  }

  Map<int, TableColumnWidth> generateColumnWidths(int numColumns) {
    return Map.fromIterable(List.generate(numColumns, (index) => index),
        key: (item) => item as int, value: (item) => FixedColumnWidth(150));
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
                          SingleChildScrollView(
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      8,
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
                                              right: 20,
                                            ),
                                            child: ActionButton(
                                              icon: Icons.add,
                                              label: "Procurements",
                                              onPressed: () {
                                                Get.dialog(AddDialog());
                                              },
                                              color: ColorValues.addNewColor,
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
                                              color: ColorValues.appRedColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Obx(
                                        () => SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            color: Color.fromARGB(
                                                255, 245, 248, 250),
                                            width: Get.width,
                                            // height: Get.height * .5,
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: []..addAll(controller
                                                          .mainHeaderList
                                                          .map((element) =>
                                                              Container(
                                                                  height: 60,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorValues
                                                                        .lightGreyColor,
                                                                    border:
                                                                        Border(
                                                                      left: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1),
                                                                      right: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1),
                                                                      top: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1),
                                                                    ),
                                                                  ),
                                                                  width: 150.0 *
                                                                      element[
                                                                          'colSpan'],
                                                                  child: headerCell(
                                                                      element[
                                                                          'label'])))),
                                                    ),
                                                    Table(
                                                      border: TableBorder.all(
                                                          color: Colors.grey,
                                                          width: 1),
                                                      columnWidths:
                                                          generateColumnWidths(
                                                              150),
                                                      children: [
                                                        TableRow(
                                                            children: []
                                                              ..addAll(controller
                                                                  .headerList
                                                                  .map((e) {
                                                                if (e['subHeader'] ==
                                                                    '+') {
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorValues
                                                                          .addNewColor,
                                                                    ),
                                                                    child:
                                                                        headerCell(
                                                                      e['subHeader'],
                                                                      isHeader:
                                                                          true,
                                                                    ),
                                                                  );
                                                                } else if (e[
                                                                        'subHeader'] ==
                                                                    '-') {
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorValues
                                                                          .appRedColor,
                                                                    ),
                                                                    child:
                                                                        headerCell(
                                                                      e['subHeader'],
                                                                      isHeader:
                                                                          true,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return headerCell(
                                                                      e[
                                                                          'subHeader'],
                                                                      isHeader:
                                                                          true);
                                                                }
                                                              }))),
                                                        ...List<
                                                                TableRow>.generate(
                                                            controller.waterDataList
                                                                        .length >
                                                                    0
                                                                ? controller
                                                                        .waterDataList[
                                                                            0]
                                                                        .periods
                                                                        .length ??
                                                                    0
                                                                : 0,
                                                            (index) => TableRow(
                                                                children: []
                                                                  ..addAll(controller
                                                                      .headerList
                                                                      .map((e) {
                                                                    if (e['dataKey'] ==
                                                                        'Month') {
                                                                      return dataCell(
                                                                          '${controller.waterDataList[0].periods[index].monthName}');
                                                                    }
                                                                    if (e['dataKey'] ==
                                                                        'action') {
                                                                      return _actonData(controller
                                                                          .waterDataList[
                                                                              0]
                                                                          .periods[index]);
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
                                                                    // return dataCell(
                                                                    //     "text");
                                                                    return dataCell(_CellData(
                                                                            data,
                                                                            e[
                                                                                'dataKey'])) ??
                                                                        dataCell(
                                                                            "");
                                                                  })))),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                            controller.openFromDateToStartDatePicker = false;

                            controller.update(['stock_Mangement_Date']);
                          },
                          onCancel: () {
                            controller.openFromDateToStartDatePicker = false;
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
              controller.goWaterDataList();
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
