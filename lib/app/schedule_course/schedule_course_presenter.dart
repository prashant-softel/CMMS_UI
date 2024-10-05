import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/schedule_course_details_model.dart';
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

  Future<List<EmployeeListModel>> getEmployeePermitList(
      {required bool isLoading,
      required int? facility_id,
      int? featureId}) async {
    return trainingUsecase.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
      featureId: featureId,
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
    Future<List<TrainingCourseListModel?>?> getTrainingCourseList({
    int? facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async =>
      await trainingUsecase.getTrainingCourseList(
        facilityId: facilityId,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
      );

  Future<TrainingCourseListModel> getCourseDetails({
    int? courseId,
    bool? isLoading,
  }) async =>
      await trainingUsecase.getCourseDetails(
        courseId: courseId,
        isLoading: isLoading,
      );

  Future<ScheduleCourseDetails> getScheduleCourseDetails({
    int? schedule_id,
    bool? isLoading,
  }) async =>
      await trainingUsecase.getScheduleCourseDetails(
        schedule_id: schedule_id,
        isLoading: isLoading,
      );

  void saveValue({String? courseId}) async {
    return trainingUsecase.saveValue(courseId: courseId);
  }

  void saveScheduleValue({String? scheduleId}) async {
    return trainingUsecase.saveScheduleValue(scheduleId: scheduleId);
  }

  void clearValue() async => trainingUsecase.clearValue();
  Future<String?> getValue() async => await trainingUsecase.getValue();
  void clearScheduleValue() async => trainingUsecase.clearScheduleValue();
  Future<String?> getScheduleValue() async =>
      await trainingUsecase.getScheduleValue();

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);
}
