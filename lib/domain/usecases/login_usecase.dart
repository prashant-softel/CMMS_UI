import 'package:cmms/domain/repositories/repository.dart';

class LoginUsecase {
  LoginUsecase(this.repository);
  Repository repository;

  ///
  Future<void> generateToken({
    auth,
    bool? isLoading,
  }) async =>
      await repository.generateToken(auth: auth, isLoading: isLoading);

  ///
}
