import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';

import '../models/facility_model.dart';

class ViewWarrantyClaimUsecase {
  final Repository _repository;

  ViewWarrantyClaimUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }

  Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
    bool? isLoading,
    required int wc_id,
    required int facilityId,
  }) async =>
      await _repository.getViewWarrantyClaimDetail(
        wc_id: wc_id,
        facilityId: facilityId,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>> wcApprovedButton({
    WCApproveJsonString,
    bool? isLoading,
  }) async =>
      await _repository.wcApprovedButton(
        WCApproveJsonString,
        isLoading,
      );

  Future<Map<String, dynamic>> wcRejectdButton({
    WCRejectJsonString,
    bool? isLoading,
  }) async =>
      await _repository.wcRejectdButton(
        WCRejectJsonString,
        isLoading,
      );

  Future<List<HistoryModel>?> getWarrantyClaimHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
}
