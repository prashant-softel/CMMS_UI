
import 'package:cmms/domain/models/get_plantation_list_model.dart';
import 'package:cmms/domain/usecases/plantation_list_usecase.dart';

class PlantationListPresenter {
  PlantationListPresenter(this.plantationlistUsecase);

  final PlantationListUsecase plantationlistUsecase;

  Future<List<GetPlantationList>> getplantationdata({
    required bool isLoading,
    bool? isExport,
  }) async {
    return plantationlistUsecase.getplantationdata(
      isLoading: isLoading,
      isExport: isExport,
    );
  }
   void clearValue() async => plantationlistUsecase.clearValue();
}
