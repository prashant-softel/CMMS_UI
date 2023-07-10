import 'dart:async';

import 'package:cmms/app/create_mrs/create_mrs_presenter.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateMrsController extends GetxController {
  ///
  CreateMrsController(
    this.createMrsPresenter,
  );
  CreateMrsPresenter createMrsPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<GetAssetItemsModel?> assetItemList = <GetAssetItemsModel>[].obs;
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetItemsModel> dropdownMapperData = {};

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getEquipmentList(
          facilityId,
        );
      });
    });
    super.onInit();
  }

  Future<void> getEquipmentList(int _facilityId) async {
    assetItemList.value = <GetAssetItemsModel>[];
    final _assetList =
        await createMrsPresenter.getEquipmentList(facilityId: facilityId);
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetItemList.add(asset);
      }

      update(["AssetList"]);
    }
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Material_Type", "value": ''},
      {'key': "Image", "value": ''},
      {'key': "Available_Qty", "value": ''},
      {'key': "Requested_Qty", "value": ''},
    ]);
  }
}
