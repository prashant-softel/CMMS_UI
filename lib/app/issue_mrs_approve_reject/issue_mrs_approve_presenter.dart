import 'package:cmms/domain/models/mrs_detail_model.dart';

import '../../domain/usecases/issue_mrs_approve_usecase.dart';

class IssueMrsApprovePresenter {
  IssueMrsApprovePresenter(this.issuemrsApproveUsecase);
  IssueMrsApproveUsecase issuemrsApproveUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await issuemrsApproveUsecase.getMrsDetails(
        mrsId: mrsId,
        isLoading: isLoading,
      );
  Future<bool> approveIssueMrs({
    issuemrsapprovetoJsonString,
    required bool isLoading,
  }) async {
    return issuemrsApproveUsecase.approveIssueMrs(
      issuemrsapprovetoJsonString: issuemrsapprovetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectIssueMrs({
    rejectIssuetoJsonString,
    required bool isLoading,
  }) async {
    return issuemrsApproveUsecase.rejectIssueMrs(
      rejectIssuetoJsonString: rejectIssuetoJsonString,
      isLoading: isLoading,
    );
  }

  void saveValue({String? mrsId}) async {
    return issuemrsApproveUsecase.saveValue(mrsId: mrsId);
  }

  Future<String?> getValue() async => await issuemrsApproveUsecase.getValue();
}
