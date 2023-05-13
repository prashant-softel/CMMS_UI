import 'package:cmms/domain/models/user_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ViewUserDetailUsecase {
  ViewUserDetailUsecase(this.repository);
  Repository repository;
  Future<UserDetailsModel?> getUserDetails({
    int? userId,
    bool? isLoading,
  }) async =>
      await repository.getUserDetails(
        userId,
        isLoading,
      );
}
