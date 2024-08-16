import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/view_course/view_course_presenter.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ViewCourseController extends GetxController {
  ViewCourseController(this.viewCoursePresenter);

  ViewCoursePresenter viewCoursePresenter;
  HomeController homeController = Get.find();
  RxInt facilityId = 0.obs;
  RxInt courseId = 0.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  Rx<TrainingCourseListModel> trainingCourse = TrainingCourseListModel().obs;
  RxBool isLoading = true.obs;
  RxList<ImageDetails> imageDetails = <ImageDetails>[].obs;


  @override
  void onInit() async {
    try {
      await setId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId.value = event;
      });
      await getCourseDetails(courseId.value);

      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setId() async {
    try {
      final _courseId = await viewCoursePresenter.getValue();
      if (_courseId == null || _courseId == "" || _courseId == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        courseId.value = dataFromPrevioursScreen['courseId'];
        viewCoursePresenter.saveValue(courseId: courseId.value.toString());
      } else {
        courseId.value = int.tryParse(_courseId) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCourseDetails(int courseId) async {
    trainingCourse.value = TrainingCourseListModel();
    final _courseDetails = await viewCoursePresenter.getCourseDetails(
      courseId: courseId,
      isLoading: isLoading.value,
    );
    trainingCourse.value = _courseDetails;
    imageDetails.value = trainingCourse.value.imageDetails ?? [];
    isLoading.value = false;
  }

  void clearStoreData() {
    viewCoursePresenter.clearValue();
  }
}
