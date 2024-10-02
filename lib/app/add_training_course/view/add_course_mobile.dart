import 'package:cmms/app/add_training_course/add_course_controller.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
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
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddCourseMobile extends GetView<AddCourseController> {
  const AddCourseMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FileUploadController dropzoneController = Get.put(
      FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',),
    );
    return GetBuilder<AddCourseController>(
      id: "add-course-mobile",
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
                          "Add Course",
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
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichTextMobile(
                              title: "Topic: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.text,
                              textController: controller.topic,
                              errorText: controller.isNameInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isNameInvalid.value = false;
                                } else {
                                  controller.isNameInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Category: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.courseCategory,
                                  isValueSelected:
                                      controller.isCategorySelected.value,
                                  selectedValue:
                                      controller.selectedCategory.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Targetted Group: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.targetedGroup,
                                  isValueSelected:
                                      controller.isGroupSelected.value,
                                  selectedValue: controller.selectedGroup.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Number Of Days: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController: controller.noOfDays,
                              errorText: controller.isCodeInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isCodeInvalid.value = false;
                                } else {
                                  controller.isCodeInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Duration in Minutes: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController: controller.minutes,
                              errorText: controller.isTimeInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isTimeInvalid.value = false;
                                } else {
                                  controller.isTimeInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Maximum Capacity: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController: controller.maximumCapacity,
                              errorText: controller.isMaxCapacityInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isMaxCapacityInvalid.value = false;
                                } else {
                                  controller.isMaxCapacityInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Description: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              maxLines: 5,
                              keyboardType: TextInputType.text,
                              textController: controller.descCtrlr,
                              errorText: controller.isDescriptionInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDescriptionInvalid.value = false;
                                } else {
                                  controller.isDescriptionInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            FileUploadWidgetWithDropzone(),
                            Dimens.boxHeight15,
                            FileUploadDetailsWidgetMobile(),
                            Dimens.boxHeight15,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Obx(
            () => Row(
              children: [
                Spacer(),
                Container(
                  height: 30,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.redColor,
                    text: "Cancel",
                    onPressed: () {
                      controller.cleardata();
                      Get.back();
                    },
                  ),
                ),
                Dimens.boxWidth10,
                controller.courseId.value == 0
                    ? Container(
                        height: 30,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.greenColor,
                          text: 'Submit',
                          onPressed: () {
                            controller.isFormInvalid.value = false;
                            controller.addCourse(
                              fileIds: dropzoneController.fileIds,
                            );
                          },
                        ),
                      )
                    : Container(
                        height: 30,
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.appDarkBlueColor,
                          text: 'Update',
                          onPressed: () {
                            controller.isFormInvalid.value = false;
                            controller.updateCourse(
                              fileIds: dropzoneController.fileIds,
                            );
                            // Get.toNamed(Routes.trainingCourse);
                          },
                        ),
                      ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
