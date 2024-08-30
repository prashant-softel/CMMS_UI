import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class KaizensDataListUsecase {
  KaizensDataListUsecase(this.repository);
  Repository repository;


  ///getKaizensConsumption

 Future<List<GetKaizensDataList>> getkaizensdata({
    required bool isLoading,
    bool? isExport,

  }) async {
    return repository.getkaizensdata(
      isLoading: isLoading,
      isExport: isExport,
    
    );
  }
  void clearValue() async => repository.clearData(LocalKeys.selectedItem);

}
