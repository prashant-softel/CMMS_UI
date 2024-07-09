import 'package:cmms/domain/models/attendance_month_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AttendanceListMonthUsecase {
  AttendanceListMonthUsecase(this.repository);
  Repository repository;

  Future<AttendanceMonthModel?> getAttendanceListMonthwise({
    required int facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async {
    return repository.getAttendanceListMonthwise(
      facilityId: facilityId,
      start_date: start_date,
      end_date: end_date,
      isLoading: isLoading,
    );
  }
}
