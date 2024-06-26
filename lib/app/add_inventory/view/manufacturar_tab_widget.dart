import 'package:cmms/app/add_inventory/add_inventory_controller.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';

import 'package:cmms/app/widgets/stock_dropdown.dart';

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
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                              CustomRichText(
                                  includeAsterisk: false,
                                  title: "Manufacturer Name"),
                              SizedBox(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownWebStock(
                                    margin: Dimens.edgeInsets5,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    dropdownList:
                                        controller.manufacturerModelNameList,
                                    isValueSelected:
                                        controller.isManufacturerSelected.value,
                                    selectedValue: controller
                                        .selectedmanufacturerName.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomRichText(
                                  includeAsterisk: false, title: "Model"),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Color(0xFE50000),
                                  width: 0.5,
                                )),
                                height:
                                    MediaQuery.of(context).size.height * 0.040,
                                margin: Dimens.edgeInsets5,
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 5,
                                  minWidth: 100,
                                ),
                                child: LoginCustomTextfield(
                                    textController: controller.modelNoCtrlr,
                                    // errorController:
                                    //     controller.isModelInvalid.value
                                    //         ? "Required field"
                                    //         : null,
                                    // onChanged: (value) {
                                    //   if (value.trim().length > 0) {
                                    //     controller.isModelInvalid.value = false;
                                    //   } else {
                                    //     controller.isModelInvalid.value = true;
                                    //   }
                                    // }
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
                              CustomRichText(
                                  includeAsterisk: false, title: "Cost"),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Color(0xFE50000),
                                  width: 0.5,
                                )),
                                height:
                                    MediaQuery.of(context).size.height * 0.040,
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
                                    // errorController:
                                    //     controller.isCostInvalid.value
                                    //         ? "Required field"
                                    //         : null,
                                    // onChanged: (value) {
                                    //   if (value.trim().length > 0) {
                                    //     controller.isCostInvalid.value = false;
                                    //   } else {
                                    //     controller.isCostInvalid.value = true;
                                    //   }
                                    // }
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
                              CustomRichText(
                                  includeAsterisk: false,
                                  title: "Supplier Name"),
                              SizedBox(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorValues.whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownWebStock(
                                    margin: Dimens.edgeInsets5,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    dropdownList:
                                        controller.supplierNameModelNameList,
                                    isValueSelected:
                                        controller.isSupplierNameSelected.value,
                                    selectedValue:
                                        controller.selectedsupplierrName.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomRichText(
                                  includeAsterisk: false,
                                  title: "Parent Equipment S No."),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Color(0xFE50000),
                                  width: 0.5,
                                )),
                                height:
                                    MediaQuery.of(context).size.height * 0.040,
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
                                    // errorController: controller
                                    //         .isParentEquipmentInvalid.value
                                    //     ? "Required field"
                                    //     : null,
                                    // onChanged: (value) {
                                    //   if (value.trim().length > 0) {
                                    //     controller.isParentEquipmentInvalid
                                    //         .value = false;
                                    //   } else {
                                    //     controller.isParentEquipmentInvalid
                                    //         .value = true;
                                    //   }
                                    // }
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomRichText(
                                  includeAsterisk: false, title: "Currency"),
                              SizedBox(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownWebStock(
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
          );
        });
  }
}
