import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_audit/create_audit_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_swich_toggle.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateAuditWeb extends GetView<CreateAuditController> {
  CreateAuditWeb({
    Key? key,
  }) : super(key: key);
  final CreateAuditController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAuditController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorValues.whiteColor,
          body: Obx(() {
            return Column(
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
                        color:
                            Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                        child: controller.type.value == AppConstants.kMis
                            ? Text(" / MIS", style: Styles.greyLight14)
                            : Text(" / AUDIT", style: Styles.greyLight14),
                      ),
                      controller.type.value == AppConstants.kMis
                          ? Text(" / CREATE OBSERVATION PLAN",
                              style: Styles.greyLight14)
                          : Text(" / CREATE AUDIT", style: Styles.greyLight14)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height,
                          child: Card(
                            margin: EdgeInsets.all(20),
                            color: ColorValues.whiteColor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10, left: 10),
                                        child: controller.type.value ==
                                                AppConstants.kMis
                                            ? Text(
                                                " Create Observation Plan",
                                                style: Styles.blackBold14,
                                              )
                                            : Text(
                                                " Create Audit",
                                                style: Styles.blackBold14,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Dimens.boxHeight15,
                                controller.type.value == AppConstants.kMis
                                    ? Dimens.box0
                                    : Row(
                                        children: [
                                          Spacer(),
                                          SizedBox(
                                              width: 180,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 120),
                                                child: CustomRichText(
                                                    title: 'Title :'),
                                              )),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 227, 224, 224),
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          255, 236, 234, 234)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3),
                                            child: LoginCustomTextfield(
                                              textController:
                                                  controller.planTitleTc,

                                              //validate
                                              errorController: controller
                                                      .isTitleInvalid.value
                                                  ? "Required field"
                                                  : null,
                                              onChanged: (value) {
                                                if (value.trim().length > 0) {
                                                  controller.isTitleInvalid
                                                      .value = false;
                                                } else {
                                                  controller.isTitleInvalid
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
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                Dimens.boxHeight10,
                                Row(
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                      width: 180,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 70),
                                        child: CustomRichText(
                                            title: 'Frequency :'),
                                      ),
                                    ),
                                    SizedBox(
                                      child: DropdownWebStock(
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .3),
                                        controller: controller,
                                        dropdownList: controller.frequencyList,
                                        isValueSelected: controller
                                            .isSelectedfrequency.value,
                                        selectedValue:
                                            controller.selectedfrequency.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                        width: 180,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 80),
                                          child: CustomRichText(
                                              title: 'Checklist :'),
                                        )),
                                    SizedBox(
                                      child: DropdownWebStock(
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .3),
                                        controller: controller,
                                        dropdownList: controller.checkList,
                                        isValueSelected: controller
                                            .isSelectedchecklist.value,
                                        selectedValue:
                                            controller.selectedchecklist.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                controller.type.value == AppConstants.kMis
                                    ? Dimens.boxHeight10
                                    : Dimens.box0,
                                controller.type.value == AppConstants.kMis
                                    ? Row(
                                        children: [
                                          Spacer(),
                                          SizedBox(
                                              width: 180,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60),
                                                child: CustomRichText(
                                                    title: 'SOP Number :'),
                                              )),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 227, 224, 224),
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          255, 236, 234, 234)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3),
                                            child: LoginCustomTextfield(
                                              textController:
                                                  controller.planTitleTc,
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      )
                                    : Dimens.box0,
                                Dimens.boxHeight10,
                                Row(
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                      width: 180,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: CustomRichText(
                                            title: 'Schedule Date :'),
                                      ),
                                    ),
                                    CustomTextFieldForStock(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .3),
                                      numberTextField: true,
                                      onTap: () {
                                        controller.openStartDatePicker =
                                            !controller.openStartDatePicker;
                                        controller.update(['stock_Mangement']);
                                      },
                                      textController:
                                          controller.startDateDateTc,
                                      //validate
                                      errorController:
                                          controller.isScheduleDateInvalid.value
                                              ? "Required field"
                                              : null,
                                      onChanged: (value) {
                                        if (value.trim().length > 0) {
                                          controller.isScheduleDateInvalid
                                              .value = false;
                                        } else {
                                          controller.isScheduleDateInvalid
                                              .value = true;
                                        }
                                      },
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                Dimens.boxHeight10,
                                Row(
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                        width: 180,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 67),
                                          child: CustomRichText(
                                              title: 'Description :'),
                                        )),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 236, 234, 234)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .3),
                                      child: LoginCustomTextfield(
                                        maxLine: 3,
                                        textController:
                                            controller.descriptionTc,
                                        //validate
                                        errorController: controller
                                                .isDescriptionInvalid.value
                                            ? "Required field"
                                            : null,
                                        onChanged: (value) {
                                          if (value.trim().length > 0) {
                                            controller.isDescriptionInvalid
                                                .value = false;
                                          } else {
                                            controller.isDescriptionInvalid
                                                .value = true;
                                          }
                                        },
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                controller.type.value == AppConstants.kAudit
                                    ? Dimens.boxHeight10
                                    : Dimens.box0,
                                controller.type.value == AppConstants.kAudit
                                    ? Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Spacer(),
                                          Spacer(),
                                          SizedBox(
                                              width: 240,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0),
                                                child: CustomRichText(
                                                    title: 'PTW Required? :'),
                                              )),
                                          Dimens.boxWidth10,
                                          Text("No"),
                                          CustomSwitchTroggle(
                                              value:
                                                  controller.isToggleOn.value,
                                              onChanged: (value) {
                                                controller.toggle();
                                              }),
                                          Text("Yes"),
                                          Spacer(),
                                          Spacer(),
                                          Spacer(),
                                        ],
                                      )
                                    : Dimens.box0,
                                controller.type.value == AppConstants.kAudit
                                    ? Dimens.boxHeight10
                                    : Dimens.box0,
                                controller.type.value == AppConstants.kAudit
                                    ? Row(
                                        children: [
                                          Spacer(),
                                          SizedBox(
                                            width: 180,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40),
                                              child: CustomRichText(
                                                  title: 'Assigned To :'),
                                            ),
                                          ),
                                          // Dimens.boxWidth10,
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 227, 224, 224),
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                          255, 236, 234, 234)
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3),
                                            child: DropdownWebWidget(
                                              controller: controller,
                                              dropdownList:
                                                  controller.assignedToList,
                                              isValueSelected: controller
                                                  .isAssignedToSelected.value,
                                              selectedValue: controller
                                                  .selectedAssignedTo.value,
                                              onValueChanged:
                                                  controller.onValueChanged,
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      )
                                    : Dimens.box0,
                                controller.type.value == AppConstants.kAudit
                                    ? Dimens.boxHeight10
                                    : Dimens.box0,
                                controller.type.value == AppConstants.kAudit
                                    ? Container(
                                        margin: Dimens.edgeInsets20,
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
                                              title:
                                                  'Select Onother Employees'.tr,
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              2,
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                minHeight: 90),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: DataTable(
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
                                                                            .filteredEmployeeNameList[
                                                                        index];
                                                                return DataRow(
                                                                    cells: [
                                                                      DataCell(Text(
                                                                          '${employeeNameDetails?.name ?? ''}')),
                                                                      DataCell(Text(
                                                                          '${employeeNameDetails?.mobileNumber ?? ''}')),
                                                                      DataCell(Text(
                                                                          '${employeeNameDetails?.responsibility}')),
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
                                Dimens.boxHeight15,
                                Row(
                                  children: [
                                    Spacer(),
                                    CustomElevatedButton(
                                      backgroundColor: ColorValues.appRedColor,
                                      text: 'cancel',
                                      onPressed: () {
                                        // controller.AddInventory();
                                      },
                                    ),
                                    Dimens.boxWidth15,
                                    controller.auditId > 0
                                        ? CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.updateColor,
                                            text: 'Update',
                                            onPressed: () {
                                              controller.updateAuditNumber();
                                            },
                                          )
                                        : CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appGreenColor,
                                            text: 'Submit',
                                            onPressed: () {
                                              controller.createAuditNumber();
                                            },
                                          ),
                                    Spacer(),
                                    // Dimens.boxWidth15,
                                    // CustomElevatedButton(
                                    //   backgroundColor: Color(0xff77cae7),
                                    //   text: 'Save as Draft',
                                    //   onPressed: () {
                                    //     // controller.submitPurchaseOrderData();
                                    //   },
                                    // ),
                                  ],
                                ),
                                Dimens.boxHeight15,
                              ],
                            ),
                          ),
                        ),
                        if (controller.openStartDatePicker)
                          Positioned(
                            right: 400,
                            top: 200,
                            child: DatePickerWidget(
                              minDate: DateTime(DateTime.now().year),
                              maxDate: DateTime(DateTime.now().year, 13,
                                  0), // last date of this year
                              controller: DateRangePickerController(),
                              selectionChanges: (p0) {
                                print('po valu ${p0.value.toString()}');
                                controller.startDateDateTc.text =
                                    DateFormat('yyyy-MM-dd').format(p0.value);
                                controller.openStartDatePicker =
                                    !controller.openStartDatePicker;
                                controller.isScheduleDateInvalid.value = false;

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
                // Dimens.boxHeight40,
              ],
            );
          }),
          //  ),
        );
      },
    );
  }

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
                            controller
                                .employeeNameSelected(selectedOptionsList),
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

  checkBoxMethod(bool isChecked, Function(bool?) onChange) {
    return Checkbox(
      value: isChecked,
      // value: isInitialChecked,
      onChanged: onChange,
    );
  }

  void _removeRow(int index) {
    controller.filteredEmployeeNameList.removeAt(index);
    controller.selectedEmployeeNameIdList.removeAt(index);
  }
}
