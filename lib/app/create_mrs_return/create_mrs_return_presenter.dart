import '../../domain/models/employe_stock_model.dart';
import '../../domain/usecases/create_mrs_return_usecase.dart';

class CreateMrsReturnPresenter {
  CreateMrsReturnPresenter(this.craetemrsReturnUsecase);
  CreateMrsReturnUsecase craetemrsReturnUsecase;
  Future<EmployeeStockListModel?> getCmmsItemList(
          {int? facilityId, bool? isLoading, int? userId}) async =>
      await craetemrsReturnUsecase.getCmmsItemList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          userId: userId);
  Future<Map<String, dynamic>?> createReturnMrs({
    createReturnMrsJsonString,
    required bool isLoading,
  }) async {
    return craetemrsReturnUsecase.createReturnMrs(
      createReturnMrsJsonString: createReturnMrsJsonString,
      isLoading: isLoading,
    );
  }

  void saveValue({String? whereUsedTypeId}) async {
    return craetemrsReturnUsecase.saveValue(whereUsedTypeId: whereUsedTypeId);
  }

  Future<String?> getValue() async => await craetemrsReturnUsecase.getValue();
  void saveactivityValue({String? activity}) async {
    return craetemrsReturnUsecase.saveactivityValue(activity: activity);
  }

  Future<String?> getactivityValue() async =>
      await craetemrsReturnUsecase.getactivityValue();
}
