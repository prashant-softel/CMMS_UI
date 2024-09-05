import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateKaizensdataUsecase {
  CreateKaizensdataUsecase(this.repository);
  Repository repository;

  

Future<Map<String, dynamic>> createkaizensdata({
    createkaizensdata,
    bool? isLoading,
  }) async =>
      await repository.createkaizensdata(
        createkaizensdata,
        isLoading,
      );
  // update Api getVisitAndNoticelist

  Future<Map<String, dynamic>> updateKaizenDetails({
    updateKaizen,
    bool? isLoading,
  }) async =>
      await repository.updateKaizenDetails(
        updateKaizen,
        isLoading,
      );

  void saveValue({String? kaizenId}) async =>
      repository.saveValue(LocalKeys.kaizenId, kaizenId);
  Future<String?> getValue() async =>
      await repository.getStringValue(LocalKeys.kaizenId);

  void clearValue() async => repository.clearData(LocalKeys.kaizenId);
}
