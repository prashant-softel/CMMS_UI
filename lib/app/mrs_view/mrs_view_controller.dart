import 'dart:async';

import 'package:cmms/app/mrs_view/mrs_view_presenter.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class MrsViewController extends GetxController {
  ///
  MrsViewController(
    this.mrsViewPresenter,
  );
  MrsViewPresenter mrsViewPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;

  Rx<int> mrsId = 0.obs;
  Rx<int> type = 0.obs;
  Rx<MrsDetailsModel?> mrsDetailsModel = MrsDetailsModel().obs;
  String whereUsedType = "";

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
      }
      Future.delayed(Duration(seconds: 1), () {
        getMrsDetails(
            mrsId: mrsId.value, isloading: true, facilityId: facilityId);
      });
    });
    try {
      await setMrsId();
      if (mrsId != 0) {
        await getMrsDetails(
            mrsId: mrsId.value, isloading: true, facilityId: facilityId);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await mrsViewPresenter.getValue();
      final _type = await mrsViewPresenter.getValuee();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        type.value = dataFromPreviousScreen['type'];
        mrsViewPresenter.saveValue(mrsId: mrsId.value.toString());
        mrsViewPresenter.saveValuee(type: type.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
        type.value = int.tryParse(_type!) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  Future<void> getMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _mrsDetailsModel = await mrsViewPresenter.getMrsDetails(
        facilityId: facilityId, mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      whereUsedType = mrsDetailsModel.value?.whereUsedType == 1 ? "JC" : "Job";
    }
    print({"mrsdetailss", mrsDetailsModel});
  }
}
