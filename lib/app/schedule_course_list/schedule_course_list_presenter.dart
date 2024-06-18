import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/schedule_course_list_model.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';

class ScheduleCourseListPresenter {
  ScheduleCourseListPresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);

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
}
