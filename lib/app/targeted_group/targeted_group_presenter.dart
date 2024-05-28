
import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/usecases/targeted_group_usecase.dart';

class TargetedGroupPresenter {
  TargetedGroupPresenter(this.targetedgroupUsecase);
  TargetedGroupUsecase targetedgroupUsecase;


  Future<List<CourseCategoryModel>> getTargetedGroup({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return targetedgroupUsecase.getTargetedGroup(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<bool> createTargetedGroup({
    CourseCategoryJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Course type function.");
    targetedgroupUsecase.createTargetedGroup(
      CourseCategoryJsonString: CourseCategoryJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteTargetedGroup(String? category_id, {required bool isLoading}) async =>
      await targetedgroupUsecase.deleteTargetedGroup(
        category_id: category_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateTargetedGroup(
      {CourseCategoryJsonString, required bool isLoading}) async {
    print("presenter");
    targetedgroupUsecase.updateTargetedGroup(
      CourseCategoryJsonString: CourseCategoryJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
