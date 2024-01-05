import 'package:cmms/domain/usecases/responsibility_usecase.dart';

import '../../domain/models/designation_model.dart';

class ResponsibilityListPresenter {
  ResponsibilityListPresenter(this.responsibilityUsecase);
  ResponsibilitylistUsecase responsibilityUsecase;

  Future<List<DesignationModel?>?> getResponsibilityList({
    bool? isLoading,
  }) async =>
      await responsibilityUsecase.getResponsibilityList(
        isLoading: isLoading ?? false,
      );

  Future<bool> createResponsibility({
    designationJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    responsibilityUsecase.createResponsibility(
      designationJsonString: designationJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteResponsibility(String? module_id, {required bool isLoading}) async =>
      await responsibilityUsecase.deleteResponsibility(
        module_id: module_id ?? 0,
        isLoading: isLoading,
      );

  Future<bool> updateResponsibility(
      {designationJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    responsibilityUsecase.updateResponsibility(
      designationJsonString: designationJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
