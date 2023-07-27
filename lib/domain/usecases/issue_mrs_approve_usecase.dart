import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class IssueMrsApproveUsecase {
  IssueMrsApproveUsecase(this.repository);
  Repository repository;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        isLoading,
      );
  Future<bool> approveIssueMrs({
    issuemrsapprovetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveIssueMrs(
          issuemrsapprovetoJsonString: issuemrsapprovetoJsonString,
          isLoading: isLoading);
  Future<bool> rejectIssueMrs({
    rejectIssuetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectIssueMrs(
          rejectIssuetoJsonString: rejectIssuetoJsonString,
          isLoading: isLoading);
}
