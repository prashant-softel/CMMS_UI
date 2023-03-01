import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/calibration_tab_widget.dart';
import 'package:cmms/app/home/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                                title: controller.editInventory
                                    ? 'Edit Inventory'
                                    : controller.viewInventory
                                        ? 'View Inventory'
                                        : 'addInventory'.tr,
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
                                  CustomDropdownWidget(
                                    title: 'Block: *',
                                    dropdownTitle: 'Select Block',
                                    dropdownList: controller.blockDropDownList,
                                    dropDownValue:
                                        controller.blockDropdownValue,
                                    onChangeDropdown: (val) {
                                      controller.blockDropdownValue = val;
                                      controller.update(['add_inventory']);
                                    },
                                    errorText:
                                        controller.blockDropdownValue != null
                                            ? null
                                            : 'This field is required.',
                                  ),
                                  CustomDropdownWidget(
                                    title: 'Parent Equipment: *',
                                    dropdownTitle: 'Select Equipment',
                                    dropdownList:
                                        controller.parentEquipmentList,
                                    dropDownValue:
                                        controller.parentEquipmentDropdownValue,
                                    onChangeDropdown: (val) {
                                      controller.parentEquipmentDropdownValue =
                                          val;
                                      controller.update(['add_inventory']);
                                    },
                                    errorText: controller
                                                .parentEquipmentDropdownValue !=
                                            null
                                        ? null
                                        : 'This field is required.',
                                  ),
                                  CustomDropdownWidget(
                                    title: 'Type *',
                                    dropdownTitle: 'Select Type',
                                    dropdownList:
                                        controller.inventoryTypeDropdownList,
                                    dropDownValue:
                                        controller.inventoryTypeDropdownValue,
                                    onChangeDropdown: (val) {
                                      controller.inventoryTypeDropdownValue =
                                          val;
                                      controller.update(['add_inventory']);
                                    },
                                    errorText:
                                        controller.inventoryTypeDropdownValue !=
                                                null
                                            ? null
                                            : 'This field is required.',
                                  ),
                                  CustomDropdownWidget(
                                    title: 'Category *',
                                    dropdownTitle: 'Select Category',
                                    dropdownList: controller
                                        .inventoryCategoryDropdownList,
                                    dropDownValue: controller
                                        .inventoryCategoryDropdownValue,
                                    onChangeDropdown: (val) {
                                      controller
                                          .inventoryCategoryDropdownValue = val;
                                      controller.update(['add_inventory']);
                                    },
                                    errorText: controller
                                                .inventoryCategoryDropdownValue !=
                                            null
                                        ? null
                                        : 'This field is required.',
                                  ),
                                  CustomDropdownWidget(
                                    title: 'Status *',
                                    dropdownTitle: 'Select Status',
                                    dropdownList:
                                        controller.inventoryStatusDropdownList,
                                    dropDownValue:
                                        controller.inventoryStatusDropdownValue,
                                    onChangeDropdown: (val) {
                                      controller.inventoryStatusDropdownValue =
                                          val;
                                      controller.update(['add_inventory']);
                                    },
                                    errorText: controller
                                                .inventoryStatusDropdownValue !=
                                            null
                                        ? null
                                        : 'This field is required.',
                                  ),
                                  CustomTextField(
                                    readOnly: controller.viewInventory,
                                    label: 'Asset Name: *',
                                    numberTextField: false,
                                    textController: controller.assetNameTc,
                                    errorText:
                                        controller.assetNameTc.text.isNotEmpty
                                            ? null
                                            : 'This Field is required.',
                                    // controller.assetNameTextController,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextField(
                                        readOnly: controller.viewInventory,

                                        label: 'Serial No.',
                                        numberTextField: false,
                                        textController: controller.serialNoTc,
                                        // errorText: controller
                                        //         .serialNoTc.text.isNotEmpty
                                        //     ? null
                                        //     : 'This Field is required.',
                                      ),
                                      CustomTextField(
                                        readOnly: controller.viewInventory,
                                        numberTextField: true,
                                        label: 'Enter Multiplier: ',
                                        textController:
                                            controller.enterMultiplierTc,
                                        // errorText: controller.enterMultiplierTc
                                        //         .text.isNotEmpty
                                        //     ? null
                                        //     : 'This Field is required.',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                          readOnly: controller.viewInventory,
                                          numberTextField: false,
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
                                onPressed: () {
                                  if (controller.blockDropdownValue != null &&
                                      controller
                                              .parentEquipmentDropdownValue !=
                                          null &&
                                      controller
                                              .inventoryTypeDropdownValue !=
                                          null &&
                                      controller.inventoryCategoryDropdownValue !=
                                          null &&
                                      controller
                                              .inventoryStatusDropdownValue !=
                                          null &&
                                      controller.assetNameTc.text.isNotEmpty &&
                                      controller
                                              .warrantyTypeDropdownValue !=
                                          null &&
                                      controller
                                              .warrantyProviderDropdownValue !=
                                          null &&
                                      controller
                                              .warrantyUsageDropdownValue !=
                                          null &&
                                      controller.expireDateTc.text.isNotEmpty &&
                                      controller.certificationNumberTc.text
                                          .isNotEmpty &&
                                      controller
                                          .descriptionTc.text.isNotEmpty &&
                                      controller
                                              .manufacturerDropdownValue !=
                                          null &&
                                      controller
                                              .supplierDropdownValue !=
                                          null &&
                                      controller.currencyDropdownValue !=
                                          null &&
                                      controller.modelTc.text.isNotEmpty &&
                                      controller
                                          .parentEquipmentsTc.text.isNotEmpty &&
                                      controller.costTc.text.isNotEmpty &&
                                      controller.calibrationFrequencyTc.text
                                          .isNotEmpty &&
                                      controller.calibrationRemainderInTc.text
                                          .isNotEmpty &&
                                      controller.lastCalibrationDateTc.text
                                          .isNotEmpty) {
                                    if (controller.editInventory) {
                                      controller.updateInventory(
                                        inventoryId:
                                            controller.selectedInventoryId ?? 0,
                                        blockId:
                                            controller.blockDropdownValue?.id ??
                                                0,
                                        assetName: controller.assetNameTc.text,
                                        parentEqipId: controller
                                                .parentEquipmentDropdownValue
                                                ?.id ??
                                            0,
                                        typeId: controller
                                                .inventoryTypeDropdownValue
                                                ?.id ??
                                            0,
                                        categoryId: controller
                                                .inventoryCategoryDropdownValue
                                                ?.id ??
                                            0,
                                        statusId: controller
                                                .inventoryStatusDropdownValue
                                                ?.id ??
                                            0,
                                        serialNo: controller.serialNoTc.text,
                                        assetDes:
                                            controller.assetDescriptionTc.text,
                                        multiplier: int.parse(
                                            controller.enterMultiplierTc.text),
                                        caliFreq: int.parse(controller
                                            .calibrationFrequencyTc.text),
                                        caliFreqType: controller
                                                .calibrationFrequencyDropdownValue
                                                ?.id ??
                                            0,
                                        caliRemainderDays: int.parse(controller
                                            .calibrationRemainderInTc.text),
                                        caliRemainderFirstDate:
                                            DateFormat('yyyy-MM-dd')
                                                .format(DateTime.now()),
                                        lastCaliDate: controller
                                            .lastCalibrationDateTc.text,
                                        warrantyTypeId: controller
                                                .warrantyTypeDropdownValue
                                                ?.id ??
                                            0,
                                        warrantyProviderId: controller
                                                .warrantyProviderDropdownValue
                                                ?.id ??
                                            0,
                                        warrantyUsageId: controller
                                                .warrantyUsageDropdownValue
                                                ?.id ??
                                            0,
                                        expireDate:
                                            controller.expireDateTc.text,
                                        warrantyCertification: controller
                                            .certificationNumberTc.text,
                                        warrantyDescription:
                                            controller.descriptionTc.text,
                                        manufacturerId: controller
                                                .manufacturerDropdownValue
                                                ?.id ??
                                            0,
                                        supplierId: controller
                                                .supplierDropdownValue?.id ??
                                            0,
                                        currency: controller
                                                .currencyDropdownValue?.name ??
                                            '',
                                        manufacturerCost:
                                            int.parse(controller.costTc.text),
                                        manufacturerModel:
                                            controller.modelTc.text,
                                        manufacturerParentEquipmentNo:
                                            controller.parentEquipmentsTc.text,
                                      );
                                    } else {
                                      controller.addInventory(
                                        blockId:
                                            controller.blockDropdownValue?.id ??
                                                0,
                                        assetName: controller.assetNameTc.text,
                                        parentEqipId: controller
                                                .parentEquipmentDropdownValue
                                                ?.id ??
                                            0,
                                        typeId: controller
                                                .inventoryTypeDropdownValue
                                                ?.id ??
                                            0,
                                        categoryId: controller
                                                .inventoryCategoryDropdownValue
                                                ?.id ??
                                            0,
                                        statusId: controller
                                                .inventoryStatusDropdownValue
                                                ?.id ??
                                            0,
                                        serialNo: controller.serialNoTc.text,
                                        assetDes:
                                            controller.assetDescriptionTc.text,
                                        multiplier: int.parse(
                                            controller.enterMultiplierTc.text),
                                        caliFreq: int.parse(controller
                                            .calibrationFrequencyTc.text),
                                        caliFreqType: controller
                                                .calibrationFrequencyDropdownValue
                                                ?.id ??
                                            0,
                                        caliRemainderDays: int.parse(controller
                                            .calibrationRemainderInTc.text),
                                        caliRemainderFirstDate:
                                            DateFormat('yyyy-MM-dd')
                                                .format(DateTime.now()),
                                        lastCaliDate: controller
                                            .lastCalibrationDateTc.text,
                                        warrantyTypeId: controller
                                                .warrantyTypeDropdownValue
                                                ?.id ??
                                            0,
                                        warrantyProviderId: controller
                                                .warrantyProviderDropdownValue
                                                ?.id ??
                                            0,
                                        warrantyUsageId: controller
                                                .warrantyUsageDropdownValue
                                                ?.id ??
                                            0,
                                        expireDate:
                                            controller.expireDateTc.text,
                                        warrantyCertification: controller
                                            .certificationNumberTc.text,
                                        warrantyDescription:
                                            controller.descriptionTc.text,
                                        manufacturerId: controller
                                                .manufacturerDropdownValue
                                                ?.id ??
                                            0,
                                        supplierId: controller
                                                .supplierDropdownValue?.id ??
                                            0,
                                        currency: controller
                                                .currencyDropdownValue?.name ??
                                            '',
                                        manufacturerCost:
                                            int.parse(controller.costTc.text),
                                        manufacturerModel:
                                            controller.modelTc.text,
                                        manufacturerParentEquipmentNo:
                                            controller.parentEquipmentsTc.text,
                                      );
                                    }
                                  } else {
                                    Utility.showErrorSnackBar(
                                        'Some fields are missing.PLease check');
                                  }
                                },
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
