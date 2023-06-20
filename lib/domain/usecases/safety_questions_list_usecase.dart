import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/frequency_model.dart';

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

       
}
