import 'package:cmms/app/app.dart';
import 'package:cmms/app/checklist_Inspection/ChecklistInsp_list_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/add_dialog.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/minus_dialog.dart';
import 'package:cmms/domain/models/check_list_inspection_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ChecklistInspectionListWeb
    extends GetView<ChecklistInspectionListController> {
  ChecklistInspectionListWeb({
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

  TableCell _actonData(dynamic data) => TableCell(
        child: Center(
            child: Wrap(
          children: [
            TableActionButton(
              color: ColorValues.viewColor,
              icon: Icons.remove_red_eye_outlined,
              message: 'view',
              onPress: () {
                // Get.toNamed(Routes.viewWaterData,
                //     arguments: {"monthId": data.month_id, "year": data.year});
              },
            ),
            TableActionButton(
              color: ColorValues.editColor,
              icon: Icons.edit,
              message: 'Edit',
              onPress: () {
                // Get.toNamed(Routes.viewWaterData,
                //     arguments: {"monthId": data.month_id, "year": data.year});
              },
            ),
          ],
        )),
      );
  TableCell dataCell(String text) => TableCell(
        child: Center(child: Text(text)),
      );

  String _CellData(MonthlyInspection? data, String type) {
    // return daat==null ? "sd"
    switch (type) {
      case 'inspectionStatus':
        return '${data?.inspectionStatus}';
      case 'dateOfInspection':
        return '${data?.dateOfInspection}';

      case 'ChecklistAttachment':
        return '${data?.checklistAttachment}';

      case 'NoOfUnsafeObservations':
        return '${data?.noOfUnsafeObservations}';

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
    return GetBuilder<ChecklistInspectionListController>(
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
                      Text(" / CHECK LIST INSPECTION ",
                          style: Styles.greyLight14)
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
                                              "Check list Inspection",
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
                                          // Padding(
                                          //   padding: EdgeInsets.only(
                                          //     top: 20,
                                          //     right: 20,
                                          //   ),
                                          //   child: ActionButton(
                                          //     icon: Icons.add,
                                          //     label: "Procurements",
                                          //     onPressed: () {
                                          //       Get.dialog(AddDialog());
                                          //     },
                                          //     color: ColorValues.addNewColor,
                                          //   ),
                                          // ),
                                          // Padding(
                                          //   padding: EdgeInsets.only(
                                          //     top: 20,
                                          //     right: 5,
                                          //   ),
                                          //   child: ActionButton(
                                          //     icon: Icons.minimize_sharp,
                                          //     label: "Consumption",
                                          //     onPressed: () {
                                          //       Get.dialog(MinusDialog());
                                          //     },
                                          //     color: ColorValues.appRedColor,
                                          //   ),
                                          // )
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
                                                                  decoration: element[
                                                                          'isShow']
                                                                      ? BoxDecoration(
                                                                          color:
                                                                              ColorValues.lightGreyColor,
                                                                          border:
                                                                              Border(
                                                                            left:
                                                                                BorderSide(color: Colors.grey, width: 1),
                                                                            right:
                                                                                BorderSide(color: Colors.grey, width: 1),
                                                                            top:
                                                                                BorderSide(color: Colors.grey, width: 1),
                                                                          ),
                                                                        )
                                                                      : null,
                                                                  width: 150.0 *
                                                                      element[
                                                                          'colSpan'],
                                                                  child: element[
                                                                          'isShow']
                                                                      ? headerCell(
                                                                          element[
                                                                              'label'])
                                                                      : SizedBox()))),
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
                                                                return headerCell(
                                                                    e[
                                                                        'subHeader'],
                                                                    isHeader:
                                                                        true);
                                                              }))),
                                                        ...List<
                                                                TableRow>.generate(
                                                            (controller
                                                                    .checklist_inspection
                                                                    ?.checklist
                                                                    ?.length ??
                                                                0),
                                                            (index) => TableRow(
                                                                children: []
                                                                  ..addAll(controller
                                                                      .headerList
                                                                      .map((e) {
                                                                    if (e['dataKey'] ==
                                                                        'ChecklistName') {
                                                                      return dataCell(
                                                                          '${controller.checklist_inspection?.checklist?[index].checklistName}');
                                                                    }
                                                                    if (e['dataKey'] ==
                                                                        'SOPNumber') {
                                                                      return dataCell(
                                                                          '${controller.checklist_inspection?.checklist?[index].sOPNumber}');
                                                                    }
                                                                    if (e['dataKey'] ==
                                                                        'Frequency') {
                                                                      return dataCell(
                                                                          '${controller.checklist_inspection?.checklist?[index].frequency}');
                                                                    }

                                                                    // if (e['dataKey'] ==
                                                                    //     'action') {
                                                                    //   return _actonData(
                                                                    //       controller
                                                                    //           .inspectionData[index]);
                                                                    // }
                                                                    MonthlyInspection?
                                                                        data;
                                                                    try {
                                                                      data = controller
                                                                          .checklist_inspection
                                                                          ?.checklist?[
                                                                              index]
                                                                          .monthlyInspection
                                                                          ?.firstWhere(
                                                                              (element) => element.inspectionMonth == e['label'],
                                                                              orElse: null);
                                                                    } catch (e) {
                                                                      print(e);
                                                                    }

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

_showYearPicker(
    BuildContext context, ChecklistInspectionListController controller) {
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
              // controller.goWaterDataList();
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
