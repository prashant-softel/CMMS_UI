import 'package:cmms/domain/models/mrs_detail_model.dart';
import '../../domain/usecases/approve_return_mrs_usecase.dart';

class ApproveReturnMrsPresenter {
  ApproveReturnMrsPresenter(this.approveReturnMrsUsecase);
  ApproveReturnMrsUsecase approveReturnMrsUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await approveReturnMrsUsecase.getMrsDetails(
        mrsId: mrsId,
        isLoading: isLoading,
      );
  Future<bool> approveMrs({
    approvetoJsonString,
    required bool isLoading,
  }) async {
    return approveReturnMrsUsecase.approveMrs(
      approvetoJsonString: approvetoJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectMrs({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return approveReturnMrsUsecase.rejectMrs(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }
}
