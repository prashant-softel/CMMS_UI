import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/business_type_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/business_type_list_usecase.dart';
import '../../domain/usecases/preventive_list_usecase.dart';

class BusinessTypeListPresenter {
  BusinessTypeListPresenter(this.businesstypeListScreen);
  BusinessTypeListUsecase businesstypeListScreen;

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    bool? isLoading,
  }) async =>
      await businesstypeListScreen.getInventoryCategoryList(
        isLoading: isLoading ?? false,
      );
  Future<List<BusinessTypeModel?>?> getBusinessTypeList({
    int? businessType,
    // int? type,
    bool? isLoading,
  }) async =>
      await businesstypeListScreen.getBusinessTypeList(
        businessType: businessType ?? 0,
        // type: type,
        isLoading: isLoading ?? false,
      );
  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await businesstypeListScreen.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  // Future<bool> createBusinessListNumber({
  //   businesslistJsonString,
  //   required bool isLoading,
  // }) async {
  //   print("presenter");
  //   businesstypeListScreen.createBusinessListNumber(
  //     businesslistJsonString: businesslistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }

  // deleteCkecklist(String? checklist_id, {required bool isLoading}) async =>
  //     await businesstypeListScreen.deleteCkecklist(
  //       checklist_id: checklist_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateChecklistNumber(
  //     {checklistJsonString, required bool isLoading, checklistId}) async {
  //   print("presenter");
  //   businesstypeListScreen.updateChecklistNumber(
  //     checklistJsonString: checklistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
