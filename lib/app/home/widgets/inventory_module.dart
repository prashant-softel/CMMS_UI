import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class InventoryModule extends StatelessWidget {
  InventoryModule({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        id: 'inventory_list',
        builder: (_controller) => DefaultTabController(
          length: 3,
          child: Column(
            children: [
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
                        _controller.viewInventory = false;
                        _controller.serialNoTc.clear();
                        _controller.enterMultiplierTc.clear();
                        _controller.assetDescriptionTc.clear();
                        _controller.calibrationFrequencyTc.clear();
                        _controller.lastCalibrationDateTc.clear();
                        _controller.calibrationRemainderInTc.clear();
                        _controller.expireDateTc.clear();
                        _controller.certificationNumberTc.clear();
                        _controller.descriptionTc.clear();
                        _controller.modelTc.clear();
                        _controller.parentEquipmentsTc.clear();
                        _controller.costTc.clear();
                        _controller.blockDropdownValue = null;

                        _controller.parentEquipmentDropdownValue = null;
                        _controller.inventoryCategoryDropdownValue = null;
                        _controller.inventoryStatusDropdownValue = null;
                        _controller.inventoryTypeDropdownValue = null;
                        _controller.calibrationDropdownValue = null;
                        _controller.warrantyTypeDropdownValue = null;
                        _controller.warrantyProviderDropdownValue = null;
                        _controller.warrantyUsageDropdownValue = null;
                        _controller.manufacturerDropdownValue = null;
                        _controller.supplierDropdownValue = null;
                        _controller.currencyDropdownValue = null;
                        _controller.update(['add_inventory']);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: Dimens.edgeInsets16_10,
                    child: PopupMenuButton<String>(
                      offset: Offset(0, 45),
                      tooltip: '',
                      constraints: BoxConstraints(
                        maxHeight: Dimens.fourHundred,
                        minWidth: Dimens.hundred,
                        maxWidth: Dimens.twoHundredFifteen,
                      ),
                      onSelected: (String val) {},
                      child: Container(
                        padding: Dimens.edgeInsets16_8_16_8,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            'columnVisibility'.tr,
                            style: Styles.white12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      itemBuilder: (c) => _controller.inventoryColumnVisibility
                          .map(
                            (e) => PopupMenuItem<String>(
                              onTap: () {
                                e.isSelected = !e.isSelected;
                                _controller
                                    .buildSelectedInventoryColumnVisibility();
                              },
                              value: e.text,
                              child: Container(
                                height: Dimens.thirtyFive,
                                width: Get.width,
                                padding: Dimens.edgeInsets6_0_6_0,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                ),
                                child: Row(
                                  children: [
                                    _controller.checkSelectedColumnVisibility(
                                            columnName: e.text)
                                        ? Icon(
                                            Icons.check,
                                            color: ColorsValue.whiteColor,
                                            size: Dimens.fourteen,
                                          )
                                        : Dimens.box0,
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          e.text,
                                          style: Styles.white12.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
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
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(.2),
                    ),
                  ),
                  margin: Dimens.edgeInsets16,
                  child: ScrollableTableView(
                    columns:
                        // [
                        //   'assetName'.tr,
                        //   'serialNo'.tr,
                        //   'parentAsset'.tr,
                        //   'catergory'.tr,
                        //   'assetFacilityName'.tr,
                        //   'action'.tr,
                        // ]
                        _controller.selectedInventoryColumnVisibility
                            .map((column) {
                      return TableViewColumn(
                        minWidth: Get.width /
                            _controller
                                .selectedInventoryColumnVisibility.length,
                        label: column.text,
                      );
                    }).toList(),
                    rows: [
                      ...List.generate(
                        _controller.inventoryList.length,
                        (index) => [
                          if (_controller.buildSelectedInventoryList(
                              data: 'plantName'.tr))
                            '-',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetName'.tr))
                            '${_controller.inventoryList[index].name}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetDescription'.tr))
                            '${_controller.inventoryList[index].description}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'serialNo'.tr))
                            '${_controller.inventoryList[index].serialNumber}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'parentAsset'.tr))
                            '${_controller.inventoryList[index].parentName}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'category'.tr))
                            '${_controller.inventoryList[index].categoryName}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetFacilityName'.tr))
                            '${_controller.inventoryList[index].blockName}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetType'.tr))
                            '${_controller.inventoryList[index].type}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetStatus'.tr))
                            '${_controller.inventoryList[index].status}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetCustomerName'.tr))
                            '${_controller.inventoryList[index].customerName}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetOwnerName'.tr))
                            '${_controller.inventoryList[index].ownerName}',
                          if (_controller.buildSelectedInventoryList(
                              data: 'assetOperatorName'.tr))
                            '${_controller.inventoryList[index].operatorName}',
                          'Actions'
                        ],
                      ),
                    ].map(
                      (record) {
                        return TableViewRow(
                          height: 100,
                          cells: record.map(
                            (value) {
                              return TableViewCell(
                                child: GestureDetector(
                                  onTap: () {
                                    print('SOme');
                                    print('${value} $record');
                                  },
                                  child: value.runtimeType.toString() ==
                                          'AssetNames'
                                      ? Builder(builder: (context) {
                                          final val = value as AssetName;
                                          return Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: Dimens.edgeInsets8,
                                                  child: Text('${val.name}'),
                                                ),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Container(
                                                  padding:
                                                      Dimens.edgeInsets8_2_8_2,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        val.requirementStatus ==
                                                                1
                                                            ? Colors.red
                                                            : Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    val.name == 1
                                                        ? 'requirementRejected'
                                                            .tr
                                                        : 'requirementAccepted'
                                                            .tr,
                                                    style:
                                                        Styles.white10.copyWith(
                                                      color: Colors.white,
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
                                                TableActionButton(
                                                  color: Colors.green,
                                                  icon: Icons.visibility,
                                                  label: 'View',
                                                  onPress: () {
                                                    // print('Clicked');
                                                    // _controller.inventoryDetails(
                                                    //     inventoryId: );
                                                  },
                                                ),
                                                TableActionButton(
                                                  color: Colors.blue,
                                                  icon: Icons.edit,
                                                  label: 'Edit',
                                                  onPress: () {},
                                                ),
                                                TableActionButton(
                                                  color: Colors.red,
                                                  icon: Icons.delete,
                                                  label: 'Delete',
                                                  onPress: () {},
                                                ),
                                                TableActionButton(
                                                  color: Colors.green,
                                                  icon: Icons.visibility,
                                                  label: 'Approve Request',
                                                  onPress: () {},
                                                ),
                                                TableActionButton(
                                                  color: Colors.red,
                                                  icon: Icons.visibility,
                                                  label: 'Reject Request',
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
              ),
            ],
          ),
        ),
      );
}
