import 'package:cmms/domain/models/equipment_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/mc_details_plan_model.dart';
import 'package:cmms/domain/usecases/view_mc_planing_usecase.dart';

class ViewMcPlaningPresenter {
  ViewMcPlaningPresenter(this.viewMcPlaningUsecase);
  ViewMcPlaningUsecase viewMcPlaningUsecase;

  Future<McPalningDetailsModel?> getMcPlanDetail({
    bool? isLoading,
    required int planId,
    required int facilityId,
  }) async {
    return viewMcPlaningUsecase.getMcPlanDetail(
      planId: planId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<HistoryModel>?> getHistory(
    moduleType,
    id,
    facilityId,
    isLoading,
  ) async =>
      await viewMcPlaningUsecase.getHistory(
        moduleType: moduleType,
        id: id,
        facilityId: facilityId,
        isLoading: isLoading,
      );

  Future<List<EquipmentListModel>> getEquipmentModelList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return viewMcPlaningUsecase.getEquipmentModelList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<Map<String, dynamic>?> mcPlanApprovedButton(
      {mcApproveJsonString, required bool isLoading, int? facility_id}) async {
    return viewMcPlaningUsecase.mcPlanApprovedButton(
        mcApproveJsonString: mcApproveJsonString,
        isLoading: isLoading,
        facility_id: facility_id);
  }

  Future<Map<String, dynamic>?> mcPlanRejectButton(
      {mcRejectJsonString, required bool isLoading, int? facility_id}) async {
    return viewMcPlaningUsecase.mcPlanRejectButton(
        mcRejectJsonString: mcRejectJsonString,
        isLoading: isLoading,
        facility_id: facility_id);
  }

  void saveValue({String? mcid}) async {
    return viewMcPlaningUsecase.saveValue(mcid: mcid);
  }

  Future<String?> getValue() async => await viewMcPlaningUsecase.getValue();
}
