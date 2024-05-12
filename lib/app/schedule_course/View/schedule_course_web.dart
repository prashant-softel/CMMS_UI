import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/schedule_course/schedule_course_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScheduleWeb extends GetView<ScheduleController> {
  ScheduleWeb({Key? key}) : super(key: key);
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
                      Get.offNamed(Routes.trainingCourse);
                    },
                    child: Text(
                      " / TRAINING COURSE",
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
                    margin: Dimens.edgeInsets20,
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
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),
                        Container(
                          margin: EdgeInsets.all(40),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          CustomRichText(
                                              title: "Training Course: "),
                                          Dimens.boxWidth10,
                                          Container(
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 227, 224, 244),
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
                                                )
                                              ],
                                            ),
                                            child: Obx(
                                              () => DropdownWebWidget(
                                                dropdownList: controller
                                                    .trainingCourseList,
                                                isValueSelected: controller
                                                    .isTrainingCourseSelected
                                                    .value,
                                                selectedValue: controller
                                                    .selectedCourseName.value,
                                                onValueChanged:
                                                    controller.onValueChanged,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight10,
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
                                                    color: Color.fromARGB(
                                                            255, 236, 234, 234)
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
                                              keyboardType: TextInputType.text,
                                              maxLine: 1,
                                              textController: controller.venue,
                                              focusNode: controller.venueFocus,
                                              scrollController:
                                                  controller.venueScroll,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight30,
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          CustomRichText(
                                              title: 'Date Of Training: '),
                                          Dimens.boxWidth10,
                                          _buildDateTimeField_web(
                                            context,
                                            controller.dateOfTraining,
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        children: [
                                          CustomRichText(
                                              title: 'Trainer Name: '),
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
                                                ]),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2),
                                            height: 30,
                                            child: Obx(
                                              () => DropdownWebWidget(
                                                dropdownList:
                                                    controller.employees,
                                                isValueSelected: controller
                                                    .isEmployeeSelected.value,
                                                selectedValue: controller
                                                    .selectedEmployeeName.value,
                                                onValueChanged:
                                                    controller.onValueChanged,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        children: [
                                          CustomRichText(
                                              title: "Training Agency: "),
                                          Dimens.boxWidth10,
                                        ],
                                      ),
                                      Dimens.boxHeight30,
                                    ],
                                  ),
                                ],
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
                              )
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
    );
  }

  Widget _buildDateTimeField_web(
    BuildContext context,
    TextEditingController textcontroller,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
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
    );

    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
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
            width: Get.width * 0.7,
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
}
