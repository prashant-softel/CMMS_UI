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

  void saveValue({String? schedule_id}) async {
    return trainingUsecase.saveValue(schedule_id: schedule_id);
  }

  void clearValue() async => trainingUsecase.clearValue();

  Future<String?> getValue() async => await trainingUsecase.getValue();
}
