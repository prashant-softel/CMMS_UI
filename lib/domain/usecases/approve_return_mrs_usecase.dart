import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ApproveReturnMrsUsecase {
  ApproveReturnMrsUsecase(this.repository);
  Repository repository;
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getReturnMrsDetails(
        mrsId,
        isLoading,
      );
  Future<bool> approveReturnMrs({
    approvetoJsonString,
    bool? isLoading,
  }) async =>
      await repository.approveReturnMrs(
          approvetoJsonString: approvetoJsonString, isLoading: isLoading);
  Future<bool> rejectRetrunMrs({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectRetrunMrs(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);
}
