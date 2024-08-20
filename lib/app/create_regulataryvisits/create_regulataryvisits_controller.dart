// ignore: unused_import
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_presenter.dart';
import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_presenter.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class CreateRegulataryVisitsController extends GetxController {
  CreateRegulataryVisitsController(
    this.createregulataryvisitsPresenter,
  );
  CreateRegulataryVisitsPresenter createregulataryvisitsPresenter;
  final HomeController homeController = Get.find();
 
}
