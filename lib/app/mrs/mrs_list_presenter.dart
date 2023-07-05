import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:cmms/domain/usecases/mrs_list_usecase.dart';

class MrsListPresenter {
  MrsListPresenter(this.mrsListUsecase);
  MrsListUsecase mrsListUsecase;
  Future<List<MrsListModel?>?> getMrsList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await mrsListUsecase.getMrsList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
}
