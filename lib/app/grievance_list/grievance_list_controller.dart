import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/grievance_list/grievance_list_presenter.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/domain/models/grievance_List_model.dart';
import 'package:cmms/domain/models/grievance_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/block_model.dart';
import '../constant/constant.dart';
import '../navigators/app_pages.dart';

class GrievanceController extends GetxController {
  ///
  GrievanceController(
    this.grievanceListPresenter,
  );
  GrievanceListPresenter grievanceListPresenter;
  HomeController homeController = Get.find();

  ///
  RxList<GrievanceListModel?> grievanceList = <GrievanceListModel?>[].obs;
  RxList<BlockModel?> blockList = <BlockModel>[].obs;
  Rx<String> selectedBlock = ''.obs;
  RxList<String> grievanceListTableColumns = <String>[].obs;
  Rx<bool> isBlockSelected = false.obs;
  Rx<int> selectedBlockId = 0.obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<int> grievanceId = 0.obs;
  // Add variables to store filter text for each column
  RxString idFilterText = ''.obs;
  RxString facilityIdFilterText = ''.obs;
  RxString grievanceTypeIdFilterText = ''.obs;
  RxString grievanceTypeFilterText = ''.obs;
  RxString descriptionFilterText = ''.obs;
  RxString concernFilterText = ''.obs;
  RxString resolutionFilterText = ''.obs;
  RxString closeDateFilterText = ''.obs;
  RxString statusIdFilterText = ''.obs;
  RxString statusShortFilterText = ''.obs;
  RxString statusLongFilterText = ''.obs;
  RxString createdByFilterText = ''.obs;
  RxString createdByNameFilterText = ''.obs;
  RxString createdAtFilterText = ''.obs;
  RxString updatedByFilterText = ''.obs;
  RxString updatedByNameFilterText = ''.obs;
  RxString updatedAtFilterText = ''.obs;
  RxString status_shortFilterText = ''.obs;
  RxString deletedAtFilterText = ''.obs;
  RxString deletedByFilterText = ''.obs;
  RxString deletedByNameFilterText = ''.obs;
  RxString addedByFilterText = ''.obs;
  RxString addedAtFilterText = ''.obs;

  Future<void> getGrievanceList(
    int userId,
    bool self_view,
  ) async {
    grievanceList.value = <GrievanceListModel>[];
    if (facilityId > 0) {
      final _grievanceList = await grievanceListPresenter.getGrievanceList(
        facilityId: facilityId,
        // userId: userId,
        self_view: varUserAccessModel.value.access_list!
                    .where((e) =>
                        e.feature_id ==
                            UserAccessConstants.kGrievanceFeatureId &&
                        e.selfView == UserAccessConstants.kHaveSelfViewAccess)
                    .length >
                0
            ? true
            : false,
        isLoading: true,
      );
      if (_grievanceList != null && _grievanceList.isNotEmpty) {
        grievanceList.value = _grievanceList;
        update(["grievanceList"]);
        paginationController = PaginationController(
          rowCount: grievanceList.length,
          rowsPerPage: 10,
        );

        grievanceModel = grievanceList[0];
        var grievanceJson = grievanceModel?.toJson();
        grievanceListTableColumns.value = <String>[];
        for (var key in grievanceJson?.keys.toList() ?? []) {
          grievanceListTableColumns.add(key);
        }
      }
    }
  }

  int facilityId = 0;
  int userId = 0;
  String? GrievanceType;
  GrievanceListModel? grievanceModel;
  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  StreamSubscription<String>? facilityNameStreamSubscription;

  //RxString get grievanceDetailsFilterText => null;

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 1), () {
        userId = varUserAccessModel.value.user_id ?? 0;
        // ignore: unnecessary_null_comparison
        if (userId != null) {
          getGrievanceList(userId, true);
        }
      });
    });

    facilityNameStreamSubscription =
        homeController.facilityName$.listen((event) {
      GrievanceType = event;
    });

    super.onInit();
  }

  Future<void> switchFacility(String? grievanceName) async {
    grievanceId = grievanceList.indexWhere(
        (grievance) => grievance?.concern == grievanceName) as Rx<int>;
    await getGrievanceList(userId, false);
  }

  Future<void> getFacilityList({bool? isLoading}) async {
    grievanceList.value = <GrievanceListModel>[];
    List<GrievanceListModel?>? _grievanceList = <GrievanceListModel?>[];

    _grievanceList =
        await grievanceListPresenter.getGrievanceList(self_view: true);
    if (_grievanceList != null && _grievanceList.isNotEmpty) {
      grievanceList.value = _grievanceList;
    }
    if (grievanceList.isNotEmpty) {
      selectedBlock.value = (grievanceList[0]?.facilityId ?? '').toString();
    }

    void clearStoreData() {
      grievanceListPresenter.clearValue();
    }

    void goToAddGrievanceScreen() {
      Get.toNamed(Routes.addGrievance, arguments: facilityId);
    }

    void goToGrievanceCardScreen(int? grievanceId) {
      clearStoreData();

      Get.toNamed(Routes.grievanceCard,
          arguments: {'grievanceId': grievanceId});
    }

    void goToEditGrievanceScreen(int? _grievanceId) {
      clearStoreData();

      Get.toNamed(Routes.editGrievance,
          arguments: {'grievanceId': _grievanceId});
    }

    void goToGrievanceDetailsScreen(int? _grievanceId) {
      clearStoreData();

      Get.toNamed(Routes.grievanceDetails,
          arguments: {'grievanceId': _grievanceId});
    }

    String formatDate(String? inputDateTime) {
      ///
      String formattedDateTimeString = '';

      if (inputDateTime != null &&
          inputDateTime.isNotEmpty &&
          inputDateTime != "null")
      // Parse the input DateTime string
      {
        DateFormat inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss.SSS");
        DateTime parsedDateTime = inputFormat.parse(inputDateTime);

        // Format the parsed DateTime to the desired format
        DateFormat outputFormat = DateFormat("yyyy-MM-dd hh:mm");
        formattedDateTimeString = outputFormat.format(parsedDateTime);
      }

      return formattedDateTimeString;
    }

    ///
  }

  onBlockChanged(dropdownList, selectedValue) {
    int blockIndex = blockList.indexWhere((x) => x?.name == selectedValue);
    selectedBlockId.value = blockList[blockIndex]?.id ?? 0;
    if (selectedBlockId.value > 0) {
      isBlockSelected.value = true;
    }
    selectedBlock.value = selectedValue;
    getGrievanceList(userId, false);
  }

  void clearStoreData() {
    grievanceListPresenter.clearValue();
  }

  void goToGrievanceDetailsScreen(int? _grievanceId) {
    clearStoreData();

    Get.toNamed(Routes.grievanceDetails,
        arguments: {'grievanceId': _grievanceId});
  }

  void goToAddGrievanceScreen() {
    Get.toNamed(Routes.addGrievance, arguments: facilityId);
  }

  String formatDate(String? inputDateTime) {
    ///
    String formattedDateTimeString = '';

    if (inputDateTime != null &&
        inputDateTime.isNotEmpty &&
        inputDateTime != "null")
    // Parse the input DateTime string
    {
      DateFormat inputFormat = DateFormat("yyyy-MM-dd hh:mm:ss.SSS");
      DateTime parsedDateTime = inputFormat.parse(inputDateTime);

      // Format the parsed DateTime to the desired format
      DateFormat outputFormat = DateFormat("yyyy-MM-dd hh:mm");
      formattedDateTimeString = outputFormat.format(parsedDateTime);
    }

    return formattedDateTimeString;
  }

  void goToEditGrievanceScreen(int? _jobId) {
    clearStoreData();

    Get.toNamed(Routes.editJob, arguments: {'jobId': _jobId});
  }
}
