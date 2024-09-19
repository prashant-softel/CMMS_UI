import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_course/view_course_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';import 'package:cmms/app/utils/url_path.dart';

class ViewCourseWeb extends GetView<ViewCourseController> {
  ViewCourseWeb({Key? key}) : super(key: key);
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                                      BoxShadow(
                                          color: ColorValues.approveColor),
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
                                            "${controller.trainingCourse.value.name == null ? "" : controller.trainingCourse.value.name}",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Category: ",
                                            "${controller.trainingCourse.value.categoryName == null ? "" : controller.trainingCourse.value.categoryName}",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Targatted Group: ",
                                            "${controller.trainingCourse.value.groupName == null ? "" : controller.trainingCourse.value.groupName}",
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
                                            "${controller.trainingCourse.value.number_of_days == null ? "" : controller.trainingCourse.value.number_of_days}",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Duration In Minutes: ",
                                            "${controller.trainingCourse.value.duration == null ? "" : controller.trainingCourse.value.duration}",
                                          ),
                                          Dimens.boxHeight10,
                                          TitleAndInfo(
                                            "Maximum Capacity: ",
                                            "${controller.trainingCourse.value.max_cap == null ? "" : controller.trainingCourse.value.max_cap}",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight20,
                                Row(
                                  children: [
                                    CustomRichText(title: "Description: "),
                                    Dimens.boxWidth10,
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          "${controller.trainingCourse.value.description == null ? "" : controller.trainingCourse.value.description}",
                                          style: Styles.blue17,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight15,
                                Container(
                                  margin: Dimens.edgeInsets20,
                                  height:
                                      ((controller.imageDetails.length) * 40) +
                                          130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Attachments',
                                              style: Styles.blue700,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: DataTable2(
                                          border: TableBorder.all(
                                            color: Color.fromARGB(
                                                255, 206, 229, 234),
                                          ),
                                          columns: [
                                            DataColumn(
                                              label: Text(
                                                "File Description",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                "View Image",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.imageDetails.length,
                                            (index) => DataRow(
                                              cells: [
                                                DataCell(Text(
                                                  controller.imageDetails[index]
                                                      .description
                                                      .toString(),
                                                )),
                                                DataCell(
                                                  // Text("View Image"),
                                                  Wrap(
                                                    children: [
                                                      TableActionButton(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        icon: Icons.visibility,
                                                        message:
                                                            'view attachment',
                                                        onPress: () async {
                                                          String baseUrl =
                                                              UrlPath.deployUrl;
                                                          String fileName =
                                                              controller
                                                                      .imageDetails[
                                                                          index]
                                                                      .name ??
                                                                  "";
                                                          String fullUrl =
                                                              baseUrl +
                                                                  fileName;
                                                          if (await canLaunch(
                                                              fullUrl)) {
                                                            await launch(
                                                                fullUrl);
                                                          } else {
                                                            throw 'Could not launch $fullUrl';
                                                          }
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
            // Container(
            //   height: 45,
            //   child: CustomElevatedButton(
            //     backgroundColor: ColorValues.addNewColor,
            //     icon: Icons.schedule_outlined,
            //     text: 'Schedule',
            //     onPressed: () {
            //       Get.toNamed(Routes.scheduleCourse);
            //     },
            //   ),
            // ),
            Spacer(),
          ],
        ),
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
