import 'package:cmms/app/add_training_course/add_course_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCourseWeb extends StatefulWidget {
  const AddCourseWeb({Key? key}) : super(key: key);

  @override
  _AddCourseWebState createState() => _AddCourseWebState();
}

class _AddCourseWebState extends State<AddCourseWeb> {
  final screenHeight = Get.height;
  final screenWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCourseController>(builder: (controller) {
      return Scaffold(
        body: Container(
          color: Color.fromARGB(255, 234, 236, 238),
          height: screenHeight,
          width: screenWidth,
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
                        Get.offNamed(Routes.misDashboard);
                      },
                      child: Text(" / MIS", style: Styles.greyMediumLight12),
                    ),
                    InkWell(
                        onTap: () {
                          Get.offNamed(Routes.trainingCourse);
                        },
                        child: Text(" / TRAINING COURSE",
                            style: Styles.greyMediumLight12)),
                    Text(" / ADD TRAINING COURSE",
                        style: Styles.greyMediumLight12)
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
                                "Add Training Course",
                                style: Styles.blackBold18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: ColorValues.greyLightColour),
                      Container(
                        margin: Dimens.edgeInsets20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    CustomRichText(title: "Course ID:"),
                                    Dimens.boxWidth10,
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
                                              color: Colors.black26,
                                              offset: const Offset(5.0, 5.0),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                            BoxShadow(
                                              color: ColorValues.whiteColor,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ]),
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: Obx(() => TextField(
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 16.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            ),
                                            controller:
                                                controller.courseIdController,
                                            focusNode: controller.idFocus,
                                            scrollController:
                                                controller.idScroll,
                                            keyboardType:
                                                TextInputType.multiline,
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
                                                      .isNameInvalid.value
                                                  ? OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                        color: ColorValues
                                                            .redColorDark,
                                                      ),
                                                    )
                                                  : InputBorder.none,
                                              errorBorder: controller
                                                      .isNameInvalid.value
                                                  ? OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                        color: ColorValues
                                                            .redColorDark,
                                                      ),
                                                    )
                                                  : null,
                                              errorText:
                                                  controller.isNameInvalid.value
                                                      ? "Required field"
                                                      : null,
                                            ),
                                            onChanged: (value) {
                                              if (value.trim().length > 1) {
                                                controller.isNameInvalid.value =
                                                    false;
                                              } else {
                                                controller.isNameInvalid.value =
                                                    true;
                                              }
                                            },
                                          )),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                // Row(
                                //   children: [
                                //     CustomRichText(title: 'Category : '),
                                //     Dimens.boxWidth10,
                                //     Container(
                                //       width:
                                //           (MediaQuery.of(context).size.width *
                                //               .2),
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
                                //           onValueChanged:
                                //               (category, selectedValue) {},
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Dimens.boxHeight8,
                                // Row(
                                //   children: [
                                //     CustomRichText(title: 'Targetted Groups: '),
                                //     Dimens.boxWidth10,
                                //     Container(
                                //       width:
                                //           (MediaQuery.of(context).size.width *
                                //               .2),
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
                                //           onValueChanged:
                                //               (category, selectedValue) {},
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Dimens.boxHeight8,
                              ],
                            ),
                            Spacer(),
                            Column()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}
