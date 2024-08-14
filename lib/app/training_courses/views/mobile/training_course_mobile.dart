import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/training_courses/training_course_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TrainingCourseMobile extends StatelessWidget {
  const TrainingCourseMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
      id: "training_list",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Dimens.boxHeight10,
                      HeaderWidgetMobile(
                        onPressed: () {
                          controller.openFromDateToStartDatePicker =
                              !controller.openFromDateToStartDatePicker;
                          controller.update(['training_list']);
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.courseList.length,
                          itemBuilder: (context, index) {
                            TrainingCourseListModel? course =
                                controller.courseList[index];
                            return GestureDetector(
                              onTap: () {
                                controller.viewCourse(
                                  courseId: course?.id ?? 0,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                width: double.infinity,
                                child: Card(
                                  color: Colors.lightBlue.shade50,
                                  elevation: 10,
                                  shadowColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Course Id: CO${course?.id ?? 0}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight2,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Course Name: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${course?.name ?? ''}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Category Name: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${course?.categoryName ?? ''}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Group Name: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                course?.groupName ?? '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'No Of Days: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${course?.number_of_days}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Duration: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${course?.duration}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Capacity: ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${course?.max_cap}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Dimens.boxHeight4,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomElevatedButton(
                                              onPressed: () {
                                                controller.clearStoreData();
                                                controller.editCourse(
                                                  courseId: course?.id ?? 0,
                                                );
                                              },
                                              text: 'Edit',
                                              icon: Icons.edit,
                                              backgroundColor:
                                                  ColorValues.editColor,
                                            ),
                                            CustomElevatedButton(
                                              onPressed: () {
                                                controller.clearStoreData();
                                                controller.scheduleCourse(
                                                  courseId: course?.id ?? 0,
                                                );
                                              },
                                              text: 'Schedule',
                                              icon:
                                                  Icons.calendar_month_outlined,
                                              backgroundColor:
                                                  Colors.lightGreen,
                                            ),
                                            CustomElevatedButton(
                                              onPressed: () {
                                                controller.clearStoreData();
                                                controller.isDeleteDialog(
                                                  courseName: course?.name,
                                                  courseId: course?.id,
                                                );
                                              },
                                              text: 'Delete',
                                              icon: Icons.delete,
                                              backgroundColor:
                                                  ColorValues.deleteColor,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.openFromDateToStartDatePicker)
                  Positioned(
                    top: 50,
                    left: 10,
                    right: 10,
                    child: DatePickerWidget(
                      selectionMode: DateRangePickerSelectionMode.range,
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        todayCellDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorValues.appDarkBlueColor,
                        ),
                      ),
                      initialSelectedRange: PickerDateRange(
                        controller.fromDate.value,
                        controller.toDate.value,
                      ),
                      onSubmit: (value) {
                        print('po valu ${value.toString()}');
                        PickerDateRange? data = value as PickerDateRange;
                        var pickUpDate =
                            DateTime.parse(data.startDate.toString());
                        controller.fromDate.value = pickUpDate;
                        var dropDate = DateTime.parse(data.endDate.toString());
                        controller.toDate.value = dropDate;
                        controller.geTrainingCourseListByDate();
                        controller.openFromDateToStartDatePicker = false;

                        controller.update(['training_list']);
                      },
                      onCancel: () {
                        controller.openFromDateToStartDatePicker = false;
                        controller.update(['training_list']);
                      },
                    ),
                  ),
                Dimens.boxHeight10,
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: ColorValues.addNewColor,
            onPressed: () {
              controller.addNewCourse();
            },
          ),
        );
      },
    );
  }
}
