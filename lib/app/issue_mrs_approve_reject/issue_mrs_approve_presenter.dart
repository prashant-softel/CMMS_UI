import 'package:cmms/domain/models/mrs_detail_model.dart';

import '../../domain/usecases/issue_mrs_approve_usecase.dart';

class IssueMrsApprovePresenter {
  IssueMrsApprovePresenter(this.issuemrsApproveUsecase);
  IssueMrsApproveUsecase issuemrsApproveUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await issuemrsApproveUsecase.getMrsDetails(
        mrsId: mrsId,
        facilityId:facilityId,
        isLoading: isLoading,
      );
  Future<bool> approveIssueMrs({
    issuemrsapprovetoJsonString,
    required bool isLoading,int?facility_id
  }) async {
    return issuemrsApproveUsecase.approveIssueMrs(
      issuemrsapprovetoJsonString: issuemrsapprovetoJsonString,
      isLoading: isLoading,facility_id:facility_id
    );
  }

  Future<bool> rejectIssueMrs({
    rejectIssuetoJsonString,
    required bool isLoading,int?facility_id
  }) async {
    return issuemrsApproveUsecase.rejectIssueMrs(
      rejectIssuetoJsonString: rejectIssuetoJsonString,
      isLoading: isLoading,facility_id:facility_id
    );
  }

  void saveValue({String? mrsId}) async {
    return issuemrsApproveUsecase.saveValue(mrsId: mrsId);
  }

  Future<String?> getValue() async => await issuemrsApproveUsecase.getValue();
}
