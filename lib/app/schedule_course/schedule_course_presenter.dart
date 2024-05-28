import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';

class SchedulePresenter {
  SchedulePresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  Future<List<EmployeeListModel>> getEmployeeList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return trainingUsecase.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<Map<String, dynamic>> scheduleCourse({
    scheduleCourseJson,
    isLoading,
  }) async {
    return await trainingUsecase.scheduleCourse(
      scheduleCourseJson: scheduleCourseJson,
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

  void saveValue({String? courseId}) async {
    return trainingUsecase.saveValue(courseId: courseId);
  }

  void clearValue() async => trainingUsecase.clearValue();
  Future<String?> getValue() async => await trainingUsecase.getValue();

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);
}
