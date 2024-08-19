import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/list_of_PermitsTBTDataList/permitsTBT_list_presenter.dart';
import 'package:cmms/app/list_of_Regulatary_Visits%20/regulataryvisits_list_presenter.dart';
import 'package:get/get.dart';

class PermitsTBTListController extends GetxController {
 PermitsTBTListController(
    this.permitsTBTListPresenter,
  );
  PermitsTBTListPresenter permitsTBTListPresenter;
  final HomeController homecontroller = Get.find();


}




