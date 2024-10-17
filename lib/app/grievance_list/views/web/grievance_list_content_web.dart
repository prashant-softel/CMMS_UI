import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/grievance_List_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../theme/color_values.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/table_action_button.dart';
import '../../grievance_list_controller.dart';

class GrievanceListContentWeb extends StatelessWidget {
  GrievanceListContentWeb({Key? key});
  Widget build(BuildContext context) {
    return GetBuilder<GrievanceController>(
      id: "grievance_list",
      builder: (controller) {
        return Obx(
          () => SelectionArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    HeaderWidget(),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 236, 234, 234)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ]),
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
                            child: Text(
                              " / MIS",
                              style: Styles.greyLight14,
                            ),
                          ),
                          Text(
                            " / GRIEVANCE LIST",
                            style: Styles.greyLight14,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: Get.width * 7,
                          height: Get.height * 0.85,
                          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                          child: Card(
                            color: Color.fromARGB(255, 245, 248, 250),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                    ),
                                    child: Text(
                                      "Grievance List",
                                      style: Styles.blackBold16,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
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
                                            controller
                                                    .openFromDateToStartDatePicker =
                                                !controller
                                                    .openFromDateToStartDatePicker;
                                            controller
                                                .update(['grievance_list']);
                                          },
                                          hintText:
                                              '${controller.formattedFromdate.toString()} - ${controller.formattedTodate.toString()}',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Dimens.boxWidth10,
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, right: 20),
                                      child: Row(
                                        children: [
                                          ActionButton(
                                            icon: Icons.add,
                                            label: "Add New",
                                            onPressed: () {
                                              Get.offNamed(Routes.addGrievance);
                                            },
                                            color: ColorValues.addNewColor,
                                          ),
                                        ],
                                      ))
                                ]),
                                Divider(
                                  color: ColorValues.greyLightColor,
                                ),
                                Row(
                                  children: [
                                    PopupMenuButton<String>(
                                      tooltip: "",
                                      elevation: 25.0,
                                      child: Container(
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            right: 8,
                                            left: 8),
                                        decoration: BoxDecoration(
                                            color:
                                                ColorValues.appLightBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: const Offset(4.0, 2.0),
                                                blurRadius: 5.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ]),
                                        child: Text(
                                          'Column Visibility',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>>[]..addAll(
                                              controller.columnVisibility.value
                                                  .entries
                                                  .map(
                                                (e) {
                                                  return PopupMenuItem<String>(
                                                    child:
                                                        ValueListenableBuilder(
                                                      valueListenable:
                                                          controller
                                                              .columnVisibility,
                                                      builder: (context, value,
                                                          child) {
                                                        return Row(
                                                          children: [
                                                            Checkbox(
                                                              value:
                                                                  value[e.key],
                                                              onChanged:
                                                                  (newValue) {
                                                                controller
                                                                    .setColumnVisibility(
                                                                        e.key,
                                                                        newValue!);
                                                              },
                                                            ),
                                                            Text(e.key),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                      onSelected: (String value) {
                                        // Handle column selection
                                      },
                                    ),
                                    // Container(
                                    //   decoration:
                                    //       BoxDecoration(boxShadow: [
                                    //     BoxShadow(
                                    //       color: Colors.black26,
                                    //       offset: const Offset(2.0, 1.0),
                                    //       blurRadius: 5.0,
                                    //       spreadRadius: 1.0,
                                    //     )
                                    //   ]),
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //       backgroundColor: ColorValues
                                    //           .appLightBlueColor,
                                    //       onPressed: () {
                                    //         // controller.export();
                                    //       },
                                    //       text: 'Excel'),
                                    // ),
                                    Spacer(),
                                    Container(
                                      width: 200,
                                      height: 35,
                                      margin: Dimens.edgeInsets0_0_16_0,
                                      child: TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        // onChanged: (value) =>
                                        //     controller.search(value),
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          contentPadding:
                                              Dimens.edgeInsets10_0_0_0,
                                          hintText: 'search'.tr,
                                          hintStyle: Styles.grey12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight20,
                                controller.grievanceList.isEmpty == true &&
                                        controller.isLoading == false
                                    ? Center(child: Text('No data'))
                                    : controller.isLoading.value == true
                                        ? Center(
                                            child: Text("Data Loading......"))
                                        : Expanded(
                                            child: ValueListenableBuilder(
                                              valueListenable:
                                                  controller.columnVisibility,
                                              builder: (context, value, child) {
                                                final dataSource =
                                                    GrievanceListDataSource(
                                                        controller);
                                                return PaginatedDataTable2(
                                                  columnSpacing: 8,
                                                  // dataRowHeight:
                                                  //     Get.height * 0.12,
                                                  dataRowHeight: 40,
                                                  source:
                                                      dataSource, // Custom DataSource class
                                                  // headingRowHeight:
                                                  // Get.height * 0.12,
                                                  // minWidth:
                                                  //     3000, //Get.width * 1.2,
                                                  showCheckboxColumn: false,
                                                  rowsPerPage:
                                                      10, // Number of rows per page
                                                  availableRowsPerPage: [
                                                    10,
                                                    20,
                                                    30,
                                                    50
                                                  ],
                                                  columns: [
                                                    for (var entry
                                                        in value.entries)
                                                      if (entry.value)
                                                        buildDataColumn(
                                                            entry.key,
                                                            controller
                                                                    .filterText[
                                                                entry.key]!
                                                            // controller
                                                            //         .columnwidth[
                                                            //     entry
                                                            //         .key],
                                                            ),
                                                    buildDataColumn(
                                                        'Actions',
                                                        controller
                                                            .ActionFilterText
                                                        //  150,
                                                        ),
                                                  ],
                                                );
                                              },
                                            ),
                                          )
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
                        controller.fromDate.value,
                        controller.toDate.value,
                      ),

                      onSubmit: (value) {
                        print('po valu ${value.toString()}');
                        PickerDateRange? data = value as PickerDateRange;

                        var pickUpDate =
                            DateTime.parse(data.startDate.toString());
                        controller.fromDate.value = pickUpDate;
                        var dropDate = DateTime.parse(data.endDate.toString());
                        dropDate != null
                            ? controller.toDate.value = dropDate
                            : controller.toDate.value = pickUpDate;

                        controller.getGrievanceListByDate();
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['grievance_list']);

                        // Get.toNamed(
                        //   Routes.stockManagementGoodsOrdersScreen,
                        // );
                      },
                      onCancel: () {
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['grievance_list']);
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  //double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  if (header == 'Resolution at Level') {
    return DataColumn2(
      label: SizedBox(
        width: 100, // Adjust width to ensure text doesn't overlap
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Resolution',
              textAlign: TextAlign.center, // Ensures text stays centered
            ),
            Text(
              'At Level',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  else if (header == 'Grievance Closed Date') {
    return DataColumn2(
      label: SizedBox(
        width: 100, // Adjust width to ensure text doesn't overlap
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Grievance',
              textAlign: TextAlign.center, // Ensures text stays centered
            ),
            Text(
              'Closed Date',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  else if (header == 'Date') {
    return DataColumn2(
      label: SizedBox(
        width: 100, // Adjust width to ensure text doesn't overlap
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Date',
              textAlign: TextAlign.center, // Ensures text stays centered
            ),
          ],
        ),
      ),
    );
  }
  else if (header == 'Actions') {
    return DataColumn2(
      label: SizedBox(
        width: 100, // Adjust width to ensure text doesn't overlap
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Actions',
              textAlign: TextAlign.center, // Ensures text stays centered
            ),
          ],
        ),
      ),
    );
  }
  return //
      DataColumn2(
    // size: columnSize,
    //fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
    // ),
  );
}

class GrievanceListDataSource extends DataTableSource {
  GrievanceListDataSource(this.controller) {
    filterUsers();
  }
  late List<GrievanceListModel?> grievanceListModel;
  late final GrievanceController controller;

  void filterUsers() {
    grievanceListModel = <GrievanceListModel?>[];
    grievanceListModel = controller.grievanceList.where((GrievanceList) {
      return (GrievanceList?.id ?? '').toString().toLowerCase().contains(
              controller.GrievanceTypeFilterText.value.toLowerCase()) &&
              
            (GrievanceList?.grievanceType ?? '').toLowerCase().contains(
              controller.GrievanceTypeFilterText.value.toLowerCase()) &&
              (GrievanceList?.createdAt ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.CreatedAtFilterText.value.toLowerCase()) &&
          (GrievanceList?.concern ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.ConcernFilterText.value.toLowerCase()) &&
              (GrievanceList?.resolutionLevel ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.ResolutionTypeFilterText.value.toLowerCase()) &&
          (GrievanceList?.actionTaken ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.ActionTakenFilterText.value.toLowerCase())&&
              (GrievanceList?.closedAt ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.GrievanceClosedDateFilterText.value.toLowerCase())&&
          (GrievanceList?.statusShort ?? '')
              .toLowerCase()
              .contains(controller.StatusShortFilterText.value.toLowerCase());
          
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final GrievanceDetails = grievanceListModel[index];

    //controller.permitId.value = GrievanceDetails?.id ?? 0;
    var cellsBuffer = [
      'GR${GrievanceDetails?.id ?? ''}',
      '${GrievanceDetails?.grievanceType ?? ''}',
      '${formatDateString(GrievanceDetails?.createdAt) ?? ''}',
      '${GrievanceDetails?.concern ?? ''}',
      '${_getResolutionLevelLabel(GrievanceDetails?.resolutionLevel)}',
      '${GrievanceDetails?.actionTaken ?? ''}',
      '${formatDateString(GrievanceDetails?.closedAt) ?? ''}',
      '${GrievanceDetails?.statusShort ?? ''}',
      'Actions',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
if (entry.value) {
      var cellValue = cellsBuffer[i];

      // Check if the column is "Resolution at Level" to center-align it
      if (entry.key == 'Resolution at Level') {
        cells.add(DataCell(
 // Apply padding to the right
      Padding(
            padding: EdgeInsets.only(left:35),
            child: Text(cellValue.toString()),
          ), // Center-align
        ));
        
      } else {
        cells.add(DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: Text(cellValue.toString()),
          ),
        ));
      }
      i++;
    }
  }

  // Add the "Actions" DataCell with buttons
  cells.add(DataCell(
    Wrap(
      children: [
        TableActionButton(
          color: ColorValues.editColor,
          icon: Icons.edit_outlined,
          message: "edit",
          onPress: () {
            int? id = GrievanceDetails?.id;
            controller.editGrievance(grievanceId: id);
          },
        ),
        TableActionButton(
          color: ColorValues.closeColor,
          icon: Icons.call_to_action_outlined,
          message: "action taken",
          onPress: () {
            int? id = GrievanceDetails?.id;
            controller.closeGrievance(grievanceId: id);
          },
        ),
        TableActionButton(
          color: ColorValues.deleteColor,
          icon: Icons.delete_outline,
          message: "delete",
          onPress: () {
            int? id = GrievanceDetails?.id;
            controller.deleteGrievanceDetails(grievanceId: id);
          },
        ),
      ],
    ),
  ));

  return DataRow.byIndex(
    index: index,
    cells: cells.map((value) => value as DataCell).toList(),
  );
}


String _getResolutionLevelLabel(int? resolutionLevel) {
  switch (resolutionLevel) {
    case 1:
      return 'L1';
    case 2:
      return 'L2';
    case 3:
      return 'L3';
    default:
      return  ''; // If it's not 1, 2, or 3, return the original value
  }
}



String formatDateString(String? dateString) {
  if (dateString == null || dateString.isEmpty || dateString == "0001-01-01T00:00:00" ||  dateString == "0001-01-01T05:30:00") {
    return ''; // Return an empty string if the date is null or empty
  }

  // Replace the 'T' with a space to format it as 'YYYY-MM-DD HH:MM:SS'
  String formattedDate = dateString.replaceAll('T', ' ');

  // Optionally, keep only the date and time but remove seconds and milliseconds
  return formattedDate.substring(0, 16); // Keep only YYYY-MM-DD HH:MM
}

  @override
  int get rowCount => grievanceListModel.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
