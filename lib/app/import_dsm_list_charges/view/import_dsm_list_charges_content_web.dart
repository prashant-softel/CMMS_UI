import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/import_dsm_list_charges/import_dsm_list_charges_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/domain/models/dsm_list_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';

class ImportDsmListChargesListContentWeb
    extends GetView<ImportDsmListChargesListController> {
  ImportDsmListChargesListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImportDsmListChargesListController>(
      id: 'dsm-list',
      builder: (controller) {
        // return Obx(() {

        return SelectionArea(
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
                        Get.offNamed(Routes.dsmDashboardScreen);
                      },
                      child:
                          Text(" / DSM DASHBOARD", style: Styles.greyLight14),
                    ),
                    Text(" / IMPORT F&S DSM CHARGES",
                        style: Styles.greyLight14),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Container(
                      width: Get.width * 7,
                      margin: EdgeInsets.all(10),
                      height: Get.height * .84,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "IMPORT F&S DSM CHARGES",
                                    style: Styles.blackBold16,
                                  ),
                                  Spacer(),
                                  PopupMenuButton<Widget>(
                                    constraints: BoxConstraints(minWidth: 460),
                                    elevation: 25.0,
                                    child: Container(
                                      height: 35,
                                      margin: EdgeInsets.only(left: 10),
                                      padding: EdgeInsets.only(
                                          top: 4, bottom: 4, right: 8, left: 8),
                                      decoration: BoxDecoration(
                                          color: ColorValues.appLightBlueColor,
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
                                        'Filter',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    itemBuilder: (BuildContext context) =>
                                        buildFilterPopupMenu(context),
                                  ),
                                  // Container(
                                  //   margin: EdgeInsets.only(right: 10),
                                  //   height: 30,
                                  //   child: CustomElevatedButton(
                                  //     icon: Icons.filter_alt_outlined,
                                  //     backgroundColor:
                                  //         ColorValues.appDarkBlueColor,
                                  //     text: 'Filter',
                                  //     onPressed: () {
                                  //       Get.dialog<void>(
                                  //         applyFilter(),
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                  Dimens.boxWidth10,
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: 30,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.approveColor,
                                      onPressed: () {
                                        controller.goToImportDsmChargesScreen();
                                      },
                                      text: '+ Upload Report ',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Dimens.boxHeight10,
                            Row(
                              children: [
                                PopupMenuButton<String>(
                                  tooltip: "",
                                  elevation: 25.0,
                                  child: Container(
                                    height: 35,
                                    margin: EdgeInsets.only(left: 10),
                                    padding: EdgeInsets.only(
                                        top: 4, bottom: 4, right: 8, left: 8),
                                    decoration: BoxDecoration(
                                        color: ColorValues.appLightBlueColor,
                                        borderRadius: BorderRadius.circular(5),
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
                                          controller
                                              .columnVisibility.value.entries
                                              .map(
                                            (e) {
                                              return PopupMenuItem<String>(
                                                child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder: (
                                                    context,
                                                    value,
                                                    child,
                                                  ) {
                                                    return Row(
                                                      children: [
                                                        Checkbox(
                                                          value: value[e.key],
                                                          onChanged:
                                                              (newValue) {
                                                            controller
                                                                .setColumnVisibility(
                                                              e.key,
                                                              newValue!,
                                                            );
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
                                //   height: 35,
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {},
                                //       text: 'Copy'),
                                // ),
                                // Container(
                                //   height: 35,
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {},
                                //       text: 'Excel'),
                                // ),
                                // Container(
                                //   height: 35,
                                //   margin: EdgeInsets.only(left: 10),
                                //   child: CustomElevatedButton(
                                //       backgroundColor:
                                //           ColorValues.appLightBlueColor,
                                //       onPressed: () {},
                                //       text: 'PDF'),
                                // ),
                                Spacer(),
                                Container(
                                  width: 300,
                                  height: 40,
                                  margin: Dimens.edgeInsets0_0_16_0,
                                  child: TextField(
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 16.0,
                                          height: 1.0,
                                          color: Colors.black),
                                    ),
                                    onChanged: (value) {
                                      controller.search(value);
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 0.0,
                                        ),
                                      ),
                                      contentPadding: Dimens.edgeInsets05_10,
                                      hintText: 'search'.tr,
                                      hintStyle: Styles.grey16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            controller.dsmDataList.isEmpty == true &&
                                    controller.isLoading == false
                                ? Center(
                                    child: Text('No data'),
                                  )
                                : controller.isLoading.value == true
                                    ? Center(
                                        child: Text("Data Loading......"),
                                      )
                                    : Expanded(
                                        child: ValueListenableBuilder(
                                          valueListenable:
                                              controller.columnVisibility,
                                          builder: (context, value, child) {
                                            final dataSource =
                                                DSMDataSource(controller);
                                            return PaginatedDataTable2(
                                              dataRowHeight: 45,
                                              source: dataSource,
                                              minWidth: Get.width * 2,
                                              rowsPerPage: 10,
                                              availableRowsPerPage: [
                                                10,
                                                20,
                                                30,
                                                50
                                              ],
                                              columns: [
                                                for (var entry in value.entries)
                                                  if (entry.value)
                                                    buildDataColumn(
                                                      entry.key,
                                                      controller.filterText[
                                                          entry.key]!,
                                                      controller.columnwidth[
                                                          entry.key],
                                                    ),
                                              ],
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
              ),
            ],
          ),
        );
      },
    );
  }

  List<PopupMenuEntry<Widget>> buildFilterPopupMenu(BuildContext context) {
    return [
      PopupMenuItem<Widget>(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: Get.height * .6,
            width: 460,
            constraints: BoxConstraints(maxHeight: 360),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Years: "),
                      SizedBox(
                        width: Get.width * .17,
                        child: CustomMultiSelectDialogField(
                          initialValue: controller.selectedYears,
                          items: controller.year
                              .map(
                                (years) => MultiSelectItem(
                                  years.name,
                                  years.name,
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller.yearsSelected(selectedOptionsList),
                          },
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Months: "),
                      SizedBox(
                        width: Get.width * .17,
                        child: CustomMultiSelectDialogField(
                          initialValue: controller.selectedMonths,
                          items: controller.month
                              .map(
                                (months) => MultiSelectItem(
                                  months.name,
                                  months.name,
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller.monthsSelected(selectedOptionsList),
                          },
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Facilities: "),
                      SizedBox(
                        width: Get.width * .17,
                        child: CustomMultiSelectDialogField(
                          initialValue: controller.selectedFacilities,
                          items: controller.facilityNameList
                              .map(
                                (facility) => MultiSelectItem(
                                  facility?.id ?? 0,
                                  facility?.name ?? "",
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller.facilitySelected(selectedOptionsList),
                          },
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select SPV: "),
                      SizedBox(
                        width: Get.width * .17,
                        child: CustomMultiSelectDialogField(
                          initialValue: controller.selectedSpv,
                          items: controller.spvList
                              .map(
                                (spv) => MultiSelectItem(
                                  spv?.id ?? 0,
                                  spv?.name ?? "",
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller.spvSelected(selectedOptionsList),
                          },
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select States: "),
                      SizedBox(
                        width: Get.width * .17,
                        child: CustomMultiSelectDialogField(
                          initialValue: controller.selectedState,
                          items: controller.stateList
                              .map(
                                (state) => MultiSelectItem(
                                  state?.id ?? 0,
                                  state?.name ?? "",
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller.stateSelected(selectedOptionsList),
                          },
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select DSM Type: "),
                      SizedBox(
                        width: Get.width * .17,
                        child: CustomMultiSelectDialogField(
                          initialValue: controller.selectedDSMType,
                          items: controller.dsmTypes
                              .map(
                                (dsmtype) => MultiSelectItem(
                                  dsmtype?.id ?? 0,
                                  dsmtype?.name ?? "",
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller.selectedDSMTypes(selectedOptionsList),
                          },
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      backgroundColor: ColorValues.navyBlueColor,
                      text: "Apply",
                      onPressed: () {
                        controller.getDSMDataList();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
  }

  // applyFilter() {
  //   return StatefulBuilder(
  //     builder: ((context, setState) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //         ),
  //         insetPadding: Dimens.edgeInsets10_0_10_0,
  //         contentPadding: EdgeInsets.zero,
  //         title: Text(
  //           'Filter',
  //           textAlign: TextAlign.center,
  //         ),
  //         content: Builder(
  //           builder: (context) {
  //             return Obx(
  //               () => Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //                 height: Get.height * .5,
  //                 width: 460,
  //                 constraints: BoxConstraints(maxHeight: 360),
  //                 child: SingleChildScrollView(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.stretch,
  //                     children: [
  //                       Divider(
  //                         color: ColorValues.greyLightColour,
  //                         thickness: 1,
  //                       ),
  //                       SizedBox(
  //                         height: 25,
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text("Select Years: "),
  //                           SizedBox(
  //                             width: Get.width * .17,
  //                             child: CustomMultiSelectDialogField(
  //                               initialValue: controller.selectedYears,
  //                               items: controller.year
  //                                   .map(
  //                                     (years) => MultiSelectItem(
  //                                       years.name,
  //                                       years.name,
  //                                     ),
  //                                   )
  //                                   .toList(),
  //                               onConfirm: (selectedOptionsList) => {
  //                                 controller.yearsSelected(selectedOptionsList),
  //                               },
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Dimens.boxHeight10,
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text("Select Months: "),
  //                           SizedBox(
  //                             width: Get.width * .17,
  //                             child: CustomMultiSelectDialogField(
  //                               initialValue: controller.selectedMonths,
  //                               items: controller.month
  //                                   .map(
  //                                     (months) => MultiSelectItem(
  //                                       months.name,
  //                                       months.name,
  //                                     ),
  //                                   )
  //                                   .toList(),
  //                               onConfirm: (selectedOptionsList) => {
  //                                 controller
  //                                     .monthsSelected(selectedOptionsList),
  //                               },
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Dimens.boxHeight10,
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text("Select Facilities: "),
  //                           SizedBox(
  //                             width: Get.width * .17,
  //                             child: CustomMultiSelectDialogField(
  //                               initialValue: controller.selectedFacilities,
  //                               items: controller.facilityNameList
  //                                   .map(
  //                                     (facility) => MultiSelectItem(
  //                                       facility?.id ?? 0,
  //                                       facility?.name ?? "",
  //                                     ),
  //                                   )
  //                                   .toList(),
  //                               onConfirm: (selectedOptionsList) => {
  //                                 controller
  //                                     .facilitySelected(selectedOptionsList),
  //                               },
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Dimens.boxHeight10,
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text("Select SPV: "),
  //                           SizedBox(
  //                             width: Get.width * .17,
  //                             child: CustomMultiSelectDialogField(
  //                               initialValue: controller.selectedSpv,
  //                               items: controller.spvList
  //                                   .map(
  //                                     (spv) => MultiSelectItem(
  //                                       spv?.id ?? 0,
  //                                       spv?.name ?? "",
  //                                     ),
  //                                   )
  //                                   .toList(),
  //                               onConfirm: (selectedOptionsList) => {
  //                                 controller.spvSelected(selectedOptionsList),
  //                               },
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Dimens.boxHeight10,
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text("Select States: "),
  //                           SizedBox(
  //                             width: Get.width * .17,
  //                             child: CustomMultiSelectDialogField(
  //                               initialValue: controller.selectedState,
  //                               items: controller.stateList
  //                                   .map(
  //                                     (state) => MultiSelectItem(
  //                                       state?.id ?? 0,
  //                                       state?.name ?? "",
  //                                     ),
  //                                   )
  //                                   .toList(),
  //                               onConfirm: (selectedOptionsList) => {
  //                                 controller.stateSelected(selectedOptionsList),
  //                               },
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //         actions: [
  //           Center(
  //             child: Container(
  //               height: 45,
  //               child: CustomElevatedButton(
  //                 backgroundColor: ColorValues.navyBlueColor,
  //                 text: "Apply",
  //                 onPressed: () {
  //                   controller.getDSMDataList();
  //                   Get.back();
  //                 },
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     }),
  //   );
  // }

  DataColumn2 buildDataColumn(
    // String columnName,
    String header,
    RxString filterText,
    double? fixedWidth,
  ) {
    return DataColumn2(
      fixedWidth: fixedWidth,
      label: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black15W400,
            ),
          ),
        ],
      ),
    );
  }
}

class DSMDataSource extends DataTableSource {
  DSMDataSource(this.controller) {
    filterDSMData();
  }

  final ImportDsmListChargesListController controller;
  late List<DSMData?> filteredDSMData;

  void filterDSMData() {
    filteredDSMData = <DSMData?>[];
    filteredDSMData = controller.dsmDataList.where((dsm) {
      return (dsm?.fy ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.fy.value.toLowerCase()) &&
          (dsm?.month ?? '')
              .toLowerCase()
              .contains(controller.months.value.toLowerCase()) &&
          (dsm?.state ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.state.value.toLowerCase()) &&
          (dsm?.spv ?? '')
              .toLowerCase()
              .contains(controller.spv.value.toLowerCase()) &&
          (dsm?.site ?? '')
              .toLowerCase()
              .contains(controller.site.value.toLowerCase()) &&
          (dsm?.dsmType ?? '')
              .toLowerCase()
              .contains(controller.dsmType.value.toLowerCase()) &&
          (dsm?.forcasterName ?? '')
              .toLowerCase()
              .contains(controller.forcasterName.value.toLowerCase()) &&
          // (dsm?.category ?? '')
          //     .toLowerCase()
          //     .contains(controller.category.value.toLowerCase()) &&
          (dsm?.dsmPenalty ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.dsmPenalty.value.toLowerCase()) &&
          (dsm?.actualKwh ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.actualKwh.value.toLowerCase()) &&
          (dsm?.scheduleKwh ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.scheduleKwh.value.toLowerCase()) &&
          (dsm?.dsmPer ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.dsmPer.value.toLowerCase());
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final dsmDetails = filteredDSMData[index];
    double dsmper = 0.0;
    if (dsmDetails?.dsmPer != null && dsmDetails?.dsmPer != 0.0) {
      dsmper = (dsmDetails!.dsmPer! / 10000);
    }

    var cellsBuffer = [
      '${dsmDetails?.fy ?? ''}',
      '${dsmDetails?.month ?? ''}',
      '${dsmDetails?.state ?? ''}',
      '${dsmDetails?.spv ?? ''}',
      '${dsmDetails?.site ?? ''}',
      '${dsmDetails?.dsmType ?? ''}',
      '${dsmDetails?.forcasterName ?? ''}',
      // '${dsmDetails?.category ?? ''}',
      // '${dsmDetails?.dsmPenalty ?? ''}',
      "dsmPenalty",
      '${dsmDetails?.actualKwh ?? ''}',
      '${dsmDetails?.scheduleKwh ?? ''}',
      '${dsmper.toString().substring(0, 5)}%',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        cells.add(cellsBuffer[i]);
      }
      i++;
    }

    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          value == "dsmPenalty"
              ? Text(
                  "${dsmDetails?.dsmPenalty}",
                  style: TextStyle(
                    color: dsmDetails?.category == "Actual"
                        ? Colors.green
                        : dsmDetails?.category == "Provision"
                            ? Colors.red
                            : Colors.black,
                  ),
                )
              : Text(
                  value.toString(),
                ),
        );
      }).toList(),
    );
  }

  @override
  int get rowCount => filteredDSMData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
