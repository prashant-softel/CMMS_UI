import 'package:cmms/app/app.dart';
import 'package:cmms/app/inventory_list/inventory_list_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class InventoryListContentWeb extends GetView<InventoryListController> {
  InventoryListContentWeb({super.key});

  ///

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorValues.appBackgroundColor,
      child: DefaultTabController(
        length: 3,
        child: Column(children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 227, 224, 224),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                Text(
                  "DASHBOARD",
                  style: Styles.greyLight14,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(" / INVENTORY", style: Styles.greyMediumLight12),
                ),
                Text(" / INVENTORY LIST", style: Styles.greyMediumLight12),
                Spacer(),
                ActionButton(
                  icon: Icons.download,
                  label: 'exportAsset'.tr,
                  onPressed: () {},
                  color: ColorValues.appDarkBlueColor,
                ),
                Dimens.boxWidth10,
                ActionButton(
                  icon: Icons.upload,
                  label: 'importAsset'.tr,
                  onPressed: () {},
                  color: ColorValues.appDarkBlueColor,
                ),
                Dimens.boxWidth10,
                ActionButton(
                  icon: Icons.add,
                  label: 'addAsset'.tr,
                  onPressed: () {
                    Get.toNamed(
                      Routes.addInventoryScreen,
                    );
                  },
                  color: ColorValues.appDarkBlueColor,
                ),
                Dimens.boxWidth10,
                ActionButton(
                  icon: Icons.close,
                  label: 'retireAsset'.tr,
                  onPressed: () async {},
                  color: ColorValues.appRedColor,
                ),
              ],
            ),
          ),

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
                  // CustomTabBar(
                  //   label: 'mapView'.tr,
                  //   icon: Icons.location_on,
                  // ),
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
                  color: ColorValues.appLightBlueColor,
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
              child: GetBuilder<InventoryListController>(
                  id: 'inventory_list',
                  builder: (_controller) {
                    return //
                        Column(
                            //
                            children: [
                          controller.inventoryList.isEmpty
                              ? Expanded(
                                  child: ScrollableTableView(
                                    paginationController:
                                        controller.paginationController,
                                    columns: [
                                      'assetName'.tr,
                                      'serialNo'.tr,
                                      'Id'.tr,
                                      'parrentAsset'.tr,
                                      'catergory'.tr,
                                      'assetFacilityName'.tr,
                                      'action'.tr,
                                    ].map((column) {
                                      return TableViewColumn(
                                        minWidth: Get.width * 0.17,
                                        label: column,
                                      );
                                    }).toList(),
                                    rows: [
                                      ...List.generate(
                                        _controller.inventoryList.length,
                                        (index) => ['', '', '', '', '', '', ''],
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
                                                  child:
                                                      value.runtimeType
                                                                  .toString() ==
                                                              'AssetName'
                                                          ? Builder(builder:
                                                              (context) {
                                                              final val = value
                                                                  as AssetName;
                                                              return Column(
                                                                children: [
                                                                  Text(
                                                                      '${val.name}'),
                                                                  Spacer(),
                                                                  // Align(
                                                                  //   alignment: Alignment
                                                                  //       .centerRight,
                                                                  //   child: Container(
                                                                  //     padding: Dimens
                                                                  //         .edgeInsets8_2_8_2,
                                                                  //     decoration:
                                                                  //         BoxDecoration(
                                                                  //       color: val.requirementStatus ==
                                                                  //               1
                                                                  //           ? ColorValues
                                                                  //               .appRedColor
                                                                  //           : ColorValues
                                                                  //               .appGreenColor,
                                                                  //       borderRadius:
                                                                  //           BorderRadius
                                                                  //               .circular(
                                                                  //                   4),
                                                                  //     ),
                                                                  //     // child: Text(
                                                                  //     //   val.name == 1
                                                                  //     //       ? 'requirementRejected'
                                                                  //     //           .tr
                                                                  //     //       : 'requirementAccepted'
                                                                  //     //           .tr,
                                                                  //     //   style: Styles
                                                                  //     //       .white10
                                                                  //     //       .copyWith(
                                                                  //     //     color: Colors
                                                                  //     //         .white,
                                                                  //     //   ),
                                                                  //     // ),
                                                                  //   ),
                                                                  // ),

                                                                  Dimens
                                                                      .boxHeight10,
                                                                ],
                                                              );
                                                            })
                                                          : value == 'Actions'
                                                              ? Wrap(
                                                                  children: [
                                                                    Row(
                                                                        children: [
                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appGreenColor,
                                                                            icon:
                                                                                Icons.visibility,
                                                                            label:
                                                                                'View',
                                                                            onPress:
                                                                                () {
                                                                              controller.viewAddInventoryDetails(id: int.tryParse('${record[2]}'));
                                                                              Get.toNamed(Routes.viewAddInventoryScreen);
                                                                            },
                                                                          ),
                                                                          //),p

                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appLightBlueColor,
                                                                            icon:
                                                                                Icons.edit,
                                                                            label:
                                                                                'Edit',
                                                                            onPress:
                                                                                () {
                                                                              controller.showAddInventoryDetails(id: int.tryParse('${record[2]}'));
                                                                              print('AddInV:${record[2]}');
                                                                            },
                                                                          ),
                                                                          //),

                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appRedColor,
                                                                            icon:
                                                                                Icons.delete,
                                                                            label:
                                                                                'Delete',
                                                                            onPress:
                                                                                () {},
                                                                          ),
                                                                          //),
                                                                        ]),
                                                                    // TableActionButton(
                                                                    //   color: ColorValues
                                                                    //       .appGreenColor,
                                                                    //   icon: Icons
                                                                    //       .visibility,
                                                                    //   label:
                                                                    //       'Approve Request',
                                                                    //   onPress: () {},
                                                                    // ),
                                                                    // TableActionButton(
                                                                    //   color: ColorValues
                                                                    //       .appRedColor,
                                                                    //   icon: Icons
                                                                    //       .visibility,
                                                                    //   label:
                                                                    //       'Reject Request',
                                                                    //   onPress: () {},
                                                                    // ),
                                                                  ],
                                                                )
                                                              : Text(value
                                                                  .toString()),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                )
                              : Expanded(
                                  child: ScrollableTableView(
                                    paginationController:
                                        controller.paginationController,
                                    columns: [
                                      'assetName'.tr,
                                      'serialNo'.tr,
                                      'Id'.tr,
                                      'parrentAsset'.tr,
                                      'catergory'.tr,
                                      'assetFacilityName'.tr,
                                      'action'.tr,
                                    ].map((column) {
                                      return TableViewColumn(
                                        minWidth: Get.width * 0.17,
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
                                          '${controller.inventoryList[index].id}',
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
                                                  child:
                                                      value.runtimeType
                                                                  .toString() ==
                                                              'AssetName'
                                                          ? Builder(builder:
                                                              (context) {
                                                              final val = value
                                                                  as AssetName;
                                                              return Column(
                                                                children: [
                                                                  Text(
                                                                      '${val.name}'),
                                                                  Spacer(),
                                                                  // Align(
                                                                  //   alignment: Alignment
                                                                  //       .centerRight,
                                                                  //   child: Container(
                                                                  //     padding: Dimens
                                                                  //         .edgeInsets8_2_8_2,
                                                                  //     decoration:
                                                                  //         BoxDecoration(
                                                                  //       color: val.requirementStatus ==
                                                                  //               1
                                                                  //           ? ColorValues
                                                                  //               .appRedColor
                                                                  //           : ColorValues
                                                                  //               .appGreenColor,
                                                                  //       borderRadius:
                                                                  //           BorderRadius
                                                                  //               .circular(
                                                                  //                   4),
                                                                  //     ),
                                                                  //     // child: Text(
                                                                  //     //   val.name == 1
                                                                  //     //       ? 'requirementRejected'
                                                                  //     //           .tr
                                                                  //     //       : 'requirementAccepted'
                                                                  //     //           .tr,
                                                                  //     //   style: Styles
                                                                  //     //       .white10
                                                                  //     //       .copyWith(
                                                                  //     //     color: Colors
                                                                  //     //         .white,
                                                                  //     //   ),
                                                                  //     // ),
                                                                  //   ),
                                                                  // ),

                                                                  Dimens
                                                                      .boxHeight10,
                                                                ],
                                                              );
                                                            })
                                                          : value == 'Actions'
                                                              ? Wrap(
                                                                  children: [
                                                                    Row(
                                                                        children: [
                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appGreenColor,
                                                                            icon:
                                                                                Icons.visibility,
                                                                            label:
                                                                                'View',
                                                                            onPress:
                                                                                () {
                                                                              controller.viewAddInventoryDetails(id: int.tryParse('${record[2]}'));
                                                                              Get.toNamed(Routes.viewAddInventoryScreen);
                                                                            },
                                                                          ),
                                                                          //),p

                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appLightBlueColor,
                                                                            icon:
                                                                                Icons.edit,
                                                                            label:
                                                                                'Edit',
                                                                            onPress:
                                                                                () {
                                                                              controller.showAddInventoryDetails(id: int.tryParse('${record[2]}'));
                                                                              print('AddInV:${record[2]}');
                                                                            },
                                                                          ),
                                                                          //),

                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appRedColor,
                                                                            icon:
                                                                                Icons.delete,
                                                                            label:
                                                                                'Delete',
                                                                            onPress:
                                                                                () {},
                                                                          ),
                                                                          //),
                                                                        ]),
                                                                    // TableActionButton(
                                                                    //   color: ColorValues
                                                                    //       .appGreenColor,
                                                                    //   icon: Icons
                                                                    //       .visibility,
                                                                    //   label:
                                                                    //       'Approve Request',
                                                                    //   onPress: () {},
                                                                    // ),
                                                                    // TableActionButton(
                                                                    //   color: ColorValues
                                                                    //       .appRedColor,
                                                                    //   icon: Icons
                                                                    //       .visibility,
                                                                    //   label:
                                                                    //       'Reject Request',
                                                                    //   onPress: () {},
                                                                    // ),
                                                                  ],
                                                                )
                                                              : Text(value
                                                                  .toString()),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),

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
