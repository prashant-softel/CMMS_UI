import '../../domain/usecases/login_usecase.dart';

class LoginPresenter {
  LoginPresenter(this.loginUsecase);
  LoginUsecase loginUsecase;

  ///

  Future<void> generateToken({
    auth,
    required bool isLoading,
  }) async {
    print("presenter");
    return loginUsecase.generateToken(
      auth: auth,
      isLoading: isLoading,
    );
  }

  ///
}
