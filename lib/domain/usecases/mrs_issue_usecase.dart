import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsIssueUsecase {
  MrsIssueUsecase(this.repository);
  Repository repository;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        isLoading,
      );
  Future<bool> issueMrs({
    issuetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.issueMrs(
          issuetoJsonString: issuetoJsonString, isLoading: isLoading);
  void saveValue({String? mrsId}) async =>
      repository.saveValue(LocalKeys.mrsId, mrsId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mrsId);
}
