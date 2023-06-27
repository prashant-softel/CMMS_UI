import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/safety_questions_list_usecase.dart';


class SafetyQuestionsListPresenter {
  SafetyQuestionsListPresenter(this.safetyQuestionsListUsecase);
  SafetyQuestionsListUsecase safetyQuestionsListUsecase;

 
     Future<List<TypePermitModel?>?> getTypePermitList(
      {required int facility_id}
     ) async =>
      await safetyQuestionsListUsecase.getTypePermitList(
        true,
        facility_id
        );

  Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required bool isLoading,
    required int? permit_type_id,
  }) async {
    return safetyQuestionsListUsecase.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
    );
  }

}
