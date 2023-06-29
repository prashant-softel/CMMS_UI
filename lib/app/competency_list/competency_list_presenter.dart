import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/competency_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/competency_list_usecase.dart';

class CompetencyListPresenter {
  CompetencyListPresenter(this.competencylistUsecase);
  CompetencylistUsecase competencylistUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await competencylistUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<CompetencyModel?>?> getCompetencyList({

    bool? isLoading,
  }) async =>
      await competencylistUsecase.getCompetencyList(
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await competencylistUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createCompetency({
    competencyJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    competencylistUsecase.createCompetency(
      competencyJsonString: competencyJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteCompetencyList(String? checklist_id, {required bool isLoading}) async =>
      await competencylistUsecase.deleteCompetencyList(
        checklist_id: checklist_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateCompetency(
      {competencyJsonString, required bool isLoading, checklistId}) async {
    print("presenter");
    competencylistUsecase.updateCompetency(
      competencyJsonString: competencyJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
