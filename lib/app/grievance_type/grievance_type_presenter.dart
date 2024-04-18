import 'package:cmms/domain/models/grievance_type_model.dart';
import 'package:cmms/domain/usecases/grievance_type_usecase.dart';

class GrievanceTypePresenter {
  GrievanceTypePresenter(this.grievanceTypeUsecase);

  GrievanceTypeListUsecase grievanceTypeUsecase;

  Future<List<GrievanceTypeModel?>?> getGrievanceType({bool? isLoading}) async {
    return grievanceTypeUsecase.getGrievanceType(isLoading: isLoading);
  }

  Future<GrievanceTypeModel?> getGrievanceTypeById({
    int? grievanceTypeId,
    bool? isLoading,
  }) async {
    return grievanceTypeUsecase.getGrievanceTypeById(
      grievanceTypeId: grievanceTypeId,
      isLoading: isLoading,
    );
  }

  Future<bool> createGrievanceType({
    grievanceJson,
    bool? isLoading,
  }) async {
    grievanceTypeUsecase.createGrievanceType(
      grievanceJson: grievanceJson,
      isLoading: isLoading,
    );
    return true;
  }

  Future<bool> updateGrievanceType({
    grievanceJson,
    bool? isLoading,
  }) async {
    grievanceTypeUsecase.updateGrievanceType(
      grievanceJson: grievanceJson,
      isLoading: isLoading,
    );
    return true;
  }

  deleteGrievanceType({
    int? grievanceTypeId,
    bool? isLoading,
  }) async =>
      await grievanceTypeUsecase.deleteGrievanceType(
        grievanceTypeId: grievanceTypeId,
        isLoading: isLoading,
      );
}
