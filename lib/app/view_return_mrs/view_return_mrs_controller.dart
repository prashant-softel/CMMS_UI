import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/app/view_return_mrs/view_return_mrs_presenter.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../domain/models/get_return_mrs_detail.dart';
import '../home/home_controller.dart';

class MrsReturnViewController extends GetxController {
  ///
  MrsReturnViewController(
    this.mrsReturnViewPresenter,
  );
  MrsReturnViewPresenter mrsReturnViewPresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;

  Rx<ReturnMrsDetailsModel?> returnMrsDetailsModel =
      ReturnMrsDetailsModel().obs;
  String whereUsedType = "";

  @override
  void onInit() async {
    try {
      await setMrsId();
      if (mrsId != 0) {
        await getReturnMrsDetails(mrsId: mrsId.value, isloading: true);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _flutterSecureStorage = const FlutterSecureStorage();
      String? _mrsId = await _flutterSecureStorage.read(key: "mrsId");
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        await _flutterSecureStorage.write(
          key: "mrsId",
          value: mrsId.value == null ? '' : mrsId.value.toString(),
        );
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
      }
      //  await _flutterSecureStorage.delete(key: "mrsId");
    } catch (e) {
      Utility.showDialog(e.toString() + 'mrsId');
    }
  }

  Future<void> getReturnMrsDetails({int? mrsId, bool? isloading}) async {
    final _returnMrsrsDetailsModel = await mrsReturnViewPresenter
        .getReturnMrsDetails(mrsId: mrsId, isLoading: isloading);

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
