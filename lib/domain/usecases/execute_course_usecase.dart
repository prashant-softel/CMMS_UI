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
}
