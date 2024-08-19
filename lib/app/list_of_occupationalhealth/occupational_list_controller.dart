import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_occupationalhealth/occupational_list_presenter.dart';
import 'package:get/get.dart';

class OccupationalDataListController extends GetxController {
  OccupationalDataListController(
    this.occupationalListPresenter,
  );
  OccupationalListPresenter occupationalListPresenter;
  final HomeController homecontroller = Get.find();


}




