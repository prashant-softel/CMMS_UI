import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/frequency_model.dart';
import '../models/modulelist_model.dart';
import '../models/role_model.dart';

class RolelistUsecase {
  RolelistUsecase(this.repository);

  Repository repository;


  Future<List<RoleModel?>?> getRoleList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getRoleList(
        // type,
        // facilityId,
        isLoading,
      );

}