import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/create_grievance/create_grievance_presenter.dart';
import 'package:cmms/app/grievance_list/grievance_list_presenter.dart';
import 'package:cmms/app/home/home_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/grievance_type_model.dart';
import 'package:cmms/domain/models/grievance_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import '../home/home_controller.dart';
import 'package:cmms/app/create_grievance/widgets/grievance_created_dialog.dart';

class CreateGrievanceController extends GetxController {
  ///
  CreateGrievanceController(
    this.createGrievancePresenter,
    this.grievanceListPresenter,
    this.homePresenter,
  );

  CreateGrievancePresenter createGrievancePresenter;
  HomePresenter homePresenter;
  GrievanceListPresenter grievanceListPresenter;

  HomeController homecontroller = Get.find();
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  RxList<TypeModel> createGrievance = <TypeModel>[].obs;
  var concernController = TextEditingController();
  FocusNode concernFocus = FocusNode();
  ScrollController concernScroll = ScrollController();
  var descriptionController = TextEditingController();
  FocusNode descriptionFocus = FocusNode();
  ScrollController descriptionScroll = ScrollController();
  var GrievanceTitleCtrlr = TextEditingController();
  ScrollController GrievancetitleScroll = ScrollController();
  Rx<bool> isConcernInvalid = false.obs;
  Rx<bool> isFormInvalid = false.obs;
  Rx<bool> isGrievanceTitleInvalid = false.obs;
  Rx<bool> isDescriptionInvalid = false.obs;
  //FocusNode descFocus = FocusNode();
  HtmlEscape htmlEscape = HtmlEscape();
  Rx<GetRODetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetRODetailsByIDModel().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  var breakdownTimeCtrlr = TextEditingController();
  // int get facilityId => _facilityId.value;
  int selectedPurchaseID = 0;
  var commentCtrlr = TextEditingController();
  FocusNode commentFocus = FocusNode();
  ScrollController commentScroll = ScrollController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  final HomeController homeController = Get.find();
  int facilityId = 0;
  Rx<int> roId = 0.obs;
  List<int> selectedAssetsIdList = [];
  RxList<CreateGrievanceModel?> selectedWorkAreaList =
      <CreateGrievanceModel>[].obs;
  RxList<GrievanceTypeModel?> grievanceType = <GrievanceTypeModel>[].obs;
  int? selectedGrievanceTypeId = 0;
  Rx<bool> isGrievanceTypeSelected = true.obs;
  Rx<String> selectedGrievanceType = ''.obs;

  @override
  void onInit() async {
    try {
      facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
        facilityId = event;
      });
      Future.delayed(Duration(seconds: 1), () {
        getGrievanceType();
      });
      // getGrievanceType();
    } catch (e) {
      print(e.toString());
    }
    concernFocus.addListener(() {
      if (!concernFocus.hasFocus) {
        concernScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  // Future<void> setUserId() async {
  //   try {
  //     final _roId = await createGrievancePresenter.getValue();

  //     if (_roId == null || _roId == '' || _roId == "null") {
  //       var dataFromPreviousScreen = Get.arguments;

  //       roId.value = dataFromPreviousScreen['roId'];

  //       createGrievancePresenter.saveValue(roId: roId.value.toString());
  //     } else {
  //       roId.value = int.tryParse(_roId) ?? 0;
  //     }
  //   } catch (e) {
  //     print(e.toString() + 'roId');
  //     //  Utility.showDialog(e.toString() + 'userId');
  //   }
  // }

  Future<void> getGrievanceType() async {
    final _grievanceType = await createGrievancePresenter.getGrievanceType();

    if (_grievanceType != null) {
      _grievanceType != [];
      for (var grievance in _grievanceType) {
        grievanceType.add(grievance);
      }
      // selectedTypePermit.value = grievanceType[0]?.name ?? '';
    }
  }

  ///
  goToCreateGrievanceScreen() {
    Get.offNamed(Routes.addGrievance);
  }

  goToJobListScreen() {
    Get.offAllNamed(Routes.jobList);
  }

  static void showAlertDialog({
    int? grievanceId,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
        GrievanceCreatedDialog(grievanceId: grievanceId, message: message));
  }

  void saveGrievance() async {
    try {
      String _concern = htmlEscape.convert(descriptionController.text.trim());
      String _description =
          htmlEscape.convert(descriptionController.text.trim());
      selectedAssetsIdList.clear();

      for (var _selectedWorkArea in selectedWorkAreaList) {
        selectedAssetsIdList.add(_selectedWorkArea?.grievanceType ?? 0);
      }

      CreateGrievanceModel createGrievanceModel = CreateGrievanceModel(
        grievanceType: selectedGrievanceTypeId,
        facilityId: facilityId,
        concern: _concern,
        description: _description,
      );

      Map<String, dynamic>? responseMapGrievanceCreated =
          await createGrievancePresenter.saveGrievance(
        grievance: createGrievanceModel,
        isLoading: true,
      );

      if (responseMapGrievanceCreated != null) {
        var _grievanceId = 0;
        var _message = '';
        if (responseMapGrievanceCreated["grievanceType"] != null &&
            responseMapGrievanceCreated["grievanceType"].isNotEmpty) {
          _grievanceId = responseMapGrievanceCreated["grievanceType"][0];
        }
        if (responseMapGrievanceCreated["message"] != null) {
          _message = responseMapGrievanceCreated["message"];
        }
        showAlertDialog(grievanceId: _grievanceId, message: _message);
      }
    } catch (e) {
      // Utility.showDialog(e.toString());
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<GrievanceTypeModel>:
        {
          int grievanceTypeIndex =
              grievanceType.indexWhere((x) => x?.name == value);
          // selectedTypePermitId = facilityList[grievanceTypeIndex]?.id ?? 0;
          selectedGrievanceTypeId = grievanceType[grievanceTypeIndex]?.id ?? 0;
          print('PErmit Type Id: $selectedGrievanceTypeId');
          if (selectedGrievanceTypeId != 0) {
            isGrievanceTypeSelected.value = true;
          }
          selectedGrievanceType.value = value;
        }
        break;
    }
  }
}
