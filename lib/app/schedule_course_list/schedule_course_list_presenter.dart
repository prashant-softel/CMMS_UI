import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';

class ScheduleCourseListPresenter {
  ScheduleCourseListPresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);
}
