// ignore: unused_import
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/app/create_pemitstoworkTBT/create_pemitstoworkTBT_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreatePemitstoworkTBTController extends GetxController {
  CreatePemitstoworkTBTController(
    this.createpemitstoworkTBTPresenter,
  );
  CreatePemitstoworkTBTPresenter createpemitstoworkTBTPresenter;
  final HomeController homeController = Get.find();
 
}
