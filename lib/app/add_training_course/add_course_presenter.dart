import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';

class AddCoursePresenter {
  AddCoursePresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  Future<Map<String,dynamic>> addCourse({
    courseJson,
    isLoading,
  }) async {
    return await trainingUsecase.addCourse(
      courseJson: courseJson,
      isLoading: isLoading,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);
}
