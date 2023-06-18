import 'dart:async';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/document_manager_model.dart';
import '../home/home_controller.dart';
import 'document_manager_presenter.dart';

class DocumentManagerController extends GetxController {
  ///
  DocumentManagerController(
    this.documentManagerPresenter,
  );
  DocumentManagerPresenter documentManagerPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  RxList<DocumentManagerModel?>? userList = <DocumentManagerModel?>[].obs;

  PaginationController paginationController = PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );
  DocumentManagerModel? userListModel;
  RxList<String> userListTableColumns = <String>[].obs;
  DocumentManagerModel? selectedItem;

  @override
  void onInit() async {
    facilityIdStreamSubscription = homecontroller.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        getDocumentManager(facilityId, true);
      });
    });

    super.onInit();
  }

  Future<void> getDocumentManager(int facilityId, bool isLoading) async {
    userList?.value = <DocumentManagerModel>[];
    final _userList = await documentManagerPresenter.getDocumentManager(
        facilityId: facilityId, isLoading: isLoading);

    if (_userList != null) {
      userList!.value = _userList;
      paginationController = PaginationController(
        rowCount: userList?.length ?? 0,
        rowsPerPage: 10,
      );

      if (userList != null && userList!.isNotEmpty) {
        userListModel = userList![0];
        var userListJson = userListModel?.toJson();
        userListTableColumns.value = <String>[];
        for (var key in userListJson?.keys.toList() ?? []) {
          userListTableColumns.add(key);
        }
      }
    }
  }
}
