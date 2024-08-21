// ignore: unused_import
import 'package:cmms/app/create_fueldata/create_fueldata_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateFuelDataController extends GetxController {
  CreateFuelDataController(
    this.createfueldataPresenter,
  );
  CreateFuelDataPresenter createfueldataPresenter;
  final HomeController homeController = Get.find();
 
}
