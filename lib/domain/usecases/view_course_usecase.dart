import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ViewCourseUsecase {
  ViewCourseUsecase(this.repository);
  Repository repository;

  Future<TrainingCourseListModel> getCourseDetails({
    int? courseId,
    bool? isLoading,
  }) async =>
      await repository.getCourseDetails(
        courseId: courseId,
        isLoading: isLoading,
      );

  void saveValue({String? courseId}) async => repository.saveValue(
        LocalKeys.courseId,
        courseId,
      );
  Future<String?> getValue() async => await repository.getStringValue(
        LocalKeys.courseId,
      );
  void clearValue() async => repository.clearData(
        LocalKeys.courseId,
      );
}
