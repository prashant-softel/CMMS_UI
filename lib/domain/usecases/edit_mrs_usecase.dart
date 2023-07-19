import 'package:cmms/domain/models/get_asset_items_model.dart';
import 'package:cmms/domain/models/mrs_detail_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class EditMrsUsecase {
  EditMrsUsecase(this.repository);
  Repository repository;
  Future<List<GetAssetItemsModel?>?> getEquipmentList({
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getEquipmentAssetsList(
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> editMrs({
    editMrsJsonString,
    bool? isLoading,
  }) async =>
      await repository.createMrs(
        editMrsJsonString,
        isLoading,
      );
  Future<MrsDetailsModel?> getMrsDetails({
    int? mrsId,
    bool? isLoading,
  }) async =>
      await repository.getMrsDetails(
        mrsId,
        isLoading,
      );
}
