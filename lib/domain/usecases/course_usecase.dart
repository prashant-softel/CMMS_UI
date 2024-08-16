import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/schedule_course_details_model.dart';
import 'package:cmms/domain/models/schedule_course_list_model.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CourseUsecase {
  CourseUsecase(this.repository);
  Repository repository;

  Future<List<EmployeeListModel>> getEmployeeList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<EmployeeListModel>> getEmployeePermitList(
      {required bool isLoading,
      required int? facility_id,
      int? featureId}) async {
    return repository.getEmployeeTrainingList(
      isLoading: isLoading,
      facility_id: facility_id,
      featureId: featureId,
    );
  }

  Future<Map<String, dynamic>> scheduleCourse({
    scheduleCourseJson,
    isLoading,
  }) async {
    return await repository.scheduleCourse(
      scheduleCourseJson: scheduleCourseJson,
      isLoading: isLoading,
    );
  }

  Future<ScheduleCourseDetails> getScheduleCourseDetails({
    int? schedule_id,
    bool? isLoading,
  }) async =>
      await repository.getScheduleCourseDetails(
        schedule_id: schedule_id,
        isLoading: isLoading,
      );

  void saveValue({String? courseId}) async => repository.saveValue(
        LocalKeys.courseId,
        courseId,
      );
  void saveScheduleValue({String? scheduleId}) async => repository.saveValue(
        LocalKeys.schedule_id,
        scheduleId,
      );
  Future<String?> getValue() async => await repository.getStringValue(
        LocalKeys.courseId,
      );
  Future<String?> getScheduleValue() async => await repository.getStringValue(
        LocalKeys.schedule_id,
      );
  void clearValue() async => repository.clearData(
        LocalKeys.courseId,
      );
  void clearScheduleValue() async => repository.clearData(
        LocalKeys.schedule_id,
      );

  void clearTypeValue() async => repository.clearData(
        LocalKeys.viewtype,
      );
  Future<Map<String, dynamic>> addCourse({
    courseJson,
    isLoading,
  }) async {
    return await repository.addCourse(
      courseJson: courseJson,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>> updateCourse({
    courseJson,
    isLoading,
  }) async {
    return await repository.updateCourse(
      courseJson: courseJson,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(
        isLoading,
      );

  Future<List<TrainingCourseListModel>> getTrainingCourseList({
    int? facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async =>
      await repository.getTrainingCourseList(
        facility_id: facilityId,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
      );
  Future<List<ScheduleCourseListModel>> getScheduleCourseList({
    int? facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async =>
      await repository.getScheduleCourseList(
        facility_id: facilityId,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
      );

  Future<TrainingCourseListModel> getCourseDetails({
    int? courseId,
    bool? isLoading,
  }) async =>
      await repository.getCourseDetails(
        courseId: courseId,
        isLoading: isLoading,
      );

  Future<List<CourseCategoryModel>> getCourseCategory({
    required bool isLoading,
  }) async {
    return repository.getCourseCategory(
      isLoading: isLoading,
    );
  }

  Future<List<CourseCategoryModel>> getTargetedGroup({
    required bool isLoading,
  }) async {
    return repository.getTargetedGroup(
      isLoading: isLoading,
    );
  }

  deleteTrainingCourse({
    int? courseId,
    required bool isLoading,
  }) async =>
      await repository.deleteTrainingCourse(
        courseId: courseId,
        isLoading: isLoading,
      );
}
