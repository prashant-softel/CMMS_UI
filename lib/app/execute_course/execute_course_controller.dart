import 'dart:async';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/comment_model.dart';
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
  List<TextEditingController> noteListInternal = [];
  TextEditingController commentCtrlr = TextEditingController();
  List<TextEditingController> noteListExternal = [];
  RxList<Employee> internal_employee = <Employee>[].obs;
  RxList<Employee> external_employee = <Employee>[].obs;
  RxBool isLoading = true.obs;
  DateTime date_of_training = DateTime.now();
  DateTime currentDate = DateTime.now();
  RxBool isExecutionDay = false.obs;
  RxInt type = 0.obs;

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
      final _type = await schedulePresenter.getTypeValue();
      if (_schedule_id == null || _schedule_id == "" || _schedule_id == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        schedule_id.value = dataFromPrevioursScreen['schedule_id'];
        type.value = dataFromPrevioursScreen['type'];
        schedulePresenter.saveValue(schedule_id: schedule_id.value.toString());
        schedulePresenter.saveTypeValue(type: type.value.toString());
      } else {
        schedule_id.value = int.tryParse(_schedule_id) ?? 0;
        type.value = int.tryParse(_type ?? "") ?? 0;
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
    date_of_training = DateTime.parse(
      scheduleCourseDetails.value.date_of_Training ?? "",
    );
    // isExecutionDay.value = DateTime.now().isSameDay(date_of_training);
    internal_employee.value =
        scheduleCourseDetails.value.internal_employee ?? [];
    external_employee.value =
        scheduleCourseDetails.value.external_employee ?? [];
    noteListInternal = List.generate(
      internal_employee.length,
      (index) => TextEditingController(),
    );
    noteListExternal = List.generate(
      external_employee.length,
      (index) => TextEditingController(),
    );
  }

  void isPresent(int index, int position) {
    if (position == 1) {
      internal_employee[index].attendend.value =
          !internal_employee[index].attendend.value;
    } else if (position == 2) {
      external_employee[index].attendend.value =
          !external_employee[index].attendend.value;
    }
    update();
  }

  void execute() {
    for (int i = 0; i < internal_employee.length; i++) {
      internal_employee[i].notes = noteListInternal[i].text;
    }
    for (int i = 0; i < external_employee.length; i++) {
      external_employee[i].notes = noteListExternal[i].text;
    }
    scheduleCourseDetails.value.internal_employee = internal_employee;
    scheduleCourseDetails.value.external_employee = external_employee;
    var executeCourseJson = scheduleCourseDetails.toJson();
    // print("executeCourseJson: ${executeCourseJson}" + executeCourseJson);
    schedulePresenter.executeCourse(
      executeCourseJson: executeCourseJson,
      isLoading: isLoading.value,
    );
  }

  void approveCourseSchedule(int id) async {
    String _comment = commentCtrlr.text.trim();
    CommentModel commentModel = CommentModel(
      id: id,
      comment: _comment,
    );
    var approveSchedule = commentModel.toJson();
    final response = await schedulePresenter.approveCourseSchedule(
      approveSchedule: approveSchedule,
      isLoading: true,
    );
    if (response == true) {
      Get.offAllNamed(Routes.vegExecutionListScreen);
    }
  }

  void rejectCourseSchedule(int id) async {
    String _comment = commentCtrlr.text.trim();
    CommentModel commentModel = CommentModel(
      id: id,
      comment: _comment,
    );
    var rejectSchedule = commentModel.toJson();
    final response = await schedulePresenter.rejectCourseSchedule(
      rejectSchedule: rejectSchedule,
      isLoading: true,
    );
    if (response == true) {
      Get.offAllNamed(Routes.vegExecutionListScreen);
    }
  }

  void clearStoreData() {
    schedulePresenter.clearValue();
    schedulePresenter.clearTypeValue();
  }
}
