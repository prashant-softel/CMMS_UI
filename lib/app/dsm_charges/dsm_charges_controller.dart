import 'package:cmms/app/dsm_charges/dsm_charges_presenter.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class DsmChargesListController extends GetxController {
  ///
  DsmChargesListController(
    this.dsmChargesListPresenter,
  );

  DsmChargesListPresenter dsmChargesListPresenter;
  final HomeController homecontroller = Get.find();
  Rx<bool> issitenameSelected = true.obs;
  Rx<bool> ismonthSelected = true.obs;
  Rx<bool> isyearSelected = true.obs;
  RxList<MonthModel?> sitenamesList = <MonthModel>[].obs;
  RxList<int> selectedsitenameIdList = <int>[].obs;
  RxList<int> selectedyearIdList = <int>[].obs;
  RxList<int> selectedmonthIdList = <int>[].obs;
  RxList<MonthModel> siteName = <MonthModel>[
    MonthModel(name: 'CNHaill', id: "1"),
    MonthModel(name: 'Bellary', id: "2"),
  ].obs;
  RxList<MonthModel> month = <MonthModel>[
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
  RxList<MonthModel> year = <MonthModel>[
    MonthModel(name: '2023', id: "1"),
    MonthModel(name: '2024', id: "2"),
    MonthModel(name: '2025', id: "3"),
    MonthModel(name: '2026', id: "4"),
  ].obs;

  void sitenameSelected(_selectedsitenames) {
    selectedsitenameIdList.value = <int>[];
    for (var _selectedsitename in _selectedsitenames) {
      // Convert String to int if needed
      int? id = int.tryParse(_selectedsitename.id ?? "");
      if (id != null) {
        selectedsitenameIdList.add(id);
      }
    }
    print('selected site name: $selectedsitenameIdList');
    // getInventoryList(
    //   facilityId: facilityId,
    //   blockId: selectedBlockId,
    //   receivedCategoryIds: selectedsitenameIdList,
    // );
    // getWorkTypeList(receivedCategoryIds: selectedsitenameIdList);
  }

  void yearSelected(_selectedyearnames) {
    selectedyearIdList.value = <int>[];
    for (var _selectedyear in _selectedyearnames) {
      // Convert String to int if needed
      int? id = int.tryParse(_selectedyear.id ?? "");
      if (id != null) {
        selectedyearIdList.add(id);
      }
    }
    print('selected year: $selectedyearIdList');
    // getInventoryList(
    //   facilityId: facilityId,
    //   blockId: selectedBlockId,
    //   receivedCategoryIds: selectedsitenameIdList,
    // );
    // getWorkTypeList(receivedCategoryIds: selectedsitenameIdList);
  }

  void monthSelected(_selectedmonthnames) {
    selectedmonthIdList.value = <int>[];
    for (var _selectedmonth in _selectedmonthnames) {
      // Convert String to int if needed
      int? id = int.tryParse(_selectedmonth.id ?? "");
      if (id != null) {
        selectedmonthIdList.add(id);
      }
    }
    print('selected month: $selectedmonthIdList');
    // getInventoryList(
    //   facilityId: facilityId,
    //   blockId: selectedBlockId,
    //   receivedCategoryIds: selectedsitenameIdList,
    // );
    // getWorkTypeList(receivedCategoryIds: selectedsitenameIdList);
  }
}
