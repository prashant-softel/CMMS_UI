import 'dart:async';

import 'package:cmms/app/Statutory/statutory_presenter.dart';
import 'package:cmms/app/app.dart';

import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:get/get.dart';

class StatutoryController extends GetxController {
  StatutoryController(
    this.statutoryPresenter,
  );
  StatutoryPresenter statutoryPresenter;
  HomeController homeController = Get.find();
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<bool> isSelectedBusinessType = true.obs;

  int selectedBusinessTypeId = 1;
  Rx<String> selectedBusinessType = ''.obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  Rx<String> selectedBlock = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  ///
  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await statutoryPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessTypeModel>:
        {
          if (value != "Please Select") {
            int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
            
          }else{
            selectedBusinessTypeId=0;

          }
        }
        break;
    }
  }
}
