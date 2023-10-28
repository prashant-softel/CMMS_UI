import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/usecases/mrs_issue_usecase.dart';

class MrsIssuePresenter {
  MrsIssuePresenter(this.mrsIssueUsecase);
  MrsIssueUsecase mrsIssueUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await mrsIssueUsecase.getMrsDetails(
        mrsId: mrsId,
        isLoading: isLoading,
      );
  Future<bool> issueMrs({
    issuetoJsonString,
    required bool isLoading,
  }) async {
    return mrsIssueUsecase.issueMrs(
      issuetoJsonString: issuetoJsonString,
      isLoading: isLoading,
    );
  }

  void saveValue({String? mrsId}) async {
    return mrsIssueUsecase.saveValue(mrsId: mrsId);
  }

  Future<String?> getValue() async => await mrsIssueUsecase.getValue();
}
