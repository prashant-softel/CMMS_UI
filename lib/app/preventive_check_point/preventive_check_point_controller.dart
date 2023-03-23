import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:get/get.dart';
import 'preventive_check_point_presenter.dart';

class PreventiveCheckPointController extends GetxController {
  PreventiveCheckPointController(
    this.preventiveCheckPointPresenter,
  );
  PreventiveCheckPointPresenter preventiveCheckPointPresenter;
  RxList<PreventiveCheckListModel?> checkList =
      <PreventiveCheckListModel>[].obs;
  Rx<String> selectedchecklist = ''.obs;
  Rx<bool> isSelectedchecklist = true.obs;
  int facilityId = 45;
  int type = 1;
  @override
  void onInit() async {
    getPreventiveCheckList(facilityId, type);

    super.onInit();
  }

  var isToggleOn = false.obs;

  void toggle() {
    isToggleOn.value = !isToggleOn.value;
  }

  Future<void> getPreventiveCheckList(facilityId, type) async {
    final list = await preventiveCheckPointPresenter.getPreventiveCheckList(
      facilityId: facilityId,
      type: type,
    );

    if (list != null) {
      for (var _checkList in list) {
        checkList.add(_checkList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<PreventiveCheckListModel>:
        {
          int checklistIndex =
              checkList.indexWhere((x) => x?.category_id == value);
          int selectedChecklistId = checkList[checklistIndex]?.id ?? 0;
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
