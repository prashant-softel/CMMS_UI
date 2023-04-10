import 'package:cmms/domain/domain.dart';

import '../models/business_list_model.dart';

class CalibrationListUsecase {
  final Repository _repository;

  CalibrationListUsecase(this._repository);
  Future<List<BusinessListModel>> getBusinessList({
    required bool isLoading,
    required int? businessType,
  }) async {
    return _repository.getBusinessList(
      isLoading: isLoading,
      businessType: businessType,
    );
  }
}
