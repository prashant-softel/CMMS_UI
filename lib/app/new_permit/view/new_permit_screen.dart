import 'package:cmms/app/create_preventive_checklist/create_preventive_checklist_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_mobile.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_web.dart';
import 'package:cmms/app/theme/color_values.dart';
// import 'package:cmms/app/theme/colors_value.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/date_range_picker.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit/view/new_permit_mobile.dart';
import 'package:cmms/app/new_permit/view/new_permit_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

// import '../../home/widgets/header_widget.dart';
// import '../../home/widgets/home_drawer.dart';
// import '../../navigators/app_pages.dart';
// import '../../theme/colors_value.dart';
// import '../../theme/dimens.dart';
// import '../../utils/responsive.dart';
// import '../preventive_list_controller.dart';

class NewPermitScreen extends GetView<NewPermitController> {
  NewPermitScreen({super.key});
  // final NewPermitController controller = Get.find();

  DateTime? _dateTime1;
  DateTime? _dateTime2;
  TimeOfDay? time1;
  TimeOfDay? time2;

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
            )
          : AppBar(
              title: Text('New Permit List'),
              centerTitle: true,
              elevation: 0,
            ),
     
      body: Container(
        // width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                : HomeDrawer(),
            Obx(
              () => Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  if(Responsive.isMobile(context))
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text('Select Plant:'),
                              // DropdownWidget(
                              //   // controller: controller,
                              //   dropdownList: controller.facilityList,
                              //   isValueSelected: controller.isFacilitySelected.value,
                              //   selectedValue: controller.selectedFacility.value,
                              //   onValueChanged: controller.onValueChanged,
                              // )
                              Obx(
                                () => Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.38,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Card(
                                      shadowColor: ColorValues.greyColor,
                                      elevation: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: DropdownWidget(
                                          dropdownList: controller.facilityList,
                                          isValueSelected: controller
                                              .isFacilitySelected.value,
                                          selectedValue:
                                              controller.selectedFacility.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        ),
                                        // DropdownButtonHideUnderline(
                                        //   child: DropdownButton(
                                        //     isExpanded: true,
                                        //     value: controller.selectedFacility.value,
                                        //     icon: const Icon(
                                        //         Icons.keyboard_arrow_down_outlined),
                                        //     elevation: 7,
                                        //     style: const TextStyle(color: Colors.black),
                                        //     onChanged: (String? selectedValue) {
                                        //       controller.isFacilitySelected.value =
                                        //           true;
                                        //       controller.selectedFacility.value =
                                        //           selectedValue ?? '';
                                        //     },
                                        //     items: controller.facilityList
                                        //         .map<DropdownMenuItem<String>>(
                                        //             (facility) {
                                        //       return DropdownMenuItem<String>(
                                        //         value: facility?.name ?? '',
                                        //         child: Text(facility?.name ?? ''),
                                        //       );
                                        //     }).toList(),
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// CARD
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
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
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 140),
                                                child: Text(
                                                  'REQUEST A PERMIT TO WORK',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Block/Plot: '),
                                                    // SizedBox(
                                                    //   width: 5,
                                                    // ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.6,
                                                      child: Obx(
                                                        () => DropdownWidget(
                                                          dropdownList:
                                                              controller
                                                                  .blockList,
                                                          isValueSelected:
                                                              controller
                                                                  .isBlockSelected
                                                                  .value,
                                                          selectedValue:
                                                              controller
                                                                  .selectedBlock
                                                                  .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      ),
                                                      // LoginCustomTextfield(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  CustomRichText(
                                                      title:
                                                          'Type of permit: '),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.82,
                                                    child: DropdownWidget(
                                                      dropdownList: controller
                                                          .typePermitList,
                                                      isValueSelected: controller
                                                          .isTypePermitSelected
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedTypePermit
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  CustomRichText(
                                                      title:
                                                          'Equipment Categories: '),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child:
                                                        CustomMultiSelectDialogField(
                                                      initialValue: (controller
                                                              .selectedEquipmentCategoryIdList
                                                              .isNotEmpty)
                                                          ? controller
                                                              .selectedEquipmentCategoryIdList
                                                          : [],
                                                      items: controller
                                                          .equipmentCategoryList
                                                          .map(
                                                            (equipmentCategory) =>
                                                                MultiSelectItem(
                                                              equipmentCategory
                                                                  ?.id,
                                                              equipmentCategory
                                                                      ?.name ??
                                                                  '',
                                                            ),
                                                          )
                                                          .toList(),
                                                      onConfirm:
                                                          (selectedOptionsList) =>
                                                              {
                                                        controller
                                                            .equipmentCategoriesSelected(
                                                                selectedOptionsList),
                                                        print(
                                                            'Equipment list ${controller.equipmentCategoryList}')
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              _buildStartDateField_mobile(
                                                  context),
                                              _buildValidTillField_mobile(
                                                  context),
                                              _buildJobDescriptionField_mobile(
                                                  context),

                                              Center(
                                                child: Container(
                                                    height: 45,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .navyBlueColor,
                                                      text: "Submit",
                                                      onPressed: () {
                                                        controller
                                                            .createNewPermit();
                                                      },
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 90,
                                              ),

                                              // /
                                              // / SELECT BLOCK DropDown
                                              // _buildBlockDropdown(),

                                              // /MULTISELECT CONTROL Equipment Categories
                                              // _buildEquipmentCategoriesDropdown(),

                                              // / WORK AREA (= EQUIPMENTS) DropDown
                                              // _buildWorkAreaDropdown(),

                                              // / WORK TYPE  DropDown
                                              // _buildWorkTypeDropdown(),

                                              // / TOOLS REQUIRED DropDown
                                              // _buildToolsRequiredDropdown(),

                                              // / ASSIGNED TO DropDown
                                              // _buildAssignedToDropdown(),

                                              // / JOB TITLE
                                              // _buildJobTitleField(),

                                              // / JOB DESCRIPTION
                                              // _buildJobDescriptionField(),

                                              // / BREAKDOWN TIME
                                              // _buildBreakDownTimeField(context),

                                              // / SAVE BUTTON
                                              // _buildSaveJobButton(saveButtonStyle),

                                              ///
                                              SizedBox(
                                                height: 50,
                                              ),
                                            ]),
                                      );
                                    } else if (Responsive.isDesktop(context)) {
                                      return SingleChildScrollView(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 50),
                                                child: Text(
                                                  'REQUEST A PERMIT TO WORK',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 35,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Block/Plot: '),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.75,
                                                    child: Obx(
                                                      () => DropdownWidget(
                                                        dropdownList: controller
                                                            .blockList,
                                                        isValueSelected:
                                                            controller
                                                                .isBlockSelected
                                                                .value,
                                                        selectedValue:
                                                            controller
                                                                .selectedBlock
                                                                .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                    // LoginCustomTextfield(),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    // CustomRichText(
                                                    //     title: 'Block/Plot: '),
                                                    // // SizedBox(
                                                    // //   width: 5,
                                                    // // ),
                                                    // SizedBox(
                                                    //   width: MediaQuery.of(context).size.width / 3.5,
                                                    //   child: Obx(
                                                    //     ()=> DropdownWidget(
                                                    //       dropdownList:controller.blockList,
                                                    //       isValueSelected: controller.isBlockSelected.value,
                                                    //       selectedValue: controller.selectedBlock.value,
                                                    //       onValueChanged:controller.onValueChanged,
                                                    //     ),
                                                    //   ),
                                                    //   // LoginCustomTextfield(),
                                                    // ),

                                                    CustomRichText(
                                                        title:
                                                            'Type of permit: '),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.75,
                                                      child: Obx(
                                                        () => DropdownWidget(
                                                          dropdownList: controller
                                                              .typePermitList,
                                                          isValueSelected:
                                                              controller
                                                                  .isTypePermitSelected
                                                                  .value,
                                                          selectedValue: controller
                                                              .selectedTypePermit
                                                              .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 60,
                                                    ),
                                                    CustomRichText(
                                                        title:
                                                            'Equipment Categories: '),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.7,
                                                      child:
                                                          CustomMultiSelectDialogField(
                                                        initialValue: (controller
                                                                .selectedEquipmentCategoryIdList
                                                                .isNotEmpty)
                                                            ? controller
                                                                .selectedEquipmentCategoryIdList
                                                            : [],
                                                        items: controller
                                                            .equipmentCategoryList
                                                            .map(
                                                              (equipmentCategory) =>
                                                                  MultiSelectItem(
                                                                equipmentCategory
                                                                    ?.id,
                                                                equipmentCategory
                                                                        ?.name ??
                                                                    '',
                                                              ),
                                                            )
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) =>
                                                                {
                                                          controller
                                                              .equipmentCategoriesSelected(
                                                                  selectedOptionsList),
                                                          print(
                                                              'Equipment list ${controller.equipmentCategoryList}')
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  _buildStartDateField_web(
                                                      context),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  _buildValidTillField_web(
                                                      context),
                                                ],
                                              ),
                                              _buildJobDescriptionField_web(
                                                  context),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Center(
                                                child: Container(
                                                    height: 45,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .navyBlueColor,
                                                      text: "Submit",
                                                      onPressed: () {
                                                        controller
                                                            .createNewPermit();
                                                      },
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 90,
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                            ]),
                                      );
                                    }
                                  }())
                                  //
                                  ),
                            ),
                          ),
                        ),
                        // Expanded(child: NewPermitMobile()),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ////Below All for Mobile
  Widget _buildStartDateField_mobile(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
            text: TextSpan(
                text: 'Start Date: ', style: Styles.blackBold16, children: []),
          ),
        ),
      ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Container(
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
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildValidTillField_mobile(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
            text: TextSpan(
                text: 'Valid Till: ', style: Styles.blackBold16, children: []),
          ),
        ),
      ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
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
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

//Start Date
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

  // Valid Till
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

  Widget _buildJobDescriptionField_mobile(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
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
      ),
      Dimens.boxHeight10,
    ]);
  }

  ///Below All For WEB

  Widget _buildStartDateField_web(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(right: 385),
          child: RichText(
            text: TextSpan(
                text: 'Start Date: ', style: Styles.blackBold16, children: []),
          ),
        ),
      ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
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
            width: MediaQuery.of(context).size.width / 2.88,
            child: TextField(
              onTap: () {
                pickDateTime_web(context);
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
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildValidTillField_web(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(right: 450),
          child: RichText(
            text: TextSpan(
                text: 'Valid Till: ', style: Styles.blackBold16, children: []),
          ),
        ),
      ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Container(
          // width: MediaQuery.of(context).size.width / 4,
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
            width: MediaQuery.of(context).size.width / 2.6,
            // width: 50,
            child: TextField(
              onTap: () {
                pickDateTimeTill_web(context);
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
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

//Start Date
  Future pickDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
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

  Future<DateTime?> pickDate_web(BuildContext context) async {
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

  Future<TimeOfDay?> pickTime_web(BuildContext context) async {
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

  // Valid Till
  Future pickDateTimeTill_web(BuildContext context) async {
    var dateTime = controller.selectedValidTillTime.value;
    final date = await pickDateTill_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTimeTill_web(context);
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

  Future<DateTime?> pickDateTill_web(BuildContext context) async {
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

  Future<TimeOfDay?> pickTimeTill_web(BuildContext context) async {
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

  Widget _buildJobDescriptionField_web(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
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
      ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
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
            width: MediaQuery.of(context).size.width / 1.4,
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
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }
}