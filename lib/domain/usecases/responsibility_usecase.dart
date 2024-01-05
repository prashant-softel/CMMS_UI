import 'package:cmms/domain/repositories/repository.dart';
import '../models/designation_model.dart';

class ResponsibilitylistUsecase {
  ResponsibilitylistUsecase(this.repository);

  Repository repository;

  Future<List<DesignationModel?>?> getResponsibilityList({
    int? type,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getResponsibilityList(
        // type,
        // facilityId,
        isLoading,
      );

  Future<bool> createResponsibility({
    designationJsonString,
    bool? isLoading,
  }) async =>
      await repository.createResponsibility(
          isLoading: isLoading, designationJsonString: designationJsonString);
  deleteResponsibility(
          {required Object module_id, required bool isLoading}) async =>
      await repository.deleteResponsibility(
        module_id,
        isLoading,
      );

  Future<bool> updateResponsibility({
    designationJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateResponsibility(
        isLoading: isLoading,
        designationJsonString: designationJsonString,
      );
}
