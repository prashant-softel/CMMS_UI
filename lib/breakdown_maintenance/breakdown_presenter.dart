import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/preventive_list_usecase.dart';
import '../domain/usecases/breakdown_usecase.dart';

class BreakdownMaintenancePresenter {
  BreakdownMaintenancePresenter(this.breakdownMaintenanceUsecase);
  BreakdownMaintenanceUsecase breakdownMaintenanceUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await breakdownMaintenanceUsecase.getFacilityList();
  // Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
  //   bool? isLoading,
  // }) async =>
  //     await BreakdownMaintenanceUsecase.getInventoryCategoryList(
  //       isLoading: isLoading ?? false,
  //     );
  // Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
  //   int? facilityId,
  //   int? type,
  //   bool? isLoading,
  // }) async =>
  //     await preventivelistUsecase.getPreventiveCheckList(
  //       facilityId: facilityId ?? 0,
  //       type: type,
  //       isLoading: isLoading ?? false,
  //     );
}


