import 'package:cmms/app/add_training_course/add_course_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
// import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  AddCourseController(this.addCoursePresenter);

  int userId = 0;

  final HomeController homeController = Get.find();
  late AddCoursePresenter addCoursePresenter;

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
  Rx<bool> isCategorySelected = true.obs;
  Rx<String> selectedCategory = ''.obs;
  Rx<bool> isGroupSelected = true.obs;
  Rx<String> selectedGroup = ''.obs;

  RxList<TypeModel> category = <TypeModel>[
    TypeModel(name: "1st Course", id: "1"),
    TypeModel(name: "2nd Course", id: "2"),
    TypeModel(name: "3rd Course", id: "3"),
  ].obs;

  RxList<TypeModel> targetGroup = <TypeModel>[
    TypeModel(name: "Group 1", id: "1"),
    TypeModel(name: "Group 2", id: "2"),
    TypeModel(name: "Group 3", id: "3"),
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

