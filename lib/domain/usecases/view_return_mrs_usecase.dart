import 'package:cmms/domain/models/get_return_mrs_detail.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsReturnViewUsecase {
  MrsReturnViewUsecase(this.repository);
  Repository repository;
  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getReturnMrsDetails(
        mrsId,
        isLoading,
      );
}
