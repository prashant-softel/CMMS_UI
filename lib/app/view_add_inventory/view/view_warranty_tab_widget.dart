import 'package:cmms/app/add_inventory/add_inventory_controller.dart';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';

import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ViewWarrantyTabWidget extends StatelessWidget {
  const ViewWarrantyTabWidget({
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CustomRichText(title: "Warranty Type"),
                          IgnorePointer(
                            ignoring: true,
                            child: DropdownWebWidget(
                              margin: Dimens.edgeInsets16,
                              width: MediaQuery.of(context).size.width / 4,
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
                              title: "Warranty Usages\n         Term Type"),
                          IgnorePointer(
                            ignoring: true,
                            child: DropdownWebWidget(
                              margin: Dimens.edgeInsets16,
                              width: MediaQuery.of(context).size.width / 4,
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
                          CustomRichText(title: "Description"),
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
                                      controller.warrentyDescriptionCtrlr),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomRichText(title: "Warranty Provider"),
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
                          CustomRichText(title: "Certificate Number"),
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
                                      controller.certificateNoCtrlr),
                            ),
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
                                  IgnorePointer(
                                    ignoring: true,
                                    child: CustomTextField(
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
                                  ),
                                  Spacer(),
                                  SizedBox(width: 120),
                                  IgnorePointer(
                                    ignoring: true,
                                    child: CustomTextField(
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
