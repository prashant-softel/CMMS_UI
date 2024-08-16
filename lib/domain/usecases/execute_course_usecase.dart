import 'package:cmms/domain/models/schedule_course_details_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ExecuteCourseUsecase {
  ExecuteCourseUsecase(this.repository);
  Repository repository;

  Future<ScheduleCourseDetails> getScheduleCourseDetails({
    int? schedule_id,
    bool? isLoading,
  }) async =>
      await repository.getScheduleCourseDetails(
        schedule_id: schedule_id,
        isLoading: isLoading,
      );

  Future<Map<String, dynamic>> executeCourse({
    executeCourseJson,
    isLoading,
  }) async {
    return await repository.executeCourse(
      executeCourseJson: executeCourseJson,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>> approveCourseSchedule({
    approveSchedule,
    bool? isLoading,
  }) async =>
      await repository.approveCourseSchedule(
        approveSchedule,
        isLoading,
      );

  Future<Map<String, dynamic>> rejectCourseSchedule({
    rejectSchedule,
    bool? isLoading,
  }) async =>
      await repository.rejectCourseSchedule(
        rejectSchedule,
        isLoading,
      );

  void saveValue({String? schedule_id}) async => repository.saveValue(
        LocalKeys.schedule_id,
        schedule_id,
      );
  Future<String?> getValue() async => await repository.getStringValue(
        LocalKeys.schedule_id,
      );
  void clearValue() async => repository.clearData(
        LocalKeys.schedule_id,
      );
  void saveTypeValue({String? type}) async => repository.saveValue(
        LocalKeys.viewtype,
        type,
      );
  Future<String?> getTypeValue() async => await repository.getStringValue(
        LocalKeys.viewtype,
      );
  void clearTypeValue() async => repository.clearData(
        LocalKeys.viewtype,
      );
}
