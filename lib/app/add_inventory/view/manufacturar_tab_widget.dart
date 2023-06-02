import 'package:cmms/app/add_inventory/add_inventory_controller.dart';
import 'package:cmms/app/add_inventory/view/custom_text_field.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ManufacturarTabWidget extends StatelessWidget {
  const ManufacturarTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddInventoryController>(
        id: 'warranty_tab',
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(children: [
              Dimens.boxHeight10,
              Text(
                'Warranty',
                style: Styles.blackBold18,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomRichText(
                              title: "   Manufacturer\n               Name"),
                          SizedBox(
                            child: DropdownWidget(
                              dropdownList:
                                  controller.manufacturerModelNameList,
                              isValueSelected: controller
                                  .iswarrantymanufacturerSelected.value,
                              selectedValue:
                                  controller.selectedmanufacturerName.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomRichText(title: "             Model"),
                          CustomTextFieldForInventory(
                            textController: controller.modelNoCtrlr,
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     CustomRichText(title: "Model"),
                      //     SizedBox(
                      //       child: DropdownWidget(
                      //         dropdownList: controller.eqipmentNameList,
                      //         isValueSelected:
                      //             controller.isEquipmentNameSelected.value,
                      //         selectedValue:
                      //             controller.selectedEquipmentName.value,
                      //         onValueChanged: controller.onValueChanged,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          CustomRichText(title: "                 Cost"),
                          CustomTextFieldForInventory(),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomRichText(title: "  Supplier\n      Name"),
                          SizedBox(
                            child: DropdownWidget(
                              dropdownList:
                                  controller.supplierNameModelNameList,
                              isValueSelected:
                                  controller.isStatusNameSelected.value,
                              selectedValue:
                                  controller.selectedsupplierrName.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomRichText(
                              title: "      Parent\nEquipment\n        S No."),
                          CustomTextFieldForInventory(
                            textController: controller.parentEquipmentNoCtrlr,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomRichText(title: "Currency"),
                          SizedBox(
                            child: DropdownWidget(
                              dropdownList: controller.unitCurrencyList,
                              isValueSelected:
                                  controller.isUnitCurrencySelected.value,
                              selectedValue:
                                  controller.selectedUnitCurrency.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          );
        });
  }
}
