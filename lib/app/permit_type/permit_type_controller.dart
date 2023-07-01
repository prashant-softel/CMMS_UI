import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/permit_type/permit_type_presenter.dart';
import 'package:cmms/app/preventive_List/preventive_list_presenter.dart';
import 'package:cmms/domain/models/create_checklist_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/create_permit_type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/models/type_permit_model.dart';
import '../constant/constant.dart';
import '../navigators/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PermitTypeController extends GetxController {
  PermitTypeController(
    this.permitTypePresenter,
  );
  PermitTypePresenter permitTypePresenter;
  final HomeController homecontroller = Get.find();

  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedequipment = ''.obs;
  Rx<bool> isSelectedequipment = true.obs;
  // RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  // RxList<TypePermitModel?>? preventiveCheckList =
  //     <TypePermitModel?>[].obs;
  int facilityId = 0;
  int type = 1;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  TypePermitModel? preventiveCheckListModel;

  ///Facility list / demo plant
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  // int get facilityId => _facilityId.value;

  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<TypePermitModel?> typePermitModel = TypePermitModel().obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  TypePermitModel? selectedItem;
  RxList<String> preventiveCheckListTableColumns = <String>[].obs;
  // RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  var checklistNumberCtrlr = TextEditingController();
  var titleCtrlr = TextEditingController();
  var descriptionCtrlr = TextEditingController();
  int selectedEquipmentId = 0;
  int selectedfrequencyId = 0;
  int selectedFacilityId = 0;
  final isSuccess = false.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;

   PaginationController permitTypePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );


  @override
  void onInit() async {
    // getInventoryCategoryList();
    // getFrequencyList();

    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
       Future.delayed(Duration(seconds: 1), () {
        getFacilityList();
    //   Future.delayed(Duration(seconds: 1), () {
        getTypePermitList(true,facilityId);
    // });

      });
      // getPreventiveCheckList(facilityId, type, true);
    //   getFacilityList();
    });

    super.onInit();
  }

  dynamic

  onFetchNameFromId(dynamic value) {
    int equipmentIndex = facilityList.indexWhere((x) => x?.id == value);
    selectedFacility.value =
        facilityList[equipmentIndex]?.name ?? '';
    // selectedBusinessType.value = value;
    return selectedFacility.value;
  }

  void isDeleteDialog({String? checklist_id, String? checklist}) {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.delete, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Are you sure you want to delete the permit ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: checklist,
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {
                  deletePermitType(checklist_id).then((value) {
                    Get.back();
                    getTypePermitList(true,facilityId);
                  });
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }
  Future<void> deletePermitType(String? checklist_id) async {
    {
      await permitTypePresenter.deletePermitType(
        checklist_id,
        isLoading: true,
      );
    }
  }

   Future<void> getFacilityList() async {
    final _facilityList = await permitTypePresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getTypePermitList( bool isLoading,int facilityId) async {
    final _permitTypeList = await permitTypePresenter.getTypePermitList(
      isLoading: isLoading,
      facility_id: facilityId
    );
      typePermitList.value = <TypePermitModel>[];
    if (_permitTypeList != null) {
      for (var permitType in _permitTypeList) {
        typePermitList.add(permitType);
      }
      selectedTypePermit.value = typePermitList[0]?.name ?? '';
    }

    permitTypePaginationController = PaginationController(
      rowCount: typePermitList.length,
      rowsPerPage: 10,
    );

    selectedFacility.value = '';
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
          // int frequencyIndex =
              // frequencyList.indexWhere((x) => x?.name == value);
          // selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
        }
        break;
       case RxList<FacilityModel>:
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacilityId = facilityList[facilityIndex]?.id ?? 0;
            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<bool> createPermitType() async {
    if (titleCtrlr.text.trim() == '' ||
        descriptionCtrlr.text.trim() == '' ||
        selectedFacilityId == 0) {
      Fluttertoast.showToast(
          msg: "Please enter required field", fontSize: 16.0);
    } else {
      String _title = titleCtrlr.text.trim();
      String _description = descriptionCtrlr.text.trim();

      CreatePermitTypeModel createChecklist = CreatePermitTypeModel(
          title : _title,
          description : _description,
          facilityId : selectedFacilityId,
      );
      var checklistJsonString =
        createChecklist.toJson();
      // ]; //createCheckListToJson([createChecklist]);

      print({"checklistJsonString", checklistJsonString});
      await permitTypePresenter.createPermitType(
        checklistJsonString: checklistJsonString,
        isLoading: true,
      );
      return true;
    }
    return true;
  }

  Future<void> issuccessCreatechecklist() async {
    isSuccess.toggle();
    await {_cleardata()};
  }

  _cleardata() {
    descriptionCtrlr.text = '';
    titleCtrlr.text = '';
    selectedFacility.value = '';
    selectedItem=null;
    // selectedFacilityId=0;
    Future.delayed(Duration(seconds: 1), () {
      getTypePermitList(true,facilityId);
    });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }

  Future<bool> updatePermitType(checklistId) async {
    String _name = titleCtrlr.text.trim();
    // selectedFacility.value =
    TypePermitModel createChecklist = TypePermitModel(
      name: _name,
      id:checklistId,
    );
    var checklistJsonString =
    createChecklist.toJson(); //createCheckListToJson([createChecklist]);

    print({"checklistJsonString", checklistJsonString});
    await permitTypePresenter.updatePermitType(
      checklistJsonString: checklistJsonString,
      isLoading: true,
    );
    return true;
  }


}
