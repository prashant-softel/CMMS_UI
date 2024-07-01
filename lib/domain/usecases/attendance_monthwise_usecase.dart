import 'package:cmms/domain/models/attendance_month_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AttendanceListMonthUsecase {
  AttendanceListMonthUsecase(this.repository);
  Repository repository;

  Future<AttendanceMonthModel?> getAttendanceListMonthwise({
    required int facilityId,
    bool? isLoading,
  }) async {
    return repository.getAttendanceListMonthwise(
      facilityId: facilityId,
      isLoading: isLoading,
    );
  }
}
