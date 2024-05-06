import '../../domain/models/get_asset_items_model.dart';
import '../../domain/models/mrs_detail_model.dart';
import '../../domain/usecases/edit_mrs_usecase.dart';

class EditMrsPresenter {
  EditMrsPresenter(this.editmrsUsecase);
  EditMrsUsecase editmrsUsecase;
  Future<List<GetAssetItemsModel?>?> getEquipmentList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await editmrsUsecase.getEquipmentList(
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );
  Future<Map<String, dynamic>?> editMrs({
    editMrsJsonString,
    required bool isLoading,
  }) async {
    return editmrsUsecase.editMrs(
      editMrsJsonString: editMrsJsonString,
      isLoading: isLoading,
    );
  }

  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    required int facilityId,
    bool? isLoading,
  }) async =>
      await editmrsUsecase.getMrsDetails(
        mrsId: mrsId,
        facilityId:facilityId,
        isLoading: isLoading,
      );
  void saveValue({String? mrsId}) async {
    return editmrsUsecase.saveValue(mrsId: mrsId);
  }
  void saveValuee({String? type}) async {
    return editmrsUsecase.saveValuee(type: type);
  }

  Future<String?> getValue() async => await editmrsUsecase.getValue();
  Future<String?> getValuee() async => await editmrsUsecase.getValuee();
}
