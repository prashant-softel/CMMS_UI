import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';

class TrainingPresenter {
  TrainingPresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  Future<List<FacilityModel?>?> getFacilityList({
    bool? isLoading,
  }) async =>
      await trainingUsecase.getFacilityList(
        isLoading: isLoading,
      );

  Future<List<TrainingCourseListModel?>?> getTrainingCourseList({
    int? facilityId,
    String? start_date,
    String? end_date,
    bool? isLoading,
  }) async =>
      await trainingUsecase.getTrainingCourseList(
        facilityId: facilityId,
        start_date: start_date,
        end_date: end_date,
        isLoading: isLoading,
      );

  deleteTrainingCourse({int? courseId, required bool isLoading}) async =>
      await trainingUsecase.deleteTrainingCourse(
        courseId: courseId,
        isLoading: isLoading,
      );

  void clearValue() async => trainingUsecase.clearValue();
  
  void clearScheduleValue() async => trainingUsecase.clearScheduleValue();
  void clearTypeValue() async => trainingUsecase.clearTypeValue();

}
