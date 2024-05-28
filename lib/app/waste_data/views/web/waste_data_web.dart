import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/waste_data/waste_data_controller.dart';
import 'package:cmms/app/widgets/add_waste_generated_dialog.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/waste_disposed_dialog%20copy.dart';
import 'package:cmms/domain/models/waste_data_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WasteDataWeb extends StatefulWidget {
  WasteDataWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WasteDataWeb> createState() => _WasteDataWebState();
}

class _WasteDataWebState extends State<WasteDataWeb> {
  TableCell headerCell(String text, {bool isHeader = false}) => TableCell(
        child: Container(
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
        ),
      );

  TableCell _actonData(PeriodData data) => TableCell(
        child: Center(
            child: Row(
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
      case 'consumedQty':
        return '${data.consumedQty}';
      case 'procuredQty':
        return '${data.procuredQty}';

      case 'opening':
        return '${data.opening}';

      case 'closingQty':
        return '${data.closingQty}';

      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WasteDataController>(
      id: 'WasteDataList',
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
                      Text(" / WASTE DATA LIST", style: Styles.greyLight14)
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
                                                    width:
                                                        MediaQuery.of(context)
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
                                        Obx(
                                          () => SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Container(
                                              color: Color.fromARGB(
                                                  255, 245, 248, 250),
                                              width: Get.width,
                                              height: Get.height,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: SingleChildScrollView(
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
                                                                            color:
                                                                                Colors.grey,
                                                                            width: 1),
                                                                        right: BorderSide(
                                                                            color:
                                                                                Colors.grey,
                                                                            width: 1),
                                                                        top: BorderSide(
                                                                            color:
                                                                                Colors.grey,
                                                                            width: 1),
                                                                      ),
                                                                    ),
                                                                    width: ((MediaQuery.of(context).size.width - 32) / controller.headerList.length) *
                                                                        element[
                                                                            'colSpan'],
                                                                    child: headerCell(
                                                                        element['label'])))),
                                                      ),
                                                      Table(
                                                        border: TableBorder.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                        columnWidths: const <int,
                                                            TableColumnWidth>{
                                                          0: FlexColumnWidth(),
                                                          1: FlexColumnWidth(),
                                                          2: FlexColumnWidth(),
                                                          3: FlexColumnWidth(),
                                                        },
                                                        children: [
                                                          TableRow(
                                                              children: []
                                                                ..addAll(controller
                                                                    .headerList
                                                                    .map((e) {
                                                                  return headerCell(
                                                                      e['subHeader']);
                                                                }))),
                                                          ...List<
                                                                  TableRow>.generate(
                                                              controller.wasteDataList
                                                                          .length >
                                                                      0
                                                                  ? controller
                                                                          .wasteDataList[
                                                                              0]
                                                                          .periods
                                                                          .length ??
                                                                      0
                                                                  : 0,
                                                              (index) =>
                                                                  TableRow(
                                                                      children: []
                                                                        ..addAll(controller
                                                                            .headerList
                                                                            .map((e) {
                                                                          if (e['dataKey'] ==
                                                                              'Month') {
                                                                            return dataCell('${controller.wasteDataList[0].periods[index].monthName}');
                                                                          }
                                                                          if (e['dataKey'] ==
                                                                              'action') {
                                                                            return _actonData(controller.wasteDataList[0].periods[index]);
                                                                          }
                                                                          DetailData? data = controller
                                                                              .wasteDataList[0]
                                                                              .periods[index]
                                                                              .details
                                                                              .firstWhereOrNull((element) => element.waste_type == e['label']);
                                                                          if (data ==
                                                                              null) {
                                                                            return dataCell('');
                                                                          }
                                                                          // return dataCell(
                                                                          //     "text");
                                                                          return dataCell(_CellData(data, e['dataKey'])) ??
                                                                              dataCell("");
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
                            controller.update(['WasteDataList']);
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

_showYearPicker(BuildContext context, WasteDataController controller) {
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
              controller.goWasteDataList();
              controller.update(['WasteDataList']);
              Navigator.of(context).pop();
            },
            label: "Select",
          ),
        ],
      );
    },
  );
}



// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/app/waste_data/waste_data_controller.dart';
// import 'package:cmms/app/widgets/add_waste_generated_dialog.dart';
// import 'package:cmms/app/widgets/date_picker.dart';
// import 'package:cmms/app/widgets/waste_disposed_dialog%20copy.dart';
// import 'package:cmms/domain/models/waste_data_list_model.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class WasteDataWeb extends StatefulWidget {
//   WasteDataWeb({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<WasteDataWeb> createState() => _WasteDataWebState();
// }

// class _WasteDataWebState extends State<WasteDataWeb> {
//   TableCell headerCell(String text, {bool isHeader = false}) => TableCell(
//         child: Container(
//           padding: EdgeInsets.all(8),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           decoration: isHeader
//               ? BoxDecoration(
//                   border: Border(
//                     right: BorderSide(
//                       width: 1.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )
//               : BoxDecoration(),
//         ),
//       );

//   TableCell _actonData(PeriodData data) => TableCell(
//         child: Center(
//             child: Row(
//           children: [
//             TableActionButton(
//               color: ColorValues.viewColor,
//               icon: Icons.remove_red_eye_outlined,
//               message: 'view',
//               onPress: () {
//                 Get.toNamed(
//                   Routes.viewWaterData,
//                   arguments: {"monthId": data.month_id, "year": data.year},
//                 );
//               },
//             ),
//             TableActionButton(
//               color: ColorValues.editColor,
//               icon: Icons.edit,
//               message: 'Edit',
//               onPress: () {
//                 Get.toNamed(
//                   Routes.viewWaterData,
//                   arguments: {"monthId": data.month_id, "year": data.year},
//                 );
//               },
//             ),
//           ],
//         )),
//       );
//   TableCell dataCell(String text) => TableCell(
//         child: Center(child: Text(text)),
//       );

//   _CellData(DetailData data, String type) {
//     switch (type) {
//       case 'consumedQty':
//         return '${data.consumedQty}';
//       case 'procuredQty':
//         return '${data.procuredQty}';

//       case 'opening':
//         return '${data.opening}';

//       case 'closingQty':
//         return '${data.closingQty}';

//       default:
//         return '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<WasteDataController>(
//       id: 'WasteDataList',
//       builder: (controller) {
//         return SelectionArea(
//           child: Column(
//             children: [
//               HeaderWidget(),
//               Container(
//                 height: 45,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color.fromARGB(255, 227, 224, 224),
//                     width: 1,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color:
//                           Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.home,
//                       color: ColorValues.greyLightColor,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Get.offNamed(Routes.home);
//                       },
//                       child: Text(
//                         "DASHBOARD",
//                         style: Styles.greyLight14,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Get.offNamed(Routes.misDashboard);
//                       },
//                       child: Text(" / MIS", style: Styles.greyLight14),
//                     ),
//                     Text(
//                       " / WASTE DATA",
//                       style: Styles.greyLight14,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.all(15),
//                   child: Card(
//                     color: Color.fromARGB(255, 245, 248, 250),
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 20,
//                                   top: 20,
//                                 ),
//                                 child: Text(
//                                   "Waste Data List",
//                                   style: Styles.blackBold16,
//                                 ),
//                               ),
//                               Spacer(),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 20,
//                                   right: 20,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Text('Year :'),
//                                     Dimens.boxWidth10,
//                                     CustomTextFieldForStock(
//                                       width:
//                                           MediaQuery.of(context).size.width / 5,
//                                       numberTextField: true,
//                                       onTap: () {
//                                         _showYearPicker(context, controller);
//                                       },
//                                       textController: controller.waterDateTc,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 20,
//                                   right: 5,
//                                 ),
//                                 child: ActionButton(
//                                   icon: Icons.minimize_sharp,
//                                   label: "Waste Generated",
//                                   onPressed: () {
//                                     Get.dialog(WasteGeneratedAddDialog());
//                                   },
//                                   color: ColorValues.appRedColor,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 20,
//                                   right: 20,
//                                 ),
//                                 child: ActionButton(
//                                   icon: Icons.add,
//                                   label: "Waste  Disposed",
//                                   onPressed: () {
//                                     Get.dialog(WasteDisposedAddDialog());
//                                   },
//                                   color: ColorValues.addNewColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Divider(
//                             color: ColorValues.greyLightColour,
//                           ),
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Obx(
//                               () => Container(
//                                 color: Color.fromARGB(255, 245, 248, 250),
//                                 width: Get.width * 7,
//                                 height: Get.height,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16),
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           children: []..addAll(
//                                               controller.mainHeaderList.map(
//                                                 (element) => Container(
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                     color: ColorValues
//                                                         .lightGreyColor,
//                                                     border: Border(
//                                                       left: BorderSide(
//                                                           color: Colors.grey,
//                                                           width: 1),
//                                                       right: BorderSide(
//                                                           color: Colors.grey,
//                                                           width: 1),
//                                                       top: BorderSide(
//                                                           color: Colors.grey,
//                                                           width: 1),
//                                                     ),
//                                                   ),
//                                                   width:
//                                                       ((MediaQuery.of(context)
//                                                                       .size
//                                                                       .width -
//                                                                   150) /
//                                                               controller
//                                                                   .headerList
//                                                                   .length) *
//                                                           element['colSpan'],
//                                                   child: headerCell(
//                                                     element['label'],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                         ),
//                                         Table(
//                                           border: TableBorder.all(
//                                               color: Colors.grey, width: 1),
//                                           columnWidths: const <int,
//                                               TableColumnWidth>{
//                                             0: FixedColumnWidth(100),
//                                             1: FixedColumnWidth(100),
//                                             2: FixedColumnWidth(100),
//                                             3: FixedColumnWidth(100),
//                                           },
//                                           children: [
//                                             TableRow(
//                                                 children: []..addAll(controller
//                                                       .headerList
//                                                       .map((e) {
//                                                     return headerCell(
//                                                         e['subHeader']);
//                                                   }))),
//                                             ...List<TableRow>.generate(
//                                               controller.wasteDataList.length >
//                                                       0
//                                                   ? controller.wasteDataList[0]!
//                                                           .periods.length ??
//                                                       0
//                                                   : 0,
//                                               (index) => TableRow(
//                                                 children: []..addAll(
//                                                     controller.headerList.map(
//                                                       (e) {
//                                                         if (e['dataKey'] ==
//                                                             'Month') {
//                                                           return dataCell(
//                                                             '${controller.wasteDataList[0]!.periods[index].monthName}',
//                                                           );
//                                                         }
//                                                         if (e['dataKey'] ==
//                                                             'action') {
//                                                           return _actonData(
//                                                             controller
//                                                                 .wasteDataList[
//                                                                     0]!
//                                                                 .periods[index],
//                                                           );
//                                                         }
//                                                         DetailData? data =
//                                                             controller
//                                                                 .wasteDataList[
//                                                                     0]!
//                                                                 .periods[index]
//                                                                 .details
//                                                                 .firstWhereOrNull(
//                                                           (element) =>
//                                                               element
//                                                                   .waste_type ==
//                                                               e['label'],
//                                                         );
//                                                         if (data == null) {
//                                                           return dataCell('');
//                                                         }
//                                                         return dataCell(
//                                                           _CellData(
//                                                             data,
//                                                             e['dataKey'],
//                                                           ),
//                                                         );
//                                                       },
//                                                     ),
//                                                   ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// DataColumn2 buildDataColumn(
//   // String columnName,
//   String header,

//   /// ColumnSize columnSize,
//   RxString filterText,
//   double? fixedWidth,
//   //  {required Function(String) onSearchCallBack}
// ) {
//   return //
//       DataColumn2(
//     // size: columnSize,
//     fixedWidth: fixedWidth,

//     label: //
//         Column(
//             mainAxisAlignment: MainAxisAlignment.center, //
//             children: [
//           SizedBox(
//             height: Get.height * 0.05,
//             child: TextField(
//               style: GoogleFonts.lato(
//                 textStyle:
//                     TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
//               ),
//               onChanged: (value) {
//                 filterText.value = value;
//                 //   onSearchCallBack(value);
//               },
//               textAlign: TextAlign.left,
//               decoration: InputDecoration(
//                 hintText: 'Filter',
//                 contentPadding:
//                     EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               header,
//               style: Styles.black16W500,
//             ),
//           ),
//         ]),
//     // ),
//   );
// }

// _showYearPicker(BuildContext context, WasteDataController controller) {
//   controller.selectedYear = DateTime.now().year;
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Select Year"),
//         content: Container(
//           height: 200,
//           child: CupertinoPicker(
//             itemExtent: 40,
//             onSelectedItemChanged: (int index) {
//               controller.selectedYear = DateTime.now().year - index;
//             },
//             children: List.generate(10, (index) {
//               return Center(
//                 child: Text((DateTime.now().year - index).toString()),
//               );
//             }),
//           ),
//         ),
//         actions: <Widget>[
//           ActionButton(
//             label: "Cancel", color: ColorValues.appRedColor,
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             // child: Text("Cancel"),
//           ),
//           Dimens.boxHeight10,
//           ActionButton(
//             color: ColorValues.addNewColor,
//             onPressed: () {
//               controller.waterDateTc.text = controller.selectedYear.toString();
//               controller.goWasteDataList();
//               controller.update(['WasteDataList']);
//               Navigator.of(context).pop();
//             },
//             label: "Select",
//           ),
//         ],
//       );
//     },
//   );
// }
