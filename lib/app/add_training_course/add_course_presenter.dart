import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';

class AddCoursePresenter {
  AddCoursePresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  Future<Map<String, dynamic>> addCourse({
    courseJson,
    isLoading,
  }) async {
    return await trainingUsecase.addCourse(
      courseJson: courseJson,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>> updateCourse({
    courseJson,
    isLoading,
  }) async {
    return await trainingUsecase.updateCourse(
      courseJson: courseJson,
      isLoading: isLoading,
    );
  }

  Future<TrainingCourseListModel> getCourseDetails({
    int? courseId,
    bool? isLoading,
  }) async =>
      await trainingUsecase.getCourseDetails(
        courseId: courseId,
        isLoading: isLoading,
      );

  Future<List<CourseCategoryModel>> getTargetedGroup({
    required bool isLoading,
  }) async {
    return trainingUsecase.getTargetedGroup(
      isLoading: isLoading,
    );
  }

  Future<List<CourseCategoryModel>> getCourseCategory({
    required bool isLoading,
  }) async {
    return trainingUsecase.getCourseCategory(
      isLoading: isLoading,
    );
  }

  void saveValue({String? courseId}) async {
    return trainingUsecase.saveValue(courseId: courseId);
  }

  void clearValue() async => trainingUsecase.clearValue();

  Future<String?> getValue() async => await trainingUsecase.getValue();

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);
}
