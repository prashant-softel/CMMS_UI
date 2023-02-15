import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WarrantyTab extends StatelessWidget {
  const WarrantyTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'warranty_tab',
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(children: [
              Dimens.boxHeight10,
              Text(
                'Warranty',
                style: Styles.blackBold18,
              ),
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    CustomDropdownWidget(
                      title: 'Warranty Type: *',
                      dropdownTitle: 'Select Warranty',
                      dropdownList: controller.warrantyTypeDropdownList,
                      dropDownValue: controller.warrantyTypeDropdownValue,
                      onChangeDropdown: (val) {
                        controller.warrantyTypeDropdownValue = val;
                        controller.update(['warranty_tab']);
                      },
                      errorText: controller.warrantyTypeDropdownValue != null
                          ? null
                          : 'This field is required.',
                    ),
                    CustomDropdownWidget(
                      title: 'Warranty Provider: *',
                      dropdownTitle: 'Select Provider',
                      dropdownList: controller.warrantyProviderDropdownList,
                      dropDownValue: controller.warrantyProviderDropdownValue,
                      onChangeDropdown: (val) {
                        controller.warrantyProviderDropdownValue = val;
                        controller.update(['warranty_tab']);
                      },
                      errorText:
                          controller.warrantyProviderDropdownValue != null
                              ? null
                              : 'This field is required.',
                    ),
                    CustomDropdownWidget(
                      title: 'Warranty Usages Term Type: *',
                      dropdownTitle: 'Select Warranty Usage',
                      dropdownList: controller.warrantyUsageDropdownList,
                      dropDownValue: controller.warrantyUsageDropdownValue,
                      onChangeDropdown: (val) {
                        controller.warrantyUsageDropdownValue = val;
                        controller.update(['warranty_tab']);
                      },
                      errorText: controller.warrantyUsageDropdownValue != null
                          ? null
                          : 'This field is required.',
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Wrap(
                                children: [
                                  CustomTextField(
                                    numberTextField: false,
                                    readOnly: true,
                                    onTap: () {
                                      controller.openExpiryDatePicker =
                                          !controller.openExpiryDatePicker;
                                      controller.update(['warranty_tab']);
                                    },
                                    label: 'Expire Date: *',
                                    textController: controller.expireDateTc,
                                    errorText:
                                        controller.expireDateTc.text.isNotEmpty
                                            ? null
                                            : 'This Field is required.',
                                  ),
                                  CustomTextField(
                                    readOnly: controller.viewInventory,
                                    numberTextField: false,
                                    textController:
                                        controller.certificationNumberTc,
                                    label: 'Certificate Number: *',
                                    errorText: controller.certificationNumberTc
                                            .text.isNotEmpty
                                        ? null
                                        : 'This field is required.',
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                CustomTextField(
                                  readOnly: controller.viewInventory,
                                  numberTextField: false,
                                  textController: controller.descriptionTc,
                                  maxLine: 4,
                                  label: 'Description: *',
                                  errorText:
                                      controller.descriptionTc.text.isNotEmpty
                                          ? null
                                          : 'This field is required.',
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (controller.openExpiryDatePicker)
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                              ),
                              Padding(
                                padding: Dimens.edgeInsets0_70_0_0,
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
