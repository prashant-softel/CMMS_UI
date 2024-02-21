import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class WarrantyClaimListWeb extends StatefulWidget {
  WarrantyClaimListWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WarrantyClaimListWeb> createState() => _WarrantyClaimListWebState();
}

class _WarrantyClaimListWebState extends State<WarrantyClaimListWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarrantyClaimController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () {
                final dataSource = WarrantyClaimListDataSource(controller);
                return SingleChildScrollView(
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
                                Get.offNamed(Routes.masterDashboard);
                              },
                              child:
                                  Text(" / MASTERS", style: Styles.greyLight14),
                            ),
                            Text(" / Warranty Claim List",
                                style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 30, right: 10),
                            height: Get.height,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Warranty Claim List",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
                                        Row(
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
                                                controller.update(
                                                    ['stock_Mangement_Date']);
                                              },
                                              hintText:
                                                  '${controller.formattedFromdate} - ${controller.formattedTodate}',
                                            ),
                                          ],
                                        ),
                                        Dimens.boxWidth10,
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kWarrantyClaimFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveAddAccess)
                                                    .length >
                                                0
                                            ? ActionButton(
                                                icon: Icons.add,
                                                label: "Add Warranty Claim",
                                                onPressed: () {
                                                  // controller.clearStoreData();
                                                  Get.toNamed(Routes
                                                      .newWarrantyClaimList);
                                                },
                                                color: ColorValues.addNewColor,
                                              )
                                            : Dimens.box0
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
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
                                          ),
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
                                                  controller.columnVisibility
                                                      .value.entries
                                                      .map((e) {
                                                return PopupMenuItem<String>(
                                                    child:
                                                        ValueListenableBuilder(
                                                            valueListenable:
                                                                controller
                                                                    .columnVisibility,
                                                            builder: (context,
                                                                value, child) {
                                                              return Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value: value[
                                                                        e.key],
                                                                    onChanged:
                                                                        (newValue) {
                                                                      controller.setColumnVisibility(
                                                                          e.key,
                                                                          newValue!);
                                                                    },
                                                                  ),
                                                                  Text(e.key),
                                                                ],
                                                              );
                                                            }));
                                              })),
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
                                          onChanged: (value) =>
                                              controller.search(value),
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  controller.warrantyClaimList.isEmpty
                                      ? Center(child: Text('No data'))
                                      : Expanded(
                                          child: ValueListenableBuilder(
                                              valueListenable:
                                                  controller.columnVisibility,
                                              builder: (context, value, child) {
                                                final dataSource =
                                                    WarrantyClaimListDataSource(
                                                        controller);

                                                return PaginatedDataTable2(
                                                  columnSpacing: 10,
                                                  dataRowHeight: 70,
                                                  source:
                                                      dataSource, // Custom DataSource class
                                                  // headingRowHeight:
                                                  //     Get.height * 0.12,
                                                  minWidth: 2500,
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
                                                    buildDataColumn(
                                                      'Actions',
                                                      controller
                                                          .actionFilterText,
                                                      150,
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          if (controller.openFromDateToStartDatePicker)
                            Positioned(
                              right: 150,
                              top: 85,
                              child: DatePickerWidget(
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
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
                                  PickerDateRange? data =
                                      value as PickerDateRange;

                                  var pickUpDate =
                                      DateTime.parse(data.startDate.toString());
                                  controller.fromDate.value = pickUpDate;
                                  var dropDate =
                                      DateTime.parse(data.endDate.toString());
                                  dropDate != null
                                      ? controller.toDate.value = dropDate
                                      : controller.toDate.value = pickUpDate;

                                  controller.getWarrantyClaimtListByDate();
                                  controller.openFromDateToStartDatePicker =
                                      !controller.openFromDateToStartDatePicker;
                                  controller.update(['stock_Mangement_Date']);

                                  // Get.toNamed(
                                  //   Routes.stockManagementGoodsOrdersScreen,
                                  // );
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
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

class WarrantyClaimListDataSource extends DataTableSource {
  final WarrantyClaimController controller;

  late List<WarrantyClaimModel?> filteredWarrantyClaimList;

  WarrantyClaimListDataSource(this.controller) {
    filtersWarramtyClaim();
  }

  ///
  void filtersWarramtyClaim() {
    filteredWarrantyClaimList = <WarrantyClaimModel?>[];
    filteredWarrantyClaimList =
        controller.warrantyClaimList.where((WarrantyClaimList) {
      return (WarrantyClaimList?.wc_id ?? '').toString().contains(
              controller.warrantyClaimIdFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.date_of_claim ?? '')
              .toString()
              .contains(controller.dateOfClaimFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.warranty_claim_title ?? '')
              .toString()
              .contains(controller.wcTitleFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_sr_no ?? '').toString().contains(
              controller.equipmentSrNoFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_category ?? '').toString().contains(
              controller.equipmentCategoryFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_name ?? '').toString().contains(
              controller.equipmentNameFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.estimated_cost ?? '').toString().contains(
              controller.estimatedCostFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.equipment_name ?? '').toString().contains(
              controller.equipmentNameFilterText.value.toLowerCase()) &&
          (WarrantyClaimList?.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredGoodsOrderList": filteredGoodsOrderList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final WarrantyClaimListDetails = filteredWarrantyClaimList[index];

    controller.wc_id.value = WarrantyClaimListDetails?.wc_id ?? 0;
    var cellsBuffer = [
      "wc_id",
      '${WarrantyClaimListDetails?.date_of_claim ?? ''}',
      '${WarrantyClaimListDetails?.warranty_claim_title ?? ''}',
      '${WarrantyClaimListDetails?.equipment_sr_no ?? ''}',
      '${WarrantyClaimListDetails?.equipment_category ?? ''}',
      '${WarrantyClaimListDetails?.equipment_name ?? ''}',
      '${WarrantyClaimListDetails?.estimated_cost ?? ''}',
      '${WarrantyClaimListDetails?.status ?? ''}',
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
            child: (value == 'wc_id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${WarrantyClaimListDetails?.wc_id}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                              color: controller.warrantyClaimList
                                          .firstWhere(
                                            (e) =>
                                                e?.wc_id ==
                                                WarrantyClaimListDetails!.wc_id,
                                            orElse: () =>
                                                WarrantyClaimModel(wc_id: 00),
                                          )
                                          ?.status ==
                                      "Waiting for Submit Approval"
                                  ? ColorValues.appGreenColor
                                  : ColorValues.appRedColor),
                          child: Text(
                            '${WarrantyClaimListDetails?.status}',
                            style: Styles.white10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : (value == 'Actions')
                    ? Wrap(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kWarrantyClaimFeatureId &&
                                            e.view ==
                                                UserAccessConstants
                                                    .kHaveViewAccess)
                                        .length >
                                    0
                                ? TableActionButton(
                                    color: ColorValues.appDarkBlueColor,
                                    icon: Icons.visibility,
                                    message: 'View',
                                    onPress: () {
                                      controller.viewWarrantyClaim(
                                          wc_id:
                                              WarrantyClaimListDetails?.wc_id);
                                      // print('record:${int.tryParse('${record[0]}')}');
                                    },
                                  )
                                : Dimens.box0,
                            //),
                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kWarrantyClaimFeatureId &&
                                            e.edit ==
                                                UserAccessConstants
                                                    .kHaveEditAccess)
                                        .length >
                                    0
                                ? TableActionButton(
                                    color: ColorValues.appYellowColor,
                                    icon: Icons.edit,
                                    message: 'Edit',
                                    onPress: () {
                                      controller.editWarrantyClaim(
                                          wc_id:
                                              WarrantyClaimListDetails?.wc_id);
                                      // print('edit record:${int.tryParse('${record[0]}')}');
                                    },
                                  )
                                : Dimens.box0,

                            varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kWarrantyClaimFeatureId &&
                                            e.approve ==
                                                UserAccessConstants
                                                    .kHaveApproveAccess)
                                        .length >
                                    0
                                ? TableActionButton(
                                    color: ColorValues.appGreenColor,
                                    icon: Icons.edit,
                                    message: 'Approve/Reject',
                                    onPress: () {
                                      controller.viewWarrantyClaim(
                                          wc_id:
                                              WarrantyClaimListDetails?.wc_id);
                                      // print('record:${int.tryParse('${record[0]}')}');
                                    },
                                  )
                                : Dimens.box0,
                          ],
                        )
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        // controller.clearStoreData();
        controller.viewWarrantyClaim(wc_id: WarrantyClaimListDetails?.wc_id);
      },
    );
  }

  @override
  int get rowCount => filteredWarrantyClaimList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/constant/constant.dart';
// import 'package:cmms/app/home/widgets/header_widget.dart';
// import 'package:cmms/app/navigators/navigators.dart';
// import 'package:cmms/app/utils/user_access_constants.dart';
// import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
// import 'package:cmms/app/widgets/custom_elevated_button.dart';
// import 'package:cmms/app/widgets/custom_richtext.dart';
// import 'package:cmms/app/widgets/date_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class WarrantyClaimListWeb extends StatefulWidget {
//   WarrantyClaimListWeb({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<WarrantyClaimListWeb> createState() => _WarrantyClaimListWebState();
// }

// class _WarrantyClaimListWebState extends State<WarrantyClaimListWeb> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<WarrantyClaimController>(
//         id: 'WarrantyClaimListWeb',
//         builder: (controller) {
//           return Scaffold(
//             body: Stack(
//               children: [
//                 Row(
//                   children: [
//                     (Responsive.isMobile(context) ||
//                             Responsive.isTablet(context))
//                         ? Dimens.box0
//                         : HomeDrawer(),
//                     Expanded(
//                       child: Obx(
//                         () => Container(
//                             color: ColorValues.lightBlueishColor,
//                             child: DefaultTabController(
//                                 length: 3,
//                                 child: Column(children: [
//                                   ///

//                                   Container(
//                                     height: 65,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(0),
//                                       border: Border.all(
//                                         color:
//                                             Color.fromARGB(255, 227, 224, 224),
//                                         width: 1,
//                                       ),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color:
//                                               Color.fromARGB(255, 236, 234, 234)
//                                                   .withOpacity(0.5),
//                                           spreadRadius: 2,
//                                           blurRadius: 5,
//                                           offset: Offset(0, 2),
//                                         ),
//                                       ],
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.home,
//                                           color: ColorValues.greyLightColor,
//                                         ),
//                                         Text(
//                                           "DASHBOARD",
//                                           style: Styles.greyLight14,
//                                         ),
//                                         GestureDetector(
//                                           onTap: () {
//                                             Get.back();
//                                           },
//                                           child: Text(" / Inventory",
//                                               style: Styles.greyMediumLight12),
//                                         ),
//                                         Text(" / Warranty Claim List",
//                                             style: Styles.greyMediumLight12),
//                                         // Text(" / Create Checklist Number",
//                                         //     style: Styles.greyMediumLight12)
//                                         SizedBox(
//                                           width: 350,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Dimens.boxHeight30,

//                                   ///
//                                   CustomAppBar(
//                                     title: 'Warranty Claim List'.tr,
//                                     action: Row(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             CustomRichText(title: 'Date Range'),
//                                             Dimens.boxWidth10,
//                                             CustomTextFieldForStock(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width /
//                                                   5,
//                                               numberTextField: true,
//                                               onTap: () {
//                                                 controller
//                                                         .openFromDateToStartDatePicker =
//                                                     !controller
//                                                         .openFromDateToStartDatePicker;
//                                                 controller.update(
//                                                     ['WarrantyClaimListWeb']);
//                                               },
//                                               hintText:
//                                                   '${controller.formattedTodate.toString()} - ${controller.formattedFromdate.toString()}',
//                                             ),
//                                           ],
//                                         ),
//                                         Dimens.boxWidth10,
//                                         varUserAccessModel.value.access_list!
//                                                     .where((e) =>
//                                                         e.feature_id ==
//                                                             UserAccessConstants
//                                                                 .kWarrantyClaimFeatureId &&
//                                                         e.add ==
//                                                             UserAccessConstants
//                                                                 .kHaveAddAccess)
//                                                     .length >
//                                                 0
//                                             ? ActionButton(
//                                                 icon: Icons.add,
//                                                 label: 'Add Warranty Claim',
//                                                 onPressed: () {
//                                                   Get.toNamed(Routes
//                                                       .newWarrantyClaimList);
//                                                 },
//                                                 color:
//                                                     ColorValues.appGreenColor,
//                                               )
//                                             : Container(),
//                                         Dimens.boxWidth10,
//                                       ],
//                                     ),
//                                   ),

//                                   ///
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         height: 35,
//                                         margin: EdgeInsets.only(left: 10),
//                                         child: CustomElevatedButton(
//                                           backgroundColor:
//                                               ColorValues.appLightBlueColor,
//                                           onPressed: () {},
//                                           text: 'columnVisibility'.tr,
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 35,
//                                         margin: EdgeInsets.only(left: 10),
//                                         child: CustomElevatedButton(
//                                           backgroundColor:
//                                               ColorValues.appLightBlueColor,
//                                           onPressed: () {},
//                                           text: 'PDF'.tr,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 620),
//                                         child: Container(
//                                           width: 200,
//                                           height: 35,
//                                           margin: Dimens.edgeInsets0_0_16_0,
//                                           child: TextField(
//                                             onChanged: (value) =>
//                                                 controller.search(value),
//                                             decoration: InputDecoration(
//                                               enabledBorder:
//                                                   const OutlineInputBorder(
//                                                 borderSide: const BorderSide(
//                                                     color: Colors.grey,
//                                                     width: 0.0),
//                                               ),
//                                               focusedBorder:
//                                                   const OutlineInputBorder(
//                                                 borderSide: const BorderSide(
//                                                     color: Colors.grey,
//                                                     width: 0.0),
//                                               ),
//                                               contentPadding:
//                                                   Dimens.edgeInsets10_0_0_0,
//                                               hintText: 'search'.tr,
//                                               hintStyle: Styles.grey12,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),

//                                   ///
//                                   Expanded(
//                                     child: Container(
//                                       child:
//                                           GetBuilder<WarrantyClaimController>(
//                                               id: 'warranty_claim_list',
//                                               builder: (controller) {
//                                                 return //
//                                                     Column(
//                                                         //
//                                                         children: [
//                                                       ///
//                                                       Expanded(
//                                                         child:
//                                                             ScrollableTableView(
//                                                           // paginationController:
//                                                           //     controller
//                                                           //         .paginationWarrantyController,
//                                                           columns: [
//                                                             'WC Id',
//                                                             'Date of Claim',
//                                                             'Warranty Claim Title',
//                                                             'Equipment Serial No.',
//                                                             'Equipment Category',
//                                                             'Equipment Name',
//                                                             // 'Warranty Description',
//                                                             'Estimated Cost',
//                                                             // 'Quantity',
//                                                             'Status',
//                                                             'action'.tr,
//                                                           ].map((column) {
//                                                             return TableViewColumn(
//                                                               minWidth:
//                                                                   Get.width *
//                                                                       0.1,
//                                                               label: column,
//                                                             );
//                                                           }).toList(),
//                                                           rows: [
//                                                             ...List.generate(
//                                                               controller
//                                                                   .warrantyClaimList
//                                                                   .length,
//                                                               (index) => [
//                                                                 // AssetName(

//                                                                 //    '${controller.warrantyClaimList[index].wc_id}',
//                                                                 //   // 'dummy data',
//                                                                 //   1,
//                                                                 // ),
//                                                                 // index + 1,
//                                                                 '${controller.warrantyClaimList[index]!.wc_id}',
//                                                                 '${controller.warrantyClaimList[index]!.date_of_claim}',
//                                                                 '${controller.warrantyClaimList[index]!.warranty_claim_title}',
//                                                                 '${controller.warrantyClaimList[index]!.equipment_sr_no}',
//                                                                 '${controller.warrantyClaimList[index]!.equipment_category}',
//                                                                 '${controller.warrantyClaimList[index]!.equipment_name}',
//                                                                 // '${controller.warrantyClaimList[index].warranty_description}',
//                                                                 '${controller.warrantyClaimList[index]!.estimated_cost}',
//                                                                 // '${controller.warrantyClaimList[index].quantity}',
//                                                                 '${controller.warrantyClaimList[index]!.status}',
//                                                                 'Actions'
//                                                               ],
//                                                             ),
//                                                           ].map(
//                                                             (record) {
//                                                               return TableViewRow(
//                                                                 height:
//                                                                     Get.height *
//                                                                         0.08,
//                                                                 cells:
//                                                                     record.map(
//                                                                   (value) {
//                                                                     return TableViewCell(
//                                                                       child:
//                                                                           GestureDetector(
//                                                                         onTap:
//                                                                             () {
//                                                                           print(
//                                                                               'warrantyiddata:$value');
//                                                                         },
//                                                                         child: value ==
//                                                                                 'Actions'
//                                                                             ? Wrap(
//                                                                                 children: [
//                                                                                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                                                                                     varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kWarrantyClaimFeatureId && e.view == UserAccessConstants.kHaveViewAccess).length > 0
//                                                                                         ? TableActionButton(
//                                                                                             color: ColorValues.appDarkBlueColor,
//                                                                                             icon: Icons.visibility,
//                                                                                             message: 'View',
//                                                                                             onPress: () {
//                                                                                               controller.viewWarrantyClaim(wc_id: int.tryParse('${record[0]}'));
//                                                                                               print('record:${int.tryParse('${record[0]}')}');
//                                                                                             },
//                                                                                           )
//                                                                                         : Container(),
//                                                                                     //),
//                                                                                     varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kWarrantyClaimFeatureId && e.edit == UserAccessConstants.kHaveEditAccess).length > 0
//                                                                                         ? TableActionButton(
//                                                                                             color: ColorValues.appYellowColor,
//                                                                                             icon: Icons.edit,
//                                                                                             message: 'Edit',
//                                                                                             onPress: () {
//                                                                                               controller.editWarrantyClaim(wc_id: int.tryParse('${record[0]}'));
//                                                                                               print('edit record:${int.tryParse('${record[0]}')}');
//                                                                                             },
//                                                                                           )
//                                                                                         : Container(),

//                                                                                     varUserAccessModel.value.access_list!.where((e) => e.feature_id == UserAccessConstants.kWarrantyClaimFeatureId && e.approve == UserAccessConstants.kHaveApproveAccess).length > 0
//                                                                                         ? TableActionButton(
//                                                                                             color: ColorValues.appGreenColor,
//                                                                                             icon: Icons.edit,
//                                                                                             message: 'Approve/Reject',
//                                                                                             onPress: () {
//                                                                                               controller.viewWarrantyClaim(wc_id: int.tryParse('${record[0]}'));
//                                                                                               print('record:${int.tryParse('${record[0]}')}');
//                                                                                             },
//                                                                                           )
//                                                                                         : Container(),

//                                                                                     // TableActionButton(
//                                                                                     //   color: Colors.green,
//                                                                                     //   icon: Icons.visibility,
//                                                                                     //   label: 'Approve/Reject',
//                                                                                     //   onPress: () {
//                                                                                     //     controller.viewWarrantyClaim(wc_id: int.tryParse('${record[0]}'));
//                                                                                     //   },
//                                                                                     // ),

//                                                                                     //),

//                                                                                     // TableActionButton(
//                                                                                     //   color: Colors.red,
//                                                                                     //   icon:
//                                                                                     //       Icons.delete,
//                                                                                     //   label: 'Delete',
//                                                                                     //   onPress: () {},
//                                                                                     // ),
//                                                                                     //),
//                                                                                   ]),

//                                                                                   // TableActionButton(
//                                                                                   //   color: Colors.red,
//                                                                                   //   icon: Icons
//                                                                                   //       .visibility,
//                                                                                   //   label:
//                                                                                   //       'Reject Request',
//                                                                                   //   onPress: () {},
//                                                                                   // ),
//                                                                                 ],
//                                                                               )
//                                                                             : Text(value.toString()),
//                                                                       ),
//                                                                     );
//                                                                   },
//                                                                 ).toList(),
//                                                               );
//                                                             },
//                                                           ).toList(),
//                                                         ),
//                                                       ),
//                                                       // paginated
//                                                       Center(
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       25),
//                                                           child:
//                                                               ValueListenableBuilder(
//                                                                   valueListenable:
//                                                                       controller
//                                                                           .paginationWarrantyController,
//                                                                   builder:
//                                                                       (context,
//                                                                           value,
//                                                                           child) {
//                                                                     return Row(
//                                                                       children: [
//                                                                         Text(
//                                                                             "${controller.paginationWarrantyController.currentPage}  of ${controller.paginationWarrantyController.pageCount}"),
//                                                                         Row(
//                                                                           children: [
//                                                                             IconButton(
//                                                                               onPressed: controller.paginationWarrantyController.currentPage <= 1
//                                                                                   ? null
//                                                                                   : () {
//                                                                                       controller.paginationWarrantyController.previous();
//                                                                                     },
//                                                                               iconSize: 20,
//                                                                               splashRadius: 20,
//                                                                               icon: Icon(
//                                                                                 Icons.arrow_back_ios_new_rounded,
//                                                                                 color: controller.paginationWarrantyController.currentPage <= 1 ? Colors.black26 : Theme.of(context).primaryColor,
//                                                                               ),
//                                                                             ),
//                                                                             IconButton(
//                                                                               onPressed: controller.paginationWarrantyController.currentPage >= controller.paginationWarrantyController.pageCount
//                                                                                   ? null
//                                                                                   : () {
//                                                                                       controller.paginationWarrantyController.next();
//                                                                                     },
//                                                                               iconSize: 20,
//                                                                               splashRadius: 20,
//                                                                               icon: Icon(
//                                                                                 Icons.arrow_forward_ios_rounded,
//                                                                                 color: controller.paginationWarrantyController.currentPage >= controller.paginationWarrantyController.pageCount ? Colors.black26 : Theme.of(context).primaryColor,
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ],
//                                                                     );
//                                                                   }),
//                                                         ),
//                                                       ),

//                                                       ///
//                                                     ]);
//                                                 //);
//                                               }),
//                                     ),
//                                   )
//                                 ]))),
//                       ),
//                     ),
//                   ],
//                 ),
//                 if (controller.openFromDateToStartDatePicker)
//                   Positioned(
//                     right: 230,
//                     top: 90,
//                     child: DatePickerWidget(
//                       selectionMode: DateRangePickerSelectionMode.range,
//                       monthCellStyle: DateRangePickerMonthCellStyle(
//                         todayCellDecoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: ColorValues.appDarkBlueColor),
//                       ), // last date of this year
//                       // controller: DateRangePickerController(),
//                       initialSelectedRange: PickerDateRange(
//                         controller.fromDate.value,
//                         controller.toDate.value,
//                       ),

//                       onSubmit: (value) {
//                         print('po valu ${value.toString()}');
//                         PickerDateRange? data = value as PickerDateRange;

//                         var pickUpDate =
//                             DateTime.parse(data.startDate.toString());
//                         controller.fromDate.value = pickUpDate;
//                         var dropDate = DateTime.parse(data.endDate.toString());
//                         dropDate != null
//                             ? controller.toDate.value = dropDate
//                             : controller.toDate.value = pickUpDate;

//                         controller.getWarrantyClaimtListByDate();
//                         controller.openFromDateToStartDatePicker =
//                             !controller.openFromDateToStartDatePicker;
//                         controller.update(['WarrantyClaimListWeb']);

//                         // Get.toNamed(
//                         //   Routes.stockManagementGoodsOrdersScreen,
//                         // );
//                       },
//                     ),
//                   ),
//               ],
//             ),
//           );
//         });
//   }
// }
