import 'package:cmms/domain/models/attendance_month_model.dart';
import 'package:cmms/domain/usecases/attendance_monthwise_usecase.dart';

class AttendanceListMonthPresenter {
  AttendanceListMonthPresenter(this.attendanceListMonthUsecase);
  AttendanceListMonthUsecase attendanceListMonthUsecase;

  Future<AttendanceMonthModel?> getAttendanceListMonthwise({
    required int facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async =>
      await attendanceListMonthUsecase.getAttendanceListMonthwise(
        facilityId: facilityId,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
      );
}
