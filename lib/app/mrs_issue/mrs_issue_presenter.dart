import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/usecases/mrs_issue_usecase.dart';

class MrsIssuePresenter {
  MrsIssuePresenter(this.mrsIssueUsecase);
  MrsIssueUsecase mrsIssueUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await mrsIssueUsecase.getMrsDetails(
        mrsId: mrsId,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<bool> issueMrs(
      {issuetoJsonString,
      int? type,
      required bool isLoading,
      int? facility_id}) async {
    return mrsIssueUsecase.issueMrs(
        issuetoJsonString: issuetoJsonString,
        isLoading: isLoading,
        facility_id: facility_id);
  }

  void saveValue({String? mrsId}) async {
    return mrsIssueUsecase.saveValue(mrsId: mrsId);
  }

  void saveValuee({String? type}) async {
    return mrsIssueUsecase.saveValuee(type: type);
  }

  void clearValue() async {
    return mrsIssueUsecase.clearValue();
  }

  void clearValuee() async {
    return mrsIssueUsecase.clearValuee();
  }

  Future<String?> getValue() async => await mrsIssueUsecase.getValue();
  Future<String?> getValuee() async => await mrsIssueUsecase.getValue();
}
