import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/calibration_tab_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddInventory extends StatelessWidget {
  AddInventory({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('${'hello'.tr}'),
        ),
        drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? HomeDrawer()
            : null,
        body: GetBuilder<HomeController>(
            id: 'add_inventory',
            builder: (controller) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? Dimens.box0
                      : HomeDrawer(),
                  Expanded(
                    child: Center(
                      child: Container(
                        margin: Dimens.edgeInsets16,
                        height: Get.height,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(.3)),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: Get.width,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomAppBar(
                                title: 'addInventory'.tr,
                                action: ActionButton(
                                  icon: Icons.menu,
                                  lable: 'Inventory List',
                                  onPress: () async {},
                                  color: Colors.green,
                                ),
                              ),
                              Dimens.boxHeight10,
                              AddPhoto(),
                              Dimens.boxHeight10,
                              Wrap(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: Dimens.edgeInsets16,
                                        constraints: BoxConstraints(
                                          maxWidth: 420,
                                          minWidth: 100,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 100,
                                              child: Text('Block: *'),
                                            ),
                                            Dimens.boxWidth10,
                                            Expanded(
                                              child: Container(
                                                // padding: Dimens.edgeInsets10_0_10_0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .hintColor
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    hint: Text(
                                                      'Select Block',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                      ),
                                                    ),
                                                    items: controller.blockList
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                int>(
                                                              value: item.id,
                                                              child: Text(
                                                                item.name ?? '',
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList(),
                                                    value: controller
                                                        .blockDropdownValue,
                                                    onChanged: (value) {
                                                      controller
                                                              .blockDropdownValue =
                                                          value;
                                                      controller.update(
                                                          ['add_inventory']);
                                                    },
                                                    buttonPadding:
                                                        EdgeInsets.only(
                                                            left: 8),
                                                    buttonHeight: 40,
                                                    buttonWidth: 140,
                                                    itemHeight: 40,
                                                    dropdownWidth: 200,
                                                    dropdownMaxHeight: 300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: Dimens.edgeInsets16,
                                    constraints: BoxConstraints(
                                      maxWidth: 420,
                                      minWidth: 100,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text('Parent Equipment *'),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                          child: Container(
                                            // padding: Dimens.edgeInsets10_0_10_0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .hintColor
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                hint: Text(
                                                  'Select Equipment',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                                items: controller
                                                    .parentEquipmentList
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: controller
                                                    .parentEquipmentDropdownValue,
                                                onChanged: (value) {
                                                  controller
                                                          .parentEquipmentDropdownValue =
                                                      value;
                                                  controller.update(
                                                      ['add_inventory']);
                                                },
                                                buttonPadding:
                                                    EdgeInsets.only(left: 8),
                                                buttonHeight: 40,
                                                buttonWidth: 140,
                                                itemHeight: 40,
                                                dropdownWidth: 200,
                                                dropdownMaxHeight: 300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // CustomTextField(
                                  //   label: 'Parent Equipment *',
                                  //   textController: controller
                                  //       .parentEquipmentTextController,
                                  //   readOnly: true,
                                  //   onTap: () {
                                  //     controller.getEquipmentList(
                                  //         facilityId: '45');
                                  //     Get.defaultDialog(
                                  //       title: 'Equipment List',
                                  //       content: Builder(
                                  //         builder: (context) {
                                  //           if (controller
                                  //               .equipmentList.isEmpty) {
                                  //             return CircularProgressIndicator
                                  //                 .adaptive();
                                  //           }
                                  //           return Container(
                                  //             height: Get.height * .4,
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(8),
                                  //             ),
                                  //             child: SingleChildScrollView(
                                  //               child: Column(
                                  //                 children: [
                                  //                   ...List.generate(
                                  //                     controller
                                  //                         .equipmentList.length,
                                  //                     (index) => ListTile(
                                  //                       onTap: () {
                                  //                         controller
                                  //                             .onSelectEquipment(
                                  //                                 controller
                                  //                                         .equipmentList[
                                  //                                     index]);
                                  //                         Get.back();
                                  //                       },
                                  //                       title: Text(
                                  //                           '${controller.equipmentList[index].name}'),
                                  //                     ),
                                  //                   ).toList(),
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           );
                                  //         },
                                  //       ),
                                  //     );
                                  //   },
                                  // ),

                                  Container(
                                    margin: Dimens.edgeInsets16,
                                    constraints: BoxConstraints(
                                      maxWidth: 420,
                                      minWidth: 100,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text('Type *'),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                          child: Container(
                                            // padding: Dimens.edgeInsets10_0_10_0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .hintColor
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                hint: Text(
                                                  'Select Type',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                                items: controller
                                                    .inventoryTypeList
                                                    .map((item) =>
                                                        DropdownMenuItem<int>(
                                                          value: item.id,
                                                          child: Text(
                                                            item.name ?? '',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: controller
                                                    .typeDropdownValue,
                                                onChanged: (value) {
                                                  controller.typeDropdownValue =
                                                      value;
                                                  controller.update(
                                                      ['add_inventory']);
                                                },
                                                buttonPadding:
                                                    EdgeInsets.only(left: 8),
                                                buttonHeight: 40,
                                                buttonWidth: 140,
                                                itemHeight: 40,
                                                dropdownWidth: 200,
                                                dropdownMaxHeight: 300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Wrap(
                                  //   children: [
                                  //     CustomTextField(
                                  //       label: 'Type *',
                                  //       textController:
                                  //           controller.typeTextController,
                                  //     ),
                                  //     Container(
                                  //       margin: Dimens.edgeInsets16,
                                  //       width: 100,
                                  //       color: Colors.black,
                                  //       child: ActionButton(
                                  //         lable: 'Add',
                                  //         onPress: () {},
                                  //         icon: Icons.add,
                                  //         color: Colors.blue,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  Container(
                                    margin: Dimens.edgeInsets16,
                                    constraints: BoxConstraints(
                                      maxWidth: 420,
                                      minWidth: 100,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text('Category *'),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                          child: Container(
                                            // padding: Dimens.edgeInsets10_0_10_0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .hintColor
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                hint: Text(
                                                  'Select Category',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                                items: controller
                                                    .inventoryCategoryList
                                                    .map((item) =>
                                                        DropdownMenuItem<int>(
                                                          value: item.id,
                                                          child: Text(
                                                            item.name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: controller
                                                    .categoryDropdownValue,
                                                onChanged: (value) {
                                                  controller
                                                          .categoryDropdownValue =
                                                      value;
                                                  controller.update(
                                                      ['add_inventory']);
                                                },
                                                buttonPadding:
                                                    EdgeInsets.only(left: 8),
                                                buttonHeight: 40,
                                                buttonWidth: 140,
                                                itemHeight: 40,
                                                dropdownWidth: 200,
                                                dropdownMaxHeight: 300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Wrap(
                                  //   children: [
                                  //     CustomTextField(
                                  //       label: 'Category *',
                                  //       textController:
                                  //           controller.categoryTextController,
                                  //     ),
                                  //     Container(
                                  //       margin: Dimens.edgeInsets16,
                                  //       width: 100,
                                  //       color: Colors.black,
                                  //       child: ActionButton(
                                  //         lable: 'Add',
                                  //         onPress: () {},
                                  //         icon: Icons.add,
                                  //         color: Colors.blue,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),

                                  // CustomTextField(
                                  //   label: 'Status',
                                  //   textController:
                                  //       controller.statusTextController,
                                  // ),
                                  Container(
                                    margin: Dimens.edgeInsets16,
                                    constraints: BoxConstraints(
                                      maxWidth: 420,
                                      minWidth: 100,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text('Status *'),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                          child: Container(
                                            // padding: Dimens.edgeInsets10_0_10_0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .hintColor
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                hint: Text(
                                                  'Select Status',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                  ),
                                                ),
                                                items: controller
                                                    .inventoryStatusList
                                                    .map((item) =>
                                                        DropdownMenuItem<int>(
                                                          value: item.id,
                                                          child: Text(
                                                            item.name ?? '',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: controller
                                                    .statusDropdownValue,
                                                onChanged: (value) {
                                                  controller
                                                          .statusDropdownValue =
                                                      value;
                                                  controller.update(
                                                      ['add_inventory']);
                                                },
                                                buttonPadding:
                                                    EdgeInsets.only(left: 8),
                                                buttonHeight: 40,
                                                buttonWidth: 140,
                                                itemHeight: 40,
                                                dropdownWidth: 200,
                                                dropdownMaxHeight: 300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  CustomTextField(
                                    label: 'Asset Name: *',
                                    textController: controller.assetNameTc,
                                    // controller.assetNameTextController,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextField(
                                        label: 'Serial No.',
                                        textController: controller.serialNoTc,
                                      ),
                                      CustomTextField(
                                        label: 'Enter Multiplier: ',
                                        textController:
                                            controller.enterMultiplierTc,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          label: 'Asset Description: ',
                                          maxLine: 6,
                                          textController:
                                              controller.assetDescriptionTc,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: Dimens.edgeInsets16,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(.3),
                                      ),
                                    ),
                                    child: DefaultTabController(
                                      length: 4,
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.grey.withOpacity(.2),
                                            child: TabBar(
                                              tabs: [
                                                Container(
                                                  height: 40,
                                                  child: Center(
                                                    child: Text('Calibration'),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  child: Center(
                                                    child: Text('Warranties'),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  child: Center(
                                                    child: Text('Purchasing'),
                                                  ),
                                                ),
                                                Container(
                                                  height: 40,
                                                  child: Center(
                                                    child: Text('Files'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 420,
                                            child: TabBarView(
                                              children: [
                                                CalibrationTabWidget(),
                                                WarrantyTab(),
                                                ManufacturarTab(),
                                                Files(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight15,
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Dimens.boxHeight30,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      );
}
