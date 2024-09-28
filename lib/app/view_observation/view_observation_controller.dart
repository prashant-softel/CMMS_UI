import 'dart:async';
import 'package:cmms/app/view_observation/view_observation_presenter.dart';
import 'package:cmms/domain/models/comment_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_obs_deatils_by_id_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../home/home_controller.dart';

class ViewObservationController extends GetxController {
  ViewObservationController(
    this.viewObservationPresenter,
  );
  ViewObservationPresenter viewObservationPresenter;
  final HomeController homeController = Get.find();
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  TextEditingController closeCommentTextFieldCtrlr = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  Stream<int> get facilityId$ => _facilityId.stream;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  var obsDateTc = TextEditingController();
  var targetDateTc = TextEditingController();
  var contractorNameCtrlr = TextEditingController();
  var correctivePreventiveCtrlr = TextEditingController();
  var responsiblePersonCtrlr = TextEditingController();
  var contactNumberCtrlr = TextEditingController();
  var costTypeCtrlr = TextEditingController();
  var locationOfObservationCtrlr = TextEditingController();
  var discriptionCtrlr = TextEditingController();
  Rx<GetObservationById?> getObsById = GetObservationById().obs;
  Rx<String> selectedRiskTypeList = ''.obs;
  int selectedRiskTypeId = 0;
  int incidenttypeId = 0;
  int typeOfObsId = 0;
  Rx<String> selectedTypeOfObs = ''.obs;
  Rx<bool> isSelectedTypeOfObs = true.obs;
  int sourceOfObsId = 0;
  Rx<String> selectedSourceOfObs = ''.obs;
  Rx<bool> isLoading = true.obs;
  int facilityId = 0;
  Rx<int> obsId = 0.obs;
  RxList<FileList?>? file_list = <FileList>[].obs;
  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
        Future.delayed(Duration(seconds: 1), () {
          getFacilityList();
        });
      });
      if (obsId.value != 0) {
        Future.delayed(Duration(seconds: 1), () {
          getObsDetail(id: obsId.value);
          getObsHistory(id: obsId.value);
        });
      }
    } catch (e) {}

    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _obsId = await viewObservationPresenter.getValue();

      if (_obsId == null || _obsId == '' || _obsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        obsId.value = dataFromPreviousScreen['obsId'];

        viewObservationPresenter.saveValue(obsId: obsId.value.toString());
      } else {
        obsId.value = int.tryParse(_obsId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'obsId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  void clearStoreData() {
    viewObservationPresenter.clearValue();
  }

  Future<void> getObsDetail({required int id}) async {
    final _getObsDetail = await viewObservationPresenter.getObsDetail(id: id);

    if (_getObsDetail != null) {
      getObsById.value = _getObsDetail;

      contactNumberCtrlr.text = getObsById.value?.contact_number ?? '';
        // .value = getObsById.value?.responsible_person_name??'';
      contractorNameCtrlr.text = getObsById.value?.operator_name ?? "";
      correctivePreventiveCtrlr.text =
          getObsById.value?.preventive_action ?? "";
      discriptionCtrlr.text = getObsById.value?.observation_description ?? "";
      locationOfObservationCtrlr.text =
          getObsById.value?.location_of_observation ?? "";
      targetDateTc.text = getObsById.value?.target_date ?? "";
      obsDateTc.text = getObsById.value?.date_of_observation ?? "";
      selectedRiskTypeList.value = getObsById.value?.risk_type_name ?? '';
      selectedTypeOfObs.value =
          getObsById.value?.type_of_observation_name ?? '';
      selectedSourceOfObs.value =
          getObsById.value?.source_of_observation_name ?? '';
      file_list!.value = getObsById.value?.file_list ?? [];
    }
  }

  Future<void> getObsHistory({required int id}) async {
    int moduleType = 407;

    historyList?.value = await viewObservationPresenter.getHistory(
          moduleType,
          facilityId,
          id,
          true,
        ) ??
        [];
    update(["historyList"]);
  }

  Future<void> getFacilityList() async {
    final _facilityList = await viewObservationPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  // void viewObsCloseButton({int? id}) async {
  //   {
  //     String _comment = closeCommentTextFieldCtrlr.text.trim();

  //     CommentModel commentviewListofObsCloseModel =
  //         CommentModel(id: id, comment: _comment);

  //     var ViewObsCloseJsonString = commentviewListofObsCloseModel.toJson();

  //     Map<String, dynamic>? response =
  //         await viewObservationPresenter.viewObsCloseButton(
  //       ViewObsCloseJsonString: ViewObsCloseJsonString,
  //       isLoading: true,
  //     );
  //     if (response == true) {
  //       //getCalibrationList(facilityId, true);
  //     }
  //   }
  // }

  void onValueChanged(dynamic list, dynamic value) {
    print("$value");
    switch (list.runtimeType) {}
  }
}
