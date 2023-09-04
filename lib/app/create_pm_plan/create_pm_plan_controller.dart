import 'package:cmms/app/create_pm_plan/create_pm_plan_presenter.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../home/home_controller.dart';

class CreatePmPlanController extends GetxController {
  ///
  CreatePmPlanController(
    this.createPmPlanPresenter,
  );
  CreatePmPlanPresenter createPmPlanPresenter;
  final HomeController homecontroller = Get.find();

  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId => _facilityId.value;
  int selectedPurchaseID = 0;
  bool openStartDatePicker = false;
  var startDateDateTc = TextEditingController();

  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 1), () {
      getAssetList(facilityId);
    });
    super.onInit();
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList =
        await createPmPlanPresenter.getAssetList(facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
  }
}
