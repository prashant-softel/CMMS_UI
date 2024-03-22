import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsViewUsecase {
  MrsViewUsecase(this.repository);
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
  void saveValue({String? mrsId}) async =>
      repository.saveValue(LocalKeys.mrsId, mrsId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.mrsId);
}
