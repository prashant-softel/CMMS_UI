import 'package:cmms/app/app.dart';

import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ViewCalibrationTabWidget extends StatelessWidget {
  const ViewCalibrationTabWidget({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<ViewAddInventoryController>(
      id: 'calibration_tab',
      builder: (controller) {
        return SingleChildScrollView(
          child: Stack(children: [
            Container(
              height: 400,
              child: Column(
                children: [
                  Dimens.boxHeight10,
                  Text(
                    'Calibration',
                    style: Styles.blackBold18,
                  ),
                  Container(
                    width: double.infinity,
                    child: Wrap(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CustomRichText(
                                            title: "  Calibration Frequency"),
                                        Dimens.boxWidth5,
                                        IgnorePointer(
                                          ignoring: true,
                                          child: DropdownWebWidget(
                                            margin: Dimens.edgeInsets16,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            controller: controller,
                                            dropdownList:
                                                controller.frequencyList,
                                            isValueSelected: controller
                                                .isSelectedfrequency.value,
                                            selectedValue: controller
                                                .selectedfrequency.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          CustomRichText(
                                              title:
                                                  "Calibration remainder In"),
                                          SizedBox(width: 10),
                                          IgnorePointer(
                                            ignoring: true,
                                            child: Container(
                                              width: 150,
                                              child: TextField(
                                                controller: controller
                                                    .calibrationRemaingCtrlr,
                                                decoration: InputDecoration(
                                                  contentPadding: Dimens
                                                      .edgeInsets16_0_16_0,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide(width: .2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide(width: .2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text("Day"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IgnorePointer(
                                      ignoring: true,
                                      child: CustomTextField(
                                        numberTextField: true,
                                        // readOnly: true,
                                        onTap: () {
                                          controller
                                                  .openLastCalibrationDatePicker =
                                              !controller
                                                  .openLastCalibrationDatePicker;
                                          controller
                                              .update(['calibration_tab']);
                                        },
                                        textController:
                                            controller.calibrationRemainderInTc,
                                        label: 'Last calibration date: *',
                                      ),
                                    ),
                                    IgnorePointer(
                                      ignoring: true,
                                      child: Container(
                                        margin: Dimens.edgeInsets16,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Calibration certificate'),
                                            Dimens.boxWidth10,
                                            ActionButton(
                                              label:
                                                  'Upload certification file',
                                              onPressed: () {},
                                              icon: Icons.file_upload_outlined,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (controller.openLastCalibrationDatePicker)
              Positioned(
                right: 70,
                top: 60,
                child: DatePickerWidget(
                  minDate: DateTime(DateTime.now().year),
                  maxDate: DateTime(
                      DateTime.now().year, 13, 0), // last date of this year
                  controller: DateRangePickerController(),
                  selectionChanges: (p0) {
                    print('po valu ${p0.value.toString()}');
                    controller.lastCalibrationDateTc.text =
                        DateFormat('yyyy-MM-dd').format(p0.value);
                    controller.openLastCalibrationDatePicker =
                        !controller.openLastCalibrationDatePicker;
                    controller.update(['calibration_tab']);
                  },
                ),
              ),
          ]),
        );
      });
}
