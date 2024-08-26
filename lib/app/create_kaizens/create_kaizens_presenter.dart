// ignore: unused_import
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
  
}
