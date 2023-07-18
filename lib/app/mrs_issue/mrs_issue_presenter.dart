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
  Future<bool> rejectMrs({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return mrsIssueUsecase.rejectMrs(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }
}
