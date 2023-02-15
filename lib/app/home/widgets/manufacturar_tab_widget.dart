import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManufacturarTab extends StatelessWidget {
  const ManufacturarTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'manufacturer_tab',
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Dimens.boxHeight10,
                Text(
                  'Manufacturing & Supplier Details',
                  style: Styles.blackBold18,
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      CustomDropdownWidget(
                        title: 'Manufacturer Name: *',
                        dropdownTitle: 'Select Manufacturer',
                        dropdownList: controller.manufacturerDropdownList,
                        dropDownValue: controller.manufacturerDropdownValue,
                        onChangeDropdown: (val) {
                          controller.manufacturerDropdownValue = val;
                          controller.update(['manufacturer_tab']);
                        },
                        errorText: controller.manufacturerDropdownValue != null
                            ? null
                            : 'This field is required.',
                      ),
                      CustomDropdownWidget(
                        title: 'Supplier Name: *',
                        dropdownTitle: 'Select Supplier',
                        dropdownList: controller.supplierDropdownList,
                        dropDownValue: controller.supplierDropdownValue,
                        onChangeDropdown: (val) {
                          controller.supplierDropdownValue = val;
                          controller.update(['manufacturer_tab']);
                        },
                        errorText: controller.supplierDropdownValue != null
                            ? null
                            : 'This field is required.',
                      ),
                      Container(
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            CustomTextField(
                              readOnly: controller.viewInventory,
                              numberTextField: false,
                              textController: controller.modelTc,
                              label: 'Model: *',
                              errorText: controller.modelTc.text.isNotEmpty
                                  ? null
                                  : 'This field is required.',
                            ),
                            CustomTextField(
                              readOnly: controller.viewInventory,
                              numberTextField: false,
                              textController: controller.parentEquipmentsTc,
                              label: 'Parent Equipment S No.: *',
                              errorText:
                                  controller.parentEquipmentsTc.text.isNotEmpty
                                      ? null
                                      : 'This field is required.',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Wrap(
                          children: [
                            CustomTextField(
                              readOnly: controller.viewInventory,
                              numberTextField: true,
                              textController: controller.costTc,
                              label: 'Cost: *',
                              errorText: controller.costTc.text.isNotEmpty
                                  ? null
                                  : 'This field is required.',
                            ),
                            CustomDropdownWidget(
                              title: 'Currency: *',
                              dropdownTitle: 'Select Currency',
                              dropdownList: controller.currencyDropdownList,
                              dropDownValue: controller.currencyDropdownValue,
                              onChangeDropdown: (val) {
                                controller.currencyDropdownValue = val;
                                controller.update(['manufacturer_tab']);
                              },
                              errorText:
                                  controller.currencyDropdownValue != null
                                      ? null
                                      : 'This field is required.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
