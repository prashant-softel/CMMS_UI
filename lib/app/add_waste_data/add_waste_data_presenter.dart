import 'package:cmms/domain/models/audit_plan_list_model.dart';
import 'package:cmms/domain/usecases/add_waste_data_usecase.dart';
import 'package:cmms/domain/usecases/water_data_usecase.dart';

class AddWasteDataPresenter {
  AddWasteDataPresenter(this.addWasteDataUsecase);
  AddWasteDataUsecase addWasteDataUsecase;

  Future<String?> getValue() async => await addWasteDataUsecase.getValue();
  void clearValue() async => addWasteDataUsecase.clearValue();
  void clearStoreIdData() async => addWasteDataUsecase.clearStoreIdData();
}
