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
                                                  columnSpacing: 10,
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
  return //
      DataColumn2(
    // size: columnSize,
    //fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          // SizedBox(
          //   height: Get.height * 0.05,
          //   child: TextField(
          //     style: GoogleFonts.lato(
          //       textStyle:
          //           TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          //     ),
          //     onChanged: (value) {
          //       filterText.value = value;
          //       //   onSearchCallBack(value);
          //     },
          //     textAlign: TextAlign.left,
          //     decoration: InputDecoration(
          //       hintText: 'Filter',
          //       contentPadding:
          //           EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: Colors.black),
          //       ),
          //     ),
          //   ),
          // ),
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
          (GrievanceList?.concern ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.ConcernFilterText.value.toLowerCase()) &&
          // (GrievanceList?.description ?? '')
          //     .toString()
          //     .toLowerCase()
          //     .contains(controller.DescriptionFilterText.value.toLowerCase()) &&
          (GrievanceList?.grievanceType ?? '').toLowerCase().contains(
              controller.GrievanceTypeFilterText.value.toLowerCase()) &&
          // (GrievanceList?.description ?? '')
          //     .toLowerCase()
          //     .contains(controller.DescriptionFilterText.value.toLowerCase()) &&
          (GrievanceList?.createdAt ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.CreatedAtFilterText.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final GrievanceDetails = grievanceListModel[index];

    //controller.permitId.value = GrievanceDetails?.id ?? 0;
    var cellsBuffer = [
      'GR${GrievanceDetails?.id ?? ''}',
      '${GrievanceDetails?.concern ?? ''}',
      // '${GrievanceDetails?.description ?? ''}',
      '${GrievanceDetails?.grievanceType ?? ''}',
      '${GrievanceDetails?.createdAt ?? ''}',
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
        // print({"entry.value removed": entry.key});
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'Actions')
                ? Wrap(
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
                        color: ColorValues.editColor,
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
                      // TableActionButton(
                      //   color: ColorValues.viewColor,
                      //   icon: Icons.view_column,
                      // ),
                    ],
                  )
                : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      // onSelectChanged: (_) {
      //   controller.viewNewPermitList(permitId: GrievanceDetails?.permitId);
      // },
    );
  }

  @override
  int get rowCount => grievanceListModel.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
