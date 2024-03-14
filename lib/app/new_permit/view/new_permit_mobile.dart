import 'package:cmms/app/app.dart';
// import 'package:cmms/app/theme/colors_value.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class NewPermitMobile extends GetView<NewPermitController> {
  NewPermitMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: Get.width * .8,
                    height: 40,
                    child: DropdownWebWidget(
                      controller: controller,
                      dropdownList: controller.facilityList,
                      isValueSelected: controller.isFacilitySelected.value,
                      selectedValue: controller.selectedFacility.value,
                      onValueChanged: controller.onValueChanged,
                    ),
                  ),
                  Text(
                    "Request a Permit to Work",
                    style: Styles.blackBold18,
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.lightBlue.shade50,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichTextMobile(
                      title: "Block / Plot: ",
                    ),
                    Dimens.boxHeight2,
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Obx(
                        () => DropdownWebWidget(
                          dropdownList: controller.blockList,
                          isValueSelected: controller.isBlockSelected.value,
                          selectedValue: controller.selectedBlock.value,
                          onValueChanged: controller.onValueChanged,
                        ),
                      ),
                    ),
                    Dimens.boxHeight15,
                    CustomRichTextMobile(
                      title: "Type of Permit: ",
                    ),
                    Dimens.boxHeight2,
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Obx(
                        () => DropdownWebWidget(
                          dropdownList: controller.typePermitList,
                          isValueSelected:
                              controller.isTypePermitSelected.value,
                          selectedValue: controller.selectedTypePermit.value,
                          onValueChanged: controller.onValueChanged,
                        ),
                      ),
                    ),
                    Dimens.boxHeight15,
                    CustomRichTextMobile(
                      title: "Equipment Categories: ",
                    ),
                    Dimens.boxHeight2,
                    Obx(
                      () => SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: CustomMultiSelectDialogField(
                          title: 'Please Select',
                          buttonText: 'Equipment Category',
                          initialValue: (controller
                                  .selectedEquipmentCategoryIdList.isNotEmpty)
                              ? controller.selectedEquipmentCategoryIdList
                              : [],
                          items: controller.equipmentCategoryList
                              .map(
                                (equipmentCategory) => MultiSelectItem(
                                  equipmentCategory?.id,
                                  equipmentCategory?.name ?? '',
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller.equipmentCategoriesSelected(
                                selectedOptionsList),
                            print(
                                'Equipment list55 ${controller.selectedEquipmentCategoryIdList}')
                          },
                        ),
                      ),
                    ),
                    Dimens.boxHeight15,
                    CustomRichTextMobile(title: 'Start Date: '),
                    Dimens.boxHeight2,
                    _buildStartDateField_mobile(context),
                    Dimens.boxHeight15,
                    CustomRichTextMobile(title: 'Expiry Date: '),
                    Dimens.boxHeight2,
                    _buildValidTillField_mobile(context),
                    Dimens.boxHeight15,
                    _buildPermitDescriptionField_mobile(context),
                    Obx(
                      () => Row(
                        children: [
                          CustomRichTextMobile(
                              title: 'Electrical Isolation Required '),
                          Switch(
                            value: controller.isToggleOn.value,
                            onChanged: (value) {
                              controller.toggle();
                            },
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight2,
                    Obx(
                      () => controller.isToggleOn == true
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichTextMobile(
                                    title: 'Equipment Isolation '),
                                Dimens.boxHeight2,
                                SizedBox(
                                  child: CustomMultiSelectDialogField(
                                    buttonText: 'Select Equipment Isolation',
                                    title: 'Equipment Isolation',
                                    initialValue: (controller
                                            .selectedEquipmentIsolationIdList
                                            .isNotEmpty)
                                        ? controller
                                            .selectedEquipmentIsolationIdList
                                        : [],
                                    items: controller.equipmentIsolationList
                                        .map(
                                          (equipmentIsolation) =>
                                              MultiSelectItem(
                                            equipmentIsolation?.id,
                                            equipmentIsolation?.name ?? '',
                                          ),
                                        )
                                        .toList(),
                                    onConfirm: (selectedOptionsList) => {
                                      controller.equipmentIsolationSelected(
                                          selectedOptionsList),
                                      print(
                                          'Equipment Isolation list5: ${controller.equipmentIsolationList}')
                                    },
                                  ),
                                ),
                                Dimens.boxHeight15
                              ],
                            )
                          : Dimens.box0,
                    ),
                    Obx(
                      () => controller.isToggleOn == true
                          ? Container(
                              child: Column(
                                children: [
                                  CustomAppBar(
                                    title: "Loto Equipment List".tr,
                                  ),
                                  Dimens.boxHeight10,
                                  CustomMultiSelectDialogField(
                                    buttonText: 'Select Equipment Name',
                                    title: 'Equipment Name',
                                    initialValue: (controller
                                            .selectedEquipmentNameList
                                            .isNotEmpty)
                                        ? controller.selectedEquipmentNameIdList
                                        : [],
                                    items: controller.equipmentNameList
                                        .map(
                                          (equipmentName) => MultiSelectItem(
                                            equipmentName?.id,
                                            equipmentName?.name ?? '',
                                          ),
                                        )
                                        .toList(),
                                    onConfirm: (selectedOptionsList) => {
                                      controller.equipmentNameSelected(
                                          selectedOptionsList),
                                      print(
                                          'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                                    },
                                  ),
                                  Dimens.boxHeight10,
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      // width: MediaQuery.of(context).size.width,
                                      width: Get.width,
                                      child: Container(
                                        constraints:
                                            BoxConstraints(minHeight: 150),
                                        height: ((controller
                                                .filteredEquipmentNameList
                                                .length) *
                                            60),
                                        // 90,
                                        child: DataTable2(
                                          columns: [
                                            DataColumn2(
                                                fixedWidth: 160,
                                                label: Text("Loto Applied On")),
                                            DataColumn2(
                                                fixedWidth: 100,
                                                label: Text("Serial Number")),
                                            DataColumn2(
                                                fixedWidth: 100,
                                                label: Text("Action")),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.filteredEquipmentNameList
                                                .length,
                                            (index) {
                                              var inventoryEquipmentName =
                                                  controller
                                                          .filteredEquipmentNameList[
                                                      index];
                                              controller.id.value =
                                                  inventoryEquipmentName?.id ??
                                                      0;
                                              print(
                                                  'Equipment Isss5:${controller.id.value}');
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(
                                                        '${inventoryEquipmentName?.name ?? ''}'),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                        '${inventoryEquipmentName?.serialNumber ?? ''}'),
                                                  ),
                                                  DataCell(
                                                    Wrap(
                                                      children: [
                                                        TableActionButton(
                                                          color: Colors.red,
                                                          icon: Icons
                                                              .delete_outline,
                                                          message: 'Remove',
                                                          onPress: () {
                                                            controller
                                                                .removeItem(
                                                                    index);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Dimens.box0,
                    ),
                    Dimens.boxHeight15,
                    CustomRichTextMobile(title: "Job Type: "),
                    Dimens.boxHeight2,
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Obx(
                        () => DropdownWebWidget(
                          dropdownList: controller.jobTypeList,
                          isValueSelected:
                              controller.isJobTypeListSelected.value,
                          selectedValue: controller.selectedJobType.value,
                          onValueChanged: controller.onValueChanged,
                        ),
                      ),
                    ),
                    Dimens.boxHeight15,
                    CustomRichTextMobile(title: "SOP: "),
                    Dimens.boxHeight2,
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Obx(
                        () => DropdownWebWidget(
                          dropdownList: controller.sopPermitList,
                          isValueSelected:
                              controller.isSopPermitListSelected.value,
                          selectedValue: controller.selectedSopPermit.value,
                          onValueChanged: controller.onValueChanged,
                        ),
                      ),
                    ),
                    Dimens.boxHeight15,
                    Row(
                      children: [
                        Spacer(),
                        CustomElevatedButton(
                          backgroundColor: ColorValues.navyBlueColor,
                          text: "Create JSA",
                          onPressed: () {
                            Get.dialog<void>(ViewJSADialog());
                          },
                        ),
                        Spacer(),
                        CustomElevatedButton(
                          backgroundColor: ColorValues.navyBlueColor,
                          text: "View SOP",
                          onPressed: () {
                            Get.dialog<void>(ViewSOPDialog());
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                    Dimens.boxHeight15,
                    // FileUploadWidgetWithDropzone(),
                    CustomRichTextMobile(title: 'Conducted At Job-Site By: '),
                    Dimens.boxHeight2,
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Obx(
                        () => DropdownWebWidget(
                          dropdownList: controller.employeeNameList,
                          isValueSelected:
                              controller.isemployeeNameListSelected.value,
                          selectedValue:
                              controller.selectedEmployeeNamesList.value,
                          onValueChanged: controller.onValueTbtConductedChanged,
                        ),
                      ),
                    ),
                    Dimens.boxHeight15,
                    //
                    CustomRichTextMobile(title: 'Date and Time: '),
                    Dimens.boxHeight2,
                    _buildTBTDateField_mobile(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ////Below All for Mobile
  Widget _buildStartDateField_mobile(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            onTap: () {
              pickDateTime_mobile(context);
            },
            controller: controller.startDateTimeCtrlr,
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
      ),
    ]);
  }

  Widget _buildValidTillField_mobile(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            onTap: () {
              pickDateTimeTill_mobile(context);
            },
            controller: controller.validTillTimeCtrlr,
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
      ),
    ]);
  }

//Start Date for mobile
  Future pickDateTime_mobile(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime.value;
    final date = await pickDate_mobile(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_mobile(context);
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
    controller.startDateTimeCtrlr
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate_mobile(BuildContext context) async {
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

  Future<TimeOfDay?> pickTime_mobile(BuildContext context) async {
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

  // Valid Till for mobile
  Future pickDateTimeTill_mobile(BuildContext context) async {
    var dateTime = controller.selectedValidTillTime.value;
    final date = await pickDateTill_mobile(context);
    if (date == null) {
      return;
    }

    final time = await pickTimeTill_mobile(context);
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
    controller.selectedValidTillTime.value = dateTime;
    controller.validTillTimeCtrlr
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDateTill_mobile(BuildContext context) async {
    DateTime? dateTime = controller.selectedValidTillTime.value;
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

  Future<TimeOfDay?> pickTimeTill_mobile(BuildContext context) async {
    DateTime dateTime = controller.selectedValidTillTime.value;
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

  Widget _buildPermitDescriptionField_mobile(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomRichTextMobile(title: 'Permit Description: '),
      Dimens.boxHeight2,
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            controller: controller.permitDescriptionCtrlr,
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
      ),
      Dimens.boxHeight15,
    ]);
  }

  showEquipmentNameAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Select Equipment Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: CustomMultiSelectDialogField(
                        buttonText: 'Equipment Name',
                        title: 'Select Equipment Name',
                        initialValue:
                            (controller.selectedEquipmentNameList.isNotEmpty)
                                ? controller.selectedEquipmentNameIdList
                                : [],
                        items: controller.equipmentNameList
                            .map(
                              (equipmentName) => MultiSelectItem(
                                equipmentName?.id,
                                equipmentName?.name ?? '',
                              ),
                            )
                            .toList(),
                        onConfirm: (selectedOptionsList) => {
                          controller.equipmentNameSelected(selectedOptionsList),
                          print(
                              'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                        },
                      ),
                    )
                  ]),
            ),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  checkboxAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'JSA & SOP is not Accepted !!',
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 100,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Text(
                      'Please check the JSA and SOP Terms and Condition. \n Please click on View JSA and View SOP Button.')
                ]),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  AddEmployeeListAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        title: Text(
          'Select Employee Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              // height: double.infinity,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: CustomMultiSelectDialogField(
                        buttonText: 'Add Employee',
                        title: 'Select Employee',
                        initialValue:
                            (controller.selectedEmployeeNameList.isNotEmpty)
                                ? controller.selectedEmployeeNameIdList
                                : [],
                        items: controller.employeeNameList
                            .map(
                              (employeeName) => MultiSelectItem(
                                employeeName?.id,
                                employeeName?.name ?? '',
                              ),
                            )
                            .toList(),
                        onConfirm: (selectedOptionsList) => {
                          controller.employeeNameSelected(selectedOptionsList),
                          print(
                              'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                        },
                      ),
                    )
                  ]),
            ),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  checkBoxMethod(int position) {
    return Checkbox(
        value: position == 1
            ? controller.isChecked1.value
            : position == 2
                ? controller.isChecked2.value
                : position == 3
                    ? controller.isChecked3.value
                    : position == 4
                        ? controller.isChecked4.value
                        : position == 5
                            ? controller.isChecked5.value
                            : position == 6
                                ? controller.isChecked6.value
                                : position == 7
                                    ? controller.isChecked7.value
                                    : null,
        onChanged: (bool? value) {
          position == 1
              ? controller.toggleCheckbox1()
              : position == 2
                  ? controller.toggleCheckbox2()
                  : position == 3
                      ? controller.toggleCheckbox3()
                      : position == 4
                          ? controller.toggleCheckbox4()
                          : position == 5
                              ? controller.toggleCheckbox5()
                              : position == 6
                                  ? controller.toggleCheckbox6()
                                  : position == 7
                                      ? controller.toggleCheckbox7()
                                      : null;
        });
  }

  Widget _buildTBTDateField_mobile(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            onTap: () {
              pickDateTime_mobile(context);
            },
            controller: controller.tbtDateTimeCtrlrBuffer,
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
      ),
    ]);
  }
}
