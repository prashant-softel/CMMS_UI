// ignore: unused_import
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/app/create_plantationdata/create_plantationdata_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreatePlantationDataController extends GetxController {
  CreatePlantationDataController(
    this.createplantationdataPresenter,
  );
  CreatePlantationDataPresenter createplantationdataPresenter;
  final HomeController homeController = Get.find();
 
}
