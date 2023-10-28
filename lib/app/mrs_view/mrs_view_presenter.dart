import 'package:cmms/domain/models/mrs_detail_model.dart';

import '../../domain/usecases/mrs_view_usercase.dart';

class MrsViewPresenter {
  MrsViewPresenter(this.mrsViewUsecase);
  MrsViewUsecase mrsViewUsecase;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await mrsViewUsecase.getMrsDetails(
        mrsId: mrsId,
        isLoading: isLoading,
      );
  void saveValue({String? mrsId}) async {
    return mrsViewUsecase.saveValue(mrsId: mrsId);
  }

  Future<String?> getValue() async => await mrsViewUsecase.getValue();
}
