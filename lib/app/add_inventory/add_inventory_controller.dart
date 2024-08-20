import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/controllers/file_upload_controller2.dart';
import 'package:cmms/app/controllers/file_upload_controller3.dart';
import 'package:cmms/domain/models/add_inventory_details_model.dart';
import 'package:cmms/domain/models/add_inventory_model.dart';
import 'package:cmms/app/add_inventory/add_inventory_presenter.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/frequency_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/inventory_status_list_model.dart';
import 'package:cmms/domain/models/inventory_type_list_model.dart';
import 'package:cmms/domain/models/manufacturer_model.dart';
import 'package:cmms/domain/models/supplier_name_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/warranty_type_model.dart';
import 'package:cmms/domain/models/warranty_usage_term_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class AddInventoryController extends GetxController {
  AddInventoryController(this.addInventoryPresenter);
  AddInventoryPresenter addInventoryPresenter;
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  final FileUploadController2 dropzoneController2 =
      Get.put(FileUploadController2());
  final FileUploadController3 dropzoneController3 =
      Get.put(FileUploadController3());

  RxList<String?> selectedWorkAreaNameList = <String>[].obs;
  RxList<InventoryModel?> workAreaList = <InventoryModel>[].obs;
  RxList<int?> selectedWorkAreaIdList = <int>[].obs;
  final HomeController homeController = Get.find();
  FocusNode nameFocus = FocusNode();
  RxBool isFormValid = true.obs;
  ScrollController nameScroll = ScrollController();
  FocusNode wdescFocus = FocusNode();
  ScrollController wdescScroll = ScrollController();
  FocusNode calremFocus = FocusNode();
  ScrollController calremScroll = ScrollController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxString imageName = "".obs;
  bool openLastCalibrationDatePicker = false;
  var selectedImageBytes = Rx<Uint8List>(Uint8List(0));
  var photoId;
  double thumbnailSize = Get.height * 0.25;

  var lastCalibrationDateTc = TextEditingController();
  var calibrationRemainderInTc = TextEditingController();
  bool openExpiryDatePicker = false;
  bool openStartDatePicker = false;
  var expireDateTc = TextEditingController();
  var startDateTc = TextEditingController();

  //Permit Type list
  RxList<TypePermitModel?> typePermitList = <TypePermitModel>[].obs;
  Rx<bool> isTypePermitSelected = true.obs;
  Rx<String> selectedTypePermit = ''.obs;
  Rx<String> selectedTypeOfPermit = ''.obs;
  Rx<bool> isTypePermit = true.obs;
  //FrequencyModel
  RxList<FrequencyModel?> frequencyList = <FrequencyModel>[].obs;
  Rx<String> selectedfrequency = ''.obs;
  Rx<bool> isSelectedfrequency = true.obs;
  int selectedfrequencyId = 0;

  //currancy
  RxList<CurrencyListModel?> unitCurrencyList = <CurrencyListModel>[].obs;
  Rx<bool> isUnitCurrencySelected = true.obs;
  Rx<bool> isManufacturerSelected = true.obs;

  Rx<String> selectedUnitCurrency = ''.obs;
  RxList<String?> selectedUnitCurrencyList = <String>[].obs;
  int selectedUnitCurrencyId = 0;

  //Inventory Type list
  RxList<TypePermitModel?> InventoryTypeList = <TypePermitModel>[].obs;
  Rx<bool> isInventoryTypeSelected = true.obs;
  Rx<String> selectedInventoryType = ''.obs;
  Rx<String> selectedInventoryOfType = ''.obs;
  Rx<bool> isInventoryType = true.obs;
  //add invntory
  var serialNoCtrlr = TextEditingController();
  var assetsNameCtrlr = TextEditingController();
  var moduleQuantityCtrlr = TextEditingController();
  var assesDiscriptionCtrlr = TextEditingController();
  var certificateNoCtrlr = TextEditingController();
  var discriptionCtrlr = TextEditingController();
  var calibrationRemaingCtrlr = TextEditingController();
  var modelNoCtrlr = TextEditingController();
  var parentEquipmentNoCtrlr = TextEditingController();
  var costCtrlr = TextEditingController();
  var warrentyDescriptionCtrlr = TextEditingController();

  Rx<bool> isDescriptionInvalid = false.obs;

  Rx<bool> isCertificateNumberInvalid = false.obs;

  Rx<bool> isModelInvalid = false.obs;
  Rx<bool> isCostInvalid = false.obs;
  Rx<bool> isParentEquipmentInvalid = false.obs;

  Rx<bool> isExpireDateInvalid = false.obs;
  RxBool isStartDateInvalid = false.obs;
  RxBool isSerialNoInvalid = false.obs;
  RxBool isAssetsNameInvalid = false.obs;
  RxBool isReceivedDateInvalid = false.obs;

  RxBool isAssetDescInvalid = false.obs;

  int selectedEquipmentId = 0;
//CategoryModel
  RxList<InventoryCategoryModel?> equipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  RxList<int> selectedEquipmentCategoryIdList = <int>[].obs;
  RxList<InventoryCategoryModel?> selectedEquipmentCategoryList =
      <InventoryCategoryModel>[].obs;
  Rx<String> selectedEquipmentCategoryName = ''.obs;
  Rx<bool> isEquipmentCategoryNameSelected = true.obs;
  Rx<int> selectedEquipmentCategoryNameId = 0.obs;

  ///Equipment name List
  RxList<InventoryModel?> eqipmentNameList = <InventoryModel>[].obs;
  Rx<String> selectedEquipmentName = ''.obs;
  Rx<bool> isEquipmentNameSelected = true.obs;
  int selectedEquipmentnameId = 0;

  ///status list
  RxList<InventoryStatusListModel?> statusNameList =
      <InventoryStatusListModel>[].obs;
  Rx<String> selectedStatusName = ''.obs;
  Rx<bool> isStatusNameSelected = true.obs;
  Rx<bool> isSupplierNameSelected = true.obs;
  int selectedStatusNameId = 0;

  ///type of inventroy
  RxList<InventoryTypeListModel?> typeNameList = <InventoryTypeListModel>[].obs;
  Rx<String> selectedTypeName = ''.obs;
  Rx<bool> isTypeNameSelected = true.obs;
  int selectedTypeNameId = 0;

  ///warrany
  ///
  RxList<WarrantyTypeModel?> warrantyNameList = <WarrantyTypeModel>[].obs;
  Rx<String> selectedWarrantyName = ''.obs;
  Rx<bool> isWarrentyNameSelected = true.obs;
  int selectedWarrentyNameId = 0;

  ///WarrantyUsageTermList
  RxList<WarrantyUsageTermListModel?> warrantyUsageTermNameList =
      <WarrantyUsageTermListModel>[].obs;
  Rx<String> selectedwarrantyUsageTermListName = ''.obs;
  Rx<bool> iswarrantyUsageTermNameSelected = true.obs;
  int selectedwarrantyUsageTermNameId = 0;

  /// manufacturer name
  RxList<ManufacturerModel?> manufacturerModelNameList =
      <ManufacturerModel>[].obs;
  RxList<String?> selectedmanufacturerNameList = <String>[].obs;

  Rx<String> selectedmanufacturerName = ''.obs;
  Rx<bool> iswarrantymanufacturerSelected = true.obs;
  int selectedmanufacturerNameId = 0;

  ///
  RxList<SupplierNameModel?> supplierNameModelNameList =
      <SupplierNameModel>[].obs;
  Rx<String> selectedsupplierrName = ''.obs;
  Rx<bool> iswarrantysupplierSelected = true.obs;
  int selectedsupplierrNameId = 0;

  ///Parent Equipment
  var parentEquipmentList = <DropdownModel>[];
  DropdownModel? parentEquipmentDropdownValue;

  //block
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<BlockModel?> blocksList = <BlockModel>[].obs;
  Rx<bool> isBlocksSelected = true.obs;
  Rx<String> selectedBlocks = ''.obs;
  Rx<bool> isstartdateFieldSelected = true.obs;
  int selectedBlockListId = 0;
  var inventoryList = <InventoryModel>[];
  var blockList = <BlockModel>[];

  var selectedBlock = BlockModel();
  var selectedEquipment = EquipmentModel();

  //int facilityId = 45;
  String categoryIds = '';

  Rx<String> selectedFacility = ''.obs;
  String username = '';

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  int categoryId = 5;

  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  Rx<int> selectedIndex = 0.obs;

  ///Add inventory Details
  Rx<AddInventoryDetailsModel?> editAddInventoryDetailsModel =
      AddInventoryDetailsModel().obs;
  RxList<AddInventoryDetailsModel?>? editAddInventoryDetailsList =
      <AddInventoryDetailsModel?>[].obs;

  ///
  Rx<int> inventoryId = 0.obs;
  @override
  void onInit() async {
    try {
      await setUserId();
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;

        getBlocksList(facilityId);
        getuserAccessData();
        getFacilityList();
        getInventoryList();
        getFrequencyList();
        getWarrantyTypeList();
        getWarrantyUsageTermList();
        getUnitCurrencyList();
        getmanufacturerList();
        getSupplierList();
        getInventoryCategoryList();
        getInventoryTypeList(isLoading: true, facilityId: facilityId);
        getInventoryStatusList(isLoading: true);
        if (inventoryId != 0) {
          getAddInventoryDetail(id: inventoryId.value);
        }
      });
      nameFocus.addListener(() {
        if (!nameFocus.hasFocus) {
          nameScroll.jumpTo(0.0);
        }
      });
      descFocus.addListener(() {
        if (!descFocus.hasFocus) {
          descScroll.jumpTo(0.0);
        }
      });
      calremFocus.addListener(() {
        if (!calremFocus.hasFocus) {
          calremScroll.jumpTo(0.0);
        }
      });
      wdescFocus.addListener(() {
        if (!wdescFocus.hasFocus) {
          wdescScroll.jumpTo(0.0);
        }
      });
    } catch (e) {}
    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _inventoryId = await addInventoryPresenter.getValue();
      // final _goType = await addInventoryPresenter.getGoTypeValue();

      if (_inventoryId == null ||
          _inventoryId == '' ||
          _inventoryId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        inventoryId.value = dataFromPreviousScreen['inventoryId'];

        addInventoryPresenter.saveValue(
            inventoryId: inventoryId.value.toString());
      } else {
        inventoryId.value = int.tryParse(_inventoryId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'inventoryId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  void getUnitCurrencyList() async {
    unitCurrencyList.value = <CurrencyListModel>[];
    final _unitCUrrencyList = await addInventoryPresenter.getUnitCurrencyList(
      isLoading: true,
      facilityId: facilityId,
    );
    print('Unit Currency List:$unitCurrencyList');
    for (var unit_currency_list in _unitCUrrencyList) {
      unitCurrencyList.add(unit_currency_list);
    }

    update(['unit_currency_list']);
  }

  Future<void> getAddInventoryDetail({required int id}) async {
    final _addInventoryDetails =
        await addInventoryPresenter.getAddInventoryDetail(id: id);
    print('Add Inventory Detail:$_addInventoryDetails');

    if (_addInventoryDetails != null) {
      editAddInventoryDetailsModel.value = _addInventoryDetails;
      selectedBlocks.value =
          editAddInventoryDetailsModel.value?.blockName ?? '';
      selectedInventoryType.value =
          editAddInventoryDetailsModel.value?.type ?? '';
      selectedTypeName.value = editAddInventoryDetailsModel.value?.type ?? "";
      selectedTypeNameId= editAddInventoryDetailsModel.value?.typeId ?? 0;
      assetsNameCtrlr.text = editAddInventoryDetailsModel.value?.name ?? '';
      moduleQuantityCtrlr.text =
          editAddInventoryDetailsModel.value?.moduleQuantity.toString() ?? '';

      assesDiscriptionCtrlr.text =
          editAddInventoryDetailsModel.value?.description ?? "";

      warrentyDescriptionCtrlr.text =
          editAddInventoryDetailsModel.value?.warrantyDescription ?? "";
      // lastCalibrationDateTc.text =
      //     editAddInventoryDetailsModel.value?.calibrationLastDate.toString() ??
      //         "";
      // Ensure the text field is properly updated with the calibration date
      lastCalibrationDateTc.text =
          editAddInventoryDetailsModel.value?.calibrationLastDate?.toString() ??
              "";

// Check if the calibration date is '0001-01-01T00:00:00' and set it to an empty string
      if (lastCalibrationDateTc.text == '0001-01-01T00:00:00') {
        lastCalibrationDateTc.text = '';
      } else {
        lastCalibrationDateTc.text;
      }

      startDateTc.text =
          editAddInventoryDetailsModel.value?.start_date.toString() ?? "";
      expireDateTc.text =
          editAddInventoryDetailsModel.value?.expiry_date.toString() ?? "";
      calibrationRemainderInTc.text =
          editAddInventoryDetailsModel.value?.calibrationDueDate.toString() ??
              "";
      selectedStatusNameId = editAddInventoryDetailsModel.value?.statusId ?? 0;
      selectedStatusName.value =
          editAddInventoryDetailsModel.value?.status ?? '';
      selectedWarrantyName.value =
          editAddInventoryDetailsModel.value?.warrantyType ?? '';

      selectedEquipmentCategoryNameId.value =
          editAddInventoryDetailsModel.value?.categoryId ?? 0;
      selectedEquipmentCategoryName.value =
          editAddInventoryDetailsModel.value?.categoryName ?? '';
      selectedEquipmentnameId =
          editAddInventoryDetailsModel.value?.parentId ?? 0;
      selectedEquipmentName.value =
          editAddInventoryDetailsModel.value?.parentName ?? '';
      certificateNoCtrlr.text =
          editAddInventoryDetailsModel.value?.certificateNumber ?? "";
      serialNoCtrlr.text =
          editAddInventoryDetailsModel.value?.serialNumber ?? "";
      selectedUnitCurrency.value =
          editAddInventoryDetailsModel.value?.currency ?? "";
      // parentEquipmentNoCtrlr.text =
      //     editAddInventoryDetailsModel.value?.parentName ?? "";
      assesDiscriptionCtrlr.text =
          editAddInventoryDetailsModel.value?.asset_description ?? "";

      certificateNoCtrlr.text =
          editAddInventoryDetailsModel.value?.certificateNumber ?? "";

      parentEquipmentNoCtrlr.text =
          editAddInventoryDetailsModel.value?.parent_equipment_no.toString() ??
              "";

      modelNoCtrlr.text = editAddInventoryDetailsModel.value?.model ?? "";

      costCtrlr.text =
          editAddInventoryDetailsModel.value?.cost.toString() ?? "";
      calibrationRemainderInTc.text = editAddInventoryDetailsModel
              .value?.calibrationReminderDays
              .toString() ??
          "";
      selectedBlockListId = editAddInventoryDetailsModel.value?.blockId ?? 0;

      selectedfrequency.value =
          editAddInventoryDetailsModel.value?.calibrationFreqType ?? "";
      selectedfrequencyId =
          editAddInventoryDetailsModel.value?.calibrationFrequency ?? 0;

      calibrationRemaingCtrlr.text =
          "${int.tryParse("${editAddInventoryDetailsModel.value?.calibrationReminderDays ?? 0}")}";
      // selectedWarrantyName.value =
      //     editAddInventoryDetailsModel.value?.warrantyTypeName ?? "";

      selectedmanufacturerName.value =
          editAddInventoryDetailsModel.value?.warrantyProviderName ?? "";
      selectedwarrantyUsageTermListName.value =
          editAddInventoryDetailsModel.value?.warranty_term_type ?? "";
      warrentyDescriptionCtrlr.text =
          editAddInventoryDetailsModel.value?.warrantyDescription ?? "";
      selectedmanufacturerName.value =
          editAddInventoryDetailsModel.value?.manufacturerName ?? "";
      selectedsupplierrName.value =
          editAddInventoryDetailsModel.value?.supplierName ?? "";
      modelNoCtrlr.text = editAddInventoryDetailsModel.value?.model ?? "";
      selectedUnitCurrency.value =
          editAddInventoryDetailsModel.value?.currency ?? "";
    }
  }

  void checkForm() {
    if (selectedBlockListId == 0) {
      isBlocksSelected.value = false;
      isFormValid.value = false;
    }
    if (selectedTypeNameId == 0) {
      isTypeNameSelected.value = false;
      isFormValid.value = false;
    }
    //  if (selectedTypeName.value == "") {
    //   isTypeNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    if (selectedStatusNameId == 0) {
      isStatusNameSelected.value = false;
      isFormValid.value = false;
    }

    if (assetsNameCtrlr.text.trim().length == 0) {
      isAssetsNameInvalid.value = true;
      isFormValid.value = false;
    }
    //   if (selectedEquipmentnameId== 0) {
    //   isEquipmentNameSelected.value = false;
    //   isFormValid.value = false;
    // }

    if (selectedEquipmentCategoryNameId == 0) {
      isEquipmentCategoryNameSelected.value = false;
      isFormValid.value = false;
    }

    // if (selectedUnitCurrency.value == "") {
    //   isUnitCurrencySelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedsupplierrName.value == "") {
    //   isStatusNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (parentEquipmentNoCtrlr.text.trim().length == 0) {
    //   isParentEquipmentInvalid.value = false;
    //   isFormValid.value = false;
    // }

    // if (modelNoCtrlr.text.trim().length == 0) {
    //   isModelInvalid.value = true;
    //   isFormValid.value = false;
    // }
    // if (costCtrlr.text.trim().length == 0) {
    //   isCostInvalid.value = true;
    //   isFormValid.value = false;
    // }

    // if (selectedEquipmentName.value == "") {
    //   isEquipmentNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedmanufacturerName.value == "") {
    //   isManufacturerSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedfrequency.value == '') {
    //   isSelectedfrequency.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedWarrantyName.value == '') {
    //   isWarrentyNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedWarrantyName == '') {
    //   isWarrentyNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedmanufacturerName.value == '') {
    //   iswarrantymanufacturerSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedwarrantyUsageTermListName.value == '') {
    //   iswarrantyUsageTermNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedTypeName.value == "") {
    //   isTypeNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedEquipmentCategoryName.value == "") {
    //   isEquipmentCategoryNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (selectedStatusName.value == "") {
    //   isStatusNameSelected.value = false;
    //   isFormValid.value = false;
    // }
    // if (serialNoCtrlr.text.trim().length == 0) {
    //   isSerialNoInvalid.value = true;
    //   isFormValid.value = false;
    // }
    // if (assetsNameCtrlr.text.trim().length == 0) {
    //   isAssetsNameInvalid.value = true;
    //   isFormValid.value = false;
    // }
    // if (certificateNoCtrlr.text.trim().length == 0) {
    //   isCertificateNumberInvalid.value = true;
    //   isFormValid.value = false;
    // }

    // if (lastCalibrationDateTc.text.trim().length == 0) {
    //   isReceivedDateInvalid.value = true;
    //   isFormValid.value = false;
    // }

    // if (startDateTc.text.trim().length == 0) {
    //   isStartDateInvalid.value = true;
    //   isFormValid.value = false;
    // }
    // if (expireDateTc.text.trim().length == 0) {
    //   isExpireDateInvalid.value = true;
    //   isFormValid.value = false;
    // }
    if (assesDiscriptionCtrlr.text.trim().length == 0) {
      isAssetDescInvalid.value = true;
      isFormValid.value = false;
    }
    // if (warrentyDescriptionCtrlr.text.trim().length == 0) {
    //   isDescriptionInvalid.value = true;
    //   isFormValid.value = false;
    // }
  }

  Future<bool> updateInventory({List<dynamic>? fileIds}) async {
    checkForm();
    if (isFormValid.value == false) {
      return false;
    }
    String _serialNoCtrlr = serialNoCtrlr.text.trim();
    String _assetsNameCtrlr = assetsNameCtrlr.text.trim();
    String _moduleQuantityCtrlr = moduleQuantityCtrlr.text.trim();

    List<dynamic> _warrantyFileIds = dropzoneController3.fileIds;
    List<dynamic> _calibrationFileIds = dropzoneController2.fileIds;
    String _assesDiscriptionCtrlr = assesDiscriptionCtrlr.text.trim();
    String _certificateNoCtrlr = certificateNoCtrlr.text.trim();
    String _discriptionCtrlr = discriptionCtrlr.text.trim();
    String _modelNoCtrlr = modelNoCtrlr.text.trim();
    String _parentEquipmentNoCtrlr = parentEquipmentNoCtrlr.text.trim();
    String _costCtrlr = costCtrlr.text.trim();
    String _calibrationRemainderInTc = calibrationRemaingCtrlr.text.trim();
    String _lastCalibrationDateTc = lastCalibrationDateTc.text.trim();

    String _expireDateTc = expireDateTc.text.trim();
    String _startDateTc = startDateTc.text.trim();

    String _warrentyDescriptionCtrlr = warrentyDescriptionCtrlr.text.trim();

    int _cost = int.tryParse(_costCtrlr) ?? 0;

    String? _calibrationLastDate =
        _lastCalibrationDateTc.isEmpty ? null : _lastCalibrationDateTc;

    int _calibrationReminderDays = int.tryParse(_calibrationRemainderInTc) ?? 0;

    String? _startDate = _startDateTc.isEmpty ? null : _startDateTc;
    String? _expiryDate = _expireDateTc.isEmpty ? null : _expireDateTc;

    AddInventoryRequestModel addInventoryRequestModel =
        AddInventoryRequestModel(
            id: inventoryId.value,
            name: _assetsNameCtrlr,
            moduleQuantity: int.tryParse(_moduleQuantityCtrlr) ?? 0,
            description: _discriptionCtrlr,
            warranty_description: _warrentyDescriptionCtrlr,
            assetdescription: _assesDiscriptionCtrlr,
            typeId: selectedTypeNameId,
            statusId: selectedStatusNameId,
            facilityId: facilityId,
            supplierId: selectedsupplierrNameId,
            manufacturerId: selectedmanufacturerNameId,
            blockId: selectedBlockListId,
            categoryId: selectedEquipmentCategoryNameId.value,
            currency: selectedUnitCurrencyId.toString(),
            cost: _cost,
            model: _modelNoCtrlr,
            serialNumber: _serialNoCtrlr,
            parentId: selectedEquipmentnameId,
            calibrationFrequency: selectedfrequencyId,
            calibrationReminderDays: _calibrationReminderDays,
            calibrationLastDate: _calibrationLastDate,
            start_date: _startDate,
            expiry_date: _expiryDate,
            certificate_number: _certificateNoCtrlr,
            warranty_provider_id: selectedmanufacturerNameId,
            warranty_type: selectedWarrentyNameId,
            warranty_term_type: selectedwarrantyUsageTermNameId,
            parent_equipment_no: _parentEquipmentNoCtrlr,
            uplaodfile_ids: fileIds,
            uplaodfile_of_warranty: _warrantyFileIds,
            uplaodfile_of_calibration: _calibrationFileIds,
            calibrationFrequencyType: selectedfrequency.value,
            acCapacity: 2000,
            dcCapacity: 5000,
            multiplier: 3,
            customerId: 1,
            operatorId: 3,
            ownerId: 2,
            stockCount: 50,
            attachments: null);
    var addInventoryJsonString = addInventoryRequestModel
        .toJson(); //createCheckListToJson([createChecklist]);

    print({"updateJsonString", addInventoryJsonString});
    await addInventoryPresenter.updateInventory(
      addInventoryJsonString: addInventoryJsonString,
      isLoading: true,
    );
    return true;
  }

  void getInventoryList() async {
    eqipmentNameList.value = <InventoryModel>[];
    final _inventoryList = await addInventoryPresenter.getInventoryList(
      isLoading: true,
      categoryIds: categoryIds,
      facilityId: facilityId,
    );
    //  print('equipment Name List:$inventoryNameList');
    for (var inventory_list in _inventoryList) {
      eqipmentNameList.add(inventory_list);
    }
    inventoryList = _inventoryList;
    paginationController = PaginationController(
      rowCount: eqipmentNameList.length,
      rowsPerPage: 10,
    );
    update(['inventory_list']);
  }

  //
  Future<void> getFrequencyList() async {
    final list = await addInventoryPresenter.getFrequencyList();

    if (list != null) {
      for (var _frequencyList in list) {
        frequencyList.add(_frequencyList);
      }
    }
  }

  //
  Future<void> getInventoryCategoryList({String? facilityId}) async {
    equipmentCategoryList.value = <InventoryCategoryModel>[];
    final _equipmentCategoryList =
        await addInventoryPresenter.getInventoryCategoryList(
      isLoading: true,
    );
    if (_equipmentCategoryList != null) {
      for (var equimentCategory in _equipmentCategoryList) {
        equipmentCategoryList.add(equimentCategory);
      }
    }
  }

  ///fInventory/GetWarrantyTypeList
  Future<void> getWarrantyTypeList() async {
    warrantyNameList.value = <WarrantyTypeModel>[];
    final _warrantyNameList = await addInventoryPresenter.getWarrantyTypeList(
      isLoading: true,
    );
    if (_warrantyNameList != null) {
      for (var warrantyName in _warrantyNameList) {
        warrantyNameList.add(warrantyName);
      }
    }
  }

  Future<bool> AddInventory({List<dynamic>? fileIds}) async {
    checkForm();
    if (!isFormValid.value) {
      return false;
    }

    String _serialNoCtrlr = serialNoCtrlr.text.trim();
    String _assetsNameCtrlr = assetsNameCtrlr.text.trim();
    String _moduleQuantityCtrlr = moduleQuantityCtrlr.text.trim();
    String _assesDiscriptionCtrlr = assesDiscriptionCtrlr.text.trim();
    String _certificateNoCtrlr = certificateNoCtrlr.text.trim();
    String _discriptionCtrlr = discriptionCtrlr.text.trim();
    String _modelNoCtrlr = modelNoCtrlr.text.trim();
    String _parentEquipmentNoCtrlr = parentEquipmentNoCtrlr.text.trim();
    String _costCtrlr = costCtrlr.text.trim();
    String _calibrationRemainderInTc = calibrationRemaingCtrlr.text.trim();
    String _lastCalibrationDateTc = lastCalibrationDateTc.text.trim();
    String _expireDateTc = expireDateTc.text.trim();
    String _startDateTc = startDateTc.text.trim();
    String _warrentyDescriptionCtrlr = warrentyDescriptionCtrlr.text.trim();
    List<dynamic> _calibrationFileIds = dropzoneController2.fileIds;
    List<dynamic> _warrantyFileIds = dropzoneController3.fileIds;

    int _cost = int.tryParse(_costCtrlr) ?? 0;

    String? _calibrationLastDate =
        _lastCalibrationDateTc.isEmpty ? null : _lastCalibrationDateTc;

    int _calibrationReminderDays = int.tryParse(_calibrationRemainderInTc) ?? 0;

    String? _startDate = _startDateTc.isEmpty ? null : _startDateTc;
    String? _expiryDate = _expireDateTc.isEmpty ? null : _expireDateTc;

    AddInventoryRequestModel addInventoryRequestModel =
        AddInventoryRequestModel(
            id: 0,
            name: _assetsNameCtrlr,
            moduleQuantity: int.tryParse(_moduleQuantityCtrlr) ?? 0,
            description: _discriptionCtrlr,
            warranty_description: _warrentyDescriptionCtrlr,
            assetdescription: _assesDiscriptionCtrlr,
            typeId: selectedTypeNameId,
            statusId: selectedStatusNameId,
            facilityId: facilityId,
            supplierId: selectedsupplierrNameId,
            manufacturerId: selectedmanufacturerNameId,
            blockId: selectedBlockListId,
            categoryId: selectedEquipmentCategoryNameId.value,
            currency: selectedUnitCurrencyId.toString(),
            cost: _cost,
            model: _modelNoCtrlr,
            serialNumber: _serialNoCtrlr,
            parentId: selectedEquipmentnameId,
            calibrationFrequency: selectedfrequencyId,
            calibrationReminderDays: _calibrationReminderDays,
            calibrationLastDate: _calibrationLastDate,
            start_date: _startDate,
            expiry_date: _expiryDate,
            certificate_number: _certificateNoCtrlr,
            warranty_provider_id: selectedmanufacturerNameId,
            warranty_type: selectedWarrentyNameId,
            warranty_term_type: selectedwarrantyUsageTermNameId,
            parent_equipment_no: _parentEquipmentNoCtrlr,
            uplaodfile_ids: fileIds,
            calibrationFrequencyType: selectedfrequency.value,
            acCapacity: 2000,
            dcCapacity: 5000,
            multiplier: 3,
            customerId: 1,
            operatorId: 3,
            ownerId: 2,
            stockCount: 50,
            attachments: null,
            uplaodfile_of_calibration: _calibrationFileIds,
            uplaodfile_of_warranty: _warrantyFileIds);

    var addInventoryJsonString = [addInventoryRequestModel.toJson()];

    print({"checklistJsonString", addInventoryJsonString});

    await addInventoryPresenter.AddInventory(
      addInventoryJsonString: addInventoryJsonString,
      isLoading: true,
    );

    return true;
  }

  Future<void> getWarrantyUsageTermList() async {
    warrantyUsageTermNameList.value = <WarrantyUsageTermListModel>[];
    final _warrantyUsageTermNameList =
        await addInventoryPresenter.getWarrantyUsageTermList(
      isLoading: true,
    );
    if (_warrantyUsageTermNameList != null) {
      for (var warrantyUsageTermListName in _warrantyUsageTermNameList) {
        warrantyUsageTermNameList.add(warrantyUsageTermListName);
      }
    }
  }

  Future<void> getmanufacturerList() async {
    manufacturerModelNameList.value = <ManufacturerModel>[];
    final _manufacturerModelNameList =
        await addInventoryPresenter.getmanufacturerList(
      isLoading: true,
      BusinessType: 7,
    );
    for (var manufacturerName in _manufacturerModelNameList) {
      manufacturerModelNameList.add(manufacturerName);
    }
  }

  Future<void> getSupplierList() async {
    supplierNameModelNameList.value = <SupplierNameModel>[];
    final _supplierList = await addInventoryPresenter.getSupplierList(
      isLoading: true,
      BusinessType: 4,
    );
    for (var manuSupplierName in _supplierList) {
      supplierNameModelNameList.add(manuSupplierName);
    }
  }

  Future<void> getInventoryStatusList({
    required bool isLoading,
    // required int facilityId,
  }) async {
    final _statusList =
        await addInventoryPresenter.getInventoryStatusList(isLoading: true);

    if (_statusList != null) {
      for (var status in _statusList) {
        statusNameList.add(status);
      }

      // selectedStatusName.value = statusNameList[0]?.name ?? '';
      // selectedStatusNameId = statusNameList[0]?.id ?? 0;
    }
  }

  Future<void> getInventoryTypeList({
    required bool isLoading,
    required int facilityId,
  }) async {
    final _typeList = await addInventoryPresenter.getInventoryTypeList(
        facilityId: 45, isLoading: true);

    if (_typeList != null) {
      for (var type in _typeList) {
        typeNameList.add(type);
      }

      // selectedStatusName.value = statusNameList[0]?.name ?? '';
      // selectedStatusNameId = statusNameList[0]?.id ?? 0;
    }
  }

  void equipmentCategoriesSelected(_selectedEquipmentCategoryIds) {
    selectedEquipmentCategoryIdList.value = <int>[];
    for (var _selectedCategoryId in _selectedEquipmentCategoryIds) {
      selectedEquipmentCategoryIdList.add(_selectedCategoryId);
    }
  }

  Future<void> getBlocksList(int _facilityId) async {
    blocksList.value = <BlockModel>[];
    final _blockList =
        await addInventoryPresenter.getBlocksList(facilityId: _facilityId);

    if (_blockList != null) {
      for (var block in _blockList) {
        blocksList.add(block);
      }
      update(["blockList"]);
    }
  }

  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      imageName.value = pickedFile.name;
      selectedImageBytes.value = await pickedFile.readAsBytes();

      uploadImgeInventory(
        fileBytes: selectedImageBytes.value,
      );
    }
  }

  Future<void> uploadImgeInventory({Uint8List? fileBytes}) async {
    AddInventoryRequestModel? addInventoryRequestModel =
        await addInventoryPresenter.uploadImgeInventory(
            fileBytes, imageName.value, true);
    // photoId = addInventoryRequestModel?.photoid;
    print({"photooo", photoId});
    // return true;
  }

  Future<void> getFacilityList() async {
    final _facilityList = await addInventoryPresenter.getFacilityList();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await addInventoryPresenter.getUserAccessList();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    print({"valuevaluevaluevalue": value});
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          if (value != "Please Select") {
            int facilityIndex =
                facilityList.indexWhere((x) => x?.name == value);

            _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          } else {
            facilityId = 0;
          }
        }
        break;

      case const (RxList<FrequencyModel>):
        {
          if (value != "Please Select") {
            int frequencyIndex =
                frequencyList.indexWhere((x) => x?.name == value);
            selectedfrequencyId = frequencyList[frequencyIndex]?.id ?? 0;
            selectedfrequency.value = value;
            isSelectedfrequency.value = true;
          } else {
            selectedfrequencyId = 0;
          }
        }
        break;
      case const (RxList<ManufacturerModel>):
        {
          if (value != "Please Select") {
            int manufacturerModelNameIndex =
                manufacturerModelNameList.indexWhere((x) => x?.name == value);
            selectedmanufacturerNameId =
                manufacturerModelNameList[manufacturerModelNameIndex]?.id ?? 0;
            selectedmanufacturerName.value = value;
            isManufacturerSelected.value = true;
            // iswarrantymanufacturerSelected.value = true;
          } else {
            selectedmanufacturerNameId = 0;
          }
        }
        break;
      case const (RxList<WarrantyTypeModel>):
        {
          if (value != "Please Select") {
            int warrantyIndex =
                warrantyNameList.indexWhere((x) => x?.name == value);
            selectedWarrentyNameId = warrantyNameList[warrantyIndex]?.id ?? 0;
            selectedWarrantyName.value = value;
            // isWarrentyNameSelected.value = true;
          } else {
            selectedWarrentyNameId = 0;
          }
        }
        break;
      case const (RxList<SupplierNameModel>):
        {
          if (value != "Please Select") {
            int supplierIndex =
                supplierNameModelNameList.indexWhere((x) => x?.name == value);
            selectedsupplierrNameId =
                supplierNameModelNameList[supplierIndex]?.id ?? 0;
            selectedsupplierrName.value = value;
            isStatusNameSelected.value = true;
          } else {
            selectedsupplierrNameId = 0;
          }
        }
        break;
      case const (RxList<CurrencyListModel>):
        {
          if (value != "Please Select") {
            int unitCurrencyListIndex =
                unitCurrencyList.indexWhere((x) => x?.name == value);
            selectedUnitCurrencyId =
                unitCurrencyList[unitCurrencyListIndex]?.id ?? 0;
            print('CurrencyId${selectedUnitCurrencyId}');
            selectedUnitCurrency.value = value;
            isUnitCurrencySelected.value = true;
          } else {
            selectedUnitCurrencyId = 0;
          }
        }
        break;
      case const (RxList<WarrantyUsageTermListModel>):
        {
          if (value != "Please Select") {
            int warrantyUsageTermIndex =
                warrantyUsageTermNameList.indexWhere((x) => x?.name == value);
            selectedwarrantyUsageTermNameId =
                warrantyNameList[warrantyUsageTermIndex]?.id ?? 0;
            selectedwarrantyUsageTermListName.value = value;
            // iswarrantyUsageTermNameSelected.value = true;
          } else {
            selectedwarrantyUsageTermNameId = 0;
          }
        }
        break;
      case const (RxList<WarrantyUsageTermListModel>):
        {
          if (value != "Please Select") {
            int warrantyUsageIndex =
                warrantyUsageTermNameList.indexWhere((x) => x?.name == value);

            selectedwarrantyUsageTermNameId =
                warrantyUsageTermNameList[warrantyUsageIndex]?.id ?? 0;
          } else {
            selectedwarrantyUsageTermNameId = 0;
          }
        }
        break;
      case const (RxList<BlockModel>):
        {
          if (value != "Please Select") {
            int blockIndex = blocksList.indexWhere((x) => x?.name == value);

            selectedBlockListId = blocksList[blockIndex]?.id ?? 0;
            isBlocksSelected.value = true;
          } else {
            selectedBlockListId = 0;
          }
        }
        break;
      case const (RxList<InventoryModel>):
        {
          if (value != "Please Select") {
            int eqipmentNameListIndex =
                eqipmentNameList.indexWhere((x) => x?.name == value);
            selectedEquipmentnameId =
                eqipmentNameList[eqipmentNameListIndex]?.id ?? 0;
            isEquipmentNameSelected.value = true;
            print({"selectedEquipmentnameId", selectedEquipmentnameId});
          } else {
            selectedEquipmentnameId = 0;
          }
        }
        break;
      case const (RxList<InventoryCategoryModel>):
        {
          if (value != "Please Select") {
            int equipCatIndex =
                equipmentCategoryList.indexWhere((x) => x?.name == value);
            selectedEquipmentCategoryNameId.value =
                equipmentCategoryList[equipCatIndex]?.id ?? 0;
            isEquipmentCategoryNameSelected.value = true;
          } else {
            //  selectedEquipmentCategoryNameId = 0;
          }
        }
        break;
      case const (RxList<InventoryStatusListModel>):
        {
          if (value != "Please Select") {
            int statusIndex =
                statusNameList.indexWhere((x) => x?.name == value);
            selectedStatusNameId = statusNameList[statusIndex]?.id ?? 0;
            isStatusNameSelected.value = true;
          } else {
            selectedStatusNameId = 0;
          }
        }
        break;

      case const (RxList<InventoryTypeListModel>):
        {
          if (value != "Please Select") {
            int typeNameIndex =
                typeNameList.indexWhere((x) => x?.name == value);
            selectedTypeNameId = typeNameList[typeNameIndex]?.id ?? 0;
            isTypeNameSelected.value = true;
          } else {
            selectedTypeNameId = 0;
          }
        }
        break;

      default:
        {}
        break;
    }
    print({"selectedfrequency": selectedfrequency});
  }
}

class DropdownModel {
  DropdownModel({required this.id, required this.name});
  int? id;
  String? name;
}
