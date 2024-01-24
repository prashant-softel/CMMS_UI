import 'dart:async';

import 'package:cmms/app/add_training_course/add_course_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  AddCourseController(this.addCoursePresenter);

  final HomeController homeController = Get.find();
  late AddCoursePresenter addCoursePresenter;
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<bool> isSelectedBusinessType = true.obs;

  int selectedBusinessTypeId = 1;
  Rx<String> selectedBusinessType = ''.obs;

  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  var courseIdController = TextEditingController();
  FocusNode idFocus = FocusNode();
  ScrollController idScroll = ScrollController();

  final isSuccess = false.obs;
  Rx<bool> isNameInvalid = false.obs;
  Rx<bool> isCodeInvalid = false.obs;
  Rx<bool> isRequiredInvalid = false.obs;
  Rx<bool> isReorderInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;

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

  
}
