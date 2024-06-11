import '../../domain/models/get_return_mrs_detail.dart';
import '../../domain/usecases/approve_return_mrs_usecase.dart';

class ApproveReturnMrsPresenter {
  ApproveReturnMrsPresenter(this.approveReturnMrsUsecase);
  ApproveReturnMrsUsecase approveReturnMrsUsecase;
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await approveReturnMrsUsecase.getReturnMrsDetails(
        mrsId: mrsId,
        facilityId:facilityId,
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

  void saveValue({String? mrsId}) async {
    return approveReturnMrsUsecase.saveValue(mrsId: mrsId);
  }
  void saveValuee({String? type}) async {
    return approveReturnMrsUsecase.saveValuee(type: type);
  }
  Future<String?> getValue() async => await approveReturnMrsUsecase.getValue();
  Future<String?> getValuee() async => await approveReturnMrsUsecase.getValuee();

}
