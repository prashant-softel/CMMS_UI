import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';

import '../../edit_job_controller.dart';

class BreakdownTimeWidget extends StatelessWidget {
  BreakdownTimeWidget({super.key});

  ///
  var controller = Get.find<EditJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Breakdown Time: ',
              style: Styles.blackBold16,
              children: []),
        ),
      ),
      Dimens.boxHeight5,
      Container(
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
        child: TextField(
          onTap: () {
            pickDateTime(context);
          },
          controller: controller.breakdownTimeCtrlr,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorValues.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          onChanged: (value) {},
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  ///
  Future pickDateTime(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime.value;
    final date = await pickDate(context);
    if (date == null) {
      return;
    }

    final time = await pickTime(context);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedBreakdownTime.value = dateTime;
    controller.breakdownTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.breakdownTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime.value;

    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    DateTime dateTime = controller.selectedBreakdownTime.value;

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

  ///
}
