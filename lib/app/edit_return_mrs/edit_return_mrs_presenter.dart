import 'package:cmms/domain/models/get_return_mrs_detail.dart';

import '../../domain/models/employe_stock_model.dart';
import '../../domain/usecases/edit_return_mrs_usecase.dart';

class EditMrsReturnPresenter {
  EditMrsReturnPresenter(this.editmrsReturnUsecase);
  EditMrsReturnUsecase editmrsReturnUsecase;
  Future<EmployeeStockListModel?> getCmmsItemList(
          {int? facilityId, bool? isLoading, int? userId}) async =>
      await editmrsReturnUsecase.getCmmsItemList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          userId: userId);
  Future<Map<String, dynamic>?> createReturnMrs({
    createReturnMrsJsonString,
    required bool isLoading,
  }) async {
    return editmrsReturnUsecase.createReturnMrs(
      createReturnMrsJsonString: createReturnMrsJsonString,
      isLoading: isLoading,
    );
  }

  Future<ReturnMrsDetailsModel?> getReturnMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await editmrsReturnUsecase.getReturnMrsDetails(
        mrsId: mrsId,
        facilityId:facilityId,
        isLoading: isLoading,
      );
}
