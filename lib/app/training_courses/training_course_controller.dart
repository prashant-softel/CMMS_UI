import 'dart:async';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/training_courses/training_course_presenter.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class TrainingController extends GetxController {
  TrainingController(this.trainingPresenter);

  TrainingPresenter trainingPresenter;
  HomeController homeController = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;
  RxInt facilityId = 0.obs;

  RxList<TrainingCourseListModel?> courseList = <TrainingCourseListModel>[].obs;
  RxList<TrainingCourseListModel?> filteredData =
      <TrainingCourseListModel>[].obs;
  RxList<String> trainingCourseListTableColumns = <String>[].obs;
  RxBool isLoading = true.obs;
  PaginationController trainingListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  final columnVisibility = ValueNotifier<Map<String, bool>>({
    "Course ID": true,
    "Course Name": true,
    "Category Name": true,
    "Group Name": true,
    "Number Of Days": true,
    "Duration": true,
    "Maximum Capacity": true,
    // "Description": true,
  });

  final Map<String, double> columnwidth = {
    "Course ID": 110,
    "Course Name": 180,
    "Category Name": 190,
    "Group Name": 170,
    "Number Of Days": 200,
    "Duration": 130,
    "Maximum Capacity": 230,
    // "Description": 100,
  };

  bool openFromDateToStartDatePicker = false;
  RxString CourseIdFilterText = ''.obs;
  RxString CourseNameFilterText = ''.obs;
  RxString CategoryNameFilterText = ''.obs;
  RxString GroupNameFilterText = ''.obs;
  RxString NumberOfDaysFilterText = ''.obs;
  RxString DurationInMinutesFilterText = ''.obs;
  RxString MaximumCapacityFilterText = ''.obs;
  // RxString DescriptionFilterText = ''.obs;
  RxString ActionFilterText = ''.obs;

  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: 70)).obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);
  String formatDate(String? inputDateTime) {
    String formattedDateTimeString = '';
    if (inputDateTime != null &&
        inputDateTime.isNotEmpty &&
        inputDateTime != "null") {
      DateFormat inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss.SSS");
      DateTime parsedDateTime = inputFormat.parse(inputDateTime);
      DateFormat outputFormat = DateFormat("yyyy-MM-dd hh:mm");
      formattedDateTimeString = outputFormat.format(parsedDateTime);
    }
    return formattedDateTimeString;
  }

  Map<String, RxString> filterText = {};
  void setColumnVisibility(String columnName, bool isVisible) {
    final newVisibility = Map<String, bool>.from(columnVisibility.value)
      ..[columnName] = isVisible;
    columnVisibility.value = newVisibility;
    print({"updated columnVisibility": columnVisibility});
  }

  void onInit() async {
    try {
      this.filterText = {
        "Course ID": CourseIdFilterText,
        "Course Name": CourseNameFilterText,
        "Category Name": CategoryNameFilterText,
        "Group Name": GroupNameFilterText,
        "Number Of Days": NumberOfDaysFilterText,
        "Duration": DurationInMinutesFilterText,
        "Maximum Capacity": MaximumCapacityFilterText,
        // "Description": DescriptionFilterText,
      };

      facilityIdStreamSubscription = homeController.facilityId$.listen(
        (event) {
          facilityId.value = event;
          Future.delayed(Duration(seconds: 1), () {
            getTrainingCourseList(
              facilityId: facilityId.value,
              startDate: formattedFromdate,
              endDate: formattedTodate,
            );
          });
        },
      );
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      courseList.value = filteredData;
      return;
    }
    List<TrainingCourseListModel?> filteredList = filteredData
        .where(
          (item) =>
              (item?.id.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false) ||
              (item?.name?.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false) ||
              (item?.groupId?.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false) ||
              (item?.categoryId?.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false) ||
              (item?.description?.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false) ||
              (item?.max_cap?.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false) ||
              (item?.duration?.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false) ||
              (item?.number_of_days?.toString().toLowerCase().contains(
                        keyword.toLowerCase(),
                      ) ??
                  false),
        )
        .toList();
    courseList.value = filteredList;
    update(['training_list']);
  }

  Future<void> getTrainingCourseList({
    required int facilityId,
    String? startDate,
    String? endDate,
  }) async {
    courseList.value = <TrainingCourseListModel>[];
    final _getTrainingList = await trainingPresenter.getTrainingCourseList(
      facilityId: facilityId,
      start_date: startDate,
      end_date: endDate,
      isLoading: isLoading.value,
    );

    if (_getTrainingList != null) {
      courseList.value = _getTrainingList;
      filteredData.value = courseList;
      isLoading.value = false;
      if (courseList.isNotEmpty) {
        TrainingCourseListModel? trainingCourse =
            courseList.firstWhere((element) => element?.id != 0);
        var trainingCourseListJson = trainingCourse?.toJson();
        trainingCourseListTableColumns.value = <String>[];
        for (var key in trainingCourseListJson?.keys.toList() ?? []) {
          trainingCourseListTableColumns.add(key);
        }
      }
    }
    trainingListPaginationController = PaginationController(
      rowCount: courseList.length,
      rowsPerPage: 10,
    );
    update(['training_list']);
  }

  void clearStoreData() {
    trainingPresenter.clearValue();
    trainingPresenter.clearScheduleValue();
    trainingPresenter.clearTypeValue();
  }

  Future<void> addNewCourse() async {
    clearStoreData();
    Get.toNamed(Routes.addCourse);
  }

  Future<void> viewCourse({required int courseId}) async {
    clearStoreData();
    Get.toNamed(Routes.viewCourse, arguments: {'courseId': courseId});
  }

  Future<void> editCourse({required int courseId}) async {
    clearStoreData();
    Get.toNamed(Routes.addCourse, arguments: {'courseId': courseId});
  }

  Future<void> scheduleCourse({required int courseId, required int scheduleId}) async {
    clearStoreData();
    Get.toNamed(Routes.scheduleCourse, arguments: {'courseId': courseId, 'scheduleId': scheduleId});
  }

  Future<void> viewScheduleCourse({required int scheduleId}) async {
    clearStoreData();
    Get.toNamed(
      Routes.executeCourse,
      arguments: {
        'schedule_id': scheduleId,
        "type": 2,
      },
    );
  }

  void geTrainingCourseListByDate() {
    getTrainingCourseList(
      facilityId: facilityId.value,
      startDate: formattedFromdate,
      endDate: formattedTodate,
    );
  }

  void isDeleteDialog({int? courseId, String? courseName}) {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delete Plan", style: Styles.blackBold16),
            Divider(
              color: ColorValues.appLightGreyColor,
            ),
            Dimens.boxHeight5,
            RichText(
              text: TextSpan(
                text: 'Are you sure you want to delete the PM Plan ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: "${courseName}",
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                  backgroundColor: ColorValues.appRedColor,
                  onPressed: () {
                    Get.back();
                  },
                  text: 'No'),
              CustomElevatedButton(
                backgroundColor: ColorValues.appGreenColor,
                onPressed: () {
                  deleteTrainingCourse(courseId).then(
                    (value) {
                      Get.back();
                      getTrainingCourseList(
                        facilityId: facilityId.value,
                        startDate: formattedFromdate,
                        endDate: formattedTodate,
                      );
                    },
                  );
                },
                text: 'Yes',
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteTrainingCourse(int? courseId) async {
    {
      await trainingPresenter.deleteTrainingCourse(
        courseId: courseId,
        isLoading: true,
      );
    }
  }
}
