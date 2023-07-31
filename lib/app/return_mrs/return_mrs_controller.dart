import 'dart:async';

import 'package:cmms/app/return_mrs/return_mrs_presenter.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../home/home_controller.dart';

class ReturnMrsListController extends GetxController {
  ///
  ReturnMrsListController(
    this.returnmrsListPresenter,
  );
  ReturnMrsListPresenter returnmrsListPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<MrsListModel?>? mrsList = <MrsListModel?>[].obs;
  bool openFromDateToStartDatePicker = false;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  MrsListModel? mrsListModel;
  MrsListModel? selectedItem;
  RxList<String> mrsTableColumns = <String>[].obs;
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  String get formattedFromdate =>
      DateFormat('yyyy-MM-dd').format(fromDate.value);
  String get formattedTodate => DateFormat('yyyy-MM-dd').format(toDate.value);

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getMrsList(facilityId, formattedTodate, formattedFromdate, true);
      });
    });
    super.onInit();
  }

  Future<void> getMrsList(int facilityId, dynamic startDate, dynamic endDate,
      bool isLoading) async {
    mrsList?.value = <MrsListModel>[];
    final _mrsList = await returnmrsListPresenter.getMrsList(
        facilityId: facilityId,
        isLoading: isLoading,
        startDate: startDate,
        endDate: endDate);

    if (_mrsList != null) {
      mrsList!.value = _mrsList;
      paginationController = PaginationController(
        rowCount: mrsList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (mrsList != null && mrsList!.isNotEmpty) {
        mrsListModel = mrsList![0];
        var mrsListJson = mrsListModel?.toJson();
        mrsTableColumns.value = <String>[];
        for (var key in mrsListJson?.keys.toList() ?? []) {
          mrsTableColumns.add(key);
        }
      }
    }
  }

  void getMrsListByDate() {
    getMrsList(facilityId, formattedFromdate, formattedTodate, false);
  }
}
