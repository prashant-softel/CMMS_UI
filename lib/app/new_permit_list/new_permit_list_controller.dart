import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_presenter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../domain/models/block_model.dart';
// import '../navigators/app_pages.dart';
// import 'job_list_presenter.dart';

class NewPermitListController extends GetxController {
  ///
  NewPermitListController(
    this.newPermitListPresenter,
  );
  NewPermitListPresenter newPermitListPresenter;

  ///
  RxList<NewPermitListModel?>? newPermitList = <NewPermitListModel?>[].obs;
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedFacility = ''.obs;
  Rx<bool> isFacilitySelected = false.obs;
  int facilityId = 46;
  int userId = 35;
  Rx<int> permitId = 0.obs;
  var breakdownTime;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  NewPermitListModel? newPermitListModel;
  RxList<String> newPermitListTableColumns = <String>[].obs;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );

  ///
  @override
  void onInit() async {
    //homePresenter.generateToken();

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList(isLoading: true);
      Future.delayed(Duration(milliseconds: 500), () {
        getNewPermitList(facilityId, userId);
      });
    });

    super.onInit();
  }

  void switchFacility(String? facilityName) {
    facilityId =
        facilityList.indexWhere((facility) => facility?.name == facilityName);
    getNewPermitList(facilityId, userId);
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    facilityList.value = <FacilityModel>[];
    List<FacilityModel?>? _facilityList = <FacilityModel?>[];

    _facilityList = await newPermitListPresenter.getFacilityList();
    if (_facilityList != null && _facilityList.isNotEmpty) {
      facilityList.value = _facilityList;
    }
    if (facilityList.isNotEmpty) {
      selectedFacility.value = facilityList[0]?.name ?? '';
    }
  }

  Future<void> getNewPermitList(int facilityId, int userId) async {
    newPermitList?.value = <NewPermitListModel>[];
    final _newPermitList = await newPermitListPresenter.getNewPermitList(
        // facilityId: facilityId,
        facilityId: 45,
        // userId: userId,
        userId: 33);

    if (_newPermitList != null) {
      newPermitList!.value = _newPermitList;
      paginationController = PaginationController(
        rowCount: newPermitList!.length,
        rowsPerPage: 10,
      );

      if (newPermitList != null && newPermitList!.isNotEmpty) {
        newPermitListModel = newPermitList![0];
        var newPermitListJson = newPermitListModel?.toJson();
        newPermitListTableColumns.value = <String>[];
        for (var key in newPermitListJson?.keys.toList() ?? []) {
          newPermitListTableColumns.add(key);
        }
      }
    }
  }

  Future<void> addNewPermitList() async {
    Get.toNamed(Routes.newPermit, arguments: facilityId);
  }

  void goToJobCardScreen(int? jobId) {
    Get.toNamed(Routes.jobCard, arguments: jobId);
  }

  void showNewPermitListDetails(int _jobId) {
    // Get.toNamed(Routes.jobDetails, arguments: _jobId);
  }

  ///
}
