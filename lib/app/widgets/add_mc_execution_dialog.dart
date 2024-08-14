import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class AddMCExecutionDialog extends GetView {
  int? id;
  int? planId;
  String? frequency;
  AddMCExecutionDialog({this.id, this.planId, this.frequency});

  final ModuleCleaningListPlanController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleCleaningListPlanController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return StatefulBuilder(builder: ((context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            insetPadding: Dimens.edgeInsets10_0_10_0,
            // contentPadding: EdgeInsets.zero,
            title: Text(
              "Schedule Execution",
              style: TextStyle(
                fontSize: 15,
                color: ColorValues.appRedColor,
              ),
            ),
            content: Builder(builder: (context) {
              var height = MediaQuery.of(context).size.height;

              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorValues.lightGreyColorWithOpacity35,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorValues.appBlueBackgroundColor,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(right: 10, top: 10, left: 10),
                    height: height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Plan Id', style: Styles.black17),
                                  // Dimens.boxHeight5,
                                  SizedBox(height: 5),
                                  Text(
                                    '${planId}',
                                    style: Styles.blue17,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Start Date Time',
                                      style: Styles.black17),
                                  // Dimens.boxHeight5,
                                  SizedBox(height: 5),
                                  CustomTextFieldForStock(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    numberTextField: true,
                                    onTap: () {
                                      _controller.openStartDatePicker =
                                          !_controller.openStartDatePicker;
                                      _controller.update(['stock_Mangement']);
                                    },
                                    textController:
                                        _controller.startDateTimeCtrlr,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Frequency', style: Styles.black17),
                                  Dimens.boxHeight5,
                                  Text(
                                    '${frequency}',
                                    style: Styles.blue17,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              style: Styles.darkRedElevatedButtonStyle,
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Cancel'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: Styles.greenElevatedButtonStyle,
                              onPressed: () {
                                // print('Incident Report Id${incidentReportId![0]}');
                                // _controller.abandonAllExecutionButton(id: id);
                                Get.back();
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                        // Dimens.boxHeight30
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  if (_controller.openStartDatePicker)
                    Positioned(
                      right: 200,
                      top: 50,
                      child: DatePickerWidget(
                        minDate: DateTime(DateTime.now().year),
                        maxDate: DateTime(DateTime.now().year, 13,
                            0), // last date of this year
                        controller: DateRangePickerController(),
                        selectionChanges: (p0) {
                          print('po valu ${p0.value.toString()}');
                          _controller.startDateTimeCtrlr.text =
                              DateFormat('yyyy-MM-dd').format(p0.value);
                          _controller.openStartDatePicker =
                              !controller.openStartDatePicker;

                          _controller.update(['stock_Mangement']);
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement']);
                        },
                      ),
                    ),
                ],
              );
            }),
          );
        }));
      },
    );
  }
}
