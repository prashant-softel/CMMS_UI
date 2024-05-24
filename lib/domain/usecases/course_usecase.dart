import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CourseUsecase {
  CourseUsecase(this.repository);
  Repository repository;

  Future<List<EmployeeListModel>> getEmployeeList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getEmployeePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  void saveValue({String? courseId}) async => repository.saveValue(
        LocalKeys.courseId,
        courseId,
      );
  Future<String?> getValue() async => await repository.getStringValue(
        LocalKeys.courseId,
      );
  void clearValue() async => repository.clearData(
        LocalKeys.courseId,
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

  deleteTrainingCourse({
    int? courseId,
    required bool isLoading,
  }) async =>
      await repository.deleteTrainingCourse(
        courseId: courseId,
        isLoading: isLoading,
      );
}
