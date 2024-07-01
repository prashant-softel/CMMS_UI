import 'dart:async';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter/material.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/schedule_course_model.dart';
import 'package:cmms/app/execute_course/execute_course_presenter.dart';
import 'package:cmms/domain/models/schedule_course_details_model.dart';

class ExecuteCourseController extends GetxController {
  ExecuteCourseController(this.schedulePresenter);

  ExecuteCoursePresenter schedulePresenter;
  HomeController homeController = Get.find();
  RxInt facilityId = 0.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  RxInt schedule_id = 0.obs;
  Rx<ScheduleCourseDetails> scheduleCourseDetails = ScheduleCourseDetails().obs;
  TextEditingController comment = TextEditingController();
  ScrollController commentScroll = ScrollController();
  FocusNode commentFocus = FocusNode();
  RxList<InternalEmployee> internalEmployees = <InternalEmployee>[].obs;
  List<TextEditingController> noteListInternal =
      List.generate(3, (index) => TextEditingController());
  List<TextEditingController> noteListExternal =
      List.generate(3, (index) => TextEditingController());
  RxList<Employee> internal_employee = <Employee>[].obs;
  RxList<Employee> external_employee = <Employee>[].obs;

  @override
  void onInit() async {
    await setId();
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId.value = event;
      await getCourseDetails(schedule_id: schedule_id.value);
    });
    super.onInit();
  }

  Future<void> setId() async {
    try {
      final _schedule_id = await schedulePresenter.getValue();
      if (_schedule_id == null || _schedule_id == "" || _schedule_id == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        schedule_id.value = dataFromPrevioursScreen['schedule_id'];
        schedulePresenter.saveValue(schedule_id: schedule_id.value.toString());
      } else {
        schedule_id.value = int.tryParse(_schedule_id) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCourseDetails({required int schedule_id}) async {
    scheduleCourseDetails.value = ScheduleCourseDetails();
    final _courseDetails = await schedulePresenter.getScheduleCourseDetails(
      schedule_id: schedule_id,
      isLoading: true,
    );
    scheduleCourseDetails.value = _courseDetails;
    internal_employee.value =
        scheduleCourseDetails.value.internal_employee ?? [];
    external_employee.value =
        scheduleCourseDetails.value.external_employee ?? [];
  }

  void clearStoreData() {
    schedulePresenter.clearValue();
  }
}
