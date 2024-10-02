import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/schedule_course/schedule_course_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_mobile.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleMobile extends GetView<ScheduleController> {
  const ScheduleMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FileUploadController dropzoneController = Get.put(
      FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',),
    );
    return GetBuilder<ScheduleController>(
      id: "schedule-course",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimens.boxHeight5,
                  HeaderWidgetMobile(),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Schedule Course",
                          style: Styles.blackBold18,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.lightBlue.shade50,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 15),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: Get.height * .8,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomRichTextMobile(
                                title: "Training Agency: ",
                              ),
                              Dimens.boxHeight2,
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Obx(
                                  () => DropdownWebWidget(
                                    dropdownList: controller.trainingAgency,
                                    isValueSelected: controller
                                        .isTrainingAgencySelected.value,
                                    selectedValue: controller
                                        .selectedTrainingAgencyName.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title: "Date Of Training: ",
                              ),
                              Dimens.boxHeight2,
                              CustomTextfieldMobile(
                                width: MediaQuery.of(context).size.width / 1.1,
                                keyboardType: TextInputType.text,
                                textController: controller.dateOfTraining,
                                errorText: controller.isDateInvalid.value
                                    ? "Required field"
                                    : null,
                                onTap: () {
                                  pickDateTime(context);
                                },
                                onChanged: (value) {
                                  if (value.trim().length > 0) {
                                    controller.isDateInvalid.value = false;
                                  } else {
                                    controller.isDateInvalid.value = true;
                                  }
                                },
                              ),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title: "Trainer Name: ",
                              ),
                              Dimens.boxHeight2,
                              CustomTextfieldMobile(
                                width: MediaQuery.of(context).size.width / 1.1,
                                keyboardType: TextInputType.text,
                                textController: controller.trainerName,
                                errorText: controller.isTrainerInvalid.value
                                    ? "Required field"
                                    : null,
                                onChanged: (value) {
                                  if (value.trim().length > 0) {
                                    controller.isTrainerInvalid.value = false;
                                  } else {
                                    controller.isTrainerInvalid.value = true;
                                  }
                                },
                              ),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title: "HFE Employee: ",
                              ),
                              Dimens.boxHeight2,
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Obx(
                                  () => DropdownWebWidget(
                                    dropdownList: controller.employees,
                                    isValueSelected:
                                        controller.isEmployeeSelected.value,
                                    selectedValue:
                                        controller.selectedEmployeeName.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title: "Venue: ",
                              ),
                              Dimens.boxHeight2,
                              CustomTextfieldMobile(
                                width: MediaQuery.of(context).size.width / 1.1,
                                keyboardType: TextInputType.text,
                                textController: controller.venue,
                                errorText: controller.isVenueInvalid.value
                                    ? "Required field"
                                    : null,
                                onChanged: (value) {
                                  if (value.trim().length > 0) {
                                    controller.isVenueInvalid.value = false;
                                  } else {
                                    controller.isVenueInvalid.value = true;
                                  }
                                },
                              ),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title: "Mode: ",
                              ),
                              Dimens.boxHeight2,
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Obx(
                                  () => DropdownWebWidget(
                                    dropdownList: controller.mode,
                                    isValueSelected:
                                        controller.isModeSelected.value,
                                    selectedValue:
                                        controller.selectedModeName.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                              ),
                              Dimens.boxHeight15,
                              FileUploadWidgetWithDropzone(),
                              Dimens.boxHeight15,
                              FileUploadDetailsWidgetMobile(),
                              Dimens.boxHeight15,
                              CustomRichTextMobile(
                                title: "Comments: ",
                              ),
                              Dimens.boxHeight2,
                              CustomTextfieldMobile(
                                width: MediaQuery.of(context).size.width / 1.1,
                                maxLines: 5,
                                keyboardType: TextInputType.text,
                                textController: controller.comment,
                                errorText: controller.isCommentInvalid.value
                                    ? "Required field"
                                    : null,
                                onChanged: (value) {
                                  if (value.trim().length > 0) {
                                    controller.isCommentInvalid.value = false;
                                  } else {
                                    controller.isCommentInvalid.value = true;
                                  }
                                },
                              ),
                              Dimens.boxHeight20,
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
            children: [
              Spacer(),
              Container(
                height: 30,
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
                height: 30,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.addNewColor,
                  text: 'Schedule',
                  onPressed: () {
                    controller.isFormInvalid.value = false;
                    controller.scheduleCourse(
                      fileIds: dropzoneController.fileIds,
                    );
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }

  Future pickDateTime(BuildContext context) async {
    var dateTime = controller.selectedStartTime.value;
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
    controller.selectedStartTime.value = dateTime;
    controller.isDateInvalid.value = false;
    controller.dateOfTraining
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.dateOfTraining.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? dateTime = controller.selectedStartTime.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (newDate == null) return null;
    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    DateTime dateTime = controller.selectedStartTime.value;
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
}
