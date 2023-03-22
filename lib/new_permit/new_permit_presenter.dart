import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/preventive_list_usecase.dart';
import '../domain/usecases/breakdown_usecase.dart';

class NewPermitPresenter {
  NewPermitPresenter(this.newPermitUsecase);
  NewPermitUsecase newPermitUsecase;

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await newPermitUsecase.getFacilityList();
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


