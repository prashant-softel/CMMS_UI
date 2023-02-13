import 'package:cmms/app/app.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
            child: Column(
              children: [
                Dimens.boxHeight10,
                Text(
                  'Warranty',
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
                              child: Text('Warranty Type: *'),
                            ),
                            Dimens.boxWidth10,
                            Expanded(
                              child: Container(
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
                                        'Select Warranty',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: controller.warrantyTypeDropdownList
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
                                          controller.warrantyTypeDropdownValue,
                                      onChanged: (value) {
                                        controller.warrantyTypeDropdownValue =
                                            value;
                                        controller.update(['warranty_tab']);
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
                      // CustomTextField(
                      //   label: 'Warranty Provider: *',
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
                              child: Text('Warranty Provider: *'),
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
                                        'Select Warranty',
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
                                      value: controller
                                          .warrantyProviderDropdownValue,
                                      onChanged: (value) {
                                        controller
                                                .warrantyProviderDropdownValue =
                                            value;
                                        controller.update(['warranty_tab']);
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
                Row(
                  children: [
                    // CustomTextField(
                    //   label: 'Warranty Usages Term Type: *',
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
                            child: Text('Warranty Usages Term Type: *'),
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
                                      'Select Warranty',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: controller.warrantyUsageDropdownList
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
                                        controller.warrantyUsageDropdownValue,
                                    onChanged: (value) {
                                      controller.warrantyUsageDropdownValue =
                                          value;
                                      controller.update(['warranty_tab']);
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
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Wrap(
                            children: [
                              CustomTextField(
                                onTap: () {
                                  controller.openExpiryDatePicker =
                                      !controller.openExpiryDatePicker;
                                  controller.update(['warranty_tab']);
                                },
                                label: 'Expire Date: *',
                                textController: controller.expireDateTc,
                              ),
                              CustomTextField(
                                textController: controller.calibrationNumberTc,
                                label: 'Certificate Number: *',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            CustomTextField(
                              textController: controller.descriptionTc,
                              maxLine: 4,
                              label: 'Description: *',
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
                                    DateFormat('dd/MM/yyyy').format(p0.value);
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
          );
        });
  }
}
