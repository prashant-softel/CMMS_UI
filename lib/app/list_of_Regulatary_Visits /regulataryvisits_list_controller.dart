import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_Regulatary_Visits%20/regulataryvisits_list_presenter.dart';
import 'package:get/get.dart';

class RegulataryDataListController extends GetxController {
  RegulataryDataListController(
    this.regulataryListPresenter,
  );
  RegulataryListPresenter regulataryListPresenter;
  final HomeController homecontroller = Get.find();


}




