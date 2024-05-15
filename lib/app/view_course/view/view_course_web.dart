import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_course/view_course_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCourseWeb extends GetView<ViewCourseController> {
  ViewCourseWeb({Key? key}) : super(key: key);
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
                    " / VIEW TRAINING COURSE",
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
                                "View Training Course",
                                style: Styles.blackBold18,
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: ColorValues.approveColor,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(color: ColorValues.approveColor),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Course Created",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        TitleAndInfo(
                                          "Topic: ",
                                          "${controller.trainingCourse.name}",
                                        ),
                                        Dimens.boxHeight10,
                                        TitleAndInfo(
                                          "Category: ",
                                          "${controller.trainingCourse.categoryName}",
                                        ),
                                        Dimens.boxHeight10,
                                        TitleAndInfo(
                                          "Targatted Group: ",
                                          "${controller.trainingCourse.groupName}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        TitleAndInfo(
                                          "No of Days: ",
                                          "${controller.trainingCourse.numberOfDays}",
                                        ),
                                        Dimens.boxHeight10,
                                        TitleAndInfo(
                                          "Duration In Minutes: ",
                                          "${controller.trainingCourse.duration}",
                                        ),
                                        Dimens.boxHeight10,
                                        TitleAndInfo(
                                          "Maximum Capacity: ",
                                          "${controller.trainingCourse.maximumCapicity}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   width: Get.width * .43,
                                  //   child: Row(
                                  //     children: [
                                  //       SizedBox(
                                  //         child: Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             Text(
                                  //               "Topic: ",
                                  //               style: Styles.black17,
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             Text(
                                  //               "Category: ",
                                  //               style: Styles.black17,
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             Text(
                                  //               "Targatted Group: ",
                                  //               style: Styles.black17,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Spacer(),
                                  //       SizedBox(
                                  //         child: Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             Text(
                                  //               "${controller.trainingCourse.name}",
                                  //               style: Styles.blue17,
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             Text(
                                  //               "${controller.trainingCourse.categoryName}",
                                  //               style: Styles.blue17,
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             Text(
                                  //               "${controller.trainingCourse.groupName}",
                                  //               style: Styles.blue17,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Spacer(),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Spacer(),
                                  // Container(
                                  //   width: Get.width * .4,
                                  //   child: Row(
                                  //     children: [
                                  //       SizedBox(
                                  //         child: Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             Text(
                                  //               "No of Days: ",
                                  //               style: Styles.black17,
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             Text(
                                  //               "Duration In Minutes: ",
                                  //               style: Styles.black17,
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             Text(
                                  //               "Maximum Capacity: ",
                                  //               style: Styles.black17,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Spacer(),
                                  //       SizedBox(
                                  //         child: Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.start,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             SizedBox(
                                  //               child: Text(
                                  //                 "${controller.trainingCourse.numberOfDays}",
                                  //                 style: Styles.blue17,
                                  //               ),
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             SizedBox(
                                  //               child: Text(
                                  //                 "${controller.trainingCourse.duration}",
                                  //                 style: Styles.blue17,
                                  //               ),
                                  //             ),
                                  //             Dimens.boxHeight5,
                                  //             SizedBox(
                                  //               child: Text(
                                  //                 "${controller.trainingCourse.maximumCapicity}",
                                  //                 style: Styles.blue17,
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Spacer(),
                                  //       Spacer(),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              Dimens.boxHeight20,
                              Row(
                                children: [
                                  CustomRichText(title: "Description: "),
                                  Dimens.boxWidth10,
                                  SizedBox(
                                    child: Text(
                                      "${controller.trainingCourse.description}",
                                      style: Styles.blue17,
                                    ),
                                  ),
                                ],
                              ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            height: 45,
            child: CustomElevatedButton(
              backgroundColor: ColorValues.appDarkBlueColor,
              icon: Icons.print_outlined,
              text: 'Print',
              onPressed: () {},
            ),
          ),
          Dimens.boxWidth10,
          Container(
            height: 45,
            child: CustomElevatedButton(
              backgroundColor: ColorValues.addNewColor,
              icon: Icons.schedule_outlined,
              text: 'Schedule',
              onPressed: () {
                Get.toNamed(Routes.scheduleCourse);
              },
            ),
          ),
          Spacer(),
        ],
      ),
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
