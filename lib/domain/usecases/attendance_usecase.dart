import 'package:cmms/domain/models/attendance_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AttendanceUsecase {
  AttendanceUsecase(this.repository);
  Repository repository;

  Future<List<EmployeeModel>?>? getEmployeeListByFacilityId({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getEmployeeListByFacilityId(
        facility_id: facilityId,
        isLoading: isLoading,
      );

  Future<AttendaceModel?> getAttendanceDetail({
    required int facilityId,
    required String date,
    bool? isLoading,
  }) async =>
      await repository.getAttendanceDetail(
        facilityId: facilityId,
        date: date,
        isLoading: isLoading,
      );

  Future<bool> addAttendance({
    jsonEmployeeAttendance,
    isLoading,
  }) async =>
      await repository.addAttendance(
        jsonEmployeeAttendance,
        isLoading,
      );
  Future<bool> updateAttendance({
    jsonEmployeeAttendance,
    isLoading,
  }) async =>
      await repository.updateAttendance(
        jsonEmployeeAttendance,
        isLoading,
      );

  void saveDateValue({String? date}) async =>
      repository.saveValue(LocalKeys.date, date);
  Future<String?> getDateValue() async =>
      await repository.getStringValue(LocalKeys.date);
  void clearDateValue() async => repository.clearData(LocalKeys.date);
}
