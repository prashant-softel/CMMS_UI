import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewManufacturarTabWidget extends StatelessWidget {
  const ViewManufacturarTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAddInventoryController>(
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CustomRichText(
                              title: "Manufacturer\n           Name"),
                          IgnorePointer(
                            ignoring: true,
                            child: DropdownWebWidget(
                              margin: Dimens.edgeInsets16,
                              width: MediaQuery.of(context).size.width / 4,
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
                          CustomRichText(title: "Model"),
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
                                maxWidth: MediaQuery.of(context).size.width / 4,
                                minWidth: 100,
                              ),
                              child: LoginCustomTextfield(
                                textController: controller.modelNoCtrlr,
                              ),
                            ),
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
                          CustomRichText(title: "Cost"),
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
                                maxWidth: MediaQuery.of(context).size.width / 4,
                                minWidth: 100,
                              ),
                              child: LoginCustomTextfield(
                                textController: controller.costCtrlr,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomRichText(title: "      Supplier\n       Name"),
                          IgnorePointer(
                            ignoring: true,
                            child: DropdownWebWidget(
                              margin: Dimens.edgeInsets16,
                              width: MediaQuery.of(context).size.width / 4,
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
                                maxWidth: MediaQuery.of(context).size.width / 4,
                                minWidth: 100,
                              ),
                              child: LoginCustomTextfield(
                                textController:
                                    controller.parentEquipmentNoCtrlr,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomRichText(title: "   Currency"),
                          IgnorePointer(
                            ignoring: true,
                            child: DropdownWebWidget(
                              margin: Dimens.edgeInsets16,
                              width: MediaQuery.of(context).size.width / 4,
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
