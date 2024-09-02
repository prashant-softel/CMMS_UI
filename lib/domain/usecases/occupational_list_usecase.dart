import 'package:cmms/domain/models/get_occupational_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class OccupationalListUsecase {
  OccupationalListUsecase(this.repository);
  Repository repository;
         
  ///

 Future<List<GetOccupationalList>> getHealthDatalist({
    required bool isLoading,
    bool? isExport,

  }) async {
    return repository.getHealthDatalist(
      isLoading: isLoading,
      isExport: isExport,
    
    );
  }
  void clearValue() async => repository.clearData(LocalKeys.oHid);
  //deleteHealth
   Future<void> deleteHealth({
    int? Id,
    bool? isLoading,
  }) async =>
      await repository.deleteHealth(
        Id: Id,
        isLoading: isLoading,
      );

}
