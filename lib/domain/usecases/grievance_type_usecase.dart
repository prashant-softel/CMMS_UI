import 'package:cmms/domain/models/grievance_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class GrievanceTypeListUsecase {
  GrievanceTypeListUsecase(this.repository);
  Repository repository;

  Future<List<GrievanceTypeModel?>?> getGrievanceType({bool? isLoading}) async {
    return await repository.getGrievanceType(isLoading: isLoading);
  }

  Future<GrievanceTypeModel?> getGrievanceTypeById(
      {int? grievanceTypeId, bool? isLoading}) async {
    return await repository.getGrievanceTypeById(
      grievanceTypeId: grievanceTypeId,
      isLoading: isLoading,
    );
  }

  Future<bool> createGrievanceType({
    grievanceJson,
    bool? isLoading,
  }) async =>
      await repository.createGrievanceType(
        isLoading: isLoading,
        grievanceJson: grievanceJson,
      );

  Future<bool> updateGrievanceType({
    grievanceJson,
    bool? isLoading,
  }) async =>
      await repository.updateGrievanceType(
        isLoading: isLoading,
        grievanceJson: grievanceJson,
      );

  deleteGrievanceType({
    int? grievanceTypeId,
    bool? isLoading,
  }) async =>
      await repository.deleteGrievanceType(
        grievanceTypeId: grievanceTypeId,
        isLoading: isLoading,
      );
}
