import 'package:cmms/app/add_inventory/add_inventory_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalibrationTabWidget extends StatelessWidget {
  const CalibrationTabWidget({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<AddInventoryController>(
      id: 'calibration_tab',
      builder: (controller) {
        return Column(
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
                          CustomRichText(
                              title:
                                  "          Calibration\n          Frequency"),
                          SizedBox(
                            child: DropdownWebWidget(
                              margin: Dimens.edgeInsets16,
                              width: MediaQuery.of(context).size.width / 4,
                              controller: controller,
                              dropdownList: controller.frequencyList,
                              isValueSelected:
                                  controller.isSelectedfrequency.value,
                              selectedValue: controller.selectedfrequency.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomTextField(
                    numberTextField: true,
                    // readOnly: true,
                    onTap: () {
                      controller.openLastCalibrationDatePicker =
                          !controller.openLastCalibrationDatePicker;
                      controller.update(['calibration_tab']);
                    },
                    textController: controller.calibrationRemainderInTc,
                    label: 'Last calibration date: *',
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              CustomRichText(
                                  title:
                                      "        Calibration\n        remainder In"),
                              SizedBox(width: 10),
                              Container(
                                width: 150,
                                child: TextField(
                                  controller:
                                      controller.calibrationRemaingCtrlr,
                                  decoration: InputDecoration(
                                    contentPadding: Dimens.edgeInsets16_0_16_0,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: .2),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: .2),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              CustomRichText(title: "Day"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        margin: Dimens.edgeInsets16,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Calibration certificate'),
                            Dimens.boxWidth10,
                            ActionButton(
                              label: 'Upload certification file',
                              onPressed: () {},
                              icon: Icons.file_upload_outlined,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                if (controller.openLastCalibrationDatePicker)
                  Row(
                    children: [
                      SizedBox(
                        width: 570,
                      ),
                      Padding(
                        padding: Dimens.edgeInsets0,
                        child: DatePickerWidget(
                          minDate: DateTime(DateTime.now().year),
                          maxDate: DateTime(DateTime.now().year, 13,
                              0), // last date of this year
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
                    ],
                  ),
              ],
            ),
          ],
        );
      });
}
