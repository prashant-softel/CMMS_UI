import 'package:cmms/domain/usecases/responsibility_usecase.dart';

import '../../domain/models/designation_model.dart';

class ResponsibilityListPresenter {
  ResponsibilityListPresenter(this.responsibilityUsecase);
  ResponsibilitylistUsecase responsibilityUsecase;

  Future<List<DesignationModel?>?> getDesignationList({
    bool? isLoading,
  }) async =>
      await responsibilityUsecase.getDesignationList(
        isLoading: isLoading ?? false,
      );

  Future<bool> createDesignation({
    designationJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    responsibilityUsecase.createDesignation(
      designationJsonString: designationJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteDesignation(String? module_id, {required bool isLoading}) async =>
      await responsibilityUsecase.deleteDesignation(
        module_id: module_id ?? 0,
        isLoading: isLoading,
      );

  Future<bool> updateDesignation(
      {designationJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    responsibilityUsecase.updateDesignation(
      designationJsonString: designationJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
