import 'package:cmms/domain/models/facility_model.dart';
import 'package:flutter/services.dart';

import 'package:cmms/domain/models/access_level_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../domain/models/acdclistmodel.dart';
import '../../domain/models/asset_category_model.dart';
import '../../domain/models/asset_type_list_sm_model.dart';
import '../../domain/models/create_asset_sm_model.dart';
import '../../domain/models/pm_task_view_list_model.dart';

import '../../domain/models/unit_measurement_model.dart';
import '../controllers/file_upload_controller.dart';
import 'add_asset_master_presenter.dart';

class AddAssetMasterController extends GetxController {
  AddAssetMasterController(
    this.addAssetPresenter,
  );

  AddAssetMasterPresenter addAssetPresenter;
  var assesDiscriptionCtrlr = TextEditingController();
  // String _assesDiscriptionCtrlr = assesDiscriptionCtrlr.text.trim();
  RxList<UnitMeasurementModel?> unitMeasurementList =
      <UnitMeasurementModel>[].obs;
  RxList<AssetTypeListSMModel?> materialList = <AssetTypeListSMModel>[].obs;
  RxList<AssetCategoryModel?> materialCategoryList = <AssetCategoryModel>[].obs;

  // RxList<CountryModel?> countryList = <CountryModel>[].obs;
  RxList<ACDCModel?> acdclist = <ACDCModel>[
    ACDCModel(id: 1, name: "AC"),
    ACDCModel(id: 2, name: "DC"),
  ].obs;
  Rx<String> selectedMaterialType = ''.obs;
  Rx<bool> isSelectedMaterialType = true.obs;
  int selectedMaterialTypeId = 0;
  // RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedUnitOfMeasurement = ''.obs;
  Rx<bool> isSelectedUnitOfMeasurement = true.obs;
  int selectedUnitOfMeasurementId = 0;
  // RxList<CountryModel?> countryList = <CountryModel>[].obs;
  Rx<String> selectedMinRequiredQty = ''.obs;
  Rx<bool> isSelectedMinRequiredQty = true.obs;
  int selectedMinRequiredQtyId = 0;
  // RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedMaterialCategory = ''.obs;
  Rx<bool> isSelectedMaterialCategory = true.obs;
  int selectedMaterialCategoryId = 0;
  // RxList<CountryModel?> countryList = <CountryModel>[].obs;
  Rx<String> selectedACDC = ''.obs;
  Rx<bool> isSelectedACDC = true.obs;
  int selectedACDCId = 0;
  // RxList<StateModel?> stateList = <StateModel>[].obs;
  Rx<String> selectedMinReorderQty = ''.obs;
  Rx<bool> isSelectedMinReorderQty = true.obs;
  int selectedMinReorderQtyId = 0;
  Rx<String> selectedDocumentType = ''.obs;
  Rx<bool> isSelectedDocumentType = true.obs;
  int selectedDocumentTypeId = 0;

  PaginationController schedulePaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  RxString fileName = "".obs;
  RxString filePath = "".obs;
  RxString fileType = "".obs;
  Uint8List? fileBytes;
  RxList<ScheduleCheckPoint?>? scheduleCheckPoints =
      <ScheduleCheckPoint?>[].obs;
  RxList<String> moduleNameList = <String>[].obs;
  var selectedImageBytes = Rx<Uint8List>(Uint8List(0));
  final RxBool isChecked = false.obs;
  final RxBool isCheckedmodule = false.obs;
  var gender = 'Select Gender'.obs;
  RxBool isTouchable = true.obs;
  AccessLevel? selectedItem;
  var matNameCtrlr = TextEditingController();
  var reqQty = TextEditingController();
  var descCtrlr = TextEditingController();
  var reorderQty = TextEditingController();
  var firstNameCtrlr = TextEditingController();
  bool visible = true;
  var mobileNoCtrlr = TextEditingController();
  var mdmcodeCtrlr = TextEditingController();
  var lastNameCtrlr = TextEditingController();
  var dobCtrlr = TextEditingController();
  var landlineCtrlr = TextEditingController();
  var zipcodeCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();
  var joingdateCtrlr = TextEditingController();
  FocusNode nameFocus = FocusNode();
  ScrollController nameScroll = ScrollController();
  FocusNode reqFocus = FocusNode();
  ScrollController reqScroll = ScrollController();
  FocusNode mdmFocus = FocusNode();
  ScrollController mdmScroll = ScrollController();
  FocusNode reorderFocus = FocusNode();
  ScrollController reorderScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  int userId = 0;
  double thumbnailSize = Get.height * 0.20;
  RxList<String?> selectedfacilityDataList = <String>[].obs;
  RxList<int?> selectedfacilityIdList = <int>[].obs;
  RxList<FacilityModel?> selectedFacilityNameList = <FacilityModel>[].obs;
  RxList<int> selectedfacilityNameIdList = <int>[].obs;
  RxList<FacilityModel?> facilityNameList = <FacilityModel>[].obs;
  RxList<FacilityModel?> filteredfacilityNameList = <FacilityModel>[].obs;
  Map<dynamic, dynamic> facility_map = {};
  final isSuccess = false.obs;
  Rx<bool> isNameInvalid = false.obs;
  Rx<bool> isCodeInvalid = false.obs;
  Rx<bool> isRequiredInvalid = false.obs;
  Rx<bool> isReorderInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  PaginationController facilityNamepaginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///
  void onInit() {
    // userId = Get.arguments;
    getUnitMeasurementList();
    getAssetCategoryList();

    getAssetType();
    Get.put(FileUploadController());

    // await getRoleList();
    // await getFacilityList();
    // if (userId != null) {
    //   await getUserDetails(userId: userId, isloading: true);
    // }
    nameFocus.addListener(() {
      if (!nameFocus.hasFocus) {
        nameScroll.jumpTo(0.0);
      }
    });
    reqFocus.addListener(() {
      if (!reqFocus.hasFocus) {
        reqScroll.jumpTo(0.0);
      }
    });
    mdmFocus.addListener(() {
      if (!mdmFocus.hasFocus) {
        mdmScroll.jumpTo(0.0);
      }
    });
    reorderFocus.addListener(() {
      if (!reorderFocus.hasFocus) {
        reorderScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxString imageName = "".obs;
  var photoId;

  Future<void> getAssetType() async {
    final list = await addAssetPresenter.getAssetType();

    if (list != null) {
      for (var _materialList in list) {
        materialList.add(_materialList);
      }
    }
  }

  Future<void> getUnitMeasurementList() async {
    final list = await addAssetPresenter.getUnitMeasurementList();

    if (list != null) {
      for (var _unitList in list) {
        unitMeasurementList.add(_unitList);
      }
    }
  }

  Future<void> getAssetCategoryList() async {
    final list = await addAssetPresenter.getAssetCategoryList();

    if (list != null) {
      for (var _materialcatList in list) {
        materialCategoryList.add(_materialcatList);
      }
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<UnitMeasurementModel>:
        {
          if (value != "Please Select") {
            int Index = unitMeasurementList.indexWhere((x) => x?.name == value);
          selectedUnitOfMeasurementId = unitMeasurementList[Index]?.id ?? 0;
          selectedUnitOfMeasurement.value = value;
          } else {
            selectedUnitOfMeasurementId=0;
          }
        }
        break;
      case RxList<AssetCategoryModel>:
        {
          if (value != "Please Select") {
            int Index = materialCategoryList.indexWhere((x) => x?.name == value);
          selectedMaterialCategoryId = unitMeasurementList[Index]?.id ?? 0;
          selectedMaterialCategory.value = value;
          } else {
            selectedMaterialCategoryId=0;
          }
        }
        break;
      case RxList<ACDCModel>:
        {
          if (value != "Please Select") {
            int Index = acdclist.indexWhere((x) => x?.name == value);
          selectedACDCId = unitMeasurementList[Index]?.id ?? 0;
          selectedACDC.value = value;
          } else {
            selectedACDCId=0;
          }
        }
        break;
      case RxList<AssetTypeListSMModel>:
        {
          if (value != "Please Select") {
            int Index = materialList.indexWhere((x) => x?.name == value);
          selectedMaterialTypeId = unitMeasurementList[Index]?.id ?? 0;
          selectedMaterialType.value = value;
          } else {
            selectedMaterialTypeId=0;
          }
        }
        break;
      case RxList<ACDCModel>:
        {
          if (value != "Please Select") {
            int Index = acdclist.indexWhere((x) => x?.name == value);
          selectedACDCId = acdclist[Index]?.id ?? 0;
          selectedACDC.value = value;
          } else {
            selectedACDCId=0;
          }
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
  }

  Future<bool> addAsset() async {
    // if (matNameCtrlr.text.trim() == '' ) {
    //   isNameInvalid.value = true;
    //   isFormInvalid.value = true;
    // }

    // if (mdmcodeCtrlr.text.trim() == '' ) {
    //   isCodeInvalid.value = true;
    //   isFormInvalid.value = true;
    // }

    // if (reqQty.text.trim() == '' ) {
    //   isRequiredInvalid.value = true;
    //   isFormInvalid.value = true;
    // }

    // if (reorderQty.text.trim() == '' ) {
    //   isReorderInvalid.value = true;
    //   isFormInvalid.value = true;
    // }

    // if (descCtrlr.text.trim() == '' ) {
    //   isDescriptionInvalid.value = true;
    //   isFormInvalid.value = true;
    // }

    // checkForm();
    // if (isFormInvalid.value) {
    //   return false;
    // }

    // if (matNameCtrlr.text.trim() == '' ||
    //     mdmcodeCtrlr.text.trim() == ''  ||
    //     reorderQty.text.trim() == '' ||
    //     reqQty.text.trim() == '' ||
    //     descCtrlr.text.trim() == ''

    // ) {
    //   Fluttertoast.showToast(
    //       msg: "Please enter required field", fontSize: 16.0);
    // } else {
    String _name = matNameCtrlr.text.trim();
    String _mdmcode = mdmcodeCtrlr.text.trim();
    String _reorderQty = reorderQty.text.trim();
    String _reqQty = reqQty.text.trim();
    String _desc = descCtrlr.text.trim();

    CreateAssetSMModel createAssetSMModel = CreateAssetSMModel(
        asset_code: _mdmcode,
        asset_name: _name,
        asset_description: _desc,
        asset_type_ID: selectedMaterialTypeId,
        item_category_ID: selectedMaterialCategoryId,
        unit_measurement_ID: selectedUnitOfMeasurementId,
        min_req_qty: int.parse(_reqQty),
        reorder_qty: int.parse(_reorderQty),
        approval_required_ID: 1,

        // fileData:
        fileData: {
          "File_path": filePath.value,
          "File_name": fileName.value,
          "File_type": fileType.value,
          "File_size": fileBytes.toString(),
        });
    //function to write sum of 2 numbers

    var assetListJsonString =
        createAssetSMModel.toJson(); //createCheckListToJson([createChecklist]);

    print({"checklistJsonString", assetListJsonString});
    await addAssetPresenter.createAssetSM(
      assetListJsonString: assetListJsonString,
      isLoading: true,
    );
    return true;
    // }
    //   return true;
  }

  Future<void> issuccessCreateAssetlist() async {
    isSuccess.toggle();

    // isToggleOn.value = false;
    await {cleardata()};
  }

  void checkForm() {
    if (selectedMaterialType.value == '') {
      isSelectedMaterialType.value = false;
    }
    if (selectedMaterialCategory.value == '') {
      isSelectedMaterialCategory.value = false;
    }
    if (selectedUnitOfMeasurement.value == '') {
      isSelectedUnitOfMeasurement.value = false;
    }
    if (selectedACDC.value == '') {
      isSelectedACDC.value = false;
    }

    if (isNameInvalid.value == true ||
        isSelectedMaterialType.value == false ||
        isSelectedMaterialCategory.value == false ||
        isSelectedUnitOfMeasurement.value == false ||
        isSelectedACDC.value == false ||
        isReorderInvalid.value == true ||
        isRequiredInvalid.value == true ||
        isDescriptionInvalid.value == true ||
        isCodeInvalid.value == true) {
      isFormInvalid.value = true;
    } else {
      isFormInvalid.value = false;
    }
  }

  cleardata() {
    matNameCtrlr.text = '';
    mdmcodeCtrlr.text = '';
    descCtrlr.text = '';
    reorderQty.text = '';
    reqQty.text = '';
    // selectedBusinessType.value = '';
    selectedUnitOfMeasurement.value = '';
    selectedMaterialCategory.value = '';
    selectedMaterialType.value = '';
    selectedACDC.value = '';
    selectedItem = null;
    visible = false;
    // Future.delayed(Duration(seconds: 1), () {
    //   getBusinessList(selectedBusinessTypeId, true);
    // });
    Future.delayed(Duration(seconds: 5), () {
      isSuccess.value = false;
    });
  }
}
