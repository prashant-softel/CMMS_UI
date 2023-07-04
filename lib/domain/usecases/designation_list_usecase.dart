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

  Future<bool> createDesignation({
    designationJsonString,
    bool? isLoading,
  }) async =>
      await repository.createDesignation(
          isLoading: isLoading, designationJsonString: designationJsonString);
  deleteDesignation(
      {required Object module_id, required bool isLoading}) async =>
      await repository.deleteDesignation(
        module_id,
        isLoading,
      );

  Future<bool> updateDesignation({
    designationJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateDesignation(
        isLoading: isLoading,
        designationJsonString: designationJsonString,
      );

}