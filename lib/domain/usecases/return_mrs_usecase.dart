import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';

class ReturnMrsListUsecase {
  final Repository _repository;

  ReturnMrsListUsecase(this._repository);
  Future<List<MrsListModel?>?> getMrsList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await _repository.getMrsList(facilityId, isLoading, startDate, endDate);
}
