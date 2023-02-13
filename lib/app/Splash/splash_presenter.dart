import 'package:cmms/domain/domain.dart';

import '../../domain/models/state.dart';

class SplashPresenter {
  SplashPresenter(this.splashUsecase);
  SplashUsecase splashUsecase;

  Future<List<CountryState?>?> getStateList(int countryCode) async {
    return await splashUsecase.getStateList(countryCode);
  }
}
