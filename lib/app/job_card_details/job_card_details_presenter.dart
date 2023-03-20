import '../../domain/models/employee_model.dart';
import '../../domain/usecases/job_card_usecase.dart';

class JobCardDetailsPresenter {
  JobCardDetailsPresenter(this.jobCardDetailsUsecase);
  JobCardDetailsUsecase jobCardDetailsUsecase;

  ///
  Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await jobCardDetailsUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId,
        isLoading: isLoading,
      );

  ///
}
