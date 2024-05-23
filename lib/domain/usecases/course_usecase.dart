import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
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

  Future<Map<String,dynamic>> addCourse({
    courseJson,
    isLoading,
  }) async {
    return await repository.addCourse(
      courseJson: courseJson,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(
        isLoading,
      );
}
