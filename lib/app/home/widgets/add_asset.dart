import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddInventory extends StatelessWidget {
  AddInventory({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('${'hello'.tr}'),
        ),
        drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? HomeDrawer()
            : null,
        body: Row(
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
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: 'addInventory'.tr,
                          action: ActionButton(
                            icon: Icons.menu,
                            label: 'Inventory List',
                            onPressed: () async {},
                            color: Colors.green, 
                          ),
                        ),
                        Dimens.boxHeight10,
                        AddPhoto(),
                        Dimens.boxHeight10,
                        Wrap(
                          children: [
                            GetBuilder<HomeController>(
                                id: 'block_field',
                                builder: (controller) {
                                  return CustomTextField(
                                    label: 'Block: *',
                                    textController:
                                        controller.blockTextController,
                                    readOnly: true,
                                    onTap: () {
                                      controller.getBlockList('45');
                                      Get.defaultDialog(
                                        title: 'Block List',
                                        content: GetBuilder<HomeController>(
                                          id: 'block_list',
                                          builder: (_controller) {
                                            if (controller.blockList.isEmpty) {
                                              return Dimens.box0;
                                            }
                                            return Container(
                                              height: Get.height * .4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    ...List.generate(
                                                      controller
                                                          .blockList.length,
                                                      (index) => ListTile(
                                                        onTap: () {
                                                          _controller.onSelectBlock(
                                                              _controller
                                                                      .blockList[
                                                                  index]);
                                                          Get.back();
                                                        },
                                                        title: Text(
                                                            '${_controller.blockList[index].name}'),
                                                      ),
                                                    ).toList(),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }),
                            CustomTextField(
                              label: 'Parent Equipment *',
                              textController:
                                  controller.parentEquipmentTextController,
                              readOnly: true,
                              onTap: () {
                                controller.getEquipmentList(facilityId: '45');
                                Get.defaultDialog(
                                  title: 'Equipment List',
                                  content: GetBuilder<HomeController>(
                                    id: 'equipment_list',
                                    builder: (_controller) {
                                      if (controller.equipmentList.isEmpty) {
                                        return CircularProgressIndicator
                                            .adaptive();
                                      }
                                      return Container(
                                        height: Get.height * .4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ...List.generate(
                                                controller.equipmentList.length,
                                                (index) => ListTile(
                                                  onTap: () {
                                                    _controller.onSelectEquipment(
                                                        _controller.equipmentList[index]);
                                                    Get.back();
                                                  },
                                                  title: Text(
                                                      '${_controller.equipmentList[index].name}'),
                                                ),
                                              ).toList(),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            Wrap(
                              children: [
                                CustomTextField(
                                  label: 'Type *',
                                  textController: controller.typeTextController,
                                ),
                                Container(
                                  margin: Dimens.edgeInsets16,
                                  width: 100,
                                  color: Colors.black,
                                  child: ActionButton(
                                    label: 'Add',
                                    onPressed: () {},
                                    icon: Icons.add,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                            Wrap(
                              children: [
                                CustomTextField(
                                  label: 'Category *',
                                  textController:
                                      controller.categoryTextController,
                                ),
                                Container(
                                  margin: Dimens.edgeInsets16,
                                  width: 100,
                                  color: Colors.black,
                                  child: ActionButton(
                                    label: 'Add',
                                    onPressed: () {},
                                    icon: Icons.add,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                            CustomTextField(
                              label: 'Serial No.',
                              textController: controller.serialNoTextController,
                            ),
                            CustomTextField(
                              label: 'Status',
                              textController: controller.statusTextController,
                            ),
                            CustomTextField(
                              label: 'Asset Name: *',
                              textController:
                                  controller.assetNameTextController,
                            ),
                            CustomTextField(
                              label: 'Enter Multiplier: ',
                              textController:
                                  controller.enterMultiplierTextController,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Asset Description: ',
                                    maxLine: 6,
                                    textController:
                                        controller.assetDescpTextController,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      label: 'Calibration Frequency: ',
                                      width: 300,
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding:
                                              Dimens.edgeInsets16_0_16_0,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomTextField(
                                  label: 'Last calibration date: ',
                                ),
                              ],
                            ),
                            Wrap(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      label: 'Calibration remainder In: ',
                                      width: 300,
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding:
                                              Dimens.edgeInsets16_0_16_0,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: Dimens.edgeInsets16,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Calibration cirtificate'),
                                      Dimens.boxWidth10,
                                      ActionButton(
                                        label: 'Upload cirtification file',
                                        onPressed: () {},
                                        icon: Icons.file_upload_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                )
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
                                length: 3,
                                child: Column(
                                  children: [
                                    Container(
                                      color: Colors.grey.withOpacity(.2),
                                      child: TabBar(
                                        tabs: [
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
                                      height: 400,
                                      child: TabBarView(
                                        children: [
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
        
          ],
        ),
      );
}
