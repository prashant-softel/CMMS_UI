import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/execute_course_usecase.dart';

class ExecuteCoursePresenter {
  ExecuteCoursePresenter(this.trainingUsecase);
  ExecuteCourseUsecase trainingUsecase;

  Future<List<EmployeeListModel>> getEmployeeList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return trainingUsecase.getEmployeeList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);
}
