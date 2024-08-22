import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/edit_job/edit_job_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class EditJobContentMobile extends GetView<EditJobController> {
  EditJobContentMobile({Key? key}) : super(key: key);
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          color: Colors.lightBlue.shade50,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(title: 'Job Title: '),
                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit.value == 1 ? false : true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                      child: Obx(
                        () => TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
                          ),
                          controller: controller.jobTitleCtrlr,
                          focusNode: controller.jobNameFocus,
                          scrollController: controller.jobNameScroll,
                          autofocus: false,
                          decoration: InputDecoration(
                            fillColor: ColorValues.whiteColor,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder:
                                controller.isJobTitleInvalid.value
                                    ? OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          color: ColorValues.redColorDark,
                                        ),
                                      )
                                    : InputBorder.none,
                            errorBorder: controller.isJobTitleInvalid.value
                                ? OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorValues.redColorDark,
                                    ),
                                  )
                                : null,
                            errorText: controller.isJobTitleInvalid.value
                                ? "Required field"
                                : null,
                          ),
                          onChanged: (value) {
                            if (value.trim().length > 3) {
                              controller.isJobTitleInvalid.value = false;
                            } else {
                              controller.isJobTitleInvalid.value = true;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp('[\'^]'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,

                  CustomRichText(title: 'Select Block :'),
                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit.value == 1 ? false : true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                      // width: (MediaQuery.of(context).size.width * .2),
                      child: Obx(
                        () => DropdownWebWidget(
                          dropdownList: controller.blockList,
                          isValueSelected: controller.isBlockSelected.value,
                          selectedValue: controller.selectedBlock.value,
                          onValueChanged: controller.onDropdownValueChanged,
                          // focusNode: controller.focusNode,
                        ),

                        // MultiSelectDialogField(
                        //   dialogWidth: 300,
                        //   dialogHeight: 400,
                        //   searchable: true,
                        //   validator: (selectedItems) {
                        //     if (controller.isBlockSelected.value == false) {
                        //       return "Required field";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   autovalidateMode: AutovalidateMode.always,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: controller.isBlockSelected.value == false ? Colors.red : Colors.transparent,
                        //       width: 1.0,
                        //     ),
                        //     borderRadius: BorderRadius.circular(5),
                        //   ),
                        //   buttonIcon: Icon(Icons.arrow_drop_down),
                        //   items: controller.blockList.map((e) => MultiSelectItem<BlockModel>(e!, e.name ?? '')).toList(),
                        //   onConfirm: (selectedOptionsList) => {
                        //     controller.blockSelected(selectedOptionsList),
                        //     controller.isBlockSelected.value = selectedOptionsList.isNotEmpty,
                        //   },
                        //   chipDisplay: MultiSelectChipDisplay(),
                        // ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,

                  CustomRichText(title: 'Equipment Categories :'),
                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit.value == 1 ? false : true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorValues.whiteColor,
                        borderRadius: BorderRadius.circular(10),
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
                      // width: (MediaQuery.of(context).size.width * .2),
                      child: Obx(() {
                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CircularProgressIndicator(); // Loading indicator while waiting
                        }

                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CustomMultiSelectDialogField(
                            onConfirm: (selectedOptionsList) {},
                            buttonText: "",
                            initialValue: [],
                            items: [],
                            title: "",
                          );
                        }

                        final initialValue = controller
                                .selectedEquipmentCategoryIdList.isNotEmpty
                            ? controller.selectedEquipmentCategoryIdList
                            : [];

                        return CustomMultiSelectDialogField(
                          title: 'Please Select',
                          buttonText: 'Equipment Category',
                          initialValue: initialValue,
                          items: controller.equipmentCategoryList
                              .map((equipmentCategory) {
                            return MultiSelectItem(
                              equipmentCategory!.id,
                              equipmentCategory.name,
                            );
                          }).toList(),
                          onConfirm: (selectedOptionsList) {
                            controller.equipmentCategoriesSelected(
                                selectedOptionsList);
                            print(
                                'Selected Equipment Categories: $selectedOptionsList');
                            print(
                                'Updated Selected Categories in Controller: ${controller.selectedEquipmentCategoryIdList}');
                          },
                        );
                      }),
                    ),
                  ),
                  Dimens.boxHeight20,

                  CustomRichText(title: 'Work Area / Equipments :'),
                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit.value == 1 ? false : true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorValues.whiteColor,
                        borderRadius: BorderRadius.circular(10),
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
                      // width: (MediaQuery.of(context).size.width * .2),
                      child: Obx(() {
                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CircularProgressIndicator(); // Loading indicator while waiting
                        }

                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CustomMultiSelectDialogField(
                            onConfirm: (selectedOptionsList) {},
                            buttonText: "",
                            initialValue: [],
                            items: [],
                            title: "",
                          );
                        }

                        final initialValue =
                            controller.selectedWorkAreaIdList.isNotEmpty
                                ? controller.selectedWorkAreaIdList
                                : [];

                        return CustomMultiSelectDialogField(
                          title: 'Please Select',
                          buttonText: 'Equipment Category',
                          initialValue: initialValue,
                          items: controller.workAreaList.map((workarea) {
                            return MultiSelectItem(
                              workarea!.id,
                              workarea.name ?? "",
                            );
                          }).toList(),
                          onConfirm: (selectedOptionsList) {
                            controller.workAreasSelected(selectedOptionsList);
                            print(
                                'Selected workarea Categories: $selectedOptionsList');
                            print(
                                'Updated Selected workarea in Controller: ${controller.selectedEquipmentCategoryIdList}');
                          },
                        );
                      }),
                    ),
                  ),
                  Dimens.boxHeight20,

                  CustomRichText(title: 'Breakdown Time: '),
                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit.value == 1 ? false : true,
                    child: Container(
                      // width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height * 0.040,
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
                          ), //BoxShadow
                          BoxShadow(
                            color: ColorValues.whiteColor,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        color: ColorValues.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16.0, height: 1.0, color: Colors.black),
                        ),
                        onTap: () {
                          controller.pickDateTime(context);
                        },
                        controller: controller.breakdownTimeCtrlr,
                        autofocus: false,
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: ColorValues.whiteColor,
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          errorBorder: controller.isBreakdownInvalid.value
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: ColorValues.redColorDark,
                                  ),
                                )
                              : null,
                          errorText: controller.isBreakdownInvalid.value
                              ? "Required field"
                              : null,
                        ),
                        onChanged: (value) {
                          if (value.trim().isNotEmpty) {
                            controller.isBreakdownInvalid.value = false;
                          } else {
                            controller.isBreakdownInvalid.value = true;
                          }
                        },
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,

                  CustomRichText(title: 'Fault :'),
                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit.value == 1 ? false : true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorValues.whiteColor,
                        borderRadius: BorderRadius.circular(10),
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
                      // width: (MediaQuery.of(context).size.width * .2),
                      child: Obx(() {
                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CircularProgressIndicator(); // Loading indicator while waiting
                        }

                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CustomMultiSelectDialogField(
                            onConfirm: (selectedOptionsList) {},
                            buttonText: "",
                            initialValue: [],
                            items: [],
                            title: "",
                          );
                        }

                        final initialValue =
                            controller.selectedWorkTypeIdList.isNotEmpty
                                ? controller.selectedWorkTypeIdList
                                : [];

                        return CustomMultiSelectDialogField(
                          title: 'Please Select',
                          buttonText: 'Equipment Category',
                          initialValue: initialValue,
                          items: controller.workTypeList.map((workType) {
                            return MultiSelectItem(
                              workType!.id,
                              workType.name ?? "",
                            );
                          }).toList(),
                          onConfirm: (selectedOptionsList) {
                            controller.workTypesSelected(selectedOptionsList);
                            print(
                                'Selected workarea Categories: $selectedOptionsList');
                            print(
                                'Updated Selected workarea in Controller: ${controller.selectedEquipmentCategoryIdList}');
                          },
                        );
                      }),
                    ),
                  ),
                  Dimens.boxHeight20,

                  CustomRichText(
                    title: 'Tools Required For Error :',
                    includeAsterisk: false, // Explicitly exclude the asterisk
                  ),
                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit.value == 1 ? false : true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorValues.whiteColor,
                        borderRadius: BorderRadius.circular(10),
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
                      // width: (MediaQuery.of(context).size.width * .2),
                      child: Obx(() {
                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CircularProgressIndicator(); // Loading indicator while waiting
                        }

                        if (!controller.isInventoryCategoryListLoaded.value) {
                          return CustomMultiSelectDialogField(
                            onConfirm: (selectedOptionsList) {},
                            buttonText: "",
                            initialValue: [],
                            items: [],
                            title: "",
                          );
                        }

                        final initialValue = controller
                                .selectedtoolsRequiredToWorkTypeIdList
                                .isNotEmpty
                            ? controller.selectedtoolsRequiredToWorkTypeIdList
                            : [];

                        return CustomMultiSelectDialogField(
                          title: 'Please Select',
                          buttonText: 'Equipment Category',
                          initialValue: initialValue,
                          items: controller.toolsRequiredToWorkTypeList
                              .map((workarea) {
                            return MultiSelectItem(
                              workarea!.id,
                              workarea.linkedToolName ?? "",
                            );
                          }).toList(),
                          onConfirm: (selectedOptionsList) {
                            controller
                                .toolsRequiredSelected(selectedOptionsList);
                            print(
                                'Selected workarea Categories: $selectedOptionsList');
                            print(
                                'Updated Selected workarea in Controller: ${controller.selectedEquipmentCategoryIdList}');
                          },
                        );
                      }),
                    ),
                  ),
                  Dimens.boxHeight20,

                  controller.typeEdit.value == 1
                      ? Dimens.box0
                      : CustomRichText(title: 'Assigned To :'),
                  Dimens.boxHeight5,
                  controller.typeEdit.value == 1
                      ? Dimens.box0
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          // width: (MediaQuery.of(context).size.width * .2),
                          child: DropdownWebWidget(
                            controller: controller,
                            dropdownList: controller.assignedToList,
                            isValueSelected:
                                controller.isAssignedToSelected.value,
                            selectedValue: controller.selectedAssignedTo.value,
                            onValueChanged: controller.onDropdownValueChanged,
                          ),
                        ),
                  // Dimens.boxHeight20,
                  CustomRichText(title: 'Job Description: '),

                  Dimens.boxHeight5,
                  IgnorePointer(
                    ignoring: controller.typeEdit == 1 ? false : true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                      // width: (MediaQuery.of(context).size.width),
                      child: Obx(
                        () => TextField(
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16.0,
                                height: 1.0,
                                color: Colors.black),
                          ),
                          controller: controller.jobDescriptionCtrlr,
                          focusNode: controller.descFocus,
                          scrollController: controller.descScroll,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          autofocus: false,
                          decoration: InputDecoration(
                            fillColor: ColorValues.whiteColor,
                            filled: true,
                            contentPadding: Dimens.edgeInsets05_10,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedErrorBorder:
                                controller.isJobDescriptionInvalid.value
                                    ? OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          color: ColorValues.redColorDark,
                                        ),
                                      )
                                    : InputBorder.none,
                            errorBorder:
                                controller.isJobDescriptionInvalid.value
                                    ? OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          color: ColorValues.redColorDark,
                                        ),
                                      )
                                    : null,
                            errorText: controller.isJobDescriptionInvalid.value
                                ? "Required field"
                                : null,
                          ),
                          onChanged: (value) {
                            if (value.trim().length > 3) {
                              controller.isJobDescriptionInvalid.value = false;
                            } else {
                              controller.isJobDescriptionInvalid.value = true;
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: CustomElevatedButton(
                      text: 'Update',
                      onPressed: () => controller.typeEdit.value == 1
                          ? controller.updateJob(
                              fileIds: dropzoneController.fileIds)
                          : controller.assignReAssignJob(),
                      backgroundColor: ColorValues.appDarkBlueColor,
                    ),
                  ),
                  // Dimens.boxHeight20,
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),

        /// SELECT BLOCK DropDown

        ///
      ]),
    );
  }
}
