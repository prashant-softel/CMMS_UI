import 'dart:async';

import 'package:cmms/app/add_training_course/add_course_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/add_training_course_model.dart';
import 'package:cmms/domain/models/course_category_model.dart';
import 'package:cmms/domain/models/training_course_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class AddCourseController extends GetxController {
  AddCourseController(this.addCoursePresenter);

  RxInt courseId = 0.obs;
  RxInt facilityId = 0.obs;

  final HomeController homeController = Get.find();
  AddCoursePresenter addCoursePresenter;
  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var courseIdController = TextEditingController();
  FocusNode idFocus = FocusNode();
  ScrollController idScroll = ScrollController();
  var topic = TextEditingController();
  FocusNode topicFocus = FocusNode();
  ScrollController topicScroll = ScrollController();

  var minutes = TextEditingController();
  var noOfDays = TextEditingController();
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
  RxBool isMaxCapacityInvalid = false.obs;
  Rx<bool> isCategorySelected = true.obs;
  Rx<bool> isGroupSelected = true.obs;
  RxBool isFormInvalid = false.obs;
  RxBool isLoading = true.obs;

  TrainingCourseListModel course = TrainingCourseListModel();
  RxList<CourseCategoryModel> courseCategory = <CourseCategoryModel>[].obs;
  RxList<CourseCategoryModel?>? targetedGroup = <CourseCategoryModel?>[].obs;
  Rx<String> selectedCategory = ''.obs;
  RxInt selectedCategoryId = 0.obs;
  Rx<String> selectedGroup = ''.obs;
  RxInt selectedGroupId = 0.obs;

  void onInit() async {
    try {
      await setId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId.value = event;
        Future.delayed(Duration(seconds: 1), () async {
          await getCourseCategory();
        });
        Future.delayed(Duration(seconds: 1), () async {
          await getTargetedGroup();
        });
      });
      if (courseId.value > 0) {
        Future.delayed(Duration(seconds: 1), () async {
          await getCourseDetails(courseId.value);
        });
      }
    } catch (e) {
      print(e);
    }

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

  Future<void> setId() async {
    try {
      final _courseId = await addCoursePresenter.getValue();
      if (_courseId == null || _courseId == "" || _courseId == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        courseId.value = dataFromPrevioursScreen['courseId'];
        addCoursePresenter.saveValue(courseId: courseId.value.toString());
      } else {
        courseId.value = int.tryParse(_courseId) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    addCoursePresenter.clearValue();
  }

  Future<void> getCourseDetails(int courseId) async {
    course = TrainingCourseListModel();
    final _courseDetails = await addCoursePresenter.getCourseDetails(
      courseId: courseId,
      isLoading: isLoading.value,
    );
    course = _courseDetails;
    isLoading.value = false;

    topic.text = course.name ?? '';
    selectedCategory.value = course.categoryName ?? '';
    selectedGroup.value = course.groupName ?? '';
    selectedCategoryId.value = course.categoryId ?? 0;
    selectedGroupId.value = course.groupId ?? 0;
    descCtrlr.text = course.description ?? '';
    noOfDays.text = course.number_of_days.toString();
    minutes.text = course.duration.toString();
    maximumCapacity.text = course.max_cap.toString();
  }

  Future<void> getCourseCategory() async {
    courseCategory.value = <CourseCategoryModel>[];
    final _cousreCategory = await addCoursePresenter.getCourseCategory(
      isLoading: isLoading.value,
    );
    isLoading.value = false;
    for (var category in _cousreCategory) {
      courseCategory.add(category);
    }
  }

  Future<void> getTargetedGroup() async {
    targetedGroup?.value = <CourseCategoryModel>[];
    final _targetGroup = await addCoursePresenter.getTargetedGroup(
      isLoading: isLoading.value,
    );
    isLoading.value = false;
    for (var targetGroup in _targetGroup) {
      targetedGroup?.add(targetGroup);
    }
  }

  Future<void> addCourse({dynamic fileIds}) async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      } else {
        String _courseName = topic.text.trim();
        int _categoryId = selectedCategoryId.value;
        int _groupId = selectedGroupId.value;
        int _numberOfDays = int.tryParse(noOfDays.text.trim()) ?? 0;
        int _maxCap = int.tryParse(maximumCapacity.text.trim()) ?? 0;
        int _duration = int.tryParse(minutes.text.trim()) ?? 0;
        String _description = descCtrlr.text.trim();
        AddTrainingCourse course = AddTrainingCourse(
          id: courseId.value,
          name: _courseName,
          categoryId: _categoryId,
          groupId: _groupId,
          numberOfdays: _numberOfDays,
          maxCap: _maxCap,
          duration: _duration,
          description: _description,
          uploadfile_ids: fileIds,
          facilityId: facilityId.value,
        );
        var trainingCourse = course.toJson();
        var response = addCoursePresenter.addCourse(
          courseJson: trainingCourse,
          isLoading: isLoading.value,
        );
        print(response);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCourse({dynamic fileIds}) async {
    try {
      checkForm();
      if (isFormInvalid.value) {
        return;
      } else {
        String _courseName = topic.text.trim();
        int _categoryId = selectedCategoryId.value;
        int _groupId = selectedGroupId.value;
        int _numberOfDays = int.tryParse(noOfDays.text.trim()) ?? 0;
        int _maxCap = int.tryParse(maximumCapacity.text.trim()) ?? 0;
        int _duration = int.tryParse(minutes.text.trim()) ?? 0;
        String _description = descCtrlr.text.trim();
        AddTrainingCourse course = AddTrainingCourse(
          id: courseId.value,
          name: _courseName,
          categoryId: _categoryId,
          groupId: _groupId,
          numberOfdays: _numberOfDays,
          maxCap: _maxCap,
          duration: _duration,
          description: _description,
          uploadfile_ids: fileIds,
          facilityId: facilityId.value,
        );
        var trainingCourse = course.toJson();
        var response = addCoursePresenter.updateCourse(
          courseJson: trainingCourse,
          isLoading: isLoading.value,
        );
        print(response);
      }
    } catch (e) {
      print(e);
    }
  }

  cleardata() {
    minutes.clear();
    descCtrlr.clear();
    topic.clear();
    courseIdController.clear();
    maximumCapacity.clear();
    selectedGroup.value = "";
    selectedGroupId.value = 0;
    selectedCategory.value = "";
    selectedCategoryId.value = 0;
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  void checkForm() {
    if (topic.text.isEmpty) {
      isNameInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isNameInvalid.value = false;
    }
    if (noOfDays.text.isEmpty) {
      isCodeInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isCodeInvalid.value = false;
    }
    if (minutes.text.isEmpty) {
      isTimeInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isTimeInvalid.value = false;
    }
    if (maximumCapacity.text.isEmpty) {
      isMaxCapacityInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isMaxCapacityInvalid.value = false;
    }
    if (descCtrlr.text.isEmpty) {
      isDescriptionInvalid.value = true;
      isFormInvalid.value = true;
    } else {
      isDescriptionInvalid.value = false;
    }
    if (selectedCategory.value == '') {
      isCategorySelected.value = false;
      isFormInvalid.value = true;
    } else {
      isCategorySelected.value = true;
    }
    if (selectedGroup.value == '') {
      isGroupSelected.value = false;
      isFormInvalid.value = true;
    } else {
      isGroupSelected.value = true;
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({list, value});
    switch (list.runtimeType) {
      case RxList<CourseCategoryModel>:
        {
          int blockIndex = courseCategory.indexWhere((x) => x.name == value);
          selectedCategoryId.value = courseCategory[blockIndex].id ?? 0;
          isCategorySelected.value = true;
          selectedCategory.value = value;
        }
        break;
      case RxList<CourseCategoryModel?>:
        {
          int blockIndex = targetedGroup!.indexWhere((x) => x?.name == value);
          selectedGroupId.value = targetedGroup?[blockIndex]?.id ?? 0;
          isGroupSelected.value = true;
          selectedGroup.value = value;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }
}
