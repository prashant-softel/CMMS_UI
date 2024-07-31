import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsApproveUsecase {
  MrsApproveUsecase(this.repository);
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
  Future<bool> approveMrs({
    approvetoJsonString,
    int? type,
    bool? isLoading,
  }) async =>
      await repository.approveMrs(
          approvetoJsonString: approvetoJsonString,
          type: type,
          isLoading: isLoading);
  Future<bool> rejectMrs({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectMrs(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);
  void saveValue({String? mrsId}) async =>
      repository.saveValue(LocalKeys.mrsId, mrsId);
  void clearValue() async => repository.clearData(LocalKeys.mrsId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mrsId);
  void saveValuee({String? type}) async =>
      repository.saveValue(LocalKeys.type, type);
  Future<String?> getValuee() async =>
      await repository.getStringValue(LocalKeys.type);
}
