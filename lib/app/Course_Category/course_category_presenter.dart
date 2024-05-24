
import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/usecases/course_category_usecase.dart';

class CourseCategoryPresenter {
  CourseCategoryPresenter(this.coursecategoryUsecase);
  CourseCategoryUsecase coursecategoryUsecase;


  Future<List<CourseCategoryModel>> getCourseCategory({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return coursecategoryUsecase.getCourseCategory(
        isLoading: isLoading, job_type_id: job_type_id);
  }

  Future<bool> createCourseCategory({
    CourseCategoryJsonString,
    required bool isLoading,
  }) async {
    print("presenter Create Course type function.");
    coursecategoryUsecase.createCourseCategory(
      CourseCategoryJsonString: CourseCategoryJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteCourseCategory(String? category_id, {required bool isLoading}) async =>
      await coursecategoryUsecase.deleteCourseCategory(
        category_id: category_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateCourseCategory(
      {CourseCategoryJsonString, required bool isLoading}) async {
    print("presenter");
    coursecategoryUsecase.updateCourseCategory(
      CourseCategoryJsonString: CourseCategoryJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
