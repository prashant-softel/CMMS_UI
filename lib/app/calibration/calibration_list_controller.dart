import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/business_list_model.dart';
import '../navigators/app_pages.dart';
import 'calibration_list_presenter.dart';

class CalibrationListController extends GetxController {
  ///
  CalibrationListController(
    this.calibrationListPresenter,
  );
  CalibrationListPresenter calibrationListPresenter;
  Rx<DateTime> selectedBreakdownTime = DateTime.now().obs;
  TextEditingController previousDateController =
      TextEditingController(text: "");
  TextEditingController nextDueDateController = TextEditingController(text: "");

  RxList<BusinessListModel?> venderNameList = <BusinessListModel>[].obs;
  Rx<bool> isVenderNameSelected = true.obs;
  Rx<String> selectedVender = ''.obs;
  int selectedvenderId = 0;

  ///
  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 1), () {
      getBusinessList();
    });
    super.onInit();
  }

  void getBusinessList() async {
    venderNameList.value = <BusinessListModel>[];
    final _venderNameList = await calibrationListPresenter.getBusinessList(
      isLoading: true,
      businessType: 4,
    );
    print('Supplier Name List:$venderNameList');
    if (_venderNameList != null) {
      for (var supplier_list in _venderNameList) {
        venderNameList.add(supplier_list);
      }
    }
  }

  Future<void> calibrationHistory() async {
    Get.toNamed(
      Routes.CalibrationHistory,
    );
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessListModel>:
        {
          int facilityIndex =
              venderNameList.indexWhere((x) => x?.name == value);
          selectedvenderId = venderNameList[facilityIndex]?.id ?? 0;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
