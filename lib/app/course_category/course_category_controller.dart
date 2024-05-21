// import 'dart:async';

// import 'package:cmms/app/app.dart';
// import 'package:cmms/domain/models/course_category_model.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';

// class CourseCategoryController extends GetxController {
//  CourseCategoryController(
//   this.courseCategoryPresenter,
//  );
//  CourseCategoryPresenter courseCategoryPresenter;
//  final HomeController homecontroller =Get.find();
//  CourseCategoryModel ? selectedItem;
//  CourseCategoryModel ? selectedItemupdate;
//  Rx<bool> isFormInvalid = false.obs;
// RxBool isCheckedRequire = false.obs;
// RxBool isContainerVisible = false.obs;
//  void requiretoggleCheckbox() {
//     isCheckedRequire.value =
//         !isCheckedRequire.value; // Toggle the checkbox state
//   }

//   //checkbox
//    RxBool isChecked = true.obs;
//    Rx<String> selectedequipment = ''.obs;
//   Rx<bool> isSelectedequipment = true.obs;
//   RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
//   int facilityId = 0;
//   int type = 1;
//   PaginationController paginationController = PaginationController(
//     rowCount: 0,
//     rowsPerPage: 10,
//   );
//    RxList<String> preventiveCheckListTableColumns = <String>[].obs;
//     int selectedEquipmentId = 0;
//   int selectedfrequencyId = 0;
//   final isSuccess = false.obs;
//   StreamSubscription<int>? facilityIdStreamSubscription;

//   ///SOP Permit List
//   Rx<bool> isTitleInvalid = false.obs;
//   Rx<bool> isDescriptionInvalid = false.obs;
//   RxList<CourseCategoryModel> CourseCategoryList = <CourseCategoryModel>[].obs;
//   RxList<CourseCategoryModel> BufferCourseCategoryList = <CourseCategoryModel>[].obs;
//   Rx<bool> isSPVListSelected = true.obs;
//   Rx<String> selectedSopPermit = ''.obs;
//   RxList<String?> selectedSopPermitDataList = <String>[].obs;
//   RxList<int?> selectedSopPermitIdList = <int>[].obs;
//   int selectedSOPId = 0;
//   int selectedJobSOPId = 0;
//   RxList<CourseCategoryModel> filteredData = <CourseCategoryModel>[].obs;

//   PaginationController CourseCategoryListPaginationController = PaginationController(
//     rowCount: 0,
//     rowsPerPage: 10,
//   );
//    void search(String keyword) {
//     print('Keyword: $keyword');
//     if (keyword.isEmpty) {
//       CourseCategoryList.value = BufferCourseCategoryList.value;
//       return;
//     }
//      List<CourseCategoryModel> filteredList = BufferCourseCategoryList.where((item) =>
//             (item.name
//                     ?.toString()
//                     .toLowerCase()
//                     .contains(keyword.toLowerCase()) ??
//                 false) ||
//             (item.description
//                     ?.toString()
//                     .toLowerCase()
//                     .contains(keyword.toLowerCase()) ??
//                 false) // Add this condition to filter by searchId
//         ).toList();
//     CourseCategoryList.value=filteredList;
//    }