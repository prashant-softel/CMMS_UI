import 'dart:async';

import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_return_mrs/view_return_mrs_presenter.dart';
import 'package:get/get.dart';
import '../../domain/models/get_return_mrs_detail.dart';
import '../home/home_controller.dart';

class MrsReturnViewController extends GetxController {
  ///
  MrsReturnViewController(
    this.mrsReturnViewPresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;
  MrsReturnViewPresenter mrsReturnViewPresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;

  Rx<ReturnMrsDetailsModel?> returnMrsDetailsModel =
      ReturnMrsDetailsModel().obs;
  String whereUsedType = "";

  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
      }
      Future.delayed(Duration(seconds: 1), () {
        getReturnMrsDetails(
            mrsId: mrsId.value, isloading: true, facilityId: facilityId);
      });
    });
    try {
      await setMrsId();
      if (mrsId != 0) {
        await getReturnMrsDetails(
            mrsId: mrsId.value, isloading: true, facilityId: facilityId);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await mrsReturnViewPresenter.getValue();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        mrsReturnViewPresenter.saveValue(mrsId: mrsId.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  Future<void> getReturnMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _returnMrsrsDetailsModel =
        await mrsReturnViewPresenter.getReturnMrsDetails(
            mrsId: mrsId, isLoading: isloading, facilityId: facilityId);

    if (_returnMrsrsDetailsModel != null) {
      returnMrsDetailsModel.value = _returnMrsrsDetailsModel;
      whereUsedType = returnMrsDetailsModel.value?.whereUsedType == 1
          ? "JC"
          : returnMrsDetailsModel.value?.whereUsedType == 2
              ? "PM"
              : "";
    }
    // print({"mrsdetailss", returnMrsDetailsModel.value});
  }
}
