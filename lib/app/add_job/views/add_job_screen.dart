import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../domain/models/inventory_category_model.dart';
import '../../theme/colors_value.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';
import '../../utils/responsive.dart';
import '../add_job_controller.dart';
import 'widgets/dropdown.dart';

class AddJobScreen extends GetView<AddJobController> {
  AddJobScreen({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    ///
    final ButtonStyle saveButtonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: Dimens.fourteen),
      backgroundColor: ColorsValue.navyBlueColor,
    );

    ///
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job'),
        centerTitle: true,
      ),
      body:
          //
          Obx(
        () => //
            Container(
          margin: Dimens.edgeInsets10_0_10_0,
          child: Column(children: [
            ///

            /// SELECT PLANT DropDown
            Row(
                //
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Plant:',
                    ),
                  ),
                  Expanded(
                    child: DropdownWidget(
                      dropdownList: controller.facilityList,
                      isValueSelected: controller.isFacilitySelected.value,
                      selectedValue: controller.selectedFacility.value,
                    ),
                  ),
                ]),
            Dimens.boxHeight20,

            /// CARD
            Container(
              child: Expanded(
                child: Card(
                  color: Colors.lightBlue.shade50,
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: Dimens.edgeInsets10,
                      child: (() {
                        if (Responsive.isMobile(context)) {
                          return SingleChildScrollView(
                            child: Column(
                                ////
                                children: [
                                  ///
                                  /// SELECT BLOCK DropDown
                                  _buildBlockDropdown(),

                                  ///MULTISELECT CONTROL Equipment Categories
                                  _buildEquipmentCategoriesDropdown(),

                                  /// WORK AREA (= EQUIPMENTS) DropDown
                                  _buildWorkAreaDropdown(),

                                  /// WORK TYPE  DropDown
                                  _buildWorkTypeDropdown(),

                                  /// TOOLS REQUIRED DropDown
                                  _buildToolsRequiredDropdown(),

                                  /// ASSIGNED TO DropDown
                                  _buildAssignedToDropdown(),

                                  /// JOB TITLE
                                  _buildJobTitleField(),

                                  /// JOB DESCRIPTION
                                  _buildJobDescriptionField(),

                                  /// BREAKDOWN TIME
                                  _buildBreakDownTimeField(context),

                                  /// SAVE BUTTON
                                  _buildSaveJobButton(saveButtonStyle),

                                  ///
                                ]),
                          );
                        } //
                        else if (Responsive.isDesktop(context)) {
                          return Column(children: [
                            Row(//
                                children: [
                              Expanded(
                                child: Container(
                                  //height: 1100,
                                  child: Column(
                                      //
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        /// SELECT BLOCK DropDown
                                        _buildBlockDropdown(),

                                        /// WORK AREA (= EQUIPMENTS) DropDown
                                        _buildWorkAreaDropdown(),

                                        /// TOOLS REQUIRED DropDown
                                        _buildToolsRequiredDropdown(),

                                        /// JOB TITLE
                                        _buildJobTitleField(),

                                        /// BREAKDOWN TIME
                                        _buildBreakDownTimeField(context),
                                      ]),
                                ),
                              ),
                              Dimens.boxWidth30,
                              Expanded(
                                child: Container(
                                  //height: 1100,
                                  child: Column(
                                      //
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ///MULTISELECT CONTROL Equipment Categories
                                        _buildEquipmentCategoriesDropdown(),

                                        /// WORK TYPE  DropDown
                                        _buildWorkTypeDropdown(),

                                        /// ASSIGNED TO DropDown
                                        _buildAssignedToDropdown(),

                                        /// JOB DESCRIPTION
                                        _buildJobDescriptionField(),
                                      ]),
                                ),
                              ),
                            ]),

                            /// SAVE BUTTON
                            _buildSaveJobButton(saveButtonStyle),
                          ]);
                        }
                      }())
                      //
                      ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );

    ///build ends
  }

  Widget _buildSaveJobButton(ButtonStyle saveButtonStyle) {
    return ElevatedButton(
      style: saveButtonStyle,
      onPressed: () => controller.saveJob(),
      child: const Text('Save'),
    );
  }

  Widget _buildBreakDownTimeField(BuildContext context) {
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorsValue.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          onTap: () {
            pickDateTime(context);
          },
          controller: controller.breakdownTimeCtrlr,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorsValue.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            // focusedErrorBorder:
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
          onChanged: (value) {
            // if (value.trim().length > 3) {
            //   controller.isJobTitleInvalid.value = false;
            // } else {
            //   controller.isJobTitleInvalid.value = true;
            // }
          },
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildJobDescriptionField() {
    return Column(//
        children: [
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
                    color: ColorsValue.orangeColor,
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorsValue.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: controller.jobDescriptionCtrlr,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorsValue.whiteColor,
            filled: true,
            contentPadding: Dimens.edgeInsets05_10,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: controller.isJobDescriptionInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorsValue.redColorDark,
                    ),
                  )
                : InputBorder.none,
            errorBorder: controller.isJobDescriptionInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorsValue.redColorDark,
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

  Widget _buildJobTitleField() {
    return Column(//
        children: [
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
                    color: ColorsValue.orangeColor,
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: ColorsValue.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: controller.jobTitleCtrlr,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorsValue.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: controller.isJobTitleInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorsValue.redColorDark,
                    ),
                  )
                : InputBorder.none,
            errorBorder: controller.isJobTitleInvalid.value
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: ColorsValue.redColorDark,
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

  Widget _buildAssignedToDropdown() {
    return Column(//
        children: [
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
                    color: ColorsValue.orangeColor,
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
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildToolsRequiredDropdown() {
    return Column(//
        children: [
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
        //isValueSelected: controller
        //.isToolRequiredToWorkTypeSelected.value,
        selectedValue: controller.selectedToolRequiredToWorkType.value,
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildWorkTypeDropdown() {
    return Column(//
        children: [
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
                    color: ColorsValue.orangeColor,
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorsValue.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: //

            MultiSelectDialogField(
          decoration: BoxDecoration(border: Border()),
          buttonIcon: Icon(Icons.arrow_drop_down),
          items: controller.workTypeList
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

  Widget _buildWorkAreaDropdown() {
    return Column(//
        children: [
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
                    color: ColorsValue.orangeColor,
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorsValue.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: MultiSelectDialogField(
          decoration: BoxDecoration(border: Border()),
          buttonIcon: Icon(Icons.arrow_drop_down),
          items: controller.workAreaList
              .map((e) => MultiSelectItem(e, e?.name ?? ''))
              .toList(),
          onConfirm: (selectedOptionsList) =>
              {controller.workAreasSelected(selectedOptionsList)},
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
                    color: ColorsValue.orangeColor,
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorsValue.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: //
            Obx(
          () => MultiSelectDialogField(
            decoration: BoxDecoration(border: Border()),
            buttonIcon: Icon(Icons.arrow_drop_down),
            items: controller.equipmentCategoryList
                .map(
                  (equipCat) => MultiSelectItem<InventoryCategoryModel?>(
                    equipCat,
                    equipCat?.name ?? '',
                  ),
                )
                .toList(),
            onConfirm: (selectedOptionsList) =>
                {controller.equipmentCategoriesSelected(selectedOptionsList)},
            chipDisplay: MultiSelectChipDisplay(),
          ),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildBlockDropdown() {
    return Column(children: [
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
                    color: ColorsValue.orangeColor,
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
      ),
      Dimens.boxHeight20,
    ]);
  }

  // _selectDate(BuildContext context) async {
  //   DateTime? newSelectedDate = await showDatePicker(
  //       context: context,
  //       initialDate: controller.selectedBreakdownTime != null
  //           ? controller.selectedBreakdownTime.value
  //           : DateTime.now(),
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2040),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData.dark().copyWith(
  //             colorScheme: ColorScheme.dark(
  //               primary: ColorsValue.blueColor,
  //               onPrimary: ColorsValue.whiteColor,
  //               surface: ColorsValue.lightBlueColor,
  //               onSurface: ColorsValue.navyBlueColor,
  //             ),
  //             dialogBackgroundColor: ColorsValue.whiteColor,
  //           ),
  //           child: child!,
  //         );
  //       });

  //   controller.selectedBreakdownTime.value = newSelectedDate ?? DateTime.now();
  //   controller.breakdownTimeCtrlr
  //     ..text = DateFormat('dd-MMM-yyyy - HH:mm')
  //         .format(controller.selectedBreakdownTime.value)
  //     //DateFormat.yMMMd().add_Hms().format()
  //     ..selection = TextSelection.fromPosition(
  //       TextPosition(
  //         offset: controller.breakdownTimeCtrlr.text.length,
  //         affinity: TextAffinity.upstream,
  //       ),
  //     );
  // }

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
