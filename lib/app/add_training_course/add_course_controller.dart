import 'package:cmms/app/add_training_course/add_course_presenter.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  AddCourseController(this.addCoursePresenter);

  int userId = 0;

  final HomeController homeController = Get.find();
  late AddCoursePresenter addCoursePresenter;

  var courseIdController = TextEditingController();
  FocusNode idFocus = FocusNode();
  ScrollController idScroll = ScrollController();
  var topic = TextEditingController();
  FocusNode topicFocus = FocusNode();
  ScrollController topicScroll = ScrollController();

  var minutes = TextEditingController();
  var maximumCapacity = TextEditingController();
  var descCtrlr = TextEditingController();
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();

  Rx<String> selectedMaterialType = ''.obs;
  final isSuccess = false.obs;
  Rx<bool> isNameInvalid = false.obs;
  Rx<bool> isCodeInvalid = false.obs;
  Rx<bool> isTimeInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;

  RxList<TypeModel> category = <TypeModel>[
    TypeModel(name: "1st Course", id: "1"),
    TypeModel(name: "2nd Course", id: "2"),
    TypeModel(name: "3rd Course", id: "3"),
  ].obs;

  RxList<TypeModel> targetGroup = <TypeModel>[
    TypeModel(name: "Group 1", id: "1"),
    TypeModel(name: "Group 2", id: "2"),
    TypeModel(name: "Group 3", id: "3"),
  ].obs;

  void onInit() {
    idFocus.addListener(() {
      if (!idFocus.hasFocus) {
        idScroll.jumpTo(0.0);
      }
    });
    topicFocus.addListener(() {
      if (!topicFocus.hasFocus) {
        topicScroll.jumpTo(0.0);
      }
    });
    descFocus.addListener(() {
      if (!descFocus.hasFocus) {
        descScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  // Future<void> issuccessCreateAssetlist() async {
  //   isSuccess.toggle();

  //   // isToggleOn.value = false;
  //   await {cleardata()};
  // }

  cleardata() {
    //   matNameCtrlr.text = '';
    //   mdmcodeCtrlr.text = '';
    //   descCtrlr.text = '';
    //   reorderQty.text = '';
    //   reqQty.text = '';
    //   // selectedBusinessType.value = '';
    //   selectedUnitOfMeasurement.value = '';
    //   selectedMaterialCategory.value = '';
    //   selectedMaterialType.value = '';
    //   selectedACDC.value = '';
    //   selectedItem = null;
    //   visible = false;
    //   // Future.delayed(Duration(seconds: 1), () {
    //   //   getBusinessList(selectedBusinessTypeId, true);
    //   // });
    //   Future.delayed(Duration(seconds: 5), () {
    //     isSuccess.value = false;
    //   });
  }

  // void onValueChanged(dynamic list, dynamic value) {
  //   switch (list.runtimeType) {
  //     case RxList<UnitMeasurementModel>:
  //       {
  //         int Index = unitMeasurementList.indexWhere((x) => x?.name == value);
  //         selectedUnitOfMeasurementId = unitMeasurementList[Index]?.id ?? 0;
  //         selectedUnitOfMeasurement.value = value;
  //       }
  //       break;
  //     case RxList<AssetCategoryModel>:
  //       {
  //         int Index = materialCategoryList.indexWhere((x) => x?.name == value);
  //         selectedMaterialCategoryId = unitMeasurementList[Index]?.id ?? 0;
  //         selectedMaterialCategory.value = value;
  //       }
  //       break;
  //     case RxList<ACDCModel>:
  //       {
  //         int Index = acdclist.indexWhere((x) => x?.name == value);
  //         selectedACDCId = unitMeasurementList[Index]?.id ?? 0;
  //         selectedACDC.value = value;
  //       }
  //       break;
  //     case RxList<AssetTypeListSMModel>:
  //       {
  //         int Index = materialList.indexWhere((x) => x?.name == value);
  //         selectedMaterialTypeId = unitMeasurementList[Index]?.id ?? 0;
  //         selectedMaterialType.value = value;
  //       }
  //       break;
  //     case RxList<ACDCModel>:
  //       {
  //         int Index = acdclist.indexWhere((x) => x?.name == value);
  //         selectedACDCId = acdclist[Index]?.id ?? 0;
  //         selectedACDC.value = value;
  //       }
  //       break;
  //     default:
  //       {
  //         //statements;
  //       }
  //       break;
  //   }
  // }

  // Future<bool> addCourse() async {
  //   // if (matNameCtrlr.text.trim() == '' ) {
  //   //   isNameInvalid.value = true;
  //   //   isFormInvalid.value = true;
  //   // }

  //   // if (mdmcodeCtrlr.text.trim() == '' ) {
  //   //   isCodeInvalid.value = true;
  //   //   isFormInvalid.value = true;
  //   // }

  //   // if (reqQty.text.trim() == '' ) {
  //   //   isRequiredInvalid.value = true;
  //   //   isFormInvalid.value = true;
  //   // }

  //   // if (reorderQty.text.trim() == '' ) {
  //   //   isReorderInvalid.value = true;
  //   //   isFormInvalid.value = true;
  //   // }

  //   // if (descCtrlr.text.trim() == '' ) {
  //   //   isDescriptionInvalid.value = true;
  //   //   isFormInvalid.value = true;
  //   // }

  //   // checkForm();
  //   // if (isFormInvalid.value) {
  //   //   return false;
  //   // }

  //   // if (matNameCtrlr.text.trim() == '' ||
  //   //     mdmcodeCtrlr.text.trim() == ''  ||
  //   //     reorderQty.text.trim() == '' ||
  //   //     reqQty.text.trim() == '' ||
  //   //     descCtrlr.text.trim() == ''

  //   // ) {
  //   //   Fluttertoast.showToast(
  //   //       msg: "Please enter required field", fontSize: 16.0);
  //   // } else {
  // String _id = courseIdController.text.trim();
  // String _topic = topic.text.trim();
  // String _minutes = minutes.text.trim();
  // String _maxCapacity = maximumCapacity.text.trim();
  // String _desc = descCtrlr.text.trim();

  //   CreateAssetSMModel createAssetSMModel = CreateAssetSMModel(
  //       asset_code: _mdmcode,
  //       asset_name: _name,
  //       asset_description: _desc,
  //       asset_type_ID: selectedMaterialTypeId,
  //       item_category_ID: selectedMaterialCategoryId,
  //       unit_measurement_ID: selectedUnitOfMeasurementId,
  //       min_req_qty: int.parse(_reqQty),
  //       reorder_qty: int.parse(_reorderQty),
  //       approval_required_ID: 1,

  //       // fileData:
  //       fileData: {
  //         "File_path": filePath.value,
  //         "File_name": fileName.value,
  //         "File_type": fileType.value,
  //         "File_size": fileBytes.toString(),
  //       });
  //   //function to write sum of 2 numbers

  //   var assetListJsonString =
  //       createAssetSMModel.toJson(); //createCheckListToJson([createChecklist]);

  //   print({"checklistJsonString", assetListJsonString});
  //   await addAssetPresenter.createAssetSM(
  //     assetListJsonString: assetListJsonString,
  //     isLoading: true,
  //   );
  //   return true;
  //   // }
  //   //   return true;
  // }
}
