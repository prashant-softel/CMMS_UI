import 'package:cmms/domain/models/attendance_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class AttendanceListUsecase {
  AttendanceListUsecase(this.repository);
  Repository repository;

  Future<List<AttendanceListModel>> getAttendanceList({
    required int facilityId,
    required String year,
    bool? isLoading,
  }) async {
    return repository.getAttendanceList(
      facilityId: facilityId,
      year: year,
      isLoading: isLoading,
    );
  }
}
