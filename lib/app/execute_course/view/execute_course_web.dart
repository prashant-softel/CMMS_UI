import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/execute_course/execute_course_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExecuteCourseWeb extends GetView<ExecuteCourseController> {
  ExecuteCourseWeb({Key? key}) : super(key: key);
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                      Get.offNamed(Routes.scheduleCourseList);
                    },
                    child: Text(
                      " / Schedule Course".toUpperCase(),
                      style: Styles.greyLight14,
                    ),
                  ),
                  Text(
                    " / Execute Course".toUpperCase(),
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
                                "Execute Course",
                                style: Styles.blackBold18,
                              ),
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
                              Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TitleAndInfo(
                                            "Training Course:",
                                            "Java SpringBoot",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Training Agency:",
                                            "Softel Technologies Inc",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Venu:",
                                            "Microsoft Teams",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TitleAndInfo(
                                            "Date of Training:",
                                            "2024-05-11 10:00",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Trainer:",
                                            "Leonard Pope",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "HFE Employee:",
                                            "Derek Norton",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Mode:",
                                            "Online",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Dimens.boxHeight20,
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.end,
                              //       children: [
                              //         Row(
                              //           children: [
                              //             CustomRichText(
                              //                 title: "Training Course: "),
                              //             Dimens.boxWidth10,
                              //             Container(
                              //               width: (MediaQuery.of(context)
                              //                       .size
                              //                       .width *
                              //                   .2),
                              //               height: 30,
                              //               decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(10),
                              //                 border: Border.all(
                              //                   color: Color.fromARGB(
                              //                       255, 227, 224, 244),
                              //                   width: 1,
                              //                 ),
                              //                 boxShadow: [
                              //                   BoxShadow(
                              //                     color: Color.fromARGB(
                              //                             255, 236, 234, 234)
                              //                         .withOpacity(0.5),
                              //                     spreadRadius: 2,
                              //                     blurRadius: 5,
                              //                     offset: Offset(0, 2),
                              //                   )
                              //                 ],
                              //               ),
                              //               child: Obx(
                              //                 () => DropdownWebWidget(
                              //                   dropdownList: controller
                              //                       .trainingCourseList,
                              //                   isValueSelected: controller
                              //                       .isTrainingCourseSelected
                              //                       .value,
                              //                   selectedValue: controller
                              //                       .selectedCourseName.value,
                              //                   onValueChanged:
                              //                       controller.onValueChanged,
                              //                 ),
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //         Dimens.boxHeight10,
                              //         Row(
                              //           children: [
                              //             CustomRichText(
                              //                 title: "Training Agency: "),
                              //             Dimens.boxWidth10,
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   borderRadius:
                              //                       BorderRadius.circular(10),
                              //                   border: Border.all(
                              //                       color: Color.fromARGB(
                              //                           255, 227, 224, 244),
                              //                       width: 1),
                              //                   boxShadow: [
                              //                     BoxShadow(
                              //                       color: Color.fromARGB(
                              //                               255, 236, 234, 234)
                              //                           .withOpacity(0.5),
                              //                       spreadRadius: 2,
                              //                       blurRadius: 5,
                              //                       offset: Offset(0, 2),
                              //                     )
                              //                   ]),
                              //               width: (MediaQuery.of(context)
                              //                       .size
                              //                       .width *
                              //                   .2),
                              //               height: 30,
                              //               child: Obx(
                              //                 () => DropdownWebWidget(
                              //                   dropdownList:
                              //                       controller.trainingAgency,
                              //                   isValueSelected: controller
                              //                       .isTrainingAgencySelected
                              //                       .value,
                              //                   selectedValue: controller
                              //                       .selectedTrainingAgencyName
                              //                       .value,
                              //                   onValueChanged:
                              //                       controller.onValueChanged,
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         Dimens.boxHeight10,
                              //         Row(
                              //           children: [
                              //             CustomRichText(title: "Venue: "),
                              //             Dimens.boxWidth10,
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                 boxShadow: [
                              //                   BoxShadow(
                              //                     color: Colors.black26,
                              //                     offset: const Offset(
                              //                       5.0,
                              //                       5.0,
                              //                     ),
                              //                     blurRadius: 5.0,
                              //                     spreadRadius: 1.0,
                              //                   ),
                              //                 ],
                              //                 color: ColorValues.whiteColor,
                              //                 borderRadius:
                              //                     BorderRadius.circular(5),
                              //               ),
                              //               child: LoginCustomTextfield(
                              //                 width: (Get.width * .2),
                              //                 keyboardType: TextInputType.text,
                              //                 maxLine: 1,
                              //                 textController: controller.venue,
                              //                 focusNode: controller.venueFocus,
                              //                 scrollController:
                              //                     controller.venueScroll,
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         Dimens.boxHeight30,
                              //       ],
                              //     ),
                              //     Spacer(),
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.end,
                              //       children: [
                              //         Row(
                              //           children: [
                              //             CustomRichText(
                              //                 title: 'Date Of Training: '),
                              //             Dimens.boxWidth10,
                              //             _buildDateTimeField_web(
                              //               context,
                              //               controller.dateOfTraining,
                              //             ),
                              //           ],
                              //         ),
                              //         Dimens.boxHeight10,
                              //         Row(
                              //           children: [
                              //             CustomRichText(
                              //                 title: 'Trainer Name: '),
                              //             Dimens.boxWidth10,
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                 boxShadow: [
                              //                   BoxShadow(
                              //                     color: Colors.black26,
                              //                     offset: const Offset(
                              //                       5.0,
                              //                       5.0,
                              //                     ),
                              //                     blurRadius: 5.0,
                              //                     spreadRadius: 1.0,
                              //                   ),
                              //                 ],
                              //                 color: ColorValues.whiteColor,
                              //                 borderRadius:
                              //                     BorderRadius.circular(5),
                              //               ),
                              //               child: LoginCustomTextfield(
                              //                 width: (Get.width * .2),
                              //                 keyboardType: TextInputType.text,
                              //                 maxLine: 1,
                              //                 textController:
                              //                     controller.trainerName,
                              //                 focusNode:
                              //                     controller.trainerFocus,
                              //                 scrollController:
                              //                     controller.trainerScroll,
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         Dimens.boxHeight10,
                              //         Row(
                              //           children: [
                              //             CustomRichText(
                              //                 title: "HFE Employee: "),
                              //             Dimens.boxWidth10,
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   borderRadius:
                              //                       BorderRadius.circular(10),
                              //                   border: Border.all(
                              //                       color: Color.fromARGB(
                              //                           255, 227, 224, 244),
                              //                       width: 1),
                              //                   boxShadow: [
                              //                     BoxShadow(
                              //                       color: Color.fromARGB(
                              //                               255, 236, 234, 234)
                              //                           .withOpacity(0.5),
                              //                       spreadRadius: 2,
                              //                       blurRadius: 5,
                              //                       offset: Offset(0, 2),
                              //                     )
                              //                   ]),
                              //               width: (MediaQuery.of(context)
                              //                       .size
                              //                       .width *
                              //                   .2),
                              //               height: 30,
                              //               child: Obx(
                              //                 () => DropdownWebWidget(
                              //                   dropdownList:
                              //                       controller.employees,
                              //                   isValueSelected: controller
                              //                       .isEmployeeSelected.value,
                              //                   selectedValue: controller
                              //                       .selectedEmployeeName.value,
                              //                   onValueChanged:
                              //                       controller.onValueChanged,
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         Dimens.boxHeight10,
                              //         Row(
                              //           children: [
                              //             CustomRichText(title: "Mode: "),
                              //             Dimens.boxWidth10,
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   borderRadius:
                              //                       BorderRadius.circular(10),
                              //                   border: Border.all(
                              //                       color: Color.fromARGB(
                              //                           255, 227, 224, 244),
                              //                       width: 1),
                              //                   boxShadow: [
                              //                     BoxShadow(
                              //                       color: Color.fromARGB(
                              //                               255, 236, 234, 234)
                              //                           .withOpacity(0.5),
                              //                       spreadRadius: 2,
                              //                       blurRadius: 5,
                              //                       offset: Offset(0, 2),
                              //                     )
                              //                   ]),
                              //               width: (MediaQuery.of(context)
                              //                       .size
                              //                       .width *
                              //                   .2),
                              //               height: 30,
                              //               child: Obx(
                              //                 () => DropdownWebWidget(
                              //                   dropdownList: controller.mode,
                              //                   isValueSelected: controller
                              //                       .isModeSelected.value,
                              //                   selectedValue: controller
                              //                       .selectedModeName.value,
                              //                   onValueChanged:
                              //                       controller.onValueChanged,
                              //                 ),
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //         Dimens.boxHeight30,
                              //       ],
                              //     ),
                              //   ],
                              // ),

                              Center(
                                child: Container(
                                  height:
                                      // ((controller.filteredEmployeeNameList
                                      //             .length) *
                                      //         50) +
                                      60,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(.3)),
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth: 1400,
                                  ),
                                  child: CustomAppBar(
                                    title: 'Employees'.tr,
                                  ),
                                ),
                              ),
                              Center(
                                child: Wrap(
                                  children: [
                                    Container(
                                      height: (controller
                                                  .filteredEmployeeNameList
                                                  .length *
                                              50) +
                                          55,
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      constraints: BoxConstraints(
                                        maxWidth: 1400,
                                        minHeight: 60,
                                      ),
                                      child: DataTable2(
                                        // dataRowHeight: 50,
                                        border: TableBorder.all(
                                          color: Colors.grey.withOpacity(0.3),
                                        ),
                                        columns: [
                                          DataColumn2(
                                            size: ColumnSize.M,
                                            label: Text(
                                              "Employee Name",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.M,
                                            label: Text(
                                              "Email",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.M,
                                            label: Text(
                                              "Contact No",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.S,
                                            label: Text(
                                              "RSVP",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.S,
                                            label: Text(
                                              "Attended",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.L,
                                            label: Text(
                                              "Note",
                                            ),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller
                                              .filteredEmployeeNameList.length,
                                          (index) {
                                            var employeeNameDetails = controller
                                                    .filteredEmployeeNameList[
                                                index];
                                            return DataRow(
                                              cells: [
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
                                                  Checkbox(
                                                    value: false,
                                                    onChanged: (value) {
                                                      value == true
                                                          ? false
                                                          : true;
                                                    },
                                                  ),
                                                ),
                                                DataCell(
                                                  Checkbox(
                                                    value: false,
                                                    onChanged: (value) {
                                                      value == true
                                                          ? false
                                                          : true;
                                                    },
                                                  ),
                                                ),
                                                DataCell(
                                                  // Text(""),
                                                  _buildTextField_web(
                                                    context,
                                                    controller.noteListInternal[
                                                        index],
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
                              Dimens.boxHeight15,
                              Center(
                                child: Container(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(.3)),
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth: 1400,
                                  ),
                                  child: CustomAppBar(
                                    title: 'External People'.tr,
                                  ),
                                ),
                              ),
                              Center(
                                child: Wrap(
                                  children: [
                                    Container(
                                      height:
                                          (controller.externalEmployees.length *
                                                  50) +
                                              55,
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      constraints: BoxConstraints(
                                        maxWidth: 1400,
                                        minHeight: 60,
                                      ),
                                      child: DataTable2(
                                        border: TableBorder.all(
                                          color: Colors.grey.withOpacity(0.3),
                                        ),
                                        columns: [
                                          DataColumn2(
                                            size: ColumnSize.M,
                                            label: Text(
                                              "Name",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.M,
                                            label: Text(
                                              "Email",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.M,
                                            label: Text(
                                              "Number",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.S,
                                            label: Text(
                                              "RSVP",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.S,
                                            label: Text(
                                              "Attended",
                                            ),
                                          ),
                                          DataColumn2(
                                            size: ColumnSize.L,
                                            label: Text(
                                              "Note",
                                            ),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.externalEmployees.length,
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
                                                  Checkbox(
                                                    value: false,
                                                    onChanged: (value) {
                                                      value == true
                                                          ? false
                                                          : true;
                                                    },
                                                  ),
                                                ),
                                                DataCell(
                                                  Checkbox(
                                                    value: false,
                                                    onChanged: (value) {
                                                      value == true
                                                          ? false
                                                          : true;
                                                    },
                                                  ),
                                                ),
                                                DataCell(
                                                  _buildTextField_web(
                                                    context,
                                                    controller.noteListExternal[
                                                        index],
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
                                          child: FileUploadDetailsWidgetWeb2(),
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
                              Dimens.boxHeight20,
                              // Center(
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(10.0),
                              //     child: Container(
                              //       margin:
                              //           EdgeInsets.only(bottom: 20, top: 10),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [],
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
      floatingActionButton: Row(
        children: [
          Spacer(),
          Container(
            height: 35,
            child: CustomElevatedButton(
              backgroundColor: ColorValues.greenColor,
              text: 'Execute',
              onPressed: () {},
            ),
          ),
          Dimens.boxWidth20,
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
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildDateTimeField_web(
    BuildContext context,
    TextEditingController textcontroller,
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
              controller: textcontroller,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onTap: () => _pickDateTime(context, textcontroller),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDateTime(
    BuildContext context,
    TextEditingController controller,
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
        controller.text =
            DateFormat('yyyy-MM-dd – HH:mm').format(finalDateTime);
      }
    }
  }

  Widget _buildCommentFieldWeb(BuildContext context) {
    return Column(
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
                // contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        Dimens.boxHeight10,
      ],
    );
  }

  Widget _buildTextField_web(
    BuildContext context,
    TextEditingController textcontroller,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(vertical: 5),
          width: Get.width * 0.15,
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
          child: Center(
            child: TextField(
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              controller: textcontroller,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              textAlignVertical: TextAlignVertical.top,
            ),
          ),
        ),
      ],
    );
  }
}

class TitleAndInfo extends StatelessWidget {
  final String title;
  final String info;

  TitleAndInfo(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: Styles.black17,
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: Styles.blue17,
          ),
        ),
      ],
    );
  }
}
