import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/view_schedule_course/view_schedule_course_presenter.dart';
import 'package:cmms/domain/models/training_course_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ViewScheduleCourseController extends GetxController {
  ViewScheduleCourseController(this.viewCoursePresenter);

  ViewScheduleCoursePresenter viewCoursePresenter;
  HomeController homeController = Get.find();
  RxInt facilityId = 0.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  TrainingCourse trainingCourse = TrainingCourse(
    id: 1,
    name: "Mobile Application Development",
    categoryId: 1,
    categoryName: "Technical Semminar",
    groupId: 1,
    groupName: "IT Professionals",
    numberOfDays: 1,
    duration: 30,
    maximumCapicity: 60,
    description:
        "Day 1: ...., Day 2: .... blah... blah... blah... blah...........",
    shortStatus: "Created",
  );

  @override
  void onInit() {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId.value = event;
    });

    super.onInit();
  }
}
