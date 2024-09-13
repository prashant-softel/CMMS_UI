import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_controller.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WarrantyCertificatesListContentWeb extends StatefulWidget {
  WarrantyCertificatesListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<WarrantyCertificatesListContentWeb> createState() =>
      _WarrantyCertificatesListContentWebState();
}

class _WarrantyCertificatesListContentWebState
    extends State<WarrantyCertificatesListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarrantyCertificatesListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () {
                final dataSource =
                    WarrantyClaimCertificateListDataSource(controller);
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
                                  Text(" / MASTER", style: Styles.greyLight14),
                            ),
                            Text(" / WARRANTY CLAIM CERTIFICATE LIST",
                                style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: Get.width * 7,
                            margin:
                                EdgeInsets.only(left: 10, top: 15, right: 10),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Warranty Claim Certificate List",
                                          style: Styles.blackBold16,
                                        ),
                                        // Spacer(),
                                        // Row(
                                        //   children: [
                                        //     CustomRichText(title: 'Date Range'),
                                        //     Dimens.boxWidth10,
                                        //     CustomTextFieldForStock(
                                        //       width: MediaQuery.of(context)
                                        //               .size
                                        //               .width /
                                        //           5,
                                        //       numberTextField: true,
                                        //       onTap: () {
                                        //         controller
                                        //                 .openFromDateToStartDatePicker =
                                        //             !controller
                                        //                 .openFromDateToStartDatePicker;
                                        //         controller.update(
                                        //             ['stock_Mangement_Date']);
                                        //       },
                                        //       hintText:
                                        //           '${controller.formattedFromdate} - ${controller.formattedTodate}',
                                        //     ),
                                        //   ],
                                        // ),
                                        // Dimens.boxWidth10,
                                        // varUserAccessModel.value.access_list!
                                        //             .where((e) =>
                                        //                 e.feature_id ==
                                        //                     UserAccessConstants
                                        //                         .kWarrantyClaimFeatureId &&
                                        //                 e.add ==
                                        //                     UserAccessConstants
                                        //                         .kHaveAddAccess)
                                        //             .length >
                                        //         0
                                        //     ? ActionButton(
                                        //         icon: Icons.add,
                                        //         label: "Add Warranty Claim",
                                        //         onPressed: () {
                                        //           // controller.clearStoreData();
                                        //           Get.toNamed(Routes
                                        //               .newWarrantyClaimList);
                                        //         },
                                        //         color: ColorValues.addNewColor,
                                        //       )
                                        //     : Dimens.box0
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
                                        width: 300,
                                        height: 40,
                                        // margin: Dimens.edgeInsets0_0_16_0,
                                        margin: EdgeInsets.only(right: 5),
                                        child: TextField(
                                          onChanged: (value) {
                                            controller.search(value);
                                          },
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
                                  controller.inventoryList.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text("Data Loading......"))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        WarrantyClaimCertificateListDataSource(
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
                                                              controller
                                                                      .filterText[
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

                                  // controller.getWarrantyClaimtListByDate();
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['stock_Mangement_Date']);

                                  // Get.toNamed(
                                  //   Routes.stockManagementGoodsOrdersScreen,
                                  // );
                                },
                                onCancel: () {
                                  controller.openFromDateToStartDatePicker =
                                      false;
                                  controller.update(['stock_Mangement_Date']);
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
           onSort: header == "Actions"
        ? null
        : (int columnIndex, bool ascending) {
            final controller = Get.find<WarrantyCertificatesListController>();
            controller.sortData(header);
          },

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          // SizedBox(
          //   height: Get.height * 0.05,
          //   child: TextField(
          //     onChanged: (value) {
          //       filterText.value = value;
          //       //   onSearchCallBack(value);
          //     },
          //     textAlign: TextAlign.left,
          //     style: TextStyle(height: 1.0),
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
           Row(
          children: [
            Text(
              header,
              style: Styles.black16W500,
            ),
            if (header != "Actions")
              Obx(() {
                final controller = Get.find<WarrantyCertificatesListController>();

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

class WarrantyClaimCertificateListDataSource extends DataTableSource {
  final WarrantyCertificatesListController controller;

  late List<InventoryModel?> filteredWarrantyClaimCertificateList;

  WarrantyClaimCertificateListDataSource(this.controller) {
    filtersWarramtyClaimCertificate();
  }

  ///
  void filtersWarramtyClaimCertificate() {
    filteredWarrantyClaimCertificateList = <InventoryModel?>[];
    filteredWarrantyClaimCertificateList =
        controller.inventoryList.where((WarrantyClaimCertificateList) {
      return (WarrantyClaimCertificateList?.name ?? '')
              .toString()
              .contains(controller.nameFilterText.value.toLowerCase()) &&
          (WarrantyClaimCertificateList?.serialNumber ?? '')
              .toString()
              .contains(
                  controller.serialNumberFilterText.value.toLowerCase()) &&
          (WarrantyClaimCertificateList?.id ?? '')
              .toString()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (WarrantyClaimCertificateList?.parentName ?? '')
              .toString()
              .contains(controller.parentNameFilterText.value.toLowerCase()) &&
          (WarrantyClaimCertificateList?.categoryName ?? '')
              .toString()
              .contains(
                  controller.categoryNameFilterText.value.toLowerCase()) &&
          (WarrantyClaimCertificateList?.operatorName ?? '')
              .toString()
              .contains(
                  controller.operatorNameFilterText.value.toLowerCase()) &&
          (WarrantyClaimCertificateList?.status ?? '')
              .toString()
              .contains(controller.statusFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredGoodsOrderList": filteredGoodsOrderList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final WarrantyClaimCertificateListDetails =
        filteredWarrantyClaimCertificateList[index];

    controller.id.value = WarrantyClaimCertificateListDetails?.id ?? 0;
    var cellsBuffer = [
      '${WarrantyClaimCertificateListDetails?.name ?? ''}',
      '${WarrantyClaimCertificateListDetails?.serialNumber ?? ''}',
      "id",
      '${WarrantyClaimCertificateListDetails?.parentName ?? ''}',
      '${WarrantyClaimCertificateListDetails?.categoryName ?? ''}',
      '${WarrantyClaimCertificateListDetails?.operatorName ?? ''}',
      '${WarrantyClaimCertificateListDetails?.status ?? ''}',
      // '${WarrantyClaimListDetails?.status ?? ''}',
      // 'Actions',
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
            child:
                (value == '${WarrantyClaimCertificateListDetails?.name ?? ''}')
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${WarrantyClaimCertificateListDetails?.name}',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Dimens.boxHeight10,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: Dimens.edgeInsets8_2_8_2,
                              decoration: BoxDecoration(
                                  color: controller.inventoryList
                                              .firstWhere(
                                                (e) =>
                                                    e?.id ==
                                                    WarrantyClaimCertificateListDetails!
                                                        .id,
                                                orElse: () =>
                                                    InventoryModel(id: 00),
                                              )
                                              ?.status ==
                                          "In Operation"
                                      ? ColorValues.appGreenColor
                                      : ColorValues.appRedColor),
                              child: Text(
                                '${WarrantyClaimCertificateListDetails?.status}',
                                style: Styles.white10.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : (value == 'id')
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${WarrantyClaimCertificateListDetails?.id}',
                              ),
                              Dimens.boxHeight10,
                              // Align(
                              //   alignment: Alignment.centerRight,
                              //   child: Container(
                              //     padding: Dimens.edgeInsets8_2_8_2,
                              //     decoration: BoxDecoration(
                              //         color: controller.warrantyClaimList
                              //                     .firstWhere(
                              //                       (e) =>
                              //                           e?.wc_id ==
                              //                           WarrantyClaimListDetails!.wc_id,
                              //                       orElse: () =>
                              //                           WarrantyClaimModel(wc_id: 00),
                              //                     )
                              //                     ?.status ==
                              //                 "Waiting for Submit Approval"
                              //             ? ColorValues.appGreenColor
                              //             : ColorValues.appRedColor),
                              //     child: Text(
                              //       '${WarrantyClaimListDetails?.status}',
                              //       style: Styles.white10.copyWith(
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          )
                        : (value == 'Actions')
                            ? Wrap(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TableActionButton(
                                      color: ColorValues.viewColor,
                                      icon: Icons.visibility,
                                      message: 'View',
                                      onPress: () {
                                        // controller.viewAddInventoryDetails(id: int.tryParse('${record[2]}'));
                                        // Get.toNamed(Routes.viewAddInventoryScreen);
                                      },
                                    ),
                                  ],
                                )
                              ])
                            : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      // onSelectChanged: (_) {
      //   // controller.clearStoreData();
      //   // controller.viewWarrantyClaim(wc_id: WarrantyClaimListDetails?.wc_id);
      // },
    );
  }

  @override
  int get rowCount => filteredWarrantyClaimCertificateList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

///////from below

// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';

// class WarrantyCertificatesListContentWeb
//     extends GetView<WarrantyCertificatesListController> {
//   WarrantyCertificatesListContentWeb({super.key});

//   ///

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: ColorValues.appBackgroundColor,
//       child: DefaultTabController(
//         length: 1,
//         child: Column(children: [
//           Container(
//             height: 45,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Color.fromARGB(255, 227, 224, 224),
//                 width: 1,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.home,
//                   color: ColorValues.greyLightColor,
//                 ),
//                 Text(
//                   "DASHBOARD",
//                   style: Styles.greyLight14,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Text(" / ASSETS", style: Styles.greyMediumLight12),
//                 ),
//                 Text(" / WARRANTY CERTIFICATES LIST",
//                     style: Styles.greyMediumLight12),
//                 // Spacer(),
//                 // ActionButton(
//                 //   icon: Icons.download,
//                 //   label: 'exportAsset'.tr,
//                 //   onPressed: () {},
//                 //   color: ColorValues.appLightBlueColor,
//                 // ),
//                 // Dimens.boxWidth10,
//                 // ActionButton(
//                 //   icon: Icons.upload,
//                 //   label: 'importAsset'.tr,
//                 //   onPressed: () {
//                 //     Get.toNamed(Routes.importInventory, arguments: 1);
//                 //   },
//                 //   color: ColorValues.appDarkBlueColor,
//                 // ),
//                 // Dimens.boxWidth10,
//                 // ActionButton(
//                 //   icon: Icons.add,
//                 //   label: 'addAsset'.tr,
//                 //   onPressed: () {
//                 //     Get.toNamed(
//                 //       Routes.addInventoryScreen,
//                 //     );
//                 //   },
//                 //   color: ColorValues.appGreenColor,
//                 // ),
//                 // Dimens.boxWidth10,
//                 // ActionButton(
//                 //   icon: Icons.close,
//                 //   label: 'retireAsset'.tr,
//                 //   onPressed: () async {},
//                 //   color: ColorValues.appRedColor,
//                 // ),
//               ],
//             ),
//           ),

//           // Align(
//           //   alignment: Alignment.centerLeft,
//           //   child: Container(
//           //     width: 400,
//           //     child: TabBar(
//           //       tabs: [
//           //         CustomTabBar(
//           //           label: 'listView'.tr,
//           //           icon: Icons.menu,
//           //         ),
//           //         // CustomTabBar(
//           //         //   label: 'treeView'.tr,
//           //         //   icon: Icons.account_tree_sharp,
//           //         // ),
//           //         // CustomTabBar(
//           //         //   label: 'mapView'.tr,
//           //         //   icon: Icons.location_on,
//           //         // ),
//           //       ],
//           //     ),
//           //   ),
//           // ),

//           ///
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 margin: Dimens.edgeInsets16_16_0_0,
//                 padding: Dimens.edgeInsets16_8_16_8,
//                 decoration: BoxDecoration(
//                   color: ColorValues.appLightBlueColor,
//                 ),
//                 child: Text(
//                   'columnVisibility'.tr,
//                   style: Styles.white12.copyWith(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 200,
//                 height: 35,
//                 margin: Dimens.edgeInsets0_0_16_0,
//                 child: TextField(
//                   onChanged: (value) => controller.search(value),
//                   decoration: InputDecoration(
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.grey, width: 0.0),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.grey, width: 0.0),
//                     ),
//                     contentPadding: Dimens.edgeInsets10_0_0_0,
//                     hintText: 'search'.tr,
//                     hintStyle: Styles.grey12,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           ///
//           Expanded(
//             child: Container(
//               child: GetBuilder<WarrantyCertificatesListController>(
//                   id: 'inventory_list',
//                   builder: (_controller) {
//                     return //
//                         Column(
//                             //
//                             children: [
//                           controller.inventoryList.isEmpty
//                               ? Expanded(
//                                   child: ScrollableTableView(
//                                     paginationController:
//                                         controller.paginationController,
//                                     columns: [
//                                       'assetName'.tr,
//                                       'serialNo'.tr,
//                                       'Id'.tr,
//                                       'parrentAsset'.tr,
//                                       'catergory'.tr,
//                                       'assetFacilityName'.tr,
//                                       'action'.tr,
//                                     ].map((column) {
//                                       return TableViewColumn(
//                                         minWidth: Get.width * 0.13,
//                                         label: column,
//                                       );
//                                     }).toList(),
//                                     rows: [
//                                       ...List.generate(
//                                         _controller.inventoryList.length,
//                                         (index) => ['', '', '', '', '', '', ''],
//                                       ),
//                                     ].map(
//                                       (record) {
//                                         return TableViewRow(
//                                           height: Get.height * 0.08,
//                                           cells: record.map(
//                                             (value) {
//                                               return TableViewCell(
//                                                 child: GestureDetector(
//                                                   onTap: () {
//                                                     print('${value} $record');
//                                                   },
//                                                   child: value.runtimeType
//                                                               .toString() ==
//                                                           'AssetName'
//                                                       ? Builder(
//                                                           builder: (context) {
//                                                           final val = value
//                                                               as AssetName;
//                                                           return Column(
//                                                             children: [
//                                                               Text(
//                                                                   '${val.name}'),
//                                                               Spacer(),
//                                                               // Align(
//                                                               //   alignment: Alignment
//                                                               //       .centerRight,
//                                                               //   child: Container(
//                                                               //     padding: Dimens
//                                                               //         .edgeInsets8_2_8_2,
//                                                               //     decoration:
//                                                               //         BoxDecoration(
//                                                               //       color: val.requirementStatus ==
//                                                               //               1
//                                                               //           ? ColorValues
//                                                               //               .appRedColor
//                                                               //           : ColorValues
//                                                               //               .appGreenColor,
//                                                               //       borderRadius:
//                                                               //           BorderRadius
//                                                               //               .circular(
//                                                               //                   4),
//                                                               //     ),
//                                                               //     // child: Text(
//                                                               //     //   val.name == 1
//                                                               //     //       ? 'requirementRejected'
//                                                               //     //           .tr
//                                                               //     //       : 'requirementAccepted'
//                                                               //     //           .tr,
//                                                               //     //   style: Styles
//                                                               //     //       .white10
//                                                               //     //       .copyWith(
//                                                               //     //     color: Colors
//                                                               //     //         .white,
//                                                               //     //   ),
//                                                               //     // ),
//                                                               //   ),
//                                                               // ),

//                                                               Dimens
//                                                                   .boxHeight10,
//                                                             ],
//                                                           );
//                                                         })
//                                                       : value == 'Actions'
//                                                           ? Wrap(
//                                                               children: [
//                                                                 Row(children: [
//                                                                   TableActionButton(
//                                                                     color: ColorValues
//                                                                         .viewColor,
//                                                                     icon: Icons
//                                                                         .visibility,
//                                                                     message:
//                                                                         'View',
//                                                                     onPress:
//                                                                         () {
//                                                                       // controller.viewAddInventoryDetails(id: int.tryParse('${record[2]}'));
//                                                                       // Get.toNamed(Routes.viewAddInventoryScreen);
//                                                                     },
//                                                                   ),
//                                                                   //),p

//                                                                   TableActionButton(
//                                                                     color: ColorValues
//                                                                         .appLightBlueColor,
//                                                                     icon: Icons
//                                                                         .edit,
//                                                                     message:
//                                                                         'Edit',
//                                                                     onPress:
//                                                                         () {
//                                                                       // controller.showAddInventoryDetails(id: int.tryParse('${record[2]}'));
//                                                                       // print('AddInV:${record[2]}');
//                                                                     },
//                                                                   ),
//                                                                   // ),

//                                                                   TableActionButton(
//                                                                     color: ColorValues
//                                                                         .appRedColor,
//                                                                     icon: Icons
//                                                                         .delete,
//                                                                     message:
//                                                                         'Delete',
//                                                                     onPress:
//                                                                         () {},
//                                                                   ),
//                                                                   //),
//                                                                 ]),
//                                                                 // TableActionButton(
//                                                                 //   color: ColorValues
//                                                                 //       .appGreenColor,
//                                                                 //   icon: Icons
//                                                                 //       .visibility,
//                                                                 //  message:
//                                                                 ////       'Approve Request',
//                                                                 //   onPress: () {},
//                                                                 // ),
//                                                                 // TableActionButton(
//                                                                 //   color: ColorValues
//                                                                 //       .appRedColor,
//                                                                 //   icon: Icons
//                                                                 //       .visibility,
//                                                                 //  message:
//                                                                 //       'Reject Request',
//                                                                 //   onPress: () {},
//                                                                 // ),
//                                                               ],
//                                                             )
//                                                           : Text(
//                                                               value.toString()),
//                                                 ),
//                                               );
//                                             },
//                                           ).toList(),
//                                         );
//                                       },
//                                     ).toList(),
//                                   ),
//                                 )
//                               : Expanded(
//                                   child: ScrollableTableView(
//                                     paginationController:
//                                         _controller.paginationController,
//                                     columns: [
//                                       'assetName'.tr,
//                                       'serialNo'.tr,
//                                       'Id'.tr,
//                                       'parrentAsset'.tr,
//                                       'catergory'.tr,
//                                       'assetFacilityName'.tr,
//                                       'action'.tr,
//                                     ].map((column) {
//                                       return TableViewColumn(
//                                         minWidth: Get.width * 0.13,
//                                         label: column,
//                                       );
//                                     }).toList(),
//                                     rows: [
//                                       ...List.generate(
//                                         _controller.inventoryList.length,
//                                         (index) => [
//                                           // AssetName(
//                                           //   '${_controller.inventoryList[index]!.name}',
//                                           //   1,
//                                           // ),
//                                           // index + 1,
//                                           '${controller.inventoryList[index]!.name}',
//                                           '${controller.inventoryList[index]!.serialNumber}',

//                                           '${controller.inventoryList[index]!.id}',
//                                           '${_controller.inventoryList[index]!.parentName}',
//                                           '${_controller.inventoryList[index]!.categoryName}',
//                                           '${_controller.inventoryList[index]!.operatorName}',
//                                           'Actions'
//                                         ],
//                                       ),
//                                     ].map(
//                                       (record) {
//                                         return TableViewRow(
//                                           height: Get.height * 0.08,
//                                           cells: record.map(
//                                             (value) {
//                                               return TableViewCell(
//                                                 child: GestureDetector(
//                                                   onTap: () {
//                                                     print('${value} $record');
//                                                   },
//                                                   child: value == 'Actions'
//                                                       ? Wrap(
//                                                           children: [
//                                                             Row(children: [
//                                                               TableActionButton(
//                                                                 color: ColorValues
//                                                                     .viewColor,
//                                                                 icon: Icons
//                                                                     .visibility,
//                                                                 message: 'View',
//                                                                 onPress: () {
//                                                                   // controller.viewAddInventoryDetails(
//                                                                   //     id: int.tryParse(
//                                                                   //         '${record[2]}'));
//                                                                   // Get.toNamed(Routes
//                                                                   //     .viewAddInventoryScreen);
//                                                                 },
//                                                               ),
//                                                               //),p

//                                                               TableActionButton(
//                                                                 color: ColorValues
//                                                                     .editColor,
//                                                                 icon:
//                                                                     Icons.edit,
//                                                                 message: 'Edit',
//                                                                 onPress: () {
//                                                                   // controller.showAddInventoryDetails(
//                                                                   //     id: int.tryParse(
//                                                                   //         '${record[2]}'));
//                                                                   // print(
//                                                                   //     'AddInV:${record[2]}');
//                                                                 },
//                                                               ),
//                                                               //),

//                                                               TableActionButton(
//                                                                 color: ColorValues
//                                                                     .deleteColor,
//                                                                 icon: Icons
//                                                                     .delete,
//                                                                 message:
//                                                                     'Delete',
//                                                                 onPress: () {},
//                                                               ),
//                                                               //),
//                                                             ]),
//                                                             // TableActionButton(
//                                                             //   color: ColorValues
//                                                             //       .appGreenColor,
//                                                             //   icon: Icons
//                                                             //       .visibility,
//                                                             //  message:
//                                                             //       'Approve Request',
//                                                             //   onPress: () {},
//                                                             // ),
//                                                             // TableActionButton(
//                                                             //   color: ColorValues
//                                                             //       .appRedColor,
//                                                             //   icon: Icons
//                                                             //       .visibility,
//                                                             //  message:
//                                                             //       'Reject Request',
//                                                             //   onPress: () {},
//                                                             // ),
//                                                           ],
//                                                         )
//                                                       : Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 25),
//                                                           child: Text(
//                                                               value.toString()),
//                                                         ),
//                                                 ),
//                                               );
//                                             },
//                                           ).toList(),
//                                         );
//                                       },
//                                     ).toList(),
//                                   ),
//                                 ),

//                           Center(
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 25),
//                               child: ValueListenableBuilder(
//                                   valueListenable:
//                                       controller.paginationController,
//                                   builder: (context, value, child) {
//                                     return Row(
//                                       children: [
//                                         Text(
//                                             "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: controller
//                                                           .paginationController
//                                                           .currentPage <=
//                                                       1
//                                                   ? null
//                                                   : () {
//                                                       controller
//                                                           .paginationController
//                                                           .previous();
//                                                     },
//                                               iconSize: 20,
//                                               splashRadius: 20,
//                                               icon: Icon(
//                                                 Icons
//                                                     .arrow_back_ios_new_rounded,
//                                                 color: controller
//                                                             .paginationController
//                                                             .currentPage <=
//                                                         1
//                                                     ? Colors.black26
//                                                     : Theme.of(context)
//                                                         .primaryColor,
//                                               ),
//                                             ),
//                                             IconButton(
//                                               onPressed: controller
//                                                           .paginationController
//                                                           .currentPage >=
//                                                       controller
//                                                           .paginationController
//                                                           .pageCount
//                                                   ? null
//                                                   : () {
//                                                       controller
//                                                           .paginationController
//                                                           .next();
//                                                     },
//                                               iconSize: 20,
//                                               splashRadius: 20,
//                                               icon: Icon(
//                                                 Icons.arrow_forward_ios_rounded,
//                                                 color: controller
//                                                             .paginationController
//                                                             .currentPage >=
//                                                         controller
//                                                             .paginationController
//                                                             .pageCount
//                                                     ? Colors.black26
//                                                     : Theme.of(context)
//                                                         .primaryColor,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                             ),
//                           ),

//                           ///
//                         ]);
//                     //);
//                   }),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
