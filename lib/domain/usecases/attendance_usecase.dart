import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AttendanceUsecase {
  AttendanceUsecase(this.repository);
  Repository repository;

  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssignedToList(
        auth,
        facilityId,
        isLoading,
      );

  Future<bool> addAttendance({
    jsonEmployeeAttendance,
    isLoading,
  }) async =>
      await repository.addAttendance(
        jsonEmployeeAttendance,
        isLoading,
      );
}
