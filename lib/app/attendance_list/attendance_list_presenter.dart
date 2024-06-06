import 'package:cmms/domain/models/attendance_list_model.dart';
import 'package:cmms/domain/usecases/attendance_list_usecase.dart';

class AttendanceListPresenter {
  AttendanceListPresenter(this.attendanceListUsecase);
  AttendanceListUsecase attendanceListUsecase;

  Future<List<AttendanceListModel>> getAttendanceList({
    required int facilityId,
    required String year,
    bool? isLoading,
  }) async {
    return attendanceListUsecase.getAttendanceList(
      facilityId: facilityId,
      year: year,
      isLoading: isLoading,
    );
  }
}
