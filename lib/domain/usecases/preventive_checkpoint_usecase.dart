import 'package:cmms/domain/repositories/repository.dart';

import '../models/preventive_checklist_model.dart';

class PreventiveCheckPointUsecase {
  PreventiveCheckPointUsecase(this.repository);
  Repository repository;
  Future<List<PreventiveCheckListModel?>?> getPreventiveCheckList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getPreventiveCheckList(
        type,
        facilityId,
        isLoading,
      );
}
