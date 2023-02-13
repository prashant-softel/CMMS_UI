import 'package:cmms/app/app.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
                      Container(
                        margin: Dimens.edgeInsets16,
                        constraints: BoxConstraints(
                          maxWidth: 420,
                          minWidth: 100,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              child: Text('Manufacturer Name: *'),
                            ),
                            Dimens.boxWidth10,
                            Expanded(
                              child: Container(
                                // padding: Dimens.edgeInsets10_0_10_0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .hintColor
                                        .withOpacity(0.3),
                                  ),
                                ),
                                child: ClipRRect(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: Text(
                                        'Select Manufacturer',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: controller.businessList
                                          .map((item) => DropdownMenuItem<int>(
                                                value: item.id,
                                                child: Text(
                                                  item.name ?? '',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value:
                                          controller.manufacturerDropdownValue,
                                      onChanged: (value) {
                                        controller.manufacturerDropdownValue =
                                            value;
                                        controller.update(['manufacturer_tab']);
                                      },
                                      buttonPadding: EdgeInsets.only(left: 8),
                                      buttonHeight: 40,
                                      buttonWidth: 140,
                                      itemHeight: 40,
                                      dropdownWidth: 200,
                                      dropdownMaxHeight: 300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: Dimens.edgeInsets16,
                        constraints: BoxConstraints(
                          maxWidth: 420,
                          minWidth: 100,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              child: Text('Supplier Name: *'),
                            ),
                            Dimens.boxWidth10,
                            Expanded(
                              child: Container(
                                // padding: Dimens.edgeInsets10_0_10_0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .hintColor
                                        .withOpacity(0.3),
                                  ),
                                ),
                                child: ClipRRect(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: Text(
                                        'Select Supplier',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: controller.businessList
                                          .map((item) => DropdownMenuItem<int>(
                                                value: item.id,
                                                child: Text(
                                                  item.name ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ))
                                          .toList(),
                                      value: controller.supplierDropdownValue,
                                      onChanged: (value) {
                                        controller.supplierDropdownValue =
                                            value;
                                        controller.update(['manufacturer_tab']);
                                      },
                                      buttonPadding: EdgeInsets.only(left: 8),
                                      buttonHeight: 40,
                                      buttonWidth: 140,
                                      itemHeight: 40,
                                      dropdownWidth: 200,
                                      dropdownMaxHeight: 300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      CustomTextField(
                        textController: controller.modelTc,
                        label: 'Model: *',
                      ),
                      CustomTextField(
                        textController: controller.parentEquipmentsTc,
                        label: 'Parent Equipment S No.: *',
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      CustomTextField(
                        textController: controller.costTc,
                        label: 'Cost: *',
                      ),
                      // CustomTextField(
                      //   label: 'Currency: *',
                      // ),
                      Container(
                        margin: Dimens.edgeInsets16,
                        constraints: BoxConstraints(
                          maxWidth: 420,
                          minWidth: 100,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              child: Text('Currency: *'),
                            ),
                            Dimens.boxWidth10,
                            Expanded(
                              child: Container(
                                // padding: Dimens.edgeInsets10_0_10_0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .hintColor
                                        .withOpacity(0.3),
                                  ),
                                ),
                                child: ClipRRect(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: Text(
                                        'Select Currency',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: controller.currencyDropdownList
                                          .map((item) => DropdownMenuItem<int>(
                                                value: item.id,
                                                child: Text(
                                                  item.name ?? '',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: controller.currencyDropdownValue,
                                      onChanged: (value) {
                                        controller.currencyDropdownValue =
                                            value;
                                        controller.update(['manufacturer_tab']);
                                      },
                                      buttonPadding: EdgeInsets.only(left: 8),
                                      buttonHeight: 40,
                                      buttonWidth: 140,
                                      itemHeight: 40,
                                      dropdownWidth: 200,
                                      dropdownMaxHeight: 300,
                                    ),
                                  ),
                                ),
                              ),
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
