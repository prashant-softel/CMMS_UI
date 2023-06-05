import 'package:cmms/domain/domain.dart';

import '../models/state.dart';

class SplashUsecase {
  SplashUsecase(this.repository);
  Repository repository;

  Future<List<StateModel?>?> getStateList(int countryCode) async {
    return await repository.getStateList(countryCode);
  }
}
