import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/designation_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/usecases/designation_list_usecase.dart';
import '../../domain/usecases/module_list_usecase.dart';
import '../../domain/usecases/role_list_usecase.dart';

class DesignationListPresenter {
  DesignationListPresenter(this.designationUsecase);
  DesignationlistUsecase designationUsecase;


  Future<List<DesignationModel?>?> getDesignationList({
    bool? isLoading,
  }) async =>
      await designationUsecase.getDesignationList(
        isLoading: isLoading ?? false,
      );


  Future<bool> createDesignation({
    designationJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    designationUsecase.createDesignation(
      designationJsonString: designationJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteDesignation(String? module_id, {required bool isLoading}) async =>
      await designationUsecase.deleteDesignation(
        module_id: module_id ?? 0,
        isLoading: isLoading,
      );

  Future<bool> updateDesignation(
      {designationJsonString, required bool isLoading, moduleId}) async {
    print("presenter");
    designationUsecase.updateDesignation(
      designationJsonString: designationJsonString,
      isLoading: isLoading,
    );
    return true;
  }

}
