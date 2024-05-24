import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/usecases/view_course_usecase.dart';

class ViewCoursePresenter {
  ViewCoursePresenter(this.viewCourseUsecase);
  ViewCourseUsecase viewCourseUsecase;

  Future<TrainingCourseListModel> getCourseDetails({
    int? courseId,
    bool? isLoading,
  }) async =>
      await viewCourseUsecase.getCourseDetails(
        courseId: courseId,
        isLoading: isLoading,
      );

  void saveValue({String? courseId}) async {
    return viewCourseUsecase.saveValue(courseId: courseId);
  }

  void clearValue() async => viewCourseUsecase.clearValue();

  Future<String?> getValue() async => await viewCourseUsecase.getValue();
}
