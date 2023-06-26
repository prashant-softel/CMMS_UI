import 'package:cmms/app/add_inventory/add_inventory_controller.dart';

import 'package:cmms/app/app.dart';

import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/view_add_inventory/view/view_calibartion_widget.dart';
import 'package:cmms/app/view_add_inventory/view/view_manufacturar_tab_widget.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';

import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/view_warranty_tab_widget.dart';

class ViewAddInventoryScreen extends GetView<ViewAddInventoryController> {
  ViewAddInventoryScreen({super.key});

  final ViewAddInventoryController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: Responsive.isDesktop(context)
            ? AppBar(
                title: HeaderWidget(),
                elevation: 0,
                toolbarHeight: 90,
                automaticallyImplyLeading: false,
              )
            : AppBar(
                title: Text('Calibration History'),
                centerTitle: true,
                elevation: 0,
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
              child: Obx(
                () => Center(
                  child: Container(
                    margin: Dimens.edgeInsets16,
                    height: Get.height,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: Get.width,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                  Text(" /DASHBOARD ",
                                      style: Styles.greyMediumLight12),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(" / INVENTORY",
                                        style: Styles.greyMediumLight12),
                                  ),
                                  Text(
                                    "/ ADD INVENTORY",
                                    style: Styles.greyLight14,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.menu,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                            Dimens.boxHeight10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AddPhoto(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        CustomRichText(title: 'Block'),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: DropdownWebWidget(
                                            isEditable: true,
                                            margin: Dimens.edgeInsets16,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            dropdownList: controller.blocksList,
                                            isValueSelected: controller
                                                .isBlocksSelected.value,
                                            selectedValue:
                                                controller.selectedBlocks.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(title: "Type"),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: DropdownWebWidget(
                                            margin: Dimens.edgeInsets16,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            dropdownList:
                                                controller.typeNameList,
                                            isValueSelected: controller
                                                .isTypeNameSelected.value,
                                            selectedValue: controller
                                                .selectedTypeName.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(title: "Status"),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: DropdownWebWidget(
                                            margin: Dimens.edgeInsets16,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            dropdownList:
                                                controller.statusNameList,
                                            isValueSelected: controller
                                                .isStatusNameSelected.value,
                                            selectedValue: controller
                                                .selectedStatusName.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(title: "Asset\nName"),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Color(0xFE50000),
                                              width: 0.5,
                                            )),
                                            height: 45,
                                            margin: Dimens.edgeInsets16,
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              minWidth: 100,
                                            ),
                                            child: LoginCustomTextfield(
                                              textController:
                                                  controller.assetsNameCtrlr,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(
                                          title: "Asset\nDescription",
                                        ),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Color(0xFE50000),
                                              width: 0.5,
                                            )),
                                            height: 45,
                                            margin: Dimens.edgeInsets16,
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              minWidth: 100,
                                            ),
                                            child: LoginCustomTextfield(
                                              enabled: false,
                                              textController: controller
                                                  .assesDiscriptionCtrlr,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        CustomRichText(
                                            title: 'Parent\nEquipment'),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: DropdownWebWidget(
                                            margin: Dimens.edgeInsets16,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            dropdownList:
                                                controller.eqipmentNameList,
                                            isValueSelected: controller
                                                .isEquipmentNameSelected.value,
                                            selectedValue: controller
                                                .selectedEquipmentName.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(title: "Category"),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: DropdownWebWidget(
                                            margin: Dimens.edgeInsets16,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            dropdownList: controller
                                                .equipmentCategoryList,
                                            isValueSelected: controller
                                                .isEquipmentCategoryNameSelected
                                                .value,
                                            selectedValue: controller
                                                .selectedEquipmentCategoryName
                                                .value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(title: "Serial No"),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Color(0xFE50000),
                                              width: 0.5,
                                            )),
                                            height: 45,
                                            margin: Dimens.edgeInsets16,
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              minWidth: 100,
                                            ),
                                            child: LoginCustomTextfield(
                                              enabled: false,
                                              textController:
                                                  controller.serialNoCtrlr,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                      height: 400,
                                      child: TabBarView(
                                        children: [
                                          ViewCalibrationTabWidget(),
                                          ViewWarrantyTabWidget(),
                                          ViewManufacturarTabWidget(),
                                          Files(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Dimens.boxHeight15,
                            // controller.id == null
                            //     ? CustomElevatedButton(
                            //         backgroundColor: ColorValues.appGreenColor,
                            //         text: 'Submit',
                            //         onPressed: () {
                            //           controller.AddInventory();
                            //         },
                            //       )
                            //     : CustomElevatedButton(
                            //         backgroundColor:
                            //             ColorValues.appDarkBlueColor,
                            //         text: 'Update',
                            //         onPressed: () {
                            //           controller.updateInventory();
                            //         },
                            //       ),
                            Dimens.boxHeight30,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
