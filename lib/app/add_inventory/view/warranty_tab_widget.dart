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

class WarrantyTabWidget extends StatelessWidget {
  const WarrantyTabWidget({
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomRichText(title: "Warranty Type"),
                          SizedBox(
                            child: DropdownWidget(
                              dropdownList: controller.warrantyNameList,
                              isValueSelected:
                                  controller.isWarrentyNameSelected.value,
                              selectedValue:
                                  controller.selectedWarrantyName.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomRichText(
                              title:
                                  "          Warranty\n           Usages  \n     Term Type"),
                          SizedBox(
                            child: DropdownWidget(
                              dropdownList:
                                  controller.warrantyUsageTermNameList,
                              isValueSelected: controller
                                  .iswarrantyUsageTermNameSelected.value,
                              selectedValue: controller
                                  .selectedwarrantyUsageTermListName.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomRichText(title: "    Description"),
                          CustomTextFieldForInventory(
                              textController:
                                  controller.warrentyDescriptionCtrlr),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomRichText(title: "Warranty Provider"),
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
                          CustomRichText(title: "Certificate Number"),
                          CustomTextFieldForInventory(
                            textController: controller.certificateNoCtrlr,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Wrap(
                                children: [
                                  CustomTextField(
                                    // numberTextField: false,
                                    // readOnly: true,
                                    onTap: () {
                                      controller.openStartDatePicker =
                                          !controller.openStartDatePicker;
                                      controller.update(['warranty_tab']);
                                    },
                                    label: 'Start Date: *',
                                    textController: controller.startDateTc,
                                  ),
                                  Spacer(),
                                  SizedBox(width: 120),
                                  CustomTextField(
                                    // numberTextField: false,
                                    // readOnly: true,
                                    onTap: () {
                                      controller.openExpiryDatePicker =
                                          !controller.openExpiryDatePicker;
                                      controller.update(['warranty_tab']);
                                    },
                                    label: 'Expire Date: *',
                                    textController: controller.expireDateTc,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (controller.openStartDatePicker)
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                              ),
                              DatePickerWidget(
                                minDate: DateTime(DateTime.now().year),
                                maxDate: DateTime(DateTime.now().year, 13,
                                    0), // last date of this year
                                controller: DateRangePickerController(),
                                selectionChanges: (p0) {
                                  controller.startDateTc.text =
                                      DateFormat('yyyy-MM-dd').format(p0.value);
                                  controller.openStartDatePicker =
                                      !controller.openStartDatePicker;
                                  controller.update(['warranty_tab']);
                                },
                              ),
                            ],
                          ),
                        if (controller.openExpiryDatePicker)
                          Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: Dimens
                                    .edgeInsets15_0_0_0, //edgeInsets0_70_0_0,
                                child: DatePickerWidget(
                                  minDate: DateTime(DateTime.now().year),
                                  maxDate: DateTime(DateTime.now().year, 13,
                                      0), // last date of this year
                                  controller: DateRangePickerController(),
                                  selectionChanges: (p0) {
                                    controller.expireDateTc.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(p0.value);
                                    controller.openExpiryDatePicker =
                                        !controller.openExpiryDatePicker;
                                    controller.update(['warranty_tab']);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          );
        });
  }
}
