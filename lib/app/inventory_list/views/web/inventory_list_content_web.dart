import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/inventory_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class InventoryListContentWeb extends StatefulWidget {
  InventoryListContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<InventoryListContentWeb> createState() => _InventoryWebState();
}

class _InventoryWebState extends State<InventoryListContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryListController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () {
                final dataSource = InventoryListDataSource(controller);
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
                            Text("DASHBOARD", style: Styles.greyLight14),
                            InkWell(
                              onTap: () {
                                Get.offNamed(Routes.masterDashboard);
                              },
                              child:
                                  Text(" / MASTER", style: Styles.greyLight14),
                            ),
                            Text(
                              " / ASSETS LIST",
                              style: Styles.greyLight14,
                            ),
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
                                          "ASSETS LIST",
                                          style: Styles.blackBold16,
                                        ),
                                        Spacer(),
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
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kMasterFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveAddAccess)
                                                    .length >
                                                0
                                            ? ActionButton(
                                                icon: Icons.upload,
                                                label: 'importAsset'.tr,
                                                onPressed: () {
                                                  controller
                                                      .clearValueimportType();
                                                  Get.toNamed(
                                                      Routes.importInventory,
                                                      arguments: {
                                                        'importType':
                                                            AppConstants
                                                                .kImportAsset
                                                      });
                                                },
                                                color: ColorValues
                                                    .appDarkBlueColor,
                                              )
                                            : Dimens.box0,
                                        // Dimens.boxWidth10,
                                        SizedBox(width: 10),
                                        varUserAccessModel.value.access_list!
                                                    .where((e) =>
                                                        e.feature_id ==
                                                            UserAccessConstants
                                                                .kMasterFeatureId &&
                                                        e.add ==
                                                            UserAccessConstants
                                                                .kHaveAddAccess)
                                                    .length >
                                                0
                                            ? ActionButton(
                                                icon: Icons.add,
                                                label: "Add New",
                                                onPressed: () {
                                                  controller.clearStoreData();

                                                  Get.offNamed(Routes
                                                      .addInventoryScreen);
                                                },
                                                color: ColorValues.addNewColor,
                                              )
                                            : Dimens.box0,
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
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset:
                                                      const Offset(4.0, 2.0),
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
                                      Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(2.0, 1.0),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                          )
                                        ]),
                                        height: 35,
                                        margin: EdgeInsets.only(left: 10),
                                        child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appLightBlueColor,
                                            onPressed: () {
                                              controller.export();
                                            },
                                            text: 'Excel'),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 300,
                                        height: 40,
                                        margin: EdgeInsets.only(right: 5),
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
                                                width: 0.0,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 0.0,
                                              ),
                                            ),
                                            contentPadding:
                                                Dimens.edgeInsets05_10,
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
                                  controller.inventoryList.isEmpty == true &&
                                          controller.isLoading == false
                                      ? Center(child: Text('No data'))
                                      : controller.isLoading.value == true
                                          ? Center(
                                              child: Text('Data Loading......'))
                                          : Expanded(
                                              child: ValueListenableBuilder(
                                                  valueListenable: controller
                                                      .columnVisibility,
                                                  builder:
                                                      (context, value, child) {
                                                    final dataSource =
                                                        InventoryListDataSource(
                                                            controller);

                                                    return PaginatedDataTable2(
                                                      columnSpacing: 10,
                                                      dataRowHeight: 70,
                                                      source:
                                                          dataSource, // Custom DataSource class
                                                      // headingRowHeight:
                                                      //     Get.height * 0.1\,
                                                      minWidth: Get.width * 1.2,
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
                                                              .userDateFilterText,
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
            final controller = Get.find<InventoryListController>();
            controller.sortData(header);
          },

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
              Row(
          children: [
            Text(
              header,
              style: Styles.black16W500,
            ),
            if (header != "Actions")
              Obx(() {
                final controller = Get.find<InventoryListController>();

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

class InventoryListDataSource extends DataTableSource {
  final InventoryListController controller;

  late List<InventoryModel?> filterInventoryList;

  InventoryListDataSource(this.controller) {
    filtersInventoryList();
  }

  ///
  void filtersInventoryList() {
    filterInventoryList = <InventoryModel?>[];
    filterInventoryList = controller.inventoryList.where((InventoryList) {
      return (InventoryList!.id ?? '')
              .toString()
              .contains(controller.idFilterText.value.toLowerCase()) &&
          (InventoryList.name ?? '').toString().contains(controller
              .assetsNameFilterText.value
              .toLowerCase()
              .toUpperCase()
              .toString()) &&
          (InventoryList.serialNumber ?? '').toString().contains(controller
              .serialNoFilterText.value
              .toLowerCase()
              .toUpperCase()
              .toString()) &&
          (InventoryList.parentName ?? '').toString().contains(controller
              .parrentAssetFilterText.value
              .toLowerCase()
              .toUpperCase()
              .toString()) &&
          (InventoryList.categoryName ?? '').toString().contains(controller
              .catergoryFilterText.value
              .toLowerCase()
              .toUpperCase()
              .toString()) &&
          (InventoryList.blockName ?? '').toString().contains(controller
              .assetFacilityNameFilterText.value
              .toLowerCase()
              .toUpperCase()
              .toString()
              .toLowerCase()
              .toUpperCase()
              .toString());

      // Add other filter conditions as needed
    }).toList();
    // print({"filterInventoryList": filterInventoryList});
  }

  @override
  DataRow? getRow(int index) {
    // print({"getRow call"});
    final InventoryListDetails = filterInventoryList[index];

    controller.id.value = InventoryListDetails?.id ?? 0;
    var cellsBuffer = [
      // '${InventoryListDetails?.id ?? ''}',
      "id",
      '${InventoryListDetails?.name ?? ''}',

      '${InventoryListDetails?.serialNumber ?? ''}',

      '${InventoryListDetails?.parentName ?? ''}',
      '${InventoryListDetails?.categoryName ?? ''}',
      '${InventoryListDetails?.blockName ?? ''}',
      // '${InventoryListDetails?.description ?? ''}',
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
            child: (value == 'id')
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${InventoryListDetails?.id}',
                      ),
                      Dimens.boxHeight10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: Dimens.edgeInsets8_2_8_2,
                          decoration: BoxDecoration(
                            color: controller.inventoryList
                                        .firstWhere(
                                          (e) =>
                                              e?.id == InventoryListDetails!.id,
                                          orElse: () => InventoryModel(id: 00),
                                        )
                                        ?.status ==
                                    302
                                ? ColorValues.yellowColor
                                : ColorValues.addNewColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${InventoryListDetails?.status}',
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
                        TableActionButton(
                          color: ColorValues.viewColor,
                          icon: Icons.visibility,
                          message: 'View',
                          onPress: () {
                            controller.clearStoreData();
                            int inventoryId = InventoryListDetails?.id ?? 0;
                            if (inventoryId != 0) {
                              Get.toNamed(Routes.viewAddInventoryScreen,
                                  arguments: {
                                    'inventoryId': inventoryId,
                                  });
                            }
                          },
                          // onPress: () {
                          //   // controller.viewAddInventoryDetails(
                          //   //     id: int.tryParse('${record[2]}'));
                          //   // Get.toNamed(Routes.viewAddInventoryScreen);
                          // },
                        ),
                        //),p
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kMasterFeatureId &&
                                        e.edit ==
                                            UserAccessConstants.kHaveEditAccess)
                                    .length >
                                0
                            ? TableActionButton(
                                color: ColorValues.editColor,
                                icon: Icons.edit,
                                message: 'Edit',
                                onPress: () {
                                  controller.clearStoreData();

                                  int inventoryId =
                                      InventoryListDetails?.id ?? 0;
                                  if (inventoryId != 0) {
                                    Get.toNamed(Routes.addInventoryScreen,
                                        arguments: {
                                          'inventoryId': inventoryId,
                                        });
                                  }
                                },
                                // onPress: () {
                                //   // controller.showAddInventoryDetails(
                                //   //     id: int.tryParse('${record[2]}'));
                                //   // print('AddInV:${record[2]}');
                                // },
                              )
                            : Dimens.box0
                        //),
                      ])
                    : Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        controller.clearStoreData();
        int inventoryId = InventoryListDetails?.id ?? 0;
        if (inventoryId != 0) {
          Get.toNamed(Routes.viewAddInventoryScreen, arguments: {
            'inventoryId': inventoryId,
          });
        }
      },
    );
  }

  @override
  int get rowCount => filterInventoryList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}




// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';

// class InventoryListContentWeb extends GetView<InventoryListController> {
//   InventoryListContentWeb({super.key});

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
//                 Text(" / ASSETS LIST", style: Styles.greyMediumLight12),
//                 Spacer(),
//                 // ActionButton(
//                 //   icon: Icons.download,
//                 //   label: 'exportAsset'.tr,
//                 //   onPressed: () {},
//                 //   color: ColorValues.appLightBlueColor,
//                 // ),
//                 Dimens.boxWidth10,
//                 ActionButton(
//                   icon: Icons.upload,
//                   label: 'importAsset'.tr,
//                   onPressed: () {
//                     Get.toNamed(Routes.importInventory, arguments: 1);
//                   },
//                   color: ColorValues.appDarkBlueColor,
//                 ),
//                 Dimens.boxWidth10,
//                 ActionButton(
//                   icon: Icons.add,
//                   label: 'addAsset'.tr,
//                   onPressed: () {
//                     Get.toNamed(
//                       Routes.addInventoryScreen,
//                     );
//                   },
//                   color: ColorValues.appGreenColor,
//                 ),
//                 Dimens.boxWidth10,
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
//               child: GetBuilder<InventoryListController>(
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
//                                                   child:
//                                                       value.runtimeType
//                                                                   .toString() ==
//                                                               'AssetName'
//                                                           ? Builder(builder:
//                                                               (context) {
//                                                               final val = value
//                                                                   as AssetName;
//                                                               return Column(
//                                                                 children: [
//                                                                   Text(
//                                                                       '${val.name}'),
//                                                                   Spacer(),
//                                                                   // Align(
//                                                                   //   alignment: Alignment
//                                                                   //       .centerRight,
//                                                                   //   child: Container(
//                                                                   //     padding: Dimens
//                                                                   //         .edgeInsets8_2_8_2,
//                                                                   //     decoration:
//                                                                   //         BoxDecoration(
//                                                                   //       color: val.requirementStatus ==
//                                                                   //               1
//                                                                   //           ? ColorValues
//                                                                   //               .appRedColor
//                                                                   //           : ColorValues
//                                                                   //               .appGreenColor,
//                                                                   //       borderRadius:
//                                                                   //           BorderRadius
//                                                                   //               .circular(
//                                                                   //                   4),
//                                                                   //     ),
//                                                                   //     // child: Text(
//                                                                   //     //   val.name == 1
//                                                                   //     //       ? 'requirementRejected'
//                                                                   //     //           .tr
//                                                                   //     //       : 'requirementAccepted'
//                                                                   //     //           .tr,
//                                                                   //     //   style: Styles
//                                                                   //     //       .white10
//                                                                   //     //       .copyWith(
//                                                                   //     //     color: Colors
//                                                                   //     //         .white,
//                                                                   //     //   ),
//                                                                   //     // ),
//                                                                   //   ),
//                                                                   // ),

//                                                                   Dimens
//                                                                       .boxHeight10,
//                                                                 ],
//                                                               );
//                                                             })
//                                                           : value == 'Actions'
//                                                               ? Wrap(
//                                                                   children: [
//                                                                     Row(
//                                                                         children: [
//                                                                           TableActionButton(
//                                                                             color:
//                                                                                 ColorValues.viewColor,
//                                                                             icon:
//                                                                                 Icons.visibility,
//                                                                             message:
//                                                                                 'View',
//                                                                             onPress:
//                                                                                 () {
//                                                                               controller.viewAddInventoryDetails(id: int.tryParse('${record[2]}'));
//                                                                               Get.toNamed(Routes.viewAddInventoryScreen);
//                                                                             },
//                                                                           ),
//                                                                           //),p

//                                                                           TableActionButton(
//                                                                             color:
//                                                                                 ColorValues.appLightBlueColor,
//                                                                             icon:
//                                                                                 Icons.edit,
//                                                                             message:
//                                                                                 'Edit',
//                                                                             onPress:
//                                                                                 () {
//                                                                               controller.showAddInventoryDetails(id: int.tryParse('${record[2]}'));
//                                                                               print('AddInV:${record[2]}');
//                                                                             },
//                                                                           ),
//                                                                           //),

//                                                                           TableActionButton(
//                                                                             color:
//                                                                                 ColorValues.appRedColor,
//                                                                             icon:
//                                                                                 Icons.delete,
//                                                                             message:
//                                                                                 'Delete',
//                                                                             onPress:
//                                                                                 () {},
//                                                                           ),
//                                                                           //),
//                                                                         ]),
//                                                                     // TableActionButton(
//                                                                     //   color: ColorValues
//                                                                     //       .appGreenColor,
//                                                                     //   icon: Icons
//                                                                     //       .visibility,
//                                                                     //  message:
//                                                                     ////       'Approve Request',
//                                                                     //   onPress: () {},
//                                                                     // ),
//                                                                     // TableActionButton(
//                                                                     //   color: ColorValues
//                                                                     //       .appRedColor,
//                                                                     //   icon: Icons
//                                                                     //       .visibility,
//                                                                     //  message:
//                                                                     //       'Reject Request',
//                                                                     //   onPress: () {},
//                                                                     // ),
//                                                                   ],
//                                                                 )
//                                                               : Text(value
//                                                                   .toString()),
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
//                                                                   controller.viewAddInventoryDetails(
//                                                                       id: int.tryParse(
//                                                                           '${record[2]}'));
//                                                                   Get.toNamed(Routes
//                                                                       .viewAddInventoryScreen);
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
//                                                                   controller.showAddInventoryDetails(
//                                                                       id: int.tryParse(
//                                                                           '${record[2]}'));
//                                                                   print(
//                                                                       'AddInV:${record[2]}');
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
//                                                                   .only(
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
