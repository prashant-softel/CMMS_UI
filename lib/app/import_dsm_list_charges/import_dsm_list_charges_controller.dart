import 'package:cmms/app/import_dsm_list_charges/import_dsm_list_charges_presenter.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:get/get.dart';
import '../home/home_controller.dart';

class ImportDsmListChargesListController extends GetxController {
  ///
  ImportDsmListChargesListController(
    this.importDsmListDsmChargesListPresenter,
  );

  ImportDsmListChargesListPresenter importDsmListDsmChargesListPresenter;
  final HomeController homecontroller = Get.find();
  RxList<MonthModel> siteName = <MonthModel>[
    MonthModel(name: 'CHnaill', id: "1"),
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
}
