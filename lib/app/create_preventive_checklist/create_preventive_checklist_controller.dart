import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_preventive_checklist/create_preventive_checklist_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/create_checklist_model.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreventiveCheckListController extends GetxController {
  PreventiveCheckListController(
    this.createpreventivePresenter,
  );
  CreateCheckListPresenter createpreventivePresenter;
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var checklistNumberCtrlr = TextEditingController();
  var manpowerCtrlr = TextEditingController();
  var durationCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  int selectedfacilityId = 0;

  int facilityId = 45;
  Rx<String> selectedFacility = ''.obs;

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  @override
  void onInit() async {
    //homePresenter.generateToken();
    // Future.delayed(Duration(seconds: 1), () {
    getFacilityList();
    // });
    getInventoryCategoryList();
    getFrequencyList();

    super.onInit();
  }

  Future<void> getInventoryCategoryList() async {
    final list = await createpreventivePresenter.getInventoryCategoryList();

    if (list != null) {
      for (var _equipmentCategoryList in list) {
        equipmentCategoryList.add(_equipmentCategoryList);
      }
    }
  }

  Future<void> getFrequencyList() async {
    final list = await createpreventivePresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  Future<bool> createChecklistNumber() async {
    if (checklistNumberCtrlr.text.trim() == '' ||
        selectedEquipmentId == 0 ||
        selectedfrequencyId == 0) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _checklistNumber = checklistNumberCtrlr.text.trim();
      String _duration = durationCtrlr.text.trim();
      String _manpower = manpowerCtrlr.text.trim();

      CreateChecklist createChecklist = CreateChecklist(
          category_id: selectedEquipmentId,
          duration: int.tryParse(_duration) ?? 0,
          manPower: int.tryParse(_manpower) ?? 0,
          facility_id: facilityId,
          frequency_id: selectedfrequencyId,
          status: 1,
          type: 1,
          id: 0,
          checklist_number: _checklistNumber);
      var checklistJsonString = [createChecklist.toJson()];

      print({"checklistJsonString", checklistJsonString});
      await createpreventivePresenter.createChecklistNumber(
        checklistJsonString: checklistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await createpreventivePresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<InventoryCategoryModel>:
        {
          int equipmentIndex =
              equipmentCategoryList.indexWhere((x) => x?.name == value);
          selectedEquipmentId = equipmentCategoryList[equipmentIndex]?.id ?? 0;
        }

        break;
      case RxList<FrequencyModel>:
        {
          int frequencyIndex =
              frequencyList.indexWhere((x) => x?.name == value);
          selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
      case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedfacilityId = frequencyList[facilityIndex]?.id ?? 0;
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  void isSuccessDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('CheckList Number'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 7, 161, 17),
              border: Border.all(
                color: Color.fromARGB(255, 7, 161, 17),
                width: 1,
              ),
            ),
            child: Icon(Icons.check, size: 35, color: ColorValues.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "${checklistNumberCtrlr.text.trim()} added Successfully in the List....",
              style: TextStyle(fontSize: 16, color: ColorValues.blackColor))
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
              // (Routes.preventiveList);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
