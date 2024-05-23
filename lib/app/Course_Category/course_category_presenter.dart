// import 'package:cmms/domain/models/SPV_list_model.dart';
// import 'package:cmms/domain/usecases/course_category_usecase.dart';

// class CourseCategoryPresenter {
//   CourseCategoryPresenter(this.coursecategoryUsecase);
//   CourseCategoryUsecase coursecategoryUsecase;


//   Future<List<SPVListModel>> getCourseCategory({
//     required bool isLoading,
//     required int? job_type_id,
//   }) async {
//     return CourseCategoryUsecase.getCourseCategory(
//         isLoading: isLoading, job_type_id: job_type_id);
//   }

//   Future<bool> createCourseCategory({
//     facilitylistJsonString,
//     required bool isLoading,
//   }) async {
//     print("presenter Create Facility type function.");
//     CourseCategoryUsecase.createCourseCategory(
//       facilitylistJsonString: facilitylistJsonString,
//       isLoading: isLoading,
//     );
//     return true;
//   }

//   deleteFacility(String? category_id, {required bool isLoading}) async =>
//       await CourseCategoryUsecase.deleteCourseCategory(
//         category_id: category_id ?? 0,
//         isLoading: isLoading,
//       );
//   Future<bool> updateCourseCategory(
//       {modulelistJsonString, required bool isLoading}) async {
//     print("presenter");
//     CourseCategoryUsecase.updateCourseCategory(
//       modulelistJsonString: modulelistJsonString,
//       isLoading: isLoading,
//     );
//     return true;
//   }
// }
