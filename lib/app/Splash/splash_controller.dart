import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);
  SplashPresenter splashPresenter;

  @override
  void onInit() {
    getStateList(11);
    super.onInit();
  }

  var stateList = <CountryState?>[].obs;

  Future<void> getStateList(int countryCode) async {
    final res = await splashPresenter.getStateList(countryCode);

    if (res != null) {
      stateList.value = res;
    }
  }
}
