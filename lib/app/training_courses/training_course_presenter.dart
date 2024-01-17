import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/usecases/course_usecase.dart';

class TrainingPresenter {
  TrainingPresenter(this.trainingUsecase);
  CourseUsecase trainingUsecase;

  ///

  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await trainingUsecase.getFacilityList(isLoading: isLoading);
}
