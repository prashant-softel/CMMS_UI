import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/schedule_course/schedule_course_controller.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class ScheduleWeb extends GetView<ScheduleController> {
  ScheduleWeb({Key? key}) : super(key: key);
  final FileUploadController dropzoneController =
      Get.put(FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
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
                        controller.clearStoreData();
                        Get.offNamed(Routes.scheduleCourseList);
                      },
                      child: Text(
                        " / SCHEDULE  LIST",
                        style: Styles.greyLight14,
                      ),
                    ),
                    Text(
                      " / SCHEDULE COURSE",
                      style: Styles.greyLight14,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width * 7,
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Card(
                      margin: Dimens.edgeInsets12,
                      color: ColorValues.cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Schedule Course",
                                  style: Styles.blackBold18,
                                ),
                                Spacer(),
                                // Text(
                                //   "Course Id: ",
                                //   style: Styles.blackBold16,
                                // ),
                                // Text(
                                //   // "${controller.trainingCourse.value.id ?? ""}",
                                //   // style: Styles.blue17,
                                // ),
                                // Dimens.boxWidth10,
                                // Text(
                                //   "Course Name: ",
                                //   style: Styles.blackBold16,
                                // ),
                                // Text(
                                //   // "${controller.trainingCourse.value.name ?? ""}",
                                //   // style: Styles.blue17,
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorValues.greyLightColour,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 30,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: "Training Agency: "),
                                            Dimens.boxWidth10,
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 244),
                                                      width: 1),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2),
                                                    )
                                                  ]),
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2),
                                              height: 30,
                                              child: Obx(
                                                () => DropdownWebWidget(
                                                  dropdownList:
                                                      controller.trainingAgency,
                                                  isValueSelected: controller
                                                      .isTrainingAgencySelected
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedTrainingAgencyName
                                                      .value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: 'Date Of Training: '),
                                            Dimens.boxWidth10,
                                            _buildDateTimeField_web(
                                              context,
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          children: [
                                            CustomRichText(title: "Venue: "),
                                            Dimens.boxWidth10,
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
                                                ],
                                                color: ColorValues.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: LoginCustomTextfield(
                                                width: (Get.width * .2),
                                                keyboardType:
                                                    TextInputType.text,
                                                maxLine: 1,
                                                textController:
                                                    controller.venue,
                                                focusNode:
                                                    controller.venueFocus,
                                                scrollController:
                                                    controller.venueScroll,
                                                errorController: controller
                                                        .isVenueInvalid.value
                                                    ? "Required field"
                                                    : null,
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isVenueInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isVenueInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                       Row(
                                          children: [
                                            CustomRichText(
                                                title: "Course Name: "),
                                            Dimens.boxWidth10,
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 244),
                                                      width: 1),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2),
                                                    )
                                                  ]),
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2),
                                              height: 30,
                                              child: Obx(
                                                () => DropdownWebWidget(
                                                  dropdownList:
                                                      controller.courseList,
                                                  isValueSelected: controller
                                                      .isTrainingCourseSelected
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedTrainingCourseName
                                                      .value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight30,
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: 'Trainer Name: '),
                                            Dimens.boxWidth10,
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
                                                ],
                                                color: ColorValues.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: LoginCustomTextfield(
                                                width: (Get.width * .2),
                                                keyboardType:
                                                    TextInputType.text,
                                                maxLine: 1,
                                                textController:
                                                    controller.trainerName,
                                                focusNode:
                                                    controller.trainerFocus,
                                                scrollController:
                                                    controller.trainerScroll,
                                                errorController: controller
                                                        .isTrainerInvalid.value
                                                    ? "Required field"
                                                    : null,
                                                onChanged: (value) {
                                                  if (value.trim().length > 1) {
                                                    controller.isTrainerInvalid
                                                        .value = false;
                                                  } else {
                                                    controller.isTrainerInvalid
                                                        .value = true;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: "Responsible HFE Employee: "),
                                            Dimens.boxWidth10,
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 227, 224, 244),
                                                    width: 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                            255, 236, 234, 234)
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                              ),
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2),
                                              height: 30,
                                              child: Obx(
                                                () => DropdownWebWidget(
                                                  dropdownList:
                                                      controller.employeeNameList,
                                                  isValueSelected: controller
                                                      .isEmployeeSelected.value,
                                                  selectedValue: controller
                                                      .selectedEmployeeName
                                                      .value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          children: [
                                            CustomRichText(title: "Mode: "),
                                            Dimens.boxWidth10,
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 227, 224, 244),
                                                      width: 1),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(255,
                                                              236, 234, 234)
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2),
                                                    )
                                                  ]),
                                              width: (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2),
                                              height: 30,
                                              child: Obx(
                                                () => DropdownWebWidget(
                                                  dropdownList: controller.mode,
                                                  isValueSelected: controller
                                                      .isModeSelected.value,
                                                  selectedValue: controller
                                                      .selectedModeName.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Dimens.boxHeight30,
                                      ],
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(.3),
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth: 1400,
                                    ),
                                    child: CustomAppBar(
                                      title: 'Employees'.tr,
                                      action: Row(
                                        children: [
                                          ActionButton(
                                            label: 'Add New',
                                            icon: Icons.add,
                                            onPressed: () {
                                              Get.dialog<void>(
                                                addEmployeeListAlertBox(),
                                              );
                                            },
                                            color: ColorValues.appGreenColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Center(
                                    child: Wrap(
                                      children: [
                                        Container(
                                          height: (controller
                                                      .filteredEmployeeNameList
                                                      .length *
                                                  50) +
                                              55,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          constraints: BoxConstraints(
                                            maxWidth: 1400,
                                            minHeight: 60,
                                          ),
                                          child: DataTable2(
                                            columnSpacing: 10,
                                            border: TableBorder.all(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                            ),
                                            columns: [
                                              DataColumn2(
                                                fixedWidth: 80,
                                                label: Text(
                                                  "Emp Id",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.M,
                                                label: Text(
                                                  "Employee Name",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.L,
                                                label: Text(
                                                  "Email ID",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text(
                                                  "Contact No",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text(
                                                  "Designation",
                                                ),
                                              ),
                                              DataColumn2(
                                                fixedWidth: 80,
                                                label: Text(
                                                  "Action",
                                                ),
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                              controller
                                                  .filteredEmployeeNameList
                                                  .length,
                                              (index) {
                                                var employeeNameDetails = controller
                                                        .filteredEmployeeNameList[
                                                    index];
                                                return DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        'EMP ${employeeNameDetails?.id ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employeeNameDetails?.name ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employeeNameDetails?.login_id ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employeeNameDetails?.mobileNumber ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employeeNameDetails?.designation ?? ''}',
                                                      ),
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
                                                              _removeRow(index);
                                                              print("index");
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Dimens.boxHeight15,
                                Center(
                                  child: Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(.3),
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth: 1400,
                                    ),
                                    child: CustomAppBar(
                                      title: 'External People'.tr,
                                      action: Row(
                                        children: [
                                          ActionButton(
                                            label: 'Add New',
                                            icon: Icons.add,
                                            onPressed: () {
                                              Get.dialog<void>(
                                                addExternalEmployeeList(),
                                              );
                                            },
                                            color: ColorValues.appGreenColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Center(
                                    child: Wrap(
                                      children: [
                                        Container(
                                          height: (controller.externalEmployees
                                                      .length *
                                                  50) +
                                              55,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          constraints: BoxConstraints(
                                            maxWidth: 1400,
                                            minHeight: 60,
                                          ),
                                          child: DataTable2(
                                            columnSpacing: 10,
                                            border: TableBorder.all(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                            ),
                                            columns: [
                                              DataColumn2(
                                                size: ColumnSize.M,
                                                label: Text(
                                                  "Name",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.L,
                                                label: Text(
                                                  "Email",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text(
                                                  "Contact No",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.L,
                                                label: Text(
                                                  "Company",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text(
                                                  "Designation",
                                                ),
                                              ),
                                              DataColumn2(
                                                fixedWidth: 80,
                                                label: Text(
                                                  "Action",
                                                ),
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                              controller
                                                  .externalEmployees.length,
                                              (index) {
                                                var employee = controller
                                                    .externalEmployees[index];
                                                return DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        '${employee.employeeName ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employee.employeeEmail ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employee.employeeNumber ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employee.companyName ?? ''}',
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        '${employee.designation ?? ''}',
                                                      ),
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
                                                              print("index");
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
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: Get.height * 0.2,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    constraints: BoxConstraints(maxWidth: 1400),
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: FileUploadWidgetWithDropzone(),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                          flex: 8,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child:
                                                FileUploadDetailsWidgetWeb2(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      CustomRichText(title: "Comments: "),
                                      Dimens.boxWidth10,
                                      _buildCommentFieldWeb(context),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight20
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            height: 35,
            child: CustomElevatedButton(
              backgroundColor: ColorValues.redColor,
              text: "Cancel",
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Dimens.boxWidth10,
          Container(
            height: 35,
            child: CustomElevatedButton(
              backgroundColor: ColorValues.addNewColor,
              text: 'Schedule',
              onPressed: () {
                controller.isFormInvalid.value = false;
                controller.scheduleCourse(fileIds: dropzoneController.fileIds);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildDateTimeField_web(
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          width: Get.width * 0.2,
          height: 30,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
                spreadRadius: 0.5,
              ),
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            child: TextField(
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              controller: controller.dateOfTraining,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: controller.isDateInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : InputBorder.none,
                errorBorder: controller.isDateInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText:
                    controller.isDateInvalid.value ? "Required field" : null,
              ),
              onTap: () {
                _pickDateTime(context, controller.dateOfTraining);
              },
              onChanged: (value) {
                if (controller.dateOfTraining.text.trim().isNotEmpty) {
                  controller.isDateInvalid.value = false;
                } else {
                  controller.isDateInvalid.value = true;
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDateTime(
    BuildContext context,
    TextEditingController txtcontroller,
  ) async {
    DateTime currentDate = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        },
      );

      if (time != null) {
        DateTime finalDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        txtcontroller.text =
            DateFormat('yyyy-MM-dd HH:mm').format(finalDateTime);
        if (txtcontroller.text.trim().isNotEmpty) {
          controller.isDateInvalid.value = false;
        } else {
          controller.isDateInvalid.value = true;
        }
      }
    }
  }

  Widget _buildCommentFieldWeb(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                  spreadRadius: 0.5,
                ),
              ],
              color: ColorValues.whiteColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              width: Get.width * 0.6,
              child: TextField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
                controller: controller.comment,
                focusNode: controller.commentFocus,
                scrollController: controller.commentScroll,
                keyboardType: TextInputType.multiline,
                autofocus: false,
                maxLines: 4,
                decoration: InputDecoration(
                  fillColor: ColorValues.whiteColor,
                  filled: true,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: controller.isCommentInvalid.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorValues.redColorDark,
                          ),
                        )
                      : InputBorder.none,
                  errorBorder: controller.isCommentInvalid.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorValues.redColorDark,
                          ),
                        )
                      : null,
                  errorText: controller.isCommentInvalid.value
                      ? "Required field"
                      : null,
                ),
                onChanged: (value) {
                  if (value.trim().length > 3) {
                    controller.isCommentInvalid.value = false;
                  } else {
                    controller.isCommentInvalid.value = true;
                  }
                },
              ),
            ),
          ),
          Dimens.boxHeight10,
        ],
      ),
    );
  }

  addEmployeeListAlertBox() {
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
                        height: 60,
                        child: CustomMultiSelectDialogField(
                          buttonText: 'Add Employee',
                          title: 'Select Employee',
                          initialValue: controller.selectedEmployeeIdList,
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
                              selectedOptionsList,
                            ),
                            controller.selectedEmployeeIdList.value =
                                selectedOptionsList.cast<int>().toList(),
                            print(
                              'Employee Name list50: ${controller.selectedEmployeeIdList}',
                            )
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

  void _removeRow(int index) {
    controller.filteredEmployeeNameList.removeAt(index);
    controller.selectedEmployeeIdList.removeAt(index);
  }

  addExternalEmployeeList() {
    return StatefulBuilder(
      builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Enter Employee Data',
            style: Styles.black16,
            textAlign: TextAlign.left,
          ),
          content: Builder(
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(15),
                width: 430,
                height: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    Dimens.boxHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichText(title: "Name: "),
                        Dimens.boxWidth10,
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
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LoginCustomTextfield(
                            width: (Get.width * .18),
                            keyboardType: TextInputType.text,
                            maxLine: 1,
                            textController: controller.employeeName,
                            focusNode: controller.employeeNameFocus,
                            scrollController: controller.employeeNameScroll,
                            errorController:
                                controller.isEmployeeNameInvalid.value
                                    ? "Required field"
                                    : null,
                            onChanged: (value) {
                              if (value.trim().length > 1) {
                                controller.isEmployeeNameInvalid.value = false;
                              } else {
                                controller.isEmployeeNameInvalid.value = true;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichText(title: "Email: "),
                        Dimens.boxWidth10,
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
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LoginCustomTextfield(
                            width: (Get.width * .18),
                            keyboardType: TextInputType.text,
                            maxLine: 1,
                            textController: controller.employeeEmail,
                            focusNode: controller.employeeEmailFocus,
                            scrollController: controller.employeeEmailScroll,
                            errorController:
                                controller.isEmployeeEmailInvalid.value
                                    ? "Required field"
                                    : null,
                            onChanged: (value) {
                              if (value.trim().length > 1) {
                                controller.isEmployeeEmailInvalid.value = false;
                              } else {
                                controller.isEmployeeEmailInvalid.value = true;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichText(title: "Mobile: "),
                        Dimens.boxWidth10,
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
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LoginCustomTextfield(
                            width: (Get.width * .18),
                            keyboardType: TextInputType.number,
                            maxLine: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textController: controller.employeeNumber,
                            focusNode: controller.employeeNumberFocus,
                            scrollController: controller.employeeNumberScroll,
                            errorController:
                                controller.isEmployeeNumberInvalid.value
                                    ? "Required field"
                                    : null,
                            onChanged: (value) {
                              if (value.trim().length > 1) {
                                controller.isEmployeeNumberInvalid.value =
                                    false;
                              } else {
                                controller.isEmployeeNumberInvalid.value = true;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichText(title: "Company: "),
                        Dimens.boxWidth10,
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
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LoginCustomTextfield(
                            width: (Get.width * .18),
                            keyboardType: TextInputType.text,
                            maxLine: 1,
                            textController: controller.company,
                            focusNode: controller.companyFocus,
                            scrollController: controller.companyScroll,
                            errorController: controller.isCompanyInvalid.value
                                ? "Required field"
                                : null,
                            onChanged: (value) {
                              if (value.trim().length > 1) {
                                controller.isCompanyInvalid.value = false;
                              } else {
                                controller.isCompanyInvalid.value = true;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRichText(title: "Designation: "),
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
                            ],
                            color: ColorValues.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LoginCustomTextfield(
                            width: (Get.width * .18),
                            keyboardType: TextInputType.text,
                            maxLine: 1,
                            textController: controller.employeeDesignation,
                            focusNode: controller.employeeDesignationFocus,
                            scrollController:
                                controller.employeeDesignationScroll,
                            errorController:
                                controller.isEmployeeDesignationInvalid.value
                                    ? "Required field"
                                    : null,
                            onChanged: (value) {
                              if (value.trim().length > 1) {
                                controller.isEmployeeDesignationInvalid.value =
                                    false;
                              } else {
                                controller.isEmployeeDesignationInvalid.value =
                                    true;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      text: "cancel",
                      backgroundColor: ColorValues.deleteColor,
                      onPressed: () {
                        controller.clear();
                        Get.back();
                      },
                    ),
                  ),
                  Dimens.boxWidth10,
                  Container(
                    height: 35,
                    child: CustomElevatedButton(
                      backgroundColor: ColorValues.addNewColor,
                      text: "Add",
                      onPressed: () {
                        controller.isExternalEmployeeInvalid.value = false;
                        controller.addExternalEmployee();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
