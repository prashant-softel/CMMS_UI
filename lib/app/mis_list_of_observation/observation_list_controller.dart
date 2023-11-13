import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'observation_list_presenter.dart';

class ObservationListController extends GetxController {
  ///
  ObservationListController(
    this.observationListPresenter,
  );
  ObservationListPresenter observationListPresenter;
  HomeController homeController = Get.find();

  ///

  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;

  Rx<String> selectedBlock = ''.obs;

  ///
  final excel = Excel.createExcel();
  int facilityId = 0;
  int userId = 0;
  String? facilityName;
  JobModel? jobModel;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      // Future.delayed(Duration(seconds: 1), () {
      // userId = varUserAccessModel.value.user_id ?? 0;
      // if (userId != null) {

      // }
      // });
    });
    facilityNameStreamSubscription =
        homeController.facilityName$.listen((event) {
      facilityName = event;

      // });
    });
    super.onInit();
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await observationListPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedBlock.value = facilityList[0]?.name ?? '';
    }
  }
}
