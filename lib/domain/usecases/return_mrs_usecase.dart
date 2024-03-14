import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_return_mrs_list.dart';

class ReturnMrsListUsecase {
  final Repository _repository;

  ReturnMrsListUsecase(this._repository);
  Future<List<ReturnMrsListModel?>?> getReturnMrsList({
    int? facilityId,
    bool? isLoading,
    bool? isExport
  }) async =>
      await _repository.getReturnMrsList(facilityId, isLoading, isExport);
  void clearValue() async => _repository.clearData(LocalKeys.mrsId);
}
