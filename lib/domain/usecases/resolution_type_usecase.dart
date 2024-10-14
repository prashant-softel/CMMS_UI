import 'package:cmms/domain/models/grievance_type_model.dart';
import 'package:cmms/domain/models/resolution_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class ResolutionTypeListUsecase {
  ResolutionTypeListUsecase(this.repository);
  Repository repository;

  Future<List<ResolutionTypeModel?>?> getResolutionType({bool? isLoading}) async {
    return await repository.getResolutionType(isLoading: isLoading);
  }

}
