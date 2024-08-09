// ignore_for_file: deprecated_member_use

import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/view_course/view_course_controller.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewCourseMobile extends GetView<ViewCourseController> {
  const ViewCourseMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: <Widget>[
              Dimens.boxHeight5,
              HeaderWidgetMobile(),
              Padding(
                padding: Dimens.edgeInsets10,
                child: SingleChildScrollView(
                  child: Container(
                    height: Get.height * 0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  JobDetailField(
                                    title: 'Topic: ',
                                    value:
                                        "${controller.trainingCourse.value.name ?? ""}",
                                  ),
                                  JobDetailField(
                                    title: 'Cateogry: ',
                                    value:
                                        "${controller.trainingCourse.value.categoryName ?? ""}",
                                  ),
                                  JobDetailField(
                                    title: 'Targetted Group',
                                    value:
                                        "${controller.trainingCourse.value.groupName ?? ""}",
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  JobDetailField(
                                    title: 'No Of Days: ',
                                    value:
                                        "${controller.trainingCourse.value.number_of_days}",
                                  ),
                                  JobDetailField(
                                    title: 'Duration In Minutes: ',
                                    value:
                                        "${controller.trainingCourse.value.duration}",
                                  ),
                                  JobDetailField(
                                    title: 'Maximum Capacity: ',
                                    value:
                                        "${controller.trainingCourse.value.max_cap}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        JobDetailField(
                          title: 'Description: ',
                          value:
                              "${controller.trainingCourse.value.description}",
                        ),
                        Dimens.boxHeight15,
                        controller.imageDetails.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Files Uploaded",
                                    style: Styles.blue700,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.imageDetails.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Colors.lightBlue.shade50,
                                        elevation: 10,
                                        shadowColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  "${controller.imageDetails[index].description}",
                                                  style: Styles.appDarkGrey12,
                                                ),
                                              ),
                                            ),
                                            TableActionButton(
                                              color:
                                                  ColorValues.appDarkBlueColor,
                                              icon: Icons.visibility,
                                              message: 'View File',
                                              onPress: () async {
                                                String baseUrl =
                                                    'http://172.20.43.9:83/';
                                                String fileName = controller
                                                        .imageDetails[index]
                                                        .name ??
                                                    "";
                                                String fullUrl =
                                                    baseUrl + fileName;
                                                if (await canLaunch(fullUrl)) {
                                                  await launch(fullUrl);
                                                } else {
                                                  throw 'Could not launch $fullUrl';
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : Dimens.box0,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
