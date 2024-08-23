import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/usecases/view_warranty_claim_usecase.dart';

import '../../domain/models/facility_model.dart';

class ViewWarrantyClaimPresenter {
  ViewWarrantyClaimPresenter(this.viewWarrantyClaimUsecase);
  ViewWarrantyClaimUsecase viewWarrantyClaimUsecase;

  Future<void> generateToken() async {
    return await viewWarrantyClaimUsecase.generateToken();
  }

  Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
    bool? isLoading,
    required int wc_id,
    required int facilityId,
  }) async {
    return viewWarrantyClaimUsecase.getViewWarrantyClaimDetail(
      wc_id: wc_id,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<Map<String, dynamic>?> wcApprovedButton({
    WCApproveJsonString,
    required bool isLoading,
  }) async {
    return viewWarrantyClaimUsecase.wcApprovedButton(
      WCApproveJsonString: WCApproveJsonString,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> wcRejectdButton({
    WCRejectJsonString,
    required bool isLoading,
  }) async {
    return viewWarrantyClaimUsecase.wcRejectdButton(
      WCRejectJsonString: WCRejectJsonString,
      isLoading: isLoading,
    );
  }

  Future<List<HistoryModel>?> getWarrantyClaimHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewWarrantyClaimUsecase.getWarrantyClaimHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewWarrantyClaimUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await viewWarrantyClaimUsecase.getUserAccessList();

  ///
}
