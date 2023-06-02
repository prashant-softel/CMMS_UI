import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/modulelist_model.dart';
import '../../domain/models/role_model.dart';
import '../../domain/usecases/module_list_usecase.dart';
import '../../domain/usecases/role_list_usecase.dart';

class RoleListPresenter {
  RoleListPresenter(this.roleUsecase);
  RolelistUsecase roleUsecase;


  Future<List<RoleModel?>?> getRoleList({
    bool? isLoading,
  }) async =>
      await roleUsecase.getRoleList(
        isLoading: isLoading ?? false,
      );


}
