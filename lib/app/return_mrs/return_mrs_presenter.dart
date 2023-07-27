import 'package:cmms/domain/models/get_mrs_list_model.dart';

import '../../domain/usecases/return_mrs_usecase.dart';

class ReturnMrsListPresenter {
  ReturnMrsListPresenter(this.returnmrsListUsecase);
  ReturnMrsListUsecase returnmrsListUsecase;
  Future<List<MrsListModel?>?> getMrsList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await returnmrsListUsecase.getMrsList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
}
