import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../theme/dimens.dart';
import '../../edit_job_controller.dart';
import '../widgets/assigned_to_widget.dart';
import '../widgets/block_widget.dart';
import '../widgets/breakdown_time_widget.dart';
import '../widgets/equipment_categories_widget.dart';
import '../widgets/job_description_widget.dart';
import '../widgets/job_title_widget.dart';
import '../widgets/tools_required_widget.dart';
import '../widgets/update_job_button_widget.dart';
import '../widgets/work_area_widget.dart';
import '../widgets/work_type_widget.dart';

class EditJobContentWeb extends GetView<EditJobController> {
  EditJobContentWeb({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return //
        SingleChildScrollView(
      child: Column(//
          children: [
        Row(//
            children: [
          Expanded(
            child: //
                Container(
              child: //
                  Column(
                      //
                      mainAxisSize: MainAxisSize.max,
                      children: [
                    /// SELECT BLOCK DropDown
                    BlockWidget(),

                    /// WORK AREA (= EQUIPMENTS) DropDown
                    WorkAreaWidget(),

                    /// TOOLS REQUIRED DropDown
                    ToolsRequiredWidget(),

                    /// JOB TITLE
                    JobTitleWidget(),

                    /// BREAKDOWN TIME
                    BreakdownTimeWidget(),
                  ]),
            ),
          ),
          Dimens.boxWidth30,
          Expanded(
            child: Container(
              child: Column(
                  //
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ///MULTISELECT CONTROL Equipment Categories
                    EquipmentCategoriesWidget(),

                    /// WORK TYPE  DropDown
                    WorkTypeWidget(),

                    /// ASSIGNED TO DropDown
                    AssignedToWidget(),

                    /// JOB DESCRIPTION
                    JobDescriptionWidget(),
                  ]),
            ),
          ),
        ]),

        /// SAVE BUTTON
        UpdateJobButtonWidget(),
      ]),
    );

    ///build ends
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
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.breakdownTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime.value;
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    DateTime dateTime = controller.selectedBreakdownTime.value;
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

  /// class ends
}
