
import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CourseCategoryUsecase {
  CourseCategoryUsecase(this.repository);
  Repository repository;

  Future<List<CourseCategoryModel>> getCourseCategory(
      {required bool isLoading, required int? job_type_id}) async {
    return repository.getCourseCategory(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }


  deleteCourseCategory(
      {required Object category_id, required bool isLoading}) async =>
      await repository.deleteCourseCategory(
        category_id,
        isLoading,
      );
  Future<bool> updateCourseCategory({
    CourseCategoryJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateCourseCategory(
        isLoading: isLoading,
        CourseCategoryJsonString: CourseCategoryJsonString,
      );

  Future<bool> createCourseCategory({
    CourseCategoryJsonString,
    bool? isLoading,
  }) async =>
      await repository.createCourseCategory(
          isLoading: isLoading, CourseCategoryJsonString: CourseCategoryJsonString);
  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);
}
