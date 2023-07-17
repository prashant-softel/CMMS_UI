import 'package:cmms/app/mrs_approve/mrs_approve_presenter.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class MrsApproveController extends GetxController {
  ///
  MrsApproveController(
    this.mrsApprovePresenter,
  );
  MrsApprovePresenter mrsApprovePresenter;
  final HomeController homecontroller = Get.find();
  int mrsId = 0;
  Rx<MrsDetailsModel?> mrsDetailsModel = MrsDetailsModel().obs;
  String whereUsedType = "";

  ///
  @override
  void onInit() async {
    mrsId = Get.arguments;
    print('mrsId:$mrsId');
    if (mrsId != 0) {
      await getMrsDetails(mrsId: mrsId, isloading: true);
    }
    super.onInit();
  }

  Future<void> getMrsDetails({int? mrsId, bool? isloading}) async {
    final _mrsDetailsModel = await mrsApprovePresenter.getMrsDetails(
        mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      whereUsedType = mrsDetailsModel.value?.whereUsedType == 1 ? "JC" : "PM";
    }
  }
}
