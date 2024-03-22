import 'package:cmms/domain/models/get_return_mrs_detail.dart';

import '../../domain/usecases/view_return_mrs_usecase.dart';

class MrsReturnViewPresenter {
  MrsReturnViewPresenter(this.mrsReturnViewUsecase);
  MrsReturnViewUsecase mrsReturnViewUsecase;
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await mrsReturnViewUsecase.getReturnMrsDetails(
        mrsId: mrsId,
        facilityId:facilityId,
        isLoading: isLoading,
      );
  void saveValue({String? mrsId}) async {
    return mrsReturnViewUsecase.saveValue(mrsId: mrsId);
  }

  Future<String?> getValue() async => await mrsReturnViewUsecase.getValue();
}
