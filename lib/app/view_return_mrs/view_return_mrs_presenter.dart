import 'package:cmms/domain/models/mrs_detail_model.dart';

import '../../domain/usecases/view_return_mrs_usecase.dart';

class MrsReturnViewPresenter {
  MrsReturnViewPresenter(this.mrsReturnViewUsecase);
  MrsReturnViewUsecase mrsReturnViewUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await mrsReturnViewUsecase.getMrsDetails(
        mrsId: mrsId,
        isLoading: isLoading,
      );
}
