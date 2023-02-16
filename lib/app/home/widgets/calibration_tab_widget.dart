import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalibrationTabWidget extends StatelessWidget {
  const CalibrationTabWidget({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
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
                      CustomTextField(
                        readOnly: controller.viewInventory,
                        numberTextField: true,
                        label: 'Calibration Frequency: *',
                        textController: controller.calibrationFrequencyTc,
                        width: 300,
                        errorText:
                            controller.calibrationFrequencyTc.text.isNotEmpty
                                ? null
                                : 'This field is required.',
                      ),
                      Container(
                        width: 100,
                        padding: Dimens.edgeInsets8_0_0_0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Theme.of(context).hintColor.withOpacity(0.3),
                          ),
                        ),
                        child: ClipRRect(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<DropdownModel>(
                              hint: Text(
                                'Select',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              value:
                                  controller.calibrationFrequencyDropdownValue,
                              items: controller.calibrationFrequencyDropdownList
                                  .map(
                                    (e) => DropdownMenuItem(
                                      child: Text(
                                        e.name ?? '',
                                      ),
                                      value: e,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                controller.calibrationFrequencyDropdownValue =
                                    val;
                                controller.update(['calibration_tab']);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    numberTextField: true,
                    readOnly: true,
                    onTap: () {
                      controller.openLastCalibrationDatePicker =
                          !controller.openLastCalibrationDatePicker;
                      controller.update(['calibration_tab']);
                    },
                    textController: controller.lastCalibrationDateTc,
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
                          CustomTextField(
                            readOnly: controller.viewInventory,
                            numberTextField: true,
                            label: 'Calibration remainder In: *',
                            textController: controller.calibrationRemainderInTc,
                            width: 300,
                            errorText: controller
                                    .calibrationRemainderInTc.text.isNotEmpty
                                ? null
                                : 'This field is required.',
                          ),
                          Container(
                            width: 100,
                            child: TextField(
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
                        ],
                      ),
                      Container(
                        margin: Dimens.edgeInsets16,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Calibration certificate'),
                            Dimens.boxWidth10,
                            ActionButton(
                              lable: 'Upload certification file',
                              onPress: () {},
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
