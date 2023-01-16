import 'package:cmms/domain/domain.dart';

class SplasUsecase {
  SplasUsecase(this.repository);
  Repository repository;

  Future<List<CountryState?>?> getStateList(int countryCode) async {
    return await repository.getStateList(countryCode);
  }
}
