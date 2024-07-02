import 'package:cmms/domain/usecases/course_usecase.dart';
import 'package:cmms/domain/models/schedule_course_list_model.dart';

class ScheduleCourseListPresenter {
  ScheduleCourseListPresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  Future<List<ScheduleCourseListModel?>?> getScheduleCourseList({
    int? facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async =>
      await trainingUsecase.getScheduleCourseList(
        facilityId: facilityId,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
      );
  void clearValue() async => trainingUsecase.clearScheduleValue();
}
