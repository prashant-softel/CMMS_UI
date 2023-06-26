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


}
