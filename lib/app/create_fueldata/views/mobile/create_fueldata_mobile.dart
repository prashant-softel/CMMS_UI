// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/constant/constant.dart';
// import 'package:cmms/app/controllers/file_upload_controller.dart';
// import 'package:cmms/app/create_observation/create_observation_controller.dart';
// import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
// import 'package:cmms/app/navigators/app_pages.dart';
// import 'package:cmms/app/widgets/custom_elevated_button.dart';
// import 'package:cmms/app/widgets/custom_richtext.dart';
// import 'package:cmms/app/widgets/custom_textFieldMobile.dart';
// import 'package:cmms/app/widgets/date_picker.dart';
// import 'package:cmms/app/widgets/dropdown_web.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class CreateObservationMobile extends StatefulWidget {
//   CreateObservationMobile({
//     Key? key,
//   }) : super(key: key);
//   final FileUploadController dropzoneController =
//       Get.put(FileUploadController());

//   @override
//   State<CreateObservationMobile> createState() =>
//       _CreateObservationMobileState();
// }

// class _CreateObservationMobileState extends State<CreateObservationMobile> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CreateObservationController>(
//       id: 'stock_Mangement',
//       builder: (controller) {
//         return SelectionArea(
//           child: Scaffold(
//             body: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Dimens.boxHeight5,
//                   HeaderWidgetMobile(),
//                   Container(
//                     margin: EdgeInsets.only(left: 30, top: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Create Observation",
//                           style: Styles.blackBold18,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     color: Colors.lightBlue.shade50,
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 18, vertical: 15),
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomRichTextMobile(
//                               title: "Contractor Name: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               keyboardType: TextInputType.number,
//                               textController: controller.contractorNameCtrlr,
//                               // errorController: controller.isContractorInvalid.value
//                               //     ? "Required field"
//                               //     : null,
//                               onChanged: (value) {
//                                 if (value.trim().length > 0) {
//                                   controller.isContractorInvalid.value = false;
//                                 } else {
//                                   controller.isContractorInvalid.value = true;
//                                 }
//                               },
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Risk Type: ",
//                             ),
//                             Dimens.boxHeight2,
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               child: Obx(
//                                 () => DropdownWebWidget(
//                                   dropdownList: controller.incidentrisktypeList,
//                                   isValueSelected:
//                                       controller.isRiskTypeListSelected.value,
//                                   selectedValue:
//                                       controller.selectedRiskTypeList.value,
//                                   onValueChanged: controller.onValueChanged,
//                                 ),
//                               ),
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Corrective/Preventive Action: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               keyboardType: TextInputType.number,
//                               textController:
//                                   controller.correctivePreventiveCtrlr,
//                               // errorController: controller.isCorrectiveInvalid.value
//                               //     ? "Required field"
//                               //     : null,
//                               onChanged: (value) {
//                                 if (value.trim().length > 0) {
//                                   controller.isCorrectiveInvalid.value = false;
//                                 } else {
//                                   controller.isCorrectiveInvalid.value = true;
//                                 }
//                               },
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Responsible Person: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               keyboardType: TextInputType.number,
//                               textController: controller.responsiblePersonCtrlr,
//                               // errorController: controller.isCorrectiveInvalid.value
//                               //     ? "Required field"
//                               //     : null,
//                               onChanged: (value) {
//                                 if (value.trim().length > 0) {
//                                   controller.isResponsibleInvalid.value = false;
//                                 } else {
//                                   controller.isResponsibleInvalid.value = true;
//                                 }
//                               },
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Contact Number: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               keyboardType: TextInputType.number,
//                               textController: controller.contactNumberCtrlr,
//                               // errorController: controller.isCorrectiveInvalid.value
//                               //     ? "Required field"
//                               //     : null,
//                               onChanged: (value) {
//                                 if (value.trim().length > 0) {
//                                   controller.isContactNumberInvalid.value =
//                                       false;
//                                 } else {
//                                   controller.isContactNumberInvalid.value =
//                                       true;
//                                 }
//                               },
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Cost Type: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               keyboardType: TextInputType.number,
//                               textController: controller.costTypeCtrlr,
//                               // errorController: controller.isCorrectiveInvalid.value
//                               //     ? "Required field"
//                               //     : null,
//                               onChanged: (value) {
//                                 if (value.trim().length > 0) {
//                                   controller.isCostInvalid.value = false;
//                                 } else {
//                                   controller.isCostInvalid.value = true;
//                                 }
//                               },
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Date of Observation: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               numberTextField: true,
//                               textController: controller.obsDateTc,
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return AlertDialog(
//                                       contentPadding: EdgeInsets.zero,
//                                       backgroundColor: Color(0xffFFFFFF),
//                                       content: DatePickerWidget(
//                                         minDate: DateTime(DateTime.now().year),
//                                         maxDate: DateTime(
//                                             DateTime.now().year, 13, 0),
//                                         controller: DateRangePickerController(),
//                                         selectionChanges: (p0) {
//                                           print(
//                                               'po value ${p0.value.toString()}');
//                                           controller.obsDateTc.text =
//                                               DateFormat('yyyy-MM-dd')
//                                                   .format(p0.value);
//                                           controller.openObsDatePicker =
//                                               !controller.openObsDatePicker;
//                                           controller.isObsDateTcInvalid.value =
//                                               false;
//                                           controller
//                                               .update(['stock_Mangement']);
//                                         },
//                                         onCancel: () {
//                                           controller.openObsDatePicker = false;
//                                           controller
//                                               .update(['stock_Mangement']);
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                               hintText: '',
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Type of Observation: ",
//                             ),
//                             Dimens.boxHeight2,
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               child: Obx(
//                                 () => DropdownWebWidget(
//                                   dropdownList: controller.typeOfObsList,
//                                   isValueSelected:
//                                       controller.isSelectedTypeOfObs.value,
//                                   selectedValue:
//                                       controller.selectedTypeOfObs.value,
//                                   onValueChanged: controller.onValueChanged,
//                                 ),
//                               ),
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Location of Observation: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               keyboardType: TextInputType.number,
//                               textController:
//                                   controller.locationOfObservationCtrlr,
//                               // errorController: controller.isCorrectiveInvalid.value
//                               //     ? "Required field"
//                               //     : null,
//                               onChanged: (value) {
//                                 if (value.trim().length > 0) {
//                                   controller.islocationofObservationInvalid
//                                       .value = false;
//                                 } else {
//                                   controller.islocationofObservationInvalid
//                                       .value = true;
//                                 }
//                               },
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Source of Observation: ",
//                             ),
//                             Dimens.boxHeight2,
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               child: Obx(
//                                 () => DropdownWebWidget(
//                                   dropdownList: controller.sourceOfObsList,
//                                   isValueSelected:
//                                       controller.isSelectedSourceOfObs.value,
//                                   selectedValue:
//                                       controller.selectedSourceOfObs.value,
//                                   onValueChanged: controller.onValueChanged,
//                                 ),
//                               ),
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Target Date: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               numberTextField: true,
//                               textController: controller.targetDateTc,
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return AlertDialog(
//                                       contentPadding: EdgeInsets.zero,
//                                       backgroundColor: Color(0xffFFFFFF),
//                                       content: DatePickerWidget(
//                                         minDate: DateTime(DateTime.now().year),
//                                         maxDate: DateTime(
//                                             DateTime.now().year, 13, 0),
//                                         controller: DateRangePickerController(),
//                                         selectionChanges: (p0) {
//                                           print(
//                                               'po value ${p0.value.toString()}');
//                                           controller.targetDateTc.text =
//                                               DateFormat('yyyy-MM-dd')
//                                                   .format(p0.value);

//                                           controller.openTargetDatePicker =
//                                               false;
//                                           controller.isTargetDateInvalid.value =
//                                               false;
//                                           controller
//                                               .update(['stock_Mangement']);
//                                         },
//                                         onCancel: () {
//                                           controller.openTargetDatePicker =
//                                               false;
//                                           controller
//                                               .update(['stock_Mangement']);
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                               hintText: '',
//                             ),
//                             Dimens.boxHeight15,
//                             CustomRichTextMobile(
//                               title: "Observation Description: ",
//                             ),
//                             Dimens.boxHeight2,
//                             CustomTextfieldMobile(
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               textController: controller.discriptionCtrlr,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             floatingActionButton: Obx(() =>
//                     // varUserAccessModel
//                     //             .value.access_list!
//                     //             .where((e) =>
//                     //                 e.feature_id ==
//                     //                     UserAccessConstants.kGoodsFeatureId &&
//                     //                 e.add == UserAccessConstants.kHaveAddAccess)
//                     //             .length >
//                     //         0
//                     //     ?
//                     Row(
//                       children: [
//                         Spacer(),
//                         Container(
//                           height: 40,
//                           child: CustomElevatedButton(
//                             backgroundColor: ColorValues.cancelColor,
//                             text: 'Cancel',
//                             onPressed: () {
//                               Get.toNamed(Routes.complianceScreen);
//                             },
//                           ),
//                         ),
//                         Dimens.boxWidth15,
//                         controller.obsId == 0
//                             ? Container(
//                                 height: 40,
//                                 child: CustomElevatedButton(
//                                   backgroundColor: ColorValues.submitColor,
//                                   text: 'Submit',
//                                   onPressed: () {
//                                     controller.isFormInvalid.value = false;
//                                     controller.createObs(position: 1);
//                                   },
//                                 ),
//                               )
//                             : Container(
//                                 height: 40,
//                                 child: CustomElevatedButton(
//                                   backgroundColor: ColorValues.submitColor,
//                                   text: 'Update',
//                                   onPressed: () {
//                                     controller.isFormInvalid.value = false;
//                                     controller.createObs(position: 0);
//                                   },
//                                 ),
//                               ),
//                         Spacer(),
//                       ],
//                     )
//                 // : Dimens.box0
//                 ),
//           ),
//         );
//       },
//     );
//   }
// }
