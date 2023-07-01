import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

import '../models/competency_model.dart';
import '../models/frequency_model.dart';

class CompetencylistUsecase {
  CompetencylistUsecase(this.repository);
  Repository repository;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getInventoryCategoryList(
        auth,
        facilityId,
        isLoading,
      );
  Future<List<CompetencyModel?>?> getCompetencyList({
    bool? isLoading,
  }) async =>
      await repository.getCompetencyList(
        isLoading,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await repository.getFrequencyList(
        isLoading,
      );
  Future<bool> createCompetency({
    competencyJsonString,
    bool? isLoading,
  }) async =>
      await repository.createCompetency(
          isLoading: isLoading, competencyJsonString: competencyJsonString);
  deleteCompetencyList(
          {required Object checklist_id, required bool isLoading}) async =>
      await repository.deleteCompetencyList(
        checklist_id,
        isLoading,
      );
  Future<bool> updateCompetency({
    competencyJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateCompetency(
        isLoading: isLoading,
        competencyJsonString: competencyJsonString,
      );
}
