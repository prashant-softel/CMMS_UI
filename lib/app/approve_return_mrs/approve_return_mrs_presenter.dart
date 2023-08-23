import '../../domain/models/get_return_mrs_detail.dart';
import '../../domain/usecases/approve_return_mrs_usecase.dart';

class ApproveReturnMrsPresenter {
  ApproveReturnMrsPresenter(this.approveReturnMrsUsecase);
  ApproveReturnMrsUsecase approveReturnMrsUsecase;
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await approveReturnMrsUsecase.getReturnMrsDetails(
        mrsId: mrsId,
        isLoading: isLoading,
      );
  Future<bool> approveReturnMrs({
    approvetoJsonString,
    required bool isLoading,
  }) async {
    return approveReturnMrsUsecase.approveReturnMrs(
      approvetoJsonString: approvetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectRetrunMrs({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return approveReturnMrsUsecase.rejectRetrunMrs(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }
}
