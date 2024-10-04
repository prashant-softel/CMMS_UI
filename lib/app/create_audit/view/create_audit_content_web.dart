import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/create_audit/create_audit_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class CreateAuditWeb extends GetView<CreateAuditController> {
//   CreateAuditWeb({
//     Key? key,
//   }) : super(key: key);
//   final CreateAuditController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     Widget _rowptwItem(int? defaultValue, {required Function(bool) onCheck}) {
//       return CustomSwitchTroggle(
//           value: defaultValue == 1 ? true : false,
//           onChanged: (value) {
//             print("object");
//             controller.isToggleOn.value = value!;
//             onCheck(value);

//             //  controller.toggle();
//           });
//     }

//     AddEmployeeListAlertBox() {
//       return StatefulBuilder(
//         builder: ((context, setState) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15.0)),
//             ),
//             insetPadding: Dimens.edgeInsets10_0_10_0,
//             contentPadding: EdgeInsets.zero,
//             title: Text(
//               'Select Employee Name',
//               textAlign: TextAlign.center,
//               // style: TextStyle(color: Colors.green),
//             ),
//             content: Builder(
//               builder: (context) {
//                 return Obx(
//                   () => Container(
//                     padding: Dimens.edgeInsets05_0_5_0,
//                     height: 300,
//                     width: 300,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Divider(
//                           color: ColorValues.greyLightColour,
//                           thickness: 1,
//                         ),
//                         SizedBox(
//                           height: 50,
//                         ),
//                         SizedBox(
//                           width: 250,
//                           height: 120,
//                           child: CustomMultiSelectDialogField(
//                             buttonText: 'Add Employee',
//                             title: 'Select Employee',
//                             initialValue:
//                                 controller.selectedEmployeeNameIdList.value,
//                             items: controller.employeeNameList
//                                 .map(
//                                   (employeeName) => MultiSelectItem(
//                                     employeeName?.id,
//                                     employeeName?.name ?? '',
//                                   ),
//                                 )
//                                 .toList(),
//                             onConfirm: (selectedOptionsList) => {
//                               controller
//                                   .employeeNameSelected(selectedOptionsList),
//                               controller.selectedEmployeeNameIdList.value =
//                                   selectedOptionsList.cast<int>().toList(),
//                               print(
//                                   'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             actions: [
//               Center(
//                 child: Container(
//                   height: 45,
//                   child: CustomElevatedButton(
//                     backgroundColor: ColorValues.navyBlueColor,
//                     text: "Ok",
//                     onPressed: () {
//                       Get.back();
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//       );
//     }

//     // checkBoxMethod(bool isChecked, Function(bool?) onChange) {
//     //   return Checkbox(
//     //     value: isChecked,
//     //     // value: isInitialChecked,
//     //     onChanged: onChange,
//     //   );
//     // }

//     void _removeRow(int index) {
//       controller.filteredEmployeeNameList.removeAt(index);
//       controller.selectedEmployeeNameIdList.removeAt(index);
//     }

//     return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//       return GetBuilder<CreateAuditController>(
//           id: 'stock_Mangement',
//           builder: (controller) {
//             return SelectionArea(
//               child: Column(
//                 children: [
//                   HeaderWidget(),
//                   Container(
//                     height: 45,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Color.fromARGB(255, 227, 224, 224),
//                         width: 1,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 236, 234, 234)
//                               .withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.home,
//                           color: ColorValues.greyLightColor,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Get.offNamed(Routes.home);
//                           },
//                           child: Text(
//                             "DASHBOARD",
//                             style: Styles.greyLight14,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: controller.type.value == AppConstants.kMis
//                               ? Text(" / MIS", style: Styles.greyLight14)
//                               : controller.type.value ==
//                                       AppConstants.kEvaluation
//                                   ? Text(" / EVALUATION",
//                                       style: Styles.greyLight14)
//                                   : Text(" / AUDIT", style: Styles.greyLight14),
//                         ),
//                         controller.type.value == AppConstants.kMis
//                             ? Text(" / CREATE OBSERVATION PLAN",
//                                 style: Styles.greyLight14)
//                             : controller.type.value == AppConstants.kEvaluation
//                                 ? Text(" / CREATE EVALUATION",
//                                     style: Styles.greyLight14)
//                                 : Text(" / CREATE AUDIT",
//                                     style: Styles.greyLight14)
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Stack(
//                         children: [
//                           Obx(
//                             () => Container(
//                               height: Get.height,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10, right: 10, left: 10),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 10, right: 10, left: 10),
//                                           child: controller.type.value ==
//                                                   AppConstants.kMis
//                                               ? Text(
//                                                   " Create Observation Plan",
//                                                   style: Styles.blackBold14,
//                                                 )
//                                               : controller.type.value ==
//                                                       AppConstants.kEvaluation
//                                                   ? Text(
//                                                       " Create Evaluation Plan",
//                                                       style: Styles.blackBold14,
//                                                     )
//                                                   : Text(
//                                                       " Create Audit",
//                                                       style: Styles.blackBold14,
//                                                     ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: ColorValues.greyLightColour,
//                                   ),
//                                   Dimens.boxHeight15,
//                                   controller.type.value == AppConstants.kMis
//                                       ? Dimens.box0
//                                       : Row(
//                                           children: [
//                                             Spacer(),
//                                             SizedBox(
//                                                 width: 180,
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 120),
//                                                   child: CustomRichText(
//                                                       title: 'Title :'),
//                                                 )),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 border: Border.all(
//                                                   color: Color.fromARGB(
//                                                       255, 227, 224, 224),
//                                                   width: 1,
//                                                 ),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Color.fromARGB(
//                                                             255, 236, 234, 234)
//                                                         .withOpacity(0.5),
//                                                     spreadRadius: 2,
//                                                     blurRadius: 5,
//                                                     offset: Offset(0, 2),
//                                                   ),
//                                                 ],
//                                               ),
//                                               width: (MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .3),
//                                               child: LoginCustomTextfield(
//                                                 textController:
//                                                     controller.planTitleTc,

//                                                 //validate
//                                                 errorController: controller
//                                                         .isTitleInvalid.value
//                                                     ? "Required field"
//                                                     : null,
//                                                 onChanged: (value) {
//                                                   if (value.trim().length > 0) {
//                                                     controller.isTitleInvalid
//                                                         .value = false;
//                                                   } else {
//                                                     controller.isTitleInvalid
//                                                         .value = true;
//                                                   }
//                                                 },

//                                                 inputFormatters: [
//                                                   FilteringTextInputFormatter
//                                                       .deny(
//                                                     RegExp('[\'^]'),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                             Spacer(),
//                                           ],
//                                         ),
//                                   Dimens.boxHeight10,
//                                   Row(
//                                     children: [
//                                       Spacer(),
//                                       SizedBox(
//                                         width: 180,
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 70),
//                                           child: CustomRichText(
//                                               title: 'Frequency :'),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         child: DropdownWebStock(
//                                           width: (MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               .3),
//                                           controller: controller,
//                                           dropdownList:
//                                               controller.frequencyList,
//                                           isValueSelected: controller
//                                               .isSelectedfrequency.value,
//                                           selectedValue: controller
//                                               .selectedfrequency.value,
//                                           onValueChanged:
//                                               controller.onValueChanged,
//                                         ),
//                                       ),
//                                       Spacer(),
//                                     ],
//                                   ),
//                                   Dimens.boxHeight10,
//                                   controller.type.value == AppConstants.kAudit
//                                       ? Row(
//                                           children: [
//                                             Spacer(),
//                                             SizedBox(
//                                                 width: 180,
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 80),
//                                                   child: CustomRichText(
//                                                       title: 'Checklist :'),
//                                                 )),
//                                             SizedBox(
//                                               child: DropdownWebStock(
//                                                 width: (MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .3),
//                                                 controller: controller,
//                                                 dropdownList:
//                                                     controller.checkList,
//                                                 isValueSelected: controller
//                                                     .isSelectedchecklist.value,
//                                                 selectedValue: controller
//                                                     .selectedchecklist.value,
//                                                 onValueChanged:
//                                                     controller.onValueChanged,
//                                               ),
//                                             ),
//                                             Spacer(),
//                                           ],
//                                         )
//                                       : Dimens.box0,
//                                   controller.type.value == AppConstants.kMis
//                                       ? Dimens.boxHeight10
//                                       : Dimens.box0,
//                                   controller.type.value == AppConstants.kMis
//                                       ? Row(
//                                           children: [
//                                             Spacer(),
//                                             SizedBox(
//                                                 width: 180,
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 60),
//                                                   child: CustomRichText(
//                                                       title: 'SOP Number :'),
//                                                 )),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 border: Border.all(
//                                                   color: Color.fromARGB(
//                                                       255, 227, 224, 224),
//                                                   width: 1,
//                                                 ),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Color.fromARGB(
//                                                             255, 236, 234, 234)
//                                                         .withOpacity(0.5),
//                                                     spreadRadius: 2,
//                                                     blurRadius: 5,
//                                                     offset: Offset(0, 2),
//                                                   ),
//                                                 ],
//                                               ),
//                                               width: (MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .3),
//                                               child: LoginCustomTextfield(
//                                                 textController:
//                                                     controller.planTitleTc,
//                                               ),
//                                             ),
//                                             Spacer(),
//                                           ],
//                                         )
//                                       : Dimens.box0,
//                                   Dimens.boxHeight10,
//                                   Row(
//                                     children: [
//                                       Spacer(),
//                                       SizedBox(
//                                         width: 180,
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 40),
//                                           child: CustomRichText(
//                                               title: 'Schedule Date :'),
//                                         ),
//                                       ),
//                                       CustomTextFieldForStock(
//                                         width:
//                                             (MediaQuery.of(context).size.width *
//                                                 .3),
//                                         numberTextField: true,
//                                         onTap: () {
//                                           controller.openStartDatePicker =
//                                               !controller.openStartDatePicker;
//                                           controller
//                                               .update(['stock_Mangement']);
//                                         },
//                                         textController:
//                                             controller.startDateDateTc,
//                                         //validate
//                                         errorController: controller
//                                                 .isScheduleDateInvalid.value
//                                             ? "Required field"
//                                             : null,
//                                         onChanged: (value) {
//                                           if (value.trim().length > 0) {
//                                             controller.isScheduleDateInvalid
//                                                 .value = false;
//                                           } else {
//                                             controller.isScheduleDateInvalid
//                                                 .value = true;
//                                           }
//                                         },
//                                       ),
//                                       Spacer(),
//                                     ],
//                                   ),
//                                   Dimens.boxHeight10,
//                                   Row(
//                                     children: [
//                                       Spacer(),
//                                       SizedBox(
//                                           width: 180,
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsets.only(left: 67),
//                                             child: CustomRichText(
//                                                 title: 'Description :'),
//                                           )),
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           border: Border.all(
//                                             color: Color.fromARGB(
//                                                 255, 227, 224, 224),
//                                             width: 1,
//                                           ),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Color.fromARGB(
//                                                       255, 236, 234, 234)
//                                                   .withOpacity(0.5),
//                                               spreadRadius: 2,
//                                               blurRadius: 5,
//                                               offset: Offset(0, 2),
//                                             ),
//                                           ],
//                                         ),
//                                         width:
//                                             (MediaQuery.of(context).size.width *
//                                                 .3),
//                                         child: LoginCustomTextfield(
//                                           maxLine: 3,
//                                           textController:
//                                               controller.descriptionTc,
//                                           //validate
//                                           errorController: controller
//                                                   .isDescriptionInvalid.value
//                                               ? "Required field"
//                                               : null,
//                                           onChanged: (value) {
//                                             if (value.trim().length > 0) {
//                                               controller.isDescriptionInvalid
//                                                   .value = false;
//                                             } else {
//                                               controller.isDescriptionInvalid
//                                                   .value = true;
//                                             }
//                                           },
//                                         ),
//                                       ),
//                                       Spacer(),
//                                     ],
//                                   ),
//                                   controller.type.value == AppConstants.kAudit
//                                       ? Dimens.boxHeight10
//                                       : Dimens.box0,
//                                   controller.type.value == AppConstants.kAudit
//                                       ? Row(
//                                           // mainAxisAlignment:
//                                           //     MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Spacer(),
//                                             Spacer(),
//                                             SizedBox(
//                                                 width: 240,
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 0),
//                                                   child: CustomRichText(
//                                                       title: 'PTW Required? :'),
//                                                 )),
//                                             Dimens.boxWidth10,
//                                             Text("No"),
//                                             CustomSwitchTroggle(
//                                                 value:
//                                                     controller.isToggleOn.value,
//                                                 onChanged: (value) {
//                                                   controller.toggle();
//                                                 }),
//                                             Text("Yes"),
//                                             Spacer(),
//                                             Spacer(),
//                                             Spacer(),
//                                           ],
//                                         )
//                                       : Dimens.box0,
//                                   controller.type.value == AppConstants.kAudit
//                                       ? Dimens.boxHeight10
//                                       : Dimens.box0,
//                                   controller.type.value == AppConstants.kAudit
//                                       ? Row(
//                                           children: [
//                                             Spacer(),
//                                             SizedBox(
//                                               width: 180,
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 40),
//                                                 child: CustomRichText(
//                                                     title: 'Assigned To :'),
//                                               ),
//                                             ),
//                                             // Dimens.boxWidth10,
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 border: Border.all(
//                                                   color: Color.fromARGB(
//                                                       255, 227, 224, 224),
//                                                   width: 1,
//                                                 ),
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Color.fromARGB(
//                                                             255, 236, 234, 234)
//                                                         .withOpacity(0.5),
//                                                     spreadRadius: 2,
//                                                     blurRadius: 5,
//                                                     offset: Offset(0, 2),
//                                                   ),
//                                                 ],
//                                               ),
//                                               width: (MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .3),
//                                               child: DropdownWebWidget(
//                                                 controller: controller,
//                                                 dropdownList:
//                                                     controller.assignedToList,
//                                                 isValueSelected: controller
//                                                     .isAssignedToSelected.value,
//                                                 selectedValue: controller
//                                                     .selectedAssignedTo.value,
//                                                 onValueChanged:
//                                                     controller.onValueChanged,
//                                               ),
//                                             ),
//                                             Spacer()
//                                           ],
//                                         )
//                                       : Dimens.box0,
//                                   controller.type.value == AppConstants.kAudit
//                                       ? Dimens.boxHeight10
//                                       : Dimens.box0,
//                                   controller.type.value == AppConstants.kAudit
//                                       ? Container(
//                                           margin: Dimens.edgeInsets20,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.grey
//                                                     .withOpacity(.3)),
//                                           ),
//                                           constraints: BoxConstraints(
//                                             maxWidth: 1100,
//                                           ),
//                                           child: Column(
//                                             children: [
//                                               CustomAppBar(
//                                                 title:
//                                                     'Select Onother Employees'
//                                                         .tr,
//                                                 action: Row(
//                                                   children: [
//                                                     //   CustomRichText(
//                                                     //       title:
//                                                     //           "Add Employee"),
//                                                     //   Dimens
//                                                     //       .boxWidth10,
//                                                     ActionButton(
//                                                       color: ColorValues
//                                                           .appGreenColor,
//                                                       label: "Add New",
//                                                       icon: Icons.add,
//                                                       onPressed: () {
//                                                         Get.dialog<void>(
//                                                           AddEmployeeListAlertBox(),
//                                                         );
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Dimens.boxHeight10,
//                                               Wrap(
//                                                 children: [
//                                                   Column(
//                                                     children: [
//                                                       SizedBox(
//                                                         width: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .width *
//                                                             2,
//                                                         child: Container(
//                                                           constraints:
//                                                               BoxConstraints(
//                                                                   minHeight:
//                                                                       90),
//                                                           child:
//                                                               SingleChildScrollView(
//                                                             child: DataTable(
//                                                               columns: [
//                                                                 DataColumn(
//                                                                     label: Text(
//                                                                         "Employee Name")),
//                                                                 DataColumn(
//                                                                     label: Text(
//                                                                         "Contact No")),
//                                                                 DataColumn(
//                                                                     label: Text(
//                                                                         "Responsibility")),
//                                                                 DataColumn(
//                                                                     label: Text(
//                                                                         "Action")),
//                                                               ],
//                                                               rows: List<
//                                                                   DataRow>.generate(
//                                                                 controller
//                                                                     .filteredEmployeeNameList
//                                                                     .length,
//                                                                 (index) {
//                                                                   var employeeNameDetails =
//                                                                       controller
//                                                                               .filteredEmployeeNameList[
//                                                                           index];
//                                                                   return DataRow(
//                                                                       cells: [
//                                                                         DataCell(
//                                                                             Text('${employeeNameDetails?.name ?? ''}')),
//                                                                         DataCell(
//                                                                             Text('${employeeNameDetails?.mobileNumber ?? ''}')),
//                                                                         DataCell(
//                                                                             Text('${employeeNameDetails?.responsibility}')),
//                                                                         DataCell(
//                                                                           Wrap(
//                                                                             children: [
//                                                                               TableActionButton(
//                                                                                 color: Colors.red,
//                                                                                 icon: Icons.delete_outline,
//                                                                                 message: 'Remove',
//                                                                                 onPress: () {
//                                                                                   // Call the removeItem method of the controller
//                                                                                   _removeRow(index);
//                                                                                   print("index");
//                                                                                 },
//                                                                               )
//                                                                             ],
//                                                                           ),
//                                                                         )
//                                                                       ]);
//                                                                 },
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       : Dimens.box0,
//                            CheckListDataTable(),     Dimens.boxHeight15,
//                                   Row(
//                                     children: [
//                                       Spacer(),
//                                       CustomElevatedButton(
//                                         backgroundColor:
//                                             ColorValues.appRedColor,
//                                         text: 'cancel',
//                                         onPressed: () {
//                                           // controller.AddInventory();
//                                         },
//                                       ),
//                                       Dimens.boxWidth15,
//                                       controller.auditId > 0
//                                           ? CustomElevatedButton(
//                                               backgroundColor:
//                                                   ColorValues.updateColor,
//                                               text: 'Update',
//                                               onPressed: () {
//                                                 controller.updateAuditNumber();
//                                               },
//                                             )
//                                           : CustomElevatedButton(
//                                               backgroundColor:
//                                                   ColorValues.appGreenColor,
//                                               text: 'Submit',
//                                               onPressed: () {
//                                                 controller.createAuditNumber();
//                                               },
//                                             ),
//                                       Spacer(),
//                                       // Dimens.boxWidth15,
//                                       // CustomElevatedButton(
//                                       //   backgroundColor: Color(0xff77cae7),
//                                       //   text: 'Save as Draft',
//                                       //   onPressed: () {
//                                       //     // controller.submitPurchaseOrderData();
//                                       //   },
//                                       // ),
//                                     ],
//                                   ),
//                                   Dimens.boxHeight15,
//                                 ],
//                               ),
//                             ),
//                           ),
//                           if (controller.openStartDatePicker)
//                             Positioned(
//                               right: 400,
//                               top: 200,
//                               child: DatePickerWidget(
//                                 minDate: DateTime(DateTime.now().year),
//                                 maxDate: DateTime(DateTime.now().year, 13,
//                                     0), // last date of this year
//                                 controller: DateRangePickerController(),
//                                 selectionChanges: (p0) {
//                                   print('po valu ${p0.value.toString()}');
//                                   controller.startDateDateTc.text =
//                                       DateFormat('yyyy-MM-dd').format(p0.value);
//                                   controller.openStartDatePicker =
//                                       !controller.openStartDatePicker;
//                                   controller.isScheduleDateInvalid.value =
//                                       false;

//                                   controller.update(['stock_Mangement']);
//                                 },
//                                 onCancel: () {
//                                   controller.openStartDatePicker = false;
//                                   controller.update(['stock_Mangement']);
//                                 },
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Dimens.boxHeight40,
//                 ],
//               ),
//             );
//           });
//       //  ),
//     });
//   }
// }

// class CheckListDataTable extends StatelessWidget {
//   final CreateAuditController controller = Get.find();
//   CheckListDataTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         margin: Dimens.edgeInsets20,
//         height: ((controller.rowItem.value.length) * 90) + 170,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: ColorValues.lightGreyColorWithOpacity35,
//             width: 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: ColorValues.appBlueBackgroundColor,
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Selects Material ",
//                     style: Styles.blue700,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       controller.addRowItem();
//                     },
//                     child: Container(
//                       height: 25,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         color: ColorValues.addNewColor,
//                         border: Border.all(
//                           color: ColorValues.lightGreyColorWithOpacity35,
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                       ),
//                       child: Center(
//                         child: Text(
//                           " + Add ",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w100,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: DataTable2(
//                 // dataRowHeight: 90,
//                 columnSpacing: 10,
//                 border:
//                     TableBorder.all(color: Color.fromARGB(255, 206, 229, 234)),
//                 columns: [
//                   DataColumn2(
//                       // fixedWidth: 400,
//                       label: Text(
//                     "CheckList Name",
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   )),
//                   DataColumn2(
//                       fixedWidth: 200,
//                       label: Text(
//                         "Weightage",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       )),
//                   // DataColumn2(
//                   //     fixedWidth: 250,
//                   //     label: Text(
//                   //       "Image",
//                   //       style: TextStyle(
//                   //           fontSize: 15,
//                   //           fontWeight: FontWeight.bold),
//                   //     )),
//                   DataColumn2(
//                       fixedWidth: 200,
//                       label: Text(
//                         "PTW REQ?",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       )),
//                   DataColumn2(
//                       fixedWidth: 200,
//                       label: Text(
//                         "Remark",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       )),
//                   DataColumn2(
//                       fixedWidth: 100,
//                       label: Text(
//                         "Action",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       )),
//                 ],
//                 rows: List.generate(
//                   controller.rowItem.length,
//                   (rowIndex) {
//                     var row = controller.rowItem[rowIndex];
//                     return DataRow(
//                       // height: 50,
//                       cells: row.map((mapData) {
//                         return DataCell(
//                           (mapData['key'] == "Drop_down")
//                               ? Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: DropdownWebWidget(
//                                     width:
//                                         MediaQuery.of(context).size.width / 4,
//                                     dropdownList: controller.checkList
//                                         .where((p0) {
//                                           return !controller.rowItem
//                                               .map((p0) => p0[0]["value"])
//                                               .contains(p0!.name);
//                                         })
//                                         .toList()
//                                         .obs,
//                                     isValueSelected: controller.errorState[
//                                                 '$rowIndex-${mapData['key']}'] ==
//                                             true
//                                         ? false
//                                         : true,
//                                     selectedValue: mapData["value"],
//                                     onValueChanged: (list, selectedValue) {
//                                       controller.errorState.removeWhere(
//                                           (key, value) =>
//                                               key == '$rowIndex-Drop_down');
//                                       print({
//                                         "web",
//                                         controller
//                                             .dropdownMapperData[selectedValue]
//                                       });
//                                       mapData["value"] = selectedValue;
//                                       controller.dropdownMapperData[
//                                               selectedValue] =
//                                           list.firstWhere(
//                                               (element) =>
//                                                   element.name == selectedValue,
//                                               orElse: null);
//                                     },
//                                   ),
//                                 )
//                               : (mapData['key'] == "Weightage" ||
//                                       mapData['key'] == "Remark")
//                                   ? Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         width: (Get.width * .4),
//                                         decoration: BoxDecoration(
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Colors.black26,
//                                               offset: const Offset(5.0, 5.0),
//                                               blurRadius: 5.0,
//                                               spreadRadius: 1.0,
//                                             ),
//                                           ],
//                                           color: ColorValues.whiteColor,
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         child: StatefulBuilder(
//                                           builder: (BuildContext context,
//                                               StateSetter setState) {
//                                             // Create a TextEditingController
//                                             TextEditingController _controller =
//                                                 TextEditingController(
//                                                     text:
//                                                         mapData["value"] ?? '');

//                                             return Container(
//                                               decoration: BoxDecoration(
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Colors.black26,
//                                                     offset: const Offset(
//                                                       5.0,
//                                                       5.0,
//                                                     ),
//                                                     blurRadius: 5.0,
//                                                     spreadRadius: 1.0,
//                                                   ),
//                                                 ],
//                                                 color: ColorValues.whiteColor,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                                 border: controller.errorState[
//                                                             '$rowIndex-${mapData['key']}'] ==
//                                                         true
//                                                     ? Border.all(
//                                                         color: Colors.red,
//                                                         width: 2.0)
//                                                     : Border.all(
//                                                         color: ColorValues
//                                                             .appLightBlueColor,
//                                                         width: 1.0),
//                                               ),
//                                               child: LoginCustomTextfield(
//                                                 inputFormatters: <TextInputFormatter>[
//                                                   FilteringTextInputFormatter
//                                                       .digitsOnly
//                                                 ],
//                                                 maxLine: 1,
//                                                 textController: _controller,
//                                                 onChanged: (txt) {
//                                                   // Convert the entered text to an integer
//                                                   int requestedQty =
//                                                       int.tryParse(txt) ?? 0;
//                                                   // Get the available quantity for the current record
//                                                   int availableQty = controller
//                                                           .dropdownMapperData
//                                                           .value[row[0]
//                                                               ['value']]
//                                                           ?.available_qty ??
//                                                       0;

//                                                   // Validate if the requested quantity is less than or equal to the available quantity
//                                                   if (requestedQty >
//                                                       availableQty) {
//                                                     // Show an error message or perform any action as needed
//                                                     showDialog(
//                                                       context: context,
//                                                       builder: (BuildContext
//                                                           context) {
//                                                         return AlertDialog(
//                                                           title: Text(
//                                                               "Invalid Quantity!"),
//                                                           content: Text(
//                                                               "Please select appropriate quantity.\nAvailable qty is: ${availableQty}, you requested: ${requestedQty}."),
//                                                           actions: <Widget>[
//                                                             TextButton(
//                                                               onPressed: () {
//                                                                 Navigator.of(
//                                                                         context)
//                                                                     .pop();
//                                                                 setState(() {
//                                                                   _controller
//                                                                       .clear();
//                                                                 });
//                                                               },
//                                                               child: Text("OK"),
//                                                             ),
//                                                           ],
//                                                         );
//                                                       },
//                                                     );
//                                                     setState(() {
//                                                       mapData["value"] = "";
//                                                     });
//                                                   } else {
//                                                     // Update the value if it's valid
//                                                     // setState(() {
//                                                     mapData["value"] = txt;

//                                                     // });
//                                                   }
//                                                   if (controller.errorState[
//                                                           '$rowIndex-${mapData['key']}'] ==
//                                                       true) {
//                                                     controller.errorState.remove(
//                                                         '$rowIndex-${mapData['key']}');
//                                                   }
//                                                 },
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     )
//                                   : (mapData['key'] == "Action ")
//                                       ? Padding(
//                                           padding: EdgeInsets.only(top: 10),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               TableActionButton(
//                                                 color: ColorValues.appRedColor,
//                                                 icon: Icons.delete,
//                                                 label: '',
//                                                 message: '',
//                                                 onPress: () {
//                                                   controller.rowItem
//                                                       .remove(row);
//                                                 },
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       // : (mapData['key'] == "ptwreq")
//                                       //     ? _rowptwItem(
//                                       //         int.tryParse(
//                                       //             '${mapData['value']}'),
//                                       //         onCheck: (val) {
//                                       //         mapData['value'] =
//                                       //             val == true ? "1" : "0";
//                                       //         Future.delayed(Duration.zero, () {
//                                       //           setState(() {});
//                                       //         });
//                                       //       })
//                                       : Text(mapData['key'] ?? ''),
//                         );
//                       }).toList(),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CreateAuditWeb extends StatefulWidget {
  CreateAuditWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAuditWeb> createState() => _CreateAuditWebState();
}

class _CreateAuditWebState extends State<CreateAuditWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAuditController>(
      id: 'stock_Mangement',
      builder: (controller) {
        AddEmployeeListAlertBox() {
          return StatefulBuilder(
            builder: ((context, setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                insetPadding: Dimens.edgeInsets10_0_10_0,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Select Employee Name',
                  textAlign: TextAlign.center,
                  // style: TextStyle(color: Colors.green),
                ),
                content: Builder(
                  builder: (context) {
                    return Obx(
                      () => Container(
                        padding: Dimens.edgeInsets05_0_5_0,
                        height: 300,
                        width: 300,
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
                              width: 250,
                              height: 120,
                              child: CustomMultiSelectDialogField(
                                buttonText: 'Add Employee',
                                title: 'Select Employee',
                                initialValue:
                                    controller.selectedEmployeeNameIdList.value,
                                items: controller.employeeNameList
                                    .map(
                                      (employeeName) => MultiSelectItem(
                                        employeeName?.id,
                                        employeeName?.name ?? '',
                                      ),
                                    )
                                    .toList(),
                                onConfirm: (selectedOptionsList) => {
                                  controller.employeeNameSelected(
                                      selectedOptionsList),
                                  controller.selectedEmployeeNameIdList.value =
                                      selectedOptionsList.cast<int>().toList(),
                                  print(
                                      'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        }

        // checkBoxMethod(bool isChecked, Function(bool?) onChange) {
        //   return Checkbox(
        //     value: isChecked,
        //     // value: isInitialChecked,
        //     onChanged: onChange,
        //   );
        // }

        void _removeRow(int index) {
          controller.filteredEmployeeNameList.removeAt(index);
          controller.selectedEmployeeNameIdList.removeAt(index);
        }

        return Obx(() => SelectionArea(
              child: Scaffold(
                  body: Container(
                    color: Color.fromARGB(255, 234, 236, 238),
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      children: [
                        HeaderWidget(),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 236, 234, 234)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.home,
                                color: ColorValues.greyLightColor,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offNamed(Routes.home);
                                },
                                child: Text(
                                  "DASHBOARD",
                                  style: Styles.greyLight14,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: controller.type.value ==
                                        AppConstants.kMis
                                    ? Text(" / MIS", style: Styles.greyLight14)
                                    : controller.type.value ==
                                            AppConstants.kEvaluation
                                        ? Text(" / EVALUATION",
                                            style: Styles.greyLight14)
                                        : Text(" / AUDIT",
                                            style: Styles.greyLight14),
                              ),
                              controller.type.value == AppConstants.kMis
                                  ? Text(" / CREATE OBSERVATION PLAN",
                                      style: Styles.greyLight14)
                                  : controller.type.value ==
                                          AppConstants.kEvaluation
                                      ? Text(" / CREATE EVALUATION",
                                          style: Styles.greyLight14)
                                      : Text(" / CREATE AUDIT",
                                          style: Styles.greyLight14)
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Stack(
                              children: [
                                Container(
                                  color: Color.fromARGB(255, 245, 248, 250),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            controller.type.value ==
                                                    AppConstants.kMis
                                                ? Text(
                                                    " Create Observation Plan",
                                                    style: Styles.blackBold14,
                                                  )
                                                : controller.type.value ==
                                                        AppConstants.kEvaluation
                                                    ? Text(
                                                        " Create Evaluation Plan",
                                                        style:
                                                            Styles.blackBold14,
                                                      )
                                                    : Text(
                                                        " Create Audit",
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: ColorValues.greyLightColour,
                                      ),
                                      Container(
                                        margin: Dimens.edgeInsets20,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: controller.type
                                                                    .value ==
                                                                AppConstants
                                                                    .kMis
                                                            ? 'SOP Number: '
                                                            : 'Title: '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    LoginCustomTextfield(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .3),
                                                      textController: controller
                                                          .planTitleTc,

                                                      //validate
                                                      errorController: controller
                                                              .isTitleInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,
                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isTitleInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isTitleInvalid
                                                              .value = true;
                                                        }
                                                      },

                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .deny(
                                                          RegExp('[\'^]'),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight5,
                                                // SizedBox(height: 10),
                                                controller.type.value ==
                                                        AppConstants.kEvaluation
                                                    ? Row(
                                                        children: [
                                                          CustomRichText(
                                                              title:
                                                                  'Max Score: '),
                                                          // Dimens.boxWidth10,
                                                          SizedBox(width: 10),
                                                          LoginCustomTextfield(
                                                            width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .3),
                                                            textController:
                                                                controller
                                                                    .maxScoreTc,

                                                            //validate
                                                            errorController: controller
                                                                    .isTitleInvalid
                                                                    .value
                                                                ? "Required field"
                                                                : null,
                                                            onChanged: (value) {
                                                              if (value
                                                                      .trim()
                                                                      .length >
                                                                  0) {
                                                                controller
                                                                    .isTitleInvalid
                                                                    .value = false;
                                                              } else {
                                                                controller
                                                                    .isTitleInvalid
                                                                    .value = true;
                                                              }
                                                            },

                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .deny(
                                                                RegExp('[\'^]'),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : Dimens.box0,

                                                controller.type.value ==
                                                            AppConstants
                                                                .kAudit ||
                                                        controller.type.value ==
                                                            AppConstants.kMis
                                                    ? Obx(
                                                        () => Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Checklist: '),
                                                            // Dimens.boxWidth10,
                                                            SizedBox(width: 10),
                                                            DropdownWebStock(
                                                              width: (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .3),
                                                              controller:
                                                                  controller,
                                                              dropdownList:
                                                                  controller
                                                                      .checkList,
                                                              isValueSelected:
                                                                  controller
                                                                      .isSelectedchecklist
                                                                      .value,
                                                              selectedValue:
                                                                  controller
                                                                      .selectedchecklist
                                                                      .value,
                                                              onValueChanged:
                                                                  controller
                                                                      .onValueChanged,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Dimens.box0,

                                                // Dimens.boxHeight5,
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title:
                                                //             'Frieght:To Pay /Paid : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController: controller
                                                //           .frieghtToPayPaidCtrlr,
                                                //       focusnode:
                                                //           controller.freightfocus,
                                                //       scroll:
                                                //           controller.freightscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                Dimens.boxHeight5,
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Description:'),
                                                    Dimens.boxWidth2,
                                                    LoginCustomTextfield(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .3),
                                                      maxLine: 3,
                                                      textController: controller
                                                          .descriptionTc,
                                                      //validate
                                                      errorController: controller
                                                              .isDescriptionInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,
                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isDescriptionInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isDescriptionInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight5,
                                                controller.type.value ==
                                                        AppConstants.kAudit
                                                    ? Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          CustomRichText(
                                                              title:
                                                                  'PTW Required? : '),
                                                          Dimens.boxWidth10,
                                                          Text("No"),
                                                          CustomSwitchTroggle(
                                                              value: controller
                                                                  .isToggleOn
                                                                  .value,
                                                              onChanged:
                                                                  (value) {
                                                                controller
                                                                    .toggle();
                                                              }),
                                                          Text("Yes"),
                                                        ],
                                                      )
                                                    : Dimens.box0,
                                                // Dimens.boxHeight5,
                                                // SizedBox(height: 5),
                                                // Row(s
                                                //   children: [
                                                //     CustomRichText(
                                                //         title:
                                                //             'Gate Inward Register No. : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.girNoCtrlr,
                                                //       focusnode:
                                                //           controller.inregfocus,
                                                //       scroll:
                                                //           controller.inregscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // Dimens.boxHeight5,
                                                // SizedBox(height: 5),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Purchase Date :'),
                                                //     Dimens.boxWidth10,
                                                //     CustomTextFieldForStock(
                                                //       width: MediaQuery.of(context)
                                                //               .size
                                                //               .width /
                                                //           5,
                                                //       numberTextField: true,
                                                //       onTap: () {
                                                //         controller
                                                //                 .openPurchaseDatePicker =
                                                //             !controller
                                                //                 .openPurchaseDatePicker;
                                                //         controller.update(
                                                //             ['stock_Mangement']);
                                                //       },
                                                //       textController:
                                                //           controller.purchaseDateTc,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Challan Date : '),
                                                //     Dimens.boxWidth10,
                                                //     CustomTextFieldForStock(
                                                //       width: MediaQuery.of(context)
                                                //               .size
                                                //               .width /
                                                //           5,
                                                //       numberTextField: true,
                                                //       onTap: () {
                                                //         controller
                                                //                 .openChallanDatePicker =
                                                //             !controller
                                                //                 .openChallanDatePicker;
                                                //         controller.update(
                                                //             ['stock_Mangement']);
                                                //       },
                                                //       textController:
                                                //           controller.challanDateTc,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                Row(
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Frequency: '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    DropdownWebStock(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .3),
                                                      controller: controller,
                                                      dropdownList: controller
                                                          .frequencyList,
                                                      isValueSelected: controller
                                                          .isSelectedfrequency
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedfrequency
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ],
                                                ),

                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Received Date  : '),
                                                //     Dimens.boxWidth10,
                                                //     CustomTextFieldForStock(
                                                //       width: MediaQuery.of(context)
                                                //               .size
                                                //               .width /
                                                //           5,
                                                //       numberTextField: true,
                                                //       onTap: () {
                                                //         controller
                                                //                 .openReceivedPicker =
                                                //             !controller
                                                //                 .openReceivedPicker;
                                                //         controller.update(
                                                //             ['stock_Mangement']);
                                                //       },
                                                //       textController:
                                                //           controller.receivedDateTc,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'L.R No.  : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.lrNoCtrlr,
                                                //       focusnode: controller.lrfocus,
                                                //       scroll: controller.lrscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Vehicle  No. : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.vehicleNoCtrlr,
                                                //       focusnode:
                                                //           controller.vehfocus,
                                                //       scroll: controller.vehscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Row(
                                                //   children: [
                                                //     CustomRichText(
                                                //         title: 'Job Ref. : '),
                                                //     Dimens.boxWidth10,
                                                //     GoodsOrderTextField(
                                                //       keyboardType:
                                                //           TextInputType.number,
                                                //       inputFormatters: <TextInputFormatter>[
                                                //         FilteringTextInputFormatter
                                                //             .digitsOnly
                                                //       ],
                                                //       textController:
                                                //           controller.jobRefCtrlr,
                                                //       focusnode:
                                                //           controller.jobrfocus,
                                                //       scroll: controller.jobrscroll,
                                                //     ),
                                                //   ],
                                                // ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: [
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    CustomRichText(
                                                        title:
                                                            'Schedule Date: '),
                                                    // Dimens.boxWidth10,
                                                    SizedBox(width: 10),
                                                    CustomTextFieldForStock(
                                                      width: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          .3),
                                                      numberTextField: true,
                                                      onTap: () {
                                                        controller
                                                                .openStartDatePicker =
                                                            !controller
                                                                .openStartDatePicker;
                                                        controller.update([
                                                          'stock_Mangement'
                                                        ]);
                                                      },
                                                      textController: controller
                                                          .startDateDateTc,
                                                      //validate
                                                      errorController: controller
                                                              .isScheduleDateInvalid
                                                              .value
                                                          ? "Required field"
                                                          : null,
                                                      onChanged: (value) {
                                                        if (value
                                                                .trim()
                                                                .length >
                                                            0) {
                                                          controller
                                                              .isScheduleDateInvalid
                                                              .value = false;
                                                        } else {
                                                          controller
                                                              .isScheduleDateInvalid
                                                              .value = true;
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                controller.type.value ==
                                                        AppConstants.kMis
                                                    ? Dimens.box0
                                                    : Row(
                                                        children: [
                                                          // Dimens.boxWidth10,
                                                          SizedBox(width: 10),
                                                          CustomRichText(
                                                              title:
                                                                  'Assigned To: '),
                                                          // Dimens.boxWidth10,
                                                          SizedBox(width: 10),
                                                          DropdownWebWidget(
                                                            width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .3),
                                                            controller:
                                                                controller,
                                                            dropdownList: controller
                                                                .assignedToList,
                                                            isValueSelected:
                                                                controller
                                                                    .isAssignedToSelected
                                                                    .value,
                                                            selectedValue:
                                                                controller
                                                                    .selectedAssignedTo
                                                                    .value,
                                                            onValueChanged:
                                                                controller
                                                                    .onValueChanged,
                                                          ),
                                                        ],
                                                      ),
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      controller.type.value ==
                                              AppConstants.kAudit
                                          ? Container(
                                              margin: Dimens.edgeInsets20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withOpacity(.3)),
                                              ),
                                              constraints: BoxConstraints(
                                                maxWidth: 1100,
                                              ),
                                              child: Column(
                                                children: [
                                                  CustomAppBar(
                                                    title:
                                                        'Select Onother Employees'
                                                            .tr,
                                                    action: Row(
                                                      children: [
                                                        //   CustomRichText(
                                                        //       title:
                                                        //           "Add Employee"),
                                                        //   Dimens
                                                        //       .boxWidth10,
                                                        ActionButton(
                                                          color: ColorValues
                                                              .appGreenColor,
                                                          label: "Add New",
                                                          icon: Icons.add,
                                                          onPressed: () {
                                                            Get.dialog<void>(
                                                              AddEmployeeListAlertBox(),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                2,
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      minHeight:
                                                                          90),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    DataTable(
                                                                  columns: [
                                                                    DataColumn(
                                                                        label: Text(
                                                                            "Employee Name")),
                                                                    DataColumn(
                                                                        label: Text(
                                                                            "Contact No")),
                                                                    DataColumn(
                                                                        label: Text(
                                                                            "Responsibility")),
                                                                    DataColumn(
                                                                        label: Text(
                                                                            "Action")),
                                                                  ],
                                                                  rows: List<
                                                                      DataRow>.generate(
                                                                    controller
                                                                        .filteredEmployeeNameList
                                                                        .length,
                                                                    (index) {
                                                                      var employeeNameDetails =
                                                                          controller
                                                                              .filteredEmployeeNameList[index];
                                                                      return DataRow(
                                                                          cells: [
                                                                            DataCell(Text('${employeeNameDetails?.name ?? ''}')),
                                                                            DataCell(Text('${employeeNameDetails?.mobileNumber ?? ''}')),
                                                                            DataCell(Text('${employeeNameDetails?.responsibility}')),
                                                                            DataCell(
                                                                              Wrap(
                                                                                children: [
                                                                                  TableActionButton(
                                                                                    color: Colors.red,
                                                                                    icon: Icons.delete_outline,
                                                                                    message: 'Remove',
                                                                                    onPress: () {
                                                                                      // Call the removeItem method of the controller
                                                                                      _removeRow(index);
                                                                                      print("index");
                                                                                    },
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ]);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Dimens.box0,
                                      controller.type.value ==
                                                  AppConstants.kEvaluation &&
                                              controller.checkList.length > 0
                                          ? CheckListDataTable()
                                          : Dimens.box0
                                    ],
                                  ),
                                ),
                                if (controller.openStartDatePicker)
                                  Positioned(
                                    right: 65,
                                    top: 230,
                                    child: DatePickerWidget(
                                      // last date of this year
                                      controller: DateRangePickerController(),
                                      selectionChanges: (p0) {
                                        print('po valu ${p0.value.toString()}');
                                        controller.startDateDateTc.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(p0.value);
                                        controller.openStartDatePicker = false;

                                        controller.update(['stock_Mangement']);
                                      },
                                      onCancel: () {
                                        controller.openStartDatePicker = false;
                                        controller.update(['stock_Mangement']);
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: Obx(() => varUserAccessModel
                              .value.access_list!
                              .where((e) =>
                                  e.feature_id ==
                                      UserAccessConstants.kGoodsFeatureId &&
                                  e.add == UserAccessConstants.kHaveAddAccess)
                              .length >
                          0
                      ? Row(
                          children: [
                            Spacer(),
                            Container(
                              height: 40,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.cancelColor,
                                text: 'Cancel',
                                onPressed: () {
                                  Get.toNamed(
                                      Routes.stockManagementGoodsOrdersScreen);
                                },
                              ),
                            ),
                            // Dimens.boxWidth15,
                            SizedBox(width: 15),
                            controller.auditId > 0
                                ? Container(
                                    height: 40,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.updateColor,
                                      text: 'Update',
                                      onPressed: () {
                                        controller.updateAuditNumber();
                                      },
                                    ))
                                : Container(
                                    height: 40,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appGreenColor,
                                      text: 'Submit',
                                      onPressed: () {
                                        controller.createAuditNumber();
                                      },
                                    ),
                                  ),
                            Spacer()
                          ],
                        )
                      : Dimens.box0)),
            ));
      },
    );
  }
}

class CheckListDataTable extends StatelessWidget {
  final CreateAuditController controller = Get.find();
  CheckListDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _rowptwItem(int? defaultValue, {required Function(bool) onCheck}) {
      return CustomSwitchTroggle(
          value: defaultValue == 1 ? true : false,
          onChanged: (value) {
            print("object");
            controller.isToggleOn.value = value!;
            onCheck(value);

            //  controller.toggle();
          });
    }

    return StatefulBuilder(builder: ((context, setState) {
      return Obx(
        () => Container(
          margin: Dimens.edgeInsets20,
          height: ((controller.rowItem.value.length) * 70) + 120,
          decoration: BoxDecoration(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Evaluation Plan Checklists ",
                      style: Styles.blue700,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addRowItem();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DataTable2(
                  // dataRowHeight: 90,
                  columnSpacing: 10,
                  border: TableBorder.all(
                      color: Color.fromARGB(255, 206, 229, 234)),
                  columns: [
                    DataColumn2(
                        // fixedWidth: 400,
                        label: Text(
                      "CheckList Name",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    DataColumn2(
                        fixedWidth: 200,
                        label: Text(
                          "Weightage",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    // DataColumn2(
                    //     fixedWidth: 250,
                    //     label: Text(
                    //       "Image",
                    //       style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.bold),
                    //     )),
                    DataColumn2(
                        fixedWidth: 200,
                        label: Text(
                          "PTW REQ?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    DataColumn2(
                        fixedWidth: 200,
                        label: Text(
                          "Remark",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    DataColumn2(
                        fixedWidth: 100,
                        label: Text(
                          "Action",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                  ],
                  rows: List.generate(
                    controller.rowItem.length,
                    (rowIndex) {
                      var row = controller.rowItem[rowIndex];
                      return DataRow(
                        // height: 50,
                        cells: row.map((mapData) {
                          return DataCell((mapData['key'] == "Drop_down")
                              ? Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: DropdownWebWidget(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    dropdownList: controller.checkList
                                        .where((p0) {
                                          return !controller.rowItem
                                              .map((p0) => p0[0]["value"])
                                              .contains(p0!.name);
                                        })
                                        .toList()
                                        .obs,
                                    isValueSelected: controller.errorState[
                                                '$rowIndex-${mapData['key']}'] ==
                                            true
                                        ? false
                                        : true,
                                    selectedValue: mapData["value"],
                                    onValueChanged: (list, selectedValue) {
                                      controller.errorState.removeWhere(
                                          (key, value) =>
                                              key == '$rowIndex-Drop_down');
                                      print({
                                        "web",
                                        controller
                                            .dropdownMapperData[selectedValue]
                                      });
                                      mapData["value"] = selectedValue;
                                      controller.dropdownMapperData[
                                              selectedValue] =
                                          list.firstWhere(
                                              (element) =>
                                                  element.name == selectedValue,
                                              orElse: null);
                                    },
                                  ),
                                )
                              : (mapData['key'] == "Action ")
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TableActionButton(
                                            color: ColorValues.appRedColor,
                                            icon: Icons.delete,
                                            label: '',
                                            message: '',
                                            onPress: () {
                                              controller.rowItem.remove(row);
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  : (mapData['key'] == "ptwreq")
                                      ? _rowptwItem(
                                          int.tryParse('${mapData['value']}'),
                                          onCheck: (val) {
                                          mapData['value'] =
                                              val == true ? "1" : "0";
                                          Future.delayed(Duration.zero, () {
                                            setState(() {});
                                          });
                                        })
                                      : Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      offset: const Offset(
                                                          5.0, 5.0),
                                                      blurRadius: 5.0,
                                                      spreadRadius: 1.0,
                                                    ),
                                                  ],
                                                  color: ColorValues.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: controller.errorState[
                                                              '$rowIndex-${mapData['key']}'] ==
                                                          true
                                                      ? Border.all(
                                                          color: Colors.red,
                                                          width: 2.0)
                                                      : Border.all(
                                                          color: ColorValues
                                                              .appLightBlueColor,
                                                          width: 1.0),
                                                ),
                                                child: LoginCustomTextfield(
                                                  keyboardType:
                                                      (mapData['key'] ==
                                                              "Weightage")
                                                          ? TextInputType.number
                                                          : TextInputType.text,
                                                  inputFormatters: (mapData[
                                                              'key'] ==
                                                          "Weightage")
                                                      ? <TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ]
                                                      : null,
                                                  maxLine: 1,
                                                  textController:
                                                      TextEditingController(
                                                          text: mapData[
                                                                  "value"] ??
                                                              ''),
                                                  onChanged: (txt) {
                                                    mapData["value"] = txt;
                                                    if (controller.errorState[
                                                            '$rowIndex-${mapData['key']}'] ==
                                                        true) {
                                                      controller.errorState.remove(
                                                          '$rowIndex-${mapData['key']}');
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
