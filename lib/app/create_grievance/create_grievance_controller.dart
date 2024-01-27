import 'dart:async';
import 'package:cmms/app/create_grievance/create_grievance_presenter.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/req_order_details_by_id_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../home/home_controller.dart';

class CreateGrievanceController extends GetxController {
  ///
  CreateGrievanceController(
    this.createGrievancePresenter,
  );

  CreateGrievancePresenter createGrievancePresenter;
  final HomeController homecontroller = Get.find();
  RxList<List<Map<String, String>>> rowItem = <List<Map<String, String>>>[].obs;

  RxList<TypeModel> createGrievance = <TypeModel>[
    TypeModel(name: 'Contractor Workforce', id: "1"),
    TypeModel(name: 'Local Communities', id: "2")
  ].obs;
  var concernController = TextEditingController();
  FocusNode concernFocus = FocusNode();
  ScrollController concernScroll = ScrollController();
  Rx<bool> isConcernInvalid = false.obs;

  Rx<bool> isFormInvalid = false.obs;
  FocusNode descFocus = FocusNode();
  ScrollController descScroll = ScrollController();
  Rx<GetRODetailsByIDModel?> getPurchaseDetailsByIDModel =
      GetRODetailsByIDModel().obs;
  RxList<HistoryModel?>? historyList = <HistoryModel?>[].obs;
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  // int get facilityId => _facilityId.value;
  int selectedPurchaseID = 0;
  var commentCtrlr = TextEditingController();
  FocusNode commentFocus = FocusNode();
  ScrollController commentScroll = ScrollController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  final HomeController homeController = Get.find();
  int facilityId = 0;
  Rx<int> roId = 0.obs;

  @override
  void onInit() async {
    concernFocus.addListener(() {
      if (!concernFocus.hasFocus) {
        concernScroll.jumpTo(0.0);
      }
    });
    super.onInit();
  }

  Future<void> setUserId() async {
    try {
      final _roId = await createGrievancePresenter.getValue();

      if (_roId == null || _roId == '' || _roId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        roId.value = dataFromPreviousScreen['roId'];

        createGrievancePresenter.saveValue(roId: roId.value.toString());
      } else {
        roId.value = int.tryParse(_roId) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'roId');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }
}
