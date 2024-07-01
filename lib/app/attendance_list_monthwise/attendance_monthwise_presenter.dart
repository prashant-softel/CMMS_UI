import 'package:cmms/domain/models/attendance_month_model.dart';
import 'package:cmms/domain/usecases/attendance_monthwise_usecase.dart';

class AttendanceListMonthPresenter {
  AttendanceListMonthPresenter(this.attendanceListMonthUsecase);
  AttendanceListMonthUsecase attendanceListMonthUsecase;

  Future<AttendanceMonthModel?> getAttendanceListMonthwise({
    required int facilityId,
    bool? isLoading,
  }) async =>
      await attendanceListMonthUsecase.getAttendanceListMonthwise(
        facilityId: facilityId,
        isLoading: isLoading,
      );
}
