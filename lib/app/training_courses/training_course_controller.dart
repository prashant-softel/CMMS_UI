import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/training_courses/training_course_presenter.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class TrainingController extends GetxController {
  TrainingController(this.trainingPresenter);

  TrainingPresenter trainingPresenter;
  HomeController homeController = Get.find();
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<bool> isSelectedCourse = true.obs;

  int selectedCorseId = 1;
  Rx<String> selectedcourse = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  Rx<String> selectedBlock = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

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

    _facilityList = await trainingPresenter.getFacilityList();
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
