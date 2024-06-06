import 'dart:async';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/view_waste_data/view_waste_data_presenter.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/models/waste_data_month_model.dart';
import 'package:get/get.dart';

class ViewWasteDataController extends GetxController {
  ViewWasteDataController(
    this.viewWasteDataPresenter,
  );
  ViewWasteDataPresenter viewWasteDataPresenter;
  final HomeController homecontroller = Get.find();

  StreamSubscription<int>? facilityIdStreamSubscription;
  Rx<int> facilityId = 0.obs;
  Rx<int> type = 0.obs;
  RxInt hazardous = 0.obs;
  Rx<int> selectedYear = 0.obs;
  Rx<int> selectedMonth = 0.obs;
  Rx<String> monthName = ''.obs;
  Rx<WasteDataMonthModel?> wasteDataByMonth = WasteDataMonthModel().obs;
  RxList<WasteDataMonthModel?> wasteDataByMonthList =
      <WasteDataMonthModel?>[].obs;

  RxList<MonthModel> month = <MonthModel>[
    MonthModel(name: "Please Select", id: "0"),
    MonthModel(name: 'January', id: "1"),
    MonthModel(name: 'February', id: "2"),
    MonthModel(name: 'March', id: "3"),
    MonthModel(name: 'April', id: "4"),
    MonthModel(name: 'May', id: "5"),
    MonthModel(name: 'June', id: "6"),
    MonthModel(name: 'July', id: "7"),
    MonthModel(name: 'August', id: "8"),
    MonthModel(name: 'September', id: "9"),
    MonthModel(name: 'October', id: "10"),
    MonthModel(name: 'November', id: "11"),
    MonthModel(name: 'December', id: "12"),
  ].obs;
  @override
  void onInit() async {
    await setWaterData();
    facilityIdStreamSubscription =
        homecontroller.facilityId$.listen((event) async {
      facilityId.value = event;
      await getWasteDataMonthDetail(
        month: selectedMonth.value,
        year: selectedYear.value,
        facilityId: facilityId.value,
        hazardous: hazardous.value,
      );
    });
    super.onInit();
  }

  Future<void> setWaterData() async {
    try {
      String? _monthId = await viewWasteDataPresenter.getMonthValue();
      String? _year = await viewWasteDataPresenter.getYearValue();
      String? _hazardous = await viewWasteDataPresenter.getHazardousValue();
      if (_monthId == null || _monthId == '' || _monthId == "null") {
        var dataFromPreviousScreen = Get.arguments;

        selectedMonth.value = dataFromPreviousScreen['monthId'];
        selectedYear.value = dataFromPreviousScreen['year'];
        hazardous.value = dataFromPreviousScreen['hazardous'];

        viewWasteDataPresenter.saveMonthValue(
            monthId: selectedMonth.value.toString());
        viewWasteDataPresenter.saveYearValue(
            year: selectedYear.value.toString());
        viewWasteDataPresenter.saveHazardousValue(
            hazardous: hazardous.value.toString());

        monthName.value =
            month.firstWhere((element) => element.id == selectedMonth).name;
      } else {
        selectedMonth.value = int.tryParse(_monthId) ?? 0;
        selectedYear.value = int.tryParse(_year ?? "") ?? 0;
        hazardous.value = int.tryParse(_hazardous ?? "") ?? 0;
      }
    } catch (e) {
      print(e.toString() + ' month or year');
      //  Utility.showDialog(e.toString() + 'type');
    }
  }

  Future<void> getWasteDataMonthDetail({
    required int year,
    required int month,
    required int facilityId,
    required int hazardous,
  }) async {
    final _wasteDataMonthDetail =
        await viewWasteDataPresenter.getWasteDataMonthDetail(
      year: year,
      month: month,
      facilityId: facilityId,
      hazardous: hazardous,
    );

    wasteDataByMonth.value = _wasteDataMonthDetail;
      update(['waste-controller']);
  }

  void clearStoreData() {
    viewWasteDataPresenter.clearMonthValue();
    viewWasteDataPresenter.clearYearValue();
    viewWasteDataPresenter.clearHazardousValue();
  }
}
