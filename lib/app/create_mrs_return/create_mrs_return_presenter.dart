import '../../domain/models/employe_stock_model.dart';
import '../../domain/usecases/create_mrs_return_usecase.dart';

class CreateMrsReturnPresenter {
  CreateMrsReturnPresenter(this.craetemrsReturnUsecase);
  CreateMrsReturnUsecase craetemrsReturnUsecase;
  Future<EmployeeStockListModel?> getCmmsItemList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await craetemrsReturnUsecase.getCmmsItemList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>?> createMrs({
    createMrsJsonString,
    required bool isLoading,
  }) async {
    return craetemrsReturnUsecase.createMrs(
      createMrsJsonString: createMrsJsonString,
      isLoading: isLoading,
    );
  }
}
