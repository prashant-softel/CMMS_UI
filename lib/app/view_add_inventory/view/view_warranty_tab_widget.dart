import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';

import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewWarrantyTabWidget extends StatefulWidget {
  ViewWarrantyTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewWarrantyTabWidget> createState() => _WarrantyTabWidgetState();
}

class _WarrantyTabWidgetState extends State<ViewWarrantyTabWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAddInventoryController>(
      id: 'warranty_tab',
      builder: (controller) {
        return Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Dimens.boxHeight5,
                  Text(
                    'Warranty',
                    style: Styles.blackBold18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false,
                                    title: "Warranty Type"),
                                SizedBox(width: 10),
                                SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DropdownWebStock(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      dropdownList: controller.warrantyNameList,
                                      isValueSelected: controller
                                          .isWarrentyNameSelected.value,
                                      selectedValue:
                                          controller.selectedWarrantyName.value,
                                      onValueChanged: controller.onValueChanged,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false,
                                    title: "Warranty Usages Term Type"),
                                SizedBox(width: 10),
                                SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DropdownWebStock(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      dropdownList:
                                          controller.warrantyUsageTermNameList,
                                      isValueSelected: controller
                                          .iswarrantyUsageTermNameSelected
                                          .value,
                                      selectedValue: controller
                                          .selectedwarrantyUsageTermListName
                                          .value,
                                      onValueChanged: controller.onValueChanged,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false,
                                    title: "Description"),
                                SizedBox(width: 10),
                                LoginCustomTextfield(
                                  width:
                                      (MediaQuery.of(context).size.width * .2),
                                  textController:
                                      controller.warrentyDescriptionCtrlr,
                                  // errorController:
                                  //     controller.isDescriptionInvalid.value
                                  //         ? "Required field"
                                  //         : null,
                                  // onChanged: (value) {
                                  //   if (value.trim().length > 1) {
                                  //     controller.isDescriptionInvalid.value =
                                  //         false;
                                  //   } else {
                                  //     controller.isDescriptionInvalid.value =
                                  //         true;
                                  //   }
                                  // }
                                  // focusnode: controller.wdescFocus,
                                  // scroll: controller.wdescScroll,
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false,
                                    title: 'Start Date:'),
                                SizedBox(width: 10),
                                CustomTextFieldForStock(
                                  width: MediaQuery.of(context).size.width / 5,
                                  numberTextField: true,
                                  onTap: () {
                                    controller.openStartDatePicker =
                                        !controller.openStartDatePicker;
                                    controller.update(['warranty_tab']);
                                  },
                                  textController: controller.startDateTc,
                                  // errorController:
                                  //     controller.isStartDateInvalid.value
                                  //         ? "Required field"
                                  //         : null,
                                  // onChanged: (value) {
                                  //   if (value.trim().length > 1) {
                                  //     controller.isStartDateInvalid.value =
                                  //         false;
                                  //   } else {
                                  //     controller.isStartDateInvalid.value =
                                  //         true;
                                  //   }
                                  // }
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false,
                                    title: "Warranty Provider"),
                                SizedBox(width: 10),
                                SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DropdownWebStock(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      dropdownList:
                                          controller.businessCategoryList,
                                      isValueSelected: controller
                                          .isSelectedBusinessType.value,
                                      selectedValue:
                                          controller.selectedBusinessType.value,
                                      onValueChanged: controller.onValueChanged,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false, title: "Vender"),
                                SizedBox(width: 10),
                                SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DropdownWebStock(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      dropdownList: controller.venderNameList,
                                      isValueSelected:
                                          controller.isVenderNameSelected.value,
                                      selectedValue:
                                          controller.selectedVender.value,
                                      onValueChanged: controller.onValueChanged,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Dimens.boxHeight10,

                          Dimens.boxHeight10,
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false,
                                    title: "Certificate Number"),
                                SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Color(0xFE50000),
                                    width: 0.5,
                                  )),
                                  height: MediaQuery.of(context).size.height *
                                      0.040,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 5,
                                    minWidth: 100,
                                  ),
                                  child: LoginCustomTextfield(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textController:
                                        controller.certificateNoCtrlr,
                                    // errorController: controller
                                    //         .isCertificateNumberInvalid.value
                                    //     ? "Required field"
                                    //     : null,
                                    // onChanged: (value) {
                                    //   if (value.trim().length > 1) {
                                    //     controller.isCertificateNumberInvalid
                                    //         .value = false;
                                    //   } else {
                                    //     controller.isCertificateNumberInvalid
                                    //         .value = true;
                                    //   }
                                    // }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                          // Container(
                          //   child: IgnorePointer(
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Text(
                          //           'Warranty Certificate',
                          //           style: Styles.blackBold16,
                          //         ),
                          //         SizedBox(width: 10),
                          //         ActionButton(
                          //           label: 'Upload certification file',
                          //           onPressed: () {},
                          //           icon: Icons.file_upload_outlined,
                          //           color: ColorValues.appLightBlueColor,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Dimens.boxHeight10,
                          IgnorePointer(
                            child: Row(
                              children: [
                                CustomRichText(
                                    includeAsterisk: false,
                                    title: ' Expire Date:'),
                                SizedBox(width: 10),
                                CustomTextFieldForStock(
                                  width: MediaQuery.of(context).size.width / 5,
                                  numberTextField: true,
                                  onTap: () {
                                    controller.openExpiryDatePicker =
                                        !controller.openExpiryDatePicker;
                                    controller.update(['warranty_tab']);
                                  },
                                  textController: controller.expireDateTc,
                                  // errorController:
                                  //     controller.isExpireDateInvalid.value
                                  //         ? "Required field"
                                  //         : null,
                                  // onChanged: (value) {
                                  //   if (value.trim().length > 1) {
                                  //     controller.isExpireDateInvalid.value =
                                  //         false;
                                  //   } else {
                                  //     controller.isExpireDateInvalid.value =
                                  //         true;
                                  //   }
                                  // }
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Wrap(children: [
                      Stack(
                        children: [
                          if (controller.openStartDatePicker)
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                ),
                                DatePickerWidget(
                                  minDate: DateTime(DateTime.now().year),
                                  maxDate: DateTime(DateTime.now().year, 13,
                                      0), // last date of this year
                                  controller: DateRangePickerController(),
                                  selectionChanges: (p0) {
                                    controller.startDateTc.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(p0.value);

                                    controller.openStartDatePicker = false;
                                    controller.update(['warranty_tab']);
                                  },
                                  onCancel: () {
                                    controller.openStartDatePicker = false;
                                    controller.update(['warranty_tab']);
                                  },
                                ),
                              ],
                            ),
                          if (controller.openExpiryDatePicker)
                            Row(
                              children: [
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: DatePickerWidget(
                                    minDate: DateTime(DateTime.now().year),
                                    maxDate:
                                        DateTime(DateTime.now().year, 13, 0),
                                    controller: DateRangePickerController(),
                                    selectionChanges: (p0) {
                                      final startDate =
                                          controller.startDateTc.text;
                                      final selectedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(p0.value);

                                      if (startDate.isNotEmpty &&
                                          selectedDate.compareTo(startDate) <
                                              0) {
                                        // Invalid selection, show an error message
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Expire Date cannot be before Start Date!',
                                            ),
                                          ),
                                        );
                                      } else {
                                        // controller.isStartDateInvalid.value =
                                        //     false;
                                        // controller.isExpireDateInvalid.value =
                                        //     false;
                                        controller.expireDateTc.text =
                                            selectedDate;
                                        controller.openExpiryDatePicker =
                                            !controller.openExpiryDatePicker;
                                        controller.update(['warranty_tab']);
                                      }
                                    },
                                    onCancel: () {
                                      controller.openExpiryDatePicker = false;
                                      controller.update(['warranty_tab']);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ]),
                  ),
                  controller.editAddInventoryDetailsModel.value!
                                  .warranty_file !=
                              null &&
                          controller.editAddInventoryDetailsModel.value!
                              .warranty_file!.isNotEmpty
                      ? Container(
                          // width:
                          //     MediaQuery.of(context).size.width /
                          //         1.2,
                          height: ((controller.editAddInventoryDetailsModel
                                      .value!.warranty_file!.length) *
                                  41) +
                              117,
                          margin: Dimens.edgeInsets20,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3)),
                          ),

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Warranty Certificates ",
                                      style: Styles.blue700,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: DataTable2(
                                  border: TableBorder.all(
                                    color: Color.fromARGB(255, 206, 229, 234),
                                  ),
                                  dataRowHeight: 40,
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        "File Description",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "View File",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    controller.editAddInventoryDetailsModel
                                            .value!.warranty_file?.length ??
                                        0,
                                    (index) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          controller
                                                  .editAddInventoryDetailsModel
                                                  .value!
                                                  .warranty_file![index]
                                                  .description
                                                  .toString() ??
                                              '',
                                        )),
                                        DataCell(
                                          // Text("View Image"),
                                          Wrap(
                                            children: [
                                              TableActionButton(
                                                color: ColorValues
                                                    .appDarkBlueColor,
                                                icon: Icons.visibility,
                                                message: 'view',
                                                onPress: () async {
                                                  String baseUrl =
                                                      'http://172.20.43.9:83/';
                                                  String fileName = controller
                                                          .editAddInventoryDetailsModel
                                                          .value!
                                                          .warranty_file![index]
                                                          ?.fileName ??
                                                      "";
                                                  String fullUrl =
                                                      baseUrl + fileName;
                                                  if (await canLaunch(
                                                      fullUrl)) {
                                                    await launch(fullUrl);
                                                  } else {
                                                    throw 'Could not launch $fullUrl';
                                                  }
                                                  // String baseUrl = 'http://172.20.43.9:83/';
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Dimens.box0,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';

// import 'package:cmms/app/widgets/custom_richtext.dart';
// import 'package:cmms/app/widgets/custom_textfield.dart';
// import 'package:cmms/app/widgets/date_picker.dart';
// import 'package:cmms/app/widgets/dropdown_web.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class ViewWarrantyTabWidget extends StatelessWidget {
//   const ViewWarrantyTabWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ViewAddInventoryController>(
//       id: 'warranty_tab',
//       builder: (controller) {
//         return Obx(
//           () => SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: IgnorePointer(
//                 ignoring: true,
//                 child: Column(
//                   children: [
//                     Dimens.boxHeight10,
//                     Text(
//                       'Warranty',
//                       style: Styles.blackBold18,
//                     ),
//                     Dimens.boxHeight10,
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Row(
//                               children: [
//                                 CustomRichText(title: "Warranty Type"),
//                                 SizedBox(
//                                   child: DropdownWebWidget(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black26,
//                                         offset: const Offset(
//                                           5.0,
//                                           5.0,
//                                         ),
//                                         blurRadius: 5.0,
//                                         spreadRadius: 1.0,
//                                       ),
//                                       BoxShadow(
//                                         color: ColorValues.whiteColor,
//                                         offset: const Offset(0.0, 0.0),
//                                         blurRadius: 0.0,
//                                         spreadRadius: 0.0,
//                                       ),
//                                     ],
//                                     margin: Dimens.edgeInsets5,
//                                     width:
//                                         MediaQuery.of(context).size.width / 5,
//                                     dropdownList: controller.warrantyNameList,
//                                     isValueSelected:
//                                         controller.isWarrentyNameSelected.value,
//                                     selectedValue:
//                                         controller.selectedWarrantyName.value,
//                                     onValueChanged: controller.onValueChanged,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 CustomRichText(
//                                     title: "Warranty Usages Term Type"),
//                                 SizedBox(
//                                   child: DropdownWebWidget(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black26,
//                                         offset: const Offset(
//                                           5.0,
//                                           5.0,
//                                         ),
//                                         blurRadius: 5.0,
//                                         spreadRadius: 1.0,
//                                       ),
//                                       BoxShadow(
//                                         color: ColorValues.whiteColor,
//                                         offset: const Offset(0.0, 0.0),
//                                         blurRadius: 0.0,
//                                         spreadRadius: 0.0,
//                                       ),
//                                     ],
//                                     margin: Dimens.edgeInsets5,
//                                     width:
//                                         MediaQuery.of(context).size.width / 5,
//                                     dropdownList:
//                                         controller.warrantyUsageTermNameList,
//                                     isValueSelected: controller
//                                         .iswarrantyUsageTermNameSelected.value,
//                                     selectedValue: controller
//                                         .selectedwarrantyUsageTermListName
//                                         .value,
//                                     onValueChanged: controller.onValueChanged,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 CustomRichText(title: "Description"),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                     color: Color(0xFE50000),
//                                     width: 0.5,
//                                   )),
//                                   height: 45,
//                                   margin: Dimens.edgeInsets5,
//                                   constraints: BoxConstraints(
//                                     maxWidth:
//                                         MediaQuery.of(context).size.width / 5,
//                                     minWidth: 100,
//                                   ),
//                                   child: LoginCustomTextfield(
//                                       textController:
//                                           controller.warrentyDescriptionCtrlr),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 CustomRichText(title: "Warranty Provider"),
//                                 SizedBox(
//                                   child: DropdownWebWidget(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black26,
//                                         offset: const Offset(
//                                           5.0,
//                                           5.0,
//                                         ),
//                                         blurRadius: 5.0,
//                                         spreadRadius: 1.0,
//                                       ),
//                                       BoxShadow(
//                                         color: ColorValues.whiteColor,
//                                         offset: const Offset(0.0, 0.0),
//                                         blurRadius: 0.0,
//                                         spreadRadius: 0.0,
//                                       ),
//                                     ],
//                                     margin: Dimens.edgeInsets5,
//                                     width:
//                                         MediaQuery.of(context).size.width / 5,
//                                     dropdownList:
//                                         controller.manufacturerModelNameList,
//                                     isValueSelected: controller
//                                         .iswarrantymanufacturerSelected.value,
//                                     selectedValue: controller
//                                         .selectedmanufacturerName.value,
//                                     onValueChanged: controller.onValueChanged,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 CustomRichText(title: "Certificate Number"),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                     color: Color(0xFE50000),
//                                     width: 0.5,
//                                   )),
//                                   height: 45,
//                                   margin: Dimens.edgeInsets5,
//                                   constraints: BoxConstraints(
//                                     maxWidth:
//                                         MediaQuery.of(context).size.width / 5,
//                                     minWidth: 100,
//                                   ),
//                                   child: LoginCustomTextfield(
//                                       keyboardType: TextInputType.number,
//                                       inputFormatters: <TextInputFormatter>[
//                                         FilteringTextInputFormatter.digitsOnly
//                                       ],
//                                       textController:
//                                           controller.certificateNoCtrlr),
//                                 ),
//                                 Dimens.boxHeight10,
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: Wrap(children: [
//                         Stack(
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   width: double.infinity,
//                                   child: Wrap(
//                                     children: [
//                                       CustomTextField(
//                                         // numberTextField: false,
//                                         // readOnly: true,
//                                         onTap: () {
//                                           controller.openStartDatePicker =
//                                               !controller.openStartDatePicker;
//                                           controller.update(['warranty_tab']);
//                                         },
//                                         label: 'Start Date: *',
//                                         textController: controller.startDateTc,
//                                       ),
//                                       CustomTextField(
//                                         // numberTextField: false,
//                                         // readOnly: true,
//                                         onTap: () {
//                                           controller.openExpiryDatePicker =
//                                               !controller.openExpiryDatePicker;
//                                           controller.update(['warranty_tab']);
//                                         },
//                                         label: 'Expire Date: *',
//                                         textController: controller.expireDateTc,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             if (controller.openStartDatePicker)
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 120,
//                                   ),
//                                   DatePickerWidget(
//                                     minDate: DateTime(DateTime.now().year),
//                                     maxDate: DateTime(DateTime.now().year, 13,
//                                         0), // last date of this year
//                                     controller: DateRangePickerController(),
//                                     selectionChanges: (p0) {
//                                       controller.startDateTc.text =
//                                           DateFormat('yyyy-MM-dd')
//                                               .format(p0.value);
//                                       controller.openStartDatePicker =
//                                           !controller.openStartDatePicker;
//                                       controller.update(['warranty_tab']);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             if (controller.openExpiryDatePicker)
//                               Row(
//                                 children: [
//                                   Spacer(),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 15.0),
//                                     child: DatePickerWidget(
//                                       minDate: DateTime(DateTime.now().year),
//                                       maxDate:
//                                           DateTime(DateTime.now().year, 13, 0),
//                                       controller: DateRangePickerController(),
//                                       selectionChanges: (p0) {
//                                         final startDate =
//                                             controller.startDateTc.text;
//                                         final selectedDate =
//                                             DateFormat('yyyy-MM-dd')
//                                                 .format(p0.value);

//                                         if (startDate.isNotEmpty &&
//                                             selectedDate.compareTo(startDate) <
//                                                 0) {
//                                           // Invalid selection, show an error message
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                             SnackBar(
//                                               content: Text(
//                                                 'Expire Date cannot be before Start Date!',
//                                               ),
//                                             ),
//                                           );
//                                         } else {
//                                           controller.expireDateTc.text =
//                                               selectedDate;
//                                           controller.openExpiryDatePicker =
//                                               !controller.openExpiryDatePicker;
//                                           controller.update(['warranty_tab']);
//                                         }
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 50,
//                                   ),
//                                 ],
//                               ),
//                           ],
//                         ),
//                       ]),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
