import 'package:cmms/app/add_inventory/add_inventory_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';

import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalibrationTabWidget extends StatefulWidget {
  CalibrationTabWidget({super.key});

  @override
  State<CalibrationTabWidget> createState() => _CalibrationTabWidgetState();
}

class _CalibrationTabWidgetState extends State<CalibrationTabWidget> {
  final AddInventoryController controller = Get.find();

  @override
  Widget build(BuildContext context) => GetBuilder<AddInventoryController>(
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
                    margin: Dimens.edgeInsets20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                CustomRichText(title: "Calibration Frequency"),
                                Dimens.boxWidth5,
                                SizedBox(
                                  child: DropdownWebStock(
                                    margin: Dimens.edgeInsets5,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    controller: controller,
                                    dropdownList: controller.frequencyList,
                                    isValueSelected:
                                        controller.isSelectedfrequency.value,
                                    selectedValue:
                                        controller.selectedfrequency.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight5,
                            Row(
                              children: [
                                CustomRichText(
                                    title: "Calibration remainder In"),
                                SizedBox(width: 10),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.040,
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: TextField(
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 16.0,
                                          height: 1.0,
                                          color: Colors.black),
                                    ),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller:
                                        controller.calibrationRemaingCtrlr,
                                    decoration: InputDecoration(
                                      contentPadding: Dimens.edgeInsets5,
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
                                // SizedBox(
                                //   width: 20,
                                // ),
                                // Text("Day"),
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
                                CustomRichText(title: 'Received Date  : '),
                                Dimens.boxWidth10,
                                CustomTextFieldForStock(
                                  width: MediaQuery.of(context).size.width / 5,
                                  numberTextField: true,
                                  onTap: () {
                                    controller.openLastCalibrationDatePicker =
                                        !controller
                                            .openLastCalibrationDatePicker;
                                    controller.update(['calibration_tab']);
                                  },
                                  textController:
                                      controller.lastCalibrationDateTc,
                                ),
                              ],
                            ),
                            Dimens.boxHeight5,
                            Container(
                              child: Row(
                                children: [
                                  Text('Calibration certificate'),
                                  Dimens.boxWidth20,
                                  ActionButton(
                                    label: 'Upload certification file',
                                    onPressed: () {},
                                    icon: Icons.file_upload_outlined,
                                    color: ColorValues.appLightBlueColor,
                                  ),
                                  Dimens.boxWidth70,
                                ],
                              ),
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
                right: 150,
                top: 94,
                child: DatePickerWidget(
                  minDate: DateTime(DateTime.now().year - 2),
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
