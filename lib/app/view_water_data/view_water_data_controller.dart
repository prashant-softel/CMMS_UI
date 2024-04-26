import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/view_water_data/view_water_data_presenter.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/water_data_month.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewWaterDataController extends GetxController {
  ViewWaterDataController(
    this.viewWaterDataPresenter,
  );
  ViewWaterDataPresenter viewWaterDataPresenter;
  final HomeController homecontroller = Get.find();

  bool openPurchaseDatePicker = false;
  var purchaseDateTc = TextEditingController();
  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<int> facilityId = 0.obs;
  Rx<int> type = 0.obs;
  Rx<int> selectedYear = 0.obs;
  Rx<int> selectedMonth = 0.obs;
  Rx<String> monthName = ''.obs;
  Rx<WaterDataMonth?> waterDataByMonth = WaterDataMonth().obs;
  RxList<WaterDataMonth?> waterDataByMonthList = <WaterDataMonth?>[].obs;
  Rx<ItemData?> itemData = ItemData().obs;
  RxList<ItemData?>? itemDataList = <ItemData?>[].obs;
  Rx<Details?> details = Details().obs;
  RxList<Details?>? detailsList = <Details?>[].obs;

  RxList<MonthModel> month = <MonthModel>[
    MonthModel(name: "Please Select", id: "0"),
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
  @override
  void onInit() async {
    await setWaterData();
    facilityIdStreamSubscription =
        homecontroller.facilityId$.listen((event) async {
      facilityId.value = event;
      await getWaterDataMonthDetail(
        month: selectedMonth.value,
        year: selectedYear.value,
        facilityId: facilityId.value,
      );
    });
    super.onInit();
  }

  Future<void> setWaterData() async {
    try {
      String? _monthId = await viewWaterDataPresenter.getMonthValue();
      String? _year = await viewWaterDataPresenter.getYearValue();
      if (_monthId == null || _monthId == '' || _monthId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        selectedMonth.value = dataFromPreviousScreen['monthId'];
        selectedYear.value = dataFromPreviousScreen['year'];
        viewWaterDataPresenter.saveMonthValue(
            monthId: selectedMonth.value.toString());
        viewWaterDataPresenter.saveYearValue(
            year: selectedYear.value.toString());

        monthName.value =
            month.firstWhere((element) => element.id == selectedMonth).name;
      } else {
        selectedMonth.value = int.tryParse(_monthId) ?? 0;
        selectedYear.value = int.tryParse(_year!) ?? 0;
      }
    } catch (e) {
      print(e.toString() + ' month or year');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }

  Future<void> getWaterDataMonthDetail(
      {required int year, required int month, required int facilityId}) async {
    final _waterDataMonthDetail =
        await viewWaterDataPresenter.getWaterDataMonthDetail(
      year: year,
      month: month,
      facilityId: facilityId,
    );

    if (_waterDataMonthDetail != null) {
      waterDataByMonthList.value = _waterDataMonthDetail;
      waterDataByMonth.value =
          waterDataByMonthList.firstWhere((element) => element?.month != null);
      itemDataList?.value = waterDataByMonth.value!.itemData!;
      // detailsList?.value = itemDataList?.value?.details;
    }
  }

  void clearStoreData() {
    viewWaterDataPresenter.clearMonthValue();
    viewWaterDataPresenter.clearYearValue();
  }
}
