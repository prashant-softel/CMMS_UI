import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          return Obx(
            () => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: IgnorePointer(
                  ignoring: true,
                  child: Column(children: [
                    Dimens.boxHeight10,
                    Text(
                      'Manufacturer',
                      style: Styles.blackBold18,
                    ),
                    Dimens.boxHeight5,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                CustomRichText(title: "Manufacturer Name"),
                                SizedBox(
                                  child: DropdownWebWidget(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                      BoxShadow(
                                        color: ColorValues.whiteColor,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                    margin: Dimens.edgeInsets5,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    dropdownList:
                                        controller.manufacturerModelNameList,
                                    isValueSelected: controller
                                        .iswarrantymanufacturerSelected.value,
                                    selectedValue: controller
                                        .selectedmanufacturerName.value,
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
                                  margin: Dimens.edgeInsets5,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 5,
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
                                  margin: Dimens.edgeInsets5,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 5,
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
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                CustomRichText(title: "Supplier Name"),
                                SizedBox(
                                  child: DropdownWebWidget(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                      BoxShadow(
                                        color: ColorValues.whiteColor,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                    margin: Dimens.edgeInsets5,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
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
                                CustomRichText(title: "Parent Equipment S No."),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Color(0xFE50000),
                                    width: 0.5,
                                  )),
                                  height: 45,
                                  margin: Dimens.edgeInsets5,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 5,
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
                                CustomRichText(title: "Currency"),
                                SizedBox(
                                  child: DropdownWebWidget(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                      BoxShadow(
                                        color: ColorValues.whiteColor,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                    margin: Dimens.edgeInsets5,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
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
              ),
            ),
          );
        });
  }
}
