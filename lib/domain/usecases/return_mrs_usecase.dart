import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_return_mrs_list.dart';

class ReturnMrsListUsecase {
  final Repository _repository;

  ReturnMrsListUsecase(this._repository);
  Future<List<ReturnMrsListModel?>?> getReturnMrsList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await _repository.getReturnMrsList(facilityId, isLoading);
}
