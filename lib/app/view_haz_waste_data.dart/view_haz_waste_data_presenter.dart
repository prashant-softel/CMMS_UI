import 'package:cmms/domain/usecases/view_haz_waste_data_usecase.dart';

class ViewHazWasteDataPresenter {
  ViewHazWasteDataPresenter(this.viewHazWasteDataUsecase);
  ViewHazWasteDataUsecase viewHazWasteDataUsecase;

  Future<String?> getValue() async => await viewHazWasteDataUsecase.getValue();
  void clearValue() async => viewHazWasteDataUsecase.clearValue();
  void clearStoreIdData() async => viewHazWasteDataUsecase.clearStoreIdData();
}
