import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class InventoryListContentWeb extends GetView<HomeController> {
  InventoryListContentWeb({super.key});

  ///

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsValue.lightBlueishColor,
      child: DefaultTabController(
        length: 3,
        child: Column(children: [
          ///
          CustomAppBar(
            title: 'inventoryList'.tr,
            action: Row(
              children: [
                ActionButton(
                  icon: Icons.download,
                  lable: 'exportAsset'.tr,
                  onPress: () {},
                  color: Colors.blue,
                ),
                Dimens.boxWidth10,
                ActionButton(
                  icon: Icons.upload,
                  lable: 'importAsset'.tr,
                  onPress: () {
                    // var file = "assets/files/Fixed Asset Imports.xlsx";
                    // var bytes = File(file).readAsBytesSync();
                    // var excel = Excel.decodeBytes(bytes);

                    // for (var table in excel.tables.keys) {
                    //   print(table); //sheet Name
                    //   print(excel.tables[table]?.maxCols);
                    //   print(excel.tables[table]?.maxRows);
                    //   for (var row in excel.tables[table]!.rows) {
                    //     print("QWERTY $row");
                    //   }
                    // }
                  },
                  color: Colors.blue,
                ),
                Dimens.boxWidth10,
                ActionButton(
                  icon: Icons.add,
                  lable: 'addAsset'.tr,
                  onPress: () {
                    Get.to(() => AddInventory());
                  },
                  color: Colors.blue,
                ),
                Dimens.boxWidth10,
                ActionButton(
                  icon: Icons.close,
                  lable: 'retireAsset'.tr,
                  onPress: () async {
                    // ByteData data = await rootBundle
                    //     .load("assets/files/Fixed Asset Imports.xlsx");
                    // var bytes = data.buffer
                    //     .asUint8List(data.offsetInBytes, data.lengthInBytes);
                    // var excel = Excel.decodeBytes(bytes);

                    // for (var table in excel.tables.keys) {
                    //   print(table); //sheet Name
                    //   print(excel.tables[table]?.maxCols);
                    //   print(excel.tables[table]?.maxRows);
                    //   for (var row in excel.tables[table]!.rows) {
                    //     print("QWERTY $row");
                    //   }
                    // }
                  },
                  color: Colors.red,
                ),
              ],
            ),
          ),

          ///
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 400,
              child: TabBar(
                tabs: [
                  CustomTabBar(
                    label: 'listView'.tr,
                    icon: Icons.menu,
                  ),
                  CustomTabBar(
                    label: 'treeView'.tr,
                    icon: Icons.account_tree_sharp,
                  ),
                  CustomTabBar(
                    label: 'mapView'.tr,
                    icon: Icons.location_on,
                  ),
                ],
              ),
            ),
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: Dimens.edgeInsets16_16_0_0,
                padding: Dimens.edgeInsets16_8_16_8,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'columnVisibility'.tr,
                  style: Styles.white12.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 40,
                margin: Dimens.edgeInsets0_0_16_0,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    contentPadding: Dimens.edgeInsets10_0_0_0,
                    hintText: 'search'.tr,
                    hintStyle: Styles.grey12,
                  ),
                ),
              ),
            ],
          ),

          ///
          Expanded(
            child: Container(
              child: GetBuilder<HomeController>(
                  id: 'inventory_list',
                  builder: (_controller) {
                    return //
                        Column(
                            //
                            children: [
                          ///
                          Expanded(
                            child: ScrollableTableView(
                              paginationController:
                                  controller.paginationController,
                              columns: [
                                'assetName'.tr,
                                'serialNo'.tr,
                                'parrentAsset'.tr,
                                'catergory'.tr,
                                'assetFacilityName'.tr,
                                'action'.tr,
                              ].map((column) {
                                return TableViewColumn(
                                  minWidth: Get.width * 0.16,
                                  label: column,
                                );
                              }).toList(),
                              rows: [
                                ...List.generate(
                                  _controller.inventoryList.length,
                                  (index) => [
                                    AssetName(
                                      '${_controller.inventoryList[index].name}',
                                      1,
                                    ),
                                    index + 1,
                                    '${_controller.inventoryList[index].parentName}',
                                    '${_controller.inventoryList[index].categoryName}',
                                    '${_controller.inventoryList[index].operatorName}',
                                    'Actions'
                                  ],
                                ),
                              ].map(
                                (record) {
                                  return TableViewRow(
                                    height: Get.height * 0.15,
                                    cells: record.map(
                                      (value) {
                                        return TableViewCell(
                                          child: GestureDetector(
                                            onTap: () {
                                              print('${value} $record');
                                            },
                                            child: value.runtimeType
                                                        .toString() ==
                                                    'AssetName'
                                                ? Builder(builder: (context) {
                                                    final val =
                                                        value as AssetName;
                                                    return Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                            padding: Dimens
                                                                .edgeInsets8,
                                                            child: Text(
                                                                '${val.name}'),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Container(
                                                            padding: Dimens
                                                                .edgeInsets8_2_8_2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: val.requirementStatus ==
                                                                      1
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Text(
                                                              val.name == 1
                                                                  ? 'requirementRejected'
                                                                      .tr
                                                                  : 'requirementAccepted'
                                                                      .tr,
                                                              style: Styles
                                                                  .white10
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Dimens.boxHeight10,
                                                      ],
                                                    );
                                                  })
                                                : value == 'Actions'
                                                    ? Wrap(
                                                        children: [
                                                          Row(children: [
                                                            TableActionButton(
                                                              color:
                                                                  Colors.green,
                                                              icon: Icons
                                                                  .visibility,
                                                              label: 'View',
                                                              onPress: () {},
                                                            ),
                                                            //),

                                                            TableActionButton(
                                                              color:
                                                                  Colors.blue,
                                                              icon: Icons.edit,
                                                              label: 'Edit',
                                                              onPress: () {},
                                                            ),
                                                            //),

                                                            TableActionButton(
                                                              color: Colors.red,
                                                              icon:
                                                                  Icons.delete,
                                                              label: 'Delete',
                                                              onPress: () {},
                                                            ),
                                                            //),
                                                          ]),
                                                          TableActionButton(
                                                            color: Colors.green,
                                                            icon: Icons
                                                                .visibility,
                                                            label:
                                                                'Approve Request',
                                                            onPress: () {},
                                                          ),
                                                          TableActionButton(
                                                            color: Colors.red,
                                                            icon: Icons
                                                                .visibility,
                                                            label:
                                                                'Reject Request',
                                                            onPress: () {},
                                                          ),
                                                        ],
                                                      )
                                                    : Text(value.toString()),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          // paginated
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      controller.paginationController,
                                  builder: (context, value, child) {
                                    return Row(
                                      children: [
                                        Text(
                                            "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: controller
                                                          .paginationController
                                                          .currentPage <=
                                                      1
                                                  ? null
                                                  : () {
                                                      controller
                                                          .paginationController
                                                          .previous();
                                                    },
                                              iconSize: 20,
                                              splashRadius: 20,
                                              icon: Icon(
                                                Icons
                                                    .arrow_back_ios_new_rounded,
                                                color: controller
                                                            .paginationController
                                                            .currentPage <=
                                                        1
                                                    ? Colors.black26
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: controller
                                                          .paginationController
                                                          .currentPage >=
                                                      controller
                                                          .paginationController
                                                          .pageCount
                                                  ? null
                                                  : () {
                                                      controller
                                                          .paginationController
                                                          .next();
                                                    },
                                              iconSize: 20,
                                              splashRadius: 20,
                                              icon: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: controller
                                                            .paginationController
                                                            .currentPage >=
                                                        controller
                                                            .paginationController
                                                            .pageCount
                                                    ? Colors.black26
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ),

                          ///
                        ]);
                    //);
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
