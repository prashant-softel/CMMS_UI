import 'package:cmms/domain/models/get_return_mrs_list.dart';

import '../../domain/usecases/return_mrs_usecase.dart';

class ReturnMrsListPresenter {
  ReturnMrsListPresenter(this.returnmrsListUsecase);
  ReturnMrsListUsecase returnmrsListUsecase;
  Future<List<ReturnMrsListModel?>?> getReturnMrsList({
    int? facilityId,
    bool? isLoading,
    bool? isExport
  }) async =>
      await returnmrsListUsecase.getReturnMrsList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
        isExport: isExport
      );
  void clearValue() async => returnmrsListUsecase.clearValue();
}
