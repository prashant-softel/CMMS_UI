import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/usecases/mrs_approve_usecase.dart';

class MrsApprovePresenter {
  MrsApprovePresenter(this.mrsApproveUsecase);
  MrsApproveUsecase mrsApproveUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await mrsApproveUsecase.getMrsDetails(
        mrsId: mrsId,
        isLoading: isLoading,
      );
}
