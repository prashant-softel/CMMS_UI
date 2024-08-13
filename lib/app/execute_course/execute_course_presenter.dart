import 'package:cmms/domain/models/schedule_course_details_model.dart';
import 'package:cmms/domain/usecases/execute_course_usecase.dart';

class ExecuteCoursePresenter {
  ExecuteCoursePresenter(this.trainingUsecase);
  ExecuteCourseUsecase trainingUsecase;

  Future<ScheduleCourseDetails> getScheduleCourseDetails({
    int? schedule_id,
    bool? isLoading,
  }) async =>
      await trainingUsecase.getScheduleCourseDetails(
        schedule_id: schedule_id,
        isLoading: isLoading,
      );

  Future<Map<String, dynamic>> executeCourse({
    executeCourseJson,
    isLoading,
  }) async {
    return await trainingUsecase.executeCourse(
      executeCourseJson: executeCourseJson,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>> approveCourseSchedule({
    approveSchedule,
    required bool isLoading,
  }) async {
    return trainingUsecase.approveCourseSchedule(
      approveSchedule:  approveSchedule,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>> rejectCourseSchedule({
    rejectSchedule,
    required bool isLoading,
  }) async {
    return trainingUsecase.rejectCourseSchedule(
      rejectSchedule: rejectSchedule,
      isLoading: isLoading,
    );
  }

  void saveValue({String? schedule_id}) async {
    return trainingUsecase.saveValue(schedule_id: schedule_id);
  }

  void clearValue() async => trainingUsecase.clearValue();

  Future<String?> getValue() async => await trainingUsecase.getValue();
  void saveTypeValue({String? type}) async {
    return trainingUsecase.saveTypeValue(type: type);
  }

  void clearTypeValue() async => trainingUsecase.clearTypeValue();

  Future<String?> getTypeValue() async => await trainingUsecase.getTypeValue();
}
