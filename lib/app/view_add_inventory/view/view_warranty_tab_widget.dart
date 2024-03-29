
import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';

import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        return Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: IgnorePointer(
                ignoring: true,
                child: Column(
                  children: [
                    Dimens.boxHeight10,
                    Text(
                      'Warranty',
                      style: Styles.blackBold18,
                    ),
                    Dimens.boxHeight10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                CustomRichText(title: "Warranty Type"),
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
                                    title: "Warranty Usages Term Type"),
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
                                        controller.warrantyUsageTermNameList,
                                    isValueSelected: controller
                                        .iswarrantyUsageTermNameSelected.value,
                                    selectedValue: controller
                                        .selectedwarrantyUsageTermListName
                                        .value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomRichText(title: "Description"),
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
                                      textController:
                                          controller.warrentyDescriptionCtrlr),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                CustomRichText(title: "Warranty Provider"),
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
                                CustomRichText(title: "Certificate Number"),
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
                                          controller.certificateNoCtrlr),
                                ),
                                Dimens.boxHeight10,
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: Wrap(children: [
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
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);
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
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: DatePickerWidget(
                                      minDate: DateTime(DateTime.now().year),
                                      maxDate:
                                          DateTime(DateTime.now().year, 13, 0),
                                      controller: DateRangePickerController(),
                                      selectionChanges: (p0) {
                                        final startDate =
                                            controller.startDateTc.text;
                                        final selectedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(p0.value);

                                        if (startDate.isNotEmpty &&
                                            selectedDate.compareTo(startDate) <
                                                0) {
                                          // Invalid selection, show an error message
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Expire Date cannot be before Start Date!',
                                              ),
                                            ),
                                          );
                                        } else {
                                          controller.expireDateTc.text =
                                              selectedDate;
                                          controller.openExpiryDatePicker =
                                              !controller.openExpiryDatePicker;
                                          controller.update(['warranty_tab']);
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
