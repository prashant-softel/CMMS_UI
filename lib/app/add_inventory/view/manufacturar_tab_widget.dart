import 'package:cmms/app/add_inventory/add_inventory_controller.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';

import 'package:cmms/app/widgets/dropdown_web.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ManufacturarTabWidget extends StatelessWidget {
  ManufacturarTabWidget({
    Key? key,
  }) : super(key: key);
  final AddInventoryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddInventoryController>(
        id: 'warranty_tab',
        builder: (controller) {
          return Obx(
            () => SingleChildScrollView(
              child: Column(children: [
                Dimens.boxHeight10,
                Text(
                  'Manufacturer',
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
                            SizedBox(
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
                            Container(
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
                            Container(
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textController: controller.costCtrlr,
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
                            CustomRichText(
                                title: "      Supplier\n       Name"),
                            SizedBox(
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
                                title:
                                    "      Parent\nEquipment\n        S No."),
                            Container(
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textController:
                                    controller.parentEquipmentNoCtrlr,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomRichText(title: "   Currency"),
                            SizedBox(
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
            ),
          );
        });
  }
}
