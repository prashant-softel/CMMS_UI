import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class AssignToPMTaskDialog extends GetView {
  int? id;
  AssignToPMTaskDialog({this.id});

  final PreventiveMaintenanceTaskViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "PM Task Id:",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            // Dimens.boxWidth10,
             SizedBox(width: 10),
            Text(
              "PMT${id}",
              style:
                  TextStyle(fontSize: 15, color: ColorValues.appDarkBlueColor),
            ),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
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
            padding: EdgeInsets.only(right: 30, top: 10),
            height: height / 4.7,
            // width: double.infinity,
            child: GetBuilder<PreventiveMaintenanceTaskViewController>(
              id: 'stock_Mangement',
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomRichText(title: 'Assign To  '),
                        // Dimens.boxWidth10,
                         SizedBox(width: 10),
                        SizedBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 7,
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
                            controller: controller,
                            dropdownList: controller.assignedToList,
                            isValueSelected:
                                controller.isAssignedToSelected.value,
                            selectedValue: controller.selectedAssignedTo.value,
                            onValueChanged: controller.onDropdownValueChanged,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                          Get.back();
                          controller.assignToPmTask(id: id ?? 0);
                        },
                        child: const Text('Submit'),
                      ),
                    ]),
                    Spacer(),
                  ],
                );
              },
            ),
          );
        }),
      );
    }));
  }

  Widget _buildDueDateField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      // Dimens.boxHeight5,
       SizedBox(height:5),
      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 7
              : MediaQuery.of(context).size.width / 1.0,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            onTap: () {
              pickDateTime_web(context);

              // : null;
            },
            controller: controller.dueDateTimeCtrlr,

            // :null,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              // focusedErrorBorder:
              // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
              //     controller.isJobTitleInvalid.value
              //         ? OutlineInputBorder(
              //             borderRadius:
              //                 BorderRadius.circular(5),
              //             borderSide: BorderSide(
              //               color: ColorsValue.redColorDark,
              //             ),
              //           )
              //         : InputBorder.none,
              // errorBorder:
              //     controller.isJobTitleInvalid.value
              //         ? OutlineInputBorder(
              //             borderRadius:
              //                 BorderRadius.circular(5),
              //             borderSide: BorderSide(
              //               color: ColorsValue.redColorDark,
              //             ),
              //           )
              //         : null,
              // errorText: controller.isJobTitleInvalid.value
              //     ? "Required field"
              //     : null,
            ),
          ),
        ),
      ),
      // Dimens.boxHeight20,
       SizedBox(height:20),
    ]);
  }

//Start Date and valid Till
  Future pickDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedDueTime.value;

    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    // final time = await pickTime_web(context);
    // if (time == null) {
    //   return;
    // }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      // time.hour,
      // time.minute,
    );

    controller.selectedDueTime.value = dateTime;

    controller.dueDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.dueDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.dueDateTimeCtrlr.text =
        DateFormat("yyyy-MM-dd").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedDueTime.value;

    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedDueTime.value;

    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }
}
