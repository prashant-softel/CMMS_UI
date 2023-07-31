import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsReturnViewUsecase {
  MrsReturnViewUsecase(this.repository);
  Repository repository;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        isLoading,
      );
}
