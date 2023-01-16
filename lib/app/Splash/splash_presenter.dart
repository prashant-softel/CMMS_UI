import 'package:cmms/domain/domain.dart';

class SplashPresenter {
  SplashPresenter(this.splasUsecase);
  SplasUsecase splasUsecase;

  Future<List<CountryState?>?> getStateList(int countryCode) async {
    return await splasUsecase.getStateList(countryCode);
  }
}
