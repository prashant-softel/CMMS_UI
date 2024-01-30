import 'package:cmms/app/add_asset_master/view/FileUploadWidgetWithDropzoneAssets.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/schedule_course/schedule_course_controller.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_richtext.dart';

class ScheduleWeb extends GetView<ScheduleController> {
  ScheduleWeb({Key? key}) : super(key: key);

  // final AddInventoryController controller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    ///
    return
        // Obx(
        //         () =>
        Container(
      color: Color.fromARGB(255, 234, 236, 238),
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
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
                    Get.offNamed(Routes.misDashboard);
                  },
                  child: Text(" / MIS", style: Styles.greyLight14),
                ),
                InkWell(
                    onTap: () {
                      Get.offNamed(Routes.scheduleCourseList);
                    },
                    child: Text(" / SCHEDULE COURSE LIST",
                        style: Styles.greyLight14)),
                Text(" / SCHEDULE COURSE", style: Styles.greyLight14)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: Dimens.edgeInsets20,
                color: Color.fromARGB(255, 245, 248, 250),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
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
                      child: Padding(
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
                    ),
                    // Divider(
                    //   color: ColorValues.greyLightColour,
                    // ),
                    Container(
                      margin: Dimens.edgeInsets40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: Dimens.edgeInsets30_0_0_0,
                            child: Dimens.boxWidth30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomRichText(title: 'Training Company'),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
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
                                        BoxShadow(
                                          color: ColorValues.whiteColor,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: Obx(() => DropdownWebWidget(
                                          dropdownList: controller.company,
                                          isValueSelected: controller
                                              .isCompanySelected.value,
                                          selectedValue:
                                              controller.selectedCompany.value,
                                          onValueChanged:
                                              (category, selectedV) {},
                                        )),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  CustomRichText(title: 'Date of Birth: '),
                                  Dimens.boxWidth10,
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
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
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: LoginCustomTextfield(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      widget: Icon(
                                        Icons.calendar_month,
                                        color: ColorValues.greyLightColor,
                                      ),
                                      ontap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2101),
                                        );

                                        // Update the text field with the selected date
                                        if (pickedDate != null) {
                                          controller.dateController.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                        }
                                      },
                                      textController: controller.dateController,
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
                                        borderRadius: BorderRadius.circular(10),
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
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    height: 40,
                                    child: Obx(() => DropdownWebWidget(
                                          dropdownList: controller.mode,
                                          isValueSelected:
                                              controller.isModeSelected.value,
                                          selectedValue:
                                              controller.selectedMode.value,
                                          onValueChanged:
                                              (category, selectedV) {},
                                        )),
                                  )
                                ],
                              ),
                              Dimens.boxHeight10,
                            ],
                          ),
                          // SizedBox(
                          //   width: 250,
                          // ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomRichText(title: 'Trainer: '),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
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
                                        BoxShadow(
                                          color: ColorValues.whiteColor,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: Obx(
                                      () => TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        controller: controller.minutes,
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                          fillColor: ColorValues.whiteColor,
                                          filled: true,
                                          contentPadding:
                                              Dimens.edgeInsets05_10,
                                          border: InputBorder.none,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedErrorBorder: controller
                                                  .isCodeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : InputBorder.none,
                                          errorBorder: controller
                                                  .isCodeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : null,
                                          errorText:
                                              controller.isCodeInvalid.value
                                                  ? "Required field"
                                                  : null,
                                        ),
                                        onChanged: (value) {
                                          if (value.trim().length > 1 ||
                                              int.tryParse(value) == null) {
                                            controller.isCodeInvalid.value =
                                                false;
                                          } else {
                                            controller.isCodeInvalid.value =
                                                true;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  CustomRichText(title: 'Venue'),
                                  Dimens.boxWidth10,
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
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
                                        BoxShadow(
                                          color: ColorValues.whiteColor,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    width: (MediaQuery.of(context).size.width *
                                        .2),
                                    child: Obx(
                                      () => TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        controller: controller.maximumCapacity,
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                          fillColor: ColorValues.whiteColor,
                                          filled: true,
                                          contentPadding:
                                              Dimens.edgeInsets05_10,
                                          border: InputBorder.none,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          focusedErrorBorder: controller
                                                  .isTimeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : InputBorder.none,
                                          errorBorder: controller
                                                  .isTimeInvalid.value
                                              ? OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                    color: ColorValues
                                                        .redColorDark,
                                                  ),
                                                )
                                              : null,
                                          errorText:
                                              controller.isTimeInvalid.value
                                                  ? "Required field"
                                                  : null,
                                        ),
                                        onChanged: (value) {
                                          if (value.trim().length >= 1) {
                                            controller.isTimeInvalid.value =
                                                false;
                                          } else {
                                            controller.isTimeInvalid.value =
                                                true;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [SizedBox(height: 60)],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Dimens.edgeInsets20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: Dimens.edgeInsets30_0_0_0,
                            child: Dimens.boxWidth30,
                          ),
                          Container(
                            margin: Dimens.edgeInsets10,
                            child: Row(
                              children: [
                                CustomRichText(title: 'Attachment: '),
                                Dimens.boxWidth10,
                                Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.25,
                                  child: Row(
                                      //
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: FileUploadWidgetWithDropzone(),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.userId == 0
                                ? Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor: ColorValues.greenColor,
                                      text: 'Submit',
                                      style: TextStyle(color: Colors.white),
                                      onPressed: () {
                                        // controller.addCourse().then((value) {
                                        //   print("value,$value");
                                        //   if (value == true)
                                        //     controller
                                        //         .issuccessCreateAssetlist();
                                        // }); //  controller.saveAccessLevel();
                                      },
                                    ),
                                  )
                                : Container(
                                    height: 35,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appDarkBlueColor,
                                      text: 'Update',
                                      onPressed: () {
                                        // controller.updateCourse().then((value) {
                                        //   if (value == true) {
                                        //     // controller.userId = 0;
                                        //     controller.saveAccessLevel();
                                        //     //   controller.saveNotification();
                                        //   }
                                        // });
                                        //  controller.saveAccessLevel();
                                      },
                                    ),
                                  ),
                            Dimens.boxWidth20,
                            Container(
                              height: 35,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.redColor,
                                text: "Cancel",
                                onPressed: () {
                                  controller.cleardata();
                                  Get.back();
                                },
                              ),
                            ),
                            // if (controller.openDatePicker)
                            //   Positioned(
                            //     right: 300,
                            //     top: 150,
                            //     child: DatePickerWidget(
                            //       minDate: DateTime(DateTime.now().year),
                            //       maxDate: DateTime(DateTime.now().year, 13,
                            //           0), // last date of this year
                            //       controller: DateRangePickerController(),
                            //       selectionChanges: (p0) {
                            //         print('po valu ${p0.value.toString()}');
                            //         controller.dateController.text =
                            //             DateFormat('yyyy-MM-dd')
                            //                 .format(p0.value);
                            //         controller.openDatePicker =
                            //             !controller.openDatePicker;
                            //         controller.update(['stock_Mangement']);
                            //       },
                            //     ),
                            //   )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // );
  }
}

// Row(
//   children: [
//     CustomRichText(title: 'Category: '),
//     Dimens.boxWidth10,
//     Container(
//       width: (MediaQuery.of(context).size.width *
//           .2),
//       // height : 100,

//       child: Obx(
//         () => DropdownWebWidget(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: const Offset(
//                 5.0,
//                 5.0,
//               ),
//               blurRadius: 5.0,
//               spreadRadius: 1.0,
//             ),
//             BoxShadow(
//               color: ColorValues.whiteColor,
//               offset: const Offset(0.0, 0.0),
//               blurRadius: 0.0,
//               spreadRadius: 0.0,
//             ),
//           ],
//           controller: controller,
//           dropdownList: controller.category,
//           // isValueSelected: controller
//           //     .isSelectedMaterialType.value,
//           selectedValue: controller
//               .selectedMaterialType.value,
//           onValueChanged:
//               (category, selectedValue) {},
//           // controller.onValueChanged,
//         ),
//       ),
//     ),
//   ],
// ),

// Row(
//   children: [
//     CustomRichText(title: 'Targetted Group: '),
//     Dimens.boxWidth10,
//     Container(
//       width: (MediaQuery.of(context).size.width *
//           .2),
//       child: Obx(
//         () => DropdownWebWidget(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: const Offset(
//                 5.0,
//                 5.0,
//               ),
//               blurRadius: 5.0,
//               spreadRadius: 1.0,
//             ),
//             BoxShadow(
//               color: ColorValues.whiteColor,
//               offset: const Offset(0.0, 0.0),
//               blurRadius: 0.0,
//               spreadRadius: 0.0,
//             ),
//           ],
//           controller: controller,
//           dropdownList: controller.targetGroup,
//           // isValueSelected: controller
//           //     .isSelectedUnitOfMeasurement.value,
//           // selectedValue: controller
//           //     .selectedUnitOfMeasurement.value,
//           onValueChanged:
//               (targettedGroup, selctedValue) {},
//         ),
//       ),
//     ),
//   ],
// ),
