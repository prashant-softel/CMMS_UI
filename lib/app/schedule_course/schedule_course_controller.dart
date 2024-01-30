import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/schedule_course/schedule_course_presenter.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  ScheduleController(this.schedulePresenter);

  SchedulePresenter schedulePresenter;
  HomeController homeController = Get.find();
  int userId = 0;
  bool visible = true;

  var courseIdController = TextEditingController();
  FocusNode idFocus = FocusNode();
  ScrollController idScroll = ScrollController();
  var topic = TextEditingController();
  FocusNode topicFocus = FocusNode();
  ScrollController topicScroll = ScrollController();

  var minutes = TextEditingController();
  var maximumCapacity = TextEditingController();
  var descCtrlr = TextEditingController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  Rx<String> selectedMaterialType = ''.obs;
  final isSuccess = false.obs;
  Rx<bool> isNameInvalid = false.obs;
  Rx<bool> isCodeInvalid = false.obs;
  Rx<bool> isTimeInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isCompanySelected = true.obs;
  Rx<String> selectedCompany = ''.obs;
  Rx<bool> isModeSelected = true.obs;
  Rx<String> selectedMode = ''.obs;

  var dateController = TextEditingController();
  bool openDatePicker = false;

  RxList<TypeModel> company = <TypeModel>[
    TypeModel(name: "1st Company", id: "1"),
    TypeModel(name: "2nd Company", id: "2"),
    TypeModel(name: "3rd Company", id: "3"),
  ].obs;

  RxList<TypeModel> mode = <TypeModel>[
    TypeModel(name: "Online", id: "1"),
    TypeModel(name: "Offline", id: "2"),
  ].obs;

  void onInit() {
    idFocus.addListener(() {
      if (!idFocus.hasFocus) {
        idScroll.jumpTo(0.0);
      }
    });
    topicFocus.addListener(() {
      if (!topicFocus.hasFocus) {
        topicScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  cleardata() {
    minutes.text = '';
    descCtrlr.text = '';
    topic.text = '';
    courseIdController.text = '';
    maximumCapacity.text = '';
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }
}
