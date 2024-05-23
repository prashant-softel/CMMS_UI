
// import 'package:cmms/domain/models/course_category_model.dart';
// import 'package:cmms/domain/repositories/repository.dart';

// class CourseCategoryUsecase {
//   CourseCategoryUsecase(this.repository);
//   Repository repository;

//   Future<List<CourseCategoryModel>> getCourseCategoryList(
//       {required bool isLoading, required int? job_type_id}) async {
//     return repository.getCourseCategory(
//       isLoading: isLoading,
//       job_type_id: job_type_id,
//     );
//   }


//   deleteCourseCategory(
//       {required Object business_id, required bool isLoading}) async =>
//       await repository.deleteCourseCategory(
//         business_id,
//         isLoading,
//       );
//   Future<bool> updateCourseCategory({
//     modulelistJsonString,
//     bool? isLoading,
//   }) async =>
//       await repository.updateCourseCategory(
//         isLoading: isLoading,
//         modulelistJsonString: modulelistJsonString,
//       );

//   Future<bool> createCourseCategoryist({
//     facilitylistJsonString,
//     bool? isLoading,
//   }) async =>
//       await repository.createCourseCategory(
//           isLoading: isLoading, CourseCategoryModelFromJson: facilitylistJsonString);
//   // Future<List<FacilityModel?>?> getFacilityList() async =>
//   //     await repository.getFacilityList(true);
//   // Future<String?> getUserAccessList() async =>
//   //     await repository.getUserAccessData(LocalKeys.userAccess);
// }
