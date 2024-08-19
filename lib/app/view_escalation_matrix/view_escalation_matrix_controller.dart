import 'dart:async';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_presenter.dart';
import 'package:cmms/domain/models/escalation_details_model.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ViewEscalationMatrixController extends GetxController {
  ViewEscalationMatrixController(this.viewExcalationPresenter);
  ViewEscalationMatrixPresenter viewExcalationPresenter;

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
  RxBool isLoading = true.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxInt facilityId = 0.obs;
  RxInt status_id = 0.obs;
  RxInt module_id = 0.obs;
  RxList<EscalationDetails?> escalation_details_list =
      <EscalationDetails>[].obs;
  Rx<EscalationDetails?> escalation_details = EscalationDetails().obs;
  RxList<StatusEscalation>? status_escalation_list = <StatusEscalation>[].obs;
  Rx<StatusEscalation> status_escalation = StatusEscalation().obs;
  RxList<EscalationDetail> escalation_list = <EscalationDetail>[].obs;
  Rx<EscalationDetail> escalation = EscalationDetail().obs;

  @override
  void onInit() async {
    await setId();
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId.value = event;
      await getEscalationDetail(
        module_id: module_id.value,
        status_id: status_id.value,
        isLoading: isLoading.value,
      );
    });
    super.onInit();
  }

  Future<void> getEscalationDetail({
    int? module_id,
    int? status_id,
    bool? isLoading,
  }) async {
    final _matrixDetails = await viewExcalationPresenter.getEscalationDetail(
      moduleId: module_id ?? 0,
      statusId: status_id ?? 0,
      isLoading: isLoading,
    );
    if (_matrixDetails.isNotEmpty) {
      escalation_details_list.value = _matrixDetails;
      escalation_details.value = escalation_details_list.firstWhereOrNull(
        (element) => element?.module_id == module_id,
      );
      status_escalation_list?.value =
          escalation_details.value!.status_escalation!;
      status_escalation.value = status_escalation_list!.firstWhereOrNull(
        (element) => element.status_id == status_id,
      )!;
      escalation_list.value = status_escalation.value.escalation!;
      escalation.value = escalation_list.firstWhereOrNull(
        (element) => element.role_id != null,
      )!;
    }
    update(["escalation-matrix"]);
  }

  Future<void> setId() async {
    try {
      final _status_id = await viewExcalationPresenter.getStatusValue();
      final _module_id = await viewExcalationPresenter.getModuleValue();
      if (_status_id == null || _status_id == "" || _status_id == 0) {
        var dataFromPrevioursScreen = Get.arguments;
        status_id.value = dataFromPrevioursScreen['status_id'];
        module_id.value = dataFromPrevioursScreen['module_id'];
        viewExcalationPresenter.saveStatusValue(
          statusId: status_id.value.toString(),
        );
        viewExcalationPresenter.saveModuleValue(
          moduleId: module_id.value.toString(),
        );
      } else {
        status_id.value = int.tryParse(_status_id) ?? 0;
        module_id.value = int.tryParse(_module_id!) ?? 0;
      }
    } catch (e) {
      print(e);
    }
  }

  void clearStoreData() {
    viewExcalationPresenter.clearModuleValue();
    viewExcalationPresenter.clearStatusValue();
  }

  Future<void> editEscalationMatrix({
    required int moudle_id,
    required int status_id,
  }) async {
    clearStoreData();
    Get.toNamed(
      Routes.addEscalatiomMatrixContentWeb,
      arguments: {
        "module_id": moudle_id,
        "status_id": status_id,
      },
    );
  }
}
