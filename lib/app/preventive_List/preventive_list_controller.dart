import 'package:get/get.dart';

import '../navigators/app_pages.dart';

class PreventiveListController extends GetxController {
  ///

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> createChecklist() async {
    Get.toNamed(
      Routes.create_checkList,
    );
  }
}
