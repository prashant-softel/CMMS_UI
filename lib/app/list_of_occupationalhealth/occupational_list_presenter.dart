import 'package:cmms/domain/models/get_occupational_list_model.dart';
import 'package:cmms/domain/usecases/occupational_list_usecase.dart';

class OccupationalListPresenter {
  OccupationalListPresenter(this.occupationalListUsecase);

  final OccupationalListUsecase occupationalListUsecase;

  Future<List<GetOccupationalList>> getHealthDatalist({
    required bool isLoading,
    bool? isExport,
  }) async {
    return occupationalListUsecase.getHealthDatalist(
      isLoading: isLoading,
      isExport: isExport,
    );
  }
   void clearValue() async => occupationalListUsecase.clearValue();
   //deleteHealth
   deleteHealth({
    int? Id,
    bool? isLoading,
  }) async =>
      await occupationalListUsecase.deleteHealth(
        Id: Id,
        isLoading: isLoading,
      );
}
