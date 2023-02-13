import 'package:cmms/app/warranty/warranty.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';

class WarrantyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WarrantyController(
        Get.put(
          WarrantyPresenter(
            HomeUsecase(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
