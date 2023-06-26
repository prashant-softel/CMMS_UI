import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/designation_model.dart';
import '../models/frequency_model.dart';
import '../models/modulelist_model.dart';
import '../models/role_model.dart';

class DesignationlistUsecase {
  DesignationlistUsecase(this.repository);

  Repository repository;


  Future<List<DesignationModel?>?> getDesignationList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getDesignationList(
        // type,
        // facilityId,
        isLoading,
      );

}