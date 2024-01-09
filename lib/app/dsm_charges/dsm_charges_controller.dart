import 'package:cmms/app/dsm_charges/dsm_charges_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class DsmChargesListController extends GetxController {
  ///
  DsmChargesListController(
    this.dsmChargesListPresenter,
  );

  DsmChargesListPresenter dsmChargesListPresenter;
  final HomeController homecontroller = Get.find();
}
