import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_observation/create_observation_presenter.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:get/get.dart';

class CreateObservationController extends GetxController {
  ///
  CreateObservationController(
    this.createObservationPresenter,
  );
  CreateObservationPresenter createObservationPresenter;
  HomeController homeController = Get.find();
  RxList<BusinessListModel?> ownerList = <BusinessListModel>[].obs;
  Rx<bool> isSelectedBusinessType = true.obs;

  int selectedBusinessTypeId = 1;
  Rx<String> selectedBusinessType = ''.obs;

  ///

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  Rx<String> selectedBlock = ''.obs;
  RxList<MonthModel> month = <MonthModel>[
    MonthModel(name: 'Jan', id: "1"),
    MonthModel(name: 'Feb', id: "2"),
    MonthModel(name: 'March', id: "3"),
    MonthModel(name: 'April', id: "4"),
    MonthModel(name: 'May', id: "5"),
    MonthModel(name: 'June', id: "6"),
    MonthModel(name: 'July', id: "7"),
    MonthModel(name: 'Aug', id: "8"),
    MonthModel(name: 'Sept', id: "9"),
    MonthModel(name: 'Oct', id: "10"),
    MonthModel(name: 'Nov', id: "11"),
    MonthModel(name: 'Dec', id: "12"),
  ].obs;
  RxList<MonthModel> typeOfObservation = <MonthModel>[
    MonthModel(name: 'Unsafe Act', id: "1"),
    MonthModel(name: 'Unsafe Condition', id: "2"),
    MonthModel(name: 'Statutory Non Compliance', id: "3"),
  ].obs;
  RxList<MonthModel> sourceOfObservation = <MonthModel>[
    MonthModel(name: 'Site Inspection ', id: "1"),
    MonthModel(name: 'Monitoring Checklist of Electrical ', id: "2"),
    MonthModel(name: 'Vehicle fitness Checklist ', id: "3"),
  ].obs;
  RxList<MonthModel> riskType = <MonthModel>[
    MonthModel(name: 'Major ', id: "1"),
    MonthModel(name: 'Significant ', id: "2"),
    MonthModel(name: 'Moderate ', id: "3"),
  ].obs;
  RxList<MonthModel> costType = <MonthModel>[
    MonthModel(name: 'Capex ', id: "1"),
    MonthModel(name: 'Opex ', id: "2"),
  ].obs;

  ///
  // final excel = Excel.createExcel();
  // int facilityId = 0;
  // int userId = 0;
  // String? facilityName;
  // JobModel? jobModel;
  // PaginationController paginationController = PaginationController(
  //   rowCount: 0,
  //   rowsPerPage: 10,
  // );
  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  ///
  @override
  void onInit() async {
    // facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
    //   facilityId = event;
    //   // Future.delayed(Duration(seconds: 1), () {
    //   // userId = varUserAccessModel.value.user_id ?? 0;
    //   // if (userId != null) {

    //   // }
    //   // });
    // });
    // facilityNameStreamSubscription =
    //     homeController.facilityName$.listen((event) {
    //   facilityName = event;

    //   // });
    // });
    super.onInit();
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await createObservationPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case RxList<BusinessTypeModel>:
        {
          int equipmentIndex = ownerList.indexWhere((x) => x?.name == value);
          selectedBusinessTypeId = ownerList[equipmentIndex]?.id ?? 0;
        }
        break;
    }
  }
}
