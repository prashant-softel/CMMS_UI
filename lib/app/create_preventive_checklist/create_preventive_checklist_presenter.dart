import 'package:cmms/domain/usecases/create_preventivechecklist_usecase.dart';

import '../../domain/models/facility_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';

class CreateCheckListPresenter {
  CreateCheckListPresenter(this.createPreventiveChecklistUsecase);
  CreatePreventiveChecklistUsecase createPreventiveChecklistUsecase;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await createPreventiveChecklistUsecase.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await createPreventiveChecklistUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createChecklistNumber({
    checklistJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
     createPreventiveChecklistUsecase.createChecklistNumber(
      checklistJsonString: checklistJsonString,
      isLoading: isLoading,
    );
    return true;
  } Future<List<FacilityModel?>?> getFacilityList() async =>
      await createPreventiveChecklistUsecase.getFacilityList();
 
  }

