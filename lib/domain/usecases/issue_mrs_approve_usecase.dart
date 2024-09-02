import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class IssueMrsApproveUsecase {
  IssueMrsApproveUsecase(this.repository);
  Repository repository;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        facilityId,
        isLoading,
      );
  Future<bool> approveIssueMrs(
          {issuemrsapprovetoJsonString,
          bool? isLoading,
          int? facility_id}) async =>
      await repository.approveIssueMrs(
          issuemrsapprovetoJsonString: issuemrsapprovetoJsonString,
          isLoading: isLoading,
          facility_id: facility_id);
  Future<bool> rejectIssueMrs(
          {rejectIssuetoJsonString, bool? isLoading, int? facility_id}) async =>
      await repository.rejectIssueMrs(
          rejectIssuetoJsonString: rejectIssuetoJsonString,
          isLoading: isLoading,
          facility_id: facility_id);
  void saveValue({String? mrsId}) async =>
      repository.saveValue(LocalKeys.mrsId, mrsId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mrsId);
}
