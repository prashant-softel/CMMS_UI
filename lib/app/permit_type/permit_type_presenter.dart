import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/permit_type_usecase.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/preventive_list_usecase.dart';

class PermitTypePresenter {
  PermitTypePresenter(this.permitTypeUsecase);
  PermitTypeUsecase permitTypeUsecase;

  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   bool? isLoading,
  // }) async =>
  //     await permitTypeUsecase.getInventoryCategoryList(
  //       isLoading: isLoading ?? false,
  //     );
  // Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
  //   int? facilityId,
  //   int? type,
  //   bool? isLoading,
  // }) async =>
  //     await permitTypeUsecase.getPreventiveCheckList(
  //       facilityId: facilityId ?? 0,
  //       type: type,
  //       isLoading: isLoading ?? false,
  //     );
  // Future<List<FrequencyModel?>?> getFrequencyList({
  //   bool? isLoading,
  // }) async =>
  //     await permitTypeUsecase.getFrequencyList(
  //       isLoading: isLoading ?? false,
  //     );
  // Future<bool> createChecklistNumber({
  //   checklistJsonString,
  //   required bool isLoading,
  // }) async {
  //   print("presenter");
  //    permitTypeUsecase.createChecklistNumber(
  //     checklistJsonString: checklistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
  Future<List<TypePermitModel?>?> getTypePermitList() async =>
      await permitTypeUsecase.getTypePermitList(true);

}
