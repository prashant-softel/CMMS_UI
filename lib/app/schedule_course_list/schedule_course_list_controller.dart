import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/schedule_course_list/schedule_course_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class ScheduleCourseListController extends GetxController {
  ScheduleCourseListController(this.scheduleCourseListPresenter);

  ScheduleCourseListPresenter scheduleCourseListPresenter;
  HomeController homeController = Get.find();
  Rx<bool> isSelectedCourse = true.obs;

  int selectedCorseId = 1;
  Rx<String> selectedcourse = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  Rx<String> selectedBlock = ''.obs;
  // RxList<TrainingCourse?> courseDetail = <TrainingCourse>[
  //   TrainingCourse(
  //       id: 1,
  //       topic: "Test",
  //       description: "Test",
  //       category: "Test",
  //       targetGroup: "Test",
  //       duration: "Test",
  //       maxCapacity: '60'),
  // ].obs;

  void onInit() async {
    super.onInit();
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel>[];

    _facilityList = await scheduleCourseListPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  // void onValueChanged(dynamic list, dynamic value) {
  //   switch (list.runtimeType) {
  //     case RxList<TrainingCourse>:
  //       {
  //         int courseIndex = courseDetail.indexWhere((x) => x?.id == value);
  //         selectedCorseId = courseDetail[courseIndex]?.id ?? 0;
  //       }
  //   }
  // }
}
