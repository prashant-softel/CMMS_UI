import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_presenter.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ViewEscalationMatrixController extends GetxController {
  ViewEscalationMatrixController(this.viewIncidentReportPresenter);
  ViewEscalationMatrixPresenter viewIncidentReportPresenter;

  final HomeController homeController = Get.find();
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  Map<String, GetAssetDataModel> dropdownMapperData = {};

  void addRowItem() {
    rowItem.value.add([
      {"key": "Duration (Days)", "value": 'Please Select'},
      {'key': "Escalation Roles and Levels", "value": 'Please Select'},
    ]);
  }

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  RxInt facilityId = 0.obs;
  RxInt statusId = 0.obs;
  RxInt moduleId = 0.obs;

  @override
  void onInit() async {
    await setId();
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId.value = event;
    });
    super.onInit();
  }

  Future<void> setId() async {
    try {
      final _statusId = await viewIncidentReportPresenter.getStatusValue();
      final _moduleId = await viewIncidentReportPresenter.getModuleValue();
      if (_statusId == null || _statusId == "" || _statusId == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        statusId.value = dataFromPrevioursScreen['statusId'];
        moduleId.value = dataFromPrevioursScreen['moduleId'];
        viewIncidentReportPresenter.saveStatusValue(
            statusId: statusId.value.toString());
        viewIncidentReportPresenter.saveModuleValue(
            moduleId: moduleId.value.toString());
      } else {
        statusId.value = int.tryParse(_statusId) ?? 0;
        moduleId.value = int.tryParse(_moduleId!) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }
}
