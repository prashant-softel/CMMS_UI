import 'package:cmms/app/create_audit/create_audit_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateAuditController extends GetxController {
  ///
  CreateAuditController(
    this.createAuditPresenter,
  );
  CreateAuditPresenter createAuditPresenter;
  final HomeController homecontroller = Get.find();

  @override
  void onInit() async {
    try {
      super.onInit();
    } catch (e) {
      print(e);
    }

    super.onInit();
  }
}
