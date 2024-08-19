// ignore: unused_import
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateOccupationalhealthController extends GetxController {
  CreateOccupationalhealthController(
    this.createOccupationalhealthPresenter,
  );
  CreateOccupationalhealthPresenter createOccupationalhealthPresenter;
  final HomeController homeController = Get.find();
 
}
