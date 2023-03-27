import 'package:cmms/app/create_preventive_checklist/create_preventive_checklist_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_mobile.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_web.dart';
import 'package:cmms/app/theme/colors_value.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/date_range_picker.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/new_permit/new_permit_controller.dart';
import 'package:cmms/new_permit/view/new_permit_mobile.dart';
import 'package:cmms/new_permit/view/new_permit_web.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
            )
          : AppBar(
              title: Text('New Permit'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Obx(
        () => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              shadowColor: ColorsValue.greyColor,
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: DropdownWidget(
                              dropdownList: controller.facilityList,
                              isValueSelected:
                                  controller.isFacilitySelected.value,
                              selectedValue: controller.selectedFacility.value,
                              onValueChanged: controller.onValueChanged,
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
                // SizedBox(
                //   height: 15,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30),
                //   child: Text(
                //     'REQUEST A PERMIT TO WORK',
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30),
                //   child: Row(
                //     children: [
                //       CustomRichText(title: 'Block/Plot: '),
                //       SizedBox(
                //         width: 5,
                //       ),
                //       SizedBox(
                //         width: MediaQuery.of(context).size.width / 1.6,
                //         child: LoginCustomTextfield(),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 27,
                //     ),
                //     CustomRichText(title: 'Type of permit: '),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 1.82,
                //       child: CustomMultiSelectDialogField(
                //         initialValue: (controller
                //                 .selectedEquipmentCategoryIdList.isNotEmpty)
                //             ? controller.selectedEquipmentCategoryIdList
                //             : [],
                //         items: controller.equipmentCategoryList
                //             .map(
                //               (equipmentCategory) => MultiSelectItem(
                //                 equipmentCategory?.id,
                //                 equipmentCategory?.name ?? '',
                //               ),
                //             )
                //             .toList(),
                //         onConfirm: (selectedOptionsList) => {
                //           controller
                //               .equipmentCategoriesSelected(selectedOptionsList)
                //         },
                //       ),
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 27,
                //     ),
                //     CustomRichText(title: 'Equipment Categories: '),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 2.5,
                //       child: CustomMultiSelectDialogField(
                //         initialValue: (controller
                //                 .selectedEquipmentCategoryIdList.isNotEmpty)
                //             ? controller.selectedEquipmentCategoryIdList
                //             : [],
                //         items: controller.equipmentCategoryList
                //             .map(
                //               (equipmentCategory) => MultiSelectItem(
                //                 equipmentCategory?.id,
                //                 equipmentCategory?.name ?? '',
                //               ),
                //             )
                //             .toList(),
                //         onConfirm: (selectedOptionsList) => {
                //           controller
                //               .equipmentCategoriesSelected(selectedOptionsList)
                //         },
                //       ),
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // _buildStartDateField(context),
                // _buildValidTillField(context),
                // _buildJobDescriptionField(context),

                // Center(
                //   child: Container(
                //       height: 45,
                //       child: CustomElevatedButton(
                //         backgroundColor: ColorsValue.navyBlueColor,
                //         text: "Submit",
                //         onPressed: () {
                //           // controller.createCheckList();
                //         },
                //       )),
                // ),

                // Expanded(
                //   child: Row(
                //     children: [
                //       (Responsive.isMobile(context) ||
                //               Responsive.isTablet(context))
                //           ? Dimens.box0
                //           : HomeDrawer(),
                //       Expanded(
                //         child: Column(
                //           children: [
                //             if (Responsive.isMobile(context))
                //               Expanded(
                //                 child: NewPermitMobile(),
                //               ),
                //             if (Responsive.isDesktop(context))
                //               Expanded(
                //                 child: NewPermitWeb(),
                //               ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                /// CARD
                Expanded(
                  child: Container(
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
                           // if (Responsive.isMobile(context)) {
                              return SingleChildScrollView(
                                child: Column(
                                    ////
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 140),
                                        child: Text(
                                          'REQUEST A PERMIT TO WORK',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            CustomRichText(
                                                title: 'Block/Plot: '),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.6,
                                              child: Obx(
                                                ()=> DropdownWidget(
                                                  dropdownList:controller.blockList,
                                                  isValueSelected: controller.isBlockSelected.value,
                                                  selectedValue: controller.selectedBlock.value,
                                                  onValueChanged:controller.onValueChanged,
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
                                              title: 'Type of permit: '),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.82,
                                            child: DropdownWidget(
                                                  dropdownList:controller.typePermitList,
                                                  isValueSelected: controller.isTypePermitSelected.value,
                                                  selectedValue: controller.selectedTypePermit.value,
                                                  onValueChanged:controller.onValueChanged,
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
                                              title: 'Equipment Categories: '),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: CustomMultiSelectDialogField(
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
                                                      equipmentCategory?.id,
                                                      equipmentCategory?.name ??
                                                          '',
                                                    ),
                                                  )
                                                  .toList(),
                                              onConfirm:
                                                  (selectedOptionsList) => {
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
                                      _buildStartDateField(context),
                                      _buildValidTillField(context),
                                      _buildJobDescriptionField(context),

                                      Center(
                                        child: Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorsValue.navyBlueColor,
                                              text: "Submit",
                                              onPressed: () {
                                                 controller.createNewPermit();
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
                         //   } //
                            // else if (Responsive.isDesktop(context)) {
                            //   return Column(children: [
                            //     Row(//
                            //         children: [
                            //       Expanded(
                            //         child: Container(
                            //           //height: 1100,
                            //           child: Column(
                            //               //
                            //               mainAxisSize: MainAxisSize.max,
                            //               children: [
                            //                 /// SELECT BLOCK DropDown
                            //                 // _buildBlockDropdown(),

                            //                 /// WORK AREA (= EQUIPMENTS) DropDown
                            //                 // _buildWorkAreaDropdown(),

                            //                 /// TOOLS REQUIRED DropDown
                            //                 // _buildToolsRequiredDropdown(),

                            //                 /// JOB TITLE
                            //                 // _buildJobTitleField(),

                            //                 /// BREAKDOWN TIME
                            //                 // _buildBreakDownTimeField(
                            //                 //     context),
                            //               ]),
                            //         ),
                            //       ),
                            //       Dimens.boxWidth30,
                            //       Expanded(
                            //         child: Container(
                            //           //height: 1100,
                            //           child: Column(
                            //               //
                            //               mainAxisSize: MainAxisSize.max,
                            //               children: [
                            //                 ///MULTISELECT CONTROL Equipment Categories
                            //                 // _buildEquipmentCategoriesDropdown(),

                            //                 /// WORK TYPE  DropDown
                            //                 // _buildWorkTypeDropdown(),

                            //                 /// ASSIGNED TO DropDown
                            //                 // _buildAssignedToDropdown(),

                            //                 /// JOB DESCRIPTION
                            //                 // _buildJobDescriptionField(),
                            //               ]),
                            //         ),
                            //       ),
                            //     ]),

                            //     /// SAVE BUTTON
                            //     // _buildSaveJobButton(saveButtonStyle),
                            //     // SizedBox(height: 150,)
                            //   ]);
                            // }
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
    );
  }

  Widget _buildStartDateField(BuildContext context) {
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
                color: ColorsValue.whiteColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            color: ColorsValue.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            child: TextField(
              
              onTap: () {
                pickDateTime(context);
              },
              controller: controller.startDateTimeCtrlr,
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
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildValidTillField(BuildContext context) {
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
                color: ColorsValue.whiteColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            color: ColorsValue.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            child: TextField(
              onTap: () {
                pickDateTimeTill(context);
              },
              controller: controller.validTillTimeCtrlr,
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
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

//Start Date
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
    controller.startDateTimeCtrlr
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr.text.length,
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

  // Valid Till
  Future pickDateTimeTill(BuildContext context) async {
    var dateTime = controller.selectedValidTillTime.value;
    final date = await pickDateTill(context);
    if (date == null) {
      return;
    }

    final time = await pickTimeTill(context);
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

  Future<DateTime?> pickDateTill(BuildContext context) async {
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

  Future<TimeOfDay?> pickTimeTill(BuildContext context) async {
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

  Widget _buildJobDescriptionField(BuildContext context) {
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
                      color: ColorsValue.orangeColor,
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
              color: ColorsValue.whiteColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: ColorsValue.whiteColor,
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
      ),
      Dimens.boxHeight10,
    ]);
  }
}
