// ignore: unused_import
import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:cmms/domain/usecases/create_kaizens_usecase.dart';

class CreateKaizensdataPresenter {
  CreateKaizensdataPresenter(this.createkaizensdataUsecase);
  CreateKaizensdataUsecase createkaizensdataUsecase;

// CreateKaizensModel
  /// createkaizensdata
  Future<Map<String, dynamic>?> createkaizensdata(
      {createkaizensdata, required bool isLoading}) async {
    return createkaizensdataUsecase.createkaizensdata(
      createkaizensdata: createkaizensdata,
      isLoading: isLoading,
    );
  }
  //updateVisitAndNoticeDetails

  Future<Map<String, dynamic>?> updateKaizenDetails({
    updateKaizen,
    required bool isLoading,
  }) async {
    return createkaizensdataUsecase.updateKaizenDetails(
      updateKaizen: updateKaizen,
      isLoading: isLoading,
    );
  }


  void saveValue({String? kaizenId}) async {
    return createkaizensdataUsecase.saveValue(kaizenId: kaizenId);
  }

  Future<String?> getValue() async =>
      await createkaizensdataUsecase.getValue();

  void clearValue() async => createkaizensdataUsecase.clearValue();
}
