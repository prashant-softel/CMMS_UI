import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsIssueUsecase {
  MrsIssueUsecase(this.repository);
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
  Future<bool> issueMrs(
          {issuetoJsonString,
          int? type,
          bool? isLoading,
          int? facility_id,
          int? route}) async =>
      await repository.issueMrs(
          issuetoJsonString: issuetoJsonString,
          type: type,
          isLoading: isLoading,
          facility_id: facility_id,
          route: route);
  void saveValue({String? mrsId}) async =>
      repository.saveValue(LocalKeys.mrsId, mrsId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mrsId);
  void saveValuee({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  void clearValue() async => repository.clearData(LocalKeys.mrsId);
  void clearValuee() async => repository.clearData(LocalKeys.type);

  Future<String?> getValuee() async =>
      await repository.getStringValue(LocalKeys.type);
}
