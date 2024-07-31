import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/usecases/mrs_approve_usecase.dart';

class MrsApprovePresenter {
  MrsApprovePresenter(this.mrsApproveUsecase);
  MrsApproveUsecase mrsApproveUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await mrsApproveUsecase.getMrsDetails(
        mrsId: mrsId,
        facilityId: facilityId,
        isLoading: isLoading,
      );
  Future<bool> approveMrs({
    approvetoJsonString,
    int? type,
    required bool isLoading,
  }) async {
    return mrsApproveUsecase.approveMrs(
      approvetoJsonString: approvetoJsonString,
      type:type,
      isLoading: isLoading,
    );
  }

  Future<bool> rejectMrs({
    rejecttoJsonString,
    required bool isLoading,
  }) async {
    return mrsApproveUsecase.rejectMrs(
      rejecttoJsonString: rejecttoJsonString,
      isLoading: isLoading,
    );
  }

  void saveValue({String? mrsId}) async {
    return mrsApproveUsecase.saveValue(mrsId: mrsId);
  }
  void clearValue() async {
    return mrsApproveUsecase.clearValue();
  }
  void clearValuee() async {
    return mrsApproveUsecase.clearValuee();
  }

  Future<String?> getValue() async => await mrsApproveUsecase.getValue();
  void saveValuee({String? type}) async {
    return mrsApproveUsecase.saveValuee(type: type);
  }

  Future<String?> getValuee() async => await mrsApproveUsecase.getValuee();
}
