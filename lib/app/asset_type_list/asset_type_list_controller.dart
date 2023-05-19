import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/asset_type_list/asset_type_list_presenter.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/asset_type_list_model.dart';

import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';

class AssetTypeListController extends GetxController {
  AssetTypeListController(
    this.assetTypeListPresenter,
  );
  AssetTypeListPresenter assetTypeListPresenter;
  final HomeController homecontroller = Get.find();

  RxBool isCheckedRequire = false.obs;
  void requiretoggleCheckbox() {
    isCheckedRequire.value =
        !isCheckedRequire.value; // Toggle the checkbox state
  }

  //checkbox
  RxBool isChecked = true.obs;

  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;

  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  // PreventiveCheckListModel? preventiveCheckListModel;

  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;

  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

  ///SOP Permit List
  RxList<AssetTypeListModel> assetTypeList = <AssetTypeListModel>[].obs;
  Rx<bool> isassetTypeListSelected = true.obs;
  Rx<String> selectedSopPermit = ''.obs;
  RxList<String?> selectedSopPermitDataList = <String>[].obs;
  RxList<int?> selectedSopPermitIdList = <int>[].obs;
  int selectedSOPId = 0;
  int selectedJobSOPId = 0;

  PaginationController assetTypeListPaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  //Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;

  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getAssetTypeList();
      });
    });

    super.onInit();
  }

  Future<void> getAssetTypeList() async {
    assetTypeList.value = <AssetTypeListModel>[];
    final _assetTypePermitList = await assetTypeListPresenter.getAssetTypeList(
      isLoading: true,
      // categoryIds: categoryIds,
      job_type_id: selectedJobSOPId,
      // job_type_id: 36,
    );
    if (_assetTypePermitList != null) {
      for (var assetType_list in _assetTypePermitList) {
        assetTypeList.add(assetType_list);
      }
      // selectedSopPermit.value = _assetTypeList[0].name ?? '';
    }

    // supplierNameList = _supplierNameList;
    assetTypeListPaginationController = PaginationController(
      rowCount: assetTypeList.length,
      rowsPerPage: 10,
    );
    update(['sop_permit_list']);
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          // int equipmentIndex =
          //     equipmentCategoryList.indexWhere((x) => x?.name == value);
          // selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          // int frequencyIndex =
          // frequencyList.indexWhere((x) => x?.name == value);
          // selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {_cleardata()};
  }

  _cleardata() {
    // checklistNumberCtrlr.text = '';
    // durationCtrlr.text = '';
    // manpowerCtrlr.text = '';

    // selectedequipment.value = '';

    // selectedfrequency.value = '';
    // Future.delayed(Duration(seconds: 1), () {
    //   getPreventiveCheckList(facilityId, type, true);
    // });
    // Future.delayed(Duration(seconds: 5), () {
    //   isSuccess.value = false;
    // });
  }
}
