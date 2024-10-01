import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/header_widget_all_dash.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/plant_stock_report/plant_stock_report_controller.dart';
import 'package:cmms/app/sm_report/sm_report_list_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/multidropdown.dart';
import 'package:cmms/app/widgets/multipule_dropdown_web.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:cmms/domain/models/sm_report_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class SmReportContentWeb extends StatefulWidget {
  SmReportContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<SmReportContentWeb> createState() => _SmReportContentWebState();
}

class _SmReportContentWebState extends State<SmReportContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmReportController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return Obx(() {
            final dataSource = PlantListDataSource(controller);

            return SelectionArea(
              child: Column(children: [
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
                      Text(" /SM REPORT", style: Styles.greyLight14),
                      Spacer(),
                      Row(
                        children: [
                          Text("Available"),
                          Obx(
                            () => CustomSwitchTroggle(
                                value: controller.isToggleOn.value,
                                onChanged: (value) {
                                  controller.toggle();
                                }),
                          ),
                          Text("Consumption"),
                          SizedBox(width: 10),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(children: [
                      Container(
                        width: Get.width * 7,
                        margin: EdgeInsets.all(10),
                        height: Get.height * .85 - 10,
                        child: Card(
                          color: Color.fromARGB(255, 245, 248, 250),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Plant Stock Report",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    // Text(
                                    //   "Select Plants :",
                                    //   style: Styles.black15,
                                    // ),
                                    // Dimens.boxWidth2,
                                    // SizedBox(
                                    //   width: Get.width *
                                    //       .17, // Fixed width for dropdown
                                    //   child: Obx(
                                    //     () => CustomMultiDropdown(
                                    //       title: 'Select Plants',
                                    //       buttonText: 'Select Plants',
                                    //       initialValue:
                                    //           controller.selectedFacilityIdList,
                                    //       items: controller.facilityList
                                    //               ?.map(
                                    //                 (facility) =>
                                    //                     DropdownItem<Object>(
                                    //                   label: facility!.name,
                                    //                   value: facility.name,
                                    //                 ),
                                    //               )
                                    //               .toList() ??
                                    //           [],
                                    //       onConfirm: (selectedOptionsList) {
                                    //         controller.facilitySelected(
                                    //             selectedOptionsList);
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                    // Spacer(),
                                    Text(
                                      "Select Materials : ",
                                      style: Styles.black15,
                                    ),
                                    SizedBox(
                                      width: Get.width *
                                          .17, // Fixed width for dropdown
                                      child: Obx(() => CustomMultiDropdown(
                                            title: 'Select Material',
                                            buttonText: 'Select Material',
                                            initialValue: controller
                                                .selectedAssetsNameIdList,
                                            items: controller
                                                    .selectedAssetsNameList
                                                    ?.map((assets) {
                                                  return DropdownItem<Object>(
                                                    label: assets?.name ?? "",
                                                    value: assets?.name ?? "",
                                                  );
                                                }).toList() ??
                                                [],
                                            onConfirm: (selectedOptionsList) {
                                              controller.materialSelected(
                                                  selectedOptionsList);
                                            },
                                          )),
                                    ),

                                    // Container(
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
                                    //   child: MultipDropdownWebWidget(
                                    //     width:
                                    //         (MediaQuery.of(context).size.width *
                                    //             .21),
                                    //     //  height: 35,
                                    //     dropdownList: controller.assetList,
                                    //     selectedItems:
                                    //         controller.selectedAssetsNameList,
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
                                              '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                        ),
                                      ],
                                    ),
                                    Dimens.boxWidth15,
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 30,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appDarkBlueColor,
                                        onPressed: () {
                                          controller.isToggleOn.value == false
                                              ? controller
                                                  .getAvailbleSmReportList()
                                              : controller
                                                  .getCansumeSmReportList();
                                        },
                                        text: 'Search',
                                      ),
                                    ),
                                    // ActionButton(
                                    //   icon: Icons.add,
                                    //   label: "Add New",
                                    //   onPressed: () {
                                    //     final _flutterSecureStorage =
                                    //         const FlutterSecureStorage();

                                    //     _flutterSecureStorage.delete(key: "mrsId");
                                    //     Get.toNamed(Routes.createMrs);
                                    //   },
                                    //   color: ColorValues.addNewColor,
                                    // ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              // Row(
                              //   children: [
                              //     // Container(
                              //     //   height: 35,
                              //     //   margin: EdgeInsets.only(left: 10),
                              //     //   child: CustomElevatedButton(
                              //     //       backgroundColor:
                              //     //           ColorValues.appLightBlueColor,
                              //     //       onPressed: () {},
                              //     //       text: 'Copy'),
                              //     // ),
                              //     // Container(
                              //     //   height: 35,
                              //     //   margin: EdgeInsets.only(left: 10),
                              //     //   child: CustomElevatedButton(
                              //     //       backgroundColor:
                              //     //           ColorValues.appLightBlueColor,
                              //     //       onPressed: () {},
                              //     //       text: 'Excel'),
                              //     // ),
                              //     // Container(x
                              //     //   height: 35,
                              //     //   margin: EdgeInsets.only(left: 10),
                              //     //   child: CustomElevatedButton(
                              //     //       backgroundColor:
                              //     //           ColorValues.appLightBlueColor,
                              //     //       onPressed: () {},
                              //     //       text: 'PDF'),
                              //     // ),
                              //     PopupMenuButton<String>(
                              //       tooltip: "",
                              //       elevation: 25.0,
                              //       child: Container(
                              //         height: 35,
                              //         margin: EdgeInsets.only(left: 10),
                              //         padding: EdgeInsets.only(
                              //             top: 4, bottom: 4, right: 8, left: 8),
                              //         decoration: BoxDecoration(
                              //           color: ColorValues.appLightBlueColor,
                              //           borderRadius: BorderRadius.circular(5),
                              //         ),
                              //         child: Text(
                              //           'Column Visibility',
                              //           style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: 16,
                              //             fontWeight: FontWeight.w400,
                              //           ),
                              //         ),
                              //       ),
                              //       itemBuilder: (BuildContext context) =>
                              //           <PopupMenuEntry<String>>[]..addAll(
                              //                 controller.columnVisibility.value
                              //                     .entries
                              //                     .map((e) {
                              //               return PopupMenuItem<String>(
                              //                   child: ValueListenableBuilder(
                              //                       valueListenable: controller
                              //                           .columnVisibility,
                              //                       builder: (context, value,
                              //                           child) {
                              //                         return Row(
                              //                           children: [
                              //                             Checkbox(
                              //                               value: value[e.key],
                              //                               onChanged:
                              //                                   (newValue) {
                              //                                 controller
                              //                                     .setColumnVisibility(
                              //                                         e.key,
                              //                                         newValue!);
                              //                               },
                              //                             ),
                              //                             Text(e.key),
                              //                           ],
                              //                         );
                              //                       }));
                              //             })),
                              //       onSelected: (String value) {
                              //         // Handle column selection
                              //       },
                              //     ),
                              //     Container(
                              //       height: 35,
                              //       margin: EdgeInsets.only(left: 10),
                              //       child: CustomElevatedButton(
                              //           backgroundColor:
                              //               ColorValues.appLightBlueColor,
                              //           onPressed: () {
                              //           //  controller.export();
                              //           },
                              //           text: 'Excel'),
                              //     ),

                              //     Spacer(),
                              //     Container(
                              //       width: 300,
                              //       height: 40,
                              //       margin: EdgeInsets.only(right: 8),
                              //       child: TextField(
                              //         style: GoogleFonts.lato(
                              //           textStyle: TextStyle(
                              //               fontSize: 16.0,
                              //               height: 1.0,
                              //               color: Colors.black),
                              //         ),
                              //         onChanged: (value) =>
                              //             controller.search(value),
                              //         decoration: InputDecoration(
                              //           enabledBorder: const OutlineInputBorder(
                              //             borderSide: const BorderSide(
                              //               color: Colors.grey,
                              //               width: 0.0,
                              //             ),
                              //           ),
                              //           focusedBorder: const OutlineInputBorder(
                              //             borderSide: const BorderSide(
                              //               color: Colors.grey,
                              //               width: 0.0,
                              //             ),
                              //           ),
                              //           contentPadding: Dimens.edgeInsets05_10,
                              //           hintText: 'search'.tr,
                              //           hintStyle: Styles.grey16,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              Dimens.boxHeight5,
                              controller.smReportList.isEmpty == true &&
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
                                                    PlantListDataSource(
                                                        controller);

                                                return PaginatedDataTable2(
                                                  // fixedLeftColumns: 1,
                                                  // dataRowHeight:
                                                  // 70,
                                                  //Get.height * 0.10,
                                                  columnSpacing: 10,
                                                  source:
                                                      dataSource, // Custom DataSource class
                                                  // headingRowHeight: Get.height * 0.12,
                                                  // minWidth: Get.width * 0.7,
                                                  minWidth: 3000,
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
                                                          controller.filterText[
                                                              entry.key]!,
                                                          controller
                                                                  .columnwidth[
                                                              entry.key],
                                                        ),
                                                  ],
                                                );
                                              }),
                                        )
                            ],
                          ),
                        ),
                      ),
                      if (controller.openFromDateToStartDatePicker)
                        Positioned(
                          right: 150,
                          top: 85,
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
                              var dropDate =
                                  DateTime.parse(data.endDate.toString());
                              dropDate != null
                                  ? controller.toDate.value = dropDate
                                  : controller.toDate.value = pickUpDate;

                              // controller.getPlantStockListByDate();
                              controller.openFromDateToStartDatePicker = false;
                              controller.update(['stock_Mangement_Date']);

                              // Get.toNamed(
                              //   Routes.stockManagementGoodsOrdersScreen,
                              // );
                            },
                            onCancel: () {
                              controller.openFromDateToStartDatePicker = false;
                              controller.update(['stock_Mangement_Date']);
                            },
                          ),
                        ),
                    ]),
                  ),
                ),
              ]),
            );
          });
        });
  }

  DataColumn2 buildDataColumn(
    // String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
    //  {required Function(String) onSearchCallBack}
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,
      onSort: header == "Actions"
          ? null
          : (int columnIndex, bool ascending) {
              final controller = Get.find<SmReportController>();
              controller.sortData(header);
            },

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            // SizedBox(
            //   height: Get.height * 0.05,
            //   child: TextField(
            //     style: GoogleFonts.lato(
            //       textStyle: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.black),
            //     ),
            //     onChanged: (value) {
            //       filterText.value = value;
            //       //   onSearchCallBack(value);
            //     },
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //       hintText: 'Filter',
            //       contentPadding: EdgeInsets.fromLTRB(
            //           5, 0, 5, 0), // Reduced vertical padding
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
            Row(
              children: [
                Text(
                  header,
                  style: Styles.black16W500,
                ),
                if (header != "Actions")
                  Obx(() {
                    final controller = Get.find<SmReportController>();

                    return AnimatedRotation(
                      turns: controller.currentSortColumn.value == header
                          ? (controller.isAscending.value ? 0.5 : 0.0)
                          : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: Icon(
                        Icons.expand_more,
                        size: 20,
                      ),
                    );
                  }),
              ],
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     header,
            //     style: Styles.black16W500,
            //   ),
            // ),
          ]),
      // ),
    );
  }
}

class PlantListDataSource extends DataTableSource {
  final SmReportController controller;

  late List<SmReportListModel?> filteredPlantList;

  PlantListDataSource(this.controller) {
    filterMrss();
  }

  ///
  void filterMrss() {
    filteredPlantList = <SmReportListModel?>[];
    filteredPlantList = controller.smReportList.where((smReport) {
      return (smReport?.asset_code ?? '').toString().toLowerCase().contains(
              controller.materialCodeFilterText.value.toLowerCase()) &&
          (smReport?.material_Category ?? '').toLowerCase().contains(
              controller.materialcategoryFilterText.value.toLowerCase()) &&
          (smReport?.facility_ID ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.plantCodeFilterText.value.toLowerCase()) &&
          (smReport?.facility_Name ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.plantNameFilterText.value.toLowerCase()) &&
          (smReport?.inward ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.inwardFilterText.value.toLowerCase()) &&
          (smReport?.outward ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.outwardFilterText.value.toLowerCase()) &&
          (smReport?.act_available_qty ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.actQntyFilterText.value.toLowerCase()) &&
          (smReport?.min_available_qty ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.MinQntyFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredPlantList": filteredPlantList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final PlantDetails = filteredPlantList[index];
    // String nameWithoutSerial = (PlantDetails?.name ?? '').split(' (')[0];

    // controller.PlantId.value = PlantDetails?.asset_name ?? 0;
    var cellsBuffer = [
      '${PlantDetails?.asset_code ?? ''}',
      '${PlantDetails?.material_Category ?? ''}',
      "",
      "",
      // '${PlantDetails?.facility_ID ?? ''}',
      // '${PlantDetails?.facility_Name ?? ''}',
      '${PlantDetails?.inward ?? ''}',
      '${PlantDetails?.outward ?? ''}',
      '${PlantDetails?.min_available_qty ?? ''}',
      '${PlantDetails?.act_available_qty ?? ''}',
      "",
      '${PlantDetails?.comsumption_date ?? ''}',
      '${PlantDetails?.comsumed_qty ?? ''}',

      ""
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
    // cells.add('Actions');

    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,

      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            // child: Text(value.toString()),
            child: Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        // int assetId = PlantDetails?.assetItemID ?? 0;
        // if (assetId != 0) {
        //   Get.toNamed(Routes.plantStockReportDetails, arguments: {
        //     'assetId': assetId,
        //     'startdate': controller.formattedFromdate1,
        //     'enddate': controller.formattedTodate1,
        //   });
        // }

        // final _flutterSecureStorage = const FlutterSecureStorage();

        // _flutterSecureStorage.delete(key: "mrsId");
        // Get.toNamed(Routes.mrsViewScreen, arguments: {'mrsId': MrsDetails?.id});
      },
    );
  }

  @override
  int get rowCount => filteredPlantList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
