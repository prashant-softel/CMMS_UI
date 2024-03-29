import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/repositories/repository.dart';


class SafetyQuestionsListUsecase {
  SafetyQuestionsListUsecase(this.repository);
  Repository repository;

 Future<List<TypePermitModel?>?> getTypePermitList(
   bool? isLoading,
  int? facility_id
  ) async =>
      await repository.getTypePermitList(
        isLoading,
        facility_id
        );
      
   Future<List<SafetyMeasureListModel>> getSafetyMeasureList({
    required bool isLoading,
    required int? permit_type_id
   
  }) async {
    return repository.getSafetyMeasureList(
      isLoading: isLoading,
      permit_type_id: permit_type_id,
  
    );
  }

  deleteSafetyMeasure(
      {required Object id, required bool isLoading}) async =>
      await repository.deleteSafetyMeasure(
        id,
        isLoading,
      );

  Future<bool> createSafetyMeasure({
    safetyMeasurelistJsonString,
    bool? isLoading,
  }) async =>
      await repository.createSafetyMeasure(
          isLoading: isLoading, safetyMeasurelistJsonString: safetyMeasurelistJsonString);

  Future<bool> updateSafetyMeasure({
    createSafetyMeasureJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateSafetyMeasure(
          isLoading: isLoading, createSafetyMeasureJsonString: createSafetyMeasureJsonString);
}
