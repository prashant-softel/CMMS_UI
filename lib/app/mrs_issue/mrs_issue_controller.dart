import 'dart:async';

import 'package:cmms/app/mrs_issue/mrs_issue_presenter.dart';
import 'package:cmms/app/utils/utility.dart';
import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/models/issue_mrs_model.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';
import '../navigators/navigators.dart';

class MrsIssueController extends GetxController {
  ///
  MrsIssueController(
    this.mrsIssuePresenter,
  );
  StreamSubscription<int>? facilityIdStreamSubscription;
  HomeController homeController = Get.find<HomeController>();
  int facilityId = 0;
  Rx<bool> isFacilitySelected = true.obs;
  MrsIssuePresenter mrsIssuePresenter;
  final HomeController homecontroller = Get.find();
  Rx<int> mrsId = 0.obs;
  Rx<MrsDetailsModel?> mrsDetailsModel = MrsDetailsModel().obs;
  RxList<GetAssetItemsModel?> cmmrsItemsDetail = <GetAssetItemsModel>[].obs;
  String whereUsedType = "";
  var commentCtrlr = TextEditingController();

  ///
  @override
  void onInit() async {
    facilityIdStreamSubscription =
        homeController.facilityId$.listen((event) async {
      facilityId = event;
      if (facilityId > 0) {
        isFacilitySelected.value = true;
      }
      Future.delayed(Duration(seconds: 1), () {
        getMrsDetails(
            mrsId: mrsId.value, isloading: true, facilityId: facilityId);
      });
    });
    try {
      await setMrsId();

      if (mrsId != 0) {
        await getMrsDetails(
            mrsId: mrsId.value, isloading: true, facilityId: facilityId);
      }
      super.onInit();
    } catch (e) {
      print(e);
    }
  }

  Future<void> setMrsId() async {
    try {
      final _mrsId = await mrsIssuePresenter.getValue();
      if (_mrsId == null || _mrsId == '' || _mrsId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        mrsId.value = dataFromPreviousScreen['mrsId'];
        mrsIssuePresenter.saveValue(mrsId: mrsId.value.toString());
      } else {
        mrsId.value = int.tryParse(_mrsId) ?? 0;
      }
    } catch (e) {
      Utility.showDialog(e.toString(), 'mrsId');
    }
  }

  Future<void> getMrsDetails(
      {int? mrsId, bool? isloading, required int facilityId}) async {
    final _mrsDetailsModel = await mrsIssuePresenter.getMrsDetails(
        facilityId: facilityId, mrsId: mrsId, isLoading: isloading);

    if (_mrsDetailsModel != null) {
      mrsDetailsModel.value = _mrsDetailsModel;
      cmmrsItemsDetail.value = _mrsDetailsModel.cmmrsItems ?? [];
      // whereUsedType = mrsDetailsModel.value?.whereUsedType == 1 ? "JC" : "PM";
    }
    // print({"mrsdetailss", mrsDetailsModel});
  }

  issueMrs() async {
    {
      String _comment = commentCtrlr.text.trim();
      List<CmmrsItemsModel> cmmrsItems = <CmmrsItemsModel>[];
      cmmrsItemsDetail.forEach((element) {
        cmmrsItems.add(CmmrsItemsModel(
            mrs_item_id: element?.id ?? 0,
            serial_number: element?.serial_number_controller?.text ?? "",
            asset_item_ID: element?.asset_item_ID ?? 0,
            issued_qty:
                int.tryParse(element!.issued_qty_controller!.text) ?? 0));
      });
      IssueMrsModel issueMrs = IssueMrsModel(
          issue_comment: _comment, ID: mrsId.value, cmmrsItems: cmmrsItems);
      var issuetoJsonString = issueMrs.toJson();
      final response = await mrsIssuePresenter.issueMrs(
        issuetoJsonString: issuetoJsonString,
        isLoading: true,
      );
      if (response == true) {
        final _flutterSecureStorage = const FlutterSecureStorage();

        _flutterSecureStorage.delete(key: "mrsId");
        Get.offAllNamed(Routes.mrsListScreen);
      }
    }
  }
}
