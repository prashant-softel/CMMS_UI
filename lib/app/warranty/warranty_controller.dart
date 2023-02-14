import 'package:cmms/app/app.dart';
import 'package:cmms/app/warranty/warranty.dart';
import 'package:get/get.dart';

class WarrantyController extends GetxController {
  WarrantyController(this.warrantyPresenter);
  WarrantyPresenter warrantyPresenter;

  final homeController = Get.find<HomeController>();
}
