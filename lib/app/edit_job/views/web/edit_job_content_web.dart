import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/dropdown.dart';
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

  Widget _buildSaveJobButton(ButtonStyle saveButtonStyle) {
    return ElevatedButton(
      style: saveButtonStyle,
      onPressed: () => controller.updateJob(),
      child: const Text('Save'),
    );
  }

  Widget _buildJobDescriptionField() {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Job Description: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
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
            ),
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: controller.jobDescriptionCtrlr,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorValues.whiteColor,
            filled: true,
            contentPadding: Dimens.edgeInsets05_10,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: controller.isJobDescriptionInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorValues.redColorDark,
                    ),
                  )
                : InputBorder.none,
            errorBorder: controller.isJobDescriptionInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorValues.redColorDark,
                    ),
                  )
                : null,
            errorText: controller.isJobDescriptionInvalid.value
                ? "Required field"
                : null,
          ),
          onChanged: (value) {
            if (value.trim().length > 3) {
              controller.isJobDescriptionInvalid.value = false;
            } else {
              controller.isJobDescriptionInvalid.value = true;
            }
          },
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

  Widget _buildAssignedToDropdown() {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Assigned To: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
      Dimens.boxHeight5,
      DropdownWidget(
        dropdownList: controller.assignedToList,
        isValueSelected: controller.isAssignedToSelected.value,
        selectedValue: controller.selectedAssignedTo.value,
        onValueChanged: controller.onValueChanged,
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildWorkTypeDropdown() {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Work Type: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
      Dimens.boxHeight5,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
            ),
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: MultiSelectDialogField(
          decoration: BoxDecoration(border: Border()),
          buttonIcon: Icon(Icons.arrow_drop_down),
          items: controller.workTypeList.value
              .map((e) => MultiSelectItem(e, e?.workType ?? ''))
              .toList(),
          onConfirm: (selectedOptionsList) =>
              {controller.workTypesSelected(selectedOptionsList)},
          chipDisplay: MultiSelectChipDisplay(),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildEquipmentCategoriesDropdown() {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Equipment Categories: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
      Dimens.boxHeight5,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
            ),
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: //
            MultiSelectDialogField(
          initialValue: //
              (controller.selectedEquipmentCategoryIdList.isNotEmpty)
                  ? controller.selectedEquipmentCategoryIdList
                  : [],
          decoration: BoxDecoration(border: Border()),
          buttonIcon: Icon(Icons.arrow_drop_down),
          items: controller.equipmentCategoryList
              .map(
                (equipmentCategory) => MultiSelectItem(
                  equipmentCategory?.id,
                  equipmentCategory?.name ?? '',
                ),
              )
              .toList(),
          onConfirm: (selectedOptionsList) =>
              {controller.equipmentCategoriesSelected(selectedOptionsList)},
          chipDisplay: MultiSelectChipDisplay(),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildBreakDownTimeField(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Breakdown Time: ',
              style: Styles.blackBold16,
              children: [
                // TextSpan(
                //   text: '*',
                //   style: TextStyle(
                //     color: ColorValues.orangeColor,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ]),
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
          //focusNode: AlwaysDisabledFocusNode(),
          //controller: _textEditingController,
          onTap: () {
            pickDateTime(context);
            //_selectDate(context);
          },
          controller: controller.breakdownTimeCtrlr,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorValues.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildJobTitleField() {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Job Title: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
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
          controller: controller.jobTitleCtrlr,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorValues.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: controller.isJobTitleInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorValues.redColorDark,
                    ),
                  )
                : InputBorder.none,
            errorBorder: controller.isJobTitleInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorValues.redColorDark,
                    ),
                  )
                : null,
            errorText:
                controller.isJobTitleInvalid.value ? "Required field" : null,
          ),
          onChanged: (value) {
            if (value.trim().length > 3) {
              controller.isJobTitleInvalid.value = false;
            } else {
              controller.isJobTitleInvalid.value = true;
            }
          },
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildToolsRequiredDropdown() {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: 'Tools Required To Work Type: ',
            style: Styles.blackBold16,
            children: [],
          ),
        ),
      ),
      Dimens.boxHeight5,
      DropdownWidget(
        dropdownList: controller.toolsRequiredToWorkTypeList,
        selectedValue: controller.selectedToolRequiredToWorkType.value,
        onValueChanged: controller.onValueChanged,
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildWorkAreaDropdown() {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Work Area / Equipments: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
      Dimens.boxHeight5,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
            ),
            BoxShadow(
              color: ColorValues.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorValues.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: MultiSelectDialogField(
          initialValue: //
              (controller.selectedWorkAreaIdList.isNotEmpty)
                  ? controller.selectedWorkAreaIdList
                  : [],
          decoration: BoxDecoration(border: Border()),
          buttonIcon: Icon(Icons.arrow_drop_down),
          items: controller.workAreaList
              .map(
                (equipment) => MultiSelectItem(
                  equipment?.id,
                  equipment?.name ?? '',
                ),
              )
              .toList(),
          onConfirm: (selectedOptionsList) =>
              {controller.workAreasSelected(selectedOptionsList)},
          chipDisplay: MultiSelectChipDisplay(),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildBlockDropdown() {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              text: 'Select Block: ',
              style: Styles.blackBold16,
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: ColorValues.orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
      Dimens.boxHeight5,
      DropdownWidget(
        dropdownList: controller.blockList,
        isValueSelected: controller.isBlockSelected.value,
        selectedValue: controller.selectedBlock.value,
        onValueChanged: controller.onValueChanged,
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
