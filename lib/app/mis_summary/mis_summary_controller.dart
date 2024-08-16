import 'dart:async';

import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/mis_summary/mis_summary_presenter.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class MisSummaryController extends GetxController {
  ///
  MisSummaryController(
    this.misSummaryPresenter,
  );
  MisSummaryPresenter misSummaryPresenter;

  final HomeController controller = Get.find();
  RxList<GetStatutoryList> getStatutoryList = <GetStatutoryList>[].obs;
  int facilityId = 0;
  Rx<int> StatutoryId = 0.obs;
  RxString idFilterText = ''.obs;
  RxString complianceFilterText = ''.obs;
  RxString statusOFApplicationFilterText = ''.obs;
  RxString dateofReceivedFilterText = ''.obs;
  RxString validityFilterText = ''.obs;
  RxString daysLeftFilterText = ''.obs;
  RxString expiresOnFilterText = ''.obs;
  RxString statusCodeFilterText = ''.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;
  @override
  void onInit() async {
    facilityIdStreamSubscription = controller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        getStatutoryDataList(facility_id:facilityId,isLoading:true ,isExport: false, end_date:"2024-08-07", start_date:"24-08-14");
      });
    });
    super.onInit();
  }

  Future<void> getStatutoryDataList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    final _StatutoryDataList = await misSummaryPresenter.getStatutoryDataList(
        isLoading: isLoading, facility_id: facility_id,start_date:start_date, end_date: end_date);

    if (_StatutoryDataList != null) {
      getStatutoryList.value = _StatutoryDataList;
   
      for (var statutoryData in getStatutoryList) {
        getStatutoryList.value = <GetStatutoryList>[].obs;
      }
    }
  }
}