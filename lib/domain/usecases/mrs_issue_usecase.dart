import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MrsIssueUsecase {
  MrsIssueUsecase(this.repository);
  Repository repository;
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        isLoading,
      );
  Future<bool> rejectMrs({
    rejecttoJsonString,
    bool? isLoading,
  }) async =>
      await repository.rejectMrs(
          rejecttoJsonString: rejecttoJsonString, isLoading: isLoading);
}
