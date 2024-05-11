import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/usecases/attendance_usecase.dart';

class AttendancePresenter {
  AttendancePresenter(this.attendanceUsecase);
  AttendanceUsecase attendanceUsecase;

  Future<List<EmployeeModel>?>? getEmployeeListByFacilityId({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await attendanceUsecase.getEmployeeListByFacilityId(
        facilityId: facilityId,
        isLoading: isLoading,
      );

  Future<bool> addAttendance({
    jsonEmployeeAttendance,
    isLoading,
  }) async =>
      await attendanceUsecase.addAttendance(
        jsonEmployeeAttendance: jsonEmployeeAttendance,
        isLoading: isLoading,
      );


}
