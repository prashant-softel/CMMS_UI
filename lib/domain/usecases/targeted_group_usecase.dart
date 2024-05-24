
import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class TargetedGroupUsecase {
  TargetedGroupUsecase(this.repository);
  Repository repository;

  Future<List<CourseCategoryModel>> getTargetedGroup(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getTargetedGroup(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }


  deleteTargetedGroup(
      {required Object category_id, required bool isLoading}) async =>
      await repository.deleteTargetedGroup(
        category_id,
        isLoading,
      );
  Future<bool> updateTargetedGroup({
    CourseCategoryJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateTargetedGroup(
        isLoading: isLoading,
        CourseCategoryJsonString: CourseCategoryJsonString,
      );

  Future<bool> createTargetedGroup({
    CourseCategoryJsonString,
    bool? isLoading,
  }) async =>
      await repository.createTargetedGroup(
          isLoading: isLoading, CourseCategoryJsonString: CourseCategoryJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
