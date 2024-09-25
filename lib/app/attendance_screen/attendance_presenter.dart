import 'package:cmms/domain/models/attendance_model.dart';
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
  Future<AttendaceModel?> getAttendanceDetail({
    required int facilityId,
    required String date,
    bool? isLoading,
  }) async =>
      await attendanceUsecase.getAttendanceDetail(
        facilityId: facilityId,
        date: date,
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
  Future<bool> updateAttendance({
    jsonEmployeeAttendance,
    isLoading,
  }) async =>
      await attendanceUsecase.updateAttendance(
        jsonEmployeeAttendance: jsonEmployeeAttendance,
        isLoading: isLoading,
      );
  void saveDate({String? date}) async {
    return attendanceUsecase.saveDateValue(date: date);
  }

  Future<String?> getDate() async => await attendanceUsecase.getDateValue();

  void clearDateValue() async => attendanceUsecase.clearDateValue();
}
