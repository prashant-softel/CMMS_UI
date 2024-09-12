import 'package:cmms/app/add_inventory/add_inventory_controller.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';

import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload3_details_widget.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_dropzone3.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WarrantyTabWidget extends StatefulWidget {
  WarrantyTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WarrantyTabWidget> createState() => _WarrantyTabWidgetState();
}

class _WarrantyTabWidgetState extends State<WarrantyTabWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddInventoryController>(
      id: 'warranty_tab',
      builder: (controller) {
        return Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
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
                              Row(
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
                                            MediaQuery.of(context).size.width /
                                                5,
                                        dropdownList:
                                            controller.warrantyNameList,
                                        isValueSelected: controller
                                            .isWarrentyNameSelected.value,
                                        selectedValue: controller
                                            .selectedWarrantyName.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                              Row(
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
                                            MediaQuery.of(context).size.width /
                                                5,
                                        dropdownList: controller
                                            .warrantyUsageTermNameList,
                                        isValueSelected: controller
                                            .iswarrantyUsageTermNameSelected
                                            .value,
                                        selectedValue: controller
                                            .selectedwarrantyUsageTermListName
                                            .value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CustomRichText(
                                      includeAsterisk: false,
                                      title: "Description"),
                                  SizedBox(width: 10),
                                  LoginCustomTextfield(
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
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
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CustomRichText(
                                      includeAsterisk: false,
                                      title: 'Start Date:'),
                                  SizedBox(width: 10),
                                  CustomTextFieldForStock(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
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
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Row(
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
                                            MediaQuery.of(context).size.width /
                                                5,
                                        dropdownList:
                                            controller.businessCategoryList,
                                        isValueSelected: controller
                                            .isSelectedBusinessType.value,
                                        selectedValue: controller
                                            .selectedBusinessType.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    CustomRichText(
                                        includeAsterisk: false,
                                        title: "Vender"),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DropdownWebStock(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          dropdownList:
                                              controller.venderNameList,
                                          isValueSelected: controller
                                              .isVenderNameSelected.value,
                                          selectedValue:
                                              controller.selectedVender.value,
                                          onValueChanged:
                                              controller.onValueChanged,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                              Row(
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
                                      // keyboardType: TextInputType.number,
                                      // inputFormatters: <TextInputFormatter>[
                                      //   FilteringTextInputFormatter.digitsOnly
                                      // ],
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
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                              // Container(
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text(
                              //         'Warranty Certificate',
                              //         style: Styles.blackBold16,
                              //       ),
                              //       SizedBox(width: 10),
                              //       ActionButton(
                              //         label: 'Upload certification file',
                              //         onPressed: () {},
                              //         icon: Icons.file_upload_outlined,
                              //         color: ColorValues.appLightBlueColor,
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CustomRichText(
                                      includeAsterisk: false,
                                      title: ' Expire Date:'),
                                  SizedBox(width: 10),
                                  CustomTextFieldForStock(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
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
                              // Dimens.boxHeight10,
                              SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: Wrap(children: [
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 400,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Center(
                                      child: Container(
                                        // margin: EdgeInsets.all(16),
                                        margin: EdgeInsets.only(top: 16),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.3)),
                                        ),
                                        constraints: BoxConstraints(
                                          maxWidth: 1100,
                                        ),
                                        child: Column(
                                          children: [
                                            CustomAppBar(
                                              title: ' Warranty Certificate'.tr,
                                            ),
                                            SizedBox(height: 10),
                                            Wrap(
                                              children: [
                                                Column(
                                                  children: [
                                                    // SizedBox(
                                                    //   width: MediaQuery.of(context)
                                                    //       .size
                                                    //       // .width ,
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child:
                                                                FileUploadWidgetWithDropzone3(),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                              flex: 8,
                                                              child:
                                                                  FileUpload3DetailsWidgetWeb()),
                                                        ],
                                                      ),
                                                    ),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              if (controller.openStartDatePicker)
                Positioned(
                  left: 200,
                  child: DatePickerWidget(
                    minDate: DateTime(
                        2000), // Allows selection of any past date starting from the year 1900
                    maxDate: DateTime(DateTime.now().year + 13, 0, 0),
                    // Restricts selection to the current date
                    controller: DateRangePickerController(),
                    selectionChanges: (p0) {
                      controller.startDateTc.text =
                          DateFormat('yyyy-MM-dd').format(p0.value);
                      controller.openStartDatePicker =
                          !controller.openStartDatePicker;
                      controller.update(['warranty_tab']);
                    },
                    onCancel: () {
                      controller.openStartDatePicker = false;
                      controller.update(['warranty_tab']);
                    },
                  ),
                ),
              if (controller.openExpiryDatePicker)
                Positioned(
                  top: 10,
                  left: 1000,
                  child: DatePickerWidget(
                    // minDate: DateTime(DateTime.now().year),
                    // maxDate: DateTime(DateTime.now().year, 13, 0),
                    controller: DateRangePickerController(),
                    selectionChanges: (p0) {
                      final startDate = controller.startDateTc.text;
                      final selectedDate =
                          DateFormat('yyyy-MM-dd').format(p0.value);

                      if (startDate.isNotEmpty &&
                          selectedDate.compareTo(startDate) < 0) {
                        // Invalid selection, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Expire Date cannot be before Start Date!',
                            ),
                          ),
                        );
                      } else {
                        controller.isStartDateInvalid.value = false;
                        controller.isExpireDateInvalid.value = false;
                        controller.expireDateTc.text = selectedDate;
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
            ],
          ),
        );
      },
    );
  }
}
