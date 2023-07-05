import 'dart:async';

import 'package:cmms/app/mrs/mrs_list_presenter.dart';
import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../home/home_controller.dart';

class MrsListController extends GetxController {
  ///
  MrsListController(
    this.mrsListPresenter,
  );
  MrsListPresenter mrsListPresenter;
  final HomeController homecontroller = Get.find();
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<MrsListModel?>? mrsList = <MrsListModel?>[].obs;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  MrsListModel? mrsListModel;

  RxList<String> mrsTableColumns = <String>[].obs;

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getMrsList(facilityId, true);
      });
    });
    super.onInit();
  }

  Future<void> getMrsList(int facilityId, bool isLoading) async {
    mrsList?.value = <MrsListModel>[];
    final _mrsList = await mrsListPresenter.getMrsList(
        facilityId: facilityId, isLoading: isLoading);

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
}
