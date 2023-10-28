import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsApproveUsecase {
  MrsApproveUsecase(this.repository);
  Repository repository;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        isLoading,
      );
  Future<bool> approveMrs({
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveMrs(
          approvetoJsonString: approvetoJsonString, isLoading: isLoading);
  Future<bool> rejectMrs({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectMrs(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);
  void saveValue({String? mrsId}) async =>
      repository.saveValue(LocalKeys.mrsId, mrsId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mrsId);
}
